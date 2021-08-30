Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F36C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 09:12:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1DB760F56
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 09:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1DB760F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F1F400D4;
	Mon, 30 Aug 2021 09:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jDDoRIh4oCr; Mon, 30 Aug 2021 09:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C780B401FE;
	Mon, 30 Aug 2021 09:12:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1582D1BF47F
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 09:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0476F60629
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 09:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LY0KoRxPmHHy for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 09:12:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8836605EF
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 09:12:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s25so20644112edw.0
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ThvorTQZu6xjZh9mAIbwkBrO6WPM69NIJvec7LdVVo=;
 b=MxKObPQq4uY5LgMV1Nf7EuGclo3AwOraRFU3Y6OtKk/KQSlmCtcln6L4nWlbvdWumh
 xw3G774W06/ka1e17bdd0k7ASYa784JUHDAw5VSfJ/regcdXvmOL3FcNkq9NOGwfBILw
 ZeQbwflENIVPLT4YRgK33ZCArrmBBjh7pKZ5aDN8smqutjig6XUvFVbbcGaj2kvlGiRu
 I5hyrR0yd7cOcbIMSGq09tvdEA6DkZG6FFnWvgLqZiaXBpRcM9p0YbPr/rqobC40mi4W
 K75sP9WoxHYy/N7XKBAsBkJePMawY1A5pfMG9hBgntwxJyYxQW8qW2dkKwy/Z1nfH0oX
 9qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4ThvorTQZu6xjZh9mAIbwkBrO6WPM69NIJvec7LdVVo=;
 b=IITccpsSaE68yBo8WIPQYBt/LND907CGHsY4hFYxursgfVhpy5r8RtkNHygy1kuquu
 4kuSVUgrfvHHoStlCKfookFb7fkGdOWL08C7jdrekGwyKDEVjSOBTIq48PeycG2PRTdN
 tPhyGI8J37FpE4v5pgc2X4PDnj8wOHq5vbKVZAlCqgyEHrYkLc1RK+UvvK3A/eP78XoA
 d8rlLPORpBisJR5+LU1A0NtrWWCCTrC/exBGqdcajK8502wWLDCVmJQN+ezDCObeXO6Z
 qkjZdUWG0ghDSS8yc1gZk4Sv12LrvkllY4JRR+F9cbS6m0bfnWTRIZe9ly9djA0pnRH4
 kq1g==
X-Gm-Message-State: AOAM533teWCmjFUMVXPopfwfzbzFONUkSMT5BjVNc1Hm+H0oH2BBMQD8
 pHd1kM4vM7vfLtj4L5CWsmqxlQ==
X-Google-Smtp-Source: ABdhPJwQ1DeixRZ660dgAVbWwYuloWY5Mmba+wKs4+JXqZ9cirfkXRsXSFQbUmKVuZSqLD2kMdEACw==
X-Received: by 2002:a05:6402:b69:: with SMTP id
 cb9mr9420373edb.324.1630314728824; 
 Mon, 30 Aug 2021 02:12:08 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o3sm6420378eju.123.2021.08.30.02.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:12:08 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Jonah Petri <jonah@petri.us>
References: <20210826193424.1650108-1-jonah@petri.us>
 <4bdc9d7d-b4ce-4834-c7ef-eff9865f82fb@mind.be>
 <8ec58237-a9ee-5d95-bf88-305cb5533139@petri.us>
 <20210830084514.GI1053080@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <86237c6f-e02e-d47e-84e8-00e18ac6e02c@mind.be>
