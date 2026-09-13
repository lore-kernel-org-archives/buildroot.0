Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5613AC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C70A80E47;
	Sun, 13 Sep 2026 09:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rA8NyGBf4-20; Sun, 13 Sep 2026 09:27:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 073EF80E56
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789291632;
	b=CLqE6Tar++7P4PduWTuVYjps2UAhdDtOCeTBRh69P5MDLFYOsrv3H04JMgn0fuRxCLS1
	 d+vS8Ldk9Q5GuiWbv4f9IO/Iqo+ZKbtvmcChphoAnmA37aMY15GBdycNhXv4ehEGCbIWM
	 WoOy5F6yCzMu9D10IjiBK9if1eYI1RpUbu5VV6TLJqh9r/QAH/9BRV9gG1xFCvF0jUCLI
	 u73DFaruqLUvQebZo0F4kSwC9ML03dz4nXLKYLOUVo5ZUTYw0otP3HRJHOPuAJOP2kLYm
	 Bbsr2zvrsxAL5mKrgHQ09seH9HDMBE8wyRgUDKQ2ejIgrzqpdWCEsvnf2a1uz+UOoAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789291632;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=csrjb1YIk0w2UwylQtijFXXg8DV8FM4a+hYo8mGMxXY=;
	b=EtXr3426Lwd/43Ko4eSK32BeahPmta7/xnFlVgOw4BLd+rt9kvsOtVP18rABlhGOAVQc
	 PEAZSJp8Olj/TnrR2tXwNaWm155K9PMm5t7qZax3R1VSVWxISeKdW+uXyRfvEQv5OMftA
	 ZYhqToRTZ0L1o19aPrBq7aexjQGzpxNyjicNzKKDed7EUllQFsKBd9gpR3On6sFlHawe0
	 og4TbDtP50FTG8uFHz9+Rm0+nzl9oLTgfobce0kY27X8GAs4V8nPGctQfRIvfULIXZ8Mu
	 53QWeuobC1ZFrijM1lH92vLShGsZGyv9/8hUcL54V0qN2ppSse7hA5y9SkQ/bq3CrFw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789291632;
	bh=csrjb1YIk0w2UwylQtijFXXg8DV8FM4a+hYo8mGMxXY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=UczJLzHJ2Th8zdNlMaUfv3aB9EJFK7qfEmRJjuEMmVCyFtK59x1cvFFrhpYoEZqE9
	 VaAB45tRy7HjbNksUYkW71TDMxCOi5k0wFzLRMaYjSr63CTxCSBCU34cwwDBRhXHkr
	 rvAuvKWzvEKYONWPxjgfS5JSVL+RvWYzWEUsxmW5KuwC3L3n4a1GQgSF7lXfZSDmqn
	 pC6zN4oXOq2QgnNWOGkIJj66hiGqK0l9U60UEensdFgtRbacMSf1u69LcKJylg6Ak9
	 A3UMp4PRgAzHJKFbMfaQeLbux5J6CJyGjTw/bvYeMIRAr5QIW4GXL1SxfTvLSChJqJ
	 wmIXdT3vVhUkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 073EF80E56;
	Sun, 13 Sep 2026 09:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54846224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AA1880E56
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhetpJiGHcTA for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:27:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9424A80E47
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789291629;
 b=jkswC/aLIyEQ7gZygBs7Q2SR5DqAj1GwVZXumMkI7iqFIwsaULnT3OLjPpulppGxSros
 YSVLQwWIX5Sh5gT+jDi7pDkpILbZlij9BFW75o7CWvLPVYik6RZdZ5mI2P9AMEEBg+b6R
 R669uTcQer5XgMCfiM8It8d1hDJSHjvmG72aTmIsRIJsZbov2bcxj5177dOXcl+NCeKIQ
 RvtyeGXj7hG9eclcOspCjamuCTNEzgUEsqdYgtnVk7OhY4ud1K/LDTq2qpY1z4gSZ238t
 ObX8rBDvPf2tbQezwBhdfRbBoL84vbwYbC06yub2UrPQccpPfV9Ta0J6Jl59YxM+qHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789291629;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=I5HNtZitCOnAuCaDtq7UcZ+fhEGb0v2+MTyBynxoYrw=;
 b=Agg8E8+B9oydeJBWKSOls7qgR833FfSHqmHjORF6U2VX6S0VMSgxRfwOy0dOuqe09/38
 8LJtGRT3lnx26YtzXIsnDUYxynFOJ8euaaANbDXmJUFf2C0wRyY5mwarUHiC8Di50UEzi
 t3CW687G+A3hORvoSUTmUAf/l9UWe4ZyJJM/Z5EC0Y/WnNFdZwxIL7ZbrBXfpKFH2XGtm
 XpWvW7mXjWzcwFeY16grTjwNIrDu34w/IWd8+AYNk8ZI45u76Cf8ZK8jkEMwYuZmQ57ns
 BlAVjAHN2898KFOqT1fjNMGA9lUOwt/WlkGzr/NI1Lpg8ydW1iVuG5r6XjBKTE7MT4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CbcjjXJ0; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9424A80E47
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:27:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1wggRZ3Eib-0123uI; Sun, 13
 Sep 2026 11:27:04 +0200
Message-ID: <da663796-d321-4a71-8050-8a00e1b5fc3a@gmx.de>
Date: Sun, 13 Sep 2026 11:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20260908075427.3729011-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260908075427.3729011-1-giulio.benetti@benettiengineering.com>
X-Provags-ID: V03:K1:b3K0v4F0Ac9PGZGd74NND+Njchz6cwyBBSdIHe5wNez3K0vT5lK
 3X1mi0VHORLwELgy+3csryotI38grV2/AlWW+EWhrXlQM0Sn+5RRlS2ZyXR7mQ0YB/VOaHG
 IWL4ScoyAJBNE58Bc83r309KxC2t0wCR4yHUyzoVCQKWECjv4+cxRtyy5KHyYI4MHBb0qpf
 TdEdgYrCCSmpXYiysglDw==
UI-OutboundReport: notjunk:1;M01:P0:+dslJ/cdfAA=;M53dUQaGU8d932Oay5YLPOCVXAg
 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
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.8
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

Am 08.09.26 um 09:54 schrieb Giulio Benetti:
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.8/docs/v2.8.8-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thank you!

> ---
>   package/cryptsetup/cryptsetup.hash | 2 +-
>   package/cryptsetup/cryptsetup.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
> index c6ce35a52b..a0ef7aea9b 100644
> --- a/package/cryptsetup/cryptsetup.hash
> +++ b/package/cryptsetup/cryptsetup.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
> -sha256  e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da  cryptsetup-2.8.7.tar.xz
> +sha256  3acfa685f2dd7fcc832e0b77bc7093aa7da554a51ce8dafbb4138eaa854eee35  cryptsetup-2.8.8.tar.xz
>   sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
>   sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 28b9927e4a..643a2b3f59 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   CRYPTSETUP_VERSION_MAJOR = 2.8
> -CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
> +CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
>   CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>   CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>   CRYPTSETUP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
