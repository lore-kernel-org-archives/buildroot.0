From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Sep 2020 21:35:19 +0200
Subject: [Buildroot] [git commit] support/runttime-tests: fix openssh test
Message-ID: <20200901192842.7140D875B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=400ce4f905c6447c2b225385252a5689bb0723af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When it was applied, commit 243d500f8d3 (support/testing: add openssh
runtime test) was amended to not provide a NIC to the emulated machine,
as the test did not require access to the outer world: it only uses the
lo interface. Also, there was a discrepancy between the NIC name in the
Buildroot configuration, and the drivers available in our default kernel
image, making the boot hang for a while whaiting for a NIC that would
never come.

However, that tweak was tested locally with a qmeu version more recent
than the one available in our buidroot/base Docker image. As a
consequence, that test fails to run in gitlab-ci.

Revert to using the old way of specifying no network: it works on
gitlab-ci, and qemu versions in standard distros still support it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_openssh.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index 6f981d42ca..2ae5030d5d 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -21,7 +21,7 @@ class TestOpensshBase(infra.basetest.BRTest):
         self.emulator.boot(arch="armv5",
                            kernel="builtin",
                            options=["-initrd", img,
-                                    "-nic", "none"])
+                                    "-net", "none"])
         self.emulator.login(self.passwd)
 
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
