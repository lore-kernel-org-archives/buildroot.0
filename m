Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F038AC5CFC1
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 01:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1A4660666;
	Sun, 16 Aug 2026 01:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyTunlouaqRn; Sun, 16 Aug 2026 01:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C1B60615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786843644;
	bh=netbiTGIruC6SYXv3V8ow4lPHGPAZB5UyjMa/RAD0Jw=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nC9gDOcZBKOyHsxP569K/bAf3v9vphGvrn9lfyRi4GIlCSuuDCV4H+URzHP1mFEmT
	 24PJdP6gvvv0qJSeJ9HVnjQRj6ylgtaWVCAV+Vsk3PgJhakil5wmxL+LZgNJ7zPP70
	 O5QkWhE7G59yGtXaRe699cS3v4juZsHfGPvNU2Pga91j4QbVQuM9ATZaWgB+w1MXkB
	 6FWBao9Gbg35ur2XxaY+Pf58NELqM5BMIyNchFXuLcgcuFRnGmLcGWEkkKlDRWHelI
	 7xaG0akIBgB4TW7NFiJnpHsSvmMi+USOituFZY43j3m1NjS8yJY6M7ReQCCLa/kbne
	 agg3TbVIOw6pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C1B60615;
	Sun, 16 Aug 2026 01:27:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07CE6337
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 01:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E25D6406A8
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 01:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJX9EQAlXlD6 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 01:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=thecharlesjenkins@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4428D40689
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4428D40689
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UpFAln8b
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4428D40689
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 01:27:22 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cf452def93so26089235ad.1
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 18:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786843641; x=1787448441; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=RAD+yYqQBx3RffeuHlmyr/y3lStuXr3/8Nv8c3Qa2uQ=;
 b=UpFAln8b+pagbcZZDTIrUsr+jgjk//7MJ26TNGTERFhNftnrk2MfBf9yEfZIp/KyQC
 E/vxZ9Ah2JzFxllbc8ouJ/exlI73iGRlBveqwYqrymGYUSd9jZsBSxVzOhU9xyNa5cQv
 fnan+5DNFqhepPiT60uQZNDTyMMPLMZtWsOBiSis+I4+MbyxtAXH3caGbSPKAoOlWqKR
 fHPJBQHwMxaYuGDWxzbASsnJbkhYtfujScrTzunqjZaN/s/3/uHgACQZiRb/bZviJyhV
 n0xzuAUwmjk6AzZEFf8OgdUqNRdwScC3uB8TprgfeKaUsiiFXEw6+xbpL3He0hf/nyTk
 qrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786843641; x=1787448441;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=RAD+yYqQBx3RffeuHlmyr/y3lStuXr3/8Nv8c3Qa2uQ=;
 b=mexNwTgMB3QdIKVLkJhYeJ8ppQiaa35IXtTrC2IP1M98mcsiVu44L8h89fJC9df+pp
 s3bz2yrWTshgtjxkohS08ROKn6RJGXcYCkSjOAP9dkk3MpVVB7A9+ziDtCWt3yHNkUGr
 hHjdztuYYwovPvDyacv7NLTblaMg3Xz2CzTfY6tOJOXtYeV41lCfDFfHbG4iwLClWkwr
 fOutkpc4KOUmco3wl73WcnqOAyeFSBwmdv51JWeBnf++fADJD2vCBDFQiI8Q4Md8+2tm
 AZwXa3cGgj33R3SxnzOLUyjCJDGDNei7g9DT6ueAhW/xT3vbJV4mgnWMYTh42Fa5x+4s
 NtVg==
X-Gm-Message-State: AOJu0Yw4cjnmcrZgSKSaHVxT8QBV19PACRMtFt+/6UdL1UYWJFtojKt3
 NUNS8LR/s94wrT+SBXEgPhWsys5tcWASuaaKMPgaOcucIeElHejqoFGWwPoiHA==
