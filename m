Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50860C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 14:47:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A03F61037
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 14:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A03F61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B6FD4053E;
	Thu, 26 Aug 2021 14:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81cjmeNYtMVD; Thu, 26 Aug 2021 14:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 844AC406DA;
	Thu, 26 Aug 2021 14:47:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7191BF36F
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 14:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A5E68274D
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 14:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLy5HWan7F1O for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 14:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26ADE82786
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 14:47:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id e21so6773056ejz.12
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Blh0Yn2fmqspsP3Oyf8nTlIxJKMi/82Q9QZiAjt55vg=;
 b=ZJR4oVmTkf5tHj8fkW9LEEC7S9fTQwvnkSIZkKpf6l6Ik5Xm/16sgASJMzTGQGPxx/
 yc6b66aa5oT/WomzxkLtQZelcTtHeaRcnPLAZfGSFnZueXdNhF2Kw4jdZ0tN8HJcwiOz
 tY2FUMyzv4AEfiY6VBFrQuoQ99XD+1Tz+WNv8/RjaJ7pvXbPmlCim3LP97FOsje9CNzw
 tKH0TYVk2Yf7pVe6y8CwFkarrTYOsM57m26mSSR8gDSoysa6g3dRsjYGqqB1wEdE38vb
 JTs1LjHKgfxN5Suu6kY5qELb9PMDxWyjU+vyc3fKZqSb+FGGVSwc1dox1Jhqah8x+eJW
 dt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Blh0Yn2fmqspsP3Oyf8nTlIxJKMi/82Q9QZiAjt55vg=;
 b=iKQC5sojdCCl3G0s1Bs3LqsJQ4XUjMO8QY96D8pyaf0c14/AOUQT2q4qiu20SxObAZ
 RGqzpUxdyGC5/V3WoJioSN8fyUAH9+oFX3YvvTewUJCbg3mMTq1qkUHR7m3UYVP20k3F
 vQQf3udqvA7vHNqQPOL2Xyrff1m4cAkO4qt0qg9GHt2thMgOM0NF1go/DqySrvfk1gBd
 kvx5O5FYLkOX0WvjBhXk2MxwTX4rC17CKUYkSLumEEUgbvyBk/af5QVOUFkQuFGilcCC
 QwzhH2YGxCYsWie6oIWrquk+6CcqOm1xT+xBePmVp5LU0L781rsrmmu4JCKhFz+fP8WE
 KNNQ==
X-Gm-Message-State: AOAM531QQjxZuuTb2HmSSDO9y+ZiXLq0nQq+473VIZfYhT/X+gjJ5+G8
 BPKdZzdot1p8uhRIE8AZmqR/Gw==
X-Google-Smtp-Source: ABdhPJwFlpFOE6GG7t/0lsfwhO5NrHrGQCXa2X5qYeckRuyi8Gtpp7IOa+GguCx/S4Qr4xDhFUCcRA==
X-Received: by 2002:a17:906:c342:: with SMTP id
 ci2mr4885301ejb.122.1629989233190; 
 Thu, 26 Aug 2021 07:47:13 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d22sm1577201ejj.47.2021.08.26.07.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 07:47:12 -0700 (PDT)
To: Jonah Petri <jonah@petri.us>, Baruch Siach <baruch@tkos.co.il>
References: <20210824203841.1554763-1-jonah@petri.us>
 <e8372342-ccd7-9be9-5e78-da1a31ad9162@mind.be> <87fsuwa16g.fsf@tarshish>
 <900b3187-f679-5331-c344-634bdf78abbd@mind.be>
 <55b4305a-036b-43bb-0c3f-9a3840954e47@petri.us>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <98e6e834-fa05-2868-2844-1d6e57d1d578@mind.be>
