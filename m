From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 10 Dec 2010 23:43:50 +0100
Subject: [Buildroot] buildroot Digest, Vol 54, Issue 80
In-Reply-To: <mailman.1020.1292018149.23999.buildroot@busybox.net>
Message-ID: <BD524A5891E646409A7346BFD33F6069@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Zie nr 3 en de oplossing 

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net]
Namens buildroot-request at busybox.net
Verzonden: vrijdag 10 december 2010 22:56
Aan: buildroot at busybox.net
Onderwerp: buildroot Digest, Vol 54, Issue 80

Send buildroot mailing list submissions to
	buildroot at busybox.net

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.busybox.net/mailman/listinfo/buildroot
or, via email, send a message with subject or body 'help' to
	buildroot-request at busybox.net

You can reach the person managing the list at
	buildroot-owner at busybox.net

When replying, please edit your Subject line so it is more specific than
"Re: Contents of buildroot digest..."


Today's Topics:

   1. Re: [PATCH 2/2] iproute2: Fix auto configuration to work in
      cross environment. (Mike Frysinger)
   2. Problem with libcgi : build links to glib2 instead of	uclibc
      ? (Sagaert Johan)
   3. Re: Problem with libcgi : build links to glib2 instead of
      uclibc ? (Lionel Landwerlin)
   4. [PATCH v2] add acl and attr support for extended	attributes
      and POSIX Access Control Lists (heiko at zuerker.org)
   5. [PATCH v3] Improved initramfs and iso target support
      (heiko at zuerker.org)


----------------------------------------------------------------------

Message: 1
Date: Fri, 10 Dec 2010 13:30:53 -0500
From: Mike Frysinger <vapier@gentoo.org>
To: Pkun <serj.kalichev@gmail.com>
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] [PATCH 2/2] iproute2: Fix auto configuration
	to work in cross environment.
Message-ID:
	<AANLkTi=EB44yGcBcLYt7_D-Pfq4hR-=hERh+qBG5i9Sm@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 10, 2010 at 1:29 PM, Pkun wrote:
> 2010/12/10 Mike Frysinger:
>> On Fri, Dec 10, 2010 at 12:46 PM, Pkun wrote:
>>> 2010/12/10 Mike Frysinger
>>>> On Fri, Dec 10, 2010 at 8:45 AM, Serj Kalichev wrote:
>>>> > The iproute2's configure script was fixed to work with cross 
>>>> > toolchain. Now it can use tools from cross toolchain but not from 
>>>> > the host. So it can automatically generate right Config file. The 
>>>> > checks for the IPv6 support and Berkeley DB availability were 
>>>> > added to the configure script. The Berkeley DB support is needed 
>>>> > to build (or not) arpd.
>>>>
>>>> this is way more work than necessary. ?the iproute2 configure 
>>>> script does all of two things:
>>>> ?- detect atm support
>>>> ?- detect iptables version
>>>>
>>>> instead of trying to clean up the bundled configure script which is 
>>>> a pile of crap, simply have the iproute2.mk file do:
>>>> echo TC_CONFIG_ATM:=y > Config
>>>> echo TC_CONFIG_XT:=$(BR2_IPTABLES) >> Config
>>>>
>>>> after all, we already know that the version of iptables in BR is 
>>>> the latest and so dont need any of the hacky iptables detection.
>>>>
>>>> here is a simple patch i wrote for Gentoo that allows you to 
>>>> disable iptables support completely:
>>>>
>>>> http://sources.gentoo.org/sys-apps/iproute2/files/iproute2-2.6.35-n
>>>> o-iptables.patch
>>>
>>> To write ad-hoc iproute2.mk is not general way. Especially the 
>>> replacing -o2 with the CFLAGS by the sed. You don't need iptables 
>>> integration but I do. I don't need IPv6. I don't need ATM but it was 
>>> switch on in my system by ./configure that use host dirs instead 
>>> staging. You suggest to hardcode settings. It's not good.
>>
>> all of this is irrelevant to what i highlighted. ?my point is to not 
>> run configure and i showed you how to do it cleanly instead. ?nothing 
>> in my proposal limits dynamic selection of features.
>
> I this case people must do it by hands with patching iproute2.mk

