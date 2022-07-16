Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0463BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 12:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C551405BF;
	Sat, 16 Jul 2022 12:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C551405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rwbkLy78ulh; Sat, 16 Jul 2022 12:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82BC440385;
	Sat, 16 Jul 2022 12:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82BC440385
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7749C1BF963
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 12:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F28860E9B
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 12:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F28860E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8X6iUKt_rkI for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 12:22:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F147660E29
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F147660E29
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 12:22:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f2so10149671wrr.6
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 05:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=koJBDs4nOKPBV8j9fPIUAbx+Md0d6SrCCnSvHG/c0n4=;
 b=yIgjekrTnYDRVV9hgoKlHMpe1WOLWrh8CUaCVXWLaPoG1rLex/JGq1233ilEkSFwkf
 UdQx9FN+BfngopoGMG9RJ9Cgyttm+CfRkS97KaaV0y/RAC7Bnh2q06fXU14OVWN8+qAr
 5JaRWHRYIeNXxwXKj31dYxR18hOUHaBfNwCYSbb4SkB2SvJ+mX+LKluh0SQJZUnNkKjd
 xEh0fs87KfSKs3mk5gmjz42ahgeF/sqWz++tpAmyVbRObeUBkjYxbrm+6F2n+lVGYCIp
 yBxjXSr5qziA+lq0jZLRdKXhLkBLXlucGw8EHb18aM8PScsV5HgnpqMphqd6zwHgHghr
 QuEw==
X-Gm-Message-State: AJIora9XpAkhD921apgGLHUzfy93nx2S6StdSO+3tUXW9hvQY1fwl1z2
 eKPKjHVhuU7pHQJhQ5w9MUY=
X-Google-Smtp-Source: AGRyM1tFib8LWgnf2XSEKqhoqtqJs3DppBMkM2tV7c1xjFJjnkvE/t+azVo5wbiHCPn9sVutwlbzyQ==
X-Received: by 2002:a5d:4e08:0:b0:21d:a689:7dd1 with SMTP id
 p8-20020a5d4e08000000b0021da6897dd1mr16190791wrt.477.1657974176264; 
 Sat, 16 Jul 2022 05:22:56 -0700 (PDT)
Received: from [192.168.1.43]
 (amontpellier-554-1-90-79.w92-145.abo.wanadoo.fr. [92.145.201.79])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003a2c7bf0497sm6809678wmq.16.2022.07.16.05.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jul 2022 05:22:55 -0700 (PDT)
Message-ID: <8a677c96-16ff-600a-b5da-f77b74c862dd@gmail.com>
Date: Sat, 16 Jul 2022 14:23:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Frank Hunleth <fhunleth@troodon-software.com>, buildroot@buildroot.org
References: <20220627135359.2232222-1-fhunleth@troodon-software.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220627135359.2232222-1-fhunleth@troodon-software.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=koJBDs4nOKPBV8j9fPIUAbx+Md0d6SrCCnSvHG/c0n4=;
 b=bcswEtqp5amLWkcRocA8sVI+riBoxH+OqqXHmenoKn7ntAxfxeAc0YqrTCOvzq0Z+k
 zl9Po8UmFRh/hiuP/nF8Yk3qJ9h37kpa/5UTegkjAedGQGDog+woX2OvX6G5iwPMDaH0
 GFX4B/bBhC9BAltYbk1mJfOw554nUh4NQgLmX2k6VeO2ltoDPyGWZd2o8jThBuHIxkjp
 DW2ZqSTxEs2Y3kA2E0E996FY635wfPRXrRMJsZklXjsInmAeTk9oUn308NByZKV8G4Fc
 DK6sBzNtSlIvkzGbKENCDcepdod//eMb7vIUIOTcxxMmzAnw98lNGmtvrvB6V+PP2I/p
 Gk7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bcswEtqp
