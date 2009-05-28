From: Paul Archer <ptarcher@gmail.com>
Date: Thu, 28 May 2009 16:00:59 +1000
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <d6cda7730905272159h1ecf88efx84d2ae055961c74e@mail.gmail.com>
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
	<56ea0bb80905272132n34933d3fh925bd0e765eb6f5d@mail.gmail.com>
	<d6cda7730905272159h1ecf88efx84d2ae055961c74e@mail.gmail.com>
Message-ID: <56ea0bb80905272300q73f74b05ybb647898a1bd8e4f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/5/28 Thiago A. Corr?a <thiago.correa@gmail.com>:
>   Anyway. I think the correct approach would be mimmic jffs2.mk,
> don't download anything and let mdtutils build mkfs.ubifs for the
> host.

Thiago,

I agree, and thats the approach I am taking, I have managed to get it
to build with these quick patches:

--- buildroot-snapshot-20090525/package/mtd/mtd-utils.git/mtd.mk        2009-05-
25 05:21:21.000000000 +1000
+++ buildroot-snapshot-20090525-modified/package/mtd/mtd-utils.git/mtd.mk      2
009-05-27 13:05:49.000000000 +1000
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+MTD_VERSION:=HEAD
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=
tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
@@ -18,6 +18,7 @@
 #
 #############################################################
 MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
+MKFS_UBIFS := $(MTD_HOST_DIR)/mkfs.ubifs/mkfs.ubifs
 SUMTOOL := $(MTD_HOST_DIR)/sumtool

 $(DL_DIR)/$(MTD_SOURCE):
@@ -27,18 +28,18 @@
        $(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTI
ONS) -
        rm -rf $(MTD_HOST_DIR)
        mv $(TOOL_BUILD_DIR)/$(MTD_NAME) $(MTD_HOST_DIR)
-       toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-               package/mtd/mtd-utils.git mtd-utils-all\*.patch
-       toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
-               package/mtd/mtd-utils.git mtd-utils-host\*.patch
+#      toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+#              package/mtd/mtd-utils.git mtd-utils-all\*.patch
+#      toolchain/patch-kernel.sh $(MTD_HOST_DIR) \
+#              package/mtd/mtd-utils.git mtd-utils-host\*.patch
        touch $@


-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
+$(MKFS_JFFS2) $(MKFS_UBIFS): $(MTD_HOST_DIR)/.unpacked
        CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
                $(MAKE) \
                BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
-               -C $(MTD_HOST_DIR) mkfs.jffs2
+               -C $(MTD_HOST_DIR)

 $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
        CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
@@ -46,7 +47,7 @@
                BUILDDIR=$(MTD_HOST_DIR) WITHOUT_XATTR=1 \
                -C $(MTD_HOST_DIR) sumtool

-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+mtd-host: $(MKFS_JFFS2) $(MKFS_UBIFS) $(SUMTOOL)

 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)

@@ -65,8 +66,8 @@
        $(MTD_CAT) $(DL_DIR)/$(MTD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS)
-
        rm -rf $(MTD_DIR)
        mv $(BUILD_DIR)/$(MTD_NAME) $(MTD_DIR)
-       toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils
-all\*.patch
-       toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils
-target\*.patch
+#      toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils
-all\*.patch
+#      toolchain/patch-kernel.sh $(MTD_DIR) package/mtd/mtd-utils.git mtd-utils
-target\*.patch
        touch $@

 MTD_TARGETS_n :=


--- buildroot-snapshot-20090525-orig/target/ubifs/ubifsroot.mk
2009-05-25 05:21:21.000000000 +1000
+++ buildroot-snapshot-20090525/target/ubifs/ubifsroot.mk
2009-05-28 15:55:35.000000000 +1000
@@ -1,37 +1,5 @@
 #############################################################
 #
