From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 Dec 2009 13:54:06 +0100
Subject: [Buildroot] [PATCH] jpeg: convert to autotools infrastructure
In-Reply-To: <1262123141.5867.51.camel@coalu.atr> (Lionel Landwerlin's message
	of "Tue, 29 Dec 2009 22:45:41 +0100")
References: <4d28d4b50912290214u6b15af37nbefdf6b672b87c3d@mail.gmail.com>
	<87aax1v6zy.fsf@macbook.be.48ers.dk>
	<1262123141.5867.51.camel@coalu.atr>
Message-ID: <87637ovd01.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

 Lionel> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>

Thanks, this time it came through ok.

Committed with some changes, see below.

 Lionel> ---
 Lionel>  package/jpeg/jpeg.mk |   73 ++++++-------------------------------------------
 Lionel>  1 files changed, 9 insertions(+), 64 deletions(-)

 Lionel> diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
 Lionel> index 2688084..b4afc24 100644
 Lionel> --- a/package/jpeg/jpeg.mk
 Lionel> +++ b/package/jpeg/jpeg.mk
 Lionel> @@ -21,77 +21,22 @@
 Lionel>  # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 Lionel>  # USA
 Lionel>  JPEG_VERSION:=6b
 Lionel> -JPEG_DIR=$(BUILD_DIR)/jpeg-$(JPEG_VERSION)
 Lionel>  JPEG_SITE:=ftp://ftp.uu.net/graphics/jpeg/
 Lionel>  JPEG_SOURCE=jpegsrc.v$(JPEG_VERSION).tar.gz
 Lionel> -JPEG_CAT:=$(ZCAT)
 Lionel> +JPEG_INSTALL_STAGING = YES
 Lionel> +JPEG_INSTALL_TARGET = YES

Jpeg has it's own libtool patch, so we need JPEG_LIBTOOL_PATCH =
NO. You didn't see that as the automatic libtool patching recently got
broken.
 
 Lionel> -$(DL_DIR)/$(JPEG_SOURCE):
 Lionel> -	 $(call DOWNLOAD,$(JPEG_SITE),$(JPEG_SOURCE))
 Lionel> +JPEG_CONF_OPT = --without-x --enable-shared --enable-static
 
 Lionel> -jpeg-source: $(DL_DIR)/$(JPEG_SOURCE)
 Lionel> -
 Lionel> -$(JPEG_DIR)/.unpacked: $(DL_DIR)/$(JPEG_SOURCE)
 Lionel> -	$(JPEG_CAT) $(DL_DIR)/$(JPEG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 Lionel> -	toolchain/patch-kernel.sh $(JPEG_DIR) package/jpeg/ jpeg\*.patch
 Lionel> -	$(CONFIG_UPDATE) $(JPEG_DIR)
 Lionel> -	touch $@
 Lionel> -
 Lionel> -$(JPEG_DIR)/.configured: $(JPEG_DIR)/.unpacked
 Lionel> -	(cd $(JPEG_DIR); rm -rf config.cache; \
 Lionel> -		$(TARGET_CONFIGURE_OPTS) \
 Lionel> -		$(TARGET_CONFIGURE_ARGS) \
 Lionel> -		./configure $(QUIET) \
 Lionel> -		--target=$(GNU_TARGET_NAME) \
 Lionel> -		--host=$(GNU_TARGET_NAME) \
 Lionel> -		--build=$(GNU_HOST_NAME) \
 Lionel> -		--prefix=/usr \
 Lionel> -		--exec-prefix=/usr \
 Lionel> -		--bindir=/usr/bin \
 Lionel> -		--sbindir=/usr/sbin \
 Lionel> -		--libdir=/usr/lib \
 Lionel> -		--libexecdir=/usr/lib \
 Lionel> -		--sysconfdir=/etc \
 Lionel> -		--datadir=/usr/share \
 Lionel> -		--localstatedir=/var \
 Lionel> -		--includedir=/usr/include \
 Lionel> -		--mandir=/usr/share/man \
 Lionel> -		--infodir=/usr/share/info \
 Lionel> -		--enable-shared \
 Lionel> -		--enable-static \
 Lionel> -		--without-x \
 Lionel> -	)
 Lionel> -	touch $@
 Lionel> -
 Lionel> -$(JPEG_DIR)/.libs/libjpeg.a: $(JPEG_DIR)/.configured
 Lionel> -	$(MAKE) -C $(JPEG_DIR) all
 Lionel> -	touch -c $@
 Lionel> -
 Lionel> -$(STAGING_DIR)/usr/lib/libjpeg.a: $(JPEG_DIR)/.libs/libjpeg.a
 Lionel> -	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(JPEG_DIR) install
 Lionel> -	cp -f $(JPEG_DIR)/libjpeg.la $(STAGING_DIR)/usr/lib
 Lionel> +define JPEG_INSTALL_STAGING_CMDS
 Lionel> +	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 Lionel>  	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libjpeg.la
 Lionel> -	touch -c $@
 Lionel> +endef

The standard staging install handling does this as well, so there's no
need for this.
 
 Lionel> -$(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/usr/lib/libjpeg.a
 Lionel> +define JPEG_INSTALL_TARGET_CMDS
 Lionel>  	mkdir -p $(TARGET_DIR)/usr/lib
 Lionel>  	cp -dpf $(STAGING_DIR)/usr/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
 Lionel>  	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libjpeg.so*

It's better to use the existing make install, as that also installs
headers/manpages/.. for the people having that enabled and then just use
a post-install hook to clean up anything else (in this case the
binaries).

-- 
Bye, Peter Korsgaard
