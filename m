Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911F5C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 16:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14D8A40CD1;
	Wed, 11 Jan 2023 16:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14D8A40CD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFZZp2N_la1G; Wed, 11 Jan 2023 16:12:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DAAF405E0;
	Wed, 11 Jan 2023 16:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DAAF405E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7ED1BF44C
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 16:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6167F41951
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 16:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6167F41951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0JZzysOfPzH for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 16:12:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4537D4194F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4537D4194F
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 16:12:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso2682144wmb.1
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 08:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PFSbPNOdDXsVLAkiQYfFhS+RU14vwEOxZr0f5WPS1/8=;
 b=5O4VKcw+l/ApKk/1GYFFYqytenguAmYyuRAMetMqK8y/jCXddsyjx6uZQGOlRwxg0k
 gEButJqetGNfwNHWC3UaS0qMUNb4WmkFYadt2OV+vi1HTAHUCuzh3Kb2g6XKDeVcCwvk
 /HGXqvRB1MOTLn/omdjDTDoHrf6zBzjK1fQF1hWLf/kOplX16z+0Kl8A27SegaT8RDoU
 YybIEF6Jlb5ekMGTVYNUmzD9gNRQkwAK2VBAb4rDjicWtkplshKxdCVCTbf6SHM6D25s
 loGqgiA1BaJfViXQTWQ+XOsIkYSm/aTyoS3164hhKMIbntvbu14ubDXAxQe78u2/oxB7
 /jnw==
X-Gm-Message-State: AFqh2kpijNxMCSSUvK3OOp+O+KQXOm3voXw7YrS2jOZHusPsbzEcrci8
 5GZS17OJ1JQ2e2+fPNJitOecNQ==
X-Google-Smtp-Source: AMrXdXsxbSkgv1mMtf26dEtMJv1FepfuHS6CDiGGhn11vAiTHptI7g8jqNdhYlTVn3CkqhtenO7a4Q==
X-Received: by 2002:a05:600c:1c21:b0:3cf:9844:7b11 with SMTP id
 j33-20020a05600c1c2100b003cf98447b11mr63504410wms.23.1673453559502; 
 Wed, 11 Jan 2023 08:12:39 -0800 (PST)
Received: from [10.5.3.94]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b003d9ed49ee2bsm14419480wms.1.2023.01.11.08.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 08:12:39 -0800 (PST)
Message-ID: <27a236bc-20ca-8b90-bff5-488cf6aded22@smile.fr>
Date: Wed, 11 Jan 2023 17:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <c01c67cd-b4ce-a054-2b6b-47fbfcbf513a@smile.fr>
 <2ac975d4-3451-ec20-9987-a56be5ea36e4@green-communications.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <2ac975d4-3451-ec20-9987-a56be5ea36e4@green-communications.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PFSbPNOdDXsVLAkiQYfFhS+RU14vwEOxZr0f5WPS1/8=;
 b=28/ztE1tklq/HnvZC3N4i/rmOuXgPpav4CcKeSUzypMq4bHEKAKvEGqm9kK7p14y46
 fqLzyXcSEhu+YuiF1msKpKYjY3exmhcwQ23BA9qCERdiCyaNb17IgiwxSWlYx91/hKJ+
 WgnlSfnIpUE+msZtiqLeaXPPV8bgTj5IJDVxwyVi3bmgDOqcVu35AXSwLTzcyxZYRbNV
 1c2wOzjipI5TXSaq07wJYZSaNUd7era71oc/Vb/mbHyuI17582dqrmarX6DlsMfkat2p
 PL3SQ6M2WDLXyfWYsMyBhdFNW9f/19foCcrTZ+WOz9QmGhbK056naGfEj8fk7b7gbQxx
 bfWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=28/ztE1t
Subject: Re: [Buildroot] [PATCH 1/2] support/misc/toolchainfile.cmake.in:
 set PKG_CONFIG/CMAKE prefix paths
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmljb2xhcywKCkxlIDExLzAxLzIwMjMgw6AgMTc6MDEsIE5pY29sYXMgQ2F2YWxsYXJpIGEg
w6ljcml0wqA6Cj4gT24gMTEvMDEvMjAyMyAxNjoxOSwgUm9tYWluIE5hb3VyIHdyb3RlOgo+PiBI
ZWxsbyBKYW1lcywKPj4KPj4gTGUgMjgvMDcvMjAyMiDDoCAwMzo0NCwgSmFtZXMgSGlsbGlhcmQg
YSDDqWNyaXTCoDoKPj4+IFRoZXNlIGFwcGVhciB0byBub3QgYmUgZ2V0dGluZyBzZXQgY29ycmVj
dGx5IGFuZCBhcmUgbmVlZGVkIHdoZW4gdXNpbmcKPj4+IG1lc29uJ3MgcmVsb2NhdGFibGUgcGtn
Y29uZmlnIGZvcm1hdC4KPj4KPj4gSG93IHRoaXMgY21ha2UgZmlsZSAodG9vbGNoYWluZmlsZS5j
bWFrZS5pbikgaXMgdXNlZCBieSBhIG1lc29uIHBhY2thZ2UgPwo+IAo+IEkgdW5kZXJzdGFuZCBp
dCBhcyAiYSBjbWFrZSBwYWNrYWdlIG5lZWRzIHRoaXMgdG8gdXNlIGEgcGtnY29uZmlnIGZpbGUg
Z2VuZXJhdGVkCj4gYnkgYSBtZXNvbiBwYWNrYWdlIHdoZW4gbWVzb24gaXMgY29uZmlndXJlZCB0
byBnZW5lcmF0ZSByZWxvY2F0YWJsZSBwa2djb25maWcKPiBmaWxlcyIuCgpPayB0aGFua3MsIEkg
bWlzdW5kZXJzdG9vZCB3aGF0IEphbWVzIHdyb3RlLi4uIG15IGJhZC4KCkJlc3QgcmVnYXJkcywK
Um9tYWluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
