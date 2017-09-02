From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Sep 2017 22:54:21 +0200
Subject: [Buildroot] [PATCH v2 09/11] package/kodi: fix build with glibc 2.26
In-Reply-To: <20170902205423.21288-1-romain.naour@gmail.com>
References: <20170902205423.21288-1-romain.naour@gmail.com>
Message-ID: <20170902205423.21288-10-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi fail to build with glibc 2.26 release:
In file included from [...]/host/x86_64-buildroot-linux-gnu/include/c++/7.2.0/cmath:45:0,
                 from [...]/build/kodi-17.3-Krypton/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp:21:
[...]/build/kodi-17.3-Krypton/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp: In member function 'void CGUIDialogProgressBarHandle::SetProgress(int, int)':
[...]/build/kodi-17.3-Krypton/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp:55:13: error: '__builtin_isnan' is not a member of 'std'
   if (!std::isnan(fPercentage))
             ^
[...]/build/kodi-17.3-Krypton/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp:55:13: note: suggested alternative:
<built-in>: note:   '__builtin_isnan'

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...3-dialogs-fix-build-issue-with-glibc-2.26.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/kodi/0003-dialogs-fix-build-issue-with-glibc-2.26.patch

diff --git a/package/kodi/0003-dialogs-fix-build-issue-with-glibc-2.26.patch b/package/kodi/0003-dialogs-fix-build-issue-with-glibc-2.26.patch
new file mode 100644
index 0000000..5c12173
--- /dev/null
+++ b/package/kodi/0003-dialogs-fix-build-issue-with-glibc-2.26.patch
@@ -0,0 +1,37 @@
+From 55f51f883ba2d38509f0b9d0a5092a92af71f71e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 2 Sep 2017 19:06:57 +0200
+Subject: [PATCH] dialogs: fix build issue with glibc 2.26
+
+Kodi fail to build with glibc 2.26 release:
+In file included from [...]/host/x86_64-buildroot-linux-gnu/include/c++/7.2.0/cmath:45:0,
+                 from [...]/build/kodi-17.3-Krypton/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp:21:
+[...]/build/kodi-17.3-Krypton/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp: In member function 'void CGUIDialogProgressBarHandle::SetProgress(int, int)':
+[...]/build/kodi-17.3-Krypton/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp:55:13: error: '__builtin_isnan' is not a member of 'std'
+   if (!std::isnan(fPercentage))
+             ^
+[...]/build/kodi-17.3-Krypton/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp:55:13: note: suggested alternative:
+<built-in>: note:   '__builtin_isnan'
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/dialogs/GUIDialogExtendedProgressBar.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp b/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp
+index 42c2238..043a25f 100644
+--- a/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp
++++ b/xbmc/dialogs/GUIDialogExtendedProgressBar.cpp
+@@ -52,7 +52,7 @@ void CGUIDialogProgressBarHandle::SetTitle(const std::string &strTitle)
+ void CGUIDialogProgressBarHandle::SetProgress(int currentItem, int itemCount)
+ {
+   float fPercentage = (currentItem*100.0f)/itemCount;
+-  if (!std::isnan(fPercentage))
++  if (!isnan(fPercentage))
+     m_fPercentage = std::min(100.0f, fPercentage);
+ }
+ 
+-- 
+2.9.5
+
-- 
2.9.5
