From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 16 Aug 2017 15:10:44 -0400
Subject: [Buildroot] can't build qt5webkit for raspberry pi 3
In-Reply-To: <a6c22850-0224-c263-123d-197392f48615@mind.be>
References: <20170815114148.42777e85@brock-desktop>
 <20170815210235.3uvthq2bk5zoxluo@gportay>
 <a6c22850-0224-c263-123d-197392f48615@mind.be>
Message-ID: <20170816191044.h7uqxauoeuihrs5l@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Brock,

On Tue, Aug 15, 2017 at 11:24:54PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 15-08-17 23:02, Ga?l PORTAY wrote:
> > Hello Brock,
> > 
> > On Tue, Aug 15, 2017 at 11:41:48AM -0600, Brock Williams wrote:
> >> I'm not able to build qt5webkit for a pi 3 from master.  It works for pi
> >> 2. Here is the error:
> >>
> >> In file included from ./config.h:30:0,
> >>                  from wtf/CurrentTime.cpp:34:
> >> ./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
> >>  #    error "Not supported ARM architecture"
> >>       ^~~~~
> >>
> >> I've attached the defconfig that we are using.  This is based on the
> >> raspberrypi3_defconfig with what I think is just the minimum to build
> >> qt5webkit added.  For now we have just configured
> >> the build down to the pi 2 cpu settings.
> >>
> >> Brock
> >>
> > The CPU of rpi3 has moved from cortex-a8 (armv7) to cortex-a53 (armv8) in the
> > raspberrypi3_defconfig. And Qt WebKit do not support for armv8.

I was able to build qt5webkit with this following chunk (5.9.1).

diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
index 562840cf7..3722c2e9a 100644
--- a/Source/WTF/wtf/Platform.h
+++ b/Source/WTF/wtf/Platform.h
@@ -287,6 +287,13 @@
     || defined(__ARM_ARCH_7S__)
 #define WTF_THUMB_ARCH_VERSION 4
 
+#elif defined(__ARM_ARCH_8__) \
+    || defined(__ARM_ARCH_8A__) \
+    || defined(__ARM_ARCH_8M__) \
+    || defined(__ARM_ARCH_8R__) \
+    || defined(__ARM_ARCH_8S__)
+#define WTF_CPU_ARM_TRADITIONAL 1
+
 /* RVCT sets __TARGET_ARCH_THUMB */
 #elif defined(__TARGET_ARCH_THUMB)
 #define WTF_THUMB_ARCH_VERSION __TARGET_ARCH_THUMB

I reverted the following commit to get qt5webkit-examples back to be able to
test QtWebKit on rpi3. It worked.

	940bfe2f43 package/qt5webkit-examples: remove obsolete package

Also, I had to compile opengl module (BR2_PACKAGE_QT5BASE_OPENGL_LIB) to make
qt5webkit examples fully fonctionnal. Some works (display something), some does
not. For example, whithout opengl module, flickrview complains with this message.

	# ./flickrview
	QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
	Unable to query physical screen size, defaulting to 100 dpi.
	To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).
	QtWebProcess: error while loading shared libraries: libQt5OpenGL.so.5: cannot open shared object file: No such file or directory

I do not know if webkit really needs the opengl module. If yes, maybe the module
should be selected by BR2_PACKAGE_QT5WEBKIT.

Furthermore, since webkit has returned from the dead packages, maybe the
qt5webkit-examples should return as well.

Arnout, I made some patches for that.

Regards,
Gael
