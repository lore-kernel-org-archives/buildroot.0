From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 17:19:46 +0200
Subject: [Buildroot] [git commit] package/thrift: security bump to v0.13
Message-ID: <20200408150721.D329F8E003@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20bf02ce18bc8bb9f2f5298e4c8a3c570fbe6691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch because the linker error no longer appears on br-x86-64-musl.

v0.13.0 fixes the following CVEs:

CVE-2019-0205: In Apache Thrift all versions up to and including 0.12.0,
a server or client may run into an endless loop when feed with specific
input data. Because the issue had already been partially fixed in version
0.11.0, depending on the installed version it affects only certain
language bindings.

CVE-2019-0210: In Apache Thrift 0.9.3 to 0.12.0, a server implemented
in Go using TJSONProtocol or TSimpleJSONProtocol may panic when feed with
invalid input data.

Also update the hash file to the new two-spaces convention

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ep-TPipedTransport-peek-to-avoid-linker-e.patch | 31 ----------------------
 package/thrift/thrift.hash                         |  6 ++---
 package/thrift/thrift.mk                           |  2 +-
 3 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch b/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch
deleted file mode 100644
index 92c55d05a4..0000000000
--- a/package/thrift/0001-Force-to-keep-TPipedTransport-peek-to-avoid-linker-e.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f87ae3963e651fe9f4b3125192c77aae86c007e0 Mon Sep 17 00:00:00 2001
-From: Patrick Havelange <patrick.havelange@essensium.com>
-Date: Mon, 21 Jan 2019 09:49:23 +0100
-Subject: [PATCH] Force to keep TPipedTransport::peek() to avoid linker error.
-
-Otherwise got the "defined in discarded section" linker error
-with x86-64-musl toolchain. This is probably a toolchain issue - the
-compiler shouldn't remove that function.
-
-Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
-Upstream-status: Not Applicable
----
- lib/cpp/src/thrift/transport/TTransportUtils.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/cpp/src/thrift/transport/TTransportUtils.h b/lib/cpp/src/thrift/transport/TTransportUtils.h
-index f3b4c5a..7589182 100644
---- a/lib/cpp/src/thrift/transport/TTransportUtils.h
-+++ b/lib/cpp/src/thrift/transport/TTransportUtils.h
-@@ -114,7 +114,7 @@ public:
- 
-   bool isOpen() { return srcTrans_->isOpen(); }
- 
--  bool peek() {
-+  bool __attribute__ ((used)) peek() {
-     if (rPos_ >= rLen_) {
-       // Double the size of the underlying buffer if it is full
-       if (rLen_ == rBufSize_) {
--- 
-2.17.1
-
diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index 7aca8b5a7e..f342dc348d 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/thrift/0.12.0/thrift-0.12.0.tar.gz.sha256
-sha256  c336099532b765a6815173f62df0ed897528a9d551837d627c1f87fadad90428	thrift-0.12.0.tar.gz
+# From https://www.apache.org/dist/thrift/0.13.0/thrift-0.13.0.tar.gz.sha256
+sha256  7ad348b88033af46ce49148097afe354d513c1fca7c607b59c33ebb6064b5179  thrift-0.13.0.tar.gz
 # License files, locally calculated
-sha256  23df881cec3192d1f4474633c14eb2ec30a45b84f8daeb82b9de5d2bd3ac8218        LICENSE
+sha256  23df881cec3192d1f4474633c14eb2ec30a45b84f8daeb82b9de5d2bd3ac8218  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 4260fe7e1c..8ad37b6b2e 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.12.0
+THRIFT_VERSION = 0.13.0
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
