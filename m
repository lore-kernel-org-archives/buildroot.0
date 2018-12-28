From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 28 Dec 2018 01:34:48 +0100
Subject: [Buildroot] [RFC 0/3] WPE WebKit
In-Reply-To: <20181223154845.23556-1-francois.perrad@gadz.org>
References: <20181223154845.23556-1-francois.perrad@gadz.org>
Message-ID: <20181228013448.GB19602@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

I had been thinking myself of submitting a patch series for WPE, and at Igalia
we are maintaining an overlay (to be used with BR2_EXTERNAL, which can be
found at https://github.com/Igalia/buildroot-wpe). I have had plenty to do in
the latest few months, so I barely haven't had any time for Buildroot other
than updating the WebKitGTK+ packaging whenever there is a release -- so
thanks a lot for helping out by submitting this patch set :)

Later I will be doing a few comments on each of the individual patches. As for
general comments:

- It looks like you took the basis for your patch set from the *downstream*
  fork of Buildroot at https://github.com/WebPlatformForEmbedded/buildroot
  Please do NOT use anything from there, as it is based on a very old version
  of Buildroot, and it packages versions of the ?wpewebkit? package older
  than the official packages releases from https://wpewebkit.org

- The way I was hoping to do the WPE packaging for upstream Buildroot was to
  reuse as many bits and pieces as possible from the WebKitGTK+ packaging,
  and share code with the WPE packaging. For example: right now there is a
  BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS configuration symbol, and in the WPE
  overlay I mentioned above there is BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS...
  ideally we would have a single BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS, which
  gets used both by the ?wpewebkit? and ?webkitgtk? packages (the same would
  go for the logic that determines whether the target supports the JSC JIT,
  and others). I'll follow up on this in a different e-mail.

- I would like to allow building more backends than WPEBackend-fdo. More
  precisely, WPEBackend-rdk is a good option to use dispmanx on the Raspberry
  Pi directly, without needing a Wayland compositor.

- It would be good as well to have a launcher/browser which is NOT the
  MiniBrowser included with the ?wpewebkit? package, which is intended just
  for testing. The better option at the moment is Cog, for which I have
  recently started doing packaged releases as well, and it is known to work
  with the -fdo and -rdk backends (and others which are not publicly available
  as well). It can be found at https://github.com/Igalia/cog

Please note that I am not trying to demotivate you with all the comments
above, I think it's awesome that third parties are finding WPE useful and
want to help out with the upstream packaging in Buildroot: that is *awesome*
and super appreciated -- I just want to share my ideas in the mailing list
to see what we all agree is th way go to provide the best packaging we can
for WPE :)


On Sun, 23 Dec 2018 16:48:42 +0100, Francois Perrad <fperrad@gmail.com> wrote:

> Another port of WebKit (https://wpewebkit.org/), a project started in 2018.
> 
> Testing fresh code of various OpenGL backends is awful.

What do you mean with this? Does this have to do with the packaging/testing of
the different WPE backends, or is it something else? I am really interested in
knowing what your pain points have been, to see if there is something that we
can improve (and here I am talking with my ?WebKit developer hat? on :D).

> Francois Perrad (3):
>   libwpe: new package
>   wpebackend-fdo: new package
>   wpewebkit: new package
> 
>  DEVELOPERS                                 |  3 +
>  package/Config.in                          |  3 +
>  package/libwpe/Config.in                   | 12 ++++
>  package/libwpe/libwpe.hash                 |  7 ++
>  package/libwpe/libwpe.mk                   | 15 ++++
>  package/wpebackend-fdo/Config.in           | 17 +++++
>  package/wpebackend-fdo/wpebackend-fdo.hash |  7 ++
>  package/wpebackend-fdo/wpebackend-fdo.mk   | 15 ++++
>  package/wpewebkit/Config.in                | 82 ++++++++++++++++++++++
>  package/wpewebkit/wpewebkit.hash           |  8 +++
>  package/wpewebkit/wpewebkit.mk             | 69 ++++++++++++++++++
>  11 files changed, 238 insertions(+)
>  create mode 100644 package/libwpe/Config.in
>  create mode 100644 package/libwpe/libwpe.hash
>  create mode 100644 package/libwpe/libwpe.mk
>  create mode 100644 package/wpebackend-fdo/Config.in
>  create mode 100644 package/wpebackend-fdo/wpebackend-fdo.hash
>  create mode 100644 package/wpebackend-fdo/wpebackend-fdo.mk
>  create mode 100644 package/wpewebkit/Config.in
>  create mode 100644 package/wpewebkit/wpewebkit.hash
>  create mode 100644 package/wpewebkit/wpewebkit.mk
> 
> -- 
> 2.17.1

Best regards, and thanks again for bringing up the topic of WPE packaging!


-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181228/00034d54/attachment.asc>
