From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 17:12:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libv4l: v4l-utils need locale
In-Reply-To: <1448859698-20684-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Mon, 30 Nov 2015 06:01:38 +0100")
References: <1448859698-20684-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87r3j7lb42.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > To reproduce the setlocale-related build error use this minimal
 > defconfig:

 > BR2_TOOLCHAIN_BUILDROOT_CXX=y
 > BR2_PACKAGE_LIBV4L=y
 > BR2_PACKAGE_LIBV4L_UTILS=y

 > After enabling locale support the build error is fixed:

 > BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 > BR2_TOOLCHAIN_BUILDROOT_CXX=y
 > BR2_PACKAGE_LIBV4L=y
 > BR2_PACKAGE_LIBV4L_UTILS=y

 > Fixes
 > http://autobuild.buildroot.net/results/f2e/f2e4e34fb14ce355a6e92afc83024b0445f52513/
 > http://autobuild.buildroot.net/results/fe5/fe56063ddd2232fea7699f5117497beb3deca11e/
 > http://autobuild.buildroot.net/results/1be/1be55f096ddef2aa38fdba681ed97cf74905477a/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/libv4l/Config.in | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
 > index 16dc6bb..8d7eca1 100644
 > --- a/package/libv4l/Config.in
 > +++ b/package/libv4l/Config.in
 > @@ -23,6 +23,7 @@ comment "libv4l JPEG support not enabled"
 
 >  config BR2_PACKAGE_LIBV4L_UTILS
 >  	bool "v4l-utils tools"
 > +	depends on BR2_ENABLE_LOCALE

This is really a bug in v4l-utils. The configure has the normal
--disable-nls logic but the code calls setlocale() / bindtextdomain()
outside #ifdef ENABLE_NLS.

Funny enough uClibc does provide a dummy setlocale() implementation even
when building without locale support, but the v4l-utils code protects
the locale.h include with ENABLE_NLS, so this particular build error is
really about a missing #include <locale.h>

With that said, simply disallowing !locale builds seems to be the
simplest approach for 2015.11, so I've committed it.

It would be good if you could work with upstream to fix their code
though.

-- 
Bye, Peter Korsgaard
