Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EACCD5BB8
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C789760B24;
	Sat, 23 May 2026 15:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBZSis6Sa1yv; Sat, 23 May 2026 15:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D840060B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549587;
	bh=kmRjhcXAOrU7tep+wNozRdrdmSmpdh2EhJvxPliSuIY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=RVjfMRQu61t48DZNiLRbmwgfNVe2X6Yhwe0ZSigaFotaY+ZntFz4/tam7DNHbMMpz
	 UgMqSIkg0hBOaHD72tcXjTHSRJ0b2a7Q5eSB3WBFEDfKiqolnIWh7s1YUFMvV6tI23
	 a0B/zsvcnv/dmsc8qHDb9rpII7IOTH6Jehy7vs/oUYXTXYPC5jcplLI3VuXwTlLLUv
	 WbORacEqbR0iUjfFh0Q0+SWj0pXYltMpDGyKv75P1EOgJ7unf9VIv463wiSimav2KH
	 SiYJ3ojox5GWplCJcZh0d0gq3yOpktzYJMH6Cf6b/J0k8bMWxbFJyNo0Yt8W9N78mQ
	 0sNpV994PSfNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D840060B4A;
	Sat, 23 May 2026 15:19:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E69282
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EF3440487
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0VbnHWmkNx3 for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2179E4017C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2179E4017C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2179E4017C
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5eR-1wj9pg2tEL-00XfYC; Sat, 23
 May 2026 17:19:33 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:08 +0000
Message-ID: <20260523151911.10285-6-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
References: <20260523151911.10285-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tCWMgQy/bfmiSmGWD3nC4HXXZzHSF/0YlomSuGrd011t4PPKCLS
 OqlmlSaDT9E9OrJJc9i+f3R2GNUZVvy+mhJ4r/1tnOswxh0FxM52XLv3T/+Fcr9FmYkidsN
 ImxPf4dP5diuaF6HcqUChsJ4YpdVuzuk8/xQQx+xvwUxSJHP+If7uFbwgz9pIt2JTKtrxR7
 X96Gvll23+fr9hN7ohrvA==
UI-OutboundReport: notjunk:1;M01:P0:FYIB+ncuPn4=;JQpKLGvhzmFnFchGn79jgpKC3Ei
 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
 BtoYCv2Xk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549573; x=1780154373; i=and@gmx.li;
 bh=Bk6fU3PkNGcGN6UBbGSUyXoLMtDBz6p7Bc14v59Cy1A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bSkoW9x/t85cn+RMbgdFpftSLqfo917l2pMsjpN7/k0jRWw+LGBP4YtIUowp8GnZ
 ZWvq2nJM78AITcgY+eShpX9odt/yRlOrAprhVVKOyiFAWWPGjs9N+6ukgQqGV7rI1
 N/EmqQmZI4enO/1ZJKVJPBK127zfn1cWLAOE5sdZFbQO2WeFD0U/Nu3rk6I5uz3Xc
 Gw46jmnViAAb+n1Jfm90/I6UFLz16ZBKCl0G9SG3gP1rAkOxBNT5OkD5GOb6vXOQ3
 y0I3bICHxb09f5O+Rbikqiiv01uYukqWA6u/1YSReuKAvUxvFA4bpDHwFC1CBoR96
 /EwxpgXhRCaaNrYaiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=bSkoW9x/
Subject: [Buildroot] [PATCH/next v2 6/9] package/systemd: remove lvm2
 !BR2_STATIC_LIBS entry
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove lvm2 !BR2_STATIC_LIBS dependency

(It still depends on !BR2_STATIC_LIBS by main BR2_PACKAGE_SYSTEMD)

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/systemd/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 62dc3f5a..f507a55c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -242,7 +242,6 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 	bool "enable home daemon"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
-	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_OPENSSL
@@ -254,11 +253,10 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
 
-comment "homed support needs a toolchain w/ threads, dynamic library"
+comment "homed support needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
