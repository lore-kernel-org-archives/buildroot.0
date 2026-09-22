Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D8C982FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 09:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1139D40AFC;
	Tue, 22 Sep 2026 09:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf67T6yFlfCg; Tue, 22 Sep 2026 09:03:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F283F40A70
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790067821;
	b=IFEyBnfcK5XxuiBEeu3L+NUVaI/GfwlNu+bZ3VwkLIAc7cRBl4gLHIV+ppTu+SVOX/iJ
	 FRDm/KTiQ6CX1jeDKo0J7crZP+6dc33Oc6gnIYOmQxuUOWu7Ltx7Ff2ULmZsXVzKbQQMp
	 7/f1dxaLNtVdfBCWjiBxW63Cad9Q4aYqiPFfWCPCuh8TUdYKSe8wUKoR8WdWBgcb5LC7j
	 nREt/NezcNBX2Bd7i9GXuT6haE7gXX7lGWN8UXOFG/FOO+25y35bx+CvFheNjhYsbpJBo
	 1zOV32mWiOuR2z7tIJt//4pOxFN6hrGZRTNoh+CBcvXSO5cF2D9PBbxMaVTLTOD/GGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790067821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=U6leZVmsmOsW29ZmsBNEkTyvNHcBxcyi2cmSyCFlTy8=;
	b=dYSHSPshSDB71xWwHt0ZF6dMZ0AgUZ7UykuHxkq4HDK2nc10FDaP+Kf3M4WAlLLpozrK
	 oilFmucjfgIaRtVb1HEi6b7eRTQai3Ygn9qeMsk+g1dF4kndFcQgyB2UQPk+/YURdD6dN
	 CuvK92LFZJOi3IabnBSidIkQ5wUXwK4DvZXOXpB5eNK3tisqZABnNgMxF7lm0SV+PCc7t
	 UGGAJRJKSiQC8ejOwKgX1nyd+9Wffdvf9+S6jnsvVX7lWt7bJ2M3GDRU5UtNid8WqwPKn
	 stQaD/apQRkJPNqoQdmt4lrINE1yAdXrPih0R7kA2Vglty8XljDshZVVUkr6gyxtYzg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790067821;
	bh=U6leZVmsmOsW29ZmsBNEkTyvNHcBxcyi2cmSyCFlTy8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=TEE+4WsFNaUmfwGZfWp+JQ+ImZPCnEwB98EV02RT85E11chQXF2mkiFbxJ6s9i33T
	 W6hQil5YpPtgNUPiu4yk81FcMh03cnro79M7CUAQ58yYlp+rqgqdwost5S3Jcj98MM
	 eXl51clNFjUDLUlYG0FA9KEAxAw6fWRBeLPwUy8jnc7UT112ZHOJLD+w1Xkj531sB6
	 e5EhQjDo4wzK42JxEHwZFtRVbSciHXX9yZDTC//aj0ZNm2H24HHwlHKm16iOlWlk3S
	 hcMa1OYzyfVxW/dVJf2XgvXn7yA28/U/N24XLOzbO/BUILrgZ9YZ/eY+fukoz9XkKb
	 oIEE1PqcGTsLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F283F40A70;
	Tue, 22 Sep 2026 09:03:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D9FF12C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EA6280DFD
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K19kWNTVHb2Z for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 09:03:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1717280DEC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790067818;
 b=D1yKycctewqEnDTmZa0Ccibyw4Z4dwAxRTlGAOsjWFXdyVfxZxK9TtwudxR4Fu/QF9i0
 5gDmM9Ag5vSmNqLvppSs19CwCtW3zfiXfvOAaw3u7hiChUNEFD6fXxXVNRs9854PgKr09
 e3/oV2K40B49PFwHQDwoGsUSuVKMeliqoYrjMz0tlkEUDyHt+RG5u4GmsF7/Aaw/eONmd
 J3+7D9UTyTgOtmbxoWhY+xRn/h+8uCjrI8inJCAmXpjqEDyvUKgfP3fJ0eg3gzbNqUGe0
 eSedYyH4smXU1wvjDe9y8bjXexAjeE/AARU6G4jaML8wsaw5TUFhVaqoFcnPQaKG3Qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790067818;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=9GvQiHUErfSrZ8jU+3kzSSAJ7tLDkBAs3q0H+XtIua4=;
 b=Z2ZsdTZnW6odaqcTPBINP0Rxyv0BIJkHJN/fl6xa2Q1vfHxJCtCI61nbGZEqJiP6y1YB
 4Vx6qenhI+/zDS6lgk3gCCdZ9WqeFyECqwCSYmTXCDZ9rFCgtglKfuXxnKT7MpD3P67Ur
 5wiTSXeUFUxecg2HnhiJSkdGECv+RYTBVwoI+OiAjA6oWaFgJwic0x1EBF/0ZFY9uFM4H
 8c+xX8RbX9LepEvU/YOUuK4XUt5lVTcXByazV0BP8WqITlaYnXRyJhb27SHz5aPMkrMmn
 AOdCCJsrWikUp3A9lvVCTSEfV9kv8yAzRkNIOweTAQZI26sx4HnsnuKZSLq0E4qrrsQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MC3pV+ID; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1717280DEC
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:03:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fMe-1x6Dew3kUs-00524V; Tue, 22
 Sep 2026 11:03:33 +0200
Message-ID: <25319d35-138e-4cd7-9479-f8f7a8409880@gmx.de>
Date: Tue, 22 Sep 2026 11:03:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Koen Martens <gmc@sonologic.nl>, buildroot@buildroot.org
References: <ce3892224b3907d22a3bcdf96a8685ae39d55380.camel@sonologic.nl>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ce3892224b3907d22a3bcdf96a8685ae39d55380.camel@sonologic.nl>
X-Provags-ID: V03:K1:+giz73nO3uT63PJ74qrIl0+1Jz3uj9oFy7qm4+fz6lHBjD2QPae
 wiPaTt+wNocjvHE7600KH3+D1me6rxGAtVVfe20DZNHq3kYITv1GIJvZIPVzVUx5A2SP15Q
 tWC7n46c7npjIpeGVM0sbKPSeLqhhHLUcyhHg/FMkJ0h14ojxxk/wjp9tfdHCE+4wfXHiJu
 aUPar/7RNUutRTHK78OkQ==
UI-OutboundReport: notjunk:1;M01:P0:QkTLEfMTzAE=;oVgGm5UX62a1j+tBQAdsWAfDlVw
 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
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Koen Martens from
 capnproto and linuxconsoletools
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 22.09.26 um 09:06 schrieb Koen Martens:
> I have left the field of software engineering and will no longer
> contribute.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>

Applied to master, thank you. And best wishes for the future!

> ---
>   DEVELOPERS | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 62e3eb278d..5cce270296 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2131,10 +2131,6 @@ F:	package/rockchip-rkbin/
>   N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>   F:	package/wqy-zenhei/
>   
> -N:	Koen Martens <gmc@sonologic.nl>
> -F:	package/capnproto/
> -F:	package/linuxconsoletools/
> -
>   N:	Kory Maincent <kory.maincent@bootlin.com>
>   F:	board/octavo/osd32mp1-brk/
>   F:	board/octavo/osd32mp1-red/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
