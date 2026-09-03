Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF2BC79F83
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E25C60BCE;
	Fri,  4 Sep 2026 11:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbyHOXA9VMTh; Fri,  4 Sep 2026 11:16:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6CE8A60BB5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788520606;
	b=Ei68wPmcTkbxn+SG2eciDYe82eCMEpBMzO2JnvsfjYGPOApuRJ3K+fSsxJ3ZHR1qwLP0
	 93PdqneiQsgk3ZaivMbvYcvGzgWnwc1oDkNlUwD+YQlX2CdC2Akt2bT293y/4tYukgL9T
	 NJ/MtACf089+2DJezId4Hs+DemlCpabnkRT/8jwfsZr8JtK97uoYdnZrAvpLm5VAV/H59
	 ckR2IzH3SdBdjKq3iuMMy0RDEo25yeJAVOYoSna/iGvXkFMAZHLxhMEbCt67NUopH9BEl
	 8O9ummCjUo9VSQ9ipIksme+MP1xx1g3SbnsFX08bbMqSWcCJwMD4Kx0334CcCXdQoCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788520606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HrCzZWglMFsqOS+UYQwWw5waue51jNxlEd8mzsO2rJc=;
	b=a0db9llGp9vPu/wBGfQHyEqhhACPN2PaFa/NKVWcGJd9sq3OJRhdmyqNFCks9IDTW7MZ
	 M1Mo/sqTzctBvB3qShbYB2LvKcbR4sIk8MjTXzwM6l5AcizTmy2bB/p/zo54VkGN+hSxM
	 +60EBdIrRkUnNVDQRB80vfi7w0SEzJKRsSNJjzLveXHUta0hsjrHTSvyDSOS4+9/lHpJv
	 BV2q92ml+L4OmxjgN2JlgaVL0Paw+LJc0JTOSsgeoc4yWXwH7SJYajSUMIX7UZYl1mvnl
	 87+iUZPWDymfGZV5PELyi9ugD+BEGW+WN5IpavtzXObTFjSy4zjSIriCktoPreH4qSg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788520606;
	bh=HrCzZWglMFsqOS+UYQwWw5waue51jNxlEd8mzsO2rJc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VCRpoAhGuiZo3d6t+Gyv4+poaDkzgAjIohAzpyx3E2qPeS5AHdrl9b6eSr6M/3VQB
	 J72HU/jvWWL2lTgqxZuEFpJM0hVN42vAO5zb6TGGGEEZ41hBhfSpFm40+/ibjevPR1
	 bwALsw4nNR/l1ygX0xk9P1n2ZIagTju1SSdq5QAe0KtejcrHUbpD3WB/Np5jcTDUow
	 kYvLYxYxyj/tA5zEal3oaE0UDx/R+fKKuGTYSQUvIuNt8OuA/E2in9IZrrR3eXYw+r
	 FQpNtKTWJ11IIt6J6YFVDA08TKMjEA9fLXAuyhkmX925IyRbx78DMo8aynju+WaBXU
	 wzQxRfHsQlUxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE8A60BB5;
	Fri,  4 Sep 2026 11:16:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C428E2FC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B52C360BBD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stcCLPEP5vZN for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1560A606B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788520603;
 b=YR/ADdmbaLZEG4LslMEeqoDlXpaRPTV+LKGDa1YzdfR9EZWoVWhy4aPRSp2ofXFeUPp9
 JSMA6b9rWuGNUM3jZ8gcqg4HQTx4OWvlnG4pXUM2pa/UOrBx1jR1hq4z5qqL9YtsTMu+l
 1ZsjzCtoIFjYBr74hgRf6O+s73PMk1lEZ10VSVUThZTzfrM1xOJ7BXG0t6KDc/d6nEzE9
 i/Oqrdhz9Yt8cFpu9zvfsvCn9/cR0/FV7TR9GH1XqSkAaGnmZLoi/V69ek5NYM3qK7SyA
 FuHXTOPSbP2FaOUTca4rIZ7B8Y/NTXvWBg53+h2QxRKEs3UEUucV4UXsY2qt6mkkLcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788520603;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/MNwsdzulosj8KCHwyV4GULZHgwwLgnTA82QvmqKZ3M=;
 b=kaHMeh7+8qCzc9ZL8wisDPliVfsPHfliwB7w3e3kQQTYx7eYwJC1bVNRgzFwb5UN/vOu
 7kSEZoRL5987r/S4ObXHIZ/yZHrLG6Jo+dLeACTrOqg4ceGYBUyuQ9TN3HIAD50pFKcut
 pg5b808rA+ecIX+IX6yxxTblXiUhvcHKbOzH0ndix2EIw4Rsv6t7ruIhcmUMEwzli7LNE
 4/4P1x0CSgkR2DsHIKtZxZV6jD4OUrY2IAIaWsFuYCxmTCL6t2MjzyYMr2AHdL63vFOOE
 1mmXhb3Pyvm9VMkjnTBWzTs5WkXQEwGP2GmuTMVNBL+EcvZ45FTnz8thRDnLhZNAdWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1560A606B0
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9394D9470F; Fri,  4 Sep 2026 11:15:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Sep 2026 10:01:36 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: b226c11847b90b18b60ff8fcb84a7ac23078f390
X-Git-Newrev: c456b4b22488f22680f58634f2b3cb12f9f1b7c3
X-Patchwork-Hint: ignore
Message-Id: <20260904111542.9394D9470F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/redis: security
 bump to v8.6.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c456b4b22488f22680f58634f2b3cb12f9f1b7c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

See the release notes:
https://github.com/redis/redis/blob/8.6.6/00-RELEASENOTES

This fixes CVE-2026-62356

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(alternative to commit fab3c4eb92877284f39ba59289affc8fcbccf1a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index bfe94b8a76..87877c1a4d 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  cd04337495fda9be071d4e1e3c6a61134f83995bd23d1794cad18f878b7012ad  redis-8.6.5.tar.gz
+sha256  8b1b04f77910780a141bef7d66990d2f6171209ce615dbedbfa3b82ebfaf0887  redis-8.6.6.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b08cf9ab92..88432df3a6 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.6.5
+REDIS_VERSION = 8.6.6
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
