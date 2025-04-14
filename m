Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBE6C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 13:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE3C861133;
	Mon, 14 Apr 2025 13:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRSihFY_8naV; Mon, 14 Apr 2025 13:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169E56112F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169E56112F;
	Mon, 14 Apr 2025 13:29:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A51BDE
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 404394078E
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHftihlSiQ0F for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 13:29:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AA6540B60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA6540B60
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AA6540B60
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 13:29:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B4B3E43987;
 Mon, 14 Apr 2025 13:29:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 15:28:59 +0200
Message-ID: <20250414132900.1986484-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffdvvdfhudetteejvdeikeffkeelkeevffefveevvdeijeekiefhheduheeiveejnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehsvghnsehhrghsthhinhhgshdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744637343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/RkC5Yi5lTUduFwW/+jja5gENIPq0USJeqBTpEdBHgs=;
 b=IxfAz/77FE9b60HKThaDvhn36L8le0RnqX4rE6fs82kbrntTIotEyS1V6EmjtpOTVK0CuU
 yHm4mXU7+EQCv1Yfaps1YP+9Q8y21YdFBcL6pY8ULQy9QDqRMklr9mMRDQhD2Kzzx2vRj/
 b86ybiYkqr9cajdV1hOyFFk8Ql/l47jUgZMivI41H87avjh88qVyzu5oeVL1B9rTCi6m0k
 lIEv3L8AMC7UVOpX0Re/1RfnfrfLjBVWGL7S+xewkiBkFHbDgMozQcJBgerkXpoTD+LWRC
 aDul6dP4w74oQkK0Bx4W4OWvmflDqDAxl9KwouRwSfLmCEqb874Za7osIP748A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IxfAz/77
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: add -v/--verbose
 option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Running pkg-stats is currently quite verbose, as it shows one line per
package when checking for the upstream URL, and another one line per
package when checking for the latest version on
release-monitoring.org.

This noisy output is a bit annoying when pkg-stats is run in a
cronjob, like we do to update https://autobuild.buildroot.net/stats/
every day. This commit adds a -v/--verbose option, off by default, to
have a less noisy output.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Once applied to master, please backport this to the currently
maintained stable versions.
---
 support/scripts/pkg-stats | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 33c21e77b4..c134e1ec06 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -464,7 +464,7 @@ def package_init_make_info():
 check_url_count = 0
 
 
-async def check_url_status(session, pkg, npkgs, retry=True):
+async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
     global check_url_count
 
     try:
@@ -472,30 +472,33 @@ async def check_url_status(session, pkg, npkgs, retry=True):
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
                 check_url_count += 1
-                print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
+                if verbose:
+                    print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
                 return
     except (aiohttp.ClientError, asyncio.TimeoutError):
         if retry:
-            return await check_url_status(session, pkg, npkgs, retry=False)
+            return await check_url_status(session, pkg, npkgs, retry=False, verbose=verbose)
         else:
             pkg.status['url'] = ("error", "invalid (err)")
             check_url_count += 1
-            print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
+            if verbose:
+                print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
             return
 
     pkg.status['url'] = ("ok", "valid")
     check_url_count += 1
-    print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
+    if verbose:
+        print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
 
 
-async def check_package_urls(packages):
+async def check_package_urls(packages, verbose=False):
     tasks = []
     connector = aiohttp.TCPConnector(limit_per_host=5)
     async with aiohttp.ClientSession(connector=connector, trust_env=True,
                                      timeout=aiohttp.ClientTimeout(total=15)) as sess:
         packages = [p for p in packages if p.status['url'][0] == 'ok']
         for pkg in packages:
-            tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages))))
+            tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages), verbose=verbose)))
         await asyncio.wait(tasks)
 
 
@@ -580,27 +583,30 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
 check_latest_count = 0
 
 
-async def check_package_latest_version_get(session, pkg, npkgs):
+async def check_package_latest_version_get(session, pkg, npkgs, verbose=False):
     global check_latest_count
 
     if await check_package_get_latest_version_by_distro(session, pkg):
         check_latest_count += 1
-        print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
+        if verbose:
+            print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
         return
 
     if await check_package_get_latest_version_by_guess(session, pkg):
         check_latest_count += 1
-        print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
+        if verbose:
+            print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
         return
 
     check_package_latest_version_set_status(pkg,
                                             RM_API_STATUS_NOT_FOUND,
                                             None, None)
     check_latest_count += 1
-    print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
+    if verbose:
+        print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
 
 
-async def check_package_latest_version(packages):
+async def check_package_latest_version(packages, verbose=False):
     """
     Fills in the .latest_version field of all Package objects
 
@@ -623,7 +629,7 @@ async def check_package_latest_version(packages):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.is_actual_package]
         for pkg in packages:
-            tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages))))
+            tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages), verbose=verbose)))
         await asyncio.wait(tasks)
 
 
@@ -1272,6 +1278,8 @@ def parse_args():
     parser.add_argument('--disable', type=list_str,
                         help='Features to disable, comma-separated (cve, upstream, url, warning)',
                         default=[])
+    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true',
+                        help='Increase verbosity')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
@@ -1325,11 +1333,11 @@ def __main__():
     if "url" not in args.disable:
         print("Checking URL status")
         loop = asyncio.get_event_loop()
-        loop.run_until_complete(check_package_urls(packages))
+        loop.run_until_complete(check_package_urls(packages, verbose=args.verbose))
     if "upstream" not in args.disable:
         print("Getting latest versions ...")
         loop = asyncio.get_event_loop()
-        loop.run_until_complete(check_package_latest_version(packages))
+        loop.run_until_complete(check_package_latest_version(packages, verbose=args.verbose))
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
