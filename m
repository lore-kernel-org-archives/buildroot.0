From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 20 Dec 2006 18:23:28 +0100
Subject: [Buildroot] [PATCH] (Resend) Add alsa-lib
In-Reply-To: <39d7ed000612200901m4b3abe09xc83d8c7b15a9951f@mail.gmail.com>
References: <39d7ed000612200901m4b3abe09xc83d8c7b15a9951f@mail.gmail.com>
Message-ID: <20061220172328.GB24825@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 20, 2006 at 07:01:52PM +0200, Gilad Rom wrote:
>Add alsa-lib.
>
>I've got a bunch more, will send if this one is commit-worthy.
>
>This patch is made against today's (Dec 20) buildroot.
>
>Gilad.

>diff -x .svn -urN buildroot/package/alsa-lib.nonexistant/alsa-lib.mk buildroot.fixed/package/alsa-lib/alsa-lib.mk
>--- buildroot/package/alsa-lib.nonexistant/alsa-lib.mk	1970-01-01 02:00:00.000000000 +0200
>+++ buildroot.fixed/package/alsa-lib/alsa-lib.mk	2006-12-20 18:45:25.000000000 +0200
>@@ -0,0 +1,72 @@
>+#############################################################
>+#
>+# Alsa lib
>+#
>+#############################################################
>+
>+ALSA_LIB_VERSION=1.0.13
>+
>+# Don't alter below this line unless you (think) you know
>+# what you are doing! Danger, Danger!
>+
>+ALSA_LIB_SOURCE=alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
>+ALSA_LIB_SITE=ftp://ftp.alsa-project.org/pub/lib
>+ALSA_LIB_DIR=$(BUILD_DIR)/${shell basename $(ALSA_LIB_SOURCE) .tar.bz2}


ALSA_LIB_DIR=$(BUILD_DIR)/alsa-lib-$(ALSA_LIB_VERSION)

>+ALSA_LIB_WORKDIR=$(BUILD_DIR)/alsa-lib-$(ALSA_LIB_VERSION)

I don't see why you need a WORKDIR. Can't you just use the DIR from
above? Please explain.

>+ALSA_LIB_CAT=$(BZCAT)
>+
>+$(DL_DIR)/$(ALSA_LIB_SOURCE):
>+	$(WGET) -P $(DL_DIR) $(ALSA_LIB_SITE)/$(ALSA_LIB_SOURCE)
>+
>+$(ALSA_LIB_DIR)/.unpacked:	$(DL_DIR)/$(ALSA_LIB_SOURCE)
>+	$(ALSA_LIB_CAT) $(DL_DIR)/$(ALSA_LIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	touch $(ALSA_LIB_DIR)/.unpacked
>+
>+$(ALSA_LIB_DIR)/.configured: $(ALSA_LIB_DIR)/.unpacked
>+	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
>+	$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD="$(HOSTCC)" \
>+	CFLAGS="$(TARGET_CFLAGS)" \
>+	./configure \

+		--target=$(GNU_TARGET_NAME) \

>+		--host=$(GNU_TARGET_NAME) \
>+		--build=$(GNU_HOST_NAME) \
>+		--prefix=$(TARGET_DIR) \
>+        );
>+	touch $(ALSA_LIB_DIR)/.configured
>+	echo "#undef DATADIR" >> $(ALSA_LIB_WORKDIR)/include/config.h
>+	echo "#define DATADIR \"/share\"" >> $(ALSA_LIB_WORKDIR)/include/config.h
>+
>+
>+$(ALSA_LIB_WORKDIR)/src/.libs/libasound.so.2.0.0:	$(ALSA_LIB_DIR)/.configured
>+	$(MAKE) -C $(ALSA_LIB_WORKDIR)
>+
>+$(TARGET_DIR)/lib/libasound.so.2.0.0: 	$(ALSA_LIB_WORKDIR)/src/.libs/libasound.so.2.0.0
>+	$(MAKE) -C $(ALSA_LIB_WORKDIR) install
>+	echo "pcm.!default { \
>+	    	type hw \
>+	    	card 0 \
>+		} \
>+		ctl.!default { \
>+	    	type hw \
>+    		card 0 \
>+		}" > $(TARGET_DIR)/etc/asound.conf
>+
>+alsa-lib:	uclibc $(TARGET_DIR)/lib/libasound.so.2.0.0
>+
>+alsa-lib-source: $(DL_DIR)/$(ALSA_LIB_SOURCE)
>+
>+alsa-lib-clean:
>+	@if [ -d $(ALSA_LIB_WORKDIR)/Makefile ] ; then \
>+		$(MAKE) -C $(ALSA_LIB_WORKDIR) clean ; \
>+	fi;

Please rm the installed files from the TARGET_DIR in any -clean target,
generally.