no, it really doesnt.  i gave an *example*.  nowhere did i say "you must use
the example exactly as i posted".
-mike


------------------------------

Message: 2
Date: Fri, 10 Dec 2010 20:48:41 +0100
From: "Sagaert Johan" <sagaert.johan@skynet.be>
To: <buildroot@busybox.net>
Subject: [Buildroot] Problem with libcgi : build links to glib2
	instead of	uclibc ?
Message-ID: <737777249D884273A2236C0B56BDE478@apexjs>
Content-Type: text/plain;	charset="UTF-8"

Hi
 
I am building for i686 target.
 
When building libcgi i could not link my program with libcgi, It sems libcgi
is linked with glib instead of uclibc :
 
snippet from running nm libcgi.so in the output/staging/usr/lib :
 
................
         U sprintf@@GLIBC_2.0
         U srand@@GLIBC_2.0
000061e0 t stat
         U stdin@@GLIBC_2.0
00003b1f T str_base64_decode
000039cc T str_base64_encode
0000526a T str_nreplace
000053e1 T str_replace
         U strcasecmp@@GLIBC_2.0
000057c5 T strcat_ex
         U strchr@@GLIBC_2.0
         U strcmp@@GLIBC_2.0
         U strcpy@@GLIBC_2.0
000054f7 T strdel
00004d73 T stripnslashes
00004e1a T stripslashes
         U strlen@@GLIBC_2.0
         U strncat@@GLIBC_2.0
         U strncpy@@GLIBC_2.0
00005461 T strnpos
000054be T strpos
00004f6b T substr
000073c0 d table.2974
00004f3d T trim
         U unlink@@GLIBC_2.0
         U vprintf@@GLIBC_2.0
         U vsprintf@@GLIBC_2.0
.......

After removing the related stamps (.built ,.installed, ....) and doing a
make clean in the libcgi build dir I added a line $(CC) = i686-linux-gcc in
the Makefile.

After re-building, the cgilib is correctly linked to the uclibc.

What could be wrong in the libcgi configure scripts ?

Buildroot build output : i noticed cc ....this was giving me the clue why
glib2 was used...

make[1]: Entering directory `/mnt/hd2/buildrootx86/output/build/libcgi-1.0'
cc -Wall -D_REENTRANT -fPIC -c src/error.c -o src/error.sh.o cc -Wall
-D_REENTRANT -fPIC -c src/cgi.c -o src/cgi.sh.o
src/cgi.c: In function ???cgi_escape_special_chars???:
src/cgi.c:462: warning: pointer targets in return differ in signedness cc
-Wall -D_REENTRANT -fPIC -c src/session.c -o src/session.sh.o cc -Wall
-D_REENTRANT -fPIC -c src/base64.c -o src/base64.sh.o cc -Wall -D_REENTRANT
-fPIC -c src/md5.c -o src/md5.sh.o
src/md5.c: In function ???md5???:
....



This produced the right libcgi after adding the CC line in the makefile.
make[1]: Entering directory `/mnt/hd2/buildrootx86/output/build/libcgi-1.0'
i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/error.c -o src/error.sh.o
i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/cgi.c -o src/cgi.sh.o
src/cgi.c: In function 'cgi_escape_special_chars':
src/cgi.c:462: warning: pointer targets in return differ in signedness
i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/session.c -o src/session.sh.o
i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/base64.c -o src/base64.sh.o
i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/md5.c -o src/md5.sh.o



Johan




------------------------------

Message: 3
Date: Fri, 10 Dec 2010 21:29:47 +0100
From: Lionel Landwerlin <llandwerlin@gmail.com>
To: buildroot at busybox.net
Subject: Re: [Buildroot] Problem with libcgi : build links to glib2
	instead of uclibc ?
Message-ID: <1292012987.24014.175.camel@coalu.atr>
Content-Type: text/plain; charset="UTF-8"

Hi Sagaert,

