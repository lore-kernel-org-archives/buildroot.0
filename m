Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ACEC77B7F
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 10:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F3E80B01;
	Mon, 23 Jun 2025 10:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9t_x14vf6PL; Mon, 23 Jun 2025 10:17:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A9B380A73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A9B380A73;
	Mon, 23 Jun 2025 10:17:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FDCC154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 10:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 397AC40217
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 10:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BuJqljQwUc-h for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 10:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A840401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A840401F6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A840401F6
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 10:17:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ade58ef47c0so818944466b.1
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 03:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750673859; x=1751278659;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xY3zmV+VOEuK4+eLyspWyieJuh/QZTyA9uIDcwk7v58=;
 b=ejQBxQ597I9DgEeQyDmPja3NrZsaX9dwMVwXtDFff8/ZXK3FkyF9e1lJo3Aamv7LSl
 gwkW4yrJb0zd/3Hm+PgP1wIAapuLafP4SFJ9Mpu8d1GEGiNWxEWBlbHPdPHyvuSg2+iP
 bSpwRY1d/iV9c6iKKhIOFNPBkMuR3KIUP4Lv0dfRCXUaGAGt7Ygo781FdG6BMi9lOwXX
 o44Goa9eREQi/kdSDxu7xN69ZMir7w10l6hbZbtbRUVX2Fx262ln7r0zAYp0x23M7duY
 FqJBPPWiLewf9twgOP6CmdmrAJH60FDRpGWpIBRu0YfW+TxzxNByPKdVTe9F04eoGXui
 m/QQ==
X-Gm-Message-State: AOJu0Yw9Svjad9kO93yedIM9F+xQURcTEbYTu0HAEJTbY1lA+z8/X7aH
 oSFmwFco0UnH61LCf81xsxqycxG0bOtxTJMP7aqUJIFELBiJp+R+Q9XNibsCzEpfXyLra+ChR2Z
 dGbuB4dw=
X-Gm-Gg: ASbGncsxzdK7SVS1TxACC0c42nkwyaM0Sm4lx4NdbTOUGkuvnz8VZYjoOfQgbkOhCVu
 oEehXveregM9P3loipPstzBkyGCVEaLA7EOz3ICmraEZuF7vXeaZGHMRy0zhMN1qqi9sU4yBLnw
 OFKuBjLUVPKpO475JFUSP3fN1R58xF81waNcaL2ml/NO+5xzYBHeFoKdZKjXcZEZ3fiV+/Qx7aX
 KJSDFbwCXs3LpJ3i6DLfcCIjZoa4CzNEUdCKyhl1v9nR+fJfp9kiA8WZqfYBdc6K4Y681Xc+add
 LmrRG/O3gSc9bhq/umZUjm9Wi3t6EcLuqHHjd6SOdqihA6EiPzXtf+6RZnUPj6Q=
X-Google-Smtp-Source: AGHT+IGjidjjqyW4F+bUWraDoWCTZI4kJ1qvf7UTt9c7I80YuzRf7rntlzncS/GMN4op/iiwgs9aNw==
X-Received: by 2002:a17:907:1c27:b0:ad2:2fdb:b0ab with SMTP id
 a640c23a62f3a-ae05b03812dmr1011541166b.29.1750673859537; 
 Mon, 23 Jun 2025 03:17:39 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae05408302asm674131566b.85.2025.06.23.03.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 03:17:38 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CEE915F815;
 Mon, 23 Jun 2025 11:17:37 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <8d2c6354ff9cf8ce64e8753204aaabfb@free.fr> (Julien Olivain's
 message of "Sun, 22 Jun 2025 13:47:23 +0200")
References: <20250618142825.758131-1-alex.bennee@linaro.org>
 <20250618142825.758131-4-alex.bennee@linaro.org>
 <8d2c6354ff9cf8ce64e8753204aaabfb@free.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 23 Jun 2025 11:17:37 +0100
Message-ID: <87a55y3gou.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750673859; x=1751278659; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xY3zmV+VOEuK4+eLyspWyieJuh/QZTyA9uIDcwk7v58=;
 b=B5R563c66ze/ZZnIk9d8H2akScAKHWh28XYd2tLFWLJZzlD67b70HaG0XTbvP9MVpQ
 MpQNfLeJG73laZ4J+NBKzEYECB9Y0DumuXU0NurWGdKr86NlCWNA98qBmwWeBLixBjby
 hvOfPNE0m65KSbCxkA736EODYAn7CYhusEWkOf3se/vM1CV/UP+uOznMJPJUhGeJ+/eI
 D28FJBS94+6eDIFbZy4zhG4Ct+7TLMg/X3sIGdFQK3tRIIAfPPHkYD/T7ppdjwQseU5G
 wjs2EtrkLxnedFxuSe+qUj8cqBS72GW0lTAYtJwRoeJsLAo2h0zlBHTN8jBeNfPPtNBm
 Dufw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B5R563c6
