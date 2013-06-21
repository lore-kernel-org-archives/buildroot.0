From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 21 Jun 2013 08:17:05 +0200
Subject: [Buildroot] [RFC] post-build scripts: limitations, and proposal
In-Reply-To: <20130620213628.GA3534@free.fr>
References: <20130620213628.GA3534@free.fr>
Message-ID: <CAAXf6LVO6Rz3RXLW++kOOfaHGRvR_4AB8Mi=VS2S-pKhJSm5Lw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Jun 20, 2013 at 11:36 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hello All!
>
> Currently, I'm using a set of post-build scripts, and it's becoming to
> be slightly tedious.
>
> For example, here are a few of them:
>
>   - rpi-fixup-rootfs
>     - adds /dev/mmcblk0p1 on /boot to fstab, don't mount _netdev filesystems
>     - set root's PS1
>     - store config's tree hash in /etc/rpi-config.version  [0]
>
>   - rpi-fixup-rootfs-yem
>     - stores my ssh pub key in root's ~/.ssh/authorized_keys
>
>   - rpi-fixup-rootfs-tvheadend
>     - add a script to wait for DVB devices
>     - add a CIFS mount to fstab, to access my NAS
>
>   - rpi-fixup-rootfs-wpa
>     - add my wpa-supplicant conf file to connect to my LAN
>
> So, when I build my tvheadend filesystem, I want to run scripts:
>     rpi-fixup-rootfs  rpi-fixup-rootfs-yem  rpi-fixup-rootfs-tvheadend
>
> But when I want to build my mpd filesystem, I want to run scripts:
>     rpi-fixup-rootfs  rpi-fixup-rootfs-yem rpi-fixup-rootfs-wpa
>
>
> Since the scripts lie out of the buildroot tree, I set (all on one line,
> but broken-out for readability):
>
>     BR2_ROOTFS_POST_BUILD_SCRIPT="
>         $(CONFIG_DIR)/../scripts/rpi-fixup-rootfs
>         $(CONFIG_DIR)/../scripts/rpi-fixup-rootfs-yem
>         $(CONFIG_DIR)/../scripts/rpi-fixup-rootfs-tvheadend"
>
> Now, I am adding a new script. This is starting to be ridiculous...

Just to be clear: what you find ridiculous is the length and
non-readability of this option, is that correct?

Besides the proposal you are making below, here is an alternate one
(I'm not saying it is superior, just thinking out loud): if we add an
extra option like
BR2_ROOTFS_POST_BUILD_SCRIPT_BASE="$(CONFIG_DIR)/../scripts/", then:
BR2_ROOTFS_POST_BUILD_SCRIPT="rpi-fixup-rootfs rpi-fixup-rootfs-yem
rpi-fixup-rootfs-tvheadend".
This already is much more readable.
The logic I'd use for this is: when parsing the
BR2_ROOTFS_POST_BUILD_SCRIPT, prepend
BR2_ROOTFS_POST_BUILD_SCRIPT_BASE to each item. BASE can be empty
(legacy) in which case the entries in the normal variable should be
the full path, as is currently the case.

>
> What I'd like is to be able to pass one or more options to each
> post-build script, so I can have a wrapper and tell it what to run:
>
>     BR2_ROOTFS_POST_BUILD_SCRIPT="
>         $(CONFIG_DIR)/../scripts/fixup-rootfs rpi ssh-key rpi-tvheadend"
>
> to call those scripts:
>     fixup-rootfs-rpi
>     fixup-rootfs-ssh-key
>     fixup-rootfs-rpi-tvheadend
>
> But it is not possible, as Buildroot interprets BR2_ROOTFS_POST_BUILD_SCRIPT
> as a space-separated list, not a single command. So, it is not possible
> to pass any option to the post-build scripts.
>
> So, I was going to change it from space-separated to colon-separated. But
> that would break existing configuration. Sigh... :-(
>
> I can see only one way to solve this: rename the variable (and add to
> legacy), and make it a colon-separated list.
>
> Opinions?

It does indeed solve your use case. I'm not really against it, but
there certainly are other possibilities. Above I gave one, here's
another:
Instead of passing multiple scripts, you could just pass one wrapper
post build script, without options. This wrapper would be different in
your different configurations, and would call all relevant scripts in
turn. Adding a script for a certain configuration now no longer means
updating the buildroot configuration, but instead updating the wrapper
script.
So for example you'd have:

fixup-rootfs-tvheadend:
#!/bin/sh
targetdir=$1
CONFIG_DIR=<to be hardcoded here, or imported from elsewhere>
$CONFIG_DIR/../scripts/rpi-fixup-rootfs $targetdir
$CONFIG_DIR/../scripts/rpi-fixup-rootfs-yem $targetdir
$CONFIG_DIR/../scripts/rpi-fixup-rootfs-tvheadend $targetdir

fixup-rootfs-mpd:
#!/bin/sh
targetdir=$1
CONFIG_DIR=<to be hardcoded here, or imported from elsewhere>
$CONFIG_DIR/../scripts/rpi-fixup-rootfs $targetdir
$CONFIG_DIR/../scripts/rpi-fixup-rootfs-yem $targetdir
$CONFIG_DIR/../scripts/rpi-fixup-rootfs-wpa $targetdir

With this alternative, there is no need to change anything in
buildroot itself, there is just a change in your workflow.

Again, I'm not saying this is superior, just opening up the discussion...

Best regards,
Thomas