Le vendredi 10 d?cembre 2010 ? 20:48 +0100, Sagaert Johan a ?crit :
> Hi
>  
> I am building for i686 target.
>  
> When building libcgi i could not link my program with libcgi, It sems 
> libcgi  is linked with glib instead of uclibc :

glibc not glib

>  
> snippet from running nm libcgi.so in the output/staging/usr/lib :
>  
> ................
>          U sprintf@@GLIBC_2.0
>          U srand@@GLIBC_2.0
> 000061e0 t stat
>          U stdin@@GLIBC_2.0
> 00003b1f T str_base64_decode
> 000039cc T str_base64_encode
> 0000526a T str_nreplace
> 000053e1 T str_replace
>          U strcasecmp@@GLIBC_2.0
> 000057c5 T strcat_ex
>          U strchr@@GLIBC_2.0
>          U strcmp@@GLIBC_2.0
>          U strcpy@@GLIBC_2.0
> 000054f7 T strdel
> 00004d73 T stripnslashes
> 00004e1a T stripslashes
>          U strlen@@GLIBC_2.0
>          U strncat@@GLIBC_2.0
>          U strncpy@@GLIBC_2.0
> 00005461 T strnpos
> 000054be T strpos
> 00004f6b T substr
> 000073c0 d table.2974
> 00004f3d T trim
>          U unlink@@GLIBC_2.0
>          U vprintf@@GLIBC_2.0
>          U vsprintf@@GLIBC_2.0
> .......
> 
> After removing the related stamps (.built ,.installed, ....) and doing 
> a make clean in the libcgi build dir I added a line $(CC) = i686-linux-gcc
in the Makefile.

It sounds like the same issue than the one discussed very recently :

http://lists.busybox.net/pipermail/buildroot/2010-December/039375.html

> 
> After re-building, the cgilib is correctly linked to the uclibc.
> 
> What could be wrong in the libcgi configure scripts ?
> 
> Buildroot build output : i noticed cc ....this was giving me the clue why
glib2 was used...
> 
> make[1]: Entering directory
`/mnt/hd2/buildrootx86/output/build/libcgi-1.0'
> cc -Wall -D_REENTRANT -fPIC -c src/error.c -o src/error.sh.o cc -Wall 
> -D_REENTRANT -fPIC -c src/cgi.c -o src/cgi.sh.o
> src/cgi.c: In function ???cgi_escape_special_chars???:
> src/cgi.c:462: warning: pointer targets in return differ in signedness 
> cc -Wall -D_REENTRANT -fPIC -c src/session.c -o src/session.sh.o cc 
> -Wall -D_REENTRANT -fPIC -c src/base64.c -o src/base64.sh.o cc -Wall 
> -D_REENTRANT -fPIC -c src/md5.c -o src/md5.sh.o
> src/md5.c: In function ???md5???:
> ....
> 
> 
> 
> This produced the right libcgi after adding the CC line in the makefile.
> make[1]: Entering directory
`/mnt/hd2/buildrootx86/output/build/libcgi-1.0'
> i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/error.c -o 
> src/error.sh.o i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/cgi.c -o 
> src/cgi.sh.o
> src/cgi.c: In function 'cgi_escape_special_chars':
> src/cgi.c:462: warning: pointer targets in return differ in signedness 
> i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/session.c -o 
> src/session.sh.o i686-linux-gcc -Wall -D_REENTRANT -fPIC -c 
> src/base64.c -o src/base64.sh.o i686-linux-gcc -Wall -D_REENTRANT 
> -fPIC -c src/md5.c -o src/md5.sh.o
> 

All this crap is due to the fact that libcgi isn't a fully autotooled
package. It uses autoconf but not automake. Thus you have to set CC and AR
variables manually in the package/libcgi/libcgi.mk file and triggering
build.

I suggest that you define LIBCGI_MAKE_ENV in package/libcgi/libcgi.mk just
like this :

LIBCGI_MAKE_ENV = CC="$(TARGET_CC)" AR="$(TARGET_AR)"

And it should work right away.

Thanks for reporting that, and feel free to submit a patch.

Regards,

--
Lionel Landwerlin




------------------------------

