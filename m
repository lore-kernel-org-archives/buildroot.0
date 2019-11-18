From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 Nov 2019 21:24:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with jsoncpp
Message-ID: <20191118202452.394708-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

domoticz embeds its own version of jsoncpp that can clash with upstream
jsoncpp so retrieve upstream commit that fix this issue

Build failures started after jsoncpp bumps from 1.8.4 to 1.9.1

Fixes:
 - http://autobuild.buildroot.org/results/a73406eb780a454369ea997654b6b4c6b3757a41

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...onfuse-local-files-with-system-files.patch | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/domoticz/0005-Fix-include-paths-to-not-confuse-local-files-with-system-files.patch

diff --git a/package/domoticz/0005-Fix-include-paths-to-not-confuse-local-files-with-system-files.patch b/package/domoticz/0005-Fix-include-paths-to-not-confuse-local-files-with-system-files.patch
new file mode 100644
index 0000000000..63da572b65
--- /dev/null
+++ b/package/domoticz/0005-Fix-include-paths-to-not-confuse-local-files-with-system-files.patch
@@ -0,0 +1,76 @@
+From 23f69284cb1ce1a98885b29a6126ebdbee735e7d Mon Sep 17 00:00:00 2001
+From: Daniel Wallner <14888585+danielwallner@users.noreply.github.com>
+Date: Thu, 17 Oct 2019 07:31:43 +0200
+Subject: [PATCH] Fix include paths to not confuse local files with system
+ files (json/json.h) (#3669)
+
+[Retrieved from:
+https://github.com/domoticz/domoticz/commit/23f69284cb1ce1a98885b29a6126ebdbee735e7d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ hardware/1Wire/1WireForWindows.cpp   |  2 +-
+ hardware/plugins/PluginManager.cpp   | 16 ++++++++--------
+ hardware/plugins/PluginProtocols.cpp |  8 ++++----
+ 3 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/hardware/1Wire/1WireForWindows.cpp b/hardware/1Wire/1WireForWindows.cpp
+index cf0b42795d..2044882fb9 100644
+--- a/hardware/1Wire/1WireForWindows.cpp
++++ b/hardware/1Wire/1WireForWindows.cpp
+@@ -4,7 +4,7 @@
+ #include "1WireForWindows.h"
+ #include "../../main/Logger.h"
+ #include <boost/optional.hpp>
+-#include "../json/json.h"
++#include "../../json/json.h"
+ #include <WS2tcpip.h>
+ 
+ #define _1WIRE_SERVICE_PORT "1664"
+diff --git a/hardware/plugins/PluginManager.cpp b/hardware/plugins/PluginManager.cpp
+index 793934121e..4276fe2fbc 100644
+--- a/hardware/plugins/PluginManager.cpp
++++ b/hardware/plugins/PluginManager.cpp
+@@ -14,14 +14,14 @@
+ #include "PluginMessages.h"
+ #include "PluginTransports.h"
+ 
+-#include "../main/Helper.h"
+-#include "../main/Logger.h"
+-#include "../main/SQLHelper.h"
+-#include "../main/WebServer.h"
+-#include "../main/mainworker.h"
+-#include "../main/EventSystem.h"
+-#include "../json/json.h"
+-#include "../main/localtime_r.h"
++#include "../../main/Helper.h"
++#include "../../main/Logger.h"
++#include "../../main/SQLHelper.h"
++#include "../../main/WebServer.h"
++#include "../../main/mainworker.h"
++#include "../../main/EventSystem.h"
++#include "../../json/json.h"
++#include "../../main/localtime_r.h"
+ #ifdef WIN32
+ #	include <direct.h>
+ #else
+diff --git a/hardware/plugins/PluginProtocols.cpp b/hardware/plugins/PluginProtocols.cpp
+index f19731e1a4..8b1ae4c3e7 100644
+--- a/hardware/plugins/PluginProtocols.cpp
++++ b/hardware/plugins/PluginProtocols.cpp
+@@ -7,12 +7,12 @@
+ 
+ #include "PluginMessages.h"
+ #include "PluginProtocols.h"
+-#include "../main/Helper.h"
+-#include "../main/Logger.h"
+-#include "../webserver/Base64.h"
++#include "../../main/Helper.h"
++#include "../../main/Logger.h"
++#include "../../webserver/Base64.h"
+ #include "icmp_header.hpp"
+ #include "ipv4_header.hpp"
+-#include "../json/json.h"
++#include "../../json/json.h"
+ 
+ namespace Plugins {
+ 
-- 
2.24.0
