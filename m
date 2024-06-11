Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE61CC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 17:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 047EC60860;
	Tue, 11 Jun 2024 17:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icP-bn6Yiyxu; Tue, 11 Jun 2024 17:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B559608A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B559608A6;
	Tue, 11 Jun 2024 17:17:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51C421BF38A
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 17:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FA3360814
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 17:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-DIhkqWxEhM for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 17:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 207836087D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 207836087D
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 207836087D
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 17:17:20 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57c831b6085so1651941a12.1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 10:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718126239; x=1718731039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhw3mx+/LlBXAWazzZ+eHjqU6wffSG8VI90kqQgyKUQ=;
 b=H8Y5YQ59T/5NWWddvJ/IEVfq5yyt2wxar0sou9eBdIDK69JplU+e5nbYpZcSqErbd2
 rWdvFvdSRYRMmJubZkYMunqhKJO4qPcp1ClGGj2mNQQMO6N9nqIOMp+j5SqlLlFK53Sn
 qVbn4kHjGeGaXnz9NruL5SUbh4ggiN3C8n2pZQEayacRqeunFknvthu14S+khrhmj5fw
 Pi6m+5Ek2WB3WF7HtMeBxw6iatXWl4PM0PHQpHGalwb5LdsIWNiXfXh84RBvtJdTrYa/
 2lSEo9lGPKZetywM0ffI6ep1iX5DYM1+y0jqlfnoasG1DExqDXdnmUkkUzhn4A/OK4p8
 wMsQ==
X-Gm-Message-State: AOJu0Yw+wgUlU5kgiqeGgG/PGiRobyedwOpcvllDptvTeX75x4pZ+TTj
 x/Wm/XhphULJXn+dzVM9s477qrgVUkVjuNS9gjEiertKBBe2s38Pl8/HuMgBW6ldG3hPkTNSmjc
 d
X-Google-Smtp-Source: AGHT+IF3a0SDzLCeXRhWO5+0+WvYIAG3PwYnbN7ERBTxD+Sxlgo0m0582yxnpSmRvu171zctFtU/GQ==
X-Received: by 2002:a50:c353:0:b0:57c:6ade:d8f5 with SMTP id
 4fb4d7f45d1cf-57c6adedb68mr7957160a12.21.1718126238559; 
 Tue, 11 Jun 2024 10:17:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6e89b5ee63sm591960466b.122.2024.06.11.10.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 10:17:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 19:17:14 +0200
Message-ID: <20240611171714.3233115-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611171714.3233115-1-dario.binacchi@amarulasolutions.com>
References: <20240611171714.3233115-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718126239; x=1718731039;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhw3mx+/LlBXAWazzZ+eHjqU6wffSG8VI90kqQgyKUQ=;
 b=H0IWmkq/Kt81E5P/AmSih2hz0l0JNDRryhBqF5oKIG8wMcHKeBU3mC860+TTpGc+ZU
 CiijapmrLR+67XoTcE1p8463VMVFwgPjeRwg/mpTLtf7U9ZtCWDBgjRnoZ4GVLTujLqp
 BP+P1ft9Dgc8XU3D3cBGuXRp886St9I3o9jXg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=H0IWmkq/
