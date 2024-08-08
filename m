Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB632C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 20:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4505A81E86;
	Thu,  8 Aug 2024 20:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzSUB0Gb8Coe; Thu,  8 Aug 2024 20:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C3881E5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C3881E5B;
	Thu,  8 Aug 2024 20:48:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC7381BF86C
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA17A60B4C
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmNhfdRtBaFs for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 20:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2059B60A40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2059B60A40
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2059B60A40
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 20:48:24 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 83925B00565;
 Thu,  8 Aug 2024 22:48:18 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 22:48:11 +0200
Message-ID: <20240808204812.85880-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723150101;
 bh=a4J85bbxxB/k1/rCx/mknmOs91cnaCfxRSlHp2m1P9U=;
 h=From:To:Cc:Subject:Date:From;
 b=FocgJHIUa8rxujyxKZqo2MdQJqeJDoypbB6DMTJBbn4isnSy8r6rvbTWovGHcm0pU
 cn9wx3FKbEYAhY9gHmqCuUy0jMKf4eKJ1zvh+nXA783FkxFcnCxfNrPcSWBFuDN4iR
 CumRUESKluEfyg44ftxJVxStRQ4cWAAbgnfqQwlqJzbT7u9AYG95s8XEtsuQ/Br/tp
 YMcuC0tlyPGSKuFjD+btM6FpB+qIF20fw9XRKL91VHR1dYOh4a13mXg9eHJaS+yJ7q
 Vn2aEvD8y3UFm8dpPOiQGKgiTZ53ZtMkkXUBXfNlMKafrYm5UGKS47QtaJGdN4iLk8
 QMF4bLTxlMaLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FocgJHIU
Subject: [Buildroot] [PATCH 1/1] support/testing/run-tests: add a nose2
 debug option
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the -D/--debug command line options to the
support/testing/run-tests script.

Using one of those options will pass "--log-level debug" to the
nose2 invocations. This can be useful to debug nose2 internal
behaviors. See:
https://github.com/nose-devs/nose2/blob/0.15.1/nose2/main.py#L209

For example, calling:

    support/testing/run-tests --list --debug

will output:

    List of tests
    DEBUG:nose2.main:logging initialized debug
    ...

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
For info, this patch was written for a small investigation asked by
Thomas in the discussion at:
https://lists.buildroot.org/pipermail/buildroot/2024-August/759983.html
This debug option might be useful in some other cases...
---
 support/testing/run-tests | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 485811b746..2f670c03b8 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -36,6 +36,8 @@ def main():
                         help='BR2_JLEVEL to use for each testcase')
     parser.add_argument('--timeout-multiplier', type=int, default=1,
                         help='increase timeouts (useful for slow machines)')
+    parser.add_argument('-D', '--debug', action='store_true',
+                        help='enable debug log')
 
     args = parser.parse_args()
 
@@ -47,10 +49,15 @@ def main():
 
     if args.list:
         print("List of tests")
-        nose2.discover(argv=[script_path,
-                             "-s", test_dir,
-                             "-v",
-                             "--collect-only"],
+        nose2_args = [
+            script_path,
+            "-s", test_dir,
+            "-v",
+            "--collect-only"
+        ]
+        if args.debug:
+            nose2_args += ["--log-level", "debug"]
+        nose2.discover(argv=nose2_args,
                        plugins=["nose2.plugins.collect"])
         return 0
 
@@ -125,6 +132,9 @@ def main():
                   "-s", test_dir,
                   "-c", os.path.join(test_dir, "conf/unittest.cfg")]
 
+    if args.debug:
+        nose2_args += ["--log-level", "debug"]
+
     if args.testname:
         nose2_args += args.testname
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