X-Gm-Gg: AR+sD12TzWBherllNK0z08ty19/ZcNcMaTktTtO6OXkVKfbRYUWrg4RP6+roIkFWwOZ
 VUup1/YrneyxM4vH1AhC6BRQvHB+2qv7oDO7XzqdFAjM/TGyjCnTvo5H5A2IKGNsKDcxTGO45aJ
 5rF5GkthsFSEsHK2qkoWhGzejfvoiVhyjId9/tno6auIQ8Ud0O+N6wHUKJPWbDVOfIVfP6VYa0l
 krlFEmB1wZJnW+jvgb/0wCL4iKCz4E+XyA1yeWDV4gjCFlqIUuySd9utTvUs0c/AbDlHbZ0ynij
 VUIdBVBVHg2fVdP4VuXBaN2YEKgadfQey/ipBt8HwdMQkmJTc13MBPmaRQ4V3U2S9eEZzhWpBWT
 QlHfFPbxgptKAb8bvY42Rn39ILHv8x+Rrq4UTcdA0nGmPMnSpOsS7kFe3v2oxgjWT2d9zCxr4GK
 aaPPYSBlIOPfL5VjjThSfohYyFF91BMOpJ8kVSXRC8YrkiNkKPDYBcVDNlu2VVMB2lq2Ii0uvj1
 JT25gnDErkJ/NjHSHGErC0UeEAI9htzrb/hdMxCefsXbgQ=
X-Received: by 2002:a17:90b:1dc5:b0:38e:7e9b:5fbc with SMTP id
 98e67ed59e1d1-3931f4844b0mr20025475a91.7.1786843641403; 
 Sat, 15 Aug 2026 18:27:21 -0700 (PDT)
Received: from [192.168.10.145] ([67.174.242.98])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-141387c6f95sm32303955c88.6.2026.08.15.18.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 18:27:20 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Sat, 15 Aug 2026 18:27:12 -0700
MIME-Version: 1.0
Message-Id: <20260815-ncurses_strip-v1-1-da424b80d70d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2ppOSYG48j8MMaUOMEYe6QDRE
 P5dimuXJzn33BWEApPAJVkh0MLCQ78DnhLwresbUvzYGYw2mS7Qqt7PQUjuMgUeVYbWpdrVDo2
 GfTMGqvl99G7lj2WunuSnGIlGyzIN4XMcLhi9f+0FFSqf66qwaV7nzlybzvHr7IcOym3bvs5WA
 n+8AAAA
X-Change-ID: 20260815-ncurses_strip-615a30afa120
To: buildroot@buildroot.org
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786843640; l=1355;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=+h9rixbkq3WSPIAGjCPCYcOtMq7e+DNuiqQqbWpwxqA=;
 b=T3iLTB4RoVklRHfftE+cFA+GgDC8ghgn6mc0hOg3uerJ15u5+8eWkEm/mhCxPoiEb594zEx67
 TNAVXUbP00TDRQzDAkQ22m7UKHVq2Sz0/PmOhcFGtsNMCYAcjBTl38X
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
Subject: [Buildroot] [PATCH] package/ncurses: Enable stripping of progs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2ab611c40ff08bd4a7922456fed22af6953af3b1("ncurses: fix build
failure with ncurses 6.1") added --disable-stripping to the ncurses
build because ncurses started stripping by default but using the host
strip instead of the cross strip.

Enable stripping and change the strip program to $(TARGET_CROSS)strip.
This shrinks the binary sizes of the programs generated by
BR2_PACKAGE_NCURSES_TARGET_PROGS on aarch64 by:

clear:		18k -> 10k
infocmp:	76k -> 62k
tabs:		27k -> 18k
tic:		103k -> 87k
toe:		27k -> 18k
tput:		33k -> 22k
tset:		33k -> 22k

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 package/ncurses/ncurses.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5e2077500a..e017bacf6e 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -31,7 +31,7 @@ NCURSES_CONF_OPTS = \
 	--enable-const \
 	--enable-overwrite \
 	--enable-pc-files \
-	--disable-stripping \
+	--with-strip-program=$(TARGET_CROSS)strip \
 	--with-pkg-config-libdir="/usr/lib/pkgconfig" \
 	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
 	--without-manpages

---
base-commit: e389f1b44c54660c7bb5512207a561e684b41595
change-id: 20260815-ncurses_strip-615a30afa120

Best regards,
--  
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
