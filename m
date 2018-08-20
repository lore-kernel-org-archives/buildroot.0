From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Aug 2018 18:59:29 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: fix build on m68k_cf
Message-ID: <20180820165929.20741-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An internal compiler error is raised on m68k_cf at dwarf2cfi.c:2752 in
connect_traces. Error can be fixed by adding -fno-defer-pop, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864

Fixes:
 - http://autobuild.buildroot.net/results/dad241acbe59b1c5a24a0a2f3da6b12a553aec84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeromq/zeromq.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 8273cad763..4b25c7d678 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -23,6 +23,12 @@ ZEROMQ_CONF_ENV = libzmq_cv_sock_cloexec=yes \
 	libzmq_cv_tcp_keepidle=yes \
 	libzmq_cv_tcp_keepintvl=yes
 
+# Internal error, aborting at dwarf2cfi.c:2752 in connect_traces
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
+ifeq ($(BR2_m68k_cf),y)
+ZEROMQ_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-defer-pop"
+endif
+
 # Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
 # for the rest of the build as well (which automatically includes stdc++).
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.14.1