Date: Mon, 30 Aug 2021 11:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830084514.GI1053080@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 1/1] toolchain: handle toolchains with
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAzMC8wOC8yMDIxIDEwOjQ1LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEpvbmFoLCBBbGws
Cj4gCj4gT24gMjAyMS0wOC0yOSAyMDoyNSAtMDQwMCwgSm9uYWggUGV0cmkgc3Bha2UgdGh1c2x5
Ogo+PiBPbiA4LzI5LzIxIDE6MjEgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pj4g
T24gMjYvMDgvMjAyMSAyMTozNCwgSm9uYWggUGV0cmkgd3JvdGU6Cj4+Pj4gIAlmaSA7IFwKPj4+
PiAtCWlmIFsgISAtZSAkKFNUQUdJTkdfRElSKS9saWIvbGQqLnNvLiogXTsgdGhlbiBcCj4+Pj4g
LQkJaWYgWyAtZSAkJHtBUkNIX1NZU1JPT1RfRElSfS9saWIvbGQqLnNvLiogXTsgdGhlbiBcCj4+
Pj4gLQkJCWNwIC1hICQke0FSQ0hfU1lTUk9PVF9ESVJ9L2xpYi9sZCouc28uKiAkKFNUQUdJTkdf
RElSKS9saWIvIDsgXAo+Pj4+IC0JCWZpIDsgXAo+Pj4+ICsJaWYgW1sgISAkJChmaW5kICQoU1RB
R0lOR19ESVIpL2xpYiAtbmFtZSAnbGQqLnNvLionIC1wcmludCAtcXVpdCkgXV07IHRoZW4gXAo+
Pj4gIEkgd2FzIGdvaW5nIHRvIHNheTogZG9uJ3QgdXNlIFtbLCBpdCdzIGEgYmFzaGlzbS4gSG93
ZXZlciwgd2UgYWxyZWFkeSB1c2UgaXQgaW4KPj4+IGhlbHBlcnMubWssIHNvIEkgZ3Vlc3MgaXQn
cyBPSy4gSXQncyB1cCB0byB3aG9ldmVyIGhhcyBhIHByb2JsZW0gd2l0aCBpdCB0byBnZXQKPj4+
IHJpZCBvZiBpdCA6LSkKPiAKPiBIZSEgRG9uJ3Qgc2F5IHN1Y2ggdGhpbmdzIHdoZW4gSSdtIGFy
b3VuZCEgOy0pCj4gCj4+PiAgVGhlcmVmb3JlLCBhcHBsaWVkIHRvIG5leHQsIHRoYW5rcy4KPj4K
Pj4gVGhhbmtzISBJIGZvdW5kIGl0IHN1cnByaXNpbmdseSBoYXJkIHRvIGZpbmQgYSBwbGVhc2lu
ZyBzaGVsbCBhbnN3ZXIgdG8KPj4gImRvZXMgdGhpcyBjb21tYW5kIHN1Y2NlZWQgKmFuZCogb3V0
cHV0IGFueXRoaW5nIHRvIHN0ZG91dD8iIHdpdGhvdXQKPj4gaW52b2tpbmcgYmFzaGlzbXMuCj4g
Cj4gVGhpcyBpcyBhIGJpdCBsZXNzIGNvbmNpc2UgKHR3byBsaW5lcyBpbnN0ZWFkIG9mIG9uZSks
IGJ1dCBpdCdzIHN0aWxsCj4gcHJldHR5IGVhc3ksIGUuZy4gd2l0aCBhIHNjcmlwdCB0aGF0IGRv
ZXMgbm90IHVzZSAnc2V0IC1lJzoKPiAKPiAgICAgb3V0cHV0PSIkKCBzb21lLWNvbW1hbmQgKSIK
PiAgICAgaWYgWyAkez99IC1uZSAwIC1vIC16ICIke291dHB1dH0iIF07IHRoZW4KPiAgICAgICAg
IGVjaG8gIkZhaWxlZCBvciBvdXRwdXQgbm90aGluZyIKPiAgICAgZmkKCiBJZiB5b3Ugd2FudCBj
b25jaXNlIChhbmQgY292ZXJpbmcgYWxsIHNldCAtZSBjYXNlcyBBRkFJQ1MpOgoKaWYgISBvdXRw
dXQ9IiQoc29tZS1jb21tYW5kKSIgfHwgWyAteiAiJG91dHB1dCIgXTsgdGhlbiAuLi4KCihhcyBh
bHdheXM6IHVudGVzdGVkLCBZTU1WKQoKIFJlZ2FyZHMsCiBBcm5vdXQKCj4gCj4gSWYgdGhlIHNj
cmlwdCBpcyB1c2luZyAnc2V0IC1lJywgb3Igb25lIG5lZWRzIHRvIGRpZmZlcmVudGlhdGUgdGhl
Cj4gcmVhc29uIGZvciBmYWlsdXJlLCB0aGVuIGl0IGlzIGEgYml0IG1vcmUgaW52b2x2ZWQsIGJ1
dCBzdGlsbCBwcmV0dHkKPiBlYXN5IGFuZCBjb21tb246Cj4gCj4gICAgIG91dHB1dD0iJCggc29t
ZS1jb21tYW5kICkiIHx8IHJldD0iJHs/fSIKPiAgICAgaWYgWyAke3JldDotMH0gLW5lIDAgLW8g
LXogIiR7b3V0cHV0fSIgXTsgdGhlbgo+ICAgICAgICAgZWNobyAiRXhpdGVkIHdpdGggJHtyZXQ6
LTB9LCBvciBvdXRwdXQgbm90aGluZyIKPiAgICAgZmkKPiAKPiBJbiBvdXIgY2FzZSwgZm9yIEJ1
aWxkcm9vdCwgd2UnZCBuZWVkIHRvIGFkYXB0IHRoZSBmaXJzdCBzb2x1dGlvbjoKPiAKPiAgICAg
Wy4uLl0gOyBcCj4gICAgIG91dHB1dD0iJCQoIHNvbWUtY29tbWFuZCApIjsgXAo+ICAgICBpZiBb
ICQkez99IC1uZSAwIC1vIC16ICIkJHtvdXRwdXR9IiBdOyB0aGVuIFwKPiAgICAgICAgIGVjaG8g
IkZhaWxlZCBvciBvdXRwdXQgbm90aGluZyI7IFwKPiAgICAgZmk7IFwKPiAgICAgWy4uLl0KPiAK
Pj4gSSB0b28gd2FzIHdhcnkgb2YgdXNpbmcgW1sgYmVmb3JlIEkgc2F3IHRoZSBzYW1lIHVzYWdl
Cj4+IGxvd2VyIGluIHRoZSBmaWxlLAo+IAo+IFlvdSBjYXVnaHQgbWUgcmVkLWhhbmRlZC4uLiBJ
IGFkZGVkIHRoYXQgYmFjayBpbiA0YTVmODc4OTQ2YzM3Li4uIDstXQo+IAo+PiBhbmQgbm90ZWQg
dGhhdCBiYXNoIGlzIGEgcHJlcmVxdWlzaXRlIGZvciBidWlsZHJvb3QgaW4KPj4gZ2VuZXJhbC4K
PiAKPiBBbmQgZXZlbiB0aGVuLCBJIGxpa2UgdGhhdCB3ZSBhdm9pZCBiYXNoaXNtcyB3aGVuIHBv
c3NpYmxlLiBCdXQgaW4gdGhpcwo+IGNhc2UsIHdlbGwsIGl0J3MgYWNjZXB0YWJsZSBhbmQgYXBw
bGllZCwgc28gSSB3b24ndCB3aGluZSAobXVjaCkuIDstKQo+IAo+PiBIb3BlZnVsbHkgc29tZSBm
dXR1cmUgZGV2IHdvbid0IGN1cnNlIG1lIHRvbyBtdWNoIOKYuiBUaGFua3MgZm9yCj4+IGFwcGx5
aW5nIQo+IAo+IFdlbGwsIFRJTCB0aGF0IG9uZSBjYW4gZG8gW1sgISAkKGNtZCkgXV0gdG8gdGVz
dCBvdXRwdXQgYW5kIHJldHVybiBjb2RlCj4gaW4gb25lIGxpbmUsIHNvLi4uIFRoYW5rcyEgOi0p
Cj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
