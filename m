From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:42:11 +0100
Subject: [Buildroot] [git commit] conntrack-tools: add patch to fix build
	with musl
Message-ID: <20151126214244.A4E4381EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07283e6ad5303e057d91c9211013d34c566fa61f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The conntrack-tools sources use the GNU version of 'struct tcphdr',
which is not exposed by the musl headers unless _GNU_SOURCE is defined.

The included patch adds the missing definition to 'src/helpers/rpc.c'.

Fixes:

  http://autobuild.buildroot.net/results/046/04613c47b9669c28cc3ff47c65607c23730ef691/
  http://autobuild.buildroot.net/results/520/520e8f327b9bd7eea59657bad702c35c632d115d/
  http://autobuild.buildroot.net/results/3d3/3d36403ba80089faea5dd06bc7e4414d593bbfc1/
  ...

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-src-fix-build-with-musl-libc.patch        |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/conntrack-tools/0001-src-fix-build-with-musl-libc.patch b/package/conntrack-tools/0001-src-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..5881f98
--- /dev/null
+++ b/package/conntrack-tools/0001-src-fix-build-with-musl-libc.patch
@@ -0,0 +1,37 @@
+From d7b20d9bbed23a7a7e40af2f5e78f37ff67e8d93 Mon Sep 17 00:00:00 2001
+From: Rodrigo Rebello <rprebello@gmail.com>
+Date: Mon, 23 Nov 2015 02:12:48 -0200
+Subject: [PATCH] src: fix build with musl libc
+
+The GNU version of 'struct tcphdr' is not exposed by musl libc headers
+unless _GNU_SOURCE is defined. Without this definition, the build fails
+with:
+
+  rpc.c: In function 'rpc_helper_cb':
+  rpc.c:351:15: error: 'struct tcphdr' has no member named 'doff'
+     offset += th->doff * 4;
+                 ^
+
+Upstream status: sent
+http://patchwork.ozlabs.org/patch/547376/
+
+Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
+---
+ src/helpers/rpc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/helpers/rpc.c b/src/helpers/rpc.c
+index 82493c2..3a7b337 100644
+--- a/src/helpers/rpc.c
++++ b/src/helpers/rpc.c
+@@ -28,6 +28,7 @@
+ 
+ #include <rpc/rpc_msg.h>
+ #include <rpc/pmap_prot.h>
++#define _GNU_SOURCE
+ #include <netinet/tcp.h>
+ #include <netinet/udp.h>
+ 
+-- 
+2.1.4
+