Message: 4
Date: Fri, 10 Dec 2010 15:20:28 -0600
From: heiko@zuerker.org
To: buildroot at busybox.net
Subject: [Buildroot] [PATCH v2] add acl and attr support for extended
	attributes and POSIX Access Control Lists
Message-ID:
	
<2911fdf24c8da0851176d0fd2168a04e876ec3aa.1292015991.git.smiley73@users.sour
ceforge.net>
	

From: Heiko Zuerker <smiley73@users.sourceforge.net>

In addition to providing the acl and extended attributes functionality,
these new packages satisfy newer udev versions, so you can build all extras.

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in      |    2 ++
 package/acl/Config.in  |   11 +++++++++++
 package/acl/acl.mk     |   17 +++++++++++++++++
 package/attr/Config.in |    7 +++++++
 package/attr/attr.mk   |   17 +++++++++++++++++
 5 files changed, 54 insertions(+), 0 deletions(-)  create mode 100644
package/acl/Config.in  create mode 100644 package/acl/acl.mk  create mode
100644 package/attr/Config.in  create mode 100644 package/attr/attr.mk

diff --git a/package/Config.in b/package/Config.in index 10d8918..3a0b042
100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -470,6 +470,8 @@ source "package/which/Config.in"
 endmenu
 
 menu "System tools"
