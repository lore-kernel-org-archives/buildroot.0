Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D90C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BBF60F46
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1BBF60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C72682477;
	Fri, 12 Nov 2021 11:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m523t0Vj-axS; Fri, 12 Nov 2021 11:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E118246D;
	Fri, 12 Nov 2021 11:00:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 888FC1BF325
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72A6440596
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TiUyEy1eOvAy for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 11:00:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67D7340593
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:00:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso9493418wml.1
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 03:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YZKuoQ4Gk+45+NExJJ6INgkj2afiI/rcL0tE9eVAUT8=;
 b=c5zwpUX1wP7s/890dz3N05rMioOsrVJiz75D706uj8AfXFV74+JJYoDBypwRFYDItk
 o/dGS0vEsarqoci+34vhovAOUFiEZxhW/GiaTR5JJCOkqMjf9TY4t2JYbB+v9AzLsaHl
 h0Y/7fgWD+prY4VJPLHqtGl2FMSzVBDoOnmxY/pXkBGIu/xpvUDi/Uefud0oFxTH3ODq
 ucStDKj7OoagUleD8mUPBhB/HHxGHXTC4J//gCHt3CFgO8kHg8+tT/WFWno0uTIW9Yz4
 a79pfW41DyT4YBskCaOncrtIrgZqL3XbWXQm1PIjHvLenf/J2cigb2n7mZaPdm0A9RvS
 18AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZKuoQ4Gk+45+NExJJ6INgkj2afiI/rcL0tE9eVAUT8=;
 b=IrbwV/cxZjg5sIUoDEWh+AnVi6D+GvPLjBsC4jiPDVQ69G78cRvkrt3iF9XzbjlJmu
 YS6+6tPx+I88dQYROFnze6WGf9OMD/5W4MpvMpRFDwqqMQxZFHQc6kXugP41I2GHD+D3
 uuIC2dk1LHn++Tdjwz4XBWJDul5YmqWVIdIiYMFLMNWWBbpwKP+2R3m5KGSqbE4JAXnt
 jFoLA6cjnTYkw0hbb7sLOo6cFyS1HlRxynxj5eoec2hkPcRduR1R0YB/fgAqXScVMT90
 JjYPhVu0Y0erVykmbxCyx4PIu2NTgWv9oHvuy5tl48zFTx1hQkE4Vp1Vs2Gq+E6R1FNM
 atzg==
X-Gm-Message-State: AOAM532qohDatn8oHAUGaDrq4SWlLgKgT6zo4kml5FwJHoWFbjysqbXV
 0QAfUgtCzpPRiC1uo3Mp+TApfBqwN/M=
X-Google-Smtp-Source: ABdhPJxcB4IjUzBiPsGnZjSfrzYiWlFeuiBhUcX3biJNPCjrV6zxj4oqAOxHisGMj579asbFOaI90w==
X-Received: by 2002:a05:600c:1c20:: with SMTP id
 j32mr15642106wms.1.1636714812699; 
 Fri, 12 Nov 2021 03:00:12 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 8sm3748796wmg.24.2021.11.12.03.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:00:12 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 12:00:03 +0100
