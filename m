Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE3BCA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9703F60A6C;
	Sat, 10 Oct 2026 09:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_NzhFa98MGW; Sat, 10 Oct 2026 09:24:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 79FAF608F6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624248;
	b=GOxD6T3UUrr7NwhIf1jAYNHB3THaM8Oh+N58vLYwY0CMGAT3dyUP45gCuMZtkcGLBp7W
	 zVjcNrEWPfhl9L1nLlzh88VxZ6TQ24dJF/uw3flNiSFWkLQXtqhZe+Jfy1Hz4h12vxcUE
	 2lKGgERAe4rmkW+k3kSlAkI8sbjN9SoZF+aFZyNm0Q6rb526o/fkpVSOSzojuzcxIZh+L
	 qgsPHAvfmCT68olH1Rj87Jg21RIPsSbDjm4O3vjfMs/+DxB3x7PSvaSnDezQ4gRF1Y3UD
	 HTahV7cltvVMtwycGPM95uMLXpMBtqCKjJ1YX9UDMuilQIkXuTFGRx7MckvsUG9YTpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hhpMwQcxt1W3kzQWdPZjPUvm6mDQpVo60DafTZrg39Y=;
	b=OevAhJ//BbyA71kQynbsGtDWDioLz+Miq8h+bEXd8tqa0dm6z2eglg0FF1npuHiFwOsx
	 zRm+sYOQ5f6Hk0bSOJyl1V2DnCY4TnLrpHke3GowJMAlgtmSbnOPEePpQsueQkHN1PawL
	 eLKNbRUt6A3UtFS2oJjvt7nY6Ks81yPKfSadBTyS3C88tGMejgsegxq+ZexsIoKfIK7ri
	 OFMN36Wm912Sp5PV+tDeWCzaCsY/OfyX9MfgV0F6cG5hqDj3TUPO94KmFiKxfELV7S65e
	 mLb7G0UGdCDfPMLh3PWX59Rs6UQayDr6cuQXxMlTVs/wWX7r+0qDn2nlCDoUftOy2Pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624248;
	bh=hhpMwQcxt1W3kzQWdPZjPUvm6mDQpVo60DafTZrg39Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LvhPIq1toB1fy6WXnFnJjmwuj+DEnJZ9Cs7vrCtBpXDWBHbJbNnNHEj25JK4d2DD4
	 SU41tmdahBBDwM3VSFJXcWLplUCZKoDTiuF6MmEccVsrFzxfockN/KQ3zZAphpUDFz
	 0omuIkaSLA5ffJAa99stBc2cp24Oza2PfNQrKkmBPAnGrPwPiaN9rFVwMd/CMdi27N
	 H896GnmqnXpwGq5AyjfZAQJAYu3rSVYAwFxO6wgBI/PlLGXHgwdiw1f98UcDOLscIK
	 Em/wdKZnYP5fucI0P3xf9THHwZ6SVAjlMpccOZ1iMho65vVTXiOaFnzSxgJgHUOM8n
	 rLqmrOUCv6gmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79FAF608F6;
	Sat, 10 Oct 2026 09:24:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6D3356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 835FF409C7
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVz0rSOJE9Da for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3738840956
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624243;
 b=Ayw04qa0tQ3tZWDs4CPXXo0anH5hqHAC0UDJHltIcD8lKlcsXUHRCeIJ9yuce+IjjZFd
 fg5+2RE8rU6kcqkkb5zcHXFgO1B/9u4CfYfPHJGRccJu1v9Rlo344TaZh0orB2uAvx74H
 Eo4Avsv6kYW2rYbwxvmapwis3wLkP/7l+FE9LnfRVfhplPo0BGVdkgF00RvsmMLy2QtYD
 l/Wm7aA5iZSIG/QWRN7Koh5/ZhX10o+QR4qRFPKNIa1Fn6OM7dOWpfN5ZpnCZim7PZNyK
 nO0EQ7teV0FRj/t82TASrxlH416P2ZhzcV2MXRVB9bEDFbNZPR4aoTAz+LiKMeSZY8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624243;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=2fpv/kut8s/sxaGWwbc0yS37qFFpV0uGryDsE7ZOfpc=;
 b=QmAYU8dSODtn0rhZgQH0VvW3WB+eKPFw8seZp5Vf3HGdsAu5dp+je5I2a/O4M1dy5NL1
 qruRPz1EK+6z5C+1iUHV+hJriNJgn0khfW73u8v33Qyhxz+z/iIh9Mxz+VfmIN9DuKX4b
 nuKlk8kIkPkDOA/cctSC01DqEmpvRMW12hnn3HOtOi/g5DZs8580KAmILf1ZF3N1qeupB
 x16uSrOgNUVJ/chYtCvG5zF6aaPPEJxJGpmQjLsoNeOCEIOivKrxKSBbrTF5AFWPpEOns
 31QOFg+sLfYi0Vi38QpGICwkADUHqLM6Tlk+Ccb7CtMeY4GaOUPOO3Oa/uIZtyOhxlQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=elLGA+Lr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3738840956
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:02 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso5213805e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624241; x=1792229041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2fpv/kut8s/sxaGWwbc0yS37qFFpV0uGryDsE7ZOfpc=;
 b=CodPRpBay6Ty8e+xkLwHQSrE2YCq6y+yJ6KS2Hh6lIjcI7/38qmysJUJ3Sk4EMf2BH
 9SAlOUhB5dbimvFiyjhUqXxRDwO7L8rrLuyB0fEzjSAtvypFCaI28vuB4pNSAEKZMLiN
 NAm0natCwLz77d7WtKrBTGk+EHiBkQLJUYsALdfOjFLT0uEYoy2I0E9GRyr1Why/7mBT
 kkFGZGvWPTF+xhalFlJE1ggyaQPzmSd1PmdexZzIYgHJBH/6O4+sr61JvWzclUNFxycF
 fUHaqcuSmYKmhwy9tiqd7TBLybljmMtC2NFp9xyE07byrqmGJLczrMUkihEaPVFGMmcM
 iVDA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzltnbe5X69n/Q5lAgl3tLcw6wcyByO5dhLU2PeRUkU152+0ucIio9nmNZebbDP+bHRpEVlW2lx8Tk=@buildroot.org
