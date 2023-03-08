Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D73CC678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 09:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 958EF81EA6;
	Wed,  8 Mar 2023 09:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958EF81EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KuXGxYbmMFOr; Wed,  8 Mar 2023 09:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A0381320;
	Wed,  8 Mar 2023 09:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3A0381320
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 784FC1BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 09:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EB9F40289
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 09:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EB9F40289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3m6zUkKOtOXY for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 09:57:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 557A9400B9
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 557A9400B9
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 09:57:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so852332wms.2
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 01:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678269433;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=od/+n1LSKaJ7AYy3AA71jWywBexdWehcDE4CkQYpds8=;
 b=LmP3NaQ/UnU5CVLr1laa6kPEfVrPOX+dMw6FBQa0OllJnKpqrv2m3KwHBr0T5205Wk
 2iWbOjVwpF8byOXwikE5z4dtLyJdkocZOiwN/sEThnlMZ1btA+58VYXK8JQcT0m2AQHD
 uxkeKehhoNas6kOmPR3BQr54+IkHbH0Rk5KEwGGvhTpB7xBmiilxSwBc+NjTua0ifYS7
 4wWUGyhy+hz5nu9JZBN2xTCUg73G+0Uh4gJtR6rBYVpDH08a66BO1lL98rjwbu5vxhAp
 MLGoD63bxChqt1lWymvBLK/+qF44BtkUyXAhuxBGFrSwYveEIsd4hF5OZx2htP0PV+Nk
 BWbw==
X-Gm-Message-State: AO0yUKVPAzNPx78MkPkDGYdBUcHgIDmMKPQUigj26Zjinn98sbTdL8O8
 /mst1sHwkQ8VdNs3TOsFxO/GIA==
X-Google-Smtp-Source: AK7set8VXd4yCQTQ2Odr1WCimr9q8K1/lhacv5SaYmd8mzAA+JhDkYgrUj4mb8Jkkstl2TWV/6BZtA==
X-Received: by 2002:a05:600c:3550:b0:3ea:bc27:6a64 with SMTP id
 i16-20020a05600c355000b003eabc276a64mr15531502wmq.10.1678269433361; 
 Wed, 08 Mar 2023 01:57:13 -0800 (PST)
Received: from [10.5.2.139]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002c8476dde7asm14816018wru.114.2023.03.08.01.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 01:57:13 -0800 (PST)
Message-ID: <65aaaa67-875c-e5e2-195b-21b564af73f0@smile.fr>
Date: Wed, 8 Mar 2023 10:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230308085354.127183-1-sebastian.weyer@smile.fr>
 <20230308085354.127183-2-sebastian.weyer@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230308085354.127183-2-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678269433;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=od/+n1LSKaJ7AYy3AA71jWywBexdWehcDE4CkQYpds8=;
 b=Sq2mFV3oqUJLaOe8VzwUJ1UxejhxUXMGjY4KGeKGnEe090B3hpambiMKA1l5tSSemo
 W80RwtKxVh2HXaWHT+SC5ws00YqLSCe6m5VFCafteJEjxSmlTA3v/eaFgeE5OggGgAS1
 Mm6kTsl+D+u30XYrytNmnvEHVgPdjh3YN2Jn2i8PsYq1hk1TobgkryrJu63pHX8+s0eP
 k3bbgDHPiVb4FAcO5dzzWGdYaMV5kiTtN3jiSa/4Fh3v6GHoE7vhhbIjPw+erbr74Fih
 cejpIwn/ccd0X0UnBgLAtATjjDxqjE1Jrj6DSTJsgmhbPv/u++fsXBnTRkRRnXofZDQW
 1nOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Sq2mFV3o
