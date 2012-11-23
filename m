From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Nov 2012 10:09:00 +0100
Subject: [Buildroot] [PATCH 05/33] imagemagick: explicitly disable c++
	support if no c++ compiler available
In-Reply-To: <1353543503-8952-6-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 22 Nov 2012 01:17:55 +0100")
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-6-git-send-email-s.martin49@gmail.com>
Message-ID: <87haogfzyr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  package/imagemagick/imagemagick.mk | 6 ++++++
 Samuel>  1 file changed, 6 insertions(+)

 Samuel> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
 Samuel> index 61a379d..365a073 100644
 Samuel> --- a/package/imagemagick/imagemagick.mk
 Samuel> +++ b/package/imagemagick/imagemagick.mk
 Samuel> @@ -35,6 +35,12 @@ IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
 
 Samuel>  IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
 Samuel> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 Samuel> +IMAGEMAGICK_CONF_OPT = --with-magick-plus-plus
 Samuel> +else
 Samuel> +IMAGEMAGICK_CONF_OPT = --without-magick-plus-plus
 Samuel> +endif

Why? We set TARGET_CXX to 'false' if we don't have C++ support, and the
configure script seems to handle it OK. I just did a quick test build
with a minimal config:

BR2_arm=y
BR2_arm926t=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/br/arm926t/usr"
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_PACKAGE_IMAGEMAGICK=y

And I see the imagemagick configure script saying:

Magick++          --with-magick-plus-plus=yes	no (failed tests)

(and the build doesn't fail)

-- 
Bye, Peter Korsgaard
