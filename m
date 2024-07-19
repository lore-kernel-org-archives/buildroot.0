Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91EDC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 04:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283EB40565;
	Fri, 19 Jul 2024 04:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPjNizK0-VPp; Fri, 19 Jul 2024 04:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA8DA40581
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA8DA40581;
	Fri, 19 Jul 2024 04:23:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF1A21BF841
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB4C640581
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ROlA4FenOB0 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 04:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61F2340565
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61F2340565
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61F2340565
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 04:23:38 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c66so2020180e87.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721363016; x=1721967816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HVpobSgZ/+zdPAK/Y7B1Y8YfjsDRwoejPnomaxr0UM=;
 b=rEz8kE04LFnCnw1AwWgt+xbtuMRA1iQduAquOuNn2WwlBxaJp5dFqG6g8qXHC49muZ
 h9P6qVrlyAolgDTO4YQlYpmN3elAAk7tbHjdlttQ6+yxFbcaVCmkEdC2RJKjjoYhldf1
 pKTQuaIknCEUj4PZmoNftlpHXTwIGlAb2hxee1BXLlwbeXa8T5ZHhmtv++SpOMJQnZoO
 mn3E8R/OipyGNBa3cN79+YWoo4M9vSUAHhdGM2QfA+UDbKXmJbrmMplBydXzCA3GQPfQ
 1EXb0+dmQrPRbG/SsA6p8deyWpe0zrJ0JM2uY8gf9egXUi11uMcg+SJds2xE16eFrSmu
 814g==
X-Gm-Message-State: AOJu0YwgAq8yWFph68GG3RM9lQUxrghuXthF/8nDANxiX+OdNhzNei99
 XFd73dsDdKaS5Mkrw00wLTOIwivYTWRdtV7rI7vrTESzlLP2gJ687JXfqMc0a1XxP5KFdfJ2WwG
 3ac1hoA==
X-Google-Smtp-Source: AGHT+IGtQkTUF4DVRGcVh33aN7XqXryx4mNWycAIYd8TNZgI5Pm/YhKfZJJkVOfSbVFb/zyPSi8qog==
X-Received: by 2002:a05:6512:33d1:b0:52e:716a:1898 with SMTP id
 2adb3069b0e04-52ee54540a5mr5817191e87.58.1721363015366; 
 Thu, 18 Jul 2024 21:23:35 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef553bbb4sm70747e87.67.2024.07.18.21.23.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 21:23:33 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52ea929ea56so2145180e87.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:23:33 -0700 (PDT)
X-Received: by 2002:a05:6512:2385:b0:52c:e119:7f1 with SMTP id
 2adb3069b0e04-52ee5433c33mr6076165e87.51.1721363012863; Thu, 18 Jul 2024
 21:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240719030537.3156999-1-james.hilliard1@gmail.com>
 <CA+h8R2qXX_Xw0CseHvZ25JQF6H_AouHuFSf0xwkcQEdfqfF8JQ@mail.gmail.com>
 <CADvTj4qLgVGHf9fx9GaRLn1HAbhDh8+tWtsWtaOZ4ynQZB7+xg@mail.gmail.com>
