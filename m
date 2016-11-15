From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 12:58:20 +0100
Subject: [Buildroot] [git commit] openssh: add upstream security fix
Message-ID: <20161115115956.14B54803FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aae80e71b6ce75bdf73cc9b84ec96c92ed13aa58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2016-8858: Memory exhaustion, up to 128MB, of unauthenticated peer.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssh/0003-fix-CVE-2016-8858.patch | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/openssh/0003-fix-CVE-2016-8858.patch b/package/openssh/0003-fix-CVE-2016-8858.patch
new file mode 100644
index 0000000..4ba1cfd
--- /dev/null
+++ b/package/openssh/0003-fix-CVE-2016-8858.patch
@@ -0,0 +1,31 @@
+From ec165c392ca54317dbe3064a8c200de6531e89ad Mon Sep 17 00:00:00 2001
+From: "markus at openbsd.org" <markus@openbsd.org>
+Date: Mon, 10 Oct 2016 19:28:48 +0000
+Subject: [PATCH] upstream commit
+
+Unregister the KEXINIT handler after message has been
+received. Otherwise an unauthenticated peer can repeat the KEXINIT and cause
+allocation of up to 128MB -- until the connection is closed. Reported by
+shilei-c at 360.cn
+
+Upstream-ID: 43649ae12a27ef94290db16d1a98294588b75c05
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream
+
+ kex.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/kex.c b/kex.c
+index 3f97f8c..6a94bc5 100644
+--- a/kex.c
++++ b/kex.c
+@@ -481,6 +481,7 @@ kex_input_kexinit(int type, u_int32_t seq, void *ctxt)
+ 	if (kex == NULL)
+ 		return SSH_ERR_INVALID_ARGUMENT;
+ 
++	ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, NULL);
+ 	ptr = sshpkt_ptr(ssh, &dlen);
+ 	if ((r = sshbuf_put(kex->peer, ptr, dlen)) != 0)
+ 		return r;
