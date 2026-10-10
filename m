Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5E1CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2C5260628;
	Sat, 10 Oct 2026 20:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJ68ZNcKq8XS; Sat, 10 Oct 2026 20:18:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EDAEB605EB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663500;
	b=mkGA8oLpKaXdpsyFLrvDfg18RvAgJ2kPq0ZUwKTjbQYwNXT9haapvAafLIrLVd9wtVee
	 JxpsOzOyEZdWF3O3154G7VRQXFMIQY0rKINDDfWwzs3q+x+JuMUluAsSpybydh36Ud2Id
	 j75K/ycBJ71LfrcGUiiT/ydiVfETqftOtdcYeXZD6PFUxQ4fCZW/lSnJajR5rLKQR6hhD
	 2jJb64+xuZ+B+jF1CdBPTg6LLX9evoqfgc5qw1P2Mir4uuCpKJuCNYgPVkoROxMZrLCjd
	 asVdaFyzpYo5eFr7kJEh9n5Msy0ftA/firLV2sNsJp2OMkhu+7OQZIvuWvgdfnx9IWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663500;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=KBwhKh/ANJ+Bc65NgLlwLYJCGac/McLAMWx0kgQD1/g=;
	b=bhYjbTKemS2IUcc4s8NgFXs1YsswCKA1VQh2sB1YLJNol4ZIKD6BpHzkpa220d8/49WO
	 q6RMD+Cw0+0mJq5nMXTnVfl0xVIgSmMRjCovKoIPQ5jnE/CJ6s+ZqB/7YyGCEWv3JCoUw
	 JvIQ38Lqma70soNAIQ2HLRt7NTANYwCPqtVzN/ieMgkV8G4Nd3KOGsp/6sizJQopX579F
	 VfU8WUK4Iqftb1yo43FrgUMIZyDzuz8prDPJNAbdYvov0sGOozwxqHwkYJr5n5oAH5P0M
	 oQr9r42rQI3+W/2z2lxtE/G5V9Mg6u/3Yc+uPk2XzmQeZjxMlQGixUQ5vtvsW0SBggQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663500;
	bh=KBwhKh/ANJ+Bc65NgLlwLYJCGac/McLAMWx0kgQD1/g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PAceAIVjraL/W7HQYM7Z/6LxcenH9DtCdaHqfek4abaYQtZuXQAUiq6IUb+k2tW4P
	 xgnR52GQd1GoOEE3wF/YqVV0Zduwj6D9FhSBmPbt4mJGPKcVjJpu966Xr8MmYTZuq0
	 4AZVtp8Y1EOLHwfKOahz4fOyv1reGOjqwstP+2L2FDjDqUdajfBfVQDLI12q4B1F5C
	 uBDBh7zy71v79zUA2bbkRy81HIoAdfAk2fN+OJ+tzEOzz3WXPqyVtCairuefhcni7W
	 wJNC1ibVjEHrsOVROxtYHKOW7jj1bxjqCA2f7CUm34HGkZliK7Sfm/VGKbgfXzFRKt
	 LkOkgF1SNIG1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDAEB605EB;
	Sat, 10 Oct 2026 20:18:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65D7D356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57AEB40068
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yY5OxaDKexoZ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8755340004
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663496;
 b=FEGNGmNnEbjLO862NG/z9wAifOrZDBPeZbiVt5kYeTIsIcPnodCeJDNM44Vixl1HJcce
 phREUrR7ZKH72IIhW2V/ObYUt1Vu5CxAjrj6GHyYEO/TwQn107OOUCbp16zH3I9gxNF2V
 TxmkCpok/JfjL0vB93T4lSp4b+EyTWe6oO1Z63rU1K1tNEWPzeWWhdHKN8G7mkTNITCLT
 saTsg/QZtDgouHM5hNWuKtvCoS+ORiqkeba6F7HYAW6WugT8vtsoLVJXk++ODKBkX0/v0
 4/Cd43Y5KB9n6z5CodAOHz6vbRnrFkSsnXl4M/LQqyVageB3rTU4szNgH0tmp2Ttbyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663496;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YDYCmo2F89rRq90jETJqMxSEydqhqJ4CLYsO0fNrIUM=;
 b=Ex7EEMB6eWHUZUUkFPzCvf5G9GLNkLj4NPyMR8S6thMQlxOMpMAEReMnn/Q/YL6TTZ2R
 LimML53eM/txVbjqr0aPEa35/uy178xcANjeE4ZKpQ6lO9SMXnyQtJv7mO1j/Q8mBfUDl
 cBfNyxcKJjIIce18zrgepBv/6GB7mCjNmFmIuljlHUlVZA6DyuJXeXjMJTSDbNw3ZWHIJ
 b/+iUKaxS73ZoKq4WQCtigqmE5sBQT9k5WbWGGSy5cX1rvyPCETXB6LjtINwiZDZMXHU8
 5hTKbWoF04SS35Kk0KgkDGDuYo4NJiXQseLyEZ3k/stIS5mOfLjXNQbzVZdIa/p8/OA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8755340004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:18:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C528934B6; Sat, 10 Oct 2026 20:16:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:15:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bca001a5ffd60e7d4c071a25090b9ea7c56d6bc
X-Git-Newrev: ab50df3c1fe2ee011dd11cfe1126ea2923ccf3c3
X-Patchwork-Hint: ignore
Message-Id: <20261010201658.2C528934B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcec: enable Linux kernel API
 support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab50df3c1fe2ee011dd11cfe1126ea2923ccf3c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The Linux kernel exposes a CEC API since v4.10.  Support only grows the
library with ~3%, so unconditionally enable support for it when building
with new enough kernel headers:

-rwxr-xr-x 1 peko peko 594K Oct 10 18:53 usr/lib/libcec.so.8.1.7.without
-rwxr-xr-x 1 peko peko 614K Oct 10 18:53 usr/lib/libcec.so.8.1.7.with

Reported-by: Stefan Ott <stefan@ott.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcec/libcec.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 380411e15d..8cf13e0a3b 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -30,4 +30,9 @@ LIBCEC_CONF_OPTS += -DHAVE_GIT_BIN="" \
 	-DHAVE_HOSTNAME_BIN="" \
 	-DHAVE_UNAME_BIN=""
 
+# uses linux/cec.h, which was added in 4.10
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10),y)
+LIBCEC_CONF_OPTS += -DHAVE_LINUX_API=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