X-Gm-Message-State: AFq9FYJxMUP+pZwKeIDFqa6ZxefVqElzFAhQilK/Z7GkFRHJSi977Y8j
 aJedGcgNpJ2mjLTP3H1vJ7iMZNhR8eZ9rCRXumtnsUQgkH0NeuQjdo/oAyc7QwXc6Xzb30HNVRu
 rqdGXKNw=
X-Gm-Gg: AYBFou1rBQ2nauGSnqVATwCTZk14zvIFPoFhu1dEQQyy0lkQbcd+h7dgRyYZ2dsOaqd
 WXfJTJdZjcDnxBaMMqk95ikaurjpByxs/Surtu2VwsM1eS2endgAqRu7Kn2tPk6tKvKZ0pEW37I
 +rEYE7i7V57VGF9WiKioGzMyxj/x9bco+U2uqE2czqoo+Yi4Nf2cUECNZ48MHWNV+dOD8UhbT5X
 Qo3jhIJAhrNsWAIyXF9nAr2NvytoajOLzMje6XoccRDFPx403eFlIWpZnVdnvGRKjtDh1TbVTSj
 tZE4E9WK4zcO+BkdMFUhXBqeIUplx3zweZagT406/yFqlSmkmVQNF4YHo+GcbJuWHlfNtb2HBZi
 qYmDUG8LpKgaywoBYogcx3pMGOeaT2M0P3cOIlZi8Mfyix+IecoU3k9BJFPIetmS6gPfEvdlMcw
 1aVw3NOzT03ZBCPYxrKQLThJilkVcAJcSKKdLpRxHzfs7rwPHKAkc4aWymEBgOnSIp4AJaqGHGA
 ltPfj3UjXYW3ySjCoyUw4FguwOmMuvp2RqkKMGFpnNVi+QuvnUo5Rat
X-Received: by 2002:a05:600c:6099:b0:4a0:1feb:de6a with SMTP id
 5b1f17b1804b1-4a18e4e7a85mr82005025e9.30.1791624240904; 
 Sat, 10 Oct 2026 02:24:00 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abd574sm8380663f8f.34.2026.10.10.02.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:00 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:59 +0200
Message-ID: <20261010092359.139857-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002071943.2182234-1-peter@korsgaard.com>
References: <20261002071943.2182234-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/manual/common-usage.adoc: correct
 generate-cyclonedx invocation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Commit e09bf9e9511 ("docs/manual: add information on CycloneDX")
> unfortunately introduced a typo.  The make target is 'make show-info', not
> just 'make show'.
> 
> Fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  docs/manual/common-usage.adoc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
> index 631c2f7788..67c3e06567 100644
> --- a/docs/manual/common-usage.adoc
> +++ b/docs/manual/common-usage.adoc
> @@ -214,7 +214,7 @@ Similarly to +pkg-stats+, CycloneDX SBOM's can be enriched with vulnerability
>  analysis from the NVD database.
>  
>  ----
> -make show | utils/generate-cyclonedx > sbom.cdx.json
> +make show-info | utils/generate-cyclonedx > sbom.cdx.json
>  cat sbom.cdx.json | support/scripts/cve-check --nvd-path dl/buildroot-nvd/
>  ----
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