-# mkfs.ubifs to build to target ubifs filesystems
-#
-#############################################################
-#MKFS_UBIFS_VERSION=2582f128dad78591bc3adcc87c343c690bb82e61
-#MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_VERSION=v0.4
-MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=refs/tags/mkfs.ubifs-$(MKFS_UBIFS_VERSION);sf=tgz
-MKFS_UBIFS_SOURCE:=mkfs.ubifs-$(MKFS_UBIFS_VERSION).tar.gz
-MKFS_UBIFS_DIR:= $(BUILD_DIR)/mkfs-ubifs-$(MKFS_UBIFS_VERSION)
-MKFS_UBIFS_CAT:=$(ZCAT)
-MKFS_UBIFS_NAME:=mkfs.ubifs
-
-$(DL_DIR)/$(MKFS_UBIFS_SOURCE):
-       $(call DOWNLOAD,"$(MKFS_UBIFS_URL)")
-
-$(MKFS_UBIFS_DIR)/.unpacked: $(DL_DIR)/$(MKFS_UBIFS_SOURCE)
-       $(ZCAT) $(DL_DIR)/$(MKFS_UBIFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-       mv $(BUILD_DIR)/$(MKFS_UBIFS_NAME) $(MKFS_UBIFS_DIR)
-       toolchain/patch-kernel.sh $(MKFS_UBIFS_DIR) target/ubifs/
mkfs-ubifs-\*.patch
-       touch $@
-
-$(MKFS_UBIFS_DIR)/mkfs.ubifs: $(MKFS_UBIFS_DIR)/.unpacked
-       $(MAKE) -C $(MKFS_UBIFS_DIR)
-       touch -c $@
-
-mkfs.ubifs-dirclean:
-       rm -rf $(MKFS_UBIFS_DIR)
-
-mkfs.ubifs: $(MKFS_UBIFS_DIR)/mkfs.ubifs
-
-#############################################################
-#
 # Build the ubifs root filesystem image
 #
 #############################################################
@@ -70,13 +38,19 @@
 UBIFS_ROOTFS_COMPRESSOR_PREREQ:= lzma-host
 endif

+#
+# mtd-host is a dependency which builds a local copy of mkfs.ubifs if
it is needed.
+# the actual build is done from package/mtd/mtd.mk and it sets the
+# value of MKFS_UBIFS to either the previously installed copy or the one
+# just built.
+#
 ifneq ($(UBIFS_ROOTFS_COMPRESSOR),)
 UBIFS_TARGET := $(UBIFS_BASE).$(UBIFS_ROOTFS_COMPRESSOR_EXT)
 else
 UBIFS_TARGET := $(UBIFS_BASE)
 endif

-$(UBIFS_BASE): host-fakeroot makedevs mkfs.ubifs
+$(UBIFS_TARGET): host-fakeroot makedevs mtd-host
        # Use fakeroot to pretend all target binaries are owned by root
        rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
        touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
@@ -88,7 +62,7 @@
                >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 endif
        # Use fakeroot so mkfs.ubifs believes the previous fakery
-       echo "$(MKFS_UBIFS_DIR)/mkfs.ubifs -d $(TARGET_DIR) " \
+       echo "$(MKFS_UBIFS) -d $(TARGET_DIR) " \
                "$(UBIFS_OPTS) -o $(UBIFS_BASE)" >>
$(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
        chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
        $(HOST_DIR)/usr/bin/fakeroot --
$(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
@@ -108,13 +82,13 @@
        @cp -f $(UBIFS_TARGET) $(UBIFS_COPYTO)
 endif

-ubifsroot-source: $(DL_DIR)/$(GENUBIFS_SOURCE)
+ubifsroot-source: mtd-host-source

 ubifsroot-clean:
-       -$(MAKE) -C $(MKFS_UBIFS_DIR) clean
+       -rm -f $(UBIFS_TARGET)

 ubifsroot-dirclean:
-       rm -rf $(MKFS_UBIFS_DIR)
+       -rm -rf $(UBIFS_TARGET)

 #############################################################
 #


With this patch, I successfully get a ubifs image. I think... (not
sure if I have touched other stuff unfortunately). Sorry if gmail
wraps the patches, I can always send via an attachment if need be.

Regards Paul

> On Thu, May 28, 2009 at 1:32 AM, Paul Archer <ptarcher@gmail.com> wrote:
>> On Thu, May 28, 2009 at 5:06 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>> Peter> And report any issues found here or in the bugtracker.
>> I have been trying to build buildroot with a ubifs image. I haven't
>> quite got there yet, but there are some bugs associated with this
>> version.
>>
>> target/ubifs/ubifsroot.mk
>> $(call DOWNLOAD,"$(MKFS_UBIFS_URL)")
>>
>> This should be a WGET, not a DOWNLOAD.
>>
>> I have been trying to update the UBIFS support as this is now included
>> in the mtd-utils package under the mkfs.ubifs.
>> ubifs also depends on e2fsprogs as there is uuid support needed in
>> mkfs.ubifs. I have at least gotten ubifs to compile with a few changes
>> here and there (mainly a change in mtd-utils makefiles to build
>> mkfs.ubifs), but I haven't had time to get an image made yet.
>>
>> --
>> ----
>> Regards
>> Paul Archer
>> ptarcher at gmail.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>



-- 
----
Regards
Paul Archer
ptarcher at gmail.com
