Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF42C7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 10:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7069A4062B;
	Sat, 22 Apr 2023 10:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7069A4062B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJPq4XTh2HOf; Sat, 22 Apr 2023 10:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5382F40611;
	Sat, 22 Apr 2023 10:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5382F40611
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C74F1BF3A3
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 10:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3427C40333
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 10:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3427C40333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id st7qKvk09Lue for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 10:18:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F10401FF
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6F10401FF
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 10:18:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so16926475e9.0
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 03:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682158687; x=1684750687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0rAiF9ZOlbRYemySV1JZb/Br4zPpcn3NUWnNuy2VzFY=;
 b=G1rU1/1mpxLT9o92FTriaGWz5u7WYaAwcjeUONuJnow7LbS/PJvnxLvwxaotvmG5WL
 qW1vAoR1U/9qwqFWJb992k0YjqLC28fh5hfHhqVHR4FbzVCOTXM4I4w99zHK45uWTVnU
 4ao4DDIy+jmoADc6BDRtOUsuMjdAoQqj0qbPgk0O7p7nuWID8QZVGdPeFc0AJldxvawU
 fisyIj5cf3+QHV4GL3osS7X/PHaZB3hxHgeuROg7rRdpInQFA+BHBDmtC4u0fzI+7egP
 mzvGQSRjWIQztzijonAns1xkTc0HO4Yt+kr3fWA0ubdhRmZ9rDSG0+BjIa8lnTPu9ZHR
 amVQ==
X-Gm-Message-State: AAQBX9c7KWGm14Si4LeEXDpMlMdTg01jPS2J0WwfXQRwwA1Z+V6xBMcv
 aXIdzj5qnpkZLLhx3Nbk+XTYCw==
X-Google-Smtp-Source: AKy350aDQfA6lDLPwLJ1aIAI2FBc1vpsISXwOQIQUQ2ygbUUDfxlLi1w6sn4IO3NTniW529ycSIADA==
X-Received: by 2002:a1c:f418:0:b0:3f1:92aa:4e9b with SMTP id
 z24-20020a1cf418000000b003f192aa4e9bmr3445075wma.23.1682158686893; 
 Sat, 22 Apr 2023 03:18:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 y32-20020a05600c342000b003f173956a82sm10266945wmp.21.2023.04.22.03.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 03:18:06 -0700 (PDT)
Message-ID: <8f4ab4fc-528a-34dc-a03b-6673ce3c4d74@smile.fr>
Date: Sat, 22 Apr 2023 12:18:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230422090625.25006-1-ps.report@gmx.net>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230422090625.25006-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1682158687; x=1684750687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0rAiF9ZOlbRYemySV1JZb/Br4zPpcn3NUWnNuy2VzFY=;
 b=4HoywKmx+30aSfzEf/wGjhcAAk/b0B1rsGU6wTOyBwj2KQMn375KVvnPUJ4DkMi26r
 dbgXVJHm7l0ymambgoqvxkgCWwoxGhnhDx4ZQCssaorhoig2Fjpm+g9ZYwO+OLy2a4mx
 ZHE/EECnuC2YBwigJVDr7V4xsH3CWYoqOpd+EDWyPbK8pN1mu/e6KPbQEG6Owyfv24Yj
 bnyaPRicDahe007Hp+/7wViCq/hnIbDR8UpzL0dW6JNhCvHnN+SjecPsymT6coNFdT+l
 XUGKQk1z9czbe8K/3sCHkjJycOBnQnB+ZcyIuFPlkbpbEQDOrmYrodW1+VVTw1td/pzE
 2bfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=4HoywKmx
Subject: Re: [Buildroot] [PATCH v1 1/3] package/qemu: change project and
 download URL to https
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyMi8wNC8yMDIzIMOgIDExOjA2LCBQZXRlciBTZWlkZXJlciBhIMOp
Y3JpdMKgOgo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5l
dD4KCkFja2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAgcGFja2FnZS9xZW11L0NvbmZpZy5pbiB8IDIgKy0K
PiAgcGFja2FnZS9xZW11L3FlbXUubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVt
dS9Db25maWcuaW4gYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gaW5kZXggYTQ0NmMwY2Y2OC4u
MjM1ZmRiOWNlNiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluCj4gKysrIGIv
cGFja2FnZS9xZW11L0NvbmZpZy5pbgo+IEBAIC00Myw3ICs0Myw3IEBAIG1lbnVjb25maWcgQlIy
X1BBQ0tBR0VfUUVNVQo+ICAJICBMaW51eC4gV2hlbiB1c2luZyBLVk0sIFFFTVUgY2FuIHZpcnR1
YWxpemUgeDg2LCBzZXJ2ZXIgYW5kCj4gIAkgIGVtYmVkZGVkIFBvd2VyUEMsIGFuZCBTMzkwIGd1
ZXN0cy4KPiAgCj4gLQkgIGh0dHA6Ly9xZW11Lm9yZy8KPiArCSAgaHR0cHM6Ly93d3cucWVtdS5v
cmcvCj4gIAo+ICBpZiBCUjJfUEFDS0FHRV9RRU1VCj4gIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3FlbXUvcWVtdS5tayBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gaW5kZXggM2NiZWZmZTIxMy4u
M2Y1MWNiNTcyYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5tawo+ICsrKyBiL3Bh
Y2thZ2UvcWVtdS9xZW11Lm1rCj4gQEAgLTgsNyArOCw3IEBACj4gICMgbmVlZHMgdG8gYmUgdXBk
YXRlZC4KPiAgUUVNVV9WRVJTSU9OID0gNy4yLjAKPiAgUUVNVV9TT1VSQ0UgPSBxZW11LSQoUUVN
VV9WRVJTSU9OKS50YXIueHoKPiAtUUVNVV9TSVRFID0gaHR0cDovL2Rvd25sb2FkLnFlbXUub3Jn
Cj4gK1FFTVVfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcKPiAgUUVNVV9MSUNFTlNF
ID0gR1BMLTIuMCwgTEdQTC0yLjEsIE1JVCwgQlNELTMtQ2xhdXNlLCBCU0QtMi1DbGF1c2UsIE90
aGVycy9CU0QtMWMKPiAgUUVNVV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORyBDT1BZSU5HLkxJQgo+
ICAjIE5PVEU6IHRoZXJlIGlzIG5vIHRvcC1sZXZlbCBsaWNlbnNlIGZpbGUgZm9yIG5vbi0oTClH
UEwgbGljZW5zZXM7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
