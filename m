From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Jan 2013 21:19:09 +0100
Subject: [Buildroot] [PATCH 1/1] Documentation update : add tips to
 build manual,
 add information about buildroot toolchain not being relocable and put some
 hints to use it,
 move the Beyond Buildroot section before FAQs and add content
In-Reply-To: <CAKvQZ_3BSLWFbiRc3L6uYnVwt1QQNq5Q6Y0DR5nAKrGP_XLoHQ@mail.gmail.com>
References: <CAKvQZ_3BSLWFbiRc3L6uYnVwt1QQNq5Q6Y0DR5nAKrGP_XLoHQ@mail.gmail.com>
Message-ID: <CAHXCMM+wBdSZzipkHq3d5WDH=BF8ZVfAwvvbd8v0ZrfLXWVH8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Willy, all,

Thanks for your work.

First, few comments to make easier the review/integration process:
* do one commit per feature (from the subject, i would have splited it
in 3 commits);
* wrap the code/doc/commit message at +/- 80 characters (keep the code
style consistent per file);
* use git send-email to avoid your email client messes up your patch
with line wrapping,
  which prevent from applying the patch without manual fixup
  (see: http://buildroot.org/downloads/manual/manual.html#submitting-patches
  and/or http://elinux.org/Buildroot_how_to_contribute);
* the commit message should be formatted like this (with line length:
+/- 80 characters):
[snip]
Summary of the feature (1 line)

As much details as you want to add to explain your work.

More details in another paragraph...

Signed-off-by: John Doe <john.doe@nomane.org>
---

Changelog of the revisions of the patch set

And/or any comments you don't want to be part of the commit message.
When applying the patch, git will automatically skip this part (from
the line "---").
[/snip]


Well, now, comments inline:

2013/1/23 Willy Lambert <lambert.willy@gmail.com>:
> Here is some documentation modification as promised a month ago. I
> send this email by hand, I hode it'll be ok, be sure I did my best to
> try my git initiation ^ ^.
We've all started some day with git ;-)

>
> Please carrefully review this as I'm quite new with buildroot and
> english is not my native language.
>
>
> Signed-off-by: A.R.D. <contact@team-ard.com>
Is it intended that it is an organization email?

> ---
>  docs/manual/beyond-buildroot.txt    |   83 ++++++++++++++++++++++++++++++-----
>  docs/manual/customize-toolchain.txt |   45 ++++++++++++++++---
>  docs/manual/make-tips.txt           |   12 +++++
>  docs/manual/manual.txt              |    4 +-
>  4 files changed, 125 insertions(+), 19 deletions(-)
>
> diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
> index a87b584..d9bdd32 100644
> --- a/docs/manual/beyond-buildroot.txt
> +++ b/docs/manual/beyond-buildroot.txt
> @@ -3,17 +3,77 @@
>  Beyond Buildroot
>  ================
>
> -Boot the generated images
> --------------------------
> +After having run Buildroot, you will have a brand new filesystem for
> your target exported in buildroot/output/images.
I'm a bit dubious about the necessity of repeating this; the output
directory content
is already detailled in the section "2.3. Using Buildroot".
Also, the images won't be in this location if you build out of the
Buildroot tree
(i.e. if you run: make O=/somewhere/else).

> The content of this
> folder depends of the option you choosed during buildroot
> configuration in the "Filesystem images" section.
I would rephrase the this sentence like this:
The content of this directory depends on the selected options in the Buildroot
configuration, especially those from the "Filesystem images" sub-menu.

>
> -NFS boot
> -~~~~~~~~
> +So what's next ? You will probably want to :
>
> -To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
> -images_ menu.
> +* generate a virtual disk to dump to real system or to use in
> virtualisation systems (http://wiki.qemu.org/Main_Page[Qemu],
s/virtualisation/virtualization/
Also, i'm not sure of how to express this...

> https://www.virtualbox.org/[VirtualBox],...)
> +
> +* test your kernel and your rootfs in virtualisation systems
s/virtualisation/virtualization/

> +
> +* install your rootfs on the target to test it
> +
> +This stuff is really depending on each project and hardware, so we
> cannot describe every solution here, and this is where Buildroot's
s/solution/solutions/

> work ends. The following section aims at guiding new user on what to
> do next to avoid staying in the dark. It is *not* an exact guide on
> how to precisely do what is described. Please take the time to have a
> look to refered projets to get those details.
s/refered projets/referred projects/

> +
> +Generate a bootable raw disk file
> +---------------------------------
> +
> +If you plan to use virtual machines, or to copy a binary bootable
> image to your target, you will need to create a "virtual disk". To
s/"virtual disk"/_disk image_/

> create a bootable raw disk file you will need to :
Well, here a point is missing: Buildroot comes with some defaults configuration
bootable out-of-box in qemu (see the readme.txt files in the
board/qemu/* directories).

> +
> +* create an empty file with "dd"
> +
> +* partition the file as a disk with "fdisk"
Be careful, when mentioning such a tool.
Mis-usage can damage the user's system; at least, refer its documentation.

> +
> +* set the MBR
> +
> +* create virtual devices in /dev pointing to your virtual disk
s/virtual devices/nodes/
s/virtual disk/_disk image_/

> partitions (as you will have with /dev/sda, /dev/sda1, /dev/sda2,...)
> with http://robert.penz.name/73/kpartx-a-tool-for-mounting-partitions-within-an-image-file/[kpartx]
> +
> +* mount one (or several) partition of your virtual disk with "mount"
s/with "mount"/with the +mount+ command/

> +
> +* extract your rootfs, boot folder,home directory, ... into them.
s/folder,home/folder, home/
s/home directory, ... into them./home directory and any other content
into them./

Note that if you select the ext2 filesystem generation, you could also
directly dump ths ext2 image
into the right partition itself.

> +
> +Network boot
> +-------------
> +
> +Some device doesn't have external memory and need to be booted to be
> able to install the rootfs. A nice way of doing this is to boot from
> the network. If your device allows you to do that you will be able to
> :
> +
> +* test the in-progress-rootfs without installing it on your system
> (it prevents ruining flash memories)
> +
> +* create a second buildroot project with a minimalist installer that
s/buildroot/Buildroot/

> will install your production rootfs on the target.
> +
> +
> +Network bootloaders (PXE,iPXE)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
s/Network bootloaders (PXE,iPXE)/Network PXE bootloaders/

afaik, PXE is the standard name, whereas iPXE is an implementation.

> +
> +To fully boot on the network you need a network bootloader. This is
> optionnal and you could use your classic bootloader to mount a NFS
s/optionnal/optional/

> rootfs.
> +
> +http://download.intel.com/design/archives/wfm/downloads/pxespec.pdf[PXE]
> is a specification that has been implemented at least by
> http://www.syslinux.org/wiki/index.php/PXELINUX[PXELINUX] and
> http://ipxe.org/[iPXE].
> +
> +The main idea is to have a DHCP server that provide a link to a
> generic boot ROM that is accessible from a simple FTP server (TFTP).
s/(TFTP)/(e.g.: TFTP)/

> Then your target boots with it and come back to the TFTP server to get
s/TFTP server/FTP server/

> the specific stuff (for instance it's boot menu).
> +
> +Here is some hints on how to setup this :
> +http://www.digitalpeer.com/id/linuxnfs
> +
> +
> +NFS rootfs mount on "/"
s@"/"@+/+@

> +~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The idea is to mount "/" with a network shared folder from a
s@"/"@+/+@

> http://tldp.org/HOWTO/NFS-HOWTO/index.html[NFS] server (in general
> your dev host). To enable the NFS-boot, you shall activate the _tar
s/dev host/develop host system/
s/shall activate/should enable/

> root filesystem_ option in the _Filesystem images_ menu.
> +
> +Your embedded kernel need at least the following option :
s/need/needs/
s/option :/options:/

> +
> +* NFS filesystem support (CONFIG_NFS_FS).
s/(CONFIG_NFS_FS)./(+CONFIG_NFS_FS+);/

> +
> +* Root file system on NFS (CONFIG_ROOT_NFS).
s/(CONFIG_ROOT_NFS)./(+CONFIG_ROOT_NFS+);/

> +
> +* Ethernet (CONFIG_NET_ETHERNET).
s/(CONFIG_NET_ETHERNET)./(+CONFIG_NET_ETHERNET+);/

> +
> +* The ethernet driver for the embedded network card.
> +
> +* IP: kernel level autoconfiguration (CONFIG_IP_PNP,
s/(CONFIG_IP_PNP,/(+CONFIG_IP_PNP+,/

> CONFIG_IP_PNP_BOOTTP, CONFIG_IP_PNP_DHCP).
s/CONFIG_IP_PNP_BOOTTP, CONFIG_IP_PNP_DHCP)./+CONFIG_IP_PNP_BOOTTP+,
+CONFIG_IP_PNP_DHCP+)./

>
>  After a complete build, just run the following commands to setup the
> -NFS-root directory:
> +NFS-root directory of the server :
>
>  -------------------
>  sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
> @@ -21,10 +81,13 @@ sudo tar -xavf /path/to/output_dir/rootfs.tar -C
> /path/to/nfs_root_dir
>
>  Remember to add this path to +/etc/exports+.
IIRC, "exportfs -ra" should also be run after modifying /etc/exports,
or the nfs server should be restarted.

>
> -Then, you can execute a NFS-boot from your target.
> +Then, you can execute a NFS-boot from your target. Here is a
> documentation hints :
> +
> +
> +
ahem... missing links ;)

>
> -Chroot
> -------
> +Chroot into generated image
> +---------------------------
>
>  If you want to chroot in a generated image, then there are few thing
>  you should be aware of:
> diff --git a/docs/manual/customize-toolchain.txt
> b/docs/manual/customize-toolchain.txt
> index 2b24412..1f146ad 100644
> --- a/docs/manual/customize-toolchain.txt
> +++ b/docs/manual/customize-toolchain.txt
> @@ -16,6 +16,18 @@ generate it.
>  It also requires to set the Buildroot settings according to the toolchain ones
>  (see xref:external-toolchain[]).
>
> +Using the Crosstool-NG backend
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
> +limited set of settings under the Buildroot +Toolchain+ menu:
> +
> +* The http://crosstool-ng.org[crosstool-NG] configuration file
> +
> +* Gdb and some toolchain options
> +
> +Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
> +
>  Using the internal Buildroot toolchain backend
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> @@ -33,14 +45,33 @@ However, it allows to tune major settings, such as:
>  These settings are available after selecting the +Buildroot toolchain+ type in
>  the menu +Toolchain+.
>
> -Using the Crosstool-NG backend
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> -The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
> -limited set of settings under the Buildroot +Toolchain+ menu:
> +The common use case is to have a buildroot setup where you disable
> everything from the following menus:
>
> -* The http://crosstool-ng.org[crosstool-NG] configuration file
> +* System configuration
>
> -* Gdb and some toolchain options
> +* Package Selection for the target
> +
> +* Filesystem images
> +
> +* Bootloaders
> +
> +* Kernel
> +
> +And build this out of sources with :
> +---------------------------------------
> + $ make menuconfig O=/path/to/somewhere
> +---------------------------------------
> +
> +Then configure your working configuration with :
> +
> +* Toolchain type (External toolchain)
> +
> +* Toolchain (Custom toolchain)
> +
> +* Toolchain origin (Pre-installed toolchain)
> +
> +* (/path/to/somewhere/host/usr) Toolchain path
> +
> +Note that builroot toolchains are *not* relocable, so if you plan to
> share it with other machines, you will *have to* install it in the
> same position ("/path/to/somewhere")

I wonder where is the best place for this tip, here or in the faq as
part of the answer to "Are Buildroot toolchains relocatable?" or
"How can avoid to rebuild the toolchain after each +make clean+?" ...

BTW, a target 'toolchain' as recently been added (in the make help too),
which only build the toolchain, without requiring to disable all the
stuff above.

>
> -Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index 8cd77c0..80574bd 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -53,6 +53,18 @@ and target trees, the images and the toolchain):
>   $ make clean
>  --------------------
>
> +
> +The present manual sources are in the buildroot/docs/manual folder.
> You may compile them with :
> +
> +---------------------------------
> + $ make manual-clean
> + $ make manual
> +---------------------------------
> +
> +The output documentation is provided in the
> buildroot/output/docs/manual folder.
> +
> +*Note* : asciidoc is required to build it.
This is already mentioned in the "System requirement" section, as
optional package.

> There is a known issue
> that you can't build it under Dedian Squeeze.
I would really like you add an entry in the faq/troubleshooting section,
with the command and the error message, so that anyone can easily know
if he/she is in this case or not.

Off topic:
I hope it will be possible to publish a daily built manual online...
@Peter: do you think it could be possible? certainly something to talk
about during the next BR dev. days ;-)

> +
>  To delete all build products as well as the configuration:
>
>  --------------------
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index c34e0ca..2f49674 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -17,6 +17,8 @@ include::starting-up.txt[]
>
>  include::working-with.txt[]
>
> +include::beyond-buildroot.txt[]
> +
>  include::faq-troubleshooting.txt[]
>
>  include::going-further.txt[]
> @@ -25,8 +27,6 @@ include::developer-guide.txt[]
>
>  include::legal-notice.txt[]
>
> -include::beyond-buildroot.txt[]
> -
I'm not really convinced by moving this section up in the first half
of the manual.
IMHO, since it is out of the Buildroot scope, its sensible place is here.
However, I agree cross-refs toward this section could be added at the
end of the section "3. Working with Buildroot"

>  include::get-involved.txt[]
>
>  include::contribute.txt[]

Well, it may seem a lot, but keep going!

Regards,

-- 
Samuel
