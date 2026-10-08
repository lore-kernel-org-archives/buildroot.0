Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC358CA600B
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 08:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7438A811FD;
	Thu,  8 Oct 2026 08:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfaPeiD1un6H; Thu,  8 Oct 2026 08:59:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9394D811E8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791449958;
	b=VXWHXLBd+MxVPssZjaucWI5lYa1e3zraZP8b9FTpjHXtDnlztbw2ZEfpt9lr6KsuU4Bm
	 y10ztJbp5NVSapRj8ayLyRvneFTr8X16h20xLCu7rQQTkCo46ysfarJPrNmGgnD3wjlkM
	 P26gT6DQU3FYy4b+hK0z8zkvTfNFtRoT6WYxZWThW4LzxMAWwbphbyQTmfOtvwfMCGcrb
	 Ng0KXwITXRNlH2P7xUnPrD+ewVm3OdLh6Czs4h+nqgQT7B+zXnWXPLl9aXrsd/C2+tJtb
	 CbaCU9s9TQ9uv3tLoylR2+XmIN4buCvG7YncfJFCwSPmofMnEWrIxMbkktiGGp+6ffw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791449958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Vl8u6JcW3oONj1IwA/S+XLhZjV+60YTUW7gLVhpxSA=;
	b=HmvdwPpPOzcXGCB+lgzKdroi9Tjf9ABSQjDXB0le4V4coDoglxF/enHA2Sy9KjA/mN3T
	 85nR3dCLWkBvzyGHENbEEwi3EbzQkEscNgEPVVQ6YEwdTDvibfDRZ890uIh/lYESwfkTH
	 uouycb3ow2itG7cv/Oa5B1cFwLTGp97XK/+FzL8VuaTHfEAZesiHJplGg2H6EcBVW5sdG
	 2NtTvPgWr30J0kDD6U3W2FD92GHQFboAP1fCTa2i6dqyUUXqGhwUnkIQCnFaLGWIflBq1
	 6E5fxJbEN1JfyvcembgVNmsAnSSfCqgHay3AaKn1ocNqCqNtIDQ/M09qBH3hFnSaJGg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791449958;
	bh=+Vl8u6JcW3oONj1IwA/S+XLhZjV+60YTUW7gLVhpxSA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBfti49brwhS7q/Z0WAtndn8PFEExARM3h4U3+LyjorzGxkSWXpthPUfRmbXEVGtw
	 LrRTV8YkF+pYhDwOBy8vIVdI8nroc10hg9qA17wnrq17Yr1lficYnGYqICYs+dDx6E
	 EcqtWdpIg5UqS3ZSMF0LHg/9pmECAKch9xzFmOnjYmPVojsb9DEaXZBugxjDhfxEvA
	 n+woH/tnVaKObyqscA0FFQHZ51UpZPQ6xLQMHIUNsd+/dTVrzPkcEyuqVlhCIl5x8t
	 ecWo94uhK/za5EyzS06VLnUV84gCbFPTngMxTmf1tOl2bHsZ21TUsgPGi4PFCYuZ0o
	 im3+W0CoA9GDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9394D811E8;
	Thu,  8 Oct 2026 08:59:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F9C222B
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 116D6400C5
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pl_y7LsGREFO for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 08:59:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 14B4540050
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791449955;
 b=XKxqIcVEu2S/Yv2tb57wLOPo8XfSpnPlQqRT/r71uF2T9BYx70tcAF+3l2C1NT6xuDUj
 FXSfHmpUV5KBhPQcfcJVj0bVoKG9ufZ8Bb2PtBPlrCuDYuILompg1o/26oy693fJ09oSs
 CsXFdYPaXQT6ScoIAIBzpiJYPjbkQKwnrgAqzyztyKSSZF10yahuGeMFSePYJLTe86k68
 6HvD90+yA2UX8WB0WePPnk2U5GfLgZTO8l8aDaWuxJlHRmcI2OwL8KbIMKtkPx5n1pUt4
 TQBlHfWH4BQ0gkx2TBH6OhLG6apoyFwoY5rP8IbeBSl4P8b9c0fqz3Nn/JXUMDgUy6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791449955;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=mzHd5DizvkZVa91mMRqdyNHtIs1eXtiwNCn1/9ABg7Q=;
 b=f/HIOSsr3QDH39Lug27lrLaLBWZ22hMw4BY80q7nArtBCV1cQ8JWH0nGnRmBj7FCnfzv
 4jxRS6sS1V/W7bROYNnV0vWmFS+EzQfa+YA70c682fdx1k4Zbvp1TXJ86APaZBZ5S82or
 kBbCXU+5gmoX289MurBbvNpfefotzGyd/DvdPseXlY3jBuG275QyrF7anX8pmnOpikyR0
 55JGkZzLeCw+HlpQD5jJuOPsyoEDIBpF3Kvjgt9U0tvETDAhMZWrPhb3EaK6chCkpe4N+
 YzwsvOek8W9kxGmxqHvD36ghF12ItF1Y/v4XpjRgfiHtbAD/SAmmE7n0/ehZHG9mIow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Rsv+nLWC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Rsv+nLWC
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14B4540050
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 08:59:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c2dc8cb0decso498484866b.2
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791449952; x=1792054752; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mzHd5DizvkZVa91mMRqdyNHtIs1eXtiwNCn1/9ABg7Q=;
 b=Rsv+nLWCcL0jkrrXjzSRbwdXtaoss4sODI8B/koJFWbaERgxP36/YWk6YjsuodYSQh
 2rIPdLvxoqqaelwNN36lUeCrkngXaV2HU4hE3hrVcKypKclB6tfdVFgzHwUeCUAFop0m
 vqdxnuLDdloqeath4Ve9wUeXzZllihhxcweq+EBTYqKBgfKzvsSh2i5Ntg+Ap/6E6s2M
 cRvy2U1K1d+0pjIvtlyo+bfdW/rAhmWLbQ/lOGRF1HuAo3hOI8pV4dgfKth6OH6mS4gx
 BZjvYvZMyIIgQp2aE9YjhzOyQlvziDF89KHuIoNljr03OKStZShXIhu+B+9TbsIyryUt
 FKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791449952; x=1792054752;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mzHd5DizvkZVa91mMRqdyNHtIs1eXtiwNCn1/9ABg7Q=;
 b=slciFMKBscVmaEHgxHOgZbAYerLa6SL+iEjblPFRXXQAdnfC5/ciHiXn4dGsn1obcm
 Bwsv2xW+fhdJKBk1trfl4gxWSeMACGFDPRTRVRUsv2fBbEiF53snxrFSJdnbdRC8mC9L
 DiGvGgEXPKOlpjvvLHG1GXxNuxaE+qiLrOfFnJZHWwPOMNDn5ZNGyfE0yGt2y0mndizH
 6z4lgxWlZqkQPS1+/htAN9oqUD6I1K8pPR1dbz7+2OTdWuWD39ais66KoA4nZM4S5Bvg
 Drc2OKACRWVuQesC9GJgw008dBQfinF8IfiBCBRPpUMz1PFsfnyoRK0281XHDDkBf/rU
 tq7Q==
