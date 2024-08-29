Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2D3C83F16
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 16:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DC61840A9;
	Thu, 29 Aug 2024 16:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8b35ZriSBEEM; Thu, 29 Aug 2024 16:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B418A840AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B418A840AA;
	Thu, 29 Aug 2024 16:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2349B1BF84C
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84E546115F
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4svfw8M7z1n7 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B422C61161
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B422C61161
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1901866D0; Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 18:08:34 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 32844c4ca256bd40d441a85dcf45769c8758dca5
X-Git-Newrev: 6718560ed9a9cbf60a2042d4472656caa53e755e
X-Patchwork-Hint: ignore
Message-Id: <20240829161701.A1901866D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/unbound: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

commit: https://git.buildroot.net/buildroot/commit/?id=6718560ed9a9cbf60a2042d4472656caa53e755e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

unbound unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

sldns/keyraw.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
  167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
      |                                   ^~~~~~~~~~~~~~~~~

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/b7782f5ba54543df53a835552632f58d4ad6c082

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ec7ae882e048ce4ca5c2b72cb884b8d1ef33c6cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/Config.in b/package/unbound/Config.in
index ae2ebfd975..c8d697113c 100644
--- a/package/unbound/Config.in
+++ b/package/unbound/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UNBOUND
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Unbound is a validating, recursive, and caching DNS resolver.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
