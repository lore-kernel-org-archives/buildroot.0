Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D1FC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 09:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F22BF6023E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 09:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F22BF6023E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B28FD400C3;
	Thu, 19 Aug 2021 09:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOV4VK95EJFx; Thu, 19 Aug 2021 09:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12CE14012D;
	Thu, 19 Aug 2021 09:27:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0671BF328
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 09:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CE7240791
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 09:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dwteWyFQAIm for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 09:27:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 767DD40781
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 09:27:30 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id n12so7796082edx.8
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CnuRy4H7jI8MUeVA+aQca5vi++n+NVZc9NSypP4hkB4=;
 b=hZzO/LpNu6c/av7k6ZZwQA9Q9bHxPO0xtxeFsb3TYqc1CGM+CqogfVn7QIQBt5bkII
 fZYSi9IwaEOlLiMSfbqfoqaepd/QFwcK2O6pnEEPniLKXZ4rg8CnjWGSzYk06rfHi6Qm
 huUDHrFgceUoskuhRG1E8nLwGV9Q2zYHJCLACX9TxQm6VaZKx1RsHyhl5nhRXqItqo/P
 PvX231byqohrd6K5EqmYCAD01JKFjf1t9oxYAV7XZd9awK7IiSYy7kU38AtpAACkqTxY
 uVRhsCW+MGCoeDiWMdKMsQnu1bBtueuJmKrrMasqiMpnRz4J+J24W2OiSdj9scLqSr4G
 8avQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CnuRy4H7jI8MUeVA+aQca5vi++n+NVZc9NSypP4hkB4=;
 b=qT+Y47emTc4xMCaWHzgRCK3au6vqw3ovFJm/N6BVB6yMiZFoKQJudS7TStxUos4psN
 5Wkt+cgUv+uw8SiFN7rs4zLpSoVRkcYK9oolOpYQRbOY5vHViWwNO3CIslTOZn+OGBx4
 ZR5cR0RiarssjlnQskHWzbcYBhCJ4uoiY149cLtHjb/iDENQpM/sPLB4xMQ30skvBhMg
 nBD05Oq60aL773x01VZiOmwkGIaFAc1pLJ2Qg0XA2uoyTYDfN/K2pEzdNS4K8KJ5NiJ9
 ouo/tSp7OVpDJrbdjJ/Vjox7oKWOSqhHlGqwjTFwaUzewruKDUHkjvYCjfi0VhyaNE5t
 D1WA==
X-Gm-Message-State: AOAM5320J39BAc9hhfLL40U9BItperIS2qusPuPap8wSQEbd/eKusrCp
 P+MM/FtMjCRt7uTvHVY8A8mPdw==
X-Google-Smtp-Source: ABdhPJzrAq5xevLveK7+alCcQVYljYB026ySpP7/7G5ueJ3Y+Y3j49eguUFEPGt+ICXAf7cOqymHKw==
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr1940835edd.351.1629365248540; 
 Thu, 19 Aug 2021 02:27:28 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bm1sm1014625ejb.38.2021.08.19.02.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 02:27:28 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818234453.03d2237a@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4660a41d-6111-05aa-4b82-274391cd7bd9@mind.be>
