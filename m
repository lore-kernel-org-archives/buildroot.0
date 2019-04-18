From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:25:28 +0200
Subject: [Buildroot] [git commit] package/botan: fix build with boost 1.70.0
Message-ID: <20190418092108.2F36287F43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=342ccf85b21ca2f306e3d8e064ac5e5eda62f511
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ca9dfcfd34365aa1476b718d4897a2e75f6983ac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-compat-issue-with-upcoming-Boost-1-70.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/botan/0002-Fix-compat-issue-with-upcoming-Boost-1-70.patch b/package/botan/0002-Fix-compat-issue-with-upcoming-Boost-1-70.patch
new file mode 100644
index 0000000000..bf89e6cfea
--- /dev/null
+++ b/package/botan/0002-Fix-compat-issue-with-upcoming-Boost-1-70.patch
@@ -0,0 +1,67 @@
+From 86df247e4f090f984e050962ed5a4a536ec63b33 Mon Sep 17 00:00:00 2001
+From: Ralf van der Enden <Ralf.vanderEnden@deltares.nl>
+Date: Fri, 5 Apr 2019 14:58:14 +0200
+Subject: [PATCH] boost 1.70 compatibility
+
+Fixes issue #82
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/randombit/botan/commit/f7148998ace97f2ad3a583685e6ed3c1f3b74c09]
+---
+ src/cli/tls_http_server.cpp | 8 +++++++-
+ src/cli/tls_proxy.cpp       | 8 +++++++-
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/cli/tls_http_server.cpp b/src/cli/tls_http_server.cpp
+index cc59a71c33..0a6428cd65 100644
+--- a/src/cli/tls_http_server.cpp
++++ b/src/cli/tls_http_server.cpp
+@@ -41,6 +41,12 @@
+ 
+ #include "credentials.h"
+ 
++#if BOOST_VERSION >= 107000
++#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
++#else
++#define GET_IO_SERVICE(s) ((s).get_io_service())
++#endif
++
+ namespace Botan_CLI {
+ 
+ namespace {
+@@ -435,7 +441,7 @@ class TLS_Asio_HTTP_Server final
+       session::pointer make_session()
+          {
+          return session::create(
+-                   m_acceptor.get_io_service(),
++                   GET_IO_SERVICE(m_acceptor),
+                    m_session_manager,
+                    m_creds,
+                    m_policy);
+diff --git a/src/cli/tls_proxy.cpp b/src/cli/tls_proxy.cpp
+index 49ffbe3766..42ce156b12 100644
+--- a/src/cli/tls_proxy.cpp
++++ b/src/cli/tls_proxy.cpp
+@@ -33,6 +33,12 @@
+ 
+ #include "credentials.h"
+ 
++#if BOOST_VERSION >= 107000
++#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
++#else
++#define GET_IO_SERVICE(s) ((s).get_io_service())
++#endif
++
+ namespace Botan_CLI {
+ 
+ namespace {
+@@ -370,7 +376,7 @@ class tls_proxy_server final
+       session::pointer make_session()
+          {
+          return session::create(
+-                   m_acceptor.get_io_service(),
++                   GET_IO_SERVICE(m_acceptor),
+                    m_session_manager,
+                    m_creds,
+                    m_policy,
