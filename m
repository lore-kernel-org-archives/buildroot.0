Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6DEC432BE
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:01:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDA5960295
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDA5960295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805C260665;
	Wed, 18 Aug 2021 20:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9VXp5BcgPWk; Wed, 18 Aug 2021 20:01:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB0D260BDF;
	Wed, 18 Aug 2021 20:01:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E60B41BF333
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D585460BDF
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebMiOd66qYPb for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 20:01:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D490F60E93
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 20:01:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso2534227wms.2
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 13:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1pZCnnBOdMYOhiJmjQRNCnHSd9D2aoFEHl5wdHQ3/uc=;
 b=VtgYqKPRRratHioG/JF9vCF377jQ0eW4+qTKlxGjxRgCqn8DIVV32Uck0HRrXt727u
 Ka6TcmSZQn82cS7MdnhgZcEM3FbQ3RUgr11q4QgBsSc9w6pY1ly/khG0vI5KOBgAWK6n
 CO2960EYOMpRCXAF90k5INTX+5EhLU/YZQ3xrIzg5PfmJCGDJj2mMZavap+r6uA1+rzu
 gKxQ+vhz92ucoQbdiVlQiqdrOvPa0yA7fnk9GJVV5Y8UDz/UOfVAKeKXHx3maJuDwHKS
 fJx6lyu1gW4U5h233VLt4yDPdS23e3VEmcCIo46wRhyze8u+yfOF4TECXxL5jjGMnkD6
 o6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1pZCnnBOdMYOhiJmjQRNCnHSd9D2aoFEHl5wdHQ3/uc=;
 b=rhaA9WeMzWloctDWuBit/is/BdHWVT6l9mcPchLCHPfMEW6UlcVY7BZ57t2xOwvmVs
 WWQF/Ng+M3LbRwgkYvxkD1rdUY3HWXllwMVZKVlYCAFyTYrVcJLUPbPwHlcX4byicKks
 X+27BQEWHLBZeJCcXMzx+mya+bbw1LwbJPTY5T+TWqSNByttZWzkw6sY5dgGJVSjp+VV
 1WtsKh6HkaXko9z9JT8+yThJXhOoe6iXI4wGWP31+zE6ArwSy45Qa3KdcGIiY9605d0Q
 Sn9MUuEPA3U6WBBSRi3mQVwRL82h1mMgWLTwXMjCxtNZOl0oTXfekYoIyDRM9s2uDDLM
 k0rg==
X-Gm-Message-State: AOAM532EU03e3CZSM+KgJe+dBBf3/VB3/Uw4cQx0zrknPEzYeRtD3BhV
 qpWUmgBrNrL5Y+LiABAfQLc=
X-Google-Smtp-Source: ABdhPJxd4Bfp4GYoD9/b/8f2JJS6E+ZsGHrf5bVGkzTBc6OxOoL15i6ffmVxamF0eucHEhrIqBj2Jg==
X-Received: by 2002:a1c:2003:: with SMTP id g3mr10148021wmg.114.1629316865492; 
 Wed, 18 Aug 2021 13:01:05 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id i8sm754015wrv.70.2021.08.18.13.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 13:01:05 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
 <b89f7acd-3549-f167-f984-b08a5a597a18@mind.be>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <db8b4379-f0e6-88dd-cebd-f521e80dab1e@gmail.com>
