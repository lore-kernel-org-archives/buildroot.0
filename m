From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 20:26:55 +0100
Subject: [Buildroot] [git commit] package/gqrx: bump version to 2.13.2
Message-ID: <20201103193243.91CA286F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08fa25113a709e77f9919a5297d02d3b45c47a3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch now applied.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fy_placeholders_with_their_full_namespace.patch | 46 ----------------------
 package/gqrx/gqrx.hash                             |  2 +-
 package/gqrx/gqrx.mk                               |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/package/gqrx/0001-boost_qualify_placeholders_with_their_full_namespace.patch b/package/gqrx/0001-boost_qualify_placeholders_with_their_full_namespace.patch
deleted file mode 100644
index 919dc2da01..0000000000
--- a/package/gqrx/0001-boost_qualify_placeholders_with_their_full_namespace.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0510f6ffee646171bb105e0e8d016ac35e606cd4 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Mon, 22 Jun 2020 15:45:20 +0200
-Subject: [PATCH] qualify placeholders with their full namespace
-
-With boost >= 1.73, placeholders must be qualified by using the full namespace.
-
-Without the namespace, the build fails with:
-gqrx-2.12.1/src/dsp/rds/parser_impl.cc: In constructor 'gr::rds::parser_impl::parser_impl(bool, bool)':
-gqrx-2.12.1/src/dsp/rds/parser_impl.cc:42:72: error: '_1' was not declared in this scope
-set_msg_handler(pmt::mp("in"), boost::bind(&parser_impl::parse, this, _1));
-
-[Upstream status: https://github.com/csete/gqrx/pull/811]
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- src/dsp/rds/parser_impl.cc | 2 +-
- src/dsp/rx_rds.cpp         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/dsp/rds/parser_impl.cc b/src/dsp/rds/parser_impl.cc
-index b10fdb01..07dae038 100644
---- a/src/dsp/rds/parser_impl.cc
-+++ b/src/dsp/rds/parser_impl.cc
-@@ -40,7 +40,7 @@ parser_impl::parser_impl(bool log, bool debug, unsigned char pty_locale)
- 	pty_locale(pty_locale)
- {
- 	message_port_register_in(pmt::mp("in"));
--	set_msg_handler(pmt::mp("in"), boost::bind(&parser_impl::parse, this, _1));
-+	set_msg_handler(pmt::mp("in"), boost::bind(&parser_impl::parse, this, boost::placeholders::_1));
- 	message_port_register_out(pmt::mp("out"));
- 	reset();
- }
-diff --git a/src/dsp/rx_rds.cpp b/src/dsp/rx_rds.cpp
-index c4a541f3..c09835b0 100644
---- a/src/dsp/rx_rds.cpp
-+++ b/src/dsp/rx_rds.cpp
-@@ -97,7 +97,7 @@ rx_rds_store::rx_rds_store() : gr::block ("rx_rds_store",
-                                 gr::io_signature::make (0, 0, 0))
- {
-         message_port_register_in(pmt::mp("store"));
--        set_msg_handler(pmt::mp("store"), boost::bind(&rx_rds_store::store, this, _1));
-+        set_msg_handler(pmt::mp("store"), boost::bind(&rx_rds_store::store, this, boost::placeholders::_1));
-         d_messages.set_capacity(100);
- }
- 
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 8f5f2ca433..bfa4411c2c 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  7c626db9f22c3edbe30299a08f7f549b4f30dd83c883595468029a27c3e8fda9  gqrx-2.12.1.tar.gz
+sha256  ff3a9e350f730823dec8edb38cddfd72f602c909cc4ac39082c445eb66f88d96  gqrx-2.13.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index b3438ac1fd..dd15db2890 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GQRX_VERSION = 2.12.1
+GQRX_VERSION = 2.13.2
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
