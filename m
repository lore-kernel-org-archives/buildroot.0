From: Willy Lambert <lambert.willy@gmail.com>
Date: Tue,  5 Feb 2013 21:51:30 +0100
Subject: [Buildroot] [PATCH 2/3] Integrating review modifications
In-Reply-To: <1360097491-20121-1-git-send-email-contact@team-ard.com>
References: <1360097491-20121-1-git-send-email-contact@team-ard.com>
Message-ID: <1360097491-20121-2-git-send-email-contact@team-ard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "A.R.D" <contact@team-ard.com>


Signed-off-by: A.R.D <contact@team-ard.com>
---
 docs/manual/beyond-buildroot.txt |   49 ++++++++++++++++++++------------------
 docs/manual/manual.txt           |    4 ++--
 docs/manual/working-with.txt     |    2 ++
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index d9bdd32..970ab9a 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -3,34 +3,37 @@
 Beyond Buildroot
 ================
 
-After having run Buildroot, you will have a brand new filesystem for your target exported in buildroot/output/images. The content of this folder depends of the option you choosed during buildroot configuration in the "Filesystem images" section. 
+After having run Buildroot, you will have a brand new filesystem for your target in the images folder as described un xref:using[]. The content of this directory depends on the selected options in the Buildroot
+configuration, especially those from the "Filesystem images" sub-menu. 
 
 So what's next ? You will probably want to :
 
