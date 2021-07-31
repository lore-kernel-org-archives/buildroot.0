Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81873C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF74601FE
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CF74601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE3A240277;
	Sat, 31 Jul 2021 08:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiqtYgHPRh_1; Sat, 31 Jul 2021 08:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E42740286;
	Sat, 31 Jul 2021 08:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40ADE1BF836
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F7EF828A9
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZYkhxHx2CLu for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:06:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3257A82882
 for <buildroot@uclibc.org>; Sat, 31 Jul 2021 08:06:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id r26so22898778lfp.5
 for <buildroot@uclibc.org>; Sat, 31 Jul 2021 01:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9DUjyPCuL9HzpQlcAMyK4dLA2LpOZ7utOXGlHQjMZqY=;
 b=CKUReA3zf6SRe+4SagKTm1bAk4eab6VykgkfvzU5Vrz11hhIchJM746hnspQXmPDPV
 L3dnRqTJi5byhpOmWE9lNQewDtBJV4oZ5xnh/E7lzvpETKTqCW42SY4MzKjmpZaPyY3g
 neXSehIhngXwY/tMu2LRHvVZ2/PKnNzSLwVpWBL/Qegb1t4oAKU5tOufGFQIZ8EaXjmy
 ku8k1eSDU3c4h4jc82vqtKF3LdLp6WC2I5ZLty/y/kLkHGM0b2UihVNAnr5Y0X9RCZ+x
 mPjdUtptOdc+dCIy1y3JqIfQIAziw/ZgR4htjbWTpgA4247zwVCmgm85SX+8Ac3cT710
 /xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9DUjyPCuL9HzpQlcAMyK4dLA2LpOZ7utOXGlHQjMZqY=;
 b=S1mfRVbJcYN2udzgLNscmzqfVOeOEyY2JxK1jxi8GIy+guIlh66BxnWgmDlBRlOIka
 8Ct9eOe5V8ErRUx6kIkcpwXUFyvKY/KiCN3tU+sUbp1LxkJIhj0nlxbaURNEnslHbhco
 72x1ExQgEHY3MvBHYl4X/hmt99o0sKldfM7Cxjb22Fe/3J1FpgEQ1sTp118POdoX/Kim
 6xx0/IdxYwxtth0y6lgBkyS6A/Dg4hYtr3x2tViqLMIMX/N8ZTqGfD5gCreM2GD5NvbA
 xvPW8YAC1/80AoNGvXO6ODLMKLODZmgVLnd17yxwfq9yoU/k77ZepMp/Q8ivXR6wodc0
 a9ww==
X-Gm-Message-State: AOAM533M/QtUUtqAHMW/6mqOfcD6XoAEbrc/I6aKro0PfVo+k5TVLtbu
 8WwKjjsNVqzB8+DZjr3ra1FuF34sUxXx+xaDHrY=
X-Google-Smtp-Source: ABdhPJw0GCyAjRxr9gtu68Qfy4P3R/YgILYzLQiNrBqoktQ/YEpTMBwGfzJygxGgEXKnZJ8uYeHr3PM0uxwGibhFX6E=
X-Received: by 2002:a19:6d14:: with SMTP id i20mr4071209lfc.213.1627718762016; 
 Sat, 31 Jul 2021 01:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210730091005.7c91f3b7@windsurf>
In-Reply-To: <20210730091005.7c91f3b7@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 31 Jul 2021 10:05:50 +0200
Message-ID: <CAPi7W80D-vTy8Hg7R-aLekkW=F5CopjwkSqjwjzrhh__-4ZunA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] refpolicy build failures
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "buildroot@uclibc.org" <buildroot@uclibc.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzLAoKTGUgdmVuLiAzMCBqdWlsLiAyMDIxIMOgIDA5OjEwLCBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxs
byBGYWJyaWNlLAo+Cj4gU2luY2UgeW91J3ZlIGFkZGVkIGxvdHMgb2YgU0VMaW51eCBtb2R1bGVz
IHRvIHBhY2thZ2UsIHdlJ3JlIHNlZWluZwo+IGJ1aWxkIGZhaWx1cmVzIG9uIHRoZSByZWZwb2xp
Y3kgcGFja2FnZToKPgo+ICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9yZWFzb249
cmVmcG9saWN5LTIuMjAyMTAyMDMKPgo+IFRoZXJlIGFyZSBhIGxlYXN0IGlzc3VlcyB3aXRoIHRo
ZSBtaW5pZGxuYSwgZmV0Y2htYWlsIGFuZCBwZXJoYXBzCj4gYXBhY2hlL2h0dHBkLgpJIGZpeGVk
IG1pbmlkbG5hLCBmZXRjaG1haWwgYW5kIGV4aW0uClRoZSBvdGhlciBidWlsZCBmYWlsdXJlcyBh
cmUgYWxsIHJlbGF0ZWQgdG8gcGFja2FnZXMgdGhhdCBjYW4Kb3B0aW9uYWxseSBzaGFyZSBjb250
ZW50IHRocm91Z2ggYXBhY2hlL2h0dHBkIChlLmcuIGNvbGxlY3RkLCBjdnMsCmdpdCwgbnV0LCBl
dGMuKS4KVGhleSdyZSByYWlzZWQgd2hlbiBhcGFjaGUgaXMgbm90IGVuYWJsZWQgYmVjYXVzZSB0
aGVpciBmaWxlIGNvbnRleHRzCnVuY29uZGl0aW9uYWxseSB1c2UgYXBhY2hlL2h0dHBkIHBhcmFt
ZXRlcnMuCkkgb3BlbmVkIGFuIGlzc3VlIHRvIGtub3cgaG93IHRvIHByb3Blcmx5IGZpeCB0aG9z
ZSBpc3N1ZXM6Cmh0dHBzOi8vZ2l0aHViLmNvbS9TRUxpbnV4UHJvamVjdC9yZWZwb2xpY3kvaXNz
dWVzLzQwMC4KPgo+IENvdWxkIHlvdSBoYXZlIGEgbG9vaz8KPgo+IFRoYW5rcyBhIGxvdCwKPgo+
IFRob21hcyBQZXRhenpvbmkKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBD
RU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0
cHM6Ly9ib290bGluLmNvbQpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
