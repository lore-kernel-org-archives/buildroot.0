From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 18 Dec 2018 08:18:02 +0100
Subject: [Buildroot] [PATCH] package/netsurf: use TMP_PREFIX inside the
 build directory
In-Reply-To: <87ftuv3h31.fsf@dell.be.48ers.dk>
References: <20181217084710.16192-1-thomas.petazzoni@bootlin.com>
 <87ftuv3h31.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRsuqEGr+HHk9mhO_0Yr1_HAcj2aggZFGkXJ3UJ9UR6SP5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 17 d?c. 2018 ? 23:48, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > The netsurf build system creates a stamp file inside TMP_PREFIX to
>  > know if the build was done, and if the stamp file exists, it doesn't
>  > do any build. Therefore, having this stamp file in STAGING_DIR
>  > prevents from rebuilding netsurf, even after removing its entire build
>  > directory: the stamp file exists in STAGING_DIR, and netsurf doesn't
>  > build anything, causing the installation to fail.
>
>  > We fix this by putting this temporary directory inside the netsurf
>  > build directory.
>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > ---
>  >  package/netsurf/netsurf.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
>  > index e5a251b9c1..e4ed4fd1a7 100644
>  > --- a/package/netsurf/netsurf.mk
>  > +++ b/package/netsurf/netsurf.mk
>  > @@ -78,7 +78,7 @@ NETSURF_MAKE_OPTS = \
>  >      BUILD_CC="$(HOSTCC)" \
>  >      CC="$(TARGET_CC)" \
>  >      AR="$(TARGET_AR)" \
>  > -    TMP_PREFIX=$(STAGING_DIR)/usr \
>  > +    TMP_PREFIX=$(@D)/tmpusr \
>
> Why do we have to set it at all? It looks like it defaults to a
> directory under the build dir as well?
>
>
without TMP_PREFIX=$(STAGING_DIR)/usr, a fresh build fails with :
 COMPILE: src/stylesheet.c
In file included from src/stylesheet.c:12:
src/stylesheet.h:14:10: fatal error: libwapcaplet/libwapcaplet.h: No such
file or directory
 #include <libwapcaplet/libwapcaplet.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
/home/dev/checkout/BR/build/lime_netsurf_fb/build/netsurf-3.8/inst-framebuffer/share/netsurf-buildsystem/makefiles/Makefile.top:584:
recipe for target
'build-x86_64-linux-gnu-arm-linux-gnueabihf-release-lib-static/src_stylesheet.o'
failed
make[2]: ***
[build-x86_64-linux-gnu-arm-linux-gnueabihf-release-lib-static/src_stylesheet.o]
Error 1
make[2]: Leaving directory
'/home/dev/checkout/BR/build/lime_netsurf_fb/build/netsurf-3.8/libcss'
Makefile:119: recipe for target
'/home/dev/checkout/BR/build/lime_netsurf_fb/build/netsurf-3.8/inst-framebuffer/build-stamp'
failed
make[1]: ***
[/home/dev/checkout/BR/build/lime_netsurf_fb/build/netsurf-3.8/inst-framebuffer/build-stamp]
Error 2
make[1]: Leaving directory
'/home/dev/checkout/BR/build/lime_netsurf_fb/build/netsurf-3.8'
package/pkg-generic.mk:229: recipe for target
'/home/dev/checkout/BR/build/lime_netsurf_fb/build/netsurf-3.8/.stamp_built'
failed
make: ***
[/home/dev/checkout/BR/build/lime_netsurf_fb/build/netsurf-3.8/.stamp_built]
Error 2

Fran?ois



> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181218/47380e71/attachment.html>
