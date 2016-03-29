From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 29 Mar 2016 16:18:44 +0200
Subject: [Buildroot] [PATCH] qt5webkit: restore package
In-Reply-To: <8381be78-db51-4a5c-aeaf-cba1f4f432ed@MAIL-SINTERS-01.sinters-int.fr>
References: <1459255689-21551-1-git-send-email-gary.bisson@boundarydevices.com>
 <8381be78-db51-4a5c-aeaf-cba1f4f432ed@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <CAAMH-ysVOEmyv55yX23ZCYUNymLgn++d0SYO4F9OvjxrGeN=ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On Tue, Mar 29, 2016 at 3:34 PM, Julien CORJON <corjon.j@ecagroup.com> wrote:
>
> Hi Gary, All,
>
> I was also working on that one but with a different strategy (i've just
> revert my previous commit and fix version of QtWebkit to 5.5.1). Since
> you already do the job to backport yocto integration I will stop mine ;)

I didn't know you were working on it. I just really need this package
for several projects which explains why I did it fast.

> Le 29/03/2016 14:48, Gary Bisson a ?crit :
> > Although this package has been removed from the official release
> > packages since Qt5.6.0, it is still available for users to build
> > it from source. This is useful for platforms without GPU since its
> > successor (QtWebEngine) requires OpenGL support.
>
> I'm agree with that. I did not realize that platform without GPU cannot
> do web-browsing anymore when i bumped Qt in 5.6.0 version.

Plus the fact that QtWebEngine isn't part of Buildroot yet.

> > The package now matches the community-based meta-qt5 Yocto layer,
> > using the exact same revision of the qtwebkit source from github:
> > https://github.com/meta-qt5/meta-qt5/commit/e434995a
> >
> > Here is the project source tree:
> > https://github.com/qtproject/qtwebkit
> >
> > All the patches have been pulled from Yocto as well.
> >
> > Since we are now using the source from the git repository, we need
> > to create an empty .git/ folder to force the headers re-generation.
> > https://github.com/meta-qt5/meta-qt5/blob/jethro/recipes-qt/qt5/qt5.inc#L33
> >
> > Note that GPLv3 license option has been added with this release.
> >
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> > Hi all,
> >
> > Since I've had to pull this package back for Qt5.6 I thought I'd share
> > although I'm not sure you want it since you just removed it.
> >
> > Julien, I've used the github repo instead of the code.qt.io repo that
> > you suggested in order to match exactly the meta-qt5 layer.
> > http://lists.busybox.net/pipermail/buildroot/2016-March/156824.html
>
> You can use the exact same commit from official repository
> http://code.qt.io/cgit/qt/qtwebkit.git/commit/?id=d2ff5a085572b1ee24dcb42ae107063f3142d14e
> but I understand that code.qt.io do not have the sames Buildroot helper
> than github.

Yes but I really wanted to do the same as Yocto, since they are using
the github repo, so do I.
https://github.com/meta-qt5/meta-qt5/blob/master/conf/layer.conf#L30

> > At first the build failed because of the headers generation which
> > requires to add a .git/ folder as explained in the log.
> >
> > Tested on i.MX6Q Nitrogen6x platform.
> >
> > Regards,
> > Gary
> > ---
> >   Config.in.legacy                                   |  7 --
> >   package/qt5/Config.in                              |  1 +
> >   .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     | 30 ++++++++
> >   .../qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch | 79 ++++++++++++++++++++++
> >   ...ude-backtrace-API-for-non-glibc-libraries.patch | 38 +++++++++++
> >   .../0004-Fix-linking-with-libpthread.patch         | 33 +++++++++
> >   package/qt5/qt5webkit/Config.in                    | 24 +++++++
> >   package/qt5/qt5webkit/qt5webkit.hash               |  2 +
> >   package/qt5/qt5webkit/qt5webkit.mk                 | 58 ++++++++++++++++
> >   9 files changed, 265 insertions(+), 7 deletions(-)
> >   create mode 100644 package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> >   create mode 100644 package/qt5/qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch
> >   create mode 100644 package/qt5/qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
> >   create mode 100644 package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch
> >   create mode 100644 package/qt5/qt5webkit/Config.in
> >   create mode 100644 package/qt5/qt5webkit/qt5webkit.hash
> >   create mode 100644 package/qt5/qt5webkit/qt5webkit.mk
> >
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 60702ce..6691c50 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -152,13 +152,6 @@ config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
> >         The qt5webkit-examples package has been removed, since it
> >         was removed from upstream starting from Qt 5.6.
> >
> > -config BR2_PACKAGE_QT5WEBKIT
> > -     bool "qt5webkit package removed"
> > -     select BR2_LEGACY
> > -     help
> > -       The qt5webkit package has been removed, since it was removed
> > -       from upstream starting from Qt 5.6.
> > -
> >   config BR2_PACKAGE_QT5QUICK1
> >       bool "qt5quick1 package removed"
> >       select BR2_LEGACY
> > diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> > index f673daa..0c0e971 100644
> > --- a/package/qt5/Config.in
> > +++ b/package/qt5/Config.in
> > @@ -49,4 +49,5 @@ source "package/qt5/qt5x11extras/Config.in"
> >   source "package/qt5/qt5xmlpatterns/Config.in"
> >   comment "legacy compatibility"
> >   source "package/qt5/qt5script/Config.in"
>
> You should probably add an "unsupported version" comment to differ from
> "legacy compatibility" which is still support by Qt community but tagged
> as deprecated.

Yes I wasn't sure about that actually, "unsupported packages" might be
better. Anyone else has a suggestions on the comment name? I've let
legacy for now since it is still true.

> > +source "package/qt5/qt5webkit/Config.in"
> >   endif
> > diff --git a/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> > new file mode 100644
> > index 0000000..e8b0e43
> > --- /dev/null
> > +++ b/package/qt5/qt5webkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
> > @@ -0,0 +1,30 @@
> > +From 1735a8484ef9ae336f8d607b56bda64c8af10c79 Mon Sep 17 00:00:00 2001
> > +From: Trevor Woerner <trevor.woerner@linaro.org>
> > +Date: Fri, 7 Feb 2014 04:07:17 +0100
> > +Subject: [PATCH 1/3] qtwebkit: fix QA issue (bad RPATH)
> > +
> > +Building qtwebkit causes a QA issue such that QtWebPluginProcess and
> > +QtWebProcess contain bad RPATHs which point into the build location. This fix
> > +adds a patch to not include the rpath.prf which causes this problem.
> > +
> > +Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> You should add your signed-off-by and maybe a Upstream-status if you
> find the information.

Not sure I should, I've done absolutely nothing in regard to that
patch apart from a 'cp' command from the Yocto layer to Buildroot.

As for the upstream status I can try to find out.

> > <snip>
> > +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> > +QT5WEBKIT_DEPENDENCIES += qt5declarative
> > +endif
> > +
> > +define QT5WEBKIT_CONFIGURE_CMDS
>
> You should add a comment to describe the reason to create .git folder.

Yes you are right, I will, especially since I hated wasting time
building the packages x number of times because of a missing folder.

> > +     mkdir -p $(@D)/.git || true
>
> is `|| true` really needed?

No you're right it is useless. In the case of Yocto, this is the last
do_configure_prepend command so I guess they just want to make sure to
return a good value even if the folder already exists.

I'll submit a V2 once we've decided the comment name for this package.

Thanks for you review.

Regards,
Gary
