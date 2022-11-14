Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC42C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 10:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A41F14091F;
	Mon, 14 Nov 2022 10:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A41F14091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ybB6aykR2li; Mon, 14 Nov 2022 10:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AFC640907;
	Mon, 14 Nov 2022 10:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AFC640907
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3C3B1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B3B1402C1
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B3B1402C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOGr-K0fy1g1 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 10:27:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99664402AA
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 10:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99664402AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87EF783912; Mon, 14 Nov 2022 10:27:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 11:21:14 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 6bb48a9abb918b0d9caaaf83c1be21d0999314ae
X-Git-Newrev: ca38b2af94e8e08d10181778968d5097851e3589
X-Patchwork-Hint: ignore
Message-Id: <20221114102721.87EF783912@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 support/testing/tests/package/test_python_flask*: increase time after
 server startup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca38b2af94e8e08d10181778968d5097851e3589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

It seems like on Gitlab CI, the runners are quite slow, and the Flask
server does not startup in the 15 seconds we give it. So increase this
to 30 seconds before trying to contact the Flask server.

Hopefully fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828594

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3884cfc0571abc19b35b2f161f6c8c009847a0bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_python_flask.py              | 2 +-
 support/testing/tests/package/test_python_flask_expects_json.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_python_flask.py b/support/testing/tests/package/test_python_flask.py
index ef5d96bae9..9d8587e918 100644
--- a/support/testing/tests/package/test_python_flask.py
+++ b/support/testing/tests/package/test_python_flask.py
@@ -21,7 +21,7 @@ class TestPythonPy3Flask(TestPythonPackageBase):
         _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
 
         # Give enough time for the flask server to start up
-        time.sleep(15)
+        time.sleep(30)
 
         cmd = "wget -q -O - http://127.0.0.1:5000/"
         output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
diff --git a/support/testing/tests/package/test_python_flask_expects_json.py b/support/testing/tests/package/test_python_flask_expects_json.py
index 5576cba2b4..91b8bf21b7 100644
--- a/support/testing/tests/package/test_python_flask_expects_json.py
+++ b/support/testing/tests/package/test_python_flask_expects_json.py
@@ -31,7 +31,7 @@ class TestPythonPy3FlaskExpectsJson(TestPythonPackageBase):
         _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
 
         # Give enough time for the flask server to start up
-        time.sleep(15)
+        time.sleep(30)
 
         self.try_json("""{"email": "test", "name": "test"}""", 200)
         self.try_json("""{"email": "test", "name": 2}""", 400)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
