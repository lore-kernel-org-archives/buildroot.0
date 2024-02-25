Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996F6C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00F38404C6;
	Sun, 25 Feb 2024 16:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HynkSooq-U-E; Sun, 25 Feb 2024 16:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB9D40694
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB9D40694;
	Sun, 25 Feb 2024 16:43:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 056491BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 16:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3BB240112
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 16:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZsJruvFCACRG for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 16:43:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74A06400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74A06400CB
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74A06400CB
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 16:43:42 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412a4055897so2631045e9.3
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 08:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708879420; x=1709484220;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HuBo6fMz4gBWevIxSYlaifkqZxjPasocBqI+EpYDhMY=;
 b=CbdCv/87RxZ/WzOSiZozuvVsgVd4EXNwRVihUdrlNJ3nTD3gjccUqAcoaGZqHE9VNK
 EYUOlhzhozFCSRDJqB+LzH1YXswLlWO0HJGPZocvkNlSk+gjy4Ex7qcTQDr/o2JF4QGO
 s9V4FunH7RwOpUkMiBgPPJZnrU8GSNcdwS39m3O5La0Z+9Zf+S13k1hKs6++ByWiAonu
 hKFmIzUFC5dN8tEr1Eh6lLsonBwImBZDw5+AUpWO0GTOBr1nLwiH07pXr8TptlbhpUrA
 NNymB74LcwKksY04utQQ+AqlXSFFb2/4GCDtqsG37XrNF2x6OPB+g6zaARyORpLr81a/
 g6/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgjiaQnj/vJYXA5NBhXbf1viC4r/WoOD6g3q7cVeo24HjhR+2TpKnHuVyt14fmH4FjMBGII0kbol6wYwOfaM42LtTvPPkIbg==
X-Gm-Message-State: AOJu0YxaDvDhb/2tE3kD9MLGldcKPhNVk/Cp6/Mh9ZcBBoqrlciLYIKj
 IhxA3i8/VfswkMallpKxTxxoj35WbRyqHf5N6N0ADhl7zGmO3nnXv3kQggjD0cw=
X-Google-Smtp-Source: AGHT+IGYcsxwLOAGmPaf+RMRWT4E9TuMw3BH2soM6sus0VIortSGvt8eCKuBdGthxcDw9elvn40ltA==
X-Received: by 2002:a05:600c:1910:b0:412:a4b2:e5c6 with SMTP id
 j16-20020a05600c191000b00412a4b2e5c6mr356951wmq.29.1708879420255; 
 Sun, 25 Feb 2024 08:43:40 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c280400b0040ecdd672fasm5512372wmb.13.2024.02.25.08.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Feb 2024 08:43:40 -0800 (PST)
Message-ID: <383a2418-fa99-44f6-935c-8423cf9c22b3@smile.fr>
Date: Sun, 25 Feb 2024 17:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
 <20240224205654.1546744-17-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240224205654.1546744-17-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708879420; x=1709484220;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HuBo6fMz4gBWevIxSYlaifkqZxjPasocBqI+EpYDhMY=;
 b=yCpGdiLkyKQAwWscBVO4XQUd6GxSkYjVy/chV2WaKerv1WlIsn34cASRFEGyfhFUcd
 S9wLAb8FZMLBImhLF7EuIFGNkpgEFbbrf122OY4XosKaQ2YVkwgp3PnOOITMAiTep8Gh
 n1qKoE9kxiy3lF0cBMJbstSSYBo2eOTDioaUV9LyypNFVCUCc3g5a0YYoPCpklD/ITUF
 3eySwSghJ2/Rv8cza9GX+uY03rC9RV6Zpf84PPWLlaQO0BLlT+rk4cDnMcD8ge8AgZ9X
 KjF+B5je7W/aqvgGABF82h/WyamV0mMwukvFQrb2NJXu4ScyChPRG2ZqNEvSIc1N2Svo
 ELPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=yCpGdiLk
Subject: Re: [Buildroot] [PATCH v6 16/16] configs/ti_am62x_sk_defconfig:
 bump Linux version to 6.6.17
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAyNC8wMi8yMDI0IMOgIDIxOjU2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRlc3RlZCBvbiBTSy1BTTYyQi1QMS4KCllvdSBjb3VsZCBjb21wbGV0ZSB5b3Vy
IHNlcmllcyBieSB1cGRhdGluZyB0aGUgdGlfYW02NHhfc2tfZGVmY29uZmlnIHRvbyBhbmQKcmVt
b3ZlIHRpLWszLWltYWdlLWdlbi4KCkV4Y2VwdCBmb3IgbWlub3IgaW1wcm92ZW1lbnQsIHRoaXMg
c2VyaWVzIGlzIG9rIGZvciBtZS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNv
bT4KPiAKPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHY1Ogo+IC0gQnVtcCB0byA2LjYuMTcgZnJvbSA2
LjYuMQo+IC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIEFk
ZCBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNiB0byB0aV9hbTYyeF9z
a19kZWZjb25maWcuCj4gCj4gbm8gY2hhbmdlcyBzaW5jZSB2MQo+IAo+ICBjb25maWdzL3RpX2Ft
NjJ4X3NrX2RlZmNvbmZpZyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL3RpX2FtNjJ4X3Nr
X2RlZmNvbmZpZyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gaW5kZXggNDg0Zjlm
ZWI4YzYxLi44Yzk2MmI0YTk0OTQgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy90aV9hbTYyeF9za19k
ZWZjb25maWcKPiArKysgYi9jb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZwo+IEBAIC0xLDEx
ICsxLDExIEBACj4gIEJSMl9hYXJjaDY0PXkKPiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFE
RVJTX0NVU1RPTV82XzQ9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9N
XzZfNj15Cj4gIEJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3RpL2FtNjJ4LXNr
L3Bvc3QtYnVpbGQuc2giCj4gIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3Rp
L2FtNjJ4LXNrL3Bvc3QtaW1hZ2Uuc2giCj4gIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0i
LWMgdHR5UzIsMTE1MjAwbjggLXIgL2Rldi9tbWNibGsxcDIgLXggZWFybHljb249bnMxNjU1MGEs
bW1pbzMyLDB4MDI4MDAwMDAiCj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+ICBCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNi40LjE2Igo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2
LjYuMTciCj4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+ICBC
UjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVf
RFRTX05BTUU9InRpL2szLWFtNjI1LXNrIgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
