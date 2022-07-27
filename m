Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AC7C19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 326DC404CA;
	Wed, 27 Jul 2022 11:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 326DC404CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zg1OHmm4Ta_b; Wed, 27 Jul 2022 11:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D09940168;
	Wed, 27 Jul 2022 11:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D09940168
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 723761BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A74F4049C
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A74F4049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-Da7SaiIULm for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2613E4035D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2613E4035D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:27 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r129-20020a1c4487000000b003a34ac64bdfso162684wma.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lrG4uvwmHt3UEHHf1Jb9Jniggu+5mbiOfW9PQGjAsfg=;
 b=y0//11JC6cQaeybbfksVGIueW5OICM6GJyfSmAGe0XAtuX8RQbdBESDQZK5BHE7zsM
 +CK6LduMzL4Ca7JJc05ys0og+iNXP48+MbfcHYDFMe0/1IIXnxez6R9Ud7a9f+qzlaQw
 Vc3pN3bv8iJXBIzZxG5aCNiLgcwI8P3R+1VGfyUDijuvU+NXkfqmdDDb8+1oRaczMoDd
 Mh5xqYuyf9ldtVVnsspjMKSX8oLibgFZCVb36BMdG2QPWpYVMUbu1XfLphfYAN8yvUe/
 mg2v1lhk3Mx6ignEa9oJm7qfpfUhzRxV5mgpaVHJ+W+1n3JvEoqJuWFIh6GHbcV00v1J
 Rg9A==
X-Gm-Message-State: AJIora8RyBWhLmuJ1aLhrQN3/7FPTEgS79hLjYWh5b5MxLbrVbMkCxuy
 c+EycStdyOQjLPWWv7LeGP1YlA==
X-Google-Smtp-Source: AGRyM1uK8YpiABD5kaK85WzuVkqScc/XY2Oy7TXbkWr10ibr/Z4auPEPSrSMW4eCQlYUPLBZdfByIw==
X-Received: by 2002:a05:600c:19cc:b0:3a3:3cfe:d548 with SMTP id
 u12-20020a05600c19cc00b003a33cfed548mr2738481wmq.6.1658920105090; 
 Wed, 27 Jul 2022 04:08:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a5d5348000000b0021e52020198sm16340366wrv.61.2022.07.27.04.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:24 -0700 (PDT)
Message-ID: <b48adde2-4418-178c-0148-ef7d46cdfe4a@mind.be>
Date: Wed, 27 Jul 2022 10:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220101214034.2152144-1-giulio.benetti@benettiengineering.com>
 <CADvTj4r09-gBxrbbJCd-gXCaOzZsMGUgv=E-SELMUieGdTorcA@mail.gmail.com>
 <229dd860-e5ff-64a4-f97e-00cc3de26075@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <229dd860-e5ff-64a4-f97e-00cc3de26075@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lrG4uvwmHt3UEHHf1Jb9Jniggu+5mbiOfW9PQGjAsfg=;
 b=Bkvl1CLJ0HJa9M/scCzsB0Otskv5wsDD8OmUP/ZfFvBAKatg4Os6scH+DjYZey/u5D
 toz9uamDjE423NYsS8+PogtMwjSAY8+jdd5D5cZLE1het2K3oTPiW6V2i8cMmej5faDG
 jrQgZNmN7IsbekB6tawptVzHb4vO+4uSCTEZp6Xpb4OR1CP5Et29HHhXbQ/ysjQoNYDA
 2bVcmJAIHAG2JYtKfwNnVBQmC/GvX7W4mI0nLEc0BaSrt7xnNcPWUVYCrKRLRjGuWFf4
 kRjUio5/HtT5M+4Yz8u/3zJqaKYfBeGL1sV174MLbkRztlR5KFpGENV2Eaj8pQ4FYles
 9mCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bkvl1CLJ
Subject: Re: [Buildroot] [PATCH] Makefile: disable 'printvars' and
 'show-vars' recipes for Make 4.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNi8wNy8yMDIyIDIzOjUyLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBKYW1lcywK
