From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 23:50:00 +0100
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.8.0-beta
In-Reply-To: <1478601048-21388-2-git-send-email-anaumann@ultratronik.de>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <1478601048-21388-2-git-send-email-anaumann@ultratronik.de>
Message-ID: <ddc8a62d-18c3-2475-f711-7a7feb64a730@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 11:30, Andreas Naumann wrote:
> Removed all hashes (until final release).

 Review would have been easier if you did that in a separate patch.

> 
> - qt5base: renamed library to EglFSDeviceIntegration ([1])
> - qt5base: remove ras-pi patch

 You should mention in the commit message why: (applied upstream).

> - qt5base: remove obsolete config-option -large ([2])

 -largefile, not -large. Also mention explicitly what happened: largefile is not
always enabled.

> - qt5base: make the directfb platform plugin compile ([3])
> - qt53d/quickcontrols2/serialbus: move out of tech-preview

 I didn't see this in your patch?

> - qt5enginio: remove discontinued module

 This should have been done in a separate commit.

> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=ec4eb4db61094179bc6a9ec26ec68fb710177053
> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=84d3a21c9efe7efb2cce6d3bd14af1f9580b1108
> [3] Without this patch, qmake is looking for directfb_egl feature which usually is not
>     provided (only by some raspi mkspec afaics).
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

[snip]
> diff --git a/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
> new file mode 100644
> index 0000000..96cc3b0
> --- /dev/null
> +++ b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
> @@ -0,0 +1,22 @@

 Missing patch description + SoB. Also make it a git-formatted patch.

 For this patch, it is absolutely necessary to get upstream feedback because it
looks very iffy to me.

> +diff --git a/src/plugins/platforms/directfb/directfb.pro b/src/plugins/platforms/directfb/directfb.pro
> +index 406b89e..a83b09f 100644
> +--- a/src/plugins/platforms/directfb/directfb.pro
> ++++ b/src/plugins/platforms/directfb/directfb.pro
> +@@ -3,7 +3,7 @@ TARGET = qdirectfb
> + QT += \
> +     core-private gui-private \
> +     eventdispatcher_support-private service_support-private \
> +-    fontdatabase_support-private egl_support-private
> ++    fontdatabase_support-private
> + 
> + QMAKE_USE += directfb
> + 
> +@@ -27,7 +27,7 @@ HEADERS = qdirectfbintegration.h \
> +     qdirectfbeglhooks.h
> + 
> + # ### port the GL context
> +-qtConfig(directfb_egl) {
> ++contains(QT_CONFIG, directfb_egl) {

 Aren't these two equivalent? If this is being built for anything other than
linux-mipsel-broadcom-97425-g++, there is really something weird going on...

 Anyway, to make the patch correct, you should add QT += egl_support-private here.

 Regards,
 Arnout

> +     HEADERS += qdirectfb_egl.h
> +     SOURCES += qdirectfb_egl.cpp
> +     DEFINES += DIRECTFB_GL_EGL



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
