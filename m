From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 15:34:05 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] systemd: add security fix
Message-ID: <20170702133107.129857FCFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f4bc280fc0ca1645598c1bb4b6103e745a015e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Add a fix for CVE-2017-9445: In systemd through 233, certain sizes passed to
dns_packet_new in systemd-resolved can cause it to allocate a buffer that's
too small.  A malicious DNS server can exploit this via a response with a
specially crafted TCP payload to trick systemd-resolved into allocating a
buffer that's too small, and subsequently write arbitrary data beyond the
end of it.

The other patch fixes an issue with the security fix.

[Peter: use CVE description from MITRE]
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 6da327adb21d1cb0f1962b2cadae256ba217972a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.hash | 2 ++
 package/systemd/systemd.mk   | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index b5cb1ca..77a680d 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,3 +1,5 @@
 # sha256 locally computed
 sha256 8b3e99da3d4164b66581830a7f2436c0c8fe697b5fbdc3927bdb960646be0083  systemd-233.tar.gz
 sha256 eed8fef0045876e9efa0ba6725ed9ea93654bf24d67bb5aad467a341ad375883  a924f43f30f9c4acaf70618dd2a055f8b0f166be.patch
+sha256 43c75bd161a8ef0de5db607aaceed77220f2ba4903cf44e7e9db544980420a5e  db848813bae4d28c524b3b6a7dad135e426659ce.patch
+sha256 451f7c09332479ebe4ac01612f5f034df4524e16b5bc5d1c8ddcda14e9f3cd69  88795538726a5bbfd9efc13d441cb05e1d7fc139.patch
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 153d615..a853434 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -20,7 +20,9 @@ SYSTEMD_PROVIDES = udev
 SYSTEMD_AUTORECONF = YES
 
 SYSTEMD_PATCH = \
-	https://github.com/systemd/systemd/commit/a924f43f30f9c4acaf70618dd2a055f8b0f166be.patch
+	https://github.com/systemd/systemd/commit/a924f43f30f9c4acaf70618dd2a055f8b0f166be.patch \
+	https://github.com/systemd/systemd/commit/db848813bae4d28c524b3b6a7dad135e426659ce.patch \
+	https://github.com/systemd/systemd/commit/88795538726a5bbfd9efc13d441cb05e1d7fc139.patch
 
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