PiAKPiBPbiAyMS8wNy8yMiAwNTo1NSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4+IE9uIFNhdCwg
SmFuIDEsIDIwMjIgYXQgMjo0MCBQTSBHaXVsaW8gQmVuZXR0aQo+PiA8Z2l1bGlvLmJlbmV0dGlA
YmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gTWFrZSA0LjMgaXMgYnVnZ3kg
YW5kIGxlYWRzIHRvIGEgIlNlZ21lbnRhdGlvbiBmYXVsdCAoY29yZSBkdW1wZWQpIiB3aGVuCj4+
PiBjYWxsaW5nICdtYWtlIHByaW50dmFycycgb3IgJ21ha2Ugc2hvdy12YXJzJywgc28gbGV0J3Mg
cmVmdXNlIHRvIGV4ZWN1dGUKPj4+IHRob3NlIHJlY2lwZXMgaWYgTWFrZSA0LjMgYnkgYWRkaW5n
ICdjaGVjay1tYWtlLXZlcnNpb24nIHJlY2lwZSBhcwo+Pj4gZGVwZWRlbmRlbmN5IG9mICdwcmlu
dHZhcnMnIGFuZCAnc2hvdy12YXJzJyBhcyBzdWdnZXN0ZWQgYnkgWWFubiBFLiBNb3Jpbi4KPj4K
Pj4gRllJIGF1dG9idWlsZGVyIHRocmVhZHMgc2VlbSB0byBkaWUgd2hlbiB0aGlzIGdldHMgaGl0
Ogo+PiBtYWtlOiAqKiogW01ha2VmaWxlOjEwNTY6IGNoZWNrLW1ha2UtdmVyc2lvbl0gRXJyb3Ig
MQo+PiBQcm9jZXNzIFByb2Nlc3MtMTI6Cj4+IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBs
YXN0KToKPj4gwqDCoCBGaWxlICIvdXNyL2xpYi9weXRob24zLjEwL211bHRpcHJvY2Vzc2luZy9w
cm9jZXNzLnB5IiwgbGluZSAzMTUsIGluIF9ib290c3RyYXAKPj4gwqDCoMKgwqAgc2VsZi5ydW4o
KQo+PiDCoMKgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTAvbXVsdGlwcm9jZXNzaW5nL3Byb2Nl
c3MucHkiLCBsaW5lIDEwOCwgaW4gcnVuCj4+IMKgwqDCoMKgIHNlbGYuX3RhcmdldCgqc2VsZi5f
YXJncywgKipzZWxmLl9rd2FyZ3MpCj4+IMKgwqAgRmlsZSAiL2hvbWUvYXV0b2J1aWxkL2J1aWxk
cm9vdC10ZXN0L3NjcmlwdHMvYXV0b2J1aWxkLXJ1biIsIGxpbmUKPj4gNzQ4LCBpbiBydW5faW5z
dGFuY2UKPj4gwqDCoMKgwqAgc2VsZi5ydW5fb25lX2J1aWxkKCkKPj4gwqDCoCBGaWxlICIvaG9t
ZS9hdXRvYnVpbGQvYnVpbGRyb290LXRlc3Qvc2NyaXB0cy9hdXRvYnVpbGQtcnVuIiwgbGluZQo+
PiA3MzEsIGluIHJ1bl9vbmVfYnVpbGQKPj4gwqDCoMKgwqAgcmV0ID0gc2VsZi5kb19yZXByb2R1
Y2libGVfYnVpbGQoKQo+PiDCoMKgIEZpbGUgIi9ob21lL2F1dG9idWlsZC9idWlsZHJvb3QtdGVz
dC9zY3JpcHRzL2F1dG9idWlsZC1ydW4iLCBsaW5lCj4+IDUyNCwgaW4gZG9fcmVwcm9kdWNpYmxl
X2J1aWxkCj4+IMKgwqDCoMKgIHJldCA9IHNlbGYuY2hlY2tfcmVwcm9kdWNpYmlsaXR5KCkKPj4g
wqDCoCBGaWxlICIvaG9tZS9hdXRvYnVpbGQvYnVpbGRyb290LXRlc3Qvc2NyaXB0cy9hdXRvYnVp
bGQtcnVuIiwgbGluZQo+PiA0MTYsIGluIGNoZWNrX3JlcHJvZHVjaWJpbGl0eQo+PiDCoMKgwqDC
oCBwcmVmaXggPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChbIm1ha2UiLCAiLS1uby1wcmludC1k
aXJlY3RvcnkiLAo+PiAiTz0lcyIgJSBzZWxmLm91dHB1dGRpciwKPj4gwqDCoCBGaWxlICIvdXNy
L2xpYi9weXRob24zLjEwL3N1YnByb2Nlc3MucHkiLCBsaW5lIDQyMCwgaW4gY2hlY2tfb3V0cHV0
Cj4+IMKgwqDCoMKgIHJldHVybiBydW4oKnBvcGVuYXJncywgc3Rkb3V0PVBJUEUsIHRpbWVvdXQ9
dGltZW91dCwgY2hlY2s9VHJ1ZSwKPj4gwqDCoCBGaWxlICIvdXNyL2xpYi9weXRob24zLjEwL3N1
YnByb2Nlc3MucHkiLCBsaW5lIDUyNCwgaW4gcnVuCj4+IMKgwqDCoMKgIHJhaXNlIENhbGxlZFBy
b2Nlc3NFcnJvcihyZXRjb2RlLCBwcm9jZXNzLmFyZ3MsCj4+IHN1YnByb2Nlc3MuQ2FsbGVkUHJv
Y2Vzc0Vycm9yOiBDb21tYW5kICdbJ21ha2UnLAo+PiAnLS1uby1wcmludC1kaXJlY3RvcnknLAo+
PiAnTz0vaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTExL291dHB1dC0xJywgJy1D
JywKPj4gJ2luc3RhbmNlLTExL2J1aWxkcm9vdCcsICdwcmludHZhcnMnLCAnVkFSUz1UQVJHRVRf
Q1JPU1MnXScgcmV0dXJuZWQKPj4gbm9uLXplcm8gZXhpdCBzdGF0dXMgMi4KPiAKPiBEbyB5b3Ug
aGF2ZSBhbiBhdXRvYnVpbGRlciBmYWlsdXJlIGxpbms/Cj4gU28gSSBjYW4gcmVwcm9kdWNlIGl0
IGhlcmUgYW5kIGZpbmQgYSB3b3JrLWFyb3VuZCBmb3IgaXQuCgogIEl0J3MgdGhlIGF1dG9idWls
ZGVyIHNjcmlwdCAoZnJvbSB0aGUgYnVpbGRyb290LXRlc3QgcmVwb3NpdG9yeSkgaXRzZWxmIHRo
YXQgCmNyYXNoZXMuIEkgc3VzcGVjdCBpdCBpc24ndCBhYmxlIHRvIHNlbmQgaW4gaXRzIHJlc3Vs
dHMgYWZ0ZXIgdGhhdC4gVGhlcmUgaXMgYSAKc2VwYXJhdGUgcHJvY2VzcyBmb3IgZWFjaCBhdXRv
YnVpbGRlciBpbnN0YW5jZSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhleSBhcmUgCnJlc3RhcnRlZCB3
aGVuIHRoZXkgY3Jhc2ggc28gZXZlbnR1YWxseSBhbGwgaW5zdGFuY2VzIHdpbGwgZGllLgoKICBO
b3RlIHRoYXQgdGhpcyBpcyBvbmx5IGludm9rZWQgaWYgYSByZXByb2R1Y2liaWxpdHkgZXJyb3Ig
d2FzIGRldGVjdGVkLgoKICBASmFtZXM6IGRvIGxpa2UgVGhvbWFzLCBpbnN0YWxsIGFuIGVhcmxp
ZXIgbWFrZSBvbiB5b3VyIHN5c3RlbSA6LSkKCiAgUmVnYXJkcywKICBBcm5vdXQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
