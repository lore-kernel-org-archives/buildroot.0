From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 31 May 2007 23:46:38 +0200
Subject: [Buildroot] Ogg and Vorbis patch part 2
In-Reply-To: <465F19D0.6020001@teamboyce.co.uk>
References: <465AD791.2040108@teamboyce.co.uk> <20070529202507.GC30684@aon.at>
	<465F19D0.6020001@teamboyce.co.uk>
Message-ID: <20070531214638.GE12010@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 31, 2007 at 07:54:08PM +0100, Rod Boyce wrote:
>
>>just
>>	-$(MAKE) -C $(LIBOGG_WORKDIR) clean
>>and drop the if.
>>[snip]
>>
>>  
>
>All,
>
>Attached is a new improved patch to add libvorbis and libogg to build 
>root.  I have only tested on 386 hopefully others can test on other 
>platforms.  I have a floating point unit so I do not need to use an 
>integer only version.

Thanks for the update, but please see below..
>
>Regards,
>Rod Boyce
>

>diff -uN --recursive ../trunk/package/libogg/libogg.mk package/libogg/libogg.mk
>--- ../trunk/package/libogg/libogg.mk	1970-01-01 01:00:00.000000000 +0100
>+++ package/libogg/libogg.mk	2007-05-31 19:48:23.186662591 +0100
>@@ -0,0 +1,64 @@
+$(LIBVORBIS_DIR)/.unpacked: $(DL_DIR)/$(LIBVORBIS_SOURCE)
+       $(LIBVORBIS_CAT) $(DL_DIR)/$(LIBVORBIS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+       touch $@

missing CONFIG_UPDATE

[snip]
>+
>+libogg-clean:
>+	@if [ -d $(LIBOGG_DIR)/Makefile ] ; then \
>+		$(MAKE) -C $(LIBOGG_DIR) clean ; \
>+	fi;

just
	-$(MAKE) -C $(LIBOGG_DIR) clean
and drop the if.

>diff -uN --recursive ../trunk/package/libogg/libogg.mk~ package/libogg/libogg.mk~
>--- ../trunk/package/libogg/libogg.mk~	1970-01-01 01:00:00.000000000 +0100
>+++ package/libogg/libogg.mk~	2007-05-31 19:37:14.848508875 +0100

you want --exclude='*~'
Alternatively, a simple "svn diff > ~/mypatch.diff" should do the right
thing.

[snip]
>+
>+libogg-clean:
>+	@if [ -d $(LIBOGG_DIR)/Makefile ] ; then \
>+		$(MAKE) -C $(LIBOGG_DIR) clean ; \
>+	fi;

just
	-$(MAKE) -C $(LIBOGG_DIR) clean
and drop the if.

>+
>+libogg-dirclean:
>+	rm -rf $(LIBOGG_DIR) $(LIBOGG_DIR)
>+#############################################################
>+#
>+# Toplevel Makefile options
>+#
>+#############################################################
>+ifeq ($(strip $(BR2_PACKAGE_LIBOGG)),y)
>+TARGETS+=libogg
>+endif

>diff -uN --recursive ../trunk/package/libvorbis/libvorbis.mk package/libvorbis/libvorbis.mk
>--- ../trunk/package/libvorbis/libvorbis.mk	1970-01-01 01:00:00.000000000 +0100
>+++ package/libvorbis/libvorbis.mk	2007-05-31 19:48:51.409340059 +0100
>@@ -0,0 +1,78 @@
[]
>+$(DL_DIR)/$(LIBVORBIS_SOURCE):
>+	$(WGET) -P $(DL_DIR) $(LIBVORBIS_SITE)/$(LIBVORBIS_SOURCE)
>+
>+$(LIBVORBIS_DIR)/.unpacked: $(DL_DIR)/$(LIBVORBIS_SOURCE)
>+	$(LIBVORBIS_CAT) $(DL_DIR)/$(LIBVORBIS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

missing CONFIG_UPDATE

>+	touch $@
>+

>+libvorbis-clean:
>+	@if [ -d $(LIBVORBIS_DIR)/Makefile ] ; then \
>+		$(MAKE) -C $(LIBVORBIS_DIR) clean ; \
>+	fi;

just
	-$(MAKE) -C $(LIBVORBIS_DIR) clean
and drop the if. 
>+
>+libvorbis-dirclean:
>+	rm -rf $(LIBVORBIS_DIR) $(LIBVORBIS_DIR)
>+
>+
>+#############################################################
>+#
>+# Toplevel Makefile options
>+#
>+#############################################################
>+ifeq ($(strip $(BR2_PACKAGE_LIBVORBIS)),y)
>+TARGETS+=libvorbis
>+endif
>diff -uN --recursive ../trunk/package/libvorbis/libvorbis.mk~ package/libvorbis/libvorbis.mk~
>--- ../trunk/package/libvorbis/libvorbis.mk~	1970-01-01 01:00:00.000000000 +0100
>+++ package/libvorbis/libvorbis.mk~	2007-05-31 07:06:11.547658783 +0100

you want --exclude='*~'
Alternatively, a simple "svn diff > ~/mypatch.diff" should do the right
thing.
