From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 10:49:24 +0200
Subject: [Buildroot] [git commit] dropwatch: Remove -Werror from CFLAGS
Message-ID: <20131022091810.9D3E59BA14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc3cb0651cce4a911aed54de6e394d3e241ad0b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-Werror shouldn't be used in released code since it can
cause random build failures on moderate warnings. It also
depends on the used toolchain since different toolchains may
or may not print the same warnings.

Fixes the following build problem on MIPS64/n64:

main.c: In function handle_dm_alert_msg:
main.c:336:5: error: format %llx expects argument of
type long long unsigned int, but argument 4 has
type __u64 [-Werror=format=]

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropwatch/dropwatch-03-remove-werror.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/dropwatch/dropwatch-03-remove-werror.patch b/package/dropwatch/dropwatch-03-remove-werror.patch
new file mode 100644
index 0000000..97b26b7
--- /dev/null
+++ b/package/dropwatch/dropwatch-03-remove-werror.patch
@@ -0,0 +1,18 @@
+-Werror shouldn't be used in released code since it can
+cause random build failures on moderate warnings. It also
+depends on the used toolchain since different toolchains may
+or may not print the same warnings.
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: dropwatch-1.4/src/Makefile
+===================================================================
+--- dropwatch-1.4.orig/src/Makefile
++++ dropwatch-1.4/src/Makefile
+@@ -1,5 +1,5 @@
+ all: dropwatch
+-CFLAGS+=-c -g -D_GNU_SOURCE -Wall -Werror `pkg-config --cflags libnl-3.0`
++CFLAGS+=-c -g -D_GNU_SOURCE -Wall `pkg-config --cflags libnl-3.0`
+ LDFLAGS=-lbfd -lreadline -lnl-3 -lnl-genl-3
+ OBJFILES := main.o lookup.o\
+ 	 lookup_bfd.o lookup_kas.o