-* generate a virtual disk to dump to real system or to use in virtualisation systems (http://wiki.qemu.org/Main_Page[Qemu], https://www.virtualbox.org/[VirtualBox],...)
+* generate a virtual disk to dump to real system or to use in virtualization systems (http://wiki.qemu.org/Main_Page[Qemu], https://www.virtualbox.org/[VirtualBox],...)
 
-* test your kernel and your rootfs in virtualisation systems
+* test your kernel and your rootfs in virtualization systems
 
 * install your rootfs on the target to test it
 
-This stuff is really depending on each project and hardware, so we cannot describe every solution here, and this is where Buildroot's work ends. The following section aims at guiding new user on what to do next to avoid staying in the dark. It is *not* an exact guide on how to precisely do what is described. Please take the time to have a look to refered projets to get those details.
+This stuff is really depending on each project and hardware, so we cannot describe every solutions here, and this is where Buildroot's work ends. The following section aims at guiding new user on what to do next to avoid staying in the dark. It is *not* an exact guide on how to precisely do what is described. Please take the time to have a look to referred projects to get those details.
 
 Generate a bootable raw disk file
 ---------------------------------
 
-If you plan to use virtual machines, or to copy a binary bootable image to your target, you will need to create a "virtual disk". To create a bootable raw disk file you will need to :
+If you plan to use virtual machines, or to copy a binary bootable image to your target, you will need to create a _disk image_. To create a bootable raw disk file you will need to :
 
-* create an empty file with "dd"
+(be carefull with the following commands, you can severely damage your host)
 
-* partition the file as a disk with "fdisk"
+* create an empty file with "dd" 
+
+* partition the file as a disk with "fdisk" 
 
 * set the MBR
 
-* create virtual devices in /dev pointing to your virtual disk partitions (as you will have with /dev/sda, /dev/sda1, /dev/sda2,...) with http://robert.penz.name/73/kpartx-a-tool-for-mounting-partitions-within-an-image-file/[kpartx] 
+* create nodes in /dev pointing to your _disk image_ partitions (as you will have with /dev/sda, /dev/sda1, /dev/sda2,...) with http://robert.penz.name/73/kpartx-a-tool-for-mounting-partitions-within-an-image-file/[kpartx] 
 
-* mount one (or several) partition of your virtual disk with "mount" 
+* mount one (or several) partition of your virtual disk with with the +mount+ command 
 
-* extract your rootfs, boot folder,home directory, ... into them. 
+* extract your rootfs, boot folder, home directory and any other content into them. Note that if you select the ext2 filesystem generation, you can also directly dump ths ext2 image into the right partition itself.
 
 Network boot
 -------------
@@ -39,38 +42,38 @@ Some device doesn't have external memory and need to be booted to be able to ins
 
 * test the in-progress-rootfs without installing it on your system (it prevents ruining flash memories)
 
-* create a second buildroot project with a minimalist installer that will install your production rootfs on the target.
+* create a second Buildroot project with a minimalist installer that will install your production rootfs on the target.
 
 
-Network bootloaders (PXE,iPXE)
+Network PXE bootloaders
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-To fully boot on the network you need a network bootloader. This is optionnal and you could use your classic bootloader to mount a NFS rootfs.
+To fully boot on the network you need a network bootloader. This is optional and you could use your classic bootloader to mount a NFS rootfs.
 
 http://download.intel.com/design/archives/wfm/downloads/pxespec.pdf[PXE] is a specification that has been implemented at least by http://www.syslinux.org/wiki/index.php/PXELINUX[PXELINUX] and http://ipxe.org/[iPXE].
 
-The main idea is to have a DHCP server that provide a link to a generic boot ROM that is accessible from a simple FTP server (TFTP). Then your target boots with it and come back to the TFTP server to get the specific stuff (for instance it's boot menu).
+The main idea is to have a DHCP server that provide a link to a generic boot ROM that is accessible from a simple FTP server (e.g.: TFTP). Then your target boots with it and come back to the FTP server to get the specific stuff (for instance it's boot menu).
 
 Here is some hints on how to setup this :
 http://www.digitalpeer.com/id/linuxnfs
 
 
-NFS rootfs mount on "/"
+NFS rootfs mount on+"/+
 ~~~~~~~~~~~~~~~~~~~~~~~
 
-The idea is to mount "/" with a network shared folder from a http://tldp.org/HOWTO/NFS-HOWTO/index.html[NFS] server (in general your dev host). To enable the NFS-boot, you shall activate the _tar root filesystem_ option in the _Filesystem images_ menu.
+The idea is to mount +/+ with a network shared folder from a http://tldp.org/HOWTO/NFS-HOWTO/index.html[NFS] server (in general your develop host system). To enable the NFS-boot, you should enable the _tar root filesystem_ option in the _Filesystem images_ menu.
 
-Your embedded kernel need at least the following option :
+Your embedded kernel needs at least the following options :
 
-* NFS filesystem support (CONFIG_NFS_FS).
+* NFS filesystem support (+CONFIG_NFS_FS+).
 
-* Root file system on NFS (CONFIG_ROOT_NFS).
+* Root file system on NFS (+CONFIG_ROOT_NFS+).
 
-* Ethernet (CONFIG_NET_ETHERNET).
+* Ethernet (+CONFIG_NET_ETHERNET+).
 
 * The ethernet driver for the embedded network card.
 
-* IP: kernel level autoconfiguration (CONFIG_IP_PNP, CONFIG_IP_PNP_BOOTTP, CONFIG_IP_PNP_DHCP).
+* IP: kernel level autoconfiguration (+CONFIG_IP_PNP+, +CONFIG_IP_PNP_BOOTTP+, +CONFIG_IP_PNP_DHCP+).
 
 After a complete build, just run the following commands to setup the
 NFS-root directory of the server :
@@ -79,9 +82,9 @@ NFS-root directory of the server :
 sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
 -------------------
 
-Remember to add this path to +/etc/exports+.
+Remember to add this path to +/etc/exports+ and run +exportfs -ra+ to take changes into account.
 
-Then, you can execute a NFS-boot from your target. Here is a documentation hints :
+Then, you can execute a NFS-boot from your target.
 
 
 
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 2f49674..c34e0ca 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -17,8 +17,6 @@ include::starting-up.txt[]
 
 include::working-with.txt[]
 
-include::beyond-buildroot.txt[]
-
 include::faq-troubleshooting.txt[]
 
 include::going-further.txt[]
@@ -27,6 +25,8 @@ include::developer-guide.txt[]
 
 include::legal-notice.txt[]
 
+include::beyond-buildroot.txt[]
+
 include::get-involved.txt[]
 
 include::contribute.txt[]
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index fb6bc40..b9836bd 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -16,6 +16,8 @@ include::common-usage.txt[]
 
 include::eclipse-integration.txt[]
 
+include::what-is-next.txt[]
+
 Hacking Buildroot
 -----------------
 
-- 
1.7.9.5
