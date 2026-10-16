Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17BECCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EF540A8C;
	Fri, 16 Oct 2026 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDDXHASxuMss; Fri, 16 Oct 2026 15:02:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9C96340A8E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162966;
	b=DRpS4bds1o+yNPxGX8qVxWFBNfm4UPfDrGPANCFeWT6TsSlGB77aT+LRrqxQCjGH+JTY
	 tiRmxrMCdvHku7doGrRWuEPQ4TB1GgwOzzRPre/eDDG7MVgBuFocgPU1e/ahDt5iiNUcw
	 7MI9BVokn0QPNOmyWg/Rwo9O31dibVPVH39ELrz5uWGc4Peq0KRZoTcczyvJxlwHTIT0d
	 mnfHaYYqY8BbAQ72KQDbukUWWX70Giqs3Q0kKWw6/zmSMMgHQCMZmoihZZ/a2MVzP5N3S
	 RSEpNwEYBBT1c4KzxMZdzzseVqDCk1ihr3up5OSCCcK45nCXGFqUmr2NIiFlwFImIaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=J7SowCTwQVIE1EO/RuAX9UHJmjgDZe5gYD/ST24c9pM=;
	b=kqvn8TCBLqmZQT95XpN9t/teV69qE3wJKh1Ef6PNKNN+VQigVQJQDauiwfO8/0xeSDHq
	 kFK9biiupiFSNEMf1dGTCRy3Xf4ovBa8SWRi9NNxQRSIxmEUbcWMYaJrRDLusqqj/Oucj
	 qwP1qWy9KPCVrA6xHoq1frd6uP/yyka9+BZlDd4DjlG8ye8faZNMhGdhNTwfYtoS8iAzU
	 IxaQJ99LZelv8DHUhg5T4QRAOdhYz/Tk7Y6Ng/aIYfHdPsI7NViZLpXx4wHccjP1z2jHM
	 dkJEKsL+7Jv9xu2ahuHoS6Z2SzByMio6czFERdk3sANeg1UupHVCYwk09pCYIYxq0nw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162966;
	bh=J7SowCTwQVIE1EO/RuAX9UHJmjgDZe5gYD/ST24c9pM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=So5k051eMZkNHLzcq9ipgFTgL9imnE7NimbuYQmETIOKmO1LRB+R94xVvXGDMJrww
	 a+3j+MFhrH3msg+O90C7/RiwIXlIQmn9U3I47eY6W5wFCHoudkuAolXir0n3oxDlXP
	 n5e/DaWDlFQjaYhQFtlRDcBRYxrgFemu1BfhX5jJ0FQxWZ0HOFfPferYi9YodTtaU6
	 pSSr+LeCPFhSYLLLg9e0svB9SMZo84EbLldSG1ghZYpxMTUXjD0p+CQU16VouFUvyA
	 aXMeVXGzewvog8013OU6MoZSgJenZ2aP+/b8PZh+nTIFsptg1bSP5Wp0Y/018GkdDV
	 2lC2dTEoMvogg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C96340A8E;
	Fri, 16 Oct 2026 15:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19FF0255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17E7B8156C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnFzj9Q1L2uE for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E487781566
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162965;
 b=dzGQdU1Og2yPcpM6B8U9GNO1Qh/U6t4glNEEA0gyE1IFCGXgoz/EpZD4z3fFaHdZKmpW
 4/67HMSYRsdTcYIuZGGUHjFkzM/TSpsuJnIhll2IyuSAkwD+yV8wCrCPGLVOB6P6PFxJY
 TW2OZYuPPnuhqLuPzL0r9aNGG8InTQntLL0QP3d826sgd/qNB+aw/7meJKU6psfHqQYzo
 irsDyHJzPfp0bQgQVdhEXfk8m+VvabMduGlbgBms9m5+lAjLjna7RtpN529hOfBI8UmyZ
 OySii30cBf9amvxnVu6R5a9bsGPPOb4mQdVdURLp5q2J+mjlXtldoqZwf2w4CZdvSeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162965;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=S+NNDNweW33xTu36udtuz4wwPL0ve7UwgogPc3Accsk=;
 b=DA+I7ZXpL3iqJ2k0wKsro9NpM5EMkARwDXsF+KmBWKhw39IcZ0kKlqy3dW3Q8/bPwOqx
 jF3+Q0nq+eSgw2gz473KbbmJPZK6sIZlwug0ZOZsAARmtn5COwO8TlgFJ+9EAxdg1uLrs
 A73VspcsjXkt4ou7P4a4lyVagAHxxM3f3wCFx8PZziK25sf0TCuBu+X0hW7v9UNGCrAD9
 FoVFhXQ8EgVw7FAxI8js2oGMBAxWehmPmEVhCSCpEe+FlZbGG72GWVG+Dy8aGmwDCWONv
 dv6cgQRojuZRlp988GtQ8/kSYLtLKuYgqtI8bZLxmIcvSPOcpLaZR9mITC+//82I/aA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AV35oySB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E487781566
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1d665a5efso515435e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162963; x=1792767763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=S+NNDNweW33xTu36udtuz4wwPL0ve7UwgogPc3Accsk=;
 b=r9XjxyL6MizsJoiv6n6MAfiAn2AHBr11ul9Ff7kFrcV7Leb2O9lZADQwlD+ME1clnA
 FHNqzH39RdWCdUk6dxGGdNBMmmEg9gunCddKBt8Csm6CVoPpqMMYnh8Obs0ig/iTl72v
 /IlI9w48427MNvygPDg/4bNzSxgoO8874MfRdZ8VW/wPMNklw19M4QA7P+wYOAY56kSr
 nDYsdEU26Jjp+oRrvNk6yDo6aUvgIyb0CVt150MDInFrW2v9v5BcwGmzFzI/ahd60upm
 JRTG3cKlZBGx/joOs04TWtZPX+2IYlwuIKmUlux+9hYmqU1gRXvx/yGtM0pLX/H8/5qg
 /SJg==
