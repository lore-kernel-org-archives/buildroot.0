Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B12C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 963E360FE6
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 963E360FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E682606AE;
	Thu, 23 Sep 2021 21:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5gkrDKyXRMy; Thu, 23 Sep 2021 21:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCCEA606B8;
	Thu, 23 Sep 2021 21:20:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E09E91BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE82A606B8
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMn01h6CAAm3 for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:20:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9CF2606AE
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:20:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x7so13519007edd.6
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IS+Dkozcfce3UJcqnKtSqMEXXhrAqpInMTu0X4P9FXk=;
 b=Ln/lwJA1DYanlrjAZN+1r7sLQRhWEyQ4ep3mSOrcY/K79fmM/8UZdJkVMpYRceEKhZ
 KSwyJlLh45hUvlH0QQSD8yqnNAjfByPDjn/nmUjD7bt49EaIPx3HtoOOpC56UVI6hoae
 AftStAZ9CkQQzzBiqgt8V2W8FdxsD3c9AbsWPpSrY+/dpSPR1k9gdpEZ/seqIJmsFinH
 Y5yYXW1rzqIPtKDQ7hCh7wUmxG9epoAdYboi8EzdICpIYwoTIxkPqUwXhYxBCyZTt8mN
 4vsOI4F6Da2LaPbnzh5PTa5bdGLW1Q/0yMKZk2AEyNtZ1OJSxzCXkqnsGI/FqQmmMjxA
 QLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IS+Dkozcfce3UJcqnKtSqMEXXhrAqpInMTu0X4P9FXk=;
 b=bXrHIn2gRgDh+WBRyEaTUJpPU1P6cMWu+xJbMFzdr9Ole6IgKqZ6B97+1BiVjJrpgc
 BQIZvG96zC5ik8h/bml4NGPbTqQoQnU/iedZExagCSnm70C/qoS5GRqybMMUmMXMKCgf
 LrbKbDY8oSmPrwvsnRDk3Zr88xyVuj3f0uXp3bcJIzyBVPMwnR/ZHVNcjxmjZvsWe63h
 594/TRU5eE71QtDlYRRrtOSasENes5repRvFugd4bvsKMwodozXKMKNFUJbTllHyr8LS
 YvywSFS93rvXR6LgJZfCs+B2x/fLjK378hgtF43cgqjm8GkZJHC/PFwOadpGm8/23Sf+
 Il0w==
X-Gm-Message-State: AOAM5330IafjRFaiMP/2TBczH8Gp0UJduIMAp3om0bBw7W+LRyaSyskd
 dps54S2tFXRPEkOhUQsGqUgc4uNM+qlIrw==
X-Google-Smtp-Source: ABdhPJyObYl5ML7dnzG6Clzq0jNyI7PzoSoHtQk0cGgaXar8bruryaxrXKa3O5OR8gc5pi3ZbNNwbA==
X-Received: by 2002:a50:da8f:: with SMTP id q15mr1170693edj.139.1632432042018; 
 Thu, 23 Sep 2021 14:20:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bc4sm4338138edb.18.2021.09.23.14.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 14:20:41 -0700 (PDT)
