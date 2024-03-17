Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF63AC54E68
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E18402E6;
	Sun, 17 Mar 2024 21:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0-GCDrJ2EFL; Sun, 17 Mar 2024 21:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AF42402F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF42402F8;
	Sun, 17 Mar 2024 21:36:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 944AE1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8020C402F8
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgOlrHSHTXsR for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63ED6402E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63ED6402E6
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4439282847; Sun, 17 Mar 2024 21:36:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 22:35:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33605ea6d9b370d052dbf6b06d89e7b2a16d4275
X-Git-Newrev: 9347905b95dfe045ee40ae69d9d3f00a2c1b7168
X-Patchwork-Hint: ignore
Message-Id: <20240317213626.4439282847@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: fix build with host gcc 10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9347905b95dfe045ee40ae69d9d3f00a2c1b7168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass -std=c++17 to fix the following build failure with host gcc 10
raised since bump to version 6.6 in commit
c13199c9326fa2daa574f08ec8fc063a48d0eb06:

/usr/bin/g++ -O2 -I/home/buildroot/instance-0/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
./cf_gen.cc: In function 'int main(int, char**)':
./cf_gen.cc:268:63: error: forming reference to void
  268 |                     auto &newEntry = entries.emplace_back(name);
      |                                                               ^

Fixes:
 - http://autobuild.buildroot.org/results/613fee008c77f8dbbe04df9a4ce4347e43de9ef9
 - https://bugs.buildroot.org/show_bug.cgi?id=15997

Reported-by: Roland Franke
Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3a9edac71e..6a2b522336 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -21,7 +21,7 @@ SQUID_CONF_ENV = \
 	ac_cv_func_strnstr=no \
 	ac_cv_have_squid=yes \
 	BUILDCXX="$(HOSTCXX)" \
-	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
+	BUILDCXXFLAGS="$(HOST_CXXFLAGS) -std=c++17"
 SQUID_CONF_OPTS = \
 	--enable-async-io=8 \
 	--enable-linux-netfilter \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
