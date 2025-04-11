Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048A1C369B1
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 14:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A89A760EDD;
	Fri, 11 Apr 2025 14:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjIs114pmDNo; Fri, 11 Apr 2025 14:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A7560849
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A7560849;
	Fri, 11 Apr 2025 14:12:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED6BD138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF05041FF6
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcAcrFxx_ByF for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 14:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E671841FE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E671841FE1
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E671841FE1
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:12:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso969022f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 07:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744380766; x=1744985566;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xuq8tfmVFeHhorX97XG1h3jy/5HAb42LUj5JrRQl7z8=;
 b=sZ6l95olRJVJPPSOuF63vKoJv/PTl++j6S6f9N+OiQuT9Czw+f3pafHRHkWZzaIJh+
 qot/+Os49YjNSMs9JnIsUvTC9YJ3jMBPxKvWSp5lyhLDrcGSdVmi6VskeC5sZ24aLHZT
 +pTdcftfZ//nQ+gRFwuhfH++CB5F5jWbylijzkXwyU+op4JI19CDLIZacSIhtUYXMoow
 zWeFAUN4+dlNXHc1mqT34UlhmOSoz5WnmmbK0go0GJILCIz4wJ41+/Ys1Moxd1ZvuKod
 0vJXN86Yp7BkUZw9cisTuFr8If+7pmBwFAYhZy1MJl9alhUNFigA8Pl8ZfMdIs7SkfUo
 n6LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUkU+UCv8CryQ0G/2sF9YpdijZZyjrCdl8GTpkF2dB5s/lZTMidMqxmv+Xgcm97Y1QHeOU2Lz1u60=@buildroot.org
X-Gm-Message-State: AOJu0YzwVscbTQLw5T66BnwxcnEUnnoS8t7E48juLtB/XAamSc/OurrX
 GfvvnwDKg2lRWnOPXdvtwUieIpE7w4n3JsCdahPMNM+Mji8Ucmph
X-Gm-Gg: ASbGncvCLfZf17/wruOtbytMQ02KkFTfyRG0c0/QKpz9cBsrHKJsm78Du89taLxHEA3
 U9SmQEqYeYjwM922+g4bboOT81Mt/SPMHR5JMqO1w8WCFpn8AI/ToZuv8mMnGQwBQVwELVdiUH6
 /8UC0tCoqOdGqP+KnBbPtDPf1R/CfmbLk/NsawRA/tYLh9KxDx00yBi7nx03FvPZMIjNqTEhLSU
 t5T4+6qMRsMb8xz+PVgiY3jsrWZNvY6DDUh4ET/73WnfIlRYiBxes84g1LAXWoJysgIybDsSugM
 Wx6tXKR/OLDBweT7FC7FVQdvfnkiJBa8oKgehNFRMZfIvwvZZoz9onX1icVoGRAeQTpDP72WEKm
 jqNbHsd6e3Q==
X-Google-Smtp-Source: AGHT+IE5YEWRplWlzjup+qZVdAsLc0Q/OvBI8UfKcbLR9C5VSC9pqGCUzh+M7K0w6DUFlo2KTg5e1g==
X-Received: by 2002:a5d:6daa:0:b0:391:ab2:9e71 with SMTP id
 ffacd0b85a97d-39ea51f55b2mr2358859f8f.20.1744380765766; 
 Fri, 11 Apr 2025 07:12:45 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c0d9sm2165841f8f.32.2025.04.11.07.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 07:12:45 -0700 (PDT)