Message-Id: <20211112110007.787836-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112110007.787836-1-romain.naour@gmail.com>
References: <20211112110007.787836-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/6] support/testing: test_luvi: switch to armv5
 to boot with rng support enabled
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdGhlIGNvbW1pdCByZXBsYWNpbmcgbW9vbmppdCBieSBsdWFqaXQgWzFdIGx1dmkgZG9l
c24ndCB3b3JrIHdpdGhvdXQKcm5nIHN1cHBvcnQgZW5hYmxlZC4KClN3aXRjaCB0byBhcm12NSB0
byB1c2UgdmlydGlvLXJuZy1wY2kgb24gdGhlIHFlbXUgY29tbWFuZCBsaW5lIFsyXS4KClsxXSA5
NDUwYjUzYzhlMDZmMWI1YTc1ODQwYjgyYzBmNDY2M2E1ZDc1YzQ1ClsyXSBodHRwczovL2dpdC5i
dWlsZHJvb3QubmV0L2J1aWxkcm9vdC90cmVlL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRv
ci5weT9oPTIwMjEuMDguMQoKU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAZ21haWwuY29tPgpDYzogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9j
a3M+Ci0tLQpsdXZpIHN0aWxsIGRvZXNuJ3Qgd29yayBzaW5jZSB0aGUgbHV2IHN0YXRpYyBsaW5r
aW5nIGRvZXNuJ3Qgc2VlbXMgdG8Kd29yayBhbnltb3JlLgooc2VlIGh0dHBzOi8vZ2l0aHViLmNv
bS9sdXZpdC9sdXZpL2NvbW1pdC9hOWRjOGRhZTJlYjY5ZDRhNzU0YTBjZjVjMDg2MjJkNzBmNmI3
MDY3KQoKICMgbHV2aSAtdgoKW3N0cmluZyAicmV0dXJuIHJlcXVpcmUoJ2luaXQnKSguLi4pIl06
MTogbW9kdWxlICdpbml0JyBub3QgZm91bmQ6CgoJbm8gZmllbGQgcGFja2FnZS5wcmVsb2FkWydp
bml0J10KCW5vIGZpbGUgJy4vaW5pdC5sdWEnCglubyBmaWxlICcvdXNyL3NoYXJlL2x1YWppdC0y
LjEuMC1iZXRhMy9pbml0Lmx1YScKCW5vIGZpbGUgJy91c3IvbG9jYWwvc2hhcmUvbHVhLzUuMS9p
bml0Lmx1YScKCW5vIGZpbGUgJy91c3IvbG9jYWwvc2hhcmUvbHVhLzUuMS9pbml0L2luaXQubHVh
JwoJbm8gZmlsZSAnL3Vzci9zaGFyZS9sdWEvNS4xL2luaXQubHVhJwoJbm8gZmlsZSAnL3Vzci9z
aGFyZS9sdWEvNS4xL2luaXQvaW5pdC5sdWEnCglubyBmaWxlICcuL2luaXQuc28nCglubyBmaWxl
ICcvdXNyL2xvY2FsL2xpYi9sdWEvNS4xL2luaXQuc28nCglubyBmaWxlICcvdXNyL2xpYi9sdWEv
NS4xL2luaXQuc28nCglubyBmaWxlICcvdXNyL2xvY2FsL2xpYi9sdWEvNS4xL2xvYWRhbGwuc28n
CgpzdGFjayB0cmFjZWJhY2s6CglbQ106IGluIGZ1bmN0aW9uICdyZXF1aXJlJwoJW3N0cmluZyAi
cmV0dXJuIHJlcXVpcmUoJ2luaXQnKSguLi4pIl06MTogaW4gbWFpbiBjaHVuawoKbHV2aSBub3cg
dHJ5IHRvIGxvYWQgaW5pdC5sdWEgc2NyaXB0OgpodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2
aS9ibG9iL3YyLjEyLjAvc3JjL21haW4uYyNMMTc2CgpSZXZlcnRpbmcgdG8gbW9vbmppdCBmaXhl
cyB0aGUgaXNzdWUuCi0tLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sdXZp
LnB5IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sdXZpLnB5
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9sdXZpLnB5CmluZGV4IGE4NWE2
ZjRkMjcuLmViMTVhZDMxYjUgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfbHV2aS5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X2x1dmkucHkKQEAgLTE3LDcgKzE3LDcgQEAgY2xhc3MgVGVzdEx1dmkoaW5mcmEuYmFzZXRlc3Qu
QlJUZXN0KToKIAogICAgIGRlZiBsb2dpbihzZWxmKToKICAgICAgICAgY3Bpb19maWxlID0gb3Mu
cGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQotICAgICAg
ICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYXJtdjciLAorICAgICAgICBzZWxmLmVtdWxhdG9y
LmJvb3QoYXJjaD0iYXJtdjUiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPSJi
dWlsdGluIiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItaW5pdHJkIiwg
Y3Bpb19maWxlXSkKICAgICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCi0tIAoyLjMxLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
