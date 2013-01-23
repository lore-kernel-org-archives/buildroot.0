From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 23 Jan 2013 14:16:50 +0100
Subject: [Buildroot] [PATCH 1/1] Documentation update : add tips to build
 manual,
 add information about buildroot toolchain not being relocable and put some
 hints to use it,
 move the Beyond Buildroot section before FAQs and add content
Message-ID: <CAKvQZ_3BSLWFbiRc3L6uYnVwt1QQNq5Q6Y0DR5nAKrGP_XLoHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is some documentation modification as promised a month ago. I
send this email by hand, I hode it'll be ok, be sure I did my best to
try my git initiation ^ ^.

Please carrefully review this as I'm quite new with buildroot and
english is not my native language.


Signed-off-by: A.R.D. <contact@team-ard.com>
---
 docs/manual/beyond-buildroot.txt    |   83 ++++++++++++++++++++++++++++++-----
 docs/manual/customize-toolchain.txt |   45 ++++++++++++++++---
 docs/manual/make-tips.txt           |   12 +++++
 docs/manual/manual.txt              |    4 +-
 4 files changed, 125 insertions(+), 19 deletions(-)

diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index a87b584..d9bdd32 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -3,17 +3,77 @@
 Beyond Buildroot
 ================

-Boot the generated images
--------------------------
+After having run Buildroot, you will have a brand new filesystem for
your target exported in buildroot/output/images. The content of this
folder depends of the option you choosed during buildroot
configuration in the "Filesystem images" section.

-NFS boot
-~~~~~~~~
+So what's next ? You will probably want to :