Message-ID: <b4f47833-1907-4270-96b3-9f32c223cdbd@gmail.com>
Date: Fri, 11 Apr 2025 16:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20250411085817.3269572-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20250411085817.3269572-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744380766; x=1744985566; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xuq8tfmVFeHhorX97XG1h3jy/5HAb42LUj5JrRQl7z8=;
 b=dW82G4zj1OQXAUywb4yGODvsVt2r36gW2OmjOUAX/OMIfx6iQG5C4ORnoElbg3/d1R
 jeN/6yDOOAlpILzPP9WNjtZjTD6wBj1GPcDCPIHp2xVgp40ks9fUEdx7qGuvB4Dt7aM0
 QiG2yYd7r/pgPmjfR++K6+GI+WQ/RsWbhONDL2r+enw0TSZtQYyPkA7Qof8Y7pvFgKYS
 2djkrNoEPqoJYK1dFP/GeL/999j9qGGNJmuTLl3ZIAoFvjBnKqSAQ9/x8pgrgWhWFmJa
 whArkbT1PDyc1k3a2oPOvYxN6YRtZwHm9OdnEKLuYrLXxK67Dgb480IIMZy+GgU6yAJe
 n9Qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dW82G4zj
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/stm32mp157*_dk*: bump TF-A
 to 2.10, Linux to 6.12.22 and U-Boot to 2025.04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxMS8wNC8yMDI1IMOgIDEwOjU4LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdMKgOgo+IFRo
ZSBwYXRjaCBidW1wcyBBcm0gVHJ1c3RlZCBGaXJtd2FyZSAoVEYtQSkgdG8gdmVyc2lvbiAyLjEw
IExUUyB0aGUgTGludXgKPiBrZXJuZWwgdG8gdmVyc2lvbiA2LjEyLjIyIGFuZCBVLUJvb3QgdG8g
dmVyc2lvbiAyMDI1LjA0Lgo+IFRoZSBuZXcgdmVyc2lvbiBvZiBVLUJvb3QgaGFzIGFkZGVkIEVG
SSBDYXBzdWxlIHN1cHBvcnQsIHdoaWNoIGRlcGVuZHMgb24KPiBHbnVUTFMsIHRodXMgcmVxdWly
aW5nIHRoZSBhY3RpdmF0aW9uIG9mIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfR05VVExTLgo+IAo+
IFRlc3RlZCBvbiBTVE0zMk1QMTU3Qy1ESzIgRGlzY292ZXJ5IEJvYXJkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bT4KCkhpIERhcmlvLAoKVGhpcyBwYXRjaCB0ZXN0cyBmaW5lIG9uIFNUTTMyTVAxNS4gIEhvd2V2
ZXIgaXQgYnJlYWtzIHRoZSBidWlsZCBvbiAKU1RNMzJNUDEzLiBOb3cgdGhhdCBTVE0zMk1QMTUg
YW5kIFNUTTMyTVAxMyBoYXZlIGJlZW4gdGllZCB0aHJvdWdoIHRoaXMgCnBhdGNoWzFdIGFuZCB0
aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBsYXRlciBib2FyZCBbMl0sIExpbnV4IGFuZCBVLUJvb3Qg
CmNvbXBvbmVudHMgbmVlZCB0byBiZSB1cGRhdGVkIG9uIGJvdGggcGxhdGZvcm1zIGF0IHRoZSBz
YW1lIHRpbWUuCgpCYXNlZCBvbiB5b3VyIGNoYW5nZXMsIEkgdGVzdGVkIFRGLUEgMi4xMiArIFUt
Qm9vdCAyMDI1LjA0ICsgTGludXggCjYuMTIuMjIgb24gU1RNMzJNUDEzIGFuZCBpdCBkaWQgYWxy
aWdodC4KCkNhbiB5b3UgdXBkYXRlIHRoZSBTVE0zMk1QMTMgY29uZmlnID8gRG9pbmcgc28gd2ls
bCBhbHNvIHJlbW92ZSB0aGUgCnNlY29uZCBsaW51eC5oYXNoIGFuZCB1Ym9vdC5oYXNoLgoKVGhh
bmtzIDopCgpSZWdhcmRzLApSYXBoYcOrbAoKClsxXSAKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5l
dC9idWlsZHJvb3QvY29tbWl0Lz9pZD1mMjFkYjJiZDgzYmYzMDczYTUwYjhiY2Q3OWFmNmU3YWVk
NmZiMDAwClsyXSAKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9p
ZD05ODAyZmEwYjViYWEwYjY4ZmJjNjdiYzA3YTJlNDIwNjAxMmY3MzA2Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