In-Reply-To: <CADvTj4qLgVGHf9fx9GaRLn1HAbhDh8+tWtsWtaOZ4ynQZB7+xg@mail.gmail.com>
Date: Thu, 18 Jul 2024 21:23:21 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pON5gP7uGY97Ltat4srb=s3JL573Y0iKnX=QS2M3h5yQ@mail.gmail.com>
Message-ID: <CA+h8R2pON5gP7uGY97Ltat4srb=s3JL573Y0iKnX=QS2M3h5yQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721363016; x=1721967816; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9HVpobSgZ/+zdPAK/Y7B1Y8YfjsDRwoejPnomaxr0UM=;
 b=vdUtVZJjnZWbLa3ygPj+BuLsw35DqQ+nQT/NfemGnkiD7RyyhWqjYPqOkVwv1zDvek
 KbtV61CrbLI818iH2/e4WEHTvINfHO7S51oIeEbJhfHXpeRK9sqVtsCuM4YHcftlg0PJ
 +Y+wnQglIVDyoBon+1VOlnxGV1DsOFyrTRJ9I5R7ubpzhoIbe5l5W2QQRNWQLF6tYqOK
 rlk7vPyHOhTgKbHTnve8c1ffybUpU/TR2pc2vGETAXk165HTjN8PHg5hijP1QU/QLhgz
 tFutKlskbmQpKzr5kI9RBI67n21W5Q3KaNrnd4JJByQGirRRUTXnF/T4ITyxxmZ27r/b
 uNpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=vdUtVZJj
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-golang.mk: allow packages
 to override download GOPROXY
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgoKT24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgODozN+KAr1BNIEphbWVzIEhpbGxp
YXJkCjxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiA+IGdpdCBjbG9uZSBodHRw
czovL2dpdGh1Yi5jb20vdGFpbHNjYWxlL3RhaWxzY2FsZQo+ID4gY2QgdGFpbHNjYWxlCj4gPiBl
eHBvcnQgR09QUk9YWT1kaXJlY3QKPiA+IGdvIG1vZCB2ZW5kb3IKPiA+ICMgd29ya3MKPgo+IFdl
aXJkLCBkb2Vzbid0IHdvcmsgZm9yIG1lLCBJIGdldDoKPiB2ZXJpZnlpbmcgZnlicmlrLmlvL2Ny
ZG9jQHYwLjYuMzogY2hlY2tzdW0gbWlzbWF0Y2gKPiAgICAgZG93bmxvYWRlZDogaDE6QXdpK3Yr
VVJ0ajVEdlByMExMZFZyVzJObjkvRzFZN2FHcFVQRzFJQVRFND0KPiAgICAgZ28uc3VtOiAgICAg
aDE6ak5OQVZJTnU4dXA1dnJMYTBqclY3ejdIU2x5SEYvNmxOT3JBdHJYd1lsST0KPgo+IFNFQ1VS
SVRZIEVSUk9SCj4gVGhpcyBkb3dubG9hZCBkb2VzIE5PVCBtYXRjaCBhbiBlYXJsaWVyIGRvd25s
b2FkIHJlY29yZGVkIGluIGdvLnN1bS4KPiBUaGUgYml0cyBtYXkgaGF2ZSBiZWVuIHJlcGxhY2Vk
IG9uIHRoZSBvcmlnaW4gc2VydmVyLCBvciBhbiBhdHRhY2tlciBtYXkKPiBoYXZlIGludGVyY2Vw
dGVkIHRoZSBkb3dubG9hZCBhdHRlbXB0Lgo+Cj4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZSAn
Z28gaGVscCBtb2R1bGUtYXV0aCcuCgpUaGlzIGlzIGEgdGFpbHNjYWxlIGJ1Zy4gUmF0aGVyIHRo
YW4gd29yayBhcm91bmQgdGhpcyBieSBjaGFuZ2luZwpHT1BST1hZLCB3ZSBzaG91bGQgcGF0Y2gg
Z28uc3VtLCBPUiB1c2UgYSBkaWZmZXJlbnQgdmVyc2lvbiBmb3IgdGhhdApkZXBlbmRlbmN5LgoK
VGhhdCBkZXBlbmRlbmN5IGNhbiBiZSBmb3VuZCBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vZnli
cmlrL2NyZG9jL2NvbW1pdC9lZGNmNGIwNGUzYzMyODU5ZGIxMzg1NTJiMzllOTNiYjU2Yjk2MDQ2
CgpXZSBjYW4gZml4IHRoaXMgdGhlbiB3aXRoIGEgcGF0Y2ggdG8gYWRkIHRoaXMgbGluZSB0byBn
by5tb2Q6CgpyZXBsYWNlIGZ5YnJpay5pby9jcmRvYyA9PiBnaXRodWIuY29tL2Z5YnJpay9jcmRv
YwplZGNmNGIwNGUzYzMyODU5ZGIxMzg1NTJiMzllOTNiYjU2Yjk2MDQ2IC8vIHYwLjYuMwoKSSBo
YXZlIGZpbGVkIGEgdGFpbHNjYWxlIGJ1ZyBhcyB3ZWxsOgpodHRwczovL2dpdGh1Yi5jb20vdGFp
bHNjYWxlL3RhaWxzY2FsZS9pc3N1ZXMvMTI4NTkKClRoYW5rcyEKQ2hyaXN0aWFuIFN0ZXdhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
