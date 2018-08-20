From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:59:55 +0200
Subject: [Buildroot] [git commit] zeromq: fix build on m68k_cf
Message-ID: <20180820205231.0B6748E014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4e459a4ff6f34d598ddc42cf31d73a165e41d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An internal compiler error is raised on m68k_cf at dwarf2cfi.c:2752 in
connect_traces. Error can be fixed by adding -fno-defer-pop, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864

Fixes:
 - http://autobuild.buildroot.net/results/dad241acbe59b1c5a24a0a2f3da6b12a553aec84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
