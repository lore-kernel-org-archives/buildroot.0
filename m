Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DADC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D127560F5C
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 21:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D127560F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 914DE40293;
	Thu, 26 Aug 2021 21:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYg36PWe0epV; Thu, 26 Aug 2021 21:55:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFF084071D;
	Thu, 26 Aug 2021 21:55:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 335ED1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2353C6149D
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 21:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPCckHCEEBHc for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 21:55:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62735606CE
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 21:55:11 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u14so9319116ejf.13
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 14:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JB3gJV1+8ZYbBX5w1qjb+NzCGzl1AqrtfujejJKaOIM=;
 b=OSrNaxfy9ol2sLHLfu9c2hxwqYer+D6wgaeVMWidgTB4eiBsdEGlC5y4lRqcfrs7hZ
 en+Avx2rVSyzqH7hwU/qcQlzSAbGy381kZUefQWUwiTudHI3dpgvT0EK805gPlo4ETmk
 Q99XjnQnyws4fi34sHA8JljUysvJKz+iXxSqZTTCPQIsAtwHjHXS38wFiq3z/U7j7CnF
 rjX3iv5tk8l3LNDpFFGiYLpW21GBV9JxW/6nxZnWxzR8BVeS8z980z0qzfG1i8Whf3AD
 XkjUBLsPrufcEkddxTMEvrnl4SmtJGIB8GzEX7d789wuZx07Ll/Dw1cVORXsOil55HYW
 Enhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JB3gJV1+8ZYbBX5w1qjb+NzCGzl1AqrtfujejJKaOIM=;
 b=eGgTl41lYztfx6TaqzKTN38Nbsl0LK5Mxu2nUY4EQDLikpH2GbwnMA2ixciNwxsnSs
 nXJIblt8gcO7r0D9qThN9kAV9nbUvx5Pq3XTZgdQW6NagVNVAWEgh7ggFyXdy1MHkiDa
 +J80oFqey9+HMNFXB/9l3qj0859pvMJA9aph0B4l5sXtB3DsYtsIgR4sOBXTQerzC51G
 pNmzyOdae1lPOvVyUoYAELVx4SCUiz03viRUZmOOhzsjGVxSvPOZP+WyEo8aGsydo0bx
 OeSYD978oHV8g9lLiaqBdHCcRj5GjKpQ8dg9JrBAehAZO+UQu0uzzSrMyqETkhIiCvh0
 ZPuA==
X-Gm-Message-State: AOAM531VCfMFsp0fcqq+SacV4XpmsdUVhA453n2Ab+sLWcmdlAXao/Zw
 ixYSSecNP/TTF3K+Ln+H4eKOSPDkBg7gNg==
X-Google-Smtp-Source: ABdhPJyScm+YAcHPguWFDF3yDLAX9prjwN5/jFTbAmP4C6I9f92Kt+V1fKIw7cWwApHHetX+zxHRAw==
X-Received: by 2002:a17:906:2db1:: with SMTP id
 g17mr6704502eji.286.1630014909491; 
 Thu, 26 Aug 2021 14:55:09 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h19sm1967661ejt.46.2021.08.26.14.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 14:55:09 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20210822190251.280313-1-petr.vorel@gmail.com>
 <20210822190251.280313-2-petr.vorel@gmail.com>
 <1bf16d0e-12bf-db14-5f1a-9c24534be795@gmail.com> <YSKj9XQJbZ4jMQZB@pevik>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4b58e6bf-eb43-facc-2c44-e50ae52ad111@mind.be>
Date: Thu, 26 Aug 2021 23:55:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSKj9XQJbZ4jMQZB@pevik>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 2/2] package/localedef: bump to version
 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyMi8wOC8yMDIxIDIxOjIyLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpIFJvbWFpbiwKPiAK
Pj4gSGVsbG8gUGV0ciwKPiAKPj4gTGUgMjIvMDgvMjAyMSDDoCAyMTowMiwgUGV0ciBWb3JlbCBh
IMOpY3JpdMKgOgo+Pj4gcmVzeW5jIHRoZSB2ZXJzaW9uIHdpdGggZ2xpYmMgcGFja2FnZS4KPiAK
Pj4+IERyb3BwZWQgMiBwYXRjaGVzIChmaXhlcyBiYWNrcG9ydGVkIGZyb20gcHJldmlvdXMgcmVs
ZWFzZXMpLAo+Pj4gcmViYXNlZCAyIHdoaWNoIGFyZSBrZXB0IChvbmx5IGxpbmUgbnVtYmVycyBj
aGFuZ2VkKS4KPiAKPj4+IFN1Z2dlc3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFp
bC5jb20+Cj4gCj4+IFRoYW5rcyBmb3IgdGhpcyBuZXcgdmVyc2lvbi4KPiAKPj4gQnV0IGl0IHdp
bGwgY29uZmxpY3Qgd2l0aCBteSBwYXRjaCB0aGF0IHJlc3luYyB0aGUgZ2xpYmMgdmVyc2lvbiBm
b3IgMi4zMwoKIFJlc29sdmluZyB0aG9zZSBjb25mbGljdHMgaXNuJ3QgdG9vIGRpZmZpY3VsdCwg
c28gZG9uJ3Qgd29ycnkgYWJvdXQgaXQuCgogV2VsbCwgYWN0dWFsbHksIHRoZSAicmVmcmVzaCIg
b2YgdGhlIHBhdGNoZXMgKmRvZXMqIG1ha2UgaXQgYSBiaXQgZGlmZmljdWx0LgpJdCdzIG5pY2Vy
IGZvciB1cyBpZiB5b3UgbGVhdmUgcGF0Y2hlcyB1bnRvdWNoZWQgYXMgbG9uZyBhcyB0aGV5IHN0
aWxsIGFwcGx5CmNvcnJlY3RseS4KCj4gCj4+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIxMDgyMTEzMTI1Ni4xMTM4MDAyLTEtcm9tYWluLm5h
b3VyQGdtYWlsLmNvbS8KPiBPSywgSSdsbCByZWJhc2UgaXQgb25jZSB5b3VyIGNvbW1pdCBnZXRz
IG1lcmdlZC4KPiBCdXQgaWYgYnVtcCBjb25zaWRlcmVkIHNhZmUsIG1heWJlIG15IGNvbW1pdHMg
Y291bGQgYmUgdGFrZW4gYXMgaXQgaXMuCgogVGhhdCdzIHdoYXQgSSBkaWQgOi0pCgo+IAo+PiBT
aW5jZSBnbGliYyBhbmQgbG9jYWxlZGVmIGFyZSByZWFsbHkgdGhlIHNhbWUgcHJvamVjdCwgSSB3
b3VsZCBzdWdnZXN0IHRvIGJ1bXAKPj4gdGhlIHZlcnNpb24gd2l0aCBvbmUgY29tbWl0Lgo+IAo+
PiBJIGFncmVlLCBJdCdzIG5vdCBjb252ZW5pZW50IHRvIHRha2UgY2FyZSBvZiBsb2NhbGVkZWYg
cGFja2FnZSBhdCB0aGUgc2FtZSB0aW1lCj4+IG9mIGdsaWJjLgo+IEkgd2FzIHRoaW5raW5nIGFi
b3V0IGl0IGFzIHdlbGwsIGJ1dCB3aGVuIHBhY2thZ2VzIGFyZSBpbmRlcGVuZGVudCBpdCdzIElN
SE8KPiBzbGlnaHRseSBiZXR0ZXIgdG8gc3BsaXQgaXQuCgogSSBkb24ndCBjYXJlIG11Y2ggZWl0
aGVyIHdheSAtIHRoZXJlIGFyZSBhcmd1bWVudHMgZm9yIGJvdGggb3B0aW9ucy4gbG9jYWxlZGVm
CmFuZCBnbGliYyBhcmVuJ3QgdGllZCB0aGF0IHN0cmljdGx5LCBpdCdzIGp1c3QgdGhhdCBnbGli
YyBjaGFuZ2VzIG1heSByZXN1bHQgaW4KZGlmZmVyZW50IG91dHB1dCBvZiBsb2NhbGVkZWYsIHdo
aWNoIHlvdSB3b24ndCBub3RpY2UgdW50aWwgeW91IGFjdHVhbGx5IHVzZQp0aG9zZSBsb2NhbGVz
IGF0IHJ1bnRpbWUgKGFuZCB0aGVuIG9ubHkgaWYgeW91IHVzZWQgdGhlIGNoYW5nZWQgYXNwZWN0
IG9mIGl0KS4KU28gaXQncyBtb3JlIGEganVzdC10by1iZS1zYWZlIHRoaW5nLgoKIFJlZ2FyZHMs
CiBBcm5vdXQKCj4gCj4gS2luZCByZWdhcmRzLAo+IFBldHIKPiAKPj4gQmVzdCByZWdhcmRzLAo+
PiBSb21haW4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVzeWJveC5uZXQKPiBodHRw
Oi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
