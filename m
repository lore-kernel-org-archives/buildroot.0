From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 31 Jul 2007 18:17:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/device	target/device/Atmel targe etc...
In-Reply-To: <20070731161525.GB9378@aon.at>
References: <20070731145959.C5111A4595@busybox.net>
	<20070731161525.GB9378@aon.at>
Message-ID: <20070731161731.GC9378@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2007 at 06:15:25PM +0200, Bernhard Fischer wrote:
>On Tue, Jul 31, 2007 at 07:59:59AM -0700, ulf at uclibc.org wrote:
>>Author: ulf
>>Date: 2007-07-31 07:59:58 -0700 (Tue, 31 Jul 2007)
>>New Revision: 19351
>>
>>Log:
>>Add support for prepatched toolchains
>
>>Changeset:
>
>[snip -- see r19355 and r19356 for comments on the snipped parts]
>
>>Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
>>===================================================================
>>--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-30 18:24:53 UTC (rev 19350)
>>+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-31 14:59:58 UTC (rev 19351)
>>@@ -33,15 +33,23 @@
>> endif
>> UCLIBC_SITE:=http://www.uclibc.org/downloads
>> 
>>-ifeq	($(BR2_avr32),y)
>>-VENDOR_SUFFIX:=-avr32
>>-UCLIBC_SITE:=$(BR2_ATMEL_MIRROR)/Source
>>+ifeq	($(BR2_TOOLCHAIN_NORMAL),)
>>+UCLIBC_SITE:=$(VENDOR_SITE)
>> endif
>> 
>>-UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_VER)$(VENDOR_SUFFIX)
>>-UCLIBC_SOURCE:=uClibc-$(UCLIBC_VER)$(VENDOR_SUFFIX).tar.bz2
>>+UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
>>+
>>+
>>+ifeq	($(BR2_TOOLCHAIN_NORMAL),y)
>>+UCLIBC_PATCH_DIR:=toolchain/uClibc/
>>+else
>>+UCLIBC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
>> endif
>> 
>>+UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
>>+UCLIBC_SOURCE:=uClibc-$(UCLIBC_OFFICIAL_VERSION).tar.bz2
>>+endif
>>+
>> UCLIBC_CAT:=$(BZCAT)
>> 
>> UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed -e s'/-.*//' \
>>@@ -93,13 +101,13 @@
>> 
>> uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
>> $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
>>-	[ -d $(TOOL_BUILD_DIR) ] || $(INSTALL) -d $(TOOL_BUILD_DIR)
>>+	mkdir -p $(TOOL_BUILD_DIR)
>> 	rm -rf $(UCLIBC_DIR)
>> 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
>> ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
>>-	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)$(VENDOR_SUFFIX)-\*.patch
>>+	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) uClibc-$(UCLIBC_OFFICIAL_VERSION)-\*.patch
>> else
>>-	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc.\*.patch
>>+	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) uClibc.\*.patch
>> endif
>> ifneq ($(BR2_ENABLE_LOCALE),)
>> 	cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
>
>You broke using snapshots.
>
>[]
>bzcat /tmp/buildroot_trunk/.down/uClibc-snapshot.tar.bz2 | tar -C /tmp/buildroot_trunk/toolchain_build_i386   -xf -
>toolchain/patch-kernel.sh /tmp/buildroot_trunk/toolchain_build_i386/uClibc  uClibc.\*.patch
>Aborting.  'uClibc.*.patch' is not a directory.
>
>Please fix.

Oh, also please do *not* use tabs between ifeq/ifneq and the test.
