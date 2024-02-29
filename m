Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6282C54E49
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 16:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 861A14193C;
	Thu, 29 Feb 2024 16:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiGVHrTD3ZlN; Thu, 29 Feb 2024 16:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B4641ADF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B4641ADF;
	Thu, 29 Feb 2024 16:28:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8E781BF387
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 16:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9533E4183C
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 16:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMLd8U8Rx89Y for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 16:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 940C6404C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 940C6404C4
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 16:08:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BF7187DDE; Thu, 29 Feb 2024 16:08:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 17:04:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75a3562324bd64d4d02edbcf840809863d4c266f
X-Git-Newrev: 4983f9e73e17c162b85fa4ed55fc5ff13d491130
X-Patchwork-Hint: ignore
Message-Id: <20240229160814.7BF7187DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix running on
 older python versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=4983f9e73e17c162b85fa4ed55fc5ff13d491130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f71d9f49e546 (support/scripts/pkg-stats: fix datetime deprecation
warning) forgot to consider that the datetime.UTC suggested by python
3.12, was only introduced with python 3.11.

However, we are still generating the daily report on a python 3.8
version, which fails at runtime:
    AttributeError: module 'datetime' has no attribute 'UTC'

It turns out that datetime.UTC is just an alias for datetime.timezone.utc,
which seems to have existed since before python3...

Use datetime.timezone.utc instead of its alias.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9a4a3ccad5..53898a36f2 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1290,7 +1290,7 @@ def __main__():
         package_list = set([v["name"] for v in show_info_js.values() if 'name' in v])
     else:
         package_list = None
-    date = datetime.datetime.now(datetime.UTC)
+    date = datetime.datetime.now(datetime.timezone.utc)
     commit = subprocess.check_output(['git', '-C', brpath,
                                       'rev-parse',
                                       'HEAD']).splitlines()[0].decode()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
