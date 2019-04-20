From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 15:50:29 +0200
Subject: [Buildroot] [git commit] package/gnuradio: fix build with boost
 1.70.0
Message-ID: <20190420134624.1865A8E810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aacd43ad18c11c582177931b5656251c2eda3cce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4109881eab99fd720e97f1070c374e67dd881b85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t_pdu_impl.cc-fix-build-with-boost-1.70.0.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch b/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
new file mode 100644
index 0000000000..2047cdd036
--- /dev/null
+++ b/package/gnuradio/0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
@@ -0,0 +1,42 @@
+From 6b450f36c14dd16d476f10f3e4eb1c5c26a78daa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Apr 2019 09:40:15 +0200
+Subject: [PATCH] socket_pdu_impl.cc: fix build with boost 1.70.0
+
+Fix #2446
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/gnuradio/gnuradio/pull/2451]
+---
+ gr-blocks/lib/socket_pdu_impl.cc | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/gr-blocks/lib/socket_pdu_impl.cc b/gr-blocks/lib/socket_pdu_impl.cc
+index e20f1478f..d9dd1edd6 100644
+--- a/gr-blocks/lib/socket_pdu_impl.cc
++++ b/gr-blocks/lib/socket_pdu_impl.cc
+@@ -29,6 +29,12 @@
+ #include <gnuradio/io_signature.h>
+ #include <gnuradio/blocks/pdu.h>
+ 
++#if BOOST_VERSION >= 107000
++#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s)->get_executor().context())
++#else
++#define GET_IO_SERVICE(s) ((s)->get_io_service())
++#endif
++
+ namespace gr {
+   namespace blocks {
+ 
+@@ -165,7 +171,7 @@ namespace gr {
+     void
+     socket_pdu_impl::start_tcp_accept()
+     {
+-      tcp_connection::sptr new_connection = tcp_connection::make(d_acceptor_tcp->get_io_service(), d_rxbuf.size(), d_tcp_no_delay);
++      tcp_connection::sptr new_connection = tcp_connection::make(GET_IO_SERVICE(d_acceptor_tcp), d_rxbuf.size(), d_tcp_no_delay);
+ 
+       d_acceptor_tcp->async_accept(new_connection->socket(),
+         boost::bind(&socket_pdu_impl::handle_tcp_accept, this,
+-- 
+2.20.1
+
