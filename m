From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 22:53:29 +0200
Subject: [Buildroot] [git commit] perf: Don't build backtrace for ARC
Message-ID: <20140721205401.E8CE39D2A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc093d61ce24c0adb0dda3940940664c182626e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add more details as a comment in the code, provided by Anton
Kolesov.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perf/perf.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index ffeec02..1fcc258 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -22,6 +22,16 @@ PERF_MAKE_FLAGS = \
 	WERROR=0 \
 	ASCIIDOC=
 
+# The call to backtrace() function fails for ARC, because for some
+# reason the unwinder from libgcc returns early. Thus the usage of
+# backtrace() should be disabled in perf explicitly: at build time
+# backtrace() appears to be available, but it fails at runtime: the
+# backtrace will contain only several functions from the top of stack,
+# instead of the complete backtrace.
+ifeq ($(BR2_arc),y)
+	PERF_MAKE_FLAGS += NO_BACKTRACE=1
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 	PERF_DEPENDENCIES += elfutils
 else
