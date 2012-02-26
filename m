From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 09:45:32 -0200
Subject: [Buildroot] [PATCH 2/2] vlc: Patch to get it compiling with
	qt-embedded
In-Reply-To: <1330256732-26483-1-git-send-email-ismael.luceno@gmail.com>
References: <1330256732-26483-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1330256732-26483-2-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .../multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch

diff --git a/package/multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch b/package/multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch
new file mode 100644
index 0000000..61cd586
--- /dev/null
+++ b/package/multimedia/vlc/vlc-qt-4.8-embedded-fixes.patch
@@ -0,0 +1,33 @@
+--- a/modules/gui/qt4/qt4.cpp	2012-02-23 22:42:45.760340077 -0200
++++ b/modules/gui/qt4/qt4.cpp	2012-02-24 00:13:04.878082822 -0200
+@@ -627,21 +627,19 @@
+     unsigned i_width = cfg->width;
+     unsigned i_height = cfg->height;
+ 
+-#if defined (Q_WS_X11)
+-    p_wnd->handle.xid = p_mi->getVideo( &i_x, &i_y, &i_width, &i_height );
+-    if( !p_wnd->handle.xid )
++    void *tmp = (void*)p_mi->getVideo( &i_x, &i_y, &i_width, &i_height );
++
++    if ( !tmp )
+         return VLC_EGENERIC;
++#if defined (Q_WS_X11)
++    p_wnd->handle.xid = tmp;
+     p_wnd->display.x11 = NULL;
+-
+ #elif defined (Q_WS_WIN) || defined(Q_WS_PM)
+-    p_wnd->handle.hwnd = (void *)p_mi->getVideo( &i_x, &i_y, &i_width, &i_height );
+-    if( !p_wnd->handle.hwnd )
+-        return VLC_EGENERIC;
+-
++    p_wnd->handle.hwnd = tmp;
+ #elif defined (Q_WS_MAC)
+-    p_wnd->handle.nsobject = (void *)p_mi->getVideo( &i_x, &i_y, &i_width, &i_height );
+-    if( !p_wnd->handle.nsobject )
+-        return VLC_EGENERIC;
++    p_wnd->handle.nsobject = tmp;
++#elif defined (Q_WS_QWS)
++# warning QWS support not implemented!
+ #else
+ # error FIXME
+ #endif
-- 
1.7.9.1
