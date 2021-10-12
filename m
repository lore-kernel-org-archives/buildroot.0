Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2D6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:55:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DC860E09
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45DC860E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 229E44078C;
	Tue, 12 Oct 2021 20:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmH7xQRvYo0f; Tue, 12 Oct 2021 20:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B9AF4079D;
	Tue, 12 Oct 2021 20:55:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 537C91BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4284B81C11
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuzHDvlMwQV6 for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:55:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 991B880E19
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:55:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 16B3095551; Tue, 12 Oct 2021 20:52:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:51:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36ca6e4a88a089c0fb1fa8ef0d5fc646e227cd57
X-Git-Newrev: 128af17dce9cc377c5d58fd9f3adb157e6bcb958
X-Patchwork-Hint: ignore
Message-Id: <20211012205221.16B3095551@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix
 python_flask_expect_python
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============3780636175149591250=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3780636175149591250==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=128af17dce9cc377c5d58fd9f3adb157e6bcb958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e6ee07f41a2b (package/python-flask-expects-json: new package)
added a non-functional test case that, as noticed by Edgar, fails with:

    AssertionError: '%{http_code}' != '200'

That's because the % sign is self-escaped, à-la C, in the first part
of the command, probably to avoid its being %-formatted. But only the
second part of the command is %-formatted, so we do not need to
self-escape % in the first part.

Additionally, since eb3ee3078a76 (support/testing/infra/emulator.py:
prevent the commands from wrapping), we no longer need to play tricks
with commands that are too long to fit on the first line of the shell
prompt.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_python_flask_expects_json.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_python_flask_expects_json.py b/support/testing/tests/package/test_python_flask_expects_json.py
index b7326f5d9e..5576cba2b4 100644
--- a/support/testing/tests/package/test_python_flask_expects_json.py
+++ b/support/testing/tests/package/test_python_flask_expects_json.py
@@ -17,11 +17,11 @@ class TestPythonPy3FlaskExpectsJson(TestPythonPackageBase):
     timeout = 60
 
     def try_json(self, payload, expects):
-        cmd = """curl -s -o /dev/null -w "%%{http_code}\\n" -X POST """
+        cmd = """curl -s -o /dev/null -w "%{http_code}\\n" -X POST """
         cmd += """-H "Content-Type: application/json" -d '%s' http://127.0.0.1:5000""" % payload
         output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
         self.assertEqual(exit_code, 0)
-        self.assertEqual(output[-1], str(expects))
+        self.assertEqual(output[0], str(expects))
 
     def test_run(self):
         self.login()

--===============3780636175149591250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3780636175149591250==--
