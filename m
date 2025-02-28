Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F52C28B2F
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F104B82087;
	Tue, 18 Mar 2025 15:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_iGPC-y-lc4; Tue, 18 Mar 2025 15:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D9D82099
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D9D82099;
	Tue, 18 Mar 2025 15:02:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D54F16E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 749CA8136D
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBgCH_7sDkfj for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC28813AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC28813AA
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88F39880ED; Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 21:11:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b9bba85999b5840e5804a2f5d672c7a8d24792e
X-Git-Newrev: ec2735686a24bb6806a028bc2177000e389cd782
X-Patchwork-Hint: ignore
Message-Id: <20250318150241.88F39880ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix MyPy warnings about
 BRConfigTest
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec2735686a24bb6806a028bc2177000e389cd782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This removes warnings in editors/IDEs with MyPy typechecking
integration. Test classes override "config" with strings (different
type than None).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/infra/basetest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 1ae6232da8..4f020e8a93 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -24,8 +24,8 @@ MINIMAL_CONFIG = \
 
 class BRConfigTest(unittest.TestCase):
     """Test up to the configure stage."""
-    config = None
-    br2_external = list()
+    config: str
+    br2_external: list[str] = list()
     downloaddir = None
     outputdir = None
     logtofile = True
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
