From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 00:07:51 +0200
Subject: [Buildroot] [git commit] package/uhd: new package
Message-ID: <20200902161637.4F51785EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=130a0163af4eca54fd917529edb44ad9bfe8eb5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 ...ists-add-boost-unit_test_framework-requir.patch |  40 ++
 package/uhd/0002-host-fix-build-boost-173.patch    | 577 +++++++++++++++++++++
 package/uhd/Config.in                              |  75 +++
 package/uhd/uhd.hash                               |   4 +
 package/uhd/uhd.mk                                 |  94 ++++
 7 files changed, 792 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d49b927756..f4980c72cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1094,6 +1094,7 @@ F:	package/python-cheetah/
 F:	package/python-markdown/
 F:	package/python-remi/
 F:	package/python-sip/
+F:	package/uhd/
 
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
diff --git a/package/Config.in b/package/Config.in
index 15329929e2..efa5e474c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1536,6 +1536,7 @@ menu "Hardware handling"
 	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
 	source "package/tslib/Config.in"
+	source "package/uhd/Config.in"
 	source "package/urg/Config.in"
 endmenu
 
diff --git a/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
new file mode 100644
index 0000000000..a79b650bed
--- /dev/null
+++ b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
@@ -0,0 +1,40 @@
+From 881705ec581ab7cd61c8e4fe134db8854a83ec4e Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Tue, 28 Apr 2020 16:56:29 +0200
+Subject: [PATCH] host: CMakeLists: add boost unit_test_framework required only
+ when ENABLE_TESTS=ON
+
+By default, boost unit_test_framework is always required, but only use
+when ENABLE_TESTS=ON.
+This PR suppress unit_test_framework to the default list and append
+UHD_BOOST_REQUIRED_COMPONENTS when this library is needed
+
+[backported from https://github.com/EttusResearch/uhd/pull/341]
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ host/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
+index 8f72ece76..a7731ffbd 100644
+--- a/host/CMakeLists.txt
++++ b/host/CMakeLists.txt
+@@ -291,10 +291,14 @@ set(UHD_BOOST_REQUIRED_COMPONENTS
+     filesystem
+     program_options
+     system
+-    unit_test_framework
+     serialization
+     thread
+ )
++
++if(ENABLE_TESTS)
++    list(APPEND UHD_BOOST_REQUIRED_COMPONENTS unit_test_framework)
++endif(ENABLE_TESTS)
++
+ include(UHDBoost)
+ 
+ include_directories(${Boost_INCLUDE_DIRS})
+-- 
+2.26.2
+
diff --git a/package/uhd/0002-host-fix-build-boost-173.patch b/package/uhd/0002-host-fix-build-boost-173.patch
new file mode 100644
index 0000000000..b685b5f8a7
--- /dev/null
+++ b/package/uhd/0002-host-fix-build-boost-173.patch
@@ -0,0 +1,577 @@
+From 13caaf001061db3c01082c4574a5e326c4969ab6 Mon Sep 17 00:00:00 2001
+From: Martin Braun <martin.braun@ettus.com>
+Date: Thu, 16 Jul 2020 13:07:34 +0200
+Subject: [PATCH] boost: Include bind.hpp where used, add
+ BOOST_BIND_GLOBAL_PLACEHOLDERS
+
+Consists of two changes:
+- Grepped for files that use boost::bind, but don't include
+  boost/bind.hpp. Changed all of those to include bind.hpp
+- Add BOOST_BIND_GLOBAL_PLACEHOLDERS so that Boost doesn't complain
+  about using bind placeholders in the global namespace.
+
+Background: boost/bind.hpp is a convenience header that pulls the Boost
+bind placeholders into the global namespace, but that's deprecated
+behaviour. For UHD 3.15, we'll keep the deprecated behaviour (modern UHD
+no longer uses Boost.Bind), so this fixes build failures with modern
+Boost, and related warnings.
+
+Patch retrieved from
+https://github.com/EttusResearch/uhd/commit/13caaf001061db3c01082c4574a5e326c4969ab6
+
+Signed-off-by: Martin Braun <martin.braun@ettus.com>
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ host/cmake/Modules/UHDBoost.cmake                      | 3 +++
+ host/examples/network_relay.cpp                        | 1 +
+ host/examples/rfnoc_rx_to_file.cpp                     | 1 +
+ host/examples/test_clock_synch.cpp                     | 1 +
+ host/examples/txrx_loopback_to_file.cpp                | 1 +
+ host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp            | 1 +
+ host/lib/rfnoc/legacy_compat.cpp                       | 1 +
+ host/lib/transport/xport_benchmarker.cpp               | 1 +
+ host/lib/usrp/b100/b100_impl.cpp                       | 1 +
+ host/lib/usrp/b200/b200_iface.cpp                      | 1 +
+ host/lib/usrp/b200/b200_impl.cpp                       | 1 +
+ host/lib/usrp/cores/rx_dsp_core_3000.cpp               | 1 +
+ host/lib/usrp/cores/tx_dsp_core_3000.cpp               | 1 +
+ host/lib/usrp/dboard/db_cbx.cpp                        | 1 +
+ host/lib/usrp/dboard/db_dbsrx.cpp                      | 1 +
+ host/lib/usrp/dboard/db_dbsrx2.cpp                     | 1 +
+ host/lib/usrp/dboard/db_sbx_common.cpp                 | 1 +
+ host/lib/usrp/dboard/db_sbx_version3.cpp               | 1 +
+ host/lib/usrp/dboard/db_sbx_version4.cpp               | 1 +
+ host/lib/usrp/dboard/db_tvrx.cpp                       | 1 +
+ host/lib/usrp/dboard/db_tvrx2.cpp                      | 1 +
+ host/lib/usrp/dboard/db_twinrx.cpp                     | 1 +
+ host/lib/usrp/dboard/db_ubx.cpp                        | 1 +
+ host/lib/usrp/dboard/db_wbx_common.cpp                 | 1 +
+ host/lib/usrp/dboard/db_wbx_simple.cpp                 | 1 +
+ host/lib/usrp/dboard/db_wbx_version2.cpp               | 1 +
+ host/lib/usrp/dboard/db_wbx_version3.cpp               | 1 +
+ host/lib/usrp/dboard/db_wbx_version4.cpp               | 1 +
+ host/lib/usrp/dboard/db_xcvr2450.cpp                   | 1 +
+ host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp | 1 +
+ host/lib/usrp/multi_usrp.cpp                           | 1 +
+ host/lib/usrp/n230/n230_resource_manager.cpp           | 1 +
+ host/lib/usrp/n230/n230_uart.cpp                       | 1 +
+ host/lib/usrp/usrp1/soft_time_ctrl.cpp                 | 1 +
+ host/lib/usrp/usrp1/usrp1_impl.cpp                     | 1 +
+ host/lib/usrp/x300/x300_radio_ctrl_impl.cpp            | 1 +
+ host/lib/usrp_clock/octoclock/octoclock_impl.cpp       | 1 +
+ host/lib/utils/ihex.cpp                                | 1 +
+ host/lib/utils/tasks.cpp                               | 1 +
+ host/utils/uhd_cal_rx_iq_balance.cpp                   | 1 +
+ host/utils/uhd_cal_tx_dc_offset.cpp                    | 1 +
+ host/utils/uhd_cal_tx_iq_balance.cpp                   | 1 +
+ 42 files changed, 44 insertions(+)
+
+diff --git a/host/cmake/Modules/UHDBoost.cmake b/host/cmake/Modules/UHDBoost.cmake
+index 5ebb4acef..e3ee42b50 100644
+--- a/host/cmake/Modules/UHDBoost.cmake
++++ b/host/cmake/Modules/UHDBoost.cmake
+@@ -259,6 +259,9 @@ else()
+     # disable Boost's use of std::experimental::string_view
+     # works for Boost 1.67.0 and newer & doesn't hurt older
+     add_definitions(-DBOOST_ASIO_DISABLE_STD_EXPERIMENTAL_STRING_VIEW)
++    # UHD 3.15 still uses global placeholders (_1, _2, ...) from Boost which
++    # need to be enabled explicitly for some Boost versions
++    add_definitions(-DBOOST_BIND_GLOBAL_PLACEHOLDERS)
+ 
+     # Boost 1.70.0's find cmake scripts don't always set the expected
+     # return variables. Replicate the commit that fixes that issue here:
+diff --git a/host/examples/network_relay.cpp b/host/examples/network_relay.cpp
+index bf2ac9255..9a9f56eb5 100644
+--- a/host/examples/network_relay.cpp
++++ b/host/examples/network_relay.cpp
+@@ -8,6 +8,7 @@
+ #include <uhd/utils/safe_main.hpp>
+ #include <uhd/utils/thread.hpp>
+ #include <boost/asio.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/program_options.hpp>
+ #include <boost/thread/condition_variable.hpp>
+diff --git a/host/examples/rfnoc_rx_to_file.cpp b/host/examples/rfnoc_rx_to_file.cpp
+index 5bb9985ae..cbd35cbe8 100644
+--- a/host/examples/rfnoc_rx_to_file.cpp
++++ b/host/examples/rfnoc_rx_to_file.cpp
+@@ -23,6 +23,7 @@
+ #include <uhd/types/tune_request.hpp>
+ #include <uhd/utils/safe_main.hpp>
+ #include <uhd/utils/thread.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/program_options.hpp>
+ #include <chrono>
+diff --git a/host/examples/test_clock_synch.cpp b/host/examples/test_clock_synch.cpp
+index 8556063d7..ec071f7c7 100644
+--- a/host/examples/test_clock_synch.cpp
++++ b/host/examples/test_clock_synch.cpp
+@@ -12,6 +12,7 @@
+ #include <uhd/usrp_clock/multi_usrp_clock.hpp>
+ #include <uhd/utils/safe_main.hpp>
+ #include <uhd/utils/thread.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/program_options.hpp>
+ #include <chrono>
+diff --git a/host/examples/txrx_loopback_to_file.cpp b/host/examples/txrx_loopback_to_file.cpp
+index 271d249f6..a2f0427c9 100644
+--- a/host/examples/txrx_loopback_to_file.cpp
++++ b/host/examples/txrx_loopback_to_file.cpp
+@@ -13,6 +13,7 @@
+ #include <uhd/utils/static.hpp>
+ #include <uhd/utils/thread.hpp>
+ #include <boost/algorithm/string.hpp>
++#include <boost/bind.hpp>
+ #include <boost/filesystem.hpp>
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions/round.hpp>
+diff --git a/host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp b/host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp
+index a80e2ef53..b78635002 100644
+--- a/host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp
++++ b/host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp
+@@ -11,6 +11,7 @@
+ #include <uhd/utils/log.hpp>
+ #include <uhdlib/rfnoc/wb_iface_adapter.hpp>
+ #include <uhdlib/usrp/cores/dma_fifo_core_3000.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/make_shared.hpp>
+ #include <boost/thread/mutex.hpp>
+diff --git a/host/lib/rfnoc/legacy_compat.cpp b/host/lib/rfnoc/legacy_compat.cpp
+index 91de361df..f93fe871a 100644
+--- a/host/lib/rfnoc/legacy_compat.cpp
++++ b/host/lib/rfnoc/legacy_compat.cpp
+@@ -19,6 +19,7 @@
+ #include <uhd/usrp/subdev_spec.hpp>
+ #include <uhd/utils/log.hpp>
+ #include <uhdlib/rfnoc/legacy_compat.hpp>
++#include <boost/bind.hpp>
+ #include <boost/make_shared.hpp>
+ #include <set>
+ 
+diff --git a/host/lib/transport/xport_benchmarker.cpp b/host/lib/transport/xport_benchmarker.cpp
+index 67582ff2c..7abd4c5fd 100644
+--- a/host/lib/transport/xport_benchmarker.cpp
++++ b/host/lib/transport/xport_benchmarker.cpp
+@@ -6,6 +6,7 @@
+ //
+ 
+ #include "xport_benchmarker.hpp"
++#include <boost/bind.hpp>
+ #include <chrono>
+ #include <thread>
+ 
+diff --git a/host/lib/usrp/b100/b100_impl.cpp b/host/lib/usrp/b100/b100_impl.cpp
+index cd4319803..08006ae32 100644
+--- a/host/lib/usrp/b100/b100_impl.cpp
++++ b/host/lib/usrp/b100/b100_impl.cpp
+@@ -15,6 +15,7 @@
+ #include <uhd/utils/paths.hpp>
+ #include <uhd/utils/safe_call.hpp>
+ #include <uhdlib/usrp/common/apply_corrections.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <cstdio>
+ #include <iostream>
+diff --git a/host/lib/usrp/b200/b200_iface.cpp b/host/lib/usrp/b200/b200_iface.cpp
+index 082be071c..cdf88f69b 100644
+--- a/host/lib/usrp/b200/b200_iface.cpp
++++ b/host/lib/usrp/b200/b200_iface.cpp
+@@ -12,6 +12,7 @@
+ #include <uhd/exception.hpp>
+ #include <uhdlib/utils/ihex.hpp>
+ 
++#include <boost/bind.hpp>
+ #include <boost/functional/hash.hpp>
+ #include <boost/lexical_cast.hpp>
+ #include <boost/format.hpp>
+diff --git a/host/lib/usrp/b200/b200_impl.cpp b/host/lib/usrp/b200/b200_impl.cpp
+index 1be8c263b..c0f8ee1ac 100644
+--- a/host/lib/usrp/b200/b200_impl.cpp
++++ b/host/lib/usrp/b200/b200_impl.cpp
+@@ -17,6 +17,7 @@
+ #include <uhd/utils/safe_call.hpp>
+ #include <uhd/usrp/dboard_eeprom.hpp>
+ #include <boost/format.hpp>
++#include <boost/bind.hpp>
+ #include <boost/filesystem.hpp>
+ #include <boost/lexical_cast.hpp>
+ #include <boost/functional/hash.hpp>
+diff --git a/host/lib/usrp/cores/rx_dsp_core_3000.cpp b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
+index 46fce3f69..ff7caf105 100644
+--- a/host/lib/usrp/cores/rx_dsp_core_3000.cpp
++++ b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
+@@ -13,6 +13,7 @@
+ #include <uhdlib/usrp/cores/dsp_core_utils.hpp>
+ #include <uhdlib/usrp/cores/rx_dsp_core_3000.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/thread/thread.hpp> //thread sleep
+ #include <algorithm>
+diff --git a/host/lib/usrp/cores/tx_dsp_core_3000.cpp b/host/lib/usrp/cores/tx_dsp_core_3000.cpp
+index be7593841..b76a74b1c 100644
+--- a/host/lib/usrp/cores/tx_dsp_core_3000.cpp
++++ b/host/lib/usrp/cores/tx_dsp_core_3000.cpp
+@@ -12,6 +12,7 @@
+ #include <uhdlib/usrp/cores/dsp_core_utils.hpp>
+ #include <uhdlib/usrp/cores/tx_dsp_core_3000.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/thread/thread.hpp> //sleep
+ #include <algorithm>
+diff --git a/host/lib/usrp/dboard/db_cbx.cpp b/host/lib/usrp/dboard/db_cbx.cpp
+index dd0640d00..f5c7f2399 100644
+--- a/host/lib/usrp/dboard/db_cbx.cpp
++++ b/host/lib/usrp/dboard/db_cbx.cpp
+@@ -7,6 +7,7 @@
+ 
+ #include "db_sbx_common.hpp"
+ #include <boost/algorithm/string.hpp>
++#include <boost/bind.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ 
+ using namespace uhd;
+diff --git a/host/lib/usrp/dboard/db_dbsrx.cpp b/host/lib/usrp/dboard/db_dbsrx.cpp
+index 587158470..dc82b60f9 100644
+--- a/host/lib/usrp/dboard/db_dbsrx.cpp
++++ b/host/lib/usrp/dboard/db_dbsrx.cpp
+@@ -21,6 +21,7 @@
+ #include <uhd/usrp/dboard_base.hpp>
+ #include <uhd/usrp/dboard_manager.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <utility>
+diff --git a/host/lib/usrp/dboard/db_dbsrx2.cpp b/host/lib/usrp/dboard/db_dbsrx2.cpp
+index e2505dfd7..da4da4148 100644
+--- a/host/lib/usrp/dboard/db_dbsrx2.cpp
++++ b/host/lib/usrp/dboard/db_dbsrx2.cpp
+@@ -18,6 +18,7 @@
+ #include <uhd/usrp/dboard_base.hpp>
+ #include <uhd/usrp/dboard_manager.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/thread.hpp>
+ #include <boost/math/special_functions/round.hpp>
+diff --git a/host/lib/usrp/dboard/db_sbx_common.cpp b/host/lib/usrp/dboard/db_sbx_common.cpp
+index b6eaedc3d..95aff96b4 100644
+--- a/host/lib/usrp/dboard/db_sbx_common.cpp
++++ b/host/lib/usrp/dboard/db_sbx_common.cpp
+@@ -6,6 +6,7 @@
+ //
+ 
+ #include "db_sbx_common.hpp"
++#include <boost/bind.hpp>
+ 
+ using namespace uhd;
+ using namespace uhd::usrp;
+diff --git a/host/lib/usrp/dboard/db_sbx_version3.cpp b/host/lib/usrp/dboard/db_sbx_version3.cpp
+index 369315b2e..fb829cf34 100644
+--- a/host/lib/usrp/dboard/db_sbx_version3.cpp
++++ b/host/lib/usrp/dboard/db_sbx_version3.cpp
+@@ -9,6 +9,7 @@
+ #include "db_sbx_common.hpp"
+ #include <uhd/types/tune_request.hpp>
+ #include <boost/algorithm/string.hpp>
++#include <boost/bind.hpp>
+ 
+ using namespace uhd;
+ using namespace uhd::usrp;
+diff --git a/host/lib/usrp/dboard/db_sbx_version4.cpp b/host/lib/usrp/dboard/db_sbx_version4.cpp
+index d1c76287b..e1adebf99 100644
+--- a/host/lib/usrp/dboard/db_sbx_version4.cpp
++++ b/host/lib/usrp/dboard/db_sbx_version4.cpp
+@@ -9,6 +9,7 @@
+ #include "db_sbx_common.hpp"
+ #include <uhd/types/tune_request.hpp>
+ #include <boost/algorithm/string.hpp>
++#include <boost/bind.hpp>
+ 
+ using namespace uhd;
+ using namespace uhd::usrp;
+diff --git a/host/lib/usrp/dboard/db_tvrx.cpp b/host/lib/usrp/dboard/db_tvrx.cpp
+index 8bf377c4d..5fbbf5bee 100644
+--- a/host/lib/usrp/dboard/db_tvrx.cpp
++++ b/host/lib/usrp/dboard/db_tvrx.cpp
+@@ -28,6 +28,7 @@
+ #include <uhd/usrp/dboard_base.hpp>
+ #include <uhd/usrp/dboard_manager.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/thread.hpp>
+ #include <boost/array.hpp>
+diff --git a/host/lib/usrp/dboard/db_tvrx2.cpp b/host/lib/usrp/dboard/db_tvrx2.cpp
+index 5dba83551..e1623487d 100644
+--- a/host/lib/usrp/dboard/db_tvrx2.cpp
++++ b/host/lib/usrp/dboard/db_tvrx2.cpp
+@@ -55,6 +55,7 @@
+ #include <uhd/usrp/dboard_manager.hpp>
+ #include <boost/assign/list_of.hpp>
+ #include <boost/format.hpp>
++#include <boost/bind.hpp>
+ #include <boost/array.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <utility>
+diff --git a/host/lib/usrp/dboard/db_twinrx.cpp b/host/lib/usrp/dboard/db_twinrx.cpp
+index de1cd3f33..aa9da8adf 100644
+--- a/host/lib/usrp/dboard/db_twinrx.cpp
++++ b/host/lib/usrp/dboard/db_twinrx.cpp
+@@ -19,6 +19,7 @@
+ #include <uhd/utils/log.hpp>
+ #include <uhd/utils/static.hpp>
+ #include "dboard_ctor_args.hpp"
++#include <boost/bind.hpp>
+ #include <boost/make_shared.hpp>
+ #include <boost/thread.hpp>
+ #include <boost/thread/mutex.hpp>
+diff --git a/host/lib/usrp/dboard/db_ubx.cpp b/host/lib/usrp/dboard/db_ubx.cpp
+index 305a69c52..e78f9db75 100644
+--- a/host/lib/usrp/dboard/db_ubx.cpp
++++ b/host/lib/usrp/dboard/db_ubx.cpp
+@@ -20,6 +20,7 @@
+ #include <uhd/utils/safe_call.hpp>
+ #include <uhdlib/usrp/common/max287x.hpp>
+ 
++#include <boost/bind.hpp>
+ #include <boost/shared_ptr.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/algorithm/string.hpp>
+diff --git a/host/lib/usrp/dboard/db_wbx_common.cpp b/host/lib/usrp/dboard/db_wbx_common.cpp
+index 41f323d19..fd7b2481a 100644
+--- a/host/lib/usrp/dboard/db_wbx_common.cpp
++++ b/host/lib/usrp/dboard/db_wbx_common.cpp
+@@ -12,6 +12,7 @@
+ #include <uhd/utils/assert_has.hpp>
+ #include <uhd/utils/algorithm.hpp>
+ #include <uhd/utils/log.hpp>
++#include <boost/bind.hpp>
+ 
+ using namespace uhd;
+ using namespace uhd::usrp;
+diff --git a/host/lib/usrp/dboard/db_wbx_simple.cpp b/host/lib/usrp/dboard/db_wbx_simple.cpp
+index 390c5c47a..e3a5667c7 100644
+--- a/host/lib/usrp/dboard/db_wbx_simple.cpp
++++ b/host/lib/usrp/dboard/db_wbx_simple.cpp
+@@ -17,6 +17,7 @@
+ #include <uhd/utils/assert_has.hpp>
+ #include <uhd/usrp/dboard_manager.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ 
+ using namespace uhd;
+ using namespace uhd::usrp;
+diff --git a/host/lib/usrp/dboard/db_wbx_version2.cpp b/host/lib/usrp/dboard/db_wbx_version2.cpp
+index 775ee4467..f1bf7dacc 100644
+--- a/host/lib/usrp/dboard/db_wbx_version2.cpp
++++ b/host/lib/usrp/dboard/db_wbx_version2.cpp
+@@ -16,6 +16,7 @@
+ 
+ #include <uhd/usrp/dboard_base.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/algorithm/string.hpp>
+diff --git a/host/lib/usrp/dboard/db_wbx_version3.cpp b/host/lib/usrp/dboard/db_wbx_version3.cpp
+index 41979f8ef..b755d09a2 100644
+--- a/host/lib/usrp/dboard/db_wbx_version3.cpp
++++ b/host/lib/usrp/dboard/db_wbx_version3.cpp
+@@ -15,6 +15,7 @@
+ 
+ #include <uhd/usrp/dboard_base.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/algorithm/string.hpp>
+diff --git a/host/lib/usrp/dboard/db_wbx_version4.cpp b/host/lib/usrp/dboard/db_wbx_version4.cpp
+index 8b3d13b37..f2976d3a7 100644
+--- a/host/lib/usrp/dboard/db_wbx_version4.cpp
++++ b/host/lib/usrp/dboard/db_wbx_version4.cpp
+@@ -15,6 +15,7 @@
+ 
+ #include <uhd/usrp/dboard_base.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/algorithm/string.hpp>
+diff --git a/host/lib/usrp/dboard/db_xcvr2450.cpp b/host/lib/usrp/dboard/db_xcvr2450.cpp
+index 9e1c9f2b0..8f95dbb1c 100644
+--- a/host/lib/usrp/dboard/db_xcvr2450.cpp
++++ b/host/lib/usrp/dboard/db_xcvr2450.cpp
+@@ -49,6 +49,7 @@
+ #include <uhd/usrp/dboard_base.hpp>
+ #include <uhd/usrp/dboard_manager.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <utility>
+diff --git a/host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp b/host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp
+index 73851656b..717fa144f 100644
+--- a/host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp
++++ b/host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp
+@@ -11,6 +11,7 @@
+ #include <uhd/rfnoc/node_ctrl_base.hpp>
+ #include <uhd/types/ranges.hpp>
+ #include <boost/algorithm/string.hpp>
++#include <boost/bind.hpp>
+ #include <boost/make_shared.hpp>
+ #include <boost/date_time/posix_time/posix_time_io.hpp>
+ #include <boost/format.hpp>
+diff --git a/host/lib/usrp/multi_usrp.cpp b/host/lib/usrp/multi_usrp.cpp
+index 49ffec698..13cb03cf9 100644
+--- a/host/lib/usrp/multi_usrp.cpp
++++ b/host/lib/usrp/multi_usrp.cpp
+@@ -21,6 +21,7 @@
+ #include <uhdlib/usrp/gpio_defs.hpp>
+ #include <uhdlib/rfnoc/legacy_compat.hpp>
+ #include <boost/assign/list_of.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/algorithm/string.hpp>
+ #include <algorithm>
+diff --git a/host/lib/usrp/n230/n230_resource_manager.cpp b/host/lib/usrp/n230/n230_resource_manager.cpp
+index 22f8ddedb..df3c9fb15 100644
+--- a/host/lib/usrp/n230/n230_resource_manager.cpp
++++ b/host/lib/usrp/n230/n230_resource_manager.cpp
+@@ -14,6 +14,7 @@
+ #include <uhd/utils/log.hpp>
+ #include <uhd/utils/platform.hpp>
+ #include <uhd/utils/paths.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/functional/hash.hpp>
+ #include <boost/make_shared.hpp>
+diff --git a/host/lib/usrp/n230/n230_uart.cpp b/host/lib/usrp/n230/n230_uart.cpp
+index 8689335c8..26fafde94 100644
+--- a/host/lib/usrp/n230/n230_uart.cpp
++++ b/host/lib/usrp/n230/n230_uart.cpp
+@@ -13,6 +13,7 @@
+ #include <uhd/utils/log.hpp>
+ #include <uhd/types/time_spec.hpp>
+ #include <uhd/exception.hpp>
++#include <boost/bind.hpp>
+ 
+ using namespace uhd;
+ using namespace uhd::transport;
+diff --git a/host/lib/usrp/usrp1/soft_time_ctrl.cpp b/host/lib/usrp/usrp1/soft_time_ctrl.cpp
+index 7f39caf8a..9a84ee188 100644
+--- a/host/lib/usrp/usrp1/soft_time_ctrl.cpp
++++ b/host/lib/usrp/usrp1/soft_time_ctrl.cpp
+@@ -8,6 +8,7 @@
+ #include "soft_time_ctrl.hpp"
+ #include <uhdlib/utils/system_time.hpp>
+ #include <uhd/utils/tasks.hpp>
++#include <boost/bind.hpp>
+ #include <boost/make_shared.hpp>
+ #include <boost/thread/condition_variable.hpp>
+ #include <boost/date_time/posix_time/posix_time.hpp>
+diff --git a/host/lib/usrp/usrp1/usrp1_impl.cpp b/host/lib/usrp/usrp1/usrp1_impl.cpp
+index 2134f8182..1e83ce3fc 100644
+--- a/host/lib/usrp/usrp1/usrp1_impl.cpp
++++ b/host/lib/usrp/usrp1/usrp1_impl.cpp
+@@ -14,6 +14,7 @@
+ #include <uhd/exception.hpp>
+ #include <uhd/utils/static.hpp>
+ #include <uhd/utils/paths.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/filesystem.hpp>
+ #include <boost/lexical_cast.hpp>
+diff --git a/host/lib/usrp/x300/x300_radio_ctrl_impl.cpp b/host/lib/usrp/x300/x300_radio_ctrl_impl.cpp
+index 8d967ae15..de36379ea 100644
+--- a/host/lib/usrp/x300/x300_radio_ctrl_impl.cpp
++++ b/host/lib/usrp/x300/x300_radio_ctrl_impl.cpp
+@@ -17,6 +17,7 @@
+ #include <uhdlib/usrp/common/apply_corrections.hpp>
+ #include <uhdlib/usrp/cores/gpio_atr_3000.hpp>
+ #include <boost/algorithm/string.hpp>
++#include <boost/bind.hpp>
+ #include <boost/date_time/posix_time/posix_time_io.hpp>
+ #include <boost/make_shared.hpp>
+ #include <chrono>
+diff --git a/host/lib/usrp_clock/octoclock/octoclock_impl.cpp b/host/lib/usrp_clock/octoclock/octoclock_impl.cpp
+index f3cf3f4ea..4c11788d2 100644
+--- a/host/lib/usrp_clock/octoclock/octoclock_impl.cpp
++++ b/host/lib/usrp_clock/octoclock/octoclock_impl.cpp
+@@ -9,6 +9,7 @@
+ 
+ #include <boost/asio.hpp>
+ #include <boost/assign.hpp>
++#include <boost/bind.hpp>
+ #include <stdint.h>
+ #include <boost/filesystem.hpp>
+ #include <boost/format.hpp>
+diff --git a/host/lib/utils/ihex.cpp b/host/lib/utils/ihex.cpp
+index 6bb0ba9d4..7fb605627 100644
+--- a/host/lib/utils/ihex.cpp
++++ b/host/lib/utils/ihex.cpp
+@@ -7,6 +7,7 @@
+ 
+ #include <uhd/exception.hpp>
+ #include <uhdlib/utils/ihex.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/make_shared.hpp>
+ #include <sstream>
+diff --git a/host/lib/utils/tasks.cpp b/host/lib/utils/tasks.cpp
+index 888a5a8f1..e5195fcf1 100644
+--- a/host/lib/utils/tasks.cpp
++++ b/host/lib/utils/tasks.cpp
+@@ -10,6 +10,7 @@
+ #include <uhd/utils/thread.hpp>
+ #include <uhd/utils/log.hpp>
+ #include <uhd/exception.hpp>
++#include <boost/bind.hpp>
+ #include <boost/thread/thread.hpp>
+ #include <boost/thread/barrier.hpp>
+ #include <exception>
+diff --git a/host/utils/uhd_cal_rx_iq_balance.cpp b/host/utils/uhd_cal_rx_iq_balance.cpp
+index c68c96173..3f5fa1788 100644
+--- a/host/utils/uhd_cal_rx_iq_balance.cpp
++++ b/host/utils/uhd_cal_rx_iq_balance.cpp
+@@ -11,6 +11,7 @@
+ #include <uhd/utils/paths.hpp>
+ #include <uhd/utils/safe_main.hpp>
+ #include <uhd/utils/thread.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/program_options.hpp>
+diff --git a/host/utils/uhd_cal_tx_dc_offset.cpp b/host/utils/uhd_cal_tx_dc_offset.cpp
+index f47b5e913..2cb65d3f5 100644
+--- a/host/utils/uhd_cal_tx_dc_offset.cpp
++++ b/host/utils/uhd_cal_tx_dc_offset.cpp
+@@ -11,6 +11,7 @@
+ #include <uhd/utils/paths.hpp>
+ #include <uhd/utils/safe_main.hpp>
+ #include <uhd/utils/thread.hpp>
++#include <boost/bind.hpp>
+ #include <boost/format.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/program_options.hpp>
+diff --git a/host/utils/uhd_cal_tx_iq_balance.cpp b/host/utils/uhd_cal_tx_iq_balance.cpp
+index 2e7229fd3..ace93462e 100644
+--- a/host/utils/uhd_cal_tx_iq_balance.cpp
++++ b/host/utils/uhd_cal_tx_iq_balance.cpp
+@@ -8,6 +8,7 @@
+ #include "usrp_cal_utils.hpp"
+ #include <uhd/utils/safe_main.hpp>
+ #include <uhd/utils/thread.hpp>
++#include <boost/bind.hpp>
+ #include <boost/math/special_functions/round.hpp>
+ #include <boost/program_options.hpp>
+ #include <boost/thread/thread.hpp>
+-- 
+2.26.2
+
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
new file mode 100644
index 0000000000..21b10210ab
--- /dev/null
+++ b/package/uhd/Config.in
@@ -0,0 +1,75 @@
+comment "uhd needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_UHD
+	bool "uhd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU # use fork()
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_ATOMIC
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	help
+	  Universal Software Radio Peripheral (USRP) Hardware Driver
+
+	  https://kb.etthus.com
+
+if BR2_PACKAGE_UHD
+
+config BR2_PACKAGE_UHD_B100
+	bool "b100 support"
+	select BR2_PACKAGE_UHD_USB
+	help
+	  enable B100 support
+
+config BR2_PACKAGE_UHD_B200
+	bool "b200 support"
+	select BR2_PACKAGE_UHD_USB
+	help
+	  enable B200 support
+
+config BR2_PACKAGE_UHD_E300
+	bool "E300 support"
+	select BR2_PACKAGE_UHD_MPMD
+	help
+	  enable E300 support
+
+config BR2_PACKAGE_UHD_E320
+	bool "E320 support"
+	select BR2_PACKAGE_UHD_MPMD
+	help
+	  enable E320 support
+
+config BR2_PACKAGE_UHD_EXAMPLES
+	bool "uhd-examples"
+	help
+	  Examples
+
+config BR2_PACKAGE_UHD_MPMD
+	bool "MPMD support"
+	help
+	  enable MPMD support
+
+config BR2_PACKAGE_UHD_RFNOC
+	bool "RFNoC support"
+	help
+	  enable RFNoC support
+
+config BR2_PACKAGE_UHD_USB
+	bool "USB support"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  enable UHD USB support
+
+endif
diff --git a/package/uhd/uhd.hash b/package/uhd/uhd.hash
new file mode 100644
index 0000000000..cfd1f3f641
--- /dev/null
+++ b/package/uhd/uhd.hash
@@ -0,0 +1,4 @@
+# Locally calculated:
+sha256  eed4a77d75faafff56be78985950039f8d9d1eb9fcbd58b8862e481dd49825cd  uhd-3.15.0.0.tar.gz
+sha256  8fc99820c2419d0de6bbbd319ff935d54960b37b716d0b4bb1c75de493f3e1fd  LICENSE.md
+sha256  70bf7e79c8cd73a81f97ce81745ea0719a617eebe299a61868165daeae71fff2  host/LICENSE
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
new file mode 100644
index 0000000000..ec0ec03e9f
--- /dev/null
+++ b/package/uhd/uhd.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# uhd
+#
+################################################################################
+
+UHD_VERSION = 3.15.0.0
+UHD_SITE = $(call github,EttusResearch,uhd,v$(UHD_VERSION))
+UHD_LICENSE = GPL-3.0+
+UHD_LICENSE_FILES = LICENSE.md host/LICENSE
+
+UHD_SUPPORTS_IN_SOURCE_BUILD = NO
+UHD_SUBDIR = host
+UHD_INSTALL_STAGING = YES
+
+UHD_DEPENDENCIES = \
+	boost \
+	$(if $(BR2_PACKAGE_PYTHON),host-python,host-python3) \
+	host-python-mako
+
+UHD_CONF_OPTS = \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
+	-DRUNTIME_PYTHON_EXECUTABLE=/usr/bin/python \
+	-DENABLE_C_API=ON \
+	-DENABLE_DOXYGEN=OFF \
+	-DENABLE_DPKD=OFF \
+	-DENABLE_LIBUHD=ON \
+	-DENABLE_N230=OFF \
+	-DENABLE_N300=OFF \
+	-DENABLE_N320=OFF \
+	-DENABLE_MANUAL=OFF \
+	-DENABLE_MAN_PAGES=OFF \
+	-DENABLE_OCTOCLOCK=OFF \
+	-DENABLE_PYTHON_API=OFF \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_USRP1=OFF \
+	-DENABLE_USRP2=OFF \
+	-DENABLE_UTILS=OFF \
+	-DENABLE_X300=OFF
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+UHD_DEPENDENCIES += orc
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_B100),y)
+UHD_CONF_OPTS += -DENABLE_B100=ON
+else
+UHD_CONF_OPTS += -DENABLE_B100=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_B200),y)
+UHD_CONF_OPTS += -DENABLE_B200=ON
+else
+UHD_CONF_OPTS += -DENABLE_B200=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_E300),y)
+UHD_CONF_OPTS += -DENABLE_E300=ON
+else
+UHD_CONF_OPTS += -DENABLE_E300=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_E320),y)
+UHD_CONF_OPTS += -DENABLE_E320=ON
+else
+UHD_CONF_OPTS += -DENABLE_E320=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_EXAMPLES),y)
+UHD_CONF_OPTS += -DENABLE_EXAMPLES=ON
+else
+UHD_CONF_OPTS += -DENABLE_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_MPMD),y)
+UHD_CONF_OPTS += -DENABLE_MPMD=ON
+else
+UHD_CONF_OPTS += -DENABLE_MPMD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_RFNOC),y)
+UHD_CONF_OPTS += -DENABLE_RFNOC=ON
+else
+UHD_CONF_OPTS += -DENABLE_RFNOC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UHD_USB),y)
+UHD_DEPENDENCIES += libusb
+UHD_CONF_OPTS += -DENABLE_USB=ON
+else
+UHD_CONF_OPTS += -DENABLE_USB=OFF
+endif
+
+$(eval $(cmake-package))