Date: Wed, 18 Aug 2021 22:01:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b89f7acd-3549-f167-f984-b08a5a597a18@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libgeos: fix build failure
 due to missing -mcmodel=large
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Michael Nosthoff <buildroot@heine.tech>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gQXJub3V0LAoKTGUgMTcvMDgvMjAyMSDDoCAyMjozNCwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAyNy8wNy8yMDIxIDAwOjM0LCBHaXVsaW8gQmVuZXR0
aSB3cm90ZToKPj4gV2hlbiBidWlsZGluZyBsaWJnZW9zIGZvciBvcjFrIC1tY21vZGVsPWxhcmdl
IGlzIG5lZWRlZCB0byBsaW5rLCBzbyBsZXQncwo+PiBhZGQgdGhhdCBnY2Mgb3B0aW9uIGluIGNh
c2Ugd2UncmUgYnVpbGRpbmcgZm9yIG9yMWsuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAtLS0KPj4g
IHBhY2thZ2UvbGliZ2Vvcy9saWJnZW9zLm1rIHwgNCArKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdlb3MvbGliZ2Vv
cy5tayBiL3BhY2thZ2UvbGliZ2Vvcy9saWJnZW9zLm1rCj4+IGluZGV4IGEzNTU3MzJhZjguLjQz
MjExZDA0MzQgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbGliZ2Vvcy9saWJnZW9zLm1rCj4+ICsr
KyBiL3BhY2thZ2UvbGliZ2Vvcy9saWJnZW9zLm1rCj4+IEBAIC0yMyw2ICsyMywxMCBAQCBpZmVx
ICgkKEJSMl9hcm0pJChCUjJfYXJtZWIpLHkpCj4+ICBMSUJHRU9TX0NPTkZfT1BUUyArPSAtRERJ
U0FCTEVfR0VPU19JTkxJTkU9T04KPj4gIGVuZGlmCj4+ICAKPj4gK2lmZXEgKCQoQlIyX29yMWsp
LHkpCj4+ICtMSUJHRU9TX0NYWEZMQUdTICs9IC1tY21vZGVsPWxhcmdlCj4gCj4gIEFjY29yZGlu
ZyB0byBnaXQsIC1tY21vZGVsIHdhcyBhZGRlZCB0byBHQ0MgYWZ0ZXIgdGhlIDExLjIuMCByZWxl
YXNlLiBBcmUgeW91Cj4gc3VyZSB0aGF0IHRoaXMgd29ya3M/Cj4gCj4gIE9vb2gsIHdlIGhhdmUg
YSBwYXRjaCB0aGF0IGFkZHMgaXQuIEJ1dCB0aGF0IHBhdGNoIGlzIG1pc3NpbmcgZm9yIDExLjEu
MCBmb3IKPiBzb21lIHJlYXNvbi4gUm9tYWluLCB5b3UgYXBwYXJlbnRseSBkaWRuJ3QgY2Fycnkg
YW55IG9mIG91ciBwYXRjaGVzIHdoZW4geW91Cj4gYWRkZWQgR0NDIDExIGluIDJhYjg4ZGFjMjkz
YWVkNWFkZjI1MDRlOGIxODJmOWQ4YTMwNmI5MzUuIFRoZSBjb21taXQgbWVzc2FnZQo+IGRvZXNu
J3Qgc2F5IGFueXRoaW5nLiBEbyB5b3UgcmVtZW1iZXIgYW55dGhpbmcgYWJvdXQgdGhlIHBhdGNo
ZXM/IFRoZSBwYXRjaCB3YXMKPiBhZGRlZCB0byBtYXN0ZXIgb24gTWF5IDIxIGFuZCB5b3Ugb25s
eSBzdWJtaXR0ZWQgdGhlIEdDQyBidW1wIG9uIEp1bmUgMTIsIGJ1dAo+IHBlcmhhcHMgeW91IGFs
cmVhZHkgaGFkIGl0IGx5aW5nIGFyb3VuZCBmb3IgYSB3aGlsZT8KCkluZGVlZCwgSSBtaXNzZWQg
dGhpcyBwYXRjaC4KCj4gCj4gIEdpdWxpbywgbWF5YmUgeW91IGNhbiBwb3J0IHRoZSBwYXRjaCB0
byAxMS4xLjA/CgpZZXMgcGxlYXNlLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+ICBSZWdh
cmRzLAo+ICBBcm5vdXQKPiAKPj4gK2VuZGlmCj4+ICsKPj4gIExJQkdFT1NfQ09ORl9PUFRTICs9
IC1EQ01BS0VfQ1hYX0ZMQUdTPSIkKExJQkdFT1NfQ1hYRkxBR1MpIgo+PiAgCj4+ICAkKGV2YWwg
JChjbWFrZS1wYWNrYWdlKSkKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0
Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