Subject: [Buildroot] [PATCH 2/2] package/snappy: fix compilation error
 raised by vqtbl1q_u8 instruction
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhY2thZ2UgY29tcGlsYXRpb24gZm9yIHRoZSByYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29u
ZmlnIHJhaXNlcyB0aGUKZm9sbG93aW5nIGVycm9yOgoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGJ1
aWxkcm9vdC9vdXRwdXQvYnVpbGQvc25hcHB5LTEuMi4xL3NuYXBweS5jYzoyOToKYnVpbGRyb290
L291dHB1dC9idWlsZC9zbmFwcHktMS4yLjEvc25hcHB5LWludGVybmFsLmg6IEluIGZ1bmN0aW9u
IOKAmHNuYXBweTo6aW50ZXJuYWw6OlYxMjggc25hcHB5OjppbnRlcm5hbDo6VjEyOF9TaHVmZmxl
KFYxMjgsIFYxMjgp4oCZOgpidWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3NuYXBweS0xLjIuMS9zbmFw
cHktaW50ZXJuYWwuaDoxMDk6MTA6IGVycm9yOiDigJh2cXRibDFxX3U44oCZIHdhcyBub3QgZGVj
bGFyZWQgaW4gdGhpcyBzY29wZTsgZGlkIHlvdSBtZWFuIOKAmHZ0YmwxX3U44oCZPwogIDEwOSB8
ICAgcmV0dXJuIHZxdGJsMXFfdTgoaW5wdXQsIHNodWZmbGVfbWFzayk7CiAgICAgIHwgICAgICAg
ICAgXn5+fn5+fn5+fgogICAgICB8ICAgICAgICAgIHZ0YmwxX3U4Cm1ha2VbNF06ICoqKiBbQ01h
a2VGaWxlcy9zbmFwcHkuZGlyL2J1aWxkLm1ha2U6MTE4OiBDTWFrZUZpbGVzL3NuYXBweS5kaXIv
c25hcHB5LmNjLm9dIEVycm9yIDEKClRoZSBhZGRlZCBwYXRjaCBmaXhlcyB0aGUgZXJyb3IuCgpT
aWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0
aW9ucy5jb20+Ci0tLQogLi4uZXJyb3ItcmFpc2VkLWJ5LXZxdGJsMXFfdTgtaW5zdHJ1Y3RpLnBh
dGNoIHwgNTIgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NuYXBweS8wMDAxLUZpeC1jb21waWxh
dGlvbi1lcnJvci1yYWlzZWQtYnktdnF0YmwxcV91OC1pbnN0cnVjdGkucGF0Y2gKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3NuYXBweS8wMDAxLUZpeC1jb21waWxhdGlvbi1lcnJvci1yYWlzZWQtYnkt
dnF0YmwxcV91OC1pbnN0cnVjdGkucGF0Y2ggYi9wYWNrYWdlL3NuYXBweS8wMDAxLUZpeC1jb21w
aWxhdGlvbi1lcnJvci1yYWlzZWQtYnktdnF0YmwxcV91OC1pbnN0cnVjdGkucGF0Y2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iMTBlYTdlY2RmYmUKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL3NuYXBweS8wMDAxLUZpeC1jb21waWxhdGlvbi1lcnJvci1yYWlz
ZWQtYnktdnF0YmwxcV91OC1pbnN0cnVjdGkucGF0Y2gKQEAgLTAsMCArMSw1MiBAQAorRnJvbSAy
ODRkNWE2ZjI2N2Q0OTYyYjJiODg1NDBmMjE4YzEwNzQwYTZjMDUzIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgorRGF0ZTogU2F0LCA4IEp1biAyMDI0IDE4OjQyOjE2ICswMjAwCitTdWJqZWN0
OiBbUEFUQ0hdIEZpeCBjb21waWxhdGlvbiBlcnJvciByYWlzZWQgYnkgdnF0YmwxcV91OCBpbnN0
cnVjdGlvbgorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitUaGUgY29tcGls
YXRpb24gaW4gQnVpbGRyb290IGZvciB0aGUgcmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZwor
Y29uZmlndXJhdGlvbjoKKworbWFrZSByYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29uZmlnCittYWtl
CisKK3JhaXNlcyB0aGUgZm9sbG93aW5nIGVycm9yOgorCitJbiBmaWxlIGluY2x1ZGVkIGZyb20g
YnVpbGRyb290L291dHB1dC9idWlsZC9zbmFwcHktMS4yLjEvc25hcHB5LmNjOjI5OgorYnVpbGRy
b290L291dHB1dC9idWlsZC9zbmFwcHktMS4yLjEvc25hcHB5LWludGVybmFsLmg6IEluIGZ1bmN0
aW9uIOKAmHNuYXBweTo6aW50ZXJuYWw6OlYxMjggc25hcHB5OjppbnRlcm5hbDo6VjEyOF9TaHVm
ZmxlKFYxMjgsIFYxMjgp4oCZOgorYnVpbGRyb290L291dHB1dC9idWlsZC9zbmFwcHktMS4yLjEv
c25hcHB5LWludGVybmFsLmg6MTA5OjEwOiBlcnJvcjog4oCYdnF0YmwxcV91OOKAmSB3YXMgbm90
IGRlY2xhcmVkIGluIHRoaXMgc2NvcGU7IGRpZCB5b3UgbWVhbiDigJh2dGJsMV91OOKAmT8KKyAg
MTA5IHwgICByZXR1cm4gdnF0YmwxcV91OChpbnB1dCwgc2h1ZmZsZV9tYXNrKTsKKyAgICAgIHwg
ICAgICAgICAgXn5+fn5+fn5+fgorICAgICAgfCAgICAgICAgICB2dGJsMV91OAorbWFrZVs0XTog
KioqIFtDTWFrZUZpbGVzL3NuYXBweS5kaXIvYnVpbGQubWFrZToxMTg6IENNYWtlRmlsZXMvc25h
cHB5LmRpci9zbmFwcHkuY2Mub10gRXJyb3IgMQorCitBcyByZXBvcnRlZCBieSBbMV0sIHRoZSB2
cXRibDFxX3U4IGluc3RydWN0aW9uIGlzIHN1cHBvcnRlZCBieSBBNjQKK2FyY2hpdGVjdHVyZXMu
IEZvciB0aGlzIHJlYXNvbiwgdGhlIHBhdGNoIGVuYWJsZXMgdGhlIHVzZSBvZiB0aGUKK2luc3Ry
dWN0aW9uIG9ubHkgZm9yIE5FT04gb2Ygc3VjaCBhcmNoaXRlY3R1cmUuCisKK1sxXSBodHRwczov
L2RldmVsb3Blci5hcm0uY29tL2FyY2hpdGVjdHVyZXMvaW5zdHJ1Y3Rpb24tc2V0cy9pbnRyaW5z
aWNzL3ZxdGJsMXFfdTgKKworU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNv
bS9nb29nbGUvc25hcHB5L3B1bGwvMTg1CistLS0KKyBzbmFwcHktaW50ZXJuYWwuaCB8IDIgKy0K
KyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAt
LWdpdCBhL3NuYXBweS1pbnRlcm5hbC5oIGIvc25hcHB5LWludGVybmFsLmgKK2luZGV4IGFlNzgy
NDdkYmJjOS4uMjU2ZDMyMzQ0ZDFhIDEwMDY0NAorLS0tIGEvc25hcHB5LWludGVybmFsLmgKKysr
KyBiL3NuYXBweS1pbnRlcm5hbC5oCitAQCAtNDYsNyArNDYsNyBAQAorICNpbmNsdWRlIDxhcm1f
bmVvbi5oPgorICNlbmRpZgorIAorLSNpZiBTTkFQUFlfSEFWRV9TU1NFMyB8fCBTTkFQUFlfSEFW
RV9ORU9OCisrI2lmIFNOQVBQWV9IQVZFX1NTU0UzIHx8IChTTkFQUFlfSEFWRV9ORU9OICYmIGRl
ZmluZWQoX19hYXJjaDY0X18pKQorICNkZWZpbmUgU05BUFBZX0hBVkVfVkVDVE9SX0JZVEVfU0hV
RkZMRSAxCisgI2Vsc2UKKyAjZGVmaW5lIFNOQVBQWV9IQVZFX1ZFQ1RPUl9CWVRFX1NIVUZGTEUg
MAorLS0gCisyLjQzLjAKKwotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
