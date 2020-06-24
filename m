From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 21:40:17 +0200
Subject: [Buildroot] [git commit] package/gqrx: fix build with boost 1.73.0
Message-ID: <20200624193834.EE83D821B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d041f0db8a159dcbada201be864f290fda3592aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With boost >= 1.73, placeholders must be qualified by using the full namespace.

Without the namespace, the build fails with:
gqrx-2.12.1/src/dsp/rds/parser_impl.cc: In constructor 'gr::rds::parser_impl::parser_impl(bool, bool)':
gqrx-2.12.1/src/dsp/rds/parser_impl.cc:42:72: error: '_1' was not declared in this scope
set_msg_handler(pmt::mp("in"), boost::bind(&parser_impl::parse, this, _1));

backport Pull Request https://github.com/csete/gqrx/pull/811

fix:
- http://autobuild.buildroot.net/results/73c490ba361dd6040720442bcbf332f1c3cc4882/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...fy_placeholders_with_their_full_namespace.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/gqrx/0001-boost_qualify_placeholders_with_their_full_namespace.patch b/package/gqrx/0001-boost_qualify_placeholders_with_their_full_namespace.patch
new file mode 100644
index 0000000000..919dc2da01
--- /dev/null
+++ b/package/gqrx/0001-boost_qualify_placeholders_with_their_full_namespace.patch
@@ -0,0 +1,46 @@
+From 0510f6ffee646171bb105e0e8d016ac35e606cd4 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Mon, 22 Jun 2020 15:45:20 +0200
+Subject: [PATCH] qualify placeholders with their full namespace
+
+With boost >= 1.73, placeholders must be qualified by using the full namespace.
+
+Without the namespace, the build fails with:
+gqrx-2.12.1/src/dsp/rds/parser_impl.cc: In constructor 'gr::rds::parser_impl::parser_impl(bool, bool)':
+gqrx-2.12.1/src/dsp/rds/parser_impl.cc:42:72: error: '_1' was not declared in this scope
+set_msg_handler(pmt::mp("in"), boost::bind(&parser_impl::parse, this, _1));
+
+[Upstream status: https://github.com/csete/gqrx/pull/811]
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ src/dsp/rds/parser_impl.cc | 2 +-
+ src/dsp/rx_rds.cpp         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/dsp/rds/parser_impl.cc b/src/dsp/rds/parser_impl.cc
+index b10fdb01..07dae038 100644
+--- a/src/dsp/rds/parser_impl.cc
++++ b/src/dsp/rds/parser_impl.cc
+@@ -40,7 +40,7 @@ parser_impl::parser_impl(bool log, bool debug, unsigned char pty_locale)
+ 	pty_locale(pty_locale)
+ {
+ 	message_port_register_in(pmt::mp("in"));
+-	set_msg_handler(pmt::mp("in"), boost::bind(&parser_impl::parse, this, _1));
++	set_msg_handler(pmt::mp("in"), boost::bind(&parser_impl::parse, this, boost::placeholders::_1));
+ 	message_port_register_out(pmt::mp("out"));
+ 	reset();
+ }
+diff --git a/src/dsp/rx_rds.cpp b/src/dsp/rx_rds.cpp
+index c4a541f3..c09835b0 100644
+--- a/src/dsp/rx_rds.cpp
++++ b/src/dsp/rx_rds.cpp
+@@ -97,7 +97,7 @@ rx_rds_store::rx_rds_store() : gr::block ("rx_rds_store",
+                                 gr::io_signature::make (0, 0, 0))
+ {
+         message_port_register_in(pmt::mp("store"));
+-        set_msg_handler(pmt::mp("store"), boost::bind(&rx_rds_store::store, this, _1));
++        set_msg_handler(pmt::mp("store"), boost::bind(&rx_rds_store::store, this, boost::placeholders::_1));
+         d_messages.set_capacity(100);
+ }
+ 
