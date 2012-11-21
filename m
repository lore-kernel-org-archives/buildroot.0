From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Nov 2012 16:12:16 +0200
Subject: [Buildroot] [PATCH] libpcap: fix static build
In-Reply-To: <1353503491-4732-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1353503491-4732-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20121121141215.GD28785@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 21, 2012 at 02:11:31PM +0100, Thomas Petazzoni wrote:
> The libpcap package contained some interesting attempts to support a
> static-only build, but it was not working:
> 
>  http://autobuild.buildroot.org/results/01038d3b970092d894d2bae80679247e65722785/build-end.log
> 
> In fact the configure.in of libpcap has provision to support
> --enable-shared/--disable-shared, but the generated configure script
> in the libpcap package has not been regenerated with the configure.in
> changes.
> 
> So basically, enabling LIBPCAP_AUTORECONF=YES ensures that the
> configure script gets generated, which brings us a working
> --enable-shared / --disable-shared.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libpcap/libpcap.mk |    6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index 7a1d32f..468b064 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -9,12 +9,8 @@ LIBPCAP_SITE = http://www.tcpdump.org/release
>  LIBPCAP_LICENSE = BSD-3c
>  LIBPCAP_LICENSE_FILES = LICENSE
>  LIBPCAP_INSTALL_STAGING = YES
> +LIBPCAP_AUTORECONF = YES

Please add a comment here to explain the need for autoreconf.

baruch

> -# doesn't have an install-strip
> -LIBPCAP_INSTALL_TARGET_OPT= DESTDIR="$(TARGET_DIR)" \
> -	$(if $(BR2_PREFER_STATIC_LIB),install,install-shared)
> -LIBPCAP_INSTALL_STAGING_OPT= DESTDIR="$(STAGING_DIR)" install \
> -	$(if $(BR2_PREFER_STATIC_LIB),,install-shared)
>  LIBPCAP_DEPENDENCIES = zlib \
>  	$(if $(BR2_PACKAGE_LIBUSB),libusb)
>  LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