-To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
-images_ menu.
+* generate a virtual disk to dump to real system or to use in
virtualisation systems (http://wiki.qemu.org/Main_Page[Qemu],
https://www.virtualbox.org/[VirtualBox],...)
+
+* test your kernel and your rootfs in virtualisation systems
+
+* install your rootfs on the target to test it
+
+This stuff is really depending on each project and hardware, so we
cannot describe every solution here, and this is where Buildroot's
work ends. The following section aims at guiding new user on what to
do next to avoid staying in the dark. It is *not* an exact guide on
how to precisely do what is described. Please take the time to have a
look to refered projets to get those details.
+
+Generate a bootable raw disk file
+---------------------------------
+
+If you plan to use virtual machines, or to copy a binary bootable
image to your target, you will need to create a "virtual disk". To
create a bootable raw disk file you will need to :
+
+* create an empty file with "dd"
+
+* partition the file as a disk with "fdisk"
+
+* set the MBR
+
+* create virtual devices in /dev pointing to your virtual disk
partitions (as you will have with /dev/sda, /dev/sda1, /dev/sda2,...)
with http://robert.penz.name/73/kpartx-a-tool-for-mounting-partitions-within-an-image-file/[kpartx]
+
+* mount one (or several) partition of your virtual disk with "mount"
+
+* extract your rootfs, boot folder,home directory, ... into them.
+
+Network boot
+-------------
+
+Some device doesn't have external memory and need to be booted to be
able to install the rootfs. A nice way of doing this is to boot from
the network. If your device allows you to do that you will be able to
:
+
+* test the in-progress-rootfs without installing it on your system
(it prevents ruining flash memories)
+
+* create a second buildroot project with a minimalist installer that
will install your production rootfs on the target.
+
+
+Network bootloaders (PXE,iPXE)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+To fully boot on the network you need a network bootloader. This is
optionnal and you could use your classic bootloader to mount a NFS
rootfs.
+
+http://download.intel.com/design/archives/wfm/downloads/pxespec.pdf[PXE]
is a specification that has been implemented at least by
http://www.syslinux.org/wiki/index.php/PXELINUX[PXELINUX] and
http://ipxe.org/[iPXE].
+
+The main idea is to have a DHCP server that provide a link to a
generic boot ROM that is accessible from a simple FTP server (TFTP).
Then your target boots with it and come back to the TFTP server to get
the specific stuff (for instance it's boot menu).
+
+Here is some hints on how to setup this :
+http://www.digitalpeer.com/id/linuxnfs
+
+
+NFS rootfs mount on "/"
+~~~~~~~~~~~~~~~~~~~~~~~
+
+The idea is to mount "/" with a network shared folder from a
http://tldp.org/HOWTO/NFS-HOWTO/index.html[NFS] server (in general
your dev host). To enable the NFS-boot, you shall activate the _tar
root filesystem_ option in the _Filesystem images_ menu.
+
+Your embedded kernel need at least the following option :
+
+* NFS filesystem support (CONFIG_NFS_FS).
+
+* Root file system on NFS (CONFIG_ROOT_NFS).
+
+* Ethernet (CONFIG_NET_ETHERNET).
+
+* The ethernet driver for the embedded network card.
+
+* IP: kernel level autoconfiguration (CONFIG_IP_PNP,
CONFIG_IP_PNP_BOOTTP, CONFIG_IP_PNP_DHCP).

 After a complete build, just run the following commands to setup the
-NFS-root directory:
+NFS-root directory of the server :

 -------------------
 sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
@@ -21,10 +81,13 @@ sudo tar -xavf /path/to/output_dir/rootfs.tar -C
/path/to/nfs_root_dir

 Remember to add this path to +/etc/exports+.

-Then, you can execute a NFS-boot from your target.
+Then, you can execute a NFS-boot from your target. Here is a
documentation hints :
+
+
+

-Chroot
-------
+Chroot into generated image
+---------------------------

 If you want to chroot in a generated image, then there are few thing
 you should be aware of:
diff --git a/docs/manual/customize-toolchain.txt
b/docs/manual/customize-toolchain.txt
index 2b24412..1f146ad 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -16,6 +16,18 @@ generate it.
 It also requires to set the Buildroot settings according to the toolchain ones
 (see xref:external-toolchain[]).

+Using the Crosstool-NG backend
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
+limited set of settings under the Buildroot +Toolchain+ menu:
+
+* The http://crosstool-ng.org[crosstool-NG] configuration file
+
+* Gdb and some toolchain options
+
+Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
+
 Using the internal Buildroot toolchain backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

@@ -33,14 +45,33 @@ However, it allows to tune major settings, such as:
 These settings are available after selecting the +Buildroot toolchain+ type in
 the menu +Toolchain+.

-Using the Crosstool-NG backend
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
-limited set of settings under the Buildroot +Toolchain+ menu:
+The common use case is to have a buildroot setup where you disable
everything from the following menus:

-* The http://crosstool-ng.org[crosstool-NG] configuration file
+* System configuration

-* Gdb and some toolchain options
+* Package Selection for the target
+
+* Filesystem images
+
+* Bootloaders
+
+* Kernel
+
+And build this out of sources with :
+---------------------------------------
+ $ make menuconfig O=/path/to/somewhere
+---------------------------------------
+
+Then configure your working configuration with :
+
+* Toolchain type (External toolchain)
+
+* Toolchain (Custom toolchain)
+
+* Toolchain origin (Pre-installed toolchain)
+
+* (/path/to/somewhere/host/usr) Toolchain path
+
+Note that builroot toolchains are *not* relocable, so if you plan to
share it with other machines, you will *have to* install it in the
same position ("/path/to/somewhere")

-Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 8cd77c0..80574bd 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -53,6 +53,18 @@ and target trees, the images and the toolchain):
  $ make clean
 --------------------

+
+The present manual sources are in the buildroot/docs/manual folder.
You may compile them with :
+
+---------------------------------
+ $ make manual-clean
+ $ make manual
+---------------------------------
+
+The output documentation is provided in the
buildroot/output/docs/manual folder.
+
+*Note* : asciidoc is required to build it. There is a known issue
that you can't build it under Dedian Squeeze.
+
 To delete all build products as well as the configuration:

 --------------------
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index c34e0ca..2f49674 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -17,6 +17,8 @@ include::starting-up.txt[]

 include::working-with.txt[]

+include::beyond-buildroot.txt[]
+
 include::faq-troubleshooting.txt[]

 include::going-further.txt[]
@@ -25,8 +27,6 @@ include::developer-guide.txt[]

 include::legal-notice.txt[]

-include::beyond-buildroot.txt[]
-
 include::get-involved.txt[]

 include::contribute.txt[]
-- 
1.7.9.5
