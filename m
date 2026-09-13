Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B7BC88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 15:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B90280D43;
	Sun, 13 Sep 2026 15:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eG5oPZKU1LLU; Sun, 13 Sep 2026 15:45:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 30DD580D98
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789314348;
	b=SifEpHzeM+Lt3KmgPrTLdebBbeSn9LblihCSf9mfeNn/NlBLfEDNg08WkzG3Svndwjde
	 aR7oOOHwiRCN3vuycIyODVLthrsSejxo6UEQ37sgMTNVQf5P3PY6alEy5oRnh2f6IqRCW
	 d9UeBU9o0ZUglacnPDrSh55rGkAz+0iH0r4gxu8xt15BJ2qNkwEupL0zmD6+t0VKx7xlJ
	 L/qoqgOqaXs8ZJOKQ5aYn9s8KCXbtXBM6eiWe0qWGavi8yR4T1QYg7nlzg/0YMwHZl9e4
	 X04eBfSH5pbkSKYNfiFHLL7WrU25s8C9WcBiEv+LWkM6QAWT6ITTD6QuKDSWlT/ZqcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789314348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6VJCyXgIxj2XZ5lBkaSWzGUjkmY7STL/xphjohTMpno=;
	b=bw4kbKpTxly5NSDrvTFLJ0uUfVQPSWl2n9oQ0hHRv7zFybpHMnZyYRcy9j4GpJbfMG/D
	 jfkjq96+nFZnBuFhhh9vz3vkjlzPevPah3HE/g1DBNfu9tc3o3rTcHnkiCb8M6DmIAWQG
	 LYTU6fZAH9r7wjFMj56NFUXpNromoOVkKyeGBslDPQyBOnSykmTukN+R6X1/nY3q3/Ry0
	 72s0cYgE4oY5MYatCRn1cnXTif7g/gGOqTyLj79u2UZaaHd+qaO755l2KD9xYMr6qCmIj
	 IXxLtrhH9jcS+4PMXwTYKTeMC+xIRhOmr4q2zX0enTqxYDS4QDBE41uQCm5d5kx84Ow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789314348;
	bh=6VJCyXgIxj2XZ5lBkaSWzGUjkmY7STL/xphjohTMpno=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gr4sUUNPZc2bKG4uLvftiLF+VvpabPmsusUSpD+fRtQ7Z3Hd/JsfLqbNdmKVf4S7c
	 rhupLSyW6Ztkj8D3naVNVlsRYq85gRHaBTJbEDO83fqtIq5P768uKSmzSSUUGsMbeK
	 KVMfxf/Rv5oRn+ZKBhm111FsrRod/8VHO5Um/JZRgkx3Rjc3Z+NSe71WVFFgEFS36E
	 YaRVs8hfVfeKQWZMgeqjL79GF2x0qdZuGB6CRbm7pat6fUpKCEZT/nxD7lfDiePJA0
	 itohDaJfag/KvOmwW0BxFPWYnxVl5Nq49CTx0cqAd5eOkT/paJjyZDceonEbcAT8zC
	 gL9tZU7Q1Rg7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30DD580D98;
	Sun, 13 Sep 2026 15:45:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DA08362
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 250BC4058C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzyVdLB1V_Pm for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 15:45:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6249540589
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789314346;
 b=PXNvCcygmUgIzwvylp3jnRQ1u+1OcBZFlkJjZ79/QVqk+W48QLN96qbJ0NIZTljTReue
 pheNrw4a9klVIEEXt9dO0yvihEZxhd1oDZH+EHF6gO+Mu81hCLJl4z9V0iIAaTVd5POEy
 kU0WjLU5hV4KC+FpmsF4ZGsY9w2jCZLe/8f2eeJLhb7cWQS+Ieyc+dY2XNgrQnRgSJPmJ
 nZPiOHdpA1knNz9Xbk32+HTqZBB2mxPeT2B02ZZZQZpi/goi8c451APDpZPa5p6rh5zOf
 S8P1MzKagmHuCLWSaAsNhERkQi4OYuPk7sfPMOJqxdF9UBaDXAuWCbecsZ6Y+DijJ3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789314346;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4Pl1JF80dcq9j3w8hB9phG+RRM0jSxxiKT5hNUFweIE=;
 b=OqrKxOPBgNoue5TzklmlkHcGBZxz/Qso38tfOwq53V0hkK9lZX8LVzvTSF4twm/h41Tt
 Br009JF7tpGKp0qo+Gi6KXYSnq18hC2p+maCB/rCicUW6LpSbVQJM26WbUV2ihnjYN4vF
 P9L3uc0c5W4UzwtWTYBBNkVDOEsUfwJif6vvXUs7YQof9loIYmURWGnS8Qy5CwiMTIpPg
 e1j+StaDT/7LNdExYVV0i/EEQqbd/8f4mxvO1nXRcPHio1y6B/kwGSS41zOhwF/wVabbJ
 4R3cCR5kAVWceUC4f4g5VJt6al19S8pabnu2+xni6djQwyR0fUqHUeikgioeiIMP1sQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6249540589
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6845995B95; Sun, 13 Sep 2026 15:44:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 17:37:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16e3d628bdb55623169412f52116f42a28b78df0
X-Git-Newrev: 00e83bc24ded9d40ed7a128de0ce381394cd0a18
X-Patchwork-Hint: ignore
Message-Id: <20260913154441.6845995B95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix definition of
 BR2_PACKAGE_KODI_ARCH_SUPPORTS
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00e83bc24ded9d40ed7a128de0ce381394cd0a18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The definition of BR2_PACKAGE_KODI_ARCH_SUPPORTS is incorrect, it
goes like this:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

so it means it would be "y" if either
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS *OR*
BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS is true. While clearly what
we need is for both to be true: ffmpeg should be available for the
target architecture, and openjdk should be available for the host
architecture.

One option was to change to:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS && BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

Or:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

But we preferred:

 	bool
	default y
	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

Fixes: b6a2f494290d85a26798564992ddd1ac46c1a48d ("package/kodi: depend on host-openjdk-bin instead of selecting BR2_NEEDS_HOST_JAVA")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 0b13136d82..d64a6fee7e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	default y
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	# i386: needs sse (see upstream PR 10351)
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	# m68k not supported upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
