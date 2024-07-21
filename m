Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F079FC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C423C605CF;
	Sun, 21 Jul 2024 16:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaTcQeKdZnRU; Sun, 21 Jul 2024 16:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D282F60605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D282F60605;
	Sun, 21 Jul 2024 16:35:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6039C1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B50760605
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRdCJ3bB79IJ for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A3E605CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97A3E605CF
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:35:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 903F286F75; Sun, 21 Jul 2024 16:35:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:34:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d76e7e5fc05c7c6bec131168a108fa3ac00343b
X-Git-Newrev: ec7ae882e048ce4ca5c2b72cb884b8d1ef33c6cc
X-Patchwork-Hint: ignore
Message-Id: <20240721163503.903F286F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: select
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec7ae882e048ce4ca5c2b72cb884b8d1ef33c6cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