Subject: Re: [Buildroot] [PATCH 1/1] arch/riscv: support the vector
 operations extension
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
Cc: Mark Corbin <mark@dibsco.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbmssCgpMZSAyNy8wNi8yMDIyIMOgIDE1OjU0LCBGcmFuayBIdW5sZXRoIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBIdW5sZXRoIDxmaHVu
bGV0aEB0cm9vZG9uLXNvZnR3YXJlLmNvbT4KPiAtLS0KPiAgYXJjaC9Db25maWcuaW4ucmlzY3Yg
fCA3ICsrKysrKysKPiAgYXJjaC9hcmNoLm1rLnJpc2N2ICAgfCAzICsrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4u
cmlzY3YgYi9hcmNoL0NvbmZpZy5pbi5yaXNjdgo+IGluZGV4IDI4OGVkODMzZWIuLmU0ZGM5MzZj
ZjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9Db25maWcuaW4ucmlzY3YKPiArKysgYi9hcmNoL0NvbmZp
Zy5pbi5yaXNjdgo+IEBAIC0xOCw2ICsxOCw5IEBAIGNvbmZpZyBCUjJfUklTQ1ZfSVNBX1JWRAo+
ICBjb25maWcgQlIyX1JJU0NWX0lTQV9SVkMKPiAgCWJvb2wKPiAKPiArY29uZmlnIEJSMl9SSVND
Vl9JU0FfUlZWCj4gKwlib29sCj4gKwo+ICBjaG9pY2UKPiAgCXByb21wdCAiVGFyZ2V0IEFyY2hp
dGVjdHVyZSBWYXJpYW50Igo+ICAJZGVmYXVsdCBCUjJfcmlzY3ZfZwo+IEBAIC02Myw2ICs2Niwx
MCBAQCBjb25maWcgQlIyX1JJU0NWX0lTQV9DVVNUT01fUlZECj4gIGNvbmZpZyBCUjJfUklTQ1Zf
SVNBX0NVU1RPTV9SVkMKPiAgCWJvb2wgIkNvbXByZXNzZWQgSW5zdHJ1Y3Rpb25zIChDKSIKPiAg
CXNlbGVjdCBCUjJfUklTQ1ZfSVNBX1JWQwo+ICsKPiArY29uZmlnIEJSMl9SSVNDVl9JU0FfQ1VT
VE9NX1JWVgo+ICsJYm9vbCAiVmVjdG9yIEluc3RydWN0aW9ucyAoVikiCj4gKwlzZWxlY3QgQlIy
X1JJU0NWX0lTQV9SVlYKPiAgZW5kaWYKPiAKPiAgY2hvaWNlCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJjaC5tay5yaXNjdiBiL2FyY2gvYXJjaC5tay5yaXNjdgo+IGluZGV4IGYzYmYyYjM0NjcuLmNl
YTViMGYyNjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcmNoLm1rLnJpc2N2Cj4gKysrIGIvYXJjaC9h
cmNoLm1rLnJpc2N2Cj4gQEAgLTI2LDUgKzI2LDggQEAgZW5kaWYKPiAgaWZlcSAoJChCUjJfUklT
Q1ZfSVNBX1JWQykseSkKPiAgR0NDX1RBUkdFVF9BUkNIIDo9ICQoR0NDX1RBUkdFVF9BUkNIKWMK
PiAgZW5kaWYKPiAraWZlcSAoJChCUjJfUklTQ1ZfSVNBX1JWVikseSkKPiArR0NDX1RBUkdFVF9B
UkNIIDo9ICQoR0NDX1RBUkdFVF9BUkNIKXYKCkFGQUlLIHRoaXMgcmVxdWlyZXMgYXQgbGVhc3Qg
Z2NjIDEyIFsxXSB0byBzdXBwb3J0IHRoaXMgZXh0ZW5zaW9uIChtaXNzaW5nCmRlcGVuZGVuY3kg
b24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTIpLgoKQWxzbyBnY2MgMTIgbmVlZHMgdG8g
YmUgbWVyZ2VkIGludG8gQnVpbGRyb290IGZpcnN0IFsyXSAoaGVscCB3ZWxjb21lKSA7LSkKCkkg
aGF2ZSBtYXJrZWQgdGhpcyBwYXRjaCBhcyAiQ2hhbmdlcyBSZXF1ZXN0ZWQiLgoKWzFdCmh0dHBz
Oi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7YT1jb21taXRkaWZmO2g9ZTdkYTMxYmEyMDMw
Yjg1ZmYwZDE1YTBjNGFhYzMzMThjYjY2YjY0YQoKWzJdIGh0dHA6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzAyMzg5CgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gK2VuZGlmCj4gCj4gIGVuZGlmCj4gLS0KPiAyLjI1LjEKPiAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