Message-ID: <b54e1162-de72-7b2b-4bfe-3e67560f445c@mind.be>
Date: Thu, 23 Sep 2021 23:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210908081630.3404221-1-kory.maincent@bootlin.com>
 <ecec6557-9d20-134b-497c-e6c7e55deee6@mind.be>
 <20210919150904.04051568@windsurf>
 <f8756bf0-c955-f301-299e-f5d8c0aabe04@mind.be>
 <20210920140127.1de86c50@windsurf>
 <ad51da8c-2b94-3969-b26c-2d8b168d198b@mind.be>
 <20210923215517.1c2bd3f8@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210923215517.1c2bd3f8@windsurf>
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CgpPbiAyMy8wOS8yMDIxIDIxOjU1LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IEhlbGxvIEFy
bm91dCwKPiAKPiBPbiBNb24sIDIwIFNlcCAyMDIxIDIwOjUyOjI5ICswMjAwCj4gQXJub3V0IFZh
bmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPiAKW3NuaXBdCj4+ICAgIElmIHRo
YXQgcGFja2FnZSAod2hpY2ggSSBndWVzcyB3aWxsIGV2ZW50dWFsbHkgYmUgdXBzdHJlYW1lZCkg
bGlua3Mgd2l0aAo+PiBhbnl0aGluZyB0aGF0IGlzIHBhcnQgb2YgdGhlIHRvb2xjaGFpbiwgdGhh
dCdzIHN0aWxsIGZpbmUgYXMgbG9uZyBhcyB0aGVyZSdzIG5vCj4+IG90aGVyIHBhY2thZ2UgKGku
ZS4gQVRGKSBsaW5rcyB3aXRoIGl0IChhbmQgZXhwZWN0cyBhIGRpZmZlcmVudCB0YXJnZXQKPj4g
YXJjaGl0ZWN0dXJlKS4KPiAKPiBBcyB5b3UgY2FuIHNlZSBmcm9tIGFib3ZlLCBpdCB3b24ndCBs
aW5rIHdpdGggYW55IG90aGVyIHRoaW5nOiBpdCdzCj4gYmFyZS1tZXRhbCBjb2RlIGZvciBhIENv
cnRleC1NNCBtaWNyby1jb250cm9sbGVyLgoKICBXZWxsLCBiYXJlLW1ldGFsIGNvZGUgb2Z0ZW4g
bGlua3Mgd2l0aCBhIGxpYmMgdGhhdCBpcyBpbmNsdWRlZCBpbiB0aGUgCnRvb2xjaGFpbiAobmV3
bGliIG9yIGFwcGFyZW50bHkgYy1uYW5vIGluIHRoaXMgY2FzZSksIGFuZCB1c3VhbGx5IHdpdGgg
bGliZ2NjIGFzIAp3ZWxsIChmb3IgbWVtY3B5IGFuZCBmcmllbmRzKS4KCgogIFJlZ2FyZHMsCiAg
QXJub3V0Cgo+PiAgICBIb3dldmVyLCBpZiB0aGUgaW50ZW50aW9uIGlzIHRvIHVzZSB0aGUgdG9v
bGNoYWluIGZvciBhIENvcnRleC1NIGFuZCB5b3UgbmVlZAo+PiBhbnkgb2YgaXRzIGxpYnJhcmll
cywgaXQncyBwcm9iYWJseSBhIGxvdCBjbGVhbmVyIHRvIHNpbXBseSBoYXZlIGEgc2VwYXJhdGUK
Pj4gYXJtLWdudS1hLXRvb2xjaGFpbiBhbmQgYXJtLWdudS1ybS10b29sY2hhaW4uIEl0J3MgZGVm
aW5pdGVseSBhIGJpdCB3ZWlyZCB0bwo+PiBoYXZlIGEgcGFja2FnZSAiYXJtLWdudS1hLXRvb2xj
aGFpbiIgdGhhdCBhY3R1YWxseSB1c2VzIHRoZSAtcm0gb25lLi4uCj4gCj4gWWVzLCBJIGFncmVl
IHRoYXQgd2Ugc2hvdWxkIHByb2JhYmx5IGFkZCBhIGFybS1nbnUtcm0tdG9vbGNoYWluIHBhY2th
Z2UKPiBzaWRlLWJ5LXNpZGUgd2l0aCB0aGUgYXJtLWdudS1hLXRvb2xjaGFpbi4gS8O2cnk6IHNv
bWV0aGluZyBmb3IgeW91IHRvCj4gbG9vayBhdCwgcGVyaGFwcz8gOi0pCj4gCj4gQmVzdCByZWdh
cmRzLAo+IAo+IFRob21hcyBQZXRhenpvbmkKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlz
dHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
