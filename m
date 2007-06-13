From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed, 13 Jun 2007 15:56:34 +0200
Subject: [Buildroot] uclibc.mk breaks target .config
In-Reply-To: <20070613134054.GA28888@aon.at>
References: <20070613124624.GA10380@z1.synertronixx>
	<20070613134054.GA28888@aon.at>
Message-ID: <20070613135634.GA6911@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2007-06-13 15:40 +0200 schrieb Bernhard Fischer:

> Do i understand you correctly that everything works fine unless you do
> something you are not supposed to do?

I don't know exactly, hence my question.

I saw another target/device/vendor* subtrees supplying a custom
uClibc.config, so I want for myself.

> >The version I am trying to use is a uclibc-snapshot.
> 
> The files you're supposed to read is docs/*

Well, there is mentioned to make a "make uclibc-menuconfig" but I need
to supply one by myself.

Second way is to pass UCLIBC_CONFIG_FILE=<path/to/.config> what is what
I try to do. But this particular file is patched in a way uclibc's "make
oldconfig" is hosed.

> It is generally a good idea to do this before doing something stupid, 
> ranting and babbling shZ()t like "duh! must.. rewrite.. everything..
> duh!"

Oh sorry! My question was intended to be only a question, not a rant at
all! May be somebody points out the behaviour is only wrong here and the
error is before screen, hence I asked for a bit of advice. May be even
earlier versions of uClibc are not confused of echoing variables to the
bottom of .config and what.

What I did now is:

--- vanilla/buildroot/toolchain/uClibc/uclibc.mk        2007-06-07 09:15:01.000000000 +0200
+++ buildroot-20070607/toolchain/uClibc/uclibc.mk       2007-06-13 15:13:45.000000000 +0200
@@ -91,6 +91,8 @@
        $(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
        toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-$(UCLIBC_VER)-\*.patch
+else
+       toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ uClibc-snapshot-\*.patch
 endif
 ifneq ($(BR2_ENABLE_LOCALE),)
        cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
@@ -109,6 +111,9 @@
                -e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
                -e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
                $(UCLIBC_DIR)/.config
+
+ifneq ($(BR2_UCLIBC_CONFIG_FILE_VANILLA),y)
+
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
        $(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
                 $(UCLIBC_DIR)/.config
@@ -224,9 +229,12 @@
        $(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.config
 endif
 endif
+
+endif #UCLIBC_CONFIG_FILE_VANILLA
        mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
        mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
        mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
        $(MAKE1) -C $(UCLIBC_DIR) \
                PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
                DEVEL_PREFIX=/usr/ \

and:

--- vanilla/buildroot/toolchain/uClibc/Config.in        2007-06-07 09:15:01.000000000 +0200
+++ buildroot-20070607/toolchain/uClibc/Config.in       2007-06-13 15:00:50.000000000 +0200
@@ -33,6 +33,12 @@
        help
            Use latest snapshot or one from a specific date?

+config BR2_UCLIBC_CONFIG_FILE_VANILLA
+       bool "leave target supplied .config as it is"
+       default n
+       help
+         do not patch target config file
+
 config BR2_UCLIBC_CONFIG
        string "uClibc configuration file to use?"
        default "toolchain/uClibc/uClibc-0.9.28.config" if BR2_UCLIBC_VERSION_0_9_28

Kind Regards, Konsti


-- 
synertronixx GmbH
Dipl.-Ing. (FH) Konstantin Kletschke
Vahrenwalder Str. 7
30165 Hannover
Tel.    : 0511 / 3574 - 661
Fax     : 0511 / 93 57 - 679
E-mail  : kletschke at synertronixx.de
Internet: http://www.synertronixx.de
Vertretungsberechtigte Gesch?ftsf?hrer:
Marc-Oliver Borck, Dr. Matthias Blaschke
Registergericht: Amtsgericht Hannover
Registernummer: HRB 59670
USt-ID: DE 216 559 901
