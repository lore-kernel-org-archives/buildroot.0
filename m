Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80190E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B77BA84162;
	Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HxpFc89qVge; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D05E8416F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D05E8416F;
	Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9FA1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C975460777
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1tw1J6ZIyJK for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C340760664
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C340760664
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEE5686EE5; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 00:10:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fde4729cc1fc635198e2db504998aef3050d13a3
X-Git-Newrev: ab92eaa04bf8ec29dced04063ba1dc626b7d5789
X-Patchwork-Hint: ignore
Message-Id: <20240906195852.AEE5686EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/run-tests: add a nose2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab92eaa04bf8ec29dced04063ba1dc626b7d5789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