Date: Thu, 19 Aug 2021 11:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818234453.03d2237a@windsurf>
Content-Language: en-GB
Subject: Re: [Buildroot] Analysis of build results for 2021-08-17
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAxOC8wOC8yMDIxIDIzOjQ0LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgpbc25pcF0KPj4g
ICAgeHRlbnNhICAgIHwgICAgICAgaG9zdC1jYWlyby0xLjE2LjAgICAgICAgIHwgTk9LIHwgaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMDAwOTZiYWQyZDllZWU5MGMwNzc2
MWZjOGM3ZjllYWZlODc4MmRhYyB8ICAgICAKPj4gICBtaXBzNjRlbCAgIHwgICAgICAgaG9zdC1j
YWlyby0xLjE2LjAgICAgICAgIHwgTk9LIHwgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvYzFkNjEzODdlZGYxZjc5NTIyZjdkOWRmODJjOTBjOWNkNjdiYmEyZCB8ICAgICAK
PiAKPiBjYW5ub3QgZGVsZXRlIG5vbi1lbXB0eSBkaXJlY3Rvcnk6IHNoYXJlL2dldHRleHQKPiBj
b3VsZCBub3QgbWFrZSB3YXkgZm9yIG5ldyBzeW1saW5rOiBzaGFyZS9nZXR0ZXh0Cj4gCj4gU2Vl
bXMgbGlrZSBhIHBlci1wYWNrYWdlIGlzc3VlLiBIbSwgSSB0aGluayBGYWJyaWNlIHlvdSBsb29r
ZWQgaW50bwo+IHRoaXMuIEhlcnbDqSwgYW55IGlucHV0PwoKIEZpeGVkIGJ5IDkzMzUxZmEwYjNi
OGI2ZGQxMGZhYTlhMTVhN2ExNzNiOTJjYjQwYTAuIEl0J3Mgbm90IG9idmlvdXMgc2luY2UgdGhl
CmZpeCBpcyBhY3R1YWxseSBpbiBmb250Y29uZmlnLCBub3QgY2Fpcm8uCgpbc25pcF0KPj4gICAg
bWlwc2VsICAgIHwgICAgICAgICBvcGVubXBpLTQuMC4wICAgICAgICAgIHwgTk9LIHwgaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMmY5NjY1NGMyMjM4YzExNTA2MGFhZmMz
Y2YxMGY3MTQ1N2M1ODVmNyB8IE9SUEgKPiAKPiBjaGVja2luZyBhbGlnbm1lbnQgb2YgRm9ydHJh
biB0eXBlKHRlc3RfbXBpX2hhbmRsZSkuLi4gY29uZmlndXJlOiBlcnJvcjogQ2FuIG5vdCBkZXRl
cm1pbmUgYWxpZ25tZW50IG9mIHR5cGUodGVzdF9tcGlfaGFuZGxlKSB3aGVuIGNyb3NzLWNvbXBp
bGluZwo+IAo+IEd3ZW5oYWVsLCBBcm5vdXQsIHlvdSBhcmUgdGhlIGZvbGtzIHdobyBsb29rZWQg
YXQgRm9ydHJhbiBzdHVmZiA6LSkKCiBIZWhlLiBJdCdzIG5vdCByZWFsbHkgZm9ydHJhbiBzdHVm
ZiwgaXQncyBqdXN0IGNyb3NzLWNvbXBpbGF0aW9uLiBQcm9iYWJseQpuZWVkcyBhbiBhY19jdiBz
ZXR0aW5nLCBwb3NzaWJseSBhIHBhdGNoIHRvIGVuYWJsZSBpdC4KCgpbc25pcF0KPj4gICByaXNj
djMyICAgIHwgICAgICAgICBxdDViYXNlLTUuMTUuMiAgICAgICAgIHwgTk9LIHwgaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNTY4ZjdmY2VlYmIwNmRlYjA3NTVlOGQzNzU3
Yzc2MTYwOGZhZWVjNyB8ICAgICAKPiAKPiB0aHJlYWQvcWZ1dGV4X3AuaDoxMTY6MzA6IGVycm9y
OiAnX19OUl9mdXRleCcgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlOyBkaWQgeW91IG1l
YW4gJ19xX2Z1dGV4Jz8KPiAgIDExNiB8ICAgICAgICAgaW50IHJlc3VsdCA9IHN5c2NhbGwoX19O
Ul9mdXRleCwgYWRkciwgb3AgfCBGVVRFWF9QUklWQVRFX0ZMQUcsIHZhbCwgdmFsMiwgYWRkcjIs
IHZhbDMpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9xX2Z1dGV4Cj4gCj4gTmVl
ZCB0byBleHBsb3JlIHdoeSBfX05SX2Z1dGV4IGlzIG5vdCBhdmFpbGFibGUgb24gUklTQy1WIDMy
LWJpdCBhbmQKPiB3aGF0IHdlJ3JlIHN1cHBvc2VkIHRvIHVzZSBpbnN0ZWFkLgoKIF9fTlJfZnV0
ZXg2NCwgYnV0IGl0J3Mgbm90IGFzIHNpbXBsZSBhcyB0aGF0IGJlY2F1c2UgeW91IGFsc28gbmVl
ZCB0byBtYWtlIHN1cmUKNjQtYml0IHRpbWVfdCBpcyB1c2VkIGFzIGFuIGFyZ3VtZW50LgoKCiBS
ZWdhcmRzLAogQXJub3V0Cgpbc25pcF0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5u
ZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
