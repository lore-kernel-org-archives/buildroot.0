From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 22 Feb 2019 16:46:30 +0200
Subject: [Buildroot] [PATCH RFC/next 1/4] package/webkit: new home for
 GTK and WPE WebKit components
In-Reply-To: <CAB0FRsvJuxkJ03b5RpmsPPbymOvxpwxGQjgF_EJxxUPRRvvyBQ@mail.gmail.com>
References: <20190218171719.18721-1-aperez@igalia.com>
 <20190218171719.18721-2-aperez@igalia.com>
 <CAB0FRsvJuxkJ03b5RpmsPPbymOvxpwxGQjgF_EJxxUPRRvvyBQ@mail.gmail.com>
Message-ID: <20190222164630.GB20589@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Fri, 22 Feb 2019 11:40:20 +0100, Fran?ois Perrad <francois.perrad@gadz.org> wrote:
> Le lun. 18 f?vr. 2019 ? 18:17, Adrian Perez de Castro <aperez@igalia.com> a
> ?crit :
> 
> > Move the packages related to the GTK and WPE WebKit ports (webkitgtk,
> > libwpe, wpewebkit, wpebackend-fdo) under a new package/webkit/
> > subbdirectory as the first step to unify some of their configuration.
> >
> >
> Moving packages into a subdirectory is discouraged,
> see https://buildroot.org/downloads/manual/manual.html#_package_directory

On the other hand, while adding new subdirectories is discouraged, it is
not forbidden. In this case I thought that it could make sense grouping the
the (very related) WebKit packages. Also note that I expect to be adding a
more in the future [1].

That being said, I am of course open to alternative suggestions, and in
particular knowing where the common parts that this patch set adds into
?webkit/webkit.mk? and ?webkit/Config.in? would go in the case of not
making a subdirectory to group the related packages. Any ideas?

Cheers,


-Adri?n