X-Gm-Message-State: AFq9FYIcF94kjoIKBqEtGHIWEKyDrpTz0ciDDUblKO8oYPvxHzDiPF8m
 msJKI49lbPoPClarUjT2z/hXFf/0R1ATBgCWN1IEc6ioFs39yDZD5tqqk4YSnp3ifScHjy2pZVK
 Tpsv04PI=
X-Gm-Gg: AYBFou2InILVa39nwFhAJXNt49O23iuXG9LiuPcYj67nLOO0CnLjudNakODkAGvF5Tc
 DaGYuNNTcaPzaEHGzPOzpEED0ts0PthOlhVclNR9sVp/VPr4Ljgo0m3YxkrCkS+beIuD6tAbJjg
 0/WT/OH9jn194YqIPKU2PTHUCKYM5QyQu8/a7hATrwWqx+6km7xWcTy0PLxtR6CzOVkdjexCrfh
 cxmh4Tk4EUtDR2xbjTg4g3EshoVdBQaTi+gK03xy9Ep7ScLN7KVeCCHnp0xrslH2/8ozdsu8Nho
 wIqh7e3lRl62ARxzeF780qGIv3DhfgFPGZA7t6Vaqt1wWCRzvPYiT7vX1xOAwmWa9OCywpH9tlk
 um0uWDpNEkYwlgy8IZZi2fBmuubN6Z+TzG6G3Hmrf6I/97e9E2+rru7TvIS49f7+46upKeyvGzF
 fBRSTxKZqiWOaUzdOgtX4AkdvOGtTbmEFl3LgSr/7rQ7ctzw6gwd9Zy11Dnflh4qYwrnRKhCeG5
 6aPQYi829yoYQbtdOg08TtbnTZX1SWWYGkqQjCM2Q==
X-Received: by 2002:a05:600c:c117:b0:4a0:1c0e:b057 with SMTP id
 5b1f17b1804b1-4a1d75af362mr1623875e9.4.1792162962603; 
 Fri, 16 Oct 2026 08:02:42 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ccc15aa1sm59214105e9.14.2026.10.16.08.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:41 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:39 +0200
Message-ID: <20261016150241.60674-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-4-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/9] utils/generate-cyclonedx: mark host
 packages as excluded
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
> Mark Buildroot's host packages as 'excluded' with the scope
> property [1]. The excluded scope is defined like the following:
> 
> > Components that are excluded provide the ability to document component
> > usage for test and other non-runtime purposes. Excluded components are
> > not reachable within a call graph at runtime.
> 
> This fits the usage of 'host' packages : a package without a runtime
> purpose.
> 
> See the mailing list discussion around this property [2][3][4][5]
> 
> [1] https://cyclonedx.org/docs/1.6/json/#metadata_tools_oneOf_i0_components_items_scope
> [2] https://lore.kernel.org/r/<de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
> [3] https://lore.kernel.org/r/<20260409204208.302842-1-thomas.perale@mind.be>
> [4] https://lore.kernel.org/r/<bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
> [5] https://lore.kernel.org/r/<176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 902b4276ec..9e3bc9d4b8 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -371,6 +371,9 @@ def cyclonedx_component(name, comp):
>      return {
>          "bom-ref": name,
>          "type": "library",
> +        **({
> +            "scope": "excluded"
> +        } if comp["type"] == "host" else {}),
>          **({
>              "name": comp["name"],
>          } if "name" in comp else {}),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
