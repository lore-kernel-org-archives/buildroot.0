Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E5EC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 17:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B4CE408CA;
	Sat, 18 Mar 2023 17:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B4CE408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uz6_A2NvBBLg; Sat, 18 Mar 2023 17:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2D45408AF;
	Sat, 18 Mar 2023 17:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D45408AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 936AF1BF599
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 17:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 755298200E
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 17:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755298200E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8fq59TDx-0K for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 17:52:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2731D81FD8
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2731D81FD8
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 17:52:31 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o12so32007029edb.9
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 10:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679161949;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dcj+AfYO1LBcUdFpT3DFGWBCcFs7CCTLB60NlzXOh4Y=;
 b=4ba2lcvX1IvHmisr/hscnGiRHZSOU8Sl791CrutuFDgGac79teGKcU8gNG0VONHqS3
 EUEqjKn5ECuoRkzlsELYMqSJLiVxPMPp137gJndRK/MZPqIDu69xQHa1VwLoxp7Uq/1y
 XvX1yLQjlSHNT7kZd8pIFbl6fykPXUhTWygqiEka8mZ/0sxnFs+bEm5LNA8U/OM0Bv98
 1Hhtarx/YKKiPJmzWkQTRfvrOGE924ioQgq9V9tvsiF8TzHg/AkEDy/QpHP3e+g6LIDe
 inW9+OQswxR38i1JtazKtrUH/b4Ub18TZeXIkT0QxSM5VDigAbPvu2M3qCsKt+8XspY9
 xafg==
X-Gm-Message-State: AO0yUKWxdaTIiQZlAabaYDISAB0mnyKItdeZ0lExl9QJ8CN/EZTMxV33
 ljARzxXm9h/8/uhHAhT2idzM72/CkhU=
X-Google-Smtp-Source: AK7set/cG8QD0s8fOgITkwtO3Vzc+WAOyJDLwfPq8SjLlLEslEonjQdSwbt2+hE8wbFMc4Sj/E5YeA==
X-Received: by 2002:a05:6402:68e:b0:4fb:59bb:ce7c with SMTP id
 f14-20020a056402068e00b004fb59bbce7cmr7890341edy.32.1679161949060; 
 Sat, 18 Mar 2023 10:52:29 -0700 (PDT)
Received: from [127.0.0.1] (pd9fae977.dip0.t-ipconnect.de. [217.250.233.119])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a50f615000000b004fce9ff4830sm2634734edn.88.2023.03.18.10.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Mar 2023 10:52:28 -0700 (PDT)
Date: Sat, 18 Mar 2023 18:52:27 +0100 (GMT+01:00)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <e258bff9-5090-414d-bbba-72d15c12d4c5@gmail.com>
In-Reply-To: <20230318123010.3448-1-fontaine.fabrice@gmail.com>
References: <20230318123010.3448-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Correlation-ID: <e258bff9-5090-414d-bbba-72d15c12d4c5@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679161949;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcj+AfYO1LBcUdFpT3DFGWBCcFs7CCTLB60NlzXOh4Y=;
 b=gVxjuJ64wQj1pLP2+srNIvvxFYFHx0/M4eY7zQT+QO40ENjQfaVWm74TFPPG1HXXOF
 2dY33eY+1zbeQHjt34CsvK5XqcsCeNNTHqRJ7qNUp3qKy5YV+7Z8/XcVpj/aWYqjXsnh
 jHVFsQ6kuQYNPolYJgWcOkjB/TQYAGmfjbkl2PUN17yfHuGziuLwd2XGcIrOrqJsk3Kp
 /rfyfMfys1yaIKhTVFb2yqaHsV53Hzp+Ika2KmBgY9ovWaphaM4+8tECxjvgPCF04MJb
 vBkf/wa69vtW4Ltupl1LTF+OiGkcKPzXFO2zAVlZlSg5r11pRpNOqrRxv/CpHWzZMStc
 dYRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gVxjuJ64
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: fix libsemanage
 dependency
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRnJhYnJpY2UsCnRoYW5rcyBmb3IgdGhlIGZpeC4gVGhlIHBhdGNoIGxvb2tzIGdvb2QgZm9y
IG1lLgoKQmVzaWRlcyB0aGF0LCBzaG91bGQgSSBub3QgZ2V0IGFuIGVtYWlsIGlmIGEgYnVpbGQg
ZmFpbHMgaW4gYSBwYWNrYWdlLCB3aG9tIEkgYW0gdGhlIGRldmVsb3BlciBpbiBERVZFTE9QRVJT
IGZpbGU/CgpUaGFua3MsClJhcGhhZWwgUGF2bGlkaXMKCjE4LjAzLjIwMjMgMTM6MzA6MTMgRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+OgoKPiBGaXggdGhlIGZv
bGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZCBzaW5jZSB0aGUgYWRkaXRpb24gb2YgdGhlIHBh
Y2thZ2UKPiBpbiBjb21taXQgZjc4YzVjYjVjYWU5M2E5ZTYzZGFkNDM2MWQ3OGUxNzg3NzU5Mzgy
ZjoKPiAKPiBNYWtlZmlsZTo1NzY6ICoqKiBsaWJzZW1hbmFnZSBpcyBpbiB0aGUgZGVwZW5kZW5j
eSBjaGFpbiBvZiBzaGFkb3cgdGhhdCBoYXMgYWRkZWQgaXQgdG8gaXRzIF9ERVBFTkRFTkNJRVMg
dmFyaWFibGUgd2l0aG91dCBzZWxlY3RpbmcgaXQgb3IgZGVwZW5kaW5nIG9uIGl0IGZyb20gQ29u
ZmlnLmluLsKgIFN0b3AuCj4gCj4gRml4ZXM6Cj4gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy9lNTI4ZTA3ODc0ODE1ZDdmMWNiOTUxMDg0ZWM5ODVkNzZmZTIyZDJlCj4g
Cj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+Cj4gLS0tCj4gcGFja2FnZS9zaGFkb3cvc2hhZG93Lm1rIHwgMiArLQo+IDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3NoYWRvdy9zaGFkb3cubWsgYi9wYWNrYWdlL3NoYWRvdy9zaGFkb3cubWsKPiBpbmRl
eCBkOGY5MTNhNjQ4Li40YmMzY2NlMDM3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc2hhZG93L3No
YWRvdy5tawo+ICsrKyBiL3BhY2thZ2Uvc2hhZG93L3NoYWRvdy5tawo+IEBAIC04Nyw3ICs4Nyw3
IEBAIGVsc2UKPiBTSEFET1dfQ09ORl9PUFRTICs9IC0td2l0aG91dC1saWJjcmFjawo+IGVuZGlm
Cj4gCj4gLWlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCU0VMSU5VWCkseSkKPiAraWZlcSAoJChCUjJf
UEFDS0FHRV9MSUJTRUxJTlVYKSQoQlIyX1BBQ0tBR0VfTElCU0VNQU5BR0UpLHl5KQo+IFNIQURP
V19DT05GX09QVFMgKz0gLS13aXRoLXNlbGludXgKPiBTSEFET1dfREVQRU5ERU5DSUVTICs9IGxp
YnNlbGludXggbGlic2VtYW5hZ2UKPiBlbHNlCj4gLS0gCj4gMi4zOS4xCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
