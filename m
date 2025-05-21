Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2E1C54E71
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 17:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EAA383B58;
	Wed, 21 May 2025 17:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQffCZ7MYE1q; Wed, 21 May 2025 17:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 415DC83AEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 415DC83AEF;
	Wed, 21 May 2025 17:37:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B38961
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CD1780D3F
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dn4U20HFp1B6 for <buildroot@buildroot.org>;
 Wed, 21 May 2025 17:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD1080C09
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FD1080C09
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E92381F7B; Wed, 21 May 2025 17:37:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 May 2025 19:35:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd28e7a22c85a4ba981995181bf1b0020c372e0e
X-Git-Newrev: 04c9ecd7881e621cafc86e643999196c42321565
X-Patchwork-Hint: ignore
Message-Id: <20250521173728.6E92381F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_xen: fix runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1846698802488346612=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1846698802488346612==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=04c9ecd7881e621cafc86e643999196c42321565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test_xen.py runtime test, introduced in [1] and improved in [2],
is calling a "stty raw" command, just after the emulated machine
login, to avoid double-cooking the consoles. This double-cooking
prevents the test controller to correctly get the command error codes.

Buildroot commit [3] "support/testing: set date in emulated machine"
introduced an invocation of the date command to set time on the
emulated machine, just after the login. The returned error code is also
checked. Since this commit [3], the test_xen runtime test is failing
while attempting to set the date. This is because it is invoked before
the test script executes this "stty raw" command.

The need of executing a command just after the login, and just
before we set the emulated machine date is very limited. It is almost
specific to this test. So, rather than changing the test
infrastructure, this commit simply moves this "stty raw" invocation
from the runtime test script to a custom /etc/profile.d/stty-raw.sh
file on target rootfs overlay, to do this call just at the login.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10000011350

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/055f82ebbd07b582c992eed30ef5191f18873ba4
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/cd0ffd598cf94b9d15c489f2429602825a18753c
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/cf8641b73e7f1577637bfef0ece78dd519b25d19

Cc: Vincent Stehlé <vincent.stehle@laposte.net>
Tested-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_xen.py                          | 7 -------
 .../tests/package/test_xen/overlay/etc/profile.d/stty-raw.sh       | 3 +++
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index f680187db0..e5eaf3c115 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -73,10 +73,6 @@ class TestXen(infra.basetest.BRTest):
         self.emulator.boot(arch="aarch64", options=qemu_opts)
         self.emulator.login()
 
-        # Avoid double-cooking the terminal, otherwise the test infrastructure
-        # would not be able to retrieve e.g. return codes properly.
-        self.assertRunOk("stty raw")
-
         # Verify that we are indeed running under Xen.
         self.assertRunOk("xl info")
 
@@ -92,9 +88,6 @@ class TestXen(infra.basetest.BRTest):
         self.emulator.qemu.sendline("xl create -c /etc/xen/dom1.cfg")
         self.emulator.login()
 
-        # Avoid double-cooking the terminal for dom1, too.
-        self.assertRunOk("stty raw")
-
         # Check that we are not talking to dom0 anymore.
         uuid = self.get_dom_uuid()
         self.assertNotEqual(uuid, dom0_uuid, "Unexpected dom0 UUID")
diff --git a/support/testing/tests/package/test_xen/overlay/etc/profile.d/stty-raw.sh b/support/testing/tests/package/test_xen/overlay/etc/profile.d/stty-raw.sh
new file mode 100644
index 0000000000..3502579d80
--- /dev/null
+++ b/support/testing/tests/package/test_xen/overlay/etc/profile.d/stty-raw.sh
@@ -0,0 +1,3 @@
+# Avoid double-cooking the terminal, otherwise the test infrastructure
+# would not be able to retrieve return codes properly.
+stty raw

--===============1846698802488346612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1846698802488346612==--
