Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1BBC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 09:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C638E83E3D;
	Thu,  6 Oct 2022 09:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C638E83E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJJ-AjsyR1bQ; Thu,  6 Oct 2022 09:03:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41F6C83E44;
	Thu,  6 Oct 2022 09:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41F6C83E44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1434E1BF282
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 09:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3B3140153
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 09:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3B3140153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Tt5Cbp-QxAJ for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 09:03:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDF140129
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FDF140129
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 09:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id 632A139856;
 Thu,  6 Oct 2022 10:27:58 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Thu,  6 Oct 2022 10:27:57 +0200
Message-Id: <1665044877-79114-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH v4] package/gnuradio: bump version to 3.10.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7225784243102401657=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7225784243102401657==
Content-Type: text/plain

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

- remove all no more required patches
- backport 2 patches to fix failures induces by missing headers
- add dependency to SPDLOG
- add pybind dependency where python is set

Note:
- Since gnuradio 3.10 swig was replaced by pybind. Now python libraries,
  bindings and python wrappers are produces using pybind: this why python-pybind
  is a buildtime dependency. This one is a stagging only package (nothing
  installed into target directory -> no select BR2_PACKAGE_PYTHON_PYBIND
  added to Config.in but GNURADIO_DEPENDENCIES is updated with python-pybind).
- host-python-numpy is now required since some cpp bindings uses numpy's
  functions directly. python-numpy (target package) is left required because
  python blocks and wrappers needs this library at runtime.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v3 -> v4:
- re-add runtime comment for numpy
- remove python-pybind select
- rework commit message
Changes v2 -> v3:
- update gnuradio version 3.10.3.0 -> 3.10.4.0
- remove patch to fix libfmt9 (now applied)
- backport two patch to fix failures due to missing header
- explain in commit message why pybind and numpy are now required at
  buildtime (Thomas)
Changes v1 -> v2:
- remove #runtime comment for PYTHON_NUMPY and PYTHON_PYBIND (Thomas)
- remove host-python-mako to the dependencies list (now useless) (Thomas)
- backport patch to fix build failure with libfmt > 9
---
 ...g-missing-vector-in-blockinterleaver.patch |   42 +
 ....h-drop-boost-cstdint.hpp-and-use-cs.patch |   39 -
 ...rleaving.h-add-missing-cstddef-heade.patch |   33 +
 ...aceholders_with_their_full_namespace.patch | 1012 -----------------
 ...rdcode-INTERFACE_INCLUDE_DIRECTORIES.patch |   57 -
 ...add-examples-c-subdirectory-when-gr-.patch |   55 -
 ...ve-deprecated-math-common_factor.hpp.patch |  165 ---
 package/gnuradio/Config.in                    |    4 +-
 package/gnuradio/gnuradio.hash                |    2 +-
 package/gnuradio/gnuradio.mk                  |   12 +-
 10 files changed, 83 insertions(+), 1338 deletions(-)
 create mode 100644 package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
 delete mode 100644 package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
 create mode 100644 package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
 delete mode 100644 package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
 delete mode 100644 package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
 delete mode 100644 package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
 delete mode 100644 package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch

diff --git a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
new file mode 100644
index 0000000000..f805e300af
--- /dev/null
+++ b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
@@ -0,0 +1,42 @@
+From 45fe4ac55ad88b6793d225e676205c30388ec138 Mon Sep 17 00:00:00 2001
+From: Ryan Volz <ryan.volz@gmail.com>
+Date: Fri, 16 Sep 2022 21:05:51 -0400
+Subject: [PATCH 1/2] blocks: Including missing <vector> in blockinterleaver.
+
+Signed-off-by: Ryan Volz <ryan.volz@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/gnuradio/gnuradio/commit/463c3477549b26b32d9b73eef30044e97c4eee64]
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ gr-blocks/include/gnuradio/blocks/blockinterleaving.h | 2 +-
+ gr-blocks/lib/blockinterleaving.cc                    | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gr-blocks/include/gnuradio/blocks/blockinterleaving.h b/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
+index 9d4e0f249..df831fe5a 100644
+--- a/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
++++ b/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
+@@ -12,7 +12,7 @@
+ #define INCLUDED_GR_BLOCKS_BLOCKINTERLEAVING_H
+ 
+ #include <gnuradio/blocks/api.h>
+-
++#include <vector>
+ 
+ namespace gr {
+ namespace blocks {
+diff --git a/gr-blocks/lib/blockinterleaving.cc b/gr-blocks/lib/blockinterleaving.cc
+index fc5873e11..768ad9ea7 100644
+--- a/gr-blocks/lib/blockinterleaving.cc
++++ b/gr-blocks/lib/blockinterleaving.cc
+@@ -12,6 +12,7 @@
+ #include <spdlog/fmt/fmt.h>
+ #include <algorithm>
+ #include <numeric>
++#include <vector>
+ 
+ namespace gr {
+ namespace blocks {
+-- 
+2.35.1
+
diff --git a/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch b/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
deleted file mode 100644
index 532bebcf2e..0000000000
--- a/package/gnuradio/0001-gr-digital-glfsr.h-drop-boost-cstdint.hpp-and-use-cs.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f643bc12100c67288adda3699a9e61d6a66fb529 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Fri, 7 Feb 2020 16:49:30 +0100
-Subject: [PATCH] gr-digital:glfsr.h: drop boost/cstdint.hpp and use cstdint
-
-gr-digital/glfsr.h include boost/cstdint.hpp to have uintxx_t.
-These types are in boost namespace but nor using namespace xxx, nor boost:: are used.
-The result is :
-In file included from /home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/glfsr.cc:23:
-/home/buildroot/autobuild/instance-0/output-1/build/gnuradio-3.8.0.0/gr-digital/lib/../include/gnuradio/digital/glfsr.h:42:5: error: 'uint32_t' does not name a type; did you mean 'u_int32_t'?
-uint32_t d_shift_register;
-^~~~~~~~
-u_int32_t
-
-Since Gnuradio policy is Less boost == better and C++11 is used, use cstdint
-instead of boost/cstdint.hpp.
-
-[backported from 475e4a156b516c089175afb998acdc80b740b437]
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gr-digital/include/gnuradio/digital/glfsr.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gr-digital/include/gnuradio/digital/glfsr.h b/gr-digital/include/gnuradio/digital/glfsr.h
-index 0b5141f1f..1003bcd01 100644
---- a/gr-digital/include/gnuradio/digital/glfsr.h
-+++ b/gr-digital/include/gnuradio/digital/glfsr.h
-@@ -24,7 +24,7 @@
- #define INCLUDED_DIGITAL_GLFSR_H
- 
- #include <gnuradio/digital/api.h>
--#include <boost/cstdint.hpp>
-+#include <cstdint>
- 
- namespace gr {
- namespace digital {
--- 
-2.24.1
-
diff --git a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
new file mode 100644
index 0000000000..d551793be5
--- /dev/null
+++ b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
@@ -0,0 +1,33 @@
+From 901c2ad1ac88908a2e6db5615d5af39a218d826d Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Fri, 23 Sep 2022 08:41:26 +0200
+Subject: [PATCH 2/2] blocks/blockinterleaving.h: add missing cstddef header
+ (required for size_t)
+
+Fix build failure like:
+
+gnuradio/gr-blocks/lib/../include/gnuradio/blocks/blockinterleaving.h:25:36: error: ‘size_t’ was not declared in this scope
+
+This failure is due to the miss of cstddef include
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+[Upstream status: https://github.com/gnuradio/gnuradio/pull/6188]
+---
+ gr-blocks/include/gnuradio/blocks/blockinterleaving.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gr-blocks/include/gnuradio/blocks/blockinterleaving.h b/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
+index df831fe5a..33c59e35b 100644
+--- a/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
++++ b/gr-blocks/include/gnuradio/blocks/blockinterleaving.h
+@@ -13,6 +13,7 @@
+ 
+ #include <gnuradio/blocks/api.h>
+ #include <vector>
++#include <cstddef>
+ 
+ namespace gr {
+ namespace blocks {
+-- 
+2.35.1
+
diff --git a/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch b/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
deleted file mode 100644
index 431cc12522..0000000000
--- a/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
+++ /dev/null
@@ -1,1012 +0,0 @@
-From 5d4c317a372c77aa70df6ab3403d161cd41a7d17 Mon Sep 17 00:00:00 2001
-From: ponce <matteo.bernardini@gmail.com>
-Date: Sun, 17 May 2020 14:02:57 +0200
-Subject: [PATCH] boost: qualify placeholders with their full namespace.
-
-This is needed with boost >= 1.73.0.
-
-[Upstream status: https://github.com/gnuradio/gnuradio/pull/3566]
-
-Signed-off-by: ponce <matteo.bernardini@gmail.com>
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- .../(exported from wiki) Message Passing.txt  |  8 +++---
- gnuradio-runtime/lib/block.cc                 |  3 ++-
- gr-blocks/lib/copy_impl.cc                    |  4 ++-
- gr-blocks/lib/message_debug_impl.cc           | 13 +++++++---
- gr-blocks/lib/message_strobe_impl.cc          |  5 ++--
- gr-blocks/lib/message_strobe_random_impl.cc   |  5 ++--
- gr-blocks/lib/multiply_matrix_impl.cc         | 11 +++++---
- gr-blocks/lib/mute_impl.cc                    |  5 ++--
- gr-blocks/lib/nop_impl.cc                     |  5 ++--
- gr-blocks/lib/pdu_filter_impl.cc              |  5 ++--
- gr-blocks/lib/pdu_remove_impl.cc              |  5 ++--
- gr-blocks/lib/pdu_set_impl.cc                 |  4 ++-
- gr-blocks/lib/random_pdu_impl.cc              |  5 ++--
- gr-blocks/lib/repeat_impl.cc                  |  5 ++--
- gr-blocks/lib/socket_pdu_impl.cc              | 18 ++++++++-----
- .../lib/tagged_stream_multiply_length_impl.cc |  7 +++---
- gr-blocks/lib/tuntap_pdu_impl.cc              |  3 ++-
- gr-digital/lib/chunks_to_symbols_impl.cc      |  5 ++--
- .../lib/constellation_receiver_cb_impl.cc     | 14 ++++++-----
- gr-digital/lib/costas_loop_cc_impl.cc         |  4 ++-
- gr-digital/lib/crc32_async_bb_impl.cc         |  8 ++++--
- gr-digital/lib/header_payload_demux_impl.cc   |  7 +++---
- .../lib/protocol_formatter_async_impl.cc      |  4 ++-
- gr-fec/lib/async_decoder_impl.cc              |  8 ++++--
- gr-fec/lib/async_encoder_impl.cc              |  8 ++++--
- gr-fec/lib/depuncture_bb_impl.cc              |  4 ++-
- gr-fec/lib/puncture_bb_impl.cc                |  4 ++-
- gr-fec/lib/puncture_ff_impl.cc                |  4 ++-
- gr-filter/lib/freq_xlating_fir_filter_impl.cc |  2 +-
- gr-filter/lib/mmse_resampler_cc_impl.cc       |  5 ++--
- gr-filter/lib/mmse_resampler_ff_impl.cc       |  5 ++--
- gr-qtgui/lib/const_sink_c_impl.cc             |  5 ++--
- gr-qtgui/lib/edit_box_msg_impl.cc             |  4 ++-
- gr-qtgui/lib/freq_sink_c_impl.cc              | 12 ++++++---
- gr-qtgui/lib/freq_sink_f_impl.cc              | 12 ++++++---
- gr-qtgui/lib/histogram_sink_f_impl.cc         |  5 ++--
- gr-qtgui/lib/sink_c_impl.cc                   |  4 ++-
- gr-qtgui/lib/sink_f_impl.cc                   |  4 ++-
- gr-qtgui/lib/time_raster_sink_b_impl.cc       |  4 ++-
- gr-qtgui/lib/time_raster_sink_f_impl.cc       |  4 ++-
- gr-qtgui/lib/time_sink_c_impl.cc              |  4 ++-
- gr-qtgui/lib/time_sink_f_impl.cc              |  4 ++-
- gr-qtgui/lib/waterfall_sink_c_impl.cc         | 13 +++++++---
- gr-qtgui/lib/waterfall_sink_f_impl.cc         | 13 +++++++---
- gr-uhd/lib/usrp_block_impl.cc                 | 25 ++++++++++++-------
- gr-uhd/lib/usrp_source_impl.cc                |  5 ++--
- gr-zeromq/lib/pub_msg_sink_impl.cc            |  4 ++-
- gr-zeromq/lib/push_msg_sink_impl.cc           |  4 ++-
- 48 files changed, 213 insertions(+), 106 deletions(-)
-
-diff --git a/docs/usage-manual/(exported from wiki) Message Passing.txt b/docs/usage-manual/(exported from wiki) Message Passing.txt
-index 4654bd5da..551e71022 100644
---- a/docs/usage-manual/(exported from wiki) Message Passing.txt	
-+++ b/docs/usage-manual/(exported from wiki) Message Passing.txt	
-@@ -94,7 +94,7 @@ must then bind this port to the message handler. For this, we use
- Boost's 'bind' function:
- 
-   set_msg_handler(pmt::pmt_t port_id,
--    boost::bind(&block_class::message_handler_function, this, _1));
-+    boost::bind(&block_class::message_handler_function, this, boost::placeholders::_1));
- 
- In Python:
- 
-@@ -241,15 +241,15 @@ The constructor of this block looks like this:
-  {
-    message_port_register_in(pmt::mp("print"));
-    set_msg_handler(pmt::mp("print"),
--     boost::bind(&message_debug_impl::print, this, _1));
-+     boost::bind(&message_debug_impl::print, this, boost::placeholders::_1));
-  
-    message_port_register_in(pmt::mp("store"));
-    set_msg_handler(pmt::mp("store"),
--     boost::bind(&message_debug_impl::store, this, _1));
-+     boost::bind(&message_debug_impl::store, this, boost::placeholders::_1));
-  
-    message_port_register_in(pmt::mp("print_pdu"));
-    set_msg_handler(pmt::mp("print_pdu"),
--     boost::bind(&message_debug_impl::print_pdu, this, _1));
-+     boost::bind(&message_debug_impl::print_pdu, this, boost::placeholders::_1));
-  }
- </syntaxhighlight>
- 
-diff --git a/gnuradio-runtime/lib/block.cc b/gnuradio-runtime/lib/block.cc
-index 591428390..fca4cab97 100644
---- a/gnuradio-runtime/lib/block.cc
-+++ b/gnuradio-runtime/lib/block.cc
-@@ -61,7 +61,8 @@ block::block(const std::string& name,
- {
-     global_block_registry.register_primitive(alias(), this);
-     message_port_register_in(d_system_port);
--    set_msg_handler(d_system_port, boost::bind(&block::system_handler, this, _1));
-+    set_msg_handler(d_system_port,
-+                    boost::bind(&block::system_handler, this, boost::placeholders::_1));
- 
-     configure_default_loggers(d_logger, d_debug_logger, symbol_name());
- }
-diff --git a/gr-blocks/lib/copy_impl.cc b/gr-blocks/lib/copy_impl.cc
-index c377e57b1..b55196c24 100644
---- a/gr-blocks/lib/copy_impl.cc
-+++ b/gr-blocks/lib/copy_impl.cc
-@@ -44,7 +44,9 @@ copy_impl::copy_impl(size_t itemsize)
-       d_enabled(true)
- {
-     message_port_register_in(pmt::mp("en"));
--    set_msg_handler(pmt::mp("en"), boost::bind(&copy_impl::handle_enable, this, _1));
-+    set_msg_handler(
-+        pmt::mp("en"),
-+        boost::bind(&copy_impl::handle_enable, this, boost::placeholders::_1));
- }
- 
- copy_impl::~copy_impl() {}
-diff --git a/gr-blocks/lib/message_debug_impl.cc b/gr-blocks/lib/message_debug_impl.cc
-index a8c84aa50..916f97ca3 100644
---- a/gr-blocks/lib/message_debug_impl.cc
-+++ b/gr-blocks/lib/message_debug_impl.cc
-@@ -90,14 +90,19 @@ message_debug_impl::message_debug_impl()
-     : block("message_debug", io_signature::make(0, 0, 0), io_signature::make(0, 0, 0))
- {
-     message_port_register_in(pmt::mp("print"));
--    set_msg_handler(pmt::mp("print"), boost::bind(&message_debug_impl::print, this, _1));
-+    set_msg_handler(
-+        pmt::mp("print"),
-+        boost::bind(&message_debug_impl::print, this, boost::placeholders::_1));
- 
-     message_port_register_in(pmt::mp("store"));
--    set_msg_handler(pmt::mp("store"), boost::bind(&message_debug_impl::store, this, _1));
-+    set_msg_handler(
-+        pmt::mp("store"),
-+        boost::bind(&message_debug_impl::store, this, boost::placeholders::_1));
- 
-     message_port_register_in(pmt::mp("print_pdu"));
--    set_msg_handler(pmt::mp("print_pdu"),
--                    boost::bind(&message_debug_impl::print_pdu, this, _1));
-+    set_msg_handler(
-+        pmt::mp("print_pdu"),
-+        boost::bind(&message_debug_impl::print_pdu, this, boost::placeholders::_1));
- }
- 
- message_debug_impl::~message_debug_impl() {}
-diff --git a/gr-blocks/lib/message_strobe_impl.cc b/gr-blocks/lib/message_strobe_impl.cc
-index 038eeae5a..d131b8166 100644
---- a/gr-blocks/lib/message_strobe_impl.cc
-+++ b/gr-blocks/lib/message_strobe_impl.cc
-@@ -53,8 +53,9 @@ message_strobe_impl::message_strobe_impl(pmt::pmt_t msg, long period_ms)
-     message_port_register_out(d_port);
- 
-     message_port_register_in(pmt::mp("set_msg"));
--    set_msg_handler(pmt::mp("set_msg"),
--                    boost::bind(&message_strobe_impl::set_msg, this, _1));
-+    set_msg_handler(
-+        pmt::mp("set_msg"),
-+        boost::bind(&message_strobe_impl::set_msg, this, boost::placeholders::_1));
- }
- 
- message_strobe_impl::~message_strobe_impl() {}
-diff --git a/gr-blocks/lib/message_strobe_random_impl.cc b/gr-blocks/lib/message_strobe_random_impl.cc
-index 0ab5d6adc..53e641fba 100644
---- a/gr-blocks/lib/message_strobe_random_impl.cc
-+++ b/gr-blocks/lib/message_strobe_random_impl.cc
-@@ -74,8 +74,9 @@ message_strobe_random_impl::message_strobe_random_impl(
-         new gr::thread::thread(boost::bind(&message_strobe_random_impl::run, this)));
- 
-     message_port_register_in(pmt::mp("set_msg"));
--    set_msg_handler(pmt::mp("set_msg"),
--                    boost::bind(&message_strobe_random_impl::set_msg, this, _1));
-+    set_msg_handler(
-+        pmt::mp("set_msg"),
-+        boost::bind(&message_strobe_random_impl::set_msg, this, boost::placeholders::_1));
- }
- 
- long message_strobe_random_impl::next_delay()
-diff --git a/gr-blocks/lib/multiply_matrix_impl.cc b/gr-blocks/lib/multiply_matrix_impl.cc
-index e1b9c746c..e38953bab 100644
---- a/gr-blocks/lib/multiply_matrix_impl.cc
-+++ b/gr-blocks/lib/multiply_matrix_impl.cc
-@@ -235,9 +235,10 @@ multiply_matrix_impl<gr_complex>::multiply_matrix_impl(
- 
-     pmt::pmt_t port_name = pmt::string_to_symbol("set_A");
-     message_port_register_in(port_name);
--    set_msg_handler(
--        port_name,
--        boost::bind(&multiply_matrix_impl<gr_complex>::msg_handler_A, this, _1));
-+    set_msg_handler(port_name,
-+                    boost::bind(&multiply_matrix_impl<gr_complex>::msg_handler_A,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- template <>
-@@ -257,7 +258,9 @@ multiply_matrix_impl<float>::multiply_matrix_impl(
-     pmt::pmt_t port_name = pmt::string_to_symbol("set_A");
-     message_port_register_in(port_name);
-     set_msg_handler(port_name,
--                    boost::bind(&multiply_matrix_impl<float>::msg_handler_A, this, _1));
-+                    boost::bind(&multiply_matrix_impl<float>::msg_handler_A,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- 
-diff --git a/gr-blocks/lib/mute_impl.cc b/gr-blocks/lib/mute_impl.cc
-index bd65ce207..5c732f8f4 100644
---- a/gr-blocks/lib/mute_impl.cc
-+++ b/gr-blocks/lib/mute_impl.cc
-@@ -47,8 +47,9 @@ mute_impl<T>::mute_impl(bool mute)
-       d_mute(mute)
- {
-     this->message_port_register_in(pmt::intern("set_mute"));
--    this->set_msg_handler(pmt::intern("set_mute"),
--                          boost::bind(&mute_impl<T>::set_mute_pmt, this, _1));
-+    this->set_msg_handler(
-+        pmt::intern("set_mute"),
-+        boost::bind(&mute_impl<T>::set_mute_pmt, this, boost::placeholders::_1));
- }
- 
- template <class T>
-diff --git a/gr-blocks/lib/nop_impl.cc b/gr-blocks/lib/nop_impl.cc
-index db216d97a..e9baee587 100644
---- a/gr-blocks/lib/nop_impl.cc
-+++ b/gr-blocks/lib/nop_impl.cc
-@@ -44,8 +44,9 @@ nop_impl::nop_impl(size_t sizeof_stream_item)
- {
-     // Arrange to have count_received_msgs called when messages are received.
-     message_port_register_in(pmt::mp("port"));
--    set_msg_handler(pmt::mp("port"),
--                    boost::bind(&nop_impl::count_received_msgs, this, _1));
-+    set_msg_handler(
-+        pmt::mp("port"),
-+        boost::bind(&nop_impl::count_received_msgs, this, boost::placeholders::_1));
- }
- 
- nop_impl::~nop_impl() {}
-diff --git a/gr-blocks/lib/pdu_filter_impl.cc b/gr-blocks/lib/pdu_filter_impl.cc
-index b0748eec0..63cfe47e4 100644
---- a/gr-blocks/lib/pdu_filter_impl.cc
-+++ b/gr-blocks/lib/pdu_filter_impl.cc
-@@ -44,8 +44,9 @@ pdu_filter_impl::pdu_filter_impl(pmt::pmt_t k, pmt::pmt_t v, bool invert)
- {
-     message_port_register_out(pdu::pdu_port_id());
-     message_port_register_in(pdu::pdu_port_id());
--    set_msg_handler(pdu::pdu_port_id(),
--                    boost::bind(&pdu_filter_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pdu::pdu_port_id(),
-+        boost::bind(&pdu_filter_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- void pdu_filter_impl::handle_msg(pmt::pmt_t pdu)
-diff --git a/gr-blocks/lib/pdu_remove_impl.cc b/gr-blocks/lib/pdu_remove_impl.cc
-index 19cc4dc76..2b97f827b 100644
---- a/gr-blocks/lib/pdu_remove_impl.cc
-+++ b/gr-blocks/lib/pdu_remove_impl.cc
-@@ -42,8 +42,9 @@ pdu_remove_impl::pdu_remove_impl(pmt::pmt_t k)
- {
-     message_port_register_out(pdu::pdu_port_id());
-     message_port_register_in(pdu::pdu_port_id());
--    set_msg_handler(pdu::pdu_port_id(),
--                    boost::bind(&pdu_remove_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pdu::pdu_port_id(),
-+        boost::bind(&pdu_remove_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- void pdu_remove_impl::handle_msg(pmt::pmt_t pdu)
-diff --git a/gr-blocks/lib/pdu_set_impl.cc b/gr-blocks/lib/pdu_set_impl.cc
-index 40fbc3cd8..af59ef70f 100644
---- a/gr-blocks/lib/pdu_set_impl.cc
-+++ b/gr-blocks/lib/pdu_set_impl.cc
-@@ -43,7 +43,9 @@ pdu_set_impl::pdu_set_impl(pmt::pmt_t k, pmt::pmt_t v)
- {
-     message_port_register_out(pdu::pdu_port_id());
-     message_port_register_in(pdu::pdu_port_id());
--    set_msg_handler(pdu::pdu_port_id(), boost::bind(&pdu_set_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pdu::pdu_port_id(),
-+        boost::bind(&pdu_set_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- void pdu_set_impl::handle_msg(pmt::pmt_t pdu)
-diff --git a/gr-blocks/lib/random_pdu_impl.cc b/gr-blocks/lib/random_pdu_impl.cc
-index 75d825aef..6c142c353 100644
---- a/gr-blocks/lib/random_pdu_impl.cc
-+++ b/gr-blocks/lib/random_pdu_impl.cc
-@@ -52,8 +52,9 @@ random_pdu_impl::random_pdu_impl(int min_items,
- {
-     message_port_register_out(pdu::pdu_port_id());
-     message_port_register_in(pmt::mp("generate"));
--    set_msg_handler(pmt::mp("generate"),
--                    boost::bind(&random_pdu_impl::generate_pdu, this, _1));
-+    set_msg_handler(
-+        pmt::mp("generate"),
-+        boost::bind(&random_pdu_impl::generate_pdu, this, boost::placeholders::_1));
-     if (length_modulo < 1)
-         throw std::runtime_error("length_module must be >= 1");
-     if (max_items < length_modulo)
-diff --git a/gr-blocks/lib/repeat_impl.cc b/gr-blocks/lib/repeat_impl.cc
-index 189fbc894..d6569625d 100644
---- a/gr-blocks/lib/repeat_impl.cc
-+++ b/gr-blocks/lib/repeat_impl.cc
-@@ -44,8 +44,9 @@ repeat_impl::repeat_impl(size_t itemsize, int interp)
-       d_interp(interp)
- {
-     message_port_register_in(pmt::mp("interpolation"));
--    set_msg_handler(pmt::mp("interpolation"),
--                    boost::bind(&repeat_impl::msg_set_interpolation, this, _1));
-+    set_msg_handler(
-+        pmt::mp("interpolation"),
-+        boost::bind(&repeat_impl::msg_set_interpolation, this, boost::placeholders::_1));
- }
- 
- void repeat_impl::msg_set_interpolation(pmt::pmt_t msg)
-diff --git a/gr-blocks/lib/socket_pdu_impl.cc b/gr-blocks/lib/socket_pdu_impl.cc
-index df69f07ad..163eec3a6 100644
---- a/gr-blocks/lib/socket_pdu_impl.cc
-+++ b/gr-blocks/lib/socket_pdu_impl.cc
-@@ -101,7 +101,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
-         start_tcp_accept();
- 
-         set_msg_handler(pdu::pdu_port_id(),
--                        boost::bind(&socket_pdu_impl::tcp_server_send, this, _1));
-+                        boost::bind(&socket_pdu_impl::tcp_server_send,
-+                                    this,
-+                                    boost::placeholders::_1));
-     } else if (type == "TCP_CLIENT") {
-         boost::system::error_code error = boost::asio::error::host_not_found;
-         d_tcp_socket.reset(new boost::asio::ip::tcp::socket(d_io_service));
-@@ -111,7 +113,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
-         d_tcp_socket->set_option(boost::asio::ip::tcp::no_delay(d_tcp_no_delay));
- 
-         set_msg_handler(pdu::pdu_port_id(),
--                        boost::bind(&socket_pdu_impl::tcp_client_send, this, _1));
-+                        boost::bind(&socket_pdu_impl::tcp_client_send,
-+                                    this,
-+                                    boost::placeholders::_1));
- 
-         d_tcp_socket->async_read_some(
-             boost::asio::buffer(d_rxbuf),
-@@ -130,8 +134,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
-                         boost::asio::placeholders::error,
-                         boost::asio::placeholders::bytes_transferred));
- 
--        set_msg_handler(pdu::pdu_port_id(),
--                        boost::bind(&socket_pdu_impl::udp_send, this, _1));
-+        set_msg_handler(
-+            pdu::pdu_port_id(),
-+            boost::bind(&socket_pdu_impl::udp_send, this, boost::placeholders::_1));
-     } else if (type == "UDP_CLIENT") {
-         d_udp_socket.reset(
-             new boost::asio::ip::udp::socket(d_io_service, d_udp_endpoint));
-@@ -143,8 +148,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
-                         boost::asio::placeholders::error,
-                         boost::asio::placeholders::bytes_transferred));
- 
--        set_msg_handler(pdu::pdu_port_id(),
--                        boost::bind(&socket_pdu_impl::udp_send, this, _1));
-+        set_msg_handler(
-+            pdu::pdu_port_id(),
-+            boost::bind(&socket_pdu_impl::udp_send, this, boost::placeholders::_1));
-     } else
-         throw std::runtime_error("gr::blocks:socket_pdu: unknown socket type");
- 
-diff --git a/gr-blocks/lib/tagged_stream_multiply_length_impl.cc b/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
-index 30f4c46dc..34b95d647 100644
---- a/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
-+++ b/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
-@@ -49,9 +49,10 @@ tagged_stream_multiply_length_impl::tagged_stream_multiply_length_impl(
-     set_tag_propagation_policy(TPP_DONT);
-     set_relative_rate(1, 1);
-     message_port_register_in(pmt::intern("set_scalar"));
--    set_msg_handler(
--        pmt::intern("set_scalar"),
--        boost::bind(&tagged_stream_multiply_length_impl::set_scalar_pmt, this, _1));
-+    set_msg_handler(pmt::intern("set_scalar"),
-+                    boost::bind(&tagged_stream_multiply_length_impl::set_scalar_pmt,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- tagged_stream_multiply_length_impl::~tagged_stream_multiply_length_impl() {}
-diff --git a/gr-blocks/lib/tuntap_pdu_impl.cc b/gr-blocks/lib/tuntap_pdu_impl.cc
-index 4343ae1dc..0d9d7e28c 100644
---- a/gr-blocks/lib/tuntap_pdu_impl.cc
-+++ b/gr-blocks/lib/tuntap_pdu_impl.cc
-@@ -96,7 +96,8 @@ tuntap_pdu_impl::tuntap_pdu_impl(std::string dev, int MTU, bool istunflag)
- 
-     // set up input message port
-     message_port_register_in(pdu::pdu_port_id());
--    set_msg_handler(pdu::pdu_port_id(), boost::bind(&tuntap_pdu_impl::send, this, _1));
-+    set_msg_handler(pdu::pdu_port_id(),
-+                    boost::bind(&tuntap_pdu_impl::send, this, boost::placeholders::_1));
- }
- 
- int tuntap_pdu_impl::tun_alloc(char* dev, int flags)
-diff --git a/gr-digital/lib/chunks_to_symbols_impl.cc b/gr-digital/lib/chunks_to_symbols_impl.cc
-index 26d590a66..a6810a69e 100644
---- a/gr-digital/lib/chunks_to_symbols_impl.cc
-+++ b/gr-digital/lib/chunks_to_symbols_impl.cc
-@@ -53,8 +53,9 @@ chunks_to_symbols_impl<IN_T, OUT_T>::chunks_to_symbols_impl(
-     this->message_port_register_in(pmt::mp("set_symbol_table"));
-     this->set_msg_handler(
-         pmt::mp("set_symbol_table"),
--        boost::bind(
--            &chunks_to_symbols_impl<IN_T, OUT_T>::handle_set_symbol_table, this, _1));
-+        boost::bind(&chunks_to_symbols_impl<IN_T, OUT_T>::handle_set_symbol_table,
-+                    this,
-+                    boost::placeholders::_1));
- }
- 
- template <class IN_T, class OUT_T>
-diff --git a/gr-digital/lib/constellation_receiver_cb_impl.cc b/gr-digital/lib/constellation_receiver_cb_impl.cc
-index 7fb7559d5..7e216ece5 100644
---- a/gr-digital/lib/constellation_receiver_cb_impl.cc
-+++ b/gr-digital/lib/constellation_receiver_cb_impl.cc
-@@ -61,14 +61,16 @@ constellation_receiver_cb_impl::constellation_receiver_cb_impl(
-             "This receiver only works with constellations of dimension 1.");
- 
-     message_port_register_in(pmt::mp("set_constellation"));
--    set_msg_handler(
--        pmt::mp("set_constellation"),
--        boost::bind(&constellation_receiver_cb_impl::handle_set_constellation, this, _1));
-+    set_msg_handler(pmt::mp("set_constellation"),
-+                    boost::bind(&constellation_receiver_cb_impl::handle_set_constellation,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     message_port_register_in(pmt::mp("rotate_phase"));
--    set_msg_handler(
--        pmt::mp("rotate_phase"),
--        boost::bind(&constellation_receiver_cb_impl::handle_rotate_phase, this, _1));
-+    set_msg_handler(pmt::mp("rotate_phase"),
-+                    boost::bind(&constellation_receiver_cb_impl::handle_rotate_phase,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- constellation_receiver_cb_impl::~constellation_receiver_cb_impl() {}
-diff --git a/gr-digital/lib/costas_loop_cc_impl.cc b/gr-digital/lib/costas_loop_cc_impl.cc
-index c3b30834e..e1229e6f4 100644
---- a/gr-digital/lib/costas_loop_cc_impl.cc
-+++ b/gr-digital/lib/costas_loop_cc_impl.cc
-@@ -82,7 +82,9 @@ costas_loop_cc_impl::costas_loop_cc_impl(float loop_bw, int order, bool use_snr)
- 
-     message_port_register_in(pmt::mp("noise"));
-     set_msg_handler(pmt::mp("noise"),
--                    boost::bind(&costas_loop_cc_impl::handle_set_noise, this, _1));
-+                    boost::bind(&costas_loop_cc_impl::handle_set_noise,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- costas_loop_cc_impl::~costas_loop_cc_impl() {}
-diff --git a/gr-digital/lib/crc32_async_bb_impl.cc b/gr-digital/lib/crc32_async_bb_impl.cc
-index bffbb2a73..66143866c 100644
---- a/gr-digital/lib/crc32_async_bb_impl.cc
-+++ b/gr-digital/lib/crc32_async_bb_impl.cc
-@@ -48,9 +48,13 @@ crc32_async_bb_impl::crc32_async_bb_impl(bool check)
-     message_port_register_out(d_out_port);
- 
-     if (check)
--        set_msg_handler(d_in_port, boost::bind(&crc32_async_bb_impl::check, this, _1));
-+        set_msg_handler(
-+            d_in_port,
-+            boost::bind(&crc32_async_bb_impl::check, this, boost::placeholders::_1));
-     else
--        set_msg_handler(d_in_port, boost::bind(&crc32_async_bb_impl::calc, this, _1));
-+        set_msg_handler(
-+            d_in_port,
-+            boost::bind(&crc32_async_bb_impl::calc, this, boost::placeholders::_1));
- }
- 
- crc32_async_bb_impl::~crc32_async_bb_impl() {}
-diff --git a/gr-digital/lib/header_payload_demux_impl.cc b/gr-digital/lib/header_payload_demux_impl.cc
-index 98c805fb2..7cc1e0a4e 100644
---- a/gr-digital/lib/header_payload_demux_impl.cc
-+++ b/gr-digital/lib/header_payload_demux_impl.cc
-@@ -150,9 +150,10 @@ header_payload_demux_impl::header_payload_demux_impl(
-     }
-     set_tag_propagation_policy(TPP_DONT);
-     message_port_register_in(msg_port_id());
--    set_msg_handler(
--        msg_port_id(),
--        boost::bind(&header_payload_demux_impl::parse_header_data_msg, this, _1));
-+    set_msg_handler(msg_port_id(),
-+                    boost::bind(&header_payload_demux_impl::parse_header_data_msg,
-+                                this,
-+                                boost::placeholders::_1));
-     for (size_t i = 0; i < special_tags.size(); i++) {
-         d_special_tags.push_back(pmt::string_to_symbol(special_tags[i]));
-         d_special_tags_last_value.push_back(pmt::PMT_NIL);
-diff --git a/gr-digital/lib/protocol_formatter_async_impl.cc b/gr-digital/lib/protocol_formatter_async_impl.cc
-index 84b693745..c08bbb9ae 100644
---- a/gr-digital/lib/protocol_formatter_async_impl.cc
-+++ b/gr-digital/lib/protocol_formatter_async_impl.cc
-@@ -55,7 +55,9 @@ protocol_formatter_async_impl::protocol_formatter_async_impl(
-     message_port_register_out(d_pld_port);
- 
-     set_msg_handler(d_in_port,
--                    boost::bind(&protocol_formatter_async_impl::append, this, _1));
-+                    boost::bind(&protocol_formatter_async_impl::append,
-+                                this,
-+                                boost::placeholders::_1));
- }
- 
- protocol_formatter_async_impl::~protocol_formatter_async_impl() {}
-diff --git a/gr-fec/lib/async_decoder_impl.cc b/gr-fec/lib/async_decoder_impl.cc
-index e7a668c83..5d68d13ae 100644
---- a/gr-fec/lib/async_decoder_impl.cc
-+++ b/gr-fec/lib/async_decoder_impl.cc
-@@ -65,10 +65,14 @@ async_decoder_impl::async_decoder_impl(generic_decoder::sptr my_decoder,
-     if (d_packed) {
-         d_pack = new blocks::kernel::pack_k_bits(8);
-         set_msg_handler(d_in_port,
--                        boost::bind(&async_decoder_impl::decode_packed, this, _1));
-+                        boost::bind(&async_decoder_impl::decode_packed,
-+                                    this,
-+                                    boost::placeholders::_1));
-     } else {
-         set_msg_handler(d_in_port,
--                        boost::bind(&async_decoder_impl::decode_unpacked, this, _1));
-+                        boost::bind(&async_decoder_impl::decode_unpacked,
-+                                    this,
-+                                    boost::placeholders::_1));
-     }
- 
-     // The maximum frame size is set by the initial frame size of the decoder.
-diff --git a/gr-fec/lib/async_encoder_impl.cc b/gr-fec/lib/async_encoder_impl.cc
-index 811d55601..506ae5c7e 100644
---- a/gr-fec/lib/async_encoder_impl.cc
-+++ b/gr-fec/lib/async_encoder_impl.cc
-@@ -64,7 +64,9 @@ async_encoder_impl::async_encoder_impl(generic_encoder::sptr my_encoder,
- 
-     if (d_packed) {
-         set_msg_handler(d_in_port,
--                        boost::bind(&async_encoder_impl::encode_packed, this, _1));
-+                        boost::bind(&async_encoder_impl::encode_packed,
-+                                    this,
-+                                    boost::placeholders::_1));
- 
-         d_unpack = new blocks::kernel::unpack_k_bits(8);
- 
-@@ -74,7 +76,9 @@ async_encoder_impl::async_encoder_impl(generic_encoder::sptr my_encoder,
- 
-     } else {
-         set_msg_handler(d_in_port,
--                        boost::bind(&async_encoder_impl::encode_unpacked, this, _1));
-+                        boost::bind(&async_encoder_impl::encode_unpacked,
-+                                    this,
-+                                    boost::placeholders::_1));
-     }
- 
-     if (d_packed || (strncmp(d_encoder->get_input_conversion(), "pack", 4) == 0)) {
-diff --git a/gr-fec/lib/depuncture_bb_impl.cc b/gr-fec/lib/depuncture_bb_impl.cc
-index 27d00bb5b..f64dad45f 100644
---- a/gr-fec/lib/depuncture_bb_impl.cc
-+++ b/gr-fec/lib/depuncture_bb_impl.cc
-@@ -74,7 +74,9 @@ depuncture_bb_impl::depuncture_bb_impl(int puncsize, int puncpat, int delay, cha
-     set_fixed_rate(true);
-     set_relative_rate((uint64_t)d_puncsize, (uint64_t)(d_puncsize - d_puncholes));
-     set_output_multiple(d_puncsize);
--    // set_msg_handler(boost::bind(&depuncture_bb_impl::catch_msg, this, _1));
-+    // set_msg_handler(boost::bind(&depuncture_bb_impl::catch_msg,
-+    //                             this,
-+    //                             boost::placeholders::_1));
- }
- 
- depuncture_bb_impl::~depuncture_bb_impl() {}
-diff --git a/gr-fec/lib/puncture_bb_impl.cc b/gr-fec/lib/puncture_bb_impl.cc
-index a365d6a69..f2078d8c5 100644
---- a/gr-fec/lib/puncture_bb_impl.cc
-+++ b/gr-fec/lib/puncture_bb_impl.cc
-@@ -72,7 +72,9 @@ puncture_bb_impl::puncture_bb_impl(int puncsize, int puncpat, int delay)
-     set_fixed_rate(true);
-     set_relative_rate((uint64_t)(d_puncsize - d_puncholes), (uint64_t)d_puncsize);
-     set_output_multiple(d_puncsize - d_puncholes);
--    // set_msg_handler(boost::bind(&puncture_bb_impl::catch_msg, this, _1));
-+    // set_msg_handler(boost::bind(&puncture_bb_impl::catch_msg,
-+    //                             this,
-+    //                             boost::placeholders::_1));
- }
- 
- puncture_bb_impl::~puncture_bb_impl() {}
-diff --git a/gr-fec/lib/puncture_ff_impl.cc b/gr-fec/lib/puncture_ff_impl.cc
-index c95288d69..95fb649a8 100644
---- a/gr-fec/lib/puncture_ff_impl.cc
-+++ b/gr-fec/lib/puncture_ff_impl.cc
-@@ -72,7 +72,9 @@ puncture_ff_impl::puncture_ff_impl(int puncsize, int puncpat, int delay)
-     set_fixed_rate(true);
-     set_relative_rate((uint64_t)(d_puncsize - d_puncholes), (uint64_t)d_puncsize);
-     set_output_multiple(d_puncsize - d_puncholes);
--    // set_msg_handler(boost::bind(&puncture_ff_impl::catch_msg, this, _1));
-+    // set_msg_handler(boost::bind(&puncture_ff_impl::catch_msg,
-+    //                             this,
-+    //                             boost::placeholders::_1));
- }
- 
- puncture_ff_impl::~puncture_ff_impl() {}
-diff --git a/gr-filter/lib/freq_xlating_fir_filter_impl.cc b/gr-filter/lib/freq_xlating_fir_filter_impl.cc
-index 8ddc967ba..50ec58947 100644
---- a/gr-filter/lib/freq_xlating_fir_filter_impl.cc
-+++ b/gr-filter/lib/freq_xlating_fir_filter_impl.cc
-@@ -72,7 +72,7 @@ freq_xlating_fir_filter_impl<IN_T, OUT_T, TAP_T>::freq_xlating_fir_filter_impl(
-         boost::bind(
-             &freq_xlating_fir_filter_impl<IN_T, OUT_T, TAP_T>::handle_set_center_freq,
-             this,
--            _1));
-+            boost::placeholders::_1));
- }
- 
- template <class IN_T, class OUT_T, class TAP_T>
-diff --git a/gr-filter/lib/mmse_resampler_cc_impl.cc b/gr-filter/lib/mmse_resampler_cc_impl.cc
-index 59f9eacfa..bdce51716 100644
---- a/gr-filter/lib/mmse_resampler_cc_impl.cc
-+++ b/gr-filter/lib/mmse_resampler_cc_impl.cc
-@@ -52,8 +52,9 @@ mmse_resampler_cc_impl::mmse_resampler_cc_impl(float phase_shift, float resamp_r
- 
-     set_inverse_relative_rate(d_mu_inc);
-     message_port_register_in(pmt::intern("msg_in"));
--    set_msg_handler(pmt::intern("msg_in"),
--                    boost::bind(&mmse_resampler_cc_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pmt::intern("msg_in"),
-+        boost::bind(&mmse_resampler_cc_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- mmse_resampler_cc_impl::~mmse_resampler_cc_impl() { delete d_resamp; }
-diff --git a/gr-filter/lib/mmse_resampler_ff_impl.cc b/gr-filter/lib/mmse_resampler_ff_impl.cc
-index 342d9f767..3d7272711 100644
---- a/gr-filter/lib/mmse_resampler_ff_impl.cc
-+++ b/gr-filter/lib/mmse_resampler_ff_impl.cc
-@@ -53,8 +53,9 @@ mmse_resampler_ff_impl::mmse_resampler_ff_impl(float phase_shift, float resamp_r
-     set_inverse_relative_rate(d_mu_inc);
- 
-     message_port_register_in(pmt::intern("msg_in"));
--    set_msg_handler(pmt::intern("msg_in"),
--                    boost::bind(&mmse_resampler_ff_impl::handle_msg, this, _1));
-+    set_msg_handler(
-+        pmt::intern("msg_in"),
-+        boost::bind(&mmse_resampler_ff_impl::handle_msg, this, boost::placeholders::_1));
- }
- 
- mmse_resampler_ff_impl::~mmse_resampler_ff_impl() { delete d_resamp; }
-diff --git a/gr-qtgui/lib/const_sink_c_impl.cc b/gr-qtgui/lib/const_sink_c_impl.cc
-index 852f6ee10..04d421d03 100644
---- a/gr-qtgui/lib/const_sink_c_impl.cc
-+++ b/gr-qtgui/lib/const_sink_c_impl.cc
-@@ -69,8 +69,9 @@ const_sink_c_impl::const_sink_c_impl(int size,
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"),
--                    boost::bind(&const_sink_c_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&const_sink_c_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     for (int i = 0; i < d_nconnections; i++) {
-         d_residbufs_real.push_back(
-diff --git a/gr-qtgui/lib/edit_box_msg_impl.cc b/gr-qtgui/lib/edit_box_msg_impl.cc
-index 8713aa820..39546cbf3 100644
---- a/gr-qtgui/lib/edit_box_msg_impl.cc
-+++ b/gr-qtgui/lib/edit_box_msg_impl.cc
-@@ -158,7 +158,9 @@ edit_box_msg_impl::edit_box_msg_impl(data_type_t type,
-     message_port_register_out(d_port);
-     message_port_register_in(pmt::mp("val"));
- 
--    set_msg_handler(pmt::mp("val"), boost::bind(&edit_box_msg_impl::set_value, this, _1));
-+    set_msg_handler(
-+        pmt::mp("val"),
-+        boost::bind(&edit_box_msg_impl::set_value, this, boost::placeholders::_1));
- }
- 
- edit_box_msg_impl::~edit_box_msg_impl()
-diff --git a/gr-qtgui/lib/freq_sink_c_impl.cc b/gr-qtgui/lib/freq_sink_c_impl.cc
-index 3a34df6ec..fe231699f 100644
---- a/gr-qtgui/lib/freq_sink_c_impl.cc
-+++ b/gr-qtgui/lib/freq_sink_c_impl.cc
-@@ -82,17 +82,23 @@ freq_sink_c_impl::freq_sink_c_impl(int fftsize,
- 
-     // setup bw input port
-     message_port_register_in(d_port_bw);
--    set_msg_handler(d_port_bw, boost::bind(&freq_sink_c_impl::handle_set_bw, this, _1));
-+    set_msg_handler(
-+        d_port_bw,
-+        boost::bind(&freq_sink_c_impl::handle_set_bw, this, boost::placeholders::_1));
- 
-     // setup output message port to post frequency when display is
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
--    set_msg_handler(d_port, boost::bind(&freq_sink_c_impl::handle_set_freq, this, _1));
-+    set_msg_handler(
-+        d_port,
-+        boost::bind(&freq_sink_c_impl::handle_set_freq, this, boost::placeholders::_1));
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&freq_sink_c_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&freq_sink_c_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     d_main_gui = NULL;
- 
-diff --git a/gr-qtgui/lib/freq_sink_f_impl.cc b/gr-qtgui/lib/freq_sink_f_impl.cc
-index c14bfc31f..7090d8699 100644
---- a/gr-qtgui/lib/freq_sink_f_impl.cc
-+++ b/gr-qtgui/lib/freq_sink_f_impl.cc
-@@ -82,17 +82,23 @@ freq_sink_f_impl::freq_sink_f_impl(int fftsize,
- 
-     // setup bw input port
-     message_port_register_in(d_port_bw);
--    set_msg_handler(d_port_bw, boost::bind(&freq_sink_f_impl::handle_set_bw, this, _1));
-+    set_msg_handler(
-+        d_port_bw,
-+        boost::bind(&freq_sink_f_impl::handle_set_bw, this, boost::placeholders::_1));
- 
-     // setup output message port to post frequency when display is
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
--    set_msg_handler(d_port, boost::bind(&freq_sink_f_impl::handle_set_freq, this, _1));
-+    set_msg_handler(
-+        d_port,
-+        boost::bind(&freq_sink_f_impl::handle_set_freq, this, boost::placeholders::_1));
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&freq_sink_f_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&freq_sink_f_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     d_main_gui = NULL;
- 
-diff --git a/gr-qtgui/lib/histogram_sink_f_impl.cc b/gr-qtgui/lib/histogram_sink_f_impl.cc
-index d16de932c..1602d1896 100644
---- a/gr-qtgui/lib/histogram_sink_f_impl.cc
-+++ b/gr-qtgui/lib/histogram_sink_f_impl.cc
-@@ -81,8 +81,9 @@ histogram_sink_f_impl::histogram_sink_f_impl(int size,
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"),
--                    boost::bind(&histogram_sink_f_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&histogram_sink_f_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     // +1 for the PDU buffer
-     for (int i = 0; i < d_nconnections + 1; i++) {
-diff --git a/gr-qtgui/lib/sink_c_impl.cc b/gr-qtgui/lib/sink_c_impl.cc
-index d3feb9d16..73136e789 100644
---- a/gr-qtgui/lib/sink_c_impl.cc
-+++ b/gr-qtgui/lib/sink_c_impl.cc
-@@ -96,7 +96,9 @@ sink_c_impl::sink_c_impl(int fftsize,
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
--    set_msg_handler(d_port, boost::bind(&sink_c_impl::handle_set_freq, this, _1));
-+    set_msg_handler(
-+        d_port,
-+        boost::bind(&sink_c_impl::handle_set_freq, this, boost::placeholders::_1));
- 
-     d_main_gui = NULL;
- 
-diff --git a/gr-qtgui/lib/sink_f_impl.cc b/gr-qtgui/lib/sink_f_impl.cc
-index 418b630b7..d31023a51 100644
---- a/gr-qtgui/lib/sink_f_impl.cc
-+++ b/gr-qtgui/lib/sink_f_impl.cc
-@@ -95,7 +95,9 @@ sink_f_impl::sink_f_impl(int fftsize,
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
--    set_msg_handler(d_port, boost::bind(&sink_f_impl::handle_set_freq, this, _1));
-+    set_msg_handler(
-+        d_port,
-+        boost::bind(&sink_f_impl::handle_set_freq, this, boost::placeholders::_1));
- 
-     d_main_gui = NULL;
- 
-diff --git a/gr-qtgui/lib/time_raster_sink_b_impl.cc b/gr-qtgui/lib/time_raster_sink_b_impl.cc
-index 045c216b0..3aa503ccf 100644
---- a/gr-qtgui/lib/time_raster_sink_b_impl.cc
-+++ b/gr-qtgui/lib/time_raster_sink_b_impl.cc
-@@ -84,7 +84,9 @@ time_raster_sink_b_impl::time_raster_sink_b_impl(double samp_rate,
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
-     set_msg_handler(pmt::mp("in"),
--                    boost::bind(&time_raster_sink_b_impl::handle_pdus, this, _1));
-+                    boost::bind(&time_raster_sink_b_impl::handle_pdus,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     d_scale = 1.0f;
- 
-diff --git a/gr-qtgui/lib/time_raster_sink_f_impl.cc b/gr-qtgui/lib/time_raster_sink_f_impl.cc
-index d186f319d..b3516e5be 100644
---- a/gr-qtgui/lib/time_raster_sink_f_impl.cc
-+++ b/gr-qtgui/lib/time_raster_sink_f_impl.cc
-@@ -84,7 +84,9 @@ time_raster_sink_f_impl::time_raster_sink_f_impl(double samp_rate,
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
-     set_msg_handler(pmt::mp("in"),
--                    boost::bind(&time_raster_sink_f_impl::handle_pdus, this, _1));
-+                    boost::bind(&time_raster_sink_f_impl::handle_pdus,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     d_icols = static_cast<int>(ceil(d_cols));
-     d_tmpflt = (float*)volk_malloc(d_icols * sizeof(float), volk_get_alignment());
-diff --git a/gr-qtgui/lib/time_sink_c_impl.cc b/gr-qtgui/lib/time_sink_c_impl.cc
-index b73a1c1ad..83fbda298 100644
---- a/gr-qtgui/lib/time_sink_c_impl.cc
-+++ b/gr-qtgui/lib/time_sink_c_impl.cc
-@@ -80,7 +80,9 @@ time_sink_c_impl::time_sink_c_impl(int size,
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&time_sink_c_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&time_sink_c_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     // +2 for the PDU message buffers
-     for (unsigned int n = 0; n < d_nconnections + 2; n++) {
-diff --git a/gr-qtgui/lib/time_sink_f_impl.cc b/gr-qtgui/lib/time_sink_f_impl.cc
-index df13998d7..dd5ed12c8 100644
---- a/gr-qtgui/lib/time_sink_f_impl.cc
-+++ b/gr-qtgui/lib/time_sink_f_impl.cc
-@@ -80,7 +80,9 @@ time_sink_f_impl::time_sink_f_impl(int size,
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&time_sink_f_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&time_sink_f_impl::handle_pdus, this, boost::placeholders::_1));
- 
-     // +1 for the PDU buffer
-     for (unsigned int n = 0; n < d_nconnections + 1; n++) {
-diff --git a/gr-qtgui/lib/waterfall_sink_c_impl.cc b/gr-qtgui/lib/waterfall_sink_c_impl.cc
-index fcf2ed98b..da38d32ba 100644
---- a/gr-qtgui/lib/waterfall_sink_c_impl.cc
-+++ b/gr-qtgui/lib/waterfall_sink_c_impl.cc
-@@ -118,19 +118,24 @@ waterfall_sink_c_impl::waterfall_sink_c_impl(int fftsize,
-     // setup bw input port
-     message_port_register_in(d_port_bw);
-     set_msg_handler(d_port_bw,
--                    boost::bind(&waterfall_sink_c_impl::handle_set_bw, this, _1));
-+                    boost::bind(&waterfall_sink_c_impl::handle_set_bw,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     // setup output message port to post frequency when display is
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
-     set_msg_handler(d_port,
--                    boost::bind(&waterfall_sink_c_impl::handle_set_freq, this, _1));
-+                    boost::bind(&waterfall_sink_c_impl::handle_set_freq,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"),
--                    boost::bind(&waterfall_sink_c_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&waterfall_sink_c_impl::handle_pdus, this, boost::placeholders::_1));
- }
- 
- waterfall_sink_c_impl::~waterfall_sink_c_impl()
-diff --git a/gr-qtgui/lib/waterfall_sink_f_impl.cc b/gr-qtgui/lib/waterfall_sink_f_impl.cc
-index aa1037a47..d4231a564 100644
---- a/gr-qtgui/lib/waterfall_sink_f_impl.cc
-+++ b/gr-qtgui/lib/waterfall_sink_f_impl.cc
-@@ -116,19 +116,24 @@ waterfall_sink_f_impl::waterfall_sink_f_impl(int fftsize,
-     // setup bw input port
-     message_port_register_in(d_port_bw);
-     set_msg_handler(d_port_bw,
--                    boost::bind(&waterfall_sink_f_impl::handle_set_bw, this, _1));
-+                    boost::bind(&waterfall_sink_f_impl::handle_set_bw,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     // setup output message port to post frequency when display is
-     // double-clicked
-     message_port_register_out(d_port);
-     message_port_register_in(d_port);
-     set_msg_handler(d_port,
--                    boost::bind(&waterfall_sink_f_impl::handle_set_freq, this, _1));
-+                    boost::bind(&waterfall_sink_f_impl::handle_set_freq,
-+                                this,
-+                                boost::placeholders::_1));
- 
-     // setup PDU handling input port
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"),
--                    boost::bind(&waterfall_sink_f_impl::handle_pdus, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&waterfall_sink_f_impl::handle_pdus, this, boost::placeholders::_1));
- }
- 
- waterfall_sink_f_impl::~waterfall_sink_f_impl()
-diff --git a/gr-uhd/lib/usrp_block_impl.cc b/gr-uhd/lib/usrp_block_impl.cc
-index 4f030159f..697d633c1 100644
---- a/gr-uhd/lib/usrp_block_impl.cc
-+++ b/gr-uhd/lib/usrp_block_impl.cc
-@@ -137,12 +137,18 @@ usrp_block_impl::usrp_block_impl(const ::uhd::device_addr_t& device_addr,
-     // Set up message ports:
-     message_port_register_in(pmt::mp("command"));
-     set_msg_handler(pmt::mp("command"),
--                    boost::bind(&usrp_block_impl::msg_handler_command, this, _1));
-+                    boost::bind(&usrp_block_impl::msg_handler_command,
-+                                this,
-+                                boost::placeholders::_1));
- 
- // cuz we lazy:
--#define REGISTER_CMD_HANDLER(key, _handler) \
--    register_msg_cmd_handler(key,           \
--                             boost::bind(&usrp_block_impl::_handler, this, _1, _2, _3))
-+#define REGISTER_CMD_HANDLER(key, _handler)                          \
-+    register_msg_cmd_handler(key,                                    \
-+                             boost::bind(&usrp_block_impl::_handler, \
-+                                         this,                       \
-+                                         boost::placeholders::_1,    \
-+                                         boost::placeholders::_2,    \
-+                                         boost::placeholders::_3))
-     // Register default command handlers:
-     REGISTER_CMD_HANDLER(cmd_freq_key(), _cmd_handler_freq);
-     REGISTER_CMD_HANDLER(cmd_gain_key(), _cmd_handler_gain);
-@@ -257,11 +263,12 @@ bool usrp_block_impl::_check_mboard_sensors_locked()
-         } else if (_dev->get_clock_source(mboard_index) == "mimo") {
-             sensor_name = "mimo_locked";
-         }
--        if (not _wait_for_locked_sensor(
--                get_mboard_sensor_names(mboard_index),
--                sensor_name,
--                boost::bind(
--                    &usrp_block_impl::get_mboard_sensor, this, _1, mboard_index))) {
-+        if (not _wait_for_locked_sensor(get_mboard_sensor_names(mboard_index),
-+                                        sensor_name,
-+                                        boost::bind(&usrp_block_impl::get_mboard_sensor,
-+                                                    this,
-+                                                    boost::placeholders::_1,
-+                                                    mboard_index))) {
-             GR_LOG_WARN(
-                 d_logger,
-                 boost::format(
-diff --git a/gr-uhd/lib/usrp_source_impl.cc b/gr-uhd/lib/usrp_source_impl.cc
-index a2ff0821b..5e6bd4328 100644
---- a/gr-uhd/lib/usrp_source_impl.cc
-+++ b/gr-uhd/lib/usrp_source_impl.cc
-@@ -57,8 +57,9 @@ usrp_source_impl::usrp_source_impl(const ::uhd::device_addr_t& device_addr,
- 
-     _samp_rate = this->get_samp_rate();
-     _samps_per_packet = 1;
--    register_msg_cmd_handler(cmd_tag_key(),
--                             boost::bind(&usrp_source_impl::_cmd_handler_tag, this, _1));
-+    register_msg_cmd_handler(
-+        cmd_tag_key(),
-+        boost::bind(&usrp_source_impl::_cmd_handler_tag, this, boost::placeholders::_1));
- }
- 
- usrp_source_impl::~usrp_source_impl() {}
-diff --git a/gr-zeromq/lib/pub_msg_sink_impl.cc b/gr-zeromq/lib/pub_msg_sink_impl.cc
-index b5da7421e..957cfa411 100644
---- a/gr-zeromq/lib/pub_msg_sink_impl.cc
-+++ b/gr-zeromq/lib/pub_msg_sink_impl.cc
-@@ -62,7 +62,9 @@ pub_msg_sink_impl::pub_msg_sink_impl(char* address, int timeout, bool bind)
-     }
- 
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&pub_msg_sink_impl::handler, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&pub_msg_sink_impl::handler, this, boost::placeholders::_1));
- }
- 
- pub_msg_sink_impl::~pub_msg_sink_impl()
-diff --git a/gr-zeromq/lib/push_msg_sink_impl.cc b/gr-zeromq/lib/push_msg_sink_impl.cc
-index 4140781ab..7d07d3a30 100644
---- a/gr-zeromq/lib/push_msg_sink_impl.cc
-+++ b/gr-zeromq/lib/push_msg_sink_impl.cc
-@@ -62,7 +62,9 @@ push_msg_sink_impl::push_msg_sink_impl(char* address, int timeout, bool bind)
-     }
- 
-     message_port_register_in(pmt::mp("in"));
--    set_msg_handler(pmt::mp("in"), boost::bind(&push_msg_sink_impl::handler, this, _1));
-+    set_msg_handler(
-+        pmt::mp("in"),
-+        boost::bind(&push_msg_sink_impl::handler, this, boost::placeholders::_1));
- }
- 
- push_msg_sink_impl::~push_msg_sink_impl()
--- 
-2.26.2
-
diff --git a/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch b/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
deleted file mode 100644
index 6b8987fa5f..0000000000
--- a/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 84dea8284c521f08508bb2dcbc99db3b5d3438fd Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Thu, 27 Aug 2020 17:32:09 +0200
-Subject: [PATCH] gnuradio-runtime_pmt: dont hardcode
- INTERFACE_INCLUDE_DIRECTORIES
-
-gnuradio-runtimeTargets.cmake and gnuradio-pmtTargets.cmake are filled
-using CMAKE_INSTALL_PREFIX for INSTALL_INTERFACE.
-
-Since CMAKE_INSTALL_PREFIX, in buildroot, is set to /usr, these files contains
-path to host system.
-
-With BR2_COMPILER_PARANOID_UNSAFE_PATH package using gnuradio fails with:
-arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'
-
-By simply providing 'include', produced .cmake contains:
-INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
-instead of
-INTERFACE_INCLUDE_DIRECTORIES "/usr/include"
-
-[Upstream status: https://github.com/gnuradio/gnuradio/pull/3737]
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gnuradio-runtime/lib/CMakeLists.txt     | 2 +-
- gnuradio-runtime/lib/pmt/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gnuradio-runtime/lib/CMakeLists.txt b/gnuradio-runtime/lib/CMakeLists.txt
-index 5aa90a5e1..fc32f473b 100644
---- a/gnuradio-runtime/lib/CMakeLists.txt
-+++ b/gnuradio-runtime/lib/CMakeLists.txt
-@@ -214,7 +214,7 @@ target_link_libraries(gnuradio-runtime PUBLIC
- 
- target_include_directories(gnuradio-runtime
-   PUBLIC
--    $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
-+    $<INSTALL_INTERFACE:include>
-     $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
-     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/../include>
-   PRIVATE
-diff --git a/gnuradio-runtime/lib/pmt/CMakeLists.txt b/gnuradio-runtime/lib/pmt/CMakeLists.txt
-index 9fb98d0fc..6dfcd945c 100644
---- a/gnuradio-runtime/lib/pmt/CMakeLists.txt
-+++ b/gnuradio-runtime/lib/pmt/CMakeLists.txt
-@@ -33,7 +33,7 @@ target_link_libraries(gnuradio-pmt
- 
- target_include_directories(gnuradio-pmt
-   PUBLIC
--  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
-+  $<INSTALL_INTERFACE:include>
-   $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../../include>
-   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/
-   )
--- 
-2.26.2
-
diff --git a/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch b/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
deleted file mode 100644
index 034c10c5cc..0000000000
--- a/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 268b1a599304f58bd56c86ff09041b5912c24a0c Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Sun, 1 Nov 2020 17:24:36 +0100
-Subject: [PATCH] gr-qtgui: dont't add examples/c++ subdirectory when gr-analog
- is disabled
-
-gr-qtgui examples needs to have gr-analog enabled, without this dependency
-compile crash with:
-
-In file included from
-/x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.cc:22:
-/x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.h:24:10:
-fatal error: gnuradio/analog/noise_source.h: No such file or directory
-24 | #include <gnuradio/analog/noise_source.h>
-| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-compilation terminated.
-make[3]: *** [gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/build.make:67:
-gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/display_qt.cc.o] Error 1
-make[3]: *** Waiting for unfinished jobs....
-In file included from
-/somewhere/gnuradio/build/gr-qtgui/examples/c++/moc_display_qt.cpp:10:
-/somewhere/gnuradio/build/gr-qtgui/examples/c++/../../../../gr-qtgui/examples/c++/display_qt.h:24:10:
-fatal error: gnuradio/analog/noise_source.h: No such file or directory
-24 | #include <gnuradio/analog/noise_source.h>
-| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-compilation terminated.
-
-GR_ANALOG is not an explicit dependency of GR_QTGUI, so disable c++ examples if
-user has not selected this option.
-
-[backported from 7470a7a3771dd90defb826b464dfe62977cb1eb6]
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- gr-qtgui/CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/gr-qtgui/CMakeLists.txt b/gr-qtgui/CMakeLists.txt
-index 8831f3ad9..561186fbd 100644
---- a/gr-qtgui/CMakeLists.txt
-+++ b/gr-qtgui/CMakeLists.txt
-@@ -68,7 +68,9 @@ if(ENABLE_GR_QTGUI)
- add_subdirectory(include/gnuradio/qtgui)
- add_subdirectory(lib)
- add_subdirectory(docs)
--add_subdirectory(examples/c++)
-+if (ENABLE_GR_ANALOG)
-+	add_subdirectory(examples/c++)
-+endif(ENABLE_GR_ANALOG)
- if(ENABLE_PYTHON)
-     add_subdirectory(swig)
-     add_subdirectory(python/qtgui)
--- 
-2.26.2
-
diff --git a/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch b/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch
deleted file mode 100644
index 0c282b7322..0000000000
--- a/package/gnuradio/0005-boost-remove-deprecated-math-common_factor.hpp.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From 2c767bb260a25b415e8c9c4b3ea37280b2127cec Mon Sep 17 00:00:00 2001
-From: japm48 <japm48@users.noreply.github.com>
-Date: Fri, 10 Apr 2020 23:35:30 +0200
-Subject: [PATCH] boost: remove deprecated math/common_factor.hpp
-
-Remove deprecation warning and prefer using std::{lcm,gcd} to Boost.
-Fixes #2712.
-
-[Retrieved from:
-https://github.com/gnuradio/gnuradio/commit/2c767bb260a25b415e8c9c4b3ea37280b2127cec]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .../include/gnuradio/CMakeLists.txt           |  1 +
- .../include/gnuradio/integer_math.h           | 35 +++++++++++++++++++
- gnuradio-runtime/lib/buffer.cc                | 19 ++--------
- gr-digital/lib/symbol_sync_cc_impl.cc         |  4 +--
- gr-digital/lib/symbol_sync_ff_impl.cc         |  4 +--
- 5 files changed, 43 insertions(+), 20 deletions(-)
- create mode 100644 gnuradio-runtime/include/gnuradio/integer_math.h
-
-diff --git a/gnuradio-runtime/include/gnuradio/CMakeLists.txt b/gnuradio-runtime/include/gnuradio/CMakeLists.txt
-index 8d718e87b5b..056af5d6f48 100644
---- a/gnuradio-runtime/include/gnuradio/CMakeLists.txt
-+++ b/gnuradio-runtime/include/gnuradio/CMakeLists.txt
-@@ -31,6 +31,7 @@ install(FILES
-   gr_complex.h
-   hier_block2.h
-   high_res_timer.h
-+  integer_math.h
-   io_signature.h
-   logger.h
-   math.h
-diff --git a/gnuradio-runtime/include/gnuradio/integer_math.h b/gnuradio-runtime/include/gnuradio/integer_math.h
-new file mode 100644
-index 00000000000..15141049fa4
---- /dev/null
-+++ b/gnuradio-runtime/include/gnuradio/integer_math.h
-@@ -0,0 +1,35 @@
-+/* -*- c++ -*- */
-+/*
-+ * Copyright 2020 Free Software Foundation, Inc.
-+ *
-+ * This file is part of GNU Radio
-+ *
-+ * SPDX-License-Identifier: GPL-3.0-or-later
-+ *
-+ */
-+#ifndef INCLUDED_GR_INTEGER_MATH_H
-+#define INCLUDED_GR_INTEGER_MATH_H
-+
-+#if (__cplusplus >= 201703L)
-+
-+// Prefer C++17 goodness.
-+#include <numeric>
-+#define GR_GCD std::gcd
-+#define GR_LCM std::lcm
-+
-+#elif (BOOST_VERSION >= 105800)
-+
-+// Fallback: newer boost API (introduced in Boost 1.58.0).
-+#include <boost/integer/common_factor_rt.hpp>
-+#define GR_GCD boost::integer::gcd
-+#define GR_LCM boost::integer::lcm
-+
-+#else
-+
-+// Last resort: old deprecated boost API.
-+#include <boost/math/common_factor_rt.hpp>
-+#define GR_GCD boost::math::gcd
-+#define GR_LCM boost::math::lcm
-+
-+#endif /* __cplusplus >= 201703L */
-+#endif /* INCLUDED_GR_INTEGER_MATH_H */
-diff --git a/gnuradio-runtime/lib/buffer.cc b/gnuradio-runtime/lib/buffer.cc
-index 720c72c4ee8..46d704542b1 100644
---- a/gnuradio-runtime/lib/buffer.cc
-+++ b/gnuradio-runtime/lib/buffer.cc
-@@ -13,22 +13,13 @@
- #endif
- #include "vmcircbuf.h"
- #include <gnuradio/buffer.h>
-+#include <gnuradio/integer_math.h>
- #include <gnuradio/math.h>
- #include <assert.h>
- #include <algorithm>
- #include <iostream>
- #include <stdexcept>
- 
--// the following header is deprecated as of Boost 1.66.0, and the
--// other API was introduced in Boost 1.58.0. Since we still support
--// Boost back to 1.54.0, use the older API if pre-1.5.80 and otherwise
--// use the newer API.
--#if (BOOST_VERSION < 105800)
--#include <boost/math/common_factor_rt.hpp>
--#else
--#include <boost/integer/common_factor_rt.hpp>
--#endif
--
- namespace gr {
- 
- static long s_buffer_count = 0; // counts for debugging storage mgmt
-@@ -68,13 +59,9 @@ static long s_buffer_reader_count = 0;
-  *
-  *     type_size * nitems == k * page_size
-  */
--static long minimum_buffer_items(long type_size, long page_size)
-+static inline long minimum_buffer_items(long type_size, long page_size)
- {
--#if (BOOST_VERSION < 105800)
--    return page_size / boost::math::gcd(type_size, page_size);
--#else
--    return page_size / boost::integer::gcd(type_size, page_size);
--#endif
-+    return page_size / GR_GCD(type_size, page_size);
- }
- 
- 
-diff --git a/gr-digital/lib/symbol_sync_cc_impl.cc b/gr-digital/lib/symbol_sync_cc_impl.cc
-index 55f85e7c6a7..55f162dc727 100644
---- a/gr-digital/lib/symbol_sync_cc_impl.cc
-+++ b/gr-digital/lib/symbol_sync_cc_impl.cc
-@@ -13,9 +13,9 @@
- #endif
- 
- #include "symbol_sync_cc_impl.h"
-+#include <gnuradio/integer_math.h>
- #include <gnuradio/io_signature.h>
- #include <gnuradio/math.h>
--#include <boost/math/common_factor.hpp>
- #include <stdexcept>
- 
- namespace gr {
-@@ -95,7 +95,7 @@ symbol_sync_cc_impl::symbol_sync_cc_impl(enum ted_type detector_type,
-         throw std::runtime_error("unable to create interpolating_resampler_ccf");
- 
-     // Block Internal Clocks
--    d_interps_per_symbol_n = boost::math::lcm(d_ted->inputs_per_symbol(), d_osps_n);
-+    d_interps_per_symbol_n = GR_LCM(d_ted->inputs_per_symbol(), d_osps_n);
-     d_interps_per_ted_input_n = d_interps_per_symbol_n / d_ted->inputs_per_symbol();
-     d_interps_per_output_sample_n = d_interps_per_symbol_n / d_osps_n;
- 
-diff --git a/gr-digital/lib/symbol_sync_ff_impl.cc b/gr-digital/lib/symbol_sync_ff_impl.cc
-index d0ec32ab192..1172c1b4f8a 100644
---- a/gr-digital/lib/symbol_sync_ff_impl.cc
-+++ b/gr-digital/lib/symbol_sync_ff_impl.cc
-@@ -13,9 +13,9 @@
- #endif
- 
- #include "symbol_sync_ff_impl.h"
-+#include <gnuradio/integer_math.h>
- #include <gnuradio/io_signature.h>
- #include <gnuradio/math.h>
--#include <boost/math/common_factor.hpp>
- #include <stdexcept>
- 
- namespace gr {
-@@ -97,7 +97,7 @@ symbol_sync_ff_impl::symbol_sync_ff_impl(enum ted_type detector_type,
-         throw std::runtime_error("unable to create interpolating_resampler_fff");
- 
-     // Block Internal Clocks
--    d_interps_per_symbol_n = boost::math::lcm(d_ted->inputs_per_symbol(), d_osps_n);
-+    d_interps_per_symbol_n = GR_LCM(d_ted->inputs_per_symbol(), d_osps_n);
-     d_interps_per_ted_input_n = d_interps_per_symbol_n / d_ted->inputs_per_symbol();
-     d_interps_per_output_sample_n = d_interps_per_symbol_n / d_osps_n;
- 
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 103175946c..2d17fc087f 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -15,19 +15,19 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
-	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_LOG4CPP
 	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_SPDLOG
 	select BR2_PACKAGE_VOLK
 	help
 	  GNU Radio is a free & open-source software development
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index 90343cf385..efa0bb462b 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3e293541a9ac8d78660762bae8b80c0f6195b3494e1c50c01a9fd79cc60bb624  gnuradio-3.8.2.0.tar.gz
+sha256  c6b9f59447a842559b00b3a67b4ca1186e9adb8db742b25400507fedc747f2bd  gnuradio-3.10.4.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index e36dce081c..cc41f1e12b 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,22 +4,19 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.8.2.0
-GNURADIO_SITE = https://github.com/gnuradio/gnuradio/releases/download/v$(GNURADIO_VERSION)
+GNURADIO_VERSION = 3.10.4.0
+GNURADIO_SITE = $(call github,gnuradio,gnuradio,v$(GNURADIO_VERSION))
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
 
 GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
 	host-python3 \
-	host-python-mako \
-	host-python-six \
-	host-swig \
 	boost \
 	log4cpp \
 	gmp \
+	spdlog \
 	volk
 
 GNURADIO_CONF_OPTS = \
@@ -115,7 +112,8 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GNURADIO_DEPENDENCIES += python3
+GNURADIO_DEPENDENCIES += python3 python-pybind \
+	host-python-numpy host-python-packaging
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 # mandatory to install python modules in site-packages and to use
 # correct path for python libraries
-- 
2.30.2


--===============7225784243102401657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7225784243102401657==--
