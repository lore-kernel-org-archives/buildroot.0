Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E344BD43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC2382451;
	Thu, 11 Dec 2025 19:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFTvL9e3q-hG; Thu, 11 Dec 2025 19:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E63E382356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481283;
	bh=WIiJO0I+HW5g3Nliwjo+80dr46RVGqWRWQNhedydr1U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IvB6gJkFSVn3eVVLV2TA4gpo0J7iH9N95ur0ANwcKolGmGjEEnHp1Cxg6lNg/hg7F
	 qzgzX2pGQHtxmdbA7Ma5ZTlhcsnSwrBiJzZV+yTVzyJ9HIS0g1F68UVO8z+N1/WVOU
	 JHKbbUReVAXCrRHsPO4jC9/hmjixWVKOJmA8jokI05PAwi6dShmwUfEbTH/jb4BUZF
	 aIsKnnY8+aqL2RksBHPO1Ep4lNDcqheKAHoaaRyvysbYC+UTNtN093WvrwI8Kl/Xgg
	 h8na9V+foLpwnu6Sv/lq68ngyoheD9nu4yDTuQzF0aU3Ulk6rDy09MEW8h44YGhef8
	 C5FI/RwLsuVbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E63E382356;
	Thu, 11 Dec 2025 19:28:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C852C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DF2F4006E
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpCKI26AuP3c for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A269140027
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A269140027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 917F986B3F; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:35 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a6758069c24166b757580af1ea30d3304d9fd5d1
X-Git-Newrev: a2c5393f242d39d8453ea8dbc7f4cd7adf1e0625
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.917F986B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: check_url_status(): use HEAD requests to limit
 server load
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2c5393f242d39d8453ea8dbc7f4cd7adf1e0625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The gnu.org admins have been blocking the IP address of machines running
pkg-stats as the GET requests for the (many) packages with gnu.org URLs are
seen as abusive.

The resource body is not used, so use a HTTP HEAD request instead of a GET
to limit server load and bandwidth use.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f9f3e6ccc66cd4f2becfc29e6b2b74beaddf14e6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cfea179458..c659acb80e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -469,7 +469,7 @@ async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
     global check_url_count
 
     try:
-        async with session.get(pkg.url) as resp:
+        async with session.head(pkg.url) as resp:
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
                 check_url_count += 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
