From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 18:00:46 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/uhd: fix build on
 RISC-V
Message-ID: <20210128200058.047EA843AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19aa4e9ee77dc75349fb8b101aaed4bcfbb21fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

When the target CPU is riscV, msgpack is unable to detect endianness with a list of errors like:

uhd/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:190:2: error: #error msgpack-c supports only big endian and little endian
  190 | #error msgpack-c supports only big endian and little endian
      |  ^~~~~

and with subsequent errors:

uhd0/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:236:46: error: there are no arguments to 'take8_8' that depend on a template parameter, so a declaration of 'take8_8' must be available [-fpermissive]
  236 |     char buf[2] = {static_cast<char>(0xccu), take8_8(d)};
      |

This is due to a missing support for this architecture in msgpack.
This patch adapt commit from https://github.com/boostorg/predef

[backported from https://github.com/EttusResearch/uhd/pull/400]

Fix:
- http://autobuild.buildroot.net/results/afacf5c5c2cd9dff6962523f1fdded9b474b9d66/
- http://autobuild.buildroot.net/results/91530538d630a7f09d85327e514f01b45253c1a6/
- http://autobuild.buildroot.net/results/91530538d630a7f09d85327e514f01b45253c1a6/
- and others

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8692d8f38d7251cf6919902a3386aefcd503fedf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uhd/0003-add-RISC-V-endian-detection.patch | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/package/uhd/0003-add-RISC-V-endian-detection.patch b/package/uhd/0003-add-RISC-V-endian-detection.patch
new file mode 100644
index 0000000000..fb1168ba3e
--- /dev/null
+++ b/package/uhd/0003-add-RISC-V-endian-detection.patch
@@ -0,0 +1,113 @@
+From d4717a38d2287c2f583fefb2a0ed273337a92bb6 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Mon, 11 Jan 2021 18:18:26 +0100
+Subject: [PATCH] msgpack/predef: add riscV support
+
+When the target CPU is riscV, msgpack is unable to detect endianness with a list of errors like:
+
+uhd/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:190:2: error: #error msgpack-c supports only big endian and little endian
+  190 | #error msgpack-c supports only big endian and little endian
+      |  ^~~~~
+
+and with subsequent errors:
+
+uhd0/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:236:46: error: there are no arguments to 'take8_8' that depend on a template parameter, so a declaration of 'take8_8' must be available [-fpermissive]
+  236 |     char buf[2] = {static_cast<char>(0xccu), take8_8(d)};
+      |      
+
+This is due to a missing support for this architecture in msgpack.
+This patch adapt commit from https://github.com/boostorg/predef
+
+[backported from https://github.com/EttusResearch/uhd/pull/400]
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ .../include/rpc/msgpack/predef/architecture.h |  1 +
+ .../rpc/msgpack/predef/architecture/riscv.h   | 48 +++++++++++++++++++
+ .../include/rpc/msgpack/predef/other/endian.h |  3 +-
+ 3 files changed, 51 insertions(+), 1 deletion(-)
+ create mode 100644 host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture/riscv.h
+
+diff --git a/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture.h b/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture.h
+index 4a0ce2749..1bd998c59 100644
+--- a/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture.h
++++ b/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture.h
+@@ -18,6 +18,7 @@ http://www.boost.org/LICENSE_1_0.txt)
+ #include <rpc/msgpack/predef/architecture/parisc.h>
+ #include <rpc/msgpack/predef/architecture/ppc.h>
+ #include <rpc/msgpack/predef/architecture/pyramid.h>
++#include <rpc/msgpack/predef/architecture/riscv.h>
+ #include <rpc/msgpack/predef/architecture/rs6k.h>
+ #include <rpc/msgpack/predef/architecture/sparc.h>
+ #include <rpc/msgpack/predef/architecture/superh.h>
+diff --git a/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture/riscv.h b/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture/riscv.h
+new file mode 100644
+index 000000000..8b819d77e
+--- /dev/null
++++ b/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture/riscv.h
+@@ -0,0 +1,48 @@
++/*
++Copyright Andreas Schwab 2019
++Distributed under the Boost Software License, Version 1.0.
++(See accompanying file LICENSE_1_0.txt or copy at
++http://www.boost.org/LICENSE_1_0.txt)
++*/
++
++#ifndef BOOST_PREDEF_ARCHITECTURE_RISCV_H
++#define BOOST_PREDEF_ARCHITECTURE_RISCV_H
++
++#include <boost/predef/version_number.h>
++#include <boost/predef/make.h>
++
++/* tag::reference[]
++= `BOOST_ARCH_RISCV`
++
++http://en.wikipedia.org/wiki/RISC-V[RISC-V] architecture.
++
++[options="header"]
++|===
++| {predef_symbol} | {predef_version}
++
++| `+__riscv+` | {predef_detection}
++|===
++*/ // end::reference[]
++
++#define BOOST_ARCH_RISCV BOOST_VERSION_NUMBER_NOT_AVAILABLE
++
++#if defined(__riscv)
++#   undef BOOST_ARCH_RISCV
++#   define BOOST_ARCH_RISCV BOOST_VERSION_NUMBER_AVAILABLE
++#endif
++
++#if BOOST_ARCH_RISCV
++#   define BOOST_ARCH_RISCV_AVAILABLE
++#endif
++
++#if BOOST_ARCH_RISCV
++#   undef BOOST_ARCH_WORD_BITS_32
++#   define BOOST_ARCH_WORD_BITS_32 BOOST_VERSION_NUMBER_AVAILABLE
++#endif
++
++#define BOOST_ARCH_RISCV_NAME "RISC-V"
++
++#endif
++
++#include <boost/predef/detail/test.h>
++BOOST_PREDEF_DECLARE_TEST(BOOST_ARCH_RISCV,BOOST_ARCH_RISCV_NAME)
+diff --git a/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h b/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h
+index 3f367b3d4..a7c1fb4dc 100644
+--- a/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h
++++ b/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h
+@@ -127,7 +127,8 @@ information and acquired knowledge:
+         defined(__AARCH64EL__) || \
+         defined(_MIPSEL) || \
+         defined(__MIPSEL) || \
+-        defined(__MIPSEL__)
++        defined(__MIPSEL__) || \
++        defined(__riscv)
+ #       undef MSGPACK_ENDIAN_LITTLE_BYTE
+ #       define MSGPACK_ENDIAN_LITTLE_BYTE MSGPACK_VERSION_NUMBER_AVAILABLE
+ #   endif
+-- 
+2.26.2
+
