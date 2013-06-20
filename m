From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Jun 2013 23:36:28 +0200
Subject: [Buildroot] [RFC] post-build scripts: limitations, and proposal
Message-ID: <20130620213628.GA3534@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, I'm using a set of post-build scripts, and it's becoming to
be slightly tedious.

For example, here are a few of them:

  - rpi-fixup-rootfs
    - adds /dev/mmcblk0p1 on /boot to fstab, don't mount _netdev filesystems
    - set root's PS1
    - store config's tree hash in /etc/rpi-config.version  [0]

  - rpi-fixup-rootfs-yem
    - stores my ssh pub key in root's ~/.ssh/authorized_keys

  - rpi-fixup-rootfs-tvheadend
    - add a script to wait for DVB devices
    - add a CIFS mount to fstab, to access my NAS

  - rpi-fixup-rootfs-wpa
    - add my wpa-supplicant conf file to connect to my LAN

So, when I build my tvheadend filesystem, I want to run scripts:
    rpi-fixup-rootfs  rpi-fixup-rootfs-yem  rpi-fixup-rootfs-tvheadend

But when I want to build my mpd filesystem, I want to run scripts:
    rpi-fixup-rootfs  rpi-fixup-rootfs-yem rpi-fixup-rootfs-wpa


Since the scripts lie out of the buildroot tree, I set (all on one line,
but broken-out for readability):

    BR2_ROOTFS_POST_BUILD_SCRIPT="
        $(CONFIG_DIR)/../scripts/rpi-fixup-rootfs
        $(CONFIG_DIR)/../scripts/rpi-fixup-rootfs-yem
        $(CONFIG_DIR)/../scripts/rpi-fixup-rootfs-tvheadend"

Now, I am adding a new script. This is starting to be ridiculous...

What I'd like is to be able to pass one or more options to each
post-build script, so I can have a wrapper and tell it what to run:

    BR2_ROOTFS_POST_BUILD_SCRIPT="
        $(CONFIG_DIR)/../scripts/fixup-rootfs rpi ssh-key rpi-tvheadend"

to call those scripts:
    fixup-rootfs-rpi
    fixup-rootfs-ssh-key
    fixup-rootfs-rpi-tvheadend

But it is not possible, as Buildroot interprets BR2_ROOTFS_POST_BUILD_SCRIPT
as a space-separated list, not a single command. So, it is not possible
to pass any option to the post-build scripts.

So, I was going to change it from space-separated to colon-separated. But
that would break existing configuration. Sigh... :-(

I can see only one way to solve this: rename the variable (and add to
legacy), and make it a colon-separated list.

Opinions?

[0] My config files (and scripts...) are stored in a git tree, so I want
    to know which to rebuild only by looking at a file on a running board.
    Having only the Buildroot tree hash is not enough.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