Subject: Re: [Buildroot] [PATCH v7 3/4] package/vkmark: add vkmark
 benchmarking tool
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JpdGVzOgoKPiBIaSBBbGV4LAo+Cj4gT24g
MTgvMDYvMjAyNSAxNjoyOCwgQWxleCBCZW5uw6llIHdyb3RlOgo+PiBXZSBidWlsZCBmcm9tIGEg
cmVjZW50IEhFQUQgdG8gZW5zdXJlIHdlIGhhdmUgdGhlIGZpeGVzIHRvIGJldHRlcgo+PiBoYW5k
bGUgdGhlIG1pc3NpbmcgS0hSX2Rpc3BsYXkgZXh0ZW5zaW9uLgo+PiBTaWduZWQtb2ZmLWJ5OiBB
bGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4KPiBUaGlzIHBhdGNoIHN0aWxs
IGhhcyB0aGUgInZsLnhtbCIgaXNzdWUgcmVwb3J0ZWQgaW4gdGhlCj4gcHJldmlvdXMgdmVyc2lv
bi4gU2VlOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8zOWIxMjI1OGRjYjFh
Yzc3NjhkMDU3OWJiODA2NDdmMEBmcmVlLmZyLwoKVGhpcyB2ZXJzaW9uIGlzIGJhc2VkIG9uIHRo
ZSBjb21taXRzOgoKICBodHRwczovL2dpdGh1Yi5jb20vdmttYXJrL3ZrbWFyay9jb21taXQvMTAx
YmUzMGMxYTAzOWVhYjA4ODg2OTE5YTgwNjVkNzI4YjRiZDFmMAoKPgo+IFlvdSBjYW4gcmVwcm9k
dWNlIHRoZSBpc3N1ZSBieSBydW5uaW5nIHRoZSBydW50aW1lIHRlc3QgaW4gdGhlCj4gQnVpbGRy
b290IGRvY2tlciByZWZlcmVuY2UgaW1hZ2UuIEZvciBleGFtcGxlLCB1c2luZyB0aGUgY29tbWFu
ZDoKPgo+ICAgICB1dGlscy9kb2NrZXItcnVuIHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAo+
ICAgICAgICAgLWsgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciB0ZXN0cy5wYWNrYWdlLnRlc3Rfdmtt
YXJrCj4KPiBJIHNlZSB0aGF0IHRoZSBQUiBbMV0gaGFzIGJlZW4gbWVyZ2VkIHVwc3RyZWFtLiBT
byBtYXliZSB5b3UgY291bGQKPiBqdXN0IHVwZGF0ZSB0byBhIGNvbW1pdCBpbmNsdWRpbmcgdGhp
cyBmaXg/CgpWS01BUktfVkVSU0lPTiA9IDEwMWJlMzBjMWEwMzllYWIwODg4NjkxOWE4MDY1ZDcy
OGI0YmQxZjAKVktNQVJLX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHZrbWFyayx2a21hcmssJChWS01B
UktfVkVSU0lPTikpCgpEdXJpbmcgdGhlIHVwc3RyZWFtIHJldmlldyBJIHdhcyBhc2tlZCB0byBz
cXVhc2ggdGhlCm1lc29uLmdldF9leHRlcm5hbF9wcm9wZXJ0eSgnc3lzX3Jvb3QnLCAnJyksIGlu
dG8gdGhlIGpvaW5fcGF0aHMKc3RhdGVtZW50IGJ1dCBJIGRpZG4ndCB0aGluayB0aGF0IHdvdWxk
IGJyZWFrIGFueXRoaW5nLgoKTGV0cyBtZSBjaGVjayB3aGF0IGhhcHBlbmVkLgoKPgo+IEJlc3Qg
cmVnYXJkcywKPgo+IEp1bGllbi4KPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vdmttYXJrL3Zr
bWFyay9wdWxsLzc2CgotLSAKQWxleCBCZW5uw6llClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBA
IExpbmFybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
