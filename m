Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FB9C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:16:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3415160EE7
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3415160EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E580860ADF;
	Thu,  5 Aug 2021 10:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V0oQ3Dqm5kLi; Thu,  5 Aug 2021 10:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167E460ABF;
	Thu,  5 Aug 2021 10:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 073441BF298
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03A8C82B81
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMdxCMYND8dh for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:16:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 169EE81AD1
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 10:16:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id u3so8700104ejz.1
 for <buildroot@busybox.net>; Thu, 05 Aug 2021 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=laThtNqFBt+YZQeqkBwXXtvtQ1AoVq8ugZ89H7l4RZI=;
 b=VHbs5RVoxn31ArJY4vQWmjdoEpg5RTIyn9R82Qrx5Ykk2KjaPj8Dx8VQ/XNvDajWTA
 jEehfmIsuOaqRJwQAiwdUQGVPdQdxolDXH46zyBx7BXnCjjLhbVVirEXkVGL9v+SEJKf
 feakXiVkmtpAUhIiViKhnHBUQsEpPfYoGCyVHPaTuic8EQd2fzWdFrimgaTJ4gyQBNyP
 /TvGyXN5669TthoNfdBCGw6XXzKEFQtu4At3Ahw/XKL49GY9dO/76bmLtXkG/3rQ7oca
 JwA/aXVAWP0JvPBZ1A/JLT90JZP5CTPoxD3aXL0EppqjKhohHp+8ZhVPed7khRo77mzY
 PCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=laThtNqFBt+YZQeqkBwXXtvtQ1AoVq8ugZ89H7l4RZI=;
 b=IR0phP0/u5nv+WIFcW+Kb0jIYRVSVk/1SZD79K0E1Gxu8rMs3764zaqv7//E0g7YMM
 8K7t0bwsJGmHwxSfp4yfJgiW2yEaL5HSTapahtBpGMq6UtpKMY4CudZ58xwgq7dv1w4p
 LyDbB9hTSfJJAX9Mw7L4qHJzb4UdFfNwfAr+ujGDANUqq8el6mrZb/DRsUBM0kAMpZvv
 4if+5NN7PUSQzk6UV0IRmZNlWSnRdeyDniYoUYV4buUaTDq2bMLBifP5vOiPQmF4v8cE
 gSy3jMwsYbrQCCfTMzswPyMYmJtIld0EKTDKnpCxMB5JE8MwgmZSLIaGSbGD5TjuwCjx
 CAxA==
X-Gm-Message-State: AOAM5300+qku6RtViR0HeCPWYpVQrGY1cv0UhYsDfo20nip6K9L/qjTu
 QrhQj7T/M4NRRApEUqqDtjAARG2WXnxgn/lwQfg=
X-Google-Smtp-Source: ABdhPJxQ0SA0UNYQ/q0qOi9NOfViheWHaZiJTYVaywTzV9ZwRG7Q8czDlo5weiw+AdZboL6RCeX17g==
X-Received: by 2002:a17:906:f1c4:: with SMTP id
 gx4mr4109819ejb.410.1628158558909; 
 Thu, 05 Aug 2021 03:15:58 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id lw22sm1551597ejb.74.2021.08.05.03.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 03:15:58 -0700 (PDT)
To: Jacques Samoun <jacques.samoun33@gmail.com>, buildroot@busybox.net
References: <CACaKL1xhm-6xZFX3Qk27pbZbKiJJ6cN8TMgvhXJnEny5EVri_A@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e59ce01b-a6cc-3904-98bd-70418088591d@mind.be>
Date: Thu, 5 Aug 2021 12:15:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACaKL1xhm-6xZFX3Qk27pbZbKiJJ6cN8TMgvhXJnEny5EVri_A@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] Common header files / code between packages
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