Date: Thu, 26 Aug 2021 16:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <55b4305a-036b-43bb-0c3f-9a3840954e47@petri.us>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain: handle toolchains with
 multiple ld*.so.* files
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
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyNi8wOC8yMDIxIDE1OjI0LCBKb25haCBQZXRyaSB3cm90ZToKPiBPbiA4LzI2LzIxIDg6
MjQgQU0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pj4+PiArwqDCoMKgwqDCoMKgIGlm
ICEgZmluZCAtd2hvbGVuYW1lICQoU1RBR0lOR19ESVIpJy9saWIvbGQqLnNvLionID4gL2Rldi9u
dWxsOyB0aGVuIFwKPj4gwqAgV2l0aCBubyBwYXRoLCBmaW5kIGRlZmF1bHRzIHRvIHRoZSBjdXJy
ZW50IGRpcmVjdG9yeS4gSG93ZXZlciwgU1RBR0lOR19ESVIgaXMKPj4gdGhlIGZ1bGwgYWJzb2x1
dGUgZGlyZWN0b3J5LCBzbyB3aG9sZW5hbWUgaXMgbmV2ZXIgZ29pbmcgdG8gbWF0Y2ggaXQuIEl0
IHNob3VsZAo+PiBwcm9iYWJseSBiZQo+Pgo+PiBmaW5kICQoU1RBR0lOR0RJUikgLXdob2xlbmFt
ZSAkKFNUQUdJTkdESVIpL2xpYi9sZCouc28uKgo+Pgo+PiDCoCBJbiBhZGRpdGlvbiwgaG93ZXZl
ciwgZmluZCdzIGV4aXQgY29kZSBkb2Vzbid0IHNheSBhbnl0aGluZyBhYm91dCB3aGV0aGVyIGl0
Cj4+IHdhcyBmb3VuZCBvciBub3QuIFNvIHdlIGluc3RlYWQgaGF2ZSB0byB1c2UgdGhlIHByaW50
ZWQgb3V0cHV0IGFuZCBjaGVjayBpZiBpdCdzCj4+IG5vbi1lbXB0eS4KPj4KPj4gwqAgRmluYWxs
eSwgYXMgYW4gb3B0aW1pc2F0aW9uLCB3ZSBjb3VsZCB1c2UgLXF1aXQgdG8gbWFrZSBzdXJlIGl0
IGV4aXRzIGFmdGVyIHRoZQo+PiBmaXJzdCBtYXRjaCBpbnN0ZWFkIG9mIG5lZWRsZXNzbHkgY29u
dGludWluZy4KPj4KPj4KPj4gwqAgQXMgQmFydWNoIHNhaWQsIGhvd2V2ZXIsIHRoaXMgaXMgdG9v
IHJpc2t5IGZvciBtYXN0ZXIsIHNvIGlmIGEgdjMgY29tZXMgaXQgd2lsbAo+PiBiZSBhcHBsaWVk
IHRvIG5leHQuCj4gCj4gCj4gSGkgQXJub3V0ICYgQmFydWNoLAo+IAo+IFRoYW5rcyBmb3IgdGhl
IGZlZWRiYWNrLCBhbmQgSSBhcG9sb2dpemUgZm9yIHRoZSBicmVha2FnZS7CoCBJJ20gZW1iYXJy
YXNzZWQgYnkKPiBteSBpbmNvcnJlY3QgYXNzdW1wdGlvbiBhYm91dCB0aGUgcmV0dXJuIHZhbHVl
IG9mIGZpbmQgKHdvdywgSSd2ZSBiZWVuIHVzaW5nCj4gdGhhdCBpbmNvcnJlY3RseSBmb3IgYSBs
b3Qgb2YgeWVhcnMhKSBhbmQgSSB1bmRlcnN0YW5kIGFuZCBhcHByZWNpYXRlIHRoZSByZXN0Cj4g
b2YgdGhlIGNvbW1lbnRzIGFib3ZlLgo+IAo+IEknbGwgd2FpdCBmb3IgdGhlIG5leHQgcmVsZWFz
ZSB0byBjb21wbGV0ZSBhbmQgdGhlbiBwdXQgaW4gYSB2My4KCiBZb3UgZG9uJ3QgbmVlZCB0byB3
YWl0LiBXZSBhcHBseSBzdHVmZiB0byB0aGUgbmV4dCBicmFuY2ggd2hpbGUgbWFzdGVyIGlzIGlu
CnN0YWJpbGl6YXRpb24uCgogUmVnYXJkcywKIEFybm91dApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
