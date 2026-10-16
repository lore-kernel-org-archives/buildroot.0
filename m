Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C232CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7DDE40C75;
	Fri, 16 Oct 2026 15:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bn_Jl8p4G5HU; Fri, 16 Oct 2026 15:06:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C22AF40C64
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163177;
	b=QOoTuFyb+S9uKoyJrLsc+OF8lTj9vd3jsTIqHZyYEapvyOR/ReIV09zCjZkaPZOCiNE1
	 LuI8/Gr9MhsZP2J7TfWwZ6QqBwAhkJBQfTQRw079AYvNf4DRxUHw2o+yM6uN3IsJ8b++i
	 B4EdrYSH5JxjiW6ynXd/8BhHczh7uVREOv7pQq/HOMyeJve6H17mP6zL5L4oHfnk0GcjK
	 ddCa8rm9iSESTJXE/bEaEmYit3Jjp0Ypbg3vxDHql18TwcQrMmm2pEVAC52zFEUTDXhHu
	 n9X7E57N3WrL88koQ11F+zQvCVs8+5K2jWeYGDF/jd8ASaktIDZwK7NkEu9qEF+KMng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163177;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U9v0Mz/I0lLW7yZR3+adzsVTj+1r1k+e1oghFvq+eyI=;
	b=Dt/8ZsP/1YgivMrqDgFm4pPzkCvXiqQDS0UFQr6KW+ov8XwcPUefagcl0sD8jwBvkCm0
	 l5ZMQcelPEmmf1VYV1UOfEmVzBokYEHZvzwA7AMPIIOkh4Zc18bSaeNzrlp0mQuavJZGD
	 Yzy0bm+yHZziCBBX7pv+VTRaE3GqEEZJIIQaI+ohsZ8uHBuhFq47VQkjfxxi9E3YI2DSe
	 qHVFTlUsZQB52cmsETCjg5WOTxURwCt4cFwftWrficNHsJG+BCvSVBnPdzjhEooQc8hAQ
	 9aWLcZNZOUceegsakUMrzu71yjtzW/MAqd5ruDwpBKi9T0b7+U53qyJBn1GYd1INjcA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163177;
	bh=U9v0Mz/I0lLW7yZR3+adzsVTj+1r1k+e1oghFvq+eyI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ja8y0RmsnCSD3fxHeznTQOt4i2Ta6dDX5AxONt6R+o4BR4Ls1rY/bviO6+BpfK5RZ
	 4oRM8OaDc7AhPpJFa8P8EZgUAweA8YxvzcrSaN/HJrR3zrQSvxNGuSQWmVm28+I0KW
	 DG7//PGw2Nr3vkMWfSBLfP66AeHHqtR/LIKoSgVYjb2tM4LmgcynQC3zNIW74p9m+P
	 /UYijAijRHUJ0olQpKw/M5/EXGoJ/TKbLXRuRrIzyTdvy9agilHuU1czGazUKRf1zt
	 yEFdmU/qjbMj0thDQY6S1EtJoLWIWKkyUhO8BXkYoTma0hSmpZxqpA/q0iJMoLRy3S
	 bFMxbwKH8Tfpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22AF40C64;
	Fri, 16 Oct 2026 15:06:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96CE47AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AE0E81777
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-viPCSeGaLL for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8D726816FA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163174;
 b=lVf6sljYai+sYWUr16yPzzF8CrVUnkV7d/N4E2aPCiA4sp4M/KYebWU5KgHseaEmXrlQ
 /7qceIXCY1Fy/w1qFlVLRIqsvfTEgboap4jAgzEXIYUC+4qelQMgNSl0qsXLSCVTvZMVU
 0zdiGoc+p4fH2Q3ouFhiJimoOv4kfqm4Dhtm4on4QBWW2FZ6HBGhlb/6lmXXqFo99jhEt
 mxgehSTSV1KKBgekOmORXwntoULIeD0zw0buOjlprF/56KWsNHrtR3zSLfkjHYUYn1Fin
 cOI7MrXAKW+/ZLEoktRcdMSJM6SxsWLS0I4TVaWRrslVlOe91l8Na7iZjCC7vM3v2hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163174;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XRSv0xi59nus9Pksd4jt/TQN2qiMOSaQG1YBNSNWorU=;
 b=XdnML0lyLOATi6a+R3M+Mfvt3LBG1jsoyZ8eG4IhUROPDw8HUnPXSBylGbdiRcYYsN49
 2yRhNWHCYh6HbmdO9itXqAW0OXXfrBQcbzmZc45CItMk/rJoFEaHT1U5EkvDNEJ9KTU9G
 Httt2PjsM6rYSVNBpf6pnbAiV5HXYwsrnHeX5OwUHFNJscZYoJ1CuUnYSAt78zTYSwmKS
 hbS9Lm2uBvS0zzmhTcJhLet5udx/hRiqbKO3boI2pkcpLElS8GxWuQ27xNSuRdnO8IqoV
 THBMlXVl+rY7ey+YKusFNWTFicNKM72cKMxBnYhKMgTvIYuzyxNCLtitl000DBmrAoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aheyHviW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D726816FA
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:12 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so437455e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163170; x=1792767970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XRSv0xi59nus9Pksd4jt/TQN2qiMOSaQG1YBNSNWorU=;
 b=cB8LDp68vZe2Ut2HiFQc5MuKp4aSXOyd8Eu2Y7bZnrPgUjuJ34WrLIxfI0tdIDB/MI
 trp6bxMVfcIU+jRia5q4i/5ZVEAD1WhxbLM2pelEF98sLBKvg4EIskOwbN+6hzVQAWYL
 RdMwi2wvOCf/vrcaE9OzOGMUvUDPPIupPWYsePKJN663clQouJ98CLoJk142nNbCqF2m
 rWhLEyQL/LRXjXIsRjPDq1QZFsdstNME1Kp43vxiajBjJzS0NAUPjdARrLVPgD2nkiXq
 06XanbS4OaFfn1izMK7BjWzHDBIheHGT9mdZ8ZkxncjpJc1Ld09poto5qiUX3iG9S84K
 fLfQ==