+source "package/acl/Config.in"
+source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 source "package/module-init-tools/Config.in"
diff --git a/package/acl/Config.in b/package/acl/Config.in new file mode
100644 index 0000000..8ed1d20
--- /dev/null
+++ b/package/acl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ACL
+	bool "acl"
+	select BR2_PACKAGE_ATTR
+	help
+	  POSIX Access Control Lists, which are used to define more 
+	  fine-grained discretionary access rights for files and
+	  directories.
+	  This package also provides libacl.
+
+comment "acl requires attr to be built"
+        depends on !BR2_PACKAGE_ATTR
diff --git a/package/acl/acl.mk b/package/acl/acl.mk new file mode 100644
index 0000000..16410fe
--- /dev/null
+++ b/package/acl/acl.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# attr
+#
+#############################################################
+
+ACL_VERSION = 2.2.49
+ACL_SOURCE := acl_$(ACL_VERSION).orig.tar.gz ACL_SITE = 
+http://ftp.debian.org/debian/pool/main/a/acl
+ACL_INSTALL_STAGING = YES
+ACL_DEPENDENCIES = attr
+ACL_INSTALL_STAGING = YES
+
+ACL_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr 
+exec_prefix=$(TARGET_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 
+install-dev install-lib ACL_INSTALL_TARGET_OPT = 
+prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install 
+install-lib
+
+$(eval $(call AUTOTARGETS,package,acl))
diff --git a/package/attr/Config.in b/package/attr/Config.in new file mode
100644 index 0000000..34920ed
--- /dev/null
+++ b/package/attr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ATTR
+	bool "attr"
+	help
+	  Extended attributes are name:value pairs associated permanently
with
+	  files and directories, similar to the environment strings
associated
+	  with a process
+	  This package also provides libattr.
diff --git a/package/attr/attr.mk b/package/attr/attr.mk new file mode
100644 index 0000000..2b584b1
--- /dev/null
+++ b/package/attr/attr.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# attr
+#
+#############################################################
+
+ATTR_VERSION = 2.4.44
+ATTR_SOURCE := attr_$(ATTR_VERSION).orig.tar.gz ATTR_SITE = 
+http://ftp.debian.org/debian/pool/main/a/attr
+
+ATTR_INSTALL_STAGING = YES
+
+ATTR_INSTALL_STAGING_OPT = prefix=$(STAGING_DIR)/usr 
+exec_prefix=$(STAGING_DIR)/usr PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib 
+install-dev install-lib ATTR_INSTALL_TARGET_OPT = 
+prefix=$(TARGET_DIR)/usr exec_prefix=$(TARGET_DIR)/usr install 
+install-lib #install-lib
+
+$(eval $(call AUTOTARGETS,package,attr))
--
1.7.3.2



------------------------------

Message: 5
Date: Fri, 10 Dec 2010 15:55:44 -0600
From: heiko@zuerker.org
To: buildroot at busybox.net
Subject: [Buildroot] [PATCH v3] Improved initramfs and iso target
	support
Message-ID:
	
<c0b6899c457c11e756f5c1e944548c8b0ad760b4.1292018128.git.smiley73@users.sour
ceforge.net>
	

From: Heiko Zuerker <smiley73@users.sourceforge.net>

A small initramfs is now supported in order to initialize the system.

New options to create a bootable CD with optional support for a
minimal initramfs, isolinux boot loader and zisofs have been added.
The iso filesystem doesn't need the ext2 image anymore, but the old
functionality is still available.

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 fs/initramfs/Config.in    |   55
++++++++++++++++++++++++++++++++++++++++++++-
 fs/initramfs/initramfs.mk |   41 +++++++++++++++++++++++++++++++++
 fs/iso9660/Config.in      |   44 ++++++++++++++++++++++++++++++++++-
 fs/iso9660/iso9660.mk     |   50 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 187 insertions(+), 3 deletions(-)

diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
index abb3c0c..596d323 100644
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -1,6 +1,17 @@
-config BR2_TARGET_ROOTFS_INITRAMFS
+config BR2_TARGET_DO_INITRAMFS
 	bool "initramfs for initial ramdisk of linux kernel"
 	depends on BR2_LINUX_KERNEL
+
+menu "initramfs options"
+depends on BR2_TARGET_DO_INITRAMFS
+
+choice
+	prompt "initramfs type"
+	default BR2_TARGET_ROOTFS_INITRAMFS
+	depends on BR2_TARGET_DO_INITRAMFS
+
+config BR2_TARGET_ROOTFS_INITRAMFS
+	bool "full"
 	help
 	  Integrate the root filesystem generated by Buildroot as an
 	  initramfs inside the kernel image. This integration will
@@ -16,5 +27,47 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 	  identical root filesystems, one embedded inside the kernel
 	  image, and one separatly.
 
+config BR2_TARGET_ROOTFS_MINI_INITRAMFS
+	bool "minimal"
+	help
+	  Only create a minimal initramfs to prepare system for boot.
+	  This is just like a initrd (initial ram disk).
+
+endchoice
+
+config BR2_TARGET_ROOTFS_MINI_INITRAMFS_COPYLIST
+	string "List with files to be copied"
+	depends on BR2_TARGET_DO_INITRAMFS
+	depends on BR2_TARGET_ROOTFS_MINI_INITRAMFS
+	default ""
+	help
+	  The contents of this file list the files and directories
+	  to be copied from the target file system.
+	  All path names are relativ to the output/target directory.
+	  This is an optional parameter.
+
+config BR2_TARGET_ROOTFS_MINI_INITRAMFS_SKELETON
+	string "initramfs skeleton"
+	depends on BR2_TARGET_DO_INITRAMFS
+	depends on BR2_TARGET_ROOTFS_MINI_INITRAMFS
+	default ""
+	help
+	  A skeleton directory which is copied before any files
+	  from the target filesystem are copied into the initramfs
+	  directory structure.
+	  This is an optional parameter.
+
+config BR2_TARGET_ROOTFS_MINI_INITRAMFS_INSTALL_BUSYBOX
+	bool "copy and install busybox"
+	depends on BR2_TARGET_DO_INITRAMFS
+	depends on BR2_TARGET_ROOTFS_MINI_INITRAMFS
+	help
+	  Copy the busybox binary into the initramfs and create all
+	  symlinks.
+	  Busybox should be statically compiled for this.
+
+endmenu
+	  
 comment "initramfs requires a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
+
diff --git a/fs/initramfs/initramfs.mk b/fs/initramfs/initramfs.mk
index 73122a8..159c629 100644
--- a/fs/initramfs/initramfs.mk
+++ b/fs/initramfs/initramfs.mk
@@ -6,6 +6,8 @@
 #
 #############################################################
 
+### use initramfs for the full target file system
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 define ROOTFS_INITRAMFS_INIT_SYMLINK
 	if [ ! -e $(TARGET_DIR)/init ]; then \
 		ln -sf sbin/init $(TARGET_DIR)/init; \
@@ -21,3 +23,42 @@ endef
 ROOTFS_INITRAMFS_POST_TARGETS += linux26-rebuild-with-initramfs
 
 $(eval $(call ROOTFS_TARGET,initramfs))
+endif
+### end full target on initramfs
+
+### create a minimal initramfs
+extradeps=
+INITRAMFSTMPDIR=$(BUILD_DIR)/initramfs.tmp
+
+ifeq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS_INSTALL_BUSYBOX),y)
+	extradeps += busybox
+endif
+
+$(BINARIES_DIR)/initramfs.gz: $(extradeps)
+	@$(call MESSAGE,"Generating root filesystem image initramfs.gz")
+	-rm -rf $(INITRAMFSTMPDIR)
+	mkdir -p $(INITRAMFSTMPDIR)
+ifneq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS_SKELETON),"")
+	cp -dpfR $(BR2_TARGET_ROOTFS_MINI_INITRAMFS_SKELETON)/*
$(INITRAMFSTMPDIR)/
+endif
+ifneq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS_COPYLIST),"")
+	pushd $(TARGET_DIR) ;for FILE in `cat
$(BR2_TARGET_ROOTFS_MINI_INITRAMFS_COPYLIST)` ; do cp -vdpfR --parents
$${FILE} $(INITRAMFSTMPDIR)/ ; done; popd
+endif
+ifeq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS_INSTALL_BUSYBOX),y)
+	cp $(TARGET_DIR)/bin/busybox $(INITRAMFSTMPDIR)/bin/
+	# if neccessary, create missing busybox.links
+	test -e $(BUSYBOX_DIR)/busybox.links || make -C $(BUSYBOX_DIR)
busybox.links
+	for LINK in `cat $(BUSYBOX_DIR)/busybox.links | grep -v linuxrc` ;
do ln -sf ../bin/busybox $(INITRAMFSTMPDIR)$${LINK}; done
+endif
+	pushd $(INITRAMFSTMPDIR); find . | cpio -H newc -o -O
$(BINARIES_DIR)/initramfs; popd
+	-rm -rf $(INITRAMFSTMPDIR)
+	gzip -f -9 $(BINARIES_DIR)/initramfs
+
+mini-initramfs: $(BINARIES_DIR)/initramfs.gz
+
+ifeq ($(BR2_TARGET_ROOTFS_MINI_INITRAMFS),y)
+#TARGETS+=mini-initramfs
+$(eval $(call ROOTFS_TARGET,mini-initramfs))
+endif
+
+### end minimal initramfs
diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
index 4c00583..2e4c375 100644
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -2,15 +2,55 @@ config BR2_TARGET_ROOTFS_ISO9660
 	bool "iso image"
 	depends on (BR2_i386 || BR2_x86_64)
 	depends on BR2_LINUX_KERNEL
-	select BR2_TARGET_ROOTFS_EXT2
-	select BR2_TARGET_GRUB
 	help
 	  Build a bootable iso9660 image
 
+menu "iso image options"
+depends on BR2_TARGET_ROOTFS_ISO9660
+
+choice
+	prompt "Bootloader"
+	default BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX
+	depends on BR2_TARGET_ROOTFS_ISO9660
+	help
+	  Select compressor for ext2 filesystem of the root filesystem
+
+config BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX
+	bool "isolinux"
+	select BR2_TARGET_SYSLINUX
+	help
+	  Use isolinux from syslinux package as the boot loader
+
+config BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_GRUB
+	bool "grub"
+	depends on BR2_i386
+	select BR2_TARGET_GRUB
+	select BR2_TARGET_ROOTFS_EXT2
+	help
+	  Use grub as the boot loader
+endchoice
+
 config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
 	string "Boot menu.lst file"
 	depends on BR2_TARGET_ROOTFS_ISO9660
 	default "fs/iso9660/menu.lst"
 
+config BR2_TARGET_ROOTFS_ISO9660_COPY_INITRAMFS
+	bool "copy initramfs into /boot"
+	select BR2_TARGET_DO_INITRAMFS
+	select BR2_PACKAGE_BUSYBOX
+	depends on BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX
+
+config BR2_TARGET_ROOTFS_ISO9660_COMPRESS
+	bool "compress ISO image contents"
+	depends on BR2_TARGET_DO_INITRAMFS
+	depends on BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX
+	help
+		Compresses the contents of the ISO image via mkzftree,
creating
+		a ZISOFS.
+		You'll need a kernel with the CONFIG_ZISOFS option enabled.
+
+endmenu
+	
 comment "iso image requires a Linux kernel to be built"
 	depends on (BR2_i386 || BR2_x86_64) && !BR2_LINUX_KERNEL
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 2a5288c..2a92497 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -15,6 +15,8 @@ ifeq ($(BR2_TARGET_ROOTFS_ISO9660_SQUASH),y)
 ISO9660_OPTS+=-U
 endif
 
+### using grub as a boot loader and using the ext2 image
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_GRUB),y)
 $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux26
rootfs-ext2 grub
 	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
 	mkdir -p $(ISO9660_TARGET_DIR)
@@ -36,7 +38,55 @@ $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot
linux26 rootfs-ext2 gr
 	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
 	- at rm -f $(FAKEROOT_SCRIPT)
 	- at rm -rf $(ISO9660_TARGET_DIR)
+endif
+
+### using isolinux and the files directly on the CD
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_BOOTLOADER_ISOLINUX),y)
+
+extradeps=
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COPY_INITRAMFS),y)
+	extradeps += mini-initramfs
+endif
+
+ISO9660_SOURCE_DIR = $(TARGET_DIR)
+
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COMPRESS),y)
+	extradeps += host-zisofs-tools
+	ISO9660_SOURCE_DIR = $(BUILD_DIR)/iso9660.tmp
+endif
 
+$(BINARIES_DIR)/rootfs.iso9660: host-cdrkit linux26 syslinux $(extradeps)
+	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
+	genisoimage_extraoptions=
+	# Get the boot loader and kernel ready
+	mkdir -p $(TARGET_DIR)/boot/isolinux
+	cp $(BINARIES_DIR)/isolinux.bin $(TARGET_DIR)/boot/isolinux/
+	cp $(ISO9660_BOOT_MENU) $(TARGET_DIR)/boot/isolinux/isolinux.cfg
+	cp $(LINUX26_IMAGE_PATH) $(TARGET_DIR)/boot/kernel
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COPY_INITRAMFS),y)
+	cp $(BINARIES_DIR)/initramfs.gz $(TARGET_DIR)/boot/
+endif
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COMPRESS),y)	
+	# create the ZISOFS
+	genisoimage_extraoptions=-z
+	-rm -rf $(ISO9660_SOURCE_DIR)
+	@$(call MESSAGE,"Compressing iso filesystem...")
+	$(HOST_DIR)/usr/bin/mkzftree -z 9 -p $(BR2_JLEVEL) $(TARGET_DIR)
$(ISO9660_SOURCE_DIR)
+	# now we need to restore the files which shouldn't be compressed
+	rm -rf $(ISO9660_SOURCE_DIR)/boot
+	cp -fdpR $(TARGET_DIR)/boot $(ISO9660_SOURCE_DIR)/
+endif
+	# Let's create the ISO image
+	$(HOST_DIR)/usr/bin/genisoimage -R -b boot/isolinux/isolinux.bin -c
boot/boot.cat -no-emul-boot \
+		-boot-load-size 4 -boot-info-table -o $@ \
+		-J -l -R -iso-level 2 $(genisoimage_extraoptions) \
+		-allow-leading-dots -allow-lowercase -allow-multidot \
+		$(ISO9660_SOURCE_DIR)
+ifeq ($(BR2_TARGET_ROOTFS_ISO9660_COMPRESS),y)
+	rm -rf $(ISO9660_SOURCE_DIR)
+endif
+endif
+	
 rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 
 #############################################################
-- 
1.7.3.2



------------------------------

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

End of buildroot Digest, Vol 54, Issue 80
*****************************************
