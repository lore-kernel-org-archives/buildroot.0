From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Sep 2020 23:11:32 +0200
Subject: [Buildroot] [PATCH 1/3 v4] package/qt5/qt5webengine: fix
 ffmpeg/codec/alsa option handling for latest
In-Reply-To: <cover.1600290685.git.yann.morin.1998@free.fr>
References: <cover.1600290685.git.yann.morin.1998@free.fr>
Message-ID: <73c8adc83c7e856136f5eacd8aab44631b0a64cc.1600290685.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Ford <nford@westpond.com>

As of qt 5.10, options are handled as arguments to qmake instead of
defines:

    qt5webengine-5.12.2$ vi dist/changes-5.9.0

    Important Changes
    -----------------

     - Configure options are now handled by the global configure script. This
       means options previously controlled by WEBENGINE_CONFIG options should
       now use configure flags. For instance the configure command-line option
       -proprietary-codecs replaces WEBENGINE_CONFIG+=use_proprietary_codecs.

    qt5webengine-5.12.2$ vi dist/changes-5.10.0

    Important Changes
    -----------------

       * WebEngine Features are now configured as Qt features and
         WEBENGINE_CONFIG has been removed.

Fixes: #12416 (which was an inspiration for this patch)

Signed-off-by: Nathan Ford <nford@westpond.com>
[yann.morin.1998 at free.fr:
  - refresh on top of master, as we no longer have the version choice
  - extend commit log
  - mocve the new dependency to its own commit
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5webengine/qt5webengine.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 9101f35937..5df6942977 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -29,16 +29,16 @@ endif
 
 QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
 
-QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_system_ffmpeg
+QT5WEBENGINE_CONF_OPTS = -webengine-ffmpeg
 
 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
-QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_proprietary_codecs
+QT5WEBENGINE_CONF_OPTS += -webengine-proprietary-codecs
 endif
 
 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
 QT5WEBENGINE_DEPENDENCIES += alsa-lib
 else
-QT5WEBENGINE_CONF_OPTS += QT_CONFIG-=alsa
+QT5WEBENGINE_CONF_OPTS += -no-webengine-alsa
 endif
 
 # QtWebengine's build system uses python, but only supports python2. We work
-- 
2.20.1
