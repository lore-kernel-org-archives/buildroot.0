Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ECCCED240
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 05:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E87641403;
	Tue, 18 Nov 2025 05:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NSSGPHROBBn; Tue, 18 Nov 2025 05:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1C54140D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1C54140D;
	Tue, 18 Nov 2025 05:24:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB1FB158
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 05:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 995A84140D
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 05:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMNskANn4fXx for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 05:24:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=goodmenzy@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED09641403
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED09641403
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED09641403
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 05:24:27 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7c28bf230feso5905487a34.0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763443466; x=1764048266;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=11g3ogGihHQ8g64xC6DTOhZXQSDUhSiqJtANWF4I+nc=;
 b=pPZD6JhdK5GMnSf+eNc3YR36SV8EBHffYauzzR33hetR4XgisjpHLkLz+VZX+kXwCx
 FB3LDT3He+8+jJe3Y8ObJcCfj0vqr5Ohoz3/kPuAkihBt0Kffs7lzNI4TUWFd/2FTbgT
 eXuGDWg4qFAC5wkjg7fefKvlEajmIPxYUx9tuUvf5bcD29nv599TOM1ZTqki+i9fgY0q
 OA9sZT2lWQ2KtBHNZmBVSpYCreREHBsf/mme5+y/HHBdSi819AEvw5FYZDjAL3HQtB4M
 JkQDKy+n2YHCISiV+D4K6gJ3L6uPzeViYaGROL5AC2vz2ytn+89rgQjIrLOWdG24fyEm
 UNFg==
X-Gm-Message-State: AOJu0Yy85Bl0+1d/QqJoYa8PWU1aBC/N3v0uknz3Yhzi8DU2zRX7np1j
 hyH/zTTNNfRhMpHGWvD3nj5QTxP4/i533NTkoFJ4DzP9bAM0H6U1DPLIKtwonIZVVv+Fp/lTII0
 zTEwg6zKTdti5dg1/+t3Ct96UzX6mfte9spKl
X-Gm-Gg: ASbGnctfj2J1Pv9eRokgzn62DnMzBEumULWmFLfO9TdAa81N7uwUs80Uy/TrkLmfvx4
 r0QF5UHrfM9nkkoKXsqlX/3M34Dsxk2ht9pQJMotNiTd3Ud6IGIybSHeM5k2DH5BMqnPlRkZEC1
 HniHX/YDn9f585Ud+QM7LgTTpiTzEXVA1wjM/bHATEPa2v0s5GSKQnjgibNP+i7Ydl8TvSJotAd
 iKGI6FIt8gjhqMtbV5RCV4l1ww7YudY07iVtazmL3dRer0vZHj26e+q4zPoppM+Oh8cCHY=
X-Google-Smtp-Source: AGHT+IGqJFDaCwd5kKBZWMn/r4dBEvvM4ck61OnQpAR9cB6xg7m86vO0l2Lp8iB1F4fcND1oFeZRve/SWkE5WWRz7Hg=
X-Received: by 2002:a05:6808:2017:b0:44d:be91:afe9 with SMTP id
 5614622812f47-450ddc9ce43mr886803b6e.27.1763443466573; Mon, 17 Nov 2025
 21:24:26 -0800 (PST)
MIME-Version: 1.0
From: Yi Zheng <goodmenzy@gmail.com>
Date: Tue, 18 Nov 2025 13:24:15 +0800
X-Gm-Features: AWmQ_bnqTOC1CbKIzWbixgw1vItblppq2EalXPUa-O7jPWbRaauoslE5_k7xhk4
Message-ID: <CAJPHfYOf7dNbKiJ4W_MpOUF3h4s-2_LuSph_LrbRC3VHW5JFFw@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763443466; x=1764048266; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=11g3ogGihHQ8g64xC6DTOhZXQSDUhSiqJtANWF4I+nc=;
 b=Oab2kp0fqZ1HX3wYR8jPJOyMuIqKisnKd17BDTGP2sVm2lANQMmnEBPyUH5rAjaHiq
 CW5tZlKQNM8i7SK/OPLV4Sr+YHWV9iWl0eEIFyYzBXlDiFt0iv6bydXdjotMTkujcGJi
 2Gx6zqCzrZ+C9w7VPBBwcOx5/f1qPxNeDDdjdvNqoVZfA9shLakamBkZwErJtLqtuY5I
 iV087ywKPmY+jFJ/bbnn+ER1Vn1HvrMPIERcBikYy/0rhkJkMZIWZYrOPiRDwOYFa0v7
 1ySYDprmTDxdsKQPg5ngfTsqHsyZjx+7BpFoJj7E0MYrTlW/KxkQ60XMiwsY+Di9oD1B
 TtDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Oab2kp0f
Subject: [Buildroot] fs/squashfs/Config.in typo, arm arch-name
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

BR_aarch64 is not defined. it seems should be BR2_aarch64

i can not access gitlab freely, so the only way to report bug is a mail.
Sorry.

---
fs/squashfs/Config.in | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 4f898bfdd4..cb2f5ec969 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -114,7 +114,7 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
       default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
       default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_LZO
       default "-Xhc" if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
-       default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ
&& (BR2_arm || BR_aarch64)
+       default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ
&& (BR2_arm || BR2_aarch64)
       default "-Xbcj powerpc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ &&
(BR2_powerpc || BR2_powerpc64)
       default "-Xbcj sparc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ &&
(BR2_sparc || BR2_sparc64)
       default "-Xbcj x86" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ &&
(BR2_i386 || BR2_x86_64)
--
2.51.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