> Fran?ois
> 
> 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/Config.in                                       | 8 ++++----
> >  package/{ => webkit}/libwpe/Config.in                   | 0
> >  package/{ => webkit}/libwpe/libwpe.hash                 | 0
> >  package/{ => webkit}/libwpe/libwpe.mk                   | 0
> >  package/webkit/webkit.mk                                | 7 +++++++
> >  package/{ => webkit}/webkitgtk/Config.in                | 0
> >  package/{ => webkit}/webkitgtk/webkitgtk.hash           | 0
> >  package/{ => webkit}/webkitgtk/webkitgtk.mk             | 0
> >  package/{ => webkit}/wpebackend-fdo/Config.in           | 0
> >  package/{ => webkit}/wpebackend-fdo/wpebackend-fdo.hash | 0
> >  package/{ => webkit}/wpebackend-fdo/wpebackend-fdo.mk   | 0
> >  package/{ => webkit}/wpewebkit/Config.in                | 0
> >  package/{ => webkit}/wpewebkit/wpewebkit.hash           | 0
> >  package/{ => webkit}/wpewebkit/wpewebkit.mk             | 0
> >  14 files changed, 11 insertions(+), 4 deletions(-)
> >  rename package/{ => webkit}/libwpe/Config.in (100%)
> >  rename package/{ => webkit}/libwpe/libwpe.hash (100%)
> >  rename package/{ => webkit}/libwpe/libwpe.mk (100%)
> >  create mode 100644 package/webkit/webkit.mk
> >  rename package/{ => webkit}/webkitgtk/Config.in (100%)
> >  rename package/{ => webkit}/webkitgtk/webkitgtk.hash (100%)
> >  rename package/{ => webkit}/webkitgtk/webkitgtk.mk (100%)
> >  rename package/{ => webkit}/wpebackend-fdo/Config.in (100%)
> >  rename package/{ => webkit}/wpebackend-fdo/wpebackend-fdo.hash (100%)
> >  rename package/{ => webkit}/wpebackend-fdo/wpebackend-fdo.mk (100%)
> >  rename package/{ => webkit}/wpewebkit/Config.in (100%)
> >  rename package/{ => webkit}/wpewebkit/wpewebkit.hash (100%)
> >  rename package/{ => webkit}/wpewebkit/wpewebkit.mk (100%)
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 420e6e95a3..65faf1fcd6 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1304,7 +1304,6 @@ menu "Graphics"
> >         source "package/libva-intel-driver/Config.in"
> >         source "package/libvdpau/Config.in"
> >         source "package/libvips/Config.in"
> > -       source "package/libwpe/Config.in"
> >         source "package/menu-cache/Config.in"
> >         source "package/opencv/Config.in"
> >         source "package/opencv3/Config.in"
> > @@ -1320,11 +1319,12 @@ menu "Graphics"
> >         source "package/wayland/Config.in"
> >         source "package/wayland-protocols/Config.in"
> >         source "package/waylandpp/Config.in"
> > -       source "package/webkitgtk/Config.in"
> > +       source "package/webkit/webkitgtk/Config.in"
> > +       source "package/webkit/libwpe/Config.in"
> > +       source "package/webkit/wpebackend-fdo/Config.in"
> > +       source "package/webkit/wpewebkit/Config.in"
> >         source "package/webp/Config.in"
> >         source "package/woff2/Config.in"
> > -       source "package/wpebackend-fdo/Config.in"
> > -       source "package/wpewebkit/Config.in"
> >         source "package/zbar/Config.in"
> >         source "package/zxing-cpp/Config.in"
> >  endmenu
> > diff --git a/package/libwpe/Config.in b/package/webkit/libwpe/Config.in
> > similarity index 100%
> > rename from package/libwpe/Config.in
> > rename to package/webkit/libwpe/Config.in
> > diff --git a/package/libwpe/libwpe.hash b/package/webkit/libwpe/libwpe.hash
> > similarity index 100%
> > rename from package/libwpe/libwpe.hash
> > rename to package/webkit/libwpe/libwpe.hash
> > diff --git a/package/libwpe/libwpe.mk b/package/webkit/libwpe/libwpe.mk
> > similarity index 100%
> > rename from package/libwpe/libwpe.mk
> > rename to package/webkit/libwpe/libwpe.mk
> > diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
> > new file mode 100644
> > index 0000000000..47e94d72f6
> > --- /dev/null
> > +++ b/package/webkit/webkit.mk
> > @@ -0,0 +1,7 @@
> >
> > +################################################################################
> > +#
> > +# Common definitions for the GTK and WPE WebKit ports.
> > +#
> >
> > +################################################################################
> > +
> > +include $(sort $(wildcard package/webkit/*/*.mk))
> > diff --git a/package/webkitgtk/Config.in
> > b/package/webkit/webkitgtk/Config.in
> > similarity index 100%
> > rename from package/webkitgtk/Config.in
> > rename to package/webkit/webkitgtk/Config.in
> > diff --git a/package/webkitgtk/webkitgtk.hash
> > b/package/webkit/webkitgtk/webkitgtk.hash
> > similarity index 100%
> > rename from package/webkitgtk/webkitgtk.hash
> > rename to package/webkit/webkitgtk/webkitgtk.hash
> > diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkit/webkitgtk/
> > webkitgtk.mk
> > similarity index 100%
> > rename from package/webkitgtk/webkitgtk.mk
> > rename to package/webkit/webkitgtk/webkitgtk.mk
> > diff --git a/package/wpebackend-fdo/Config.in
> > b/package/webkit/wpebackend-fdo/Config.in
> > similarity index 100%
> > rename from package/wpebackend-fdo/Config.in
> > rename to package/webkit/wpebackend-fdo/Config.in
> > diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash
> > b/package/webkit/wpebackend-fdo/wpebackend-fdo.hash
> > similarity index 100%
> > rename from package/wpebackend-fdo/wpebackend-fdo.hash
> > rename to package/webkit/wpebackend-fdo/wpebackend-fdo.hash
> > diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk
> > b/package/webkit/wpebackend-fdo/wpebackend-fdo.mk
> > similarity index 100%
> > rename from package/wpebackend-fdo/wpebackend-fdo.mk
> > rename to package/webkit/wpebackend-fdo/wpebackend-fdo.mk
> > diff --git a/package/wpewebkit/Config.in
> > b/package/webkit/wpewebkit/Config.in
> > similarity index 100%
> > rename from package/wpewebkit/Config.in
> > rename to package/webkit/wpewebkit/Config.in
> > diff --git a/package/wpewebkit/wpewebkit.hash
> > b/package/webkit/wpewebkit/wpewebkit.hash
> > similarity index 100%
> > rename from package/wpewebkit/wpewebkit.hash
> > rename to package/webkit/wpewebkit/wpewebkit.hash
> > diff --git a/package/wpewebkit/wpewebkit.mk b/package/webkit/wpewebkit/
> > wpewebkit.mk
> > similarity index 100%
> > rename from package/wpewebkit/wpewebkit.mk
> > rename to package/webkit/wpewebkit/wpewebkit.mk
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

---
[1] For example: https://github.com/WebPlatformForEmbedded/WPEBackend-rdk
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190222/8d77b316/attachment.asc>
