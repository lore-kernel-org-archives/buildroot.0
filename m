From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Sun,  2 Apr 2017 10:36:16 +0200
Subject: [Buildroot] [PATCH] package/synergy: bump to version 1.8.8 to fix
	build errors
Message-ID: <1491122176-24004-1-git-send-email-pieterjan.camerlynck@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building synergy on sparc, nios2, mipsel and mips64el would fail with
the following errors:
  src/lib/ipc/IpcClientProxy.cpp: In member function 'void IpcClientProxy::send(const IpcMessage&)':
  src/lib/ipc/IpcClientProxy.cpp:150:59: error: ISO C++ says that these are ambiguous, even though the worst conversion for the first is better than the worst conversion for the second: [-Werror]
     ProtocolUtil::writef(&m_stream, kIpcMsgLogLine, &logLine);
                                                             ^
  In file included from src/lib/ipc/IpcClientProxy.cpp:23:0:
  src/lib/ipc/../synergy/ProtocolUtil.h:82:16: note: candidate 1: static void ProtocolUtil::writef(void*, const char*, va_list)
    static void   writef(void*, const char* fmt, va_list);
                  ^
  src/lib/ipc/../synergy/ProtocolUtil.h:53:16: note: candidate 2: static void ProtocolUtil::writef(synergy::IStream*, const char*, ...)
    static void   writef(synergy::IStream*,
                  ^
  src/lib/ipc/../synergy/ProtocolUtil.h:82:16: error: 'static void ProtocolUtil::writef(void*, const char*, va_list)' is private
    static void   writef(void*, const char* fmt, va_list);
                  ^
  src/lib/ipc/IpcClientProxy.cpp:150:59: error: within this context
     ProtocolUtil::writef(&m_stream, kIpcMsgLogLine, &logLine);
                                                             ^
  At global scope:
  cc1plus: error: unrecognized command line option '-Wno-unused-local-typedef' [-Werror]
  cc1plus: all warnings being treated as errors

Fixed by upstream commits:
  https://github.com/symless/synergy/commit/c31f908fb283dadc1a34856796e2d7a9df7bbb77
  https://github.com/symless/synergy/commit/2643cea67bed960a3ae57ba881cd06f52843fa62

Fixes:
  http://autobuild.buildroot.net/results/dc40671874aac9ad491bd4c7aa57eb1c53484492
  http://autobuild.buildroot.net/results/a37905b0c93aa0dc891a85be1701e51cf2988cbe
  http://autobuild.buildroot.net/results/611895e29faba0b35b2b27005a5142192ed63fd8
  http://autobuild.buildroot.net/results/7bdd4428c1335593b04a18ce8e9705b0bc932484

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 package/synergy/synergy.hash | 2 +-
 package/synergy/synergy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/synergy/synergy.hash b/package/synergy/synergy.hash
index bbf196f..52f9d74 100644
--- a/package/synergy/synergy.hash
+++ b/package/synergy/synergy.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  d913005e911bb6e5aa459f88fe91b40d59c37ea7207399814e4d450fd8634ec1  synergy-v1.8.5-stable.tar.gz
+sha256  85c388f93881d741981ce3c675e840a52a76883cb2cea1da306c0c453c5d7d9b  synergy-v1.8.8-stable.tar.gz
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index a4053e3..76a4004 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYNERGY_VERSION = v1.8.5-stable
+SYNERGY_VERSION = v1.8.8-stable
 SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
 SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
-- 
2.7.4