X-Gm-Message-State: AFq9FYIYmRZbM3Itb34IdOhu5qi/KCJeATa27uapJ8vZau4iWdelRkwN
 VyPoVqfqNXQiv5kgoUqC06u3/QBeb4U0SkRYEZ+i9MCXaqHAfq2tQKUGQtlenNBf76UOicOHqn9
 U2z4uNp4=
X-Gm-Gg: AYBFou3rASslEh3gPakY8tWeyXq6qZRQutxGfv9cZPeVd3MUuiVQ653ttj0AVtxQOlz
 a+V7kfS9BRUunJdJZ6ANWMtaoTWsz9HYLyNYJmzBRHZeN0hFxyCqfc8KZnwPM33ert+amb1YYMg
 JtVqbrIDvgm5OgjK6fckb+jbHB/CJEN2KvLExzyIeFZRpRXrgt3JQ7RaCo/THe/mXk24/U/my7G
 eMmPI1bb5tW+d2gqB1NR2FG/N/UGCymbbcp+fNf0rcW4remUKLkT5LLiKEaE6sULPwxh9Ld/sTs
 cXcx7PtrSm36IrZ3vn1BDjsbZnwsMoSMvV7lzEqn8b25SwCVfp0yaGWFvT29P59Op1hej7Ogc0V
 xPxPncWoxAzuOqCBx/F3/T84cxHi8RIkr1Nyg55yFNwTddOipM+V7uE8p+B63cgzvzAxuME5c1B
 2inDtGVVq71hvL/mjzXsBrc3yhDFNbAcQToPGQhKCVLBFy8tY1e4Gf5kRGAvgx34GVQpzcm0Qd4
 VJvHz1Ucx/KYzFA3nd2sNcl5fXMZBMa8UMFpkBh3g==
X-Received: by 2002:a05:600c:4e94:b0:4a1:811c:8083 with SMTP id
 5b1f17b1804b1-4a1d7626b11mr1353535e9.33.1792163170454; 
 Fri, 16 Oct 2026 08:06:10 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd9b8ebdsm178989125e9.10.2026.10.16.08.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:09 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:07 +0200
Message-ID: <20261016150609.76193-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010143708.421070-3-peter@korsgaard.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/pkg-generic.mk: drop PKGDIR
 variable for {, actual-}source step
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This was added in commit 2d4fd5d358 ("pkg-infra: also set PKGDIR for the
> download step") for the DOWNLOAD macro, which was reworked in commit
> 155f752d8a ("core/download: do not hard-code the path to the package hash
> file") to instead use <FOO>_HASH_FILE, so drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/pkg-generic.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index c69bc96237..4e2ce2e7a0 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1087,9 +1087,7 @@ $$($(2)_TARGET_RSYNC):			PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
>  $$($(2)_TARGET_EXTRACT):		PKG=$(2)
>  $$($(2)_TARGET_SOURCE):			PKG=$(2)
> -$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
>  $$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
> -$$($(2)_TARGET_ACTUAL_SOURCE):		PKGDIR=$(pkgdir)
>  $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
>  $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