Subject: Re: [Buildroot] [PATCH v5 2/3] package/nushell: Add default configs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDgvMDMvMjAyMyDDoCAwOTo1MywgU2ViYXN0aWFuIFdleWVyIGEgw6ljcml0wqA6Cj4gQXV0
b21hdGljYWxseSBwbGFjZSBkZWZhdWx0IGZpbGVzIGZvciB0aGUgbnVzaGVsbCBlbnZpcm9ubWVu
dCBhbmQKPiBjb25maWcgaW4gdGhlIGFwcHJvcHJpYXRlIGZvbGRlciB0byBhdm9pZCB0aGUgcHJv
bXB0IGF0IHN0YXJ0dXAsIGFza2luZwo+IGlmIHlvdSB3YW50IHRvIGNyZWF0ZSB0aGVtLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBXZXllciA8c2ViYXN0aWFuLndleWVyQHNtaWxlLmZy
Pgo+IC0tLQo+IFRoZXNlIGRlZmF1bHQgY29uZmlncyBhcmUgb3B0aW9uYWwgYW5kIG1pZ2h0IG5v
dCBldmVuIGJlIG5lY2Vzc2FyeSwgdGhleQo+IG9ubHkgcHJldmVudCB0aGUgcHJvbXB0IGF0IHRo
ZSBmaXJzdCBzdGFydHVwIG9mIHRoZSBzaGVsbAo+IC0tLQo+ICBwYWNrYWdlL251c2hlbGwvbnVz
aGVsbC5tayB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9udXNoZWxsL251c2hlbGwubWsgYi9wYWNrYWdlL251
c2hlbGwvbnVzaGVsbC5tawo+IGluZGV4IDgzNmY0MTRkMGEuLjBhNTk2YzM5ZmEgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9udXNoZWxsL251c2hlbGwubWsKPiArKysgYi9wYWNrYWdlL251c2hlbGwv
bnVzaGVsbC5tawo+IEBAIC0xMCw2ICsxMCwxNSBAQCBOVVNIRUxMX0xJQ0VOU0UgPSBNSVQKPiAg
TlVTSEVMTF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICBOVVNIRUxMX0RFUEVOREVOQ0lFUyA9
IG9wZW5zc2wgaG9zdC1wa2djb25mIG5jdXJzZXMKPiAgCj4gK2RlZmluZSBOVVNIRUxMX0NSRUFU
RV9ERUZDT05GSUcKClRoZSBuYW1lIG9mIHRoaXMgZGVmaW5lIGlzIG5vdCByZWFsbHkgYWNjdXJh
dGUsIHdoYXQgYWJvdXQKTlVTSEVMTF9JTlNUQUxMX0RFRkFVTFRfQ09ORklHID8KCj4gKwkkKElO
U1RBTEwpIC1tIDA2NDQgLUQgJChARCkvY3JhdGVzL251LXV0aWxzL3NyYy9zYW1wbGVfY29uZmln
L2RlZmF1bHRfY29uZmlnLm51IFwKPiArCQkkKFRBUkdFVF9ESVIpL3Jvb3QvLmNvbmZpZy9udXNo
ZWxsL2NvbmZpZy5udQo+ICsJJChJTlNUQUxMKSAtbSAwNjQ0IC1EICQoQEQpL2NyYXRlcy9udS11
dGlscy9zcmMvc2FtcGxlX2NvbmZpZy9kZWZhdWx0X2Vudi5udSBcCj4gKwkJJChUQVJHRVRfRElS
KS9yb290Ly5jb25maWcvbnVzaGVsbC9lbnYubnUKPiArZW5kZWYKPiArCkkgdGhpbmsgeW91IGNh
biByZW1vdmUgdGhpcyBuZXcgZW1wdHkgbGluZS4KPiArTlVTSEVMTF9QT1NUX0lOU1RBTExfVEFS
R0VUX0hPT0tTICs9IE5VU0hFTExfQ1JFQVRFX0RFRkNPTkZJRwoKQmVzdCByZWdhcmRzLApSb21h
aW4KCgo+ICsKPiAgIyBBZGQgL2Jpbi9udSB0byAvZXRjL3NoZWxscyBhcyBpbiBwYWNrYWdlL2Jh
c2gvYmFzaC5tawo+ICBkZWZpbmUgTlVTSEVMTF9BRERfTlVfVE9fU0hFTExTCj4gIAlncmVwIC1x
c0UgJ14vYmluL251JCQnICQoVEFSR0VUX0RJUikvZXRjL3NoZWxscyBcCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
