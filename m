Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E41ECCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 17:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 521F6810DC;
	Tue, 21 Oct 2025 17:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yd4AICbkB8qK; Tue, 21 Oct 2025 17:16:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FAA5810DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FAA5810DD;
	Tue, 21 Oct 2025 17:16:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74EED70A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6694A60652
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUD2uHgmM2Vy for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 17:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A2C60632
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62A2C60632
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 17:16:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D553876D2; Tue, 21 Oct 2025 17:16:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 18:57:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c55714aeb9e9bb32b0674b93c4a4cd4b6fa4eb52
X-Git-Newrev: 33947d6b5ac168854855d0cc1db18791e45c4a82
X-Patchwork-Hint: ignore
Message-Id: <20251021171601.5D553876D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: python-scp: fix test
 sample script
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7000093534138937897=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7000093534138937897==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=33947d6b5ac168854855d0cc1db18791e45c4a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the test was introduced in [1], a comparison of the source and
the destination file was added, with a typo (the method ".cmp" name is
missing).

The test is failing with error such as in [2]:

    Traceback (most recent call last):
      File "/root/sample_python_scp.py", line 15, in <module>
        assert filecmp("/etc/hostname", "/tmp/hostname")
               ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    TypeError: 'module' object is not callable

This commit fixes that.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/7470587cfa9a24d3c49adc0fb6cc60512907f31a
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/11781378510

Cc: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/sample_python_scp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_scp.py b/support/testing/tests/package/sample_python_scp.py
index c986a27f0b..5df3ae24d8 100644
--- a/support/testing/tests/package/sample_python_scp.py
+++ b/support/testing/tests/package/sample_python_scp.py
@@ -12,4 +12,4 @@ ssh_client.connect('127.0.0.1', username='root')
 scp_client = SCPClient(ssh_client.get_transport())
 scp_client.get("/etc/hostname", "/tmp/hostname")
 
-assert filecmp("/etc/hostname", "/tmp/hostname")
+assert filecmp.cmp("/etc/hostname", "/tmp/hostname")

--===============7000093534138937897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7000093534138937897==--