CgpPbiAwNS8wOC8yMDIxIDA5OjE1LCBKYWNxdWVzIFNhbW91biB3cm90ZToKPiBIZWxsbywKPiAK
PiBteSBkZXZlbG9wbWVudCBjb25zaXN0cyBvZiBhIGtlcm5lbCBkcml2ZXIgYW5kIGFuIGNvbXBh
bmlvbiB1c2VyIHNwYWNlIGxheWVyLgo+IFRoZXkgYXJlIGJ1aWxkIGVhY2ggaW4gMiBzZXBhcmF0
ZSBwYWNrYWdlcy4gVXNpbmcgZXh0ZXJuYWzCoHRyZWUgYnVpbGQuCj4gCj4gVGhlIHByb2JsZW0g
aXMsIGkgd291bGQgbGlrZSB0byBzaGFyZSBzb21lIGluY2x1ZGUgZmlsZXMgYmV0d2VlbiBib3Ro
Cj4gcGFja2FnZcKgKGtlcm5lbCBkcml2ZXIgYW5kIHVzZXIgc3BhY2UgbGF5ZXIpLgo+IFNvIGZh
ciwgaSBzb2x2ZWQgdGhhdCBieSBhZGRpbmcgYSBjb21tb24gZm9sZGVyIGNvbnRhaW5pbmcgdGhl
IGluY2x1ZGUgZmlsZXMsCj4gYW5kIG1ha2luZyBpdCBwYXJ0IG9mIGVhY2ggcGFja2FnZSwgc28g
aXQgYnVpbGRzIE9LLgoKIEkgdGhpbmsgYSBtb3JlIGNvbW1vbiB3YXkgaXMgZm9yIHRoZSBrZXJu
ZWwgbW9kdWxlIHBhY2thZ2UgdG8gYWxzbyBpbnN0YWxsIHRoZQpzaGFyZWQgaW5jbHVkZSBmaWxl
cyAodG8gJChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUvbGludXgpLiBjcnlwdG9kZXYtbGludXgg
aXMKYW4gZXhhbXBsZSBvZiB0aGF0LgoKIEl0J3MgZXZlbiBwb3NzaWJsZSB0byBtYWtlIHRoZSBr
ZXJuZWwgbW9kdWxlIHBhY2thZ2UgYnVpbGQgdGhlIGtlcm5lbCBtb2R1bGUKb25seSBpZiBhIGtl
cm5lbCBpcyBidWlsdCwgYW5kIG1ha2UgaXQgdG8gaW5zdGFsbCB0aGUgaGVhZGVycyByZWdhcmRs
ZXNzIG9mCndoZXRoZXIgYSBrZXJuZWwgaXMgYnVpbHQuIFRoYXQgd2F5LCB5b3UgY2FuIGhhdmUg
YSBidWlsZHJvb3QgY29uZmlndXJhdGlvbiB0aGF0Cm9ubHkgYnVpbGRzIHRoZSB1c2Vyc3BhY2Ug
d2l0aG91dCBrZXJuZWwuIGZ3dHMgaXMgYW4gZXhhbXBsZSBvZiB0aGF0IChpdCBkb2Vzbid0Cmlu
c3RhbGwgaGVhZGVycyB0aG91Z2gpLgoKCgo+IAo+IE5vdywgYSB0aGlyZCBwYWNrYWdlLCB3aG9z
ZSBjb2RlIGlzIGNvbXBsZXRlbHkgb3V0c2lkZSB0aGUgZmlyc3QgMiBpcyB3aWxsaW5nCj4gYWxz
byB0byB1c2UgdGhpcyBpbmNsdWRlIGZpbGUuIFRoZSBvbmx5IHdheSBpIGZvdW5kIHNvIGZhciwg
aXMgdG8gcHV0IGV4cGxpY2l0Cj4gcmVsYXRpdmUgcGF0aCByZWZlcnJpbmcgZnJvbSBvbmUgcGFj
a2FnZSB0byB0aGUgb25lIG90aGVyLCBidXQgdGhpcyBpcyB1Z2x5Lgo+IE1vcmVvdmVyLCB0aGUg
cGF0aCBkZXBlbmRzIG9uIHRoZSB2ZXJzaW9uIG9mIHRoZSBwYWNrYWdlcywgc28gY2FuIGJyZWFr
IGVhc2lseS4KPiBUaGVyZSBtdXN0IGJlIGEgYmV0dGVyIHdheSAoU1RBR0lOR8KgRElSID8pwqAg
YnV0IGkgY291bGRuJ3QgZmluZC4KCiBJbnN0YWxsIHRoZSBoZWFkZXJzIHRvICQoU1RBR0lOR19E
SVIpL3Vzci9pbmNsdWRlL2xpbnV4IChvciAvdXNyL2luY2x1ZGUgaWYKdGhhdCBpcyBtb3JlIGFw
cHJvcHJpYXRlKS4KCgogUmVnYXJkcywKIEFybm91dAoKPiAKPiBDYW4gYW55Ym9keSBnaXZlIG1l
IGFuIGhpbnQgPwo+IFRoYW5rcywKPiBKYWNxdWVzCj4gCj4gCj4gCj4gCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1c3lib3gubmV0Cj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