X-Gm-Message-State: AFq9FYLqYitcpUaiisz3BTA4+Vu/BnErPdaK7dqScvuKRkpcVz77c1As
 Gt1y3W6OK1jNloF8J71ja1GpYPInv/lsA5jAffnT/chZmyCG64Ky+io7UZrHUnja
X-Gm-Gg: AYBFou2GQk+9bnZs91ntK82VHks63HEna9NYCx5fYE7MMBeKP0MKZPpIQLxtGEVQIzP
 n3ZXR0lcisXPCISGF2XHepK49mOJVU71eUPkunKUdDJpdXs4ekEPUECDgA/9cOi+Ls0beJRVNAr
 UzRzXTFzThF13aapxFLt96y+ajRfjJ6U6dmnTa/aYwj8F1KeIdkYVXZuhUR3Gc6oEep5QMliO7G
 NrObG2uX8M8LJVwkqWmYV3MjK4kBecSVNjTRtDpGyLvB60OMI5zYZ5CoZRR39W3+FJy1XDvqMuC
 Y4Sa3XU1FH+CPf7FDy4eA5K4mdIzaa8ibb+GAlkGtPZbuzCO5Ul+eLsRaDdTLvcQeRS0fVsob/F
 ry8e/hXtZSJ+aGu/heiA4YyYl8FziuC7+T4oTSNdBocoYrErg5iugT3qzee4hS982XEhx1pN3QZ
 J4FzF4FHI6XsnM2KkbxgT6O0IVonbyjfaSGDWn8upmW/gn7mmGIb46kt3t/97bwynb2SLfXezs4
 bmR27pCeQZlz6/7U26BrpQWHnN0Ld1b6/SxApr3ntVrIWs=
X-Received: by 2002:a17:907:c0d:b0:c2d:d019:d414 with SMTP id
 a640c23a62f3a-c317c07dd5cmr418292166b.29.1791449952310; 
 Thu, 08 Oct 2026 01:59:12 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c317c33ff6bsm197171066b.73.2026.10.08.01.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 01:59:11 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Thu,  8 Oct 2026 10:59:01 +0200
Message-ID: <20261008085901.2692162-4-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008085901.2692162-1-troglobit@gmail.com>
References: <20261008085901.2692162-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: adopt firewalld
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

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ac338dc8..c703e50b14 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1668,6 +1668,7 @@ F:	configs/qemu_loongarch64_virt_efi_defconfig
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/firewalld/
 F:	package/inadyn/
 F:	package/libconfuse/
 F:	package/libite/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
