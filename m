Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A291C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 13:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D86260BB2;
	Thu, 22 Aug 2024 13:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7V5OOmD0IxW; Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1B960641
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1B960641;
	Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD2411BF3DF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA0AB817BA
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTMhBFNpXY1w for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 13:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3F6C817AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F6C817AC
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3F6C817AC
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:02:25 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5a108354819so1245588a12.0
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 06:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724331743; x=1724936543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WNhAnnMGUyhkVzvHO2fstUWMgB4Kzvx37m21AwYXEKQ=;
 b=FH34Q0J59xUfsomUYBek7U1dVdDo0KbUcCS0FJi/QK/5Cx3x1L2JRMG8FCejt4JLDw
 Jc0ESPxL8KWP1Nh5gzltNWEZFddbqkcMTKetpUixAFMxSnZaEqievo0g/0TDm+rNhoKW
 igeEcxsPTFClXBqv5gofGfNkwM+Jh5YQSX3eI7G/JwTh15W5agyfaOpiNH/sXpBveJal
 NP4+NplO+V4l1x+6qKnPSmgLHiszRO+xuHqvhLWtzCNjc5S/VFSaypeaomeJ4VxYoAri
 bPwNrz/Ll/9DZyCA1dVl6v5nw0hrVM5xAAT9xv+h+19MgTL4Y1+v8Afbg1opewIQXKiY
 dyTw==
X-Gm-Message-State: AOJu0Yxau/CmM7Q9HnUTWIrrV7MIXe7u0P0M7KDBVuM5eR6C1Rizau40
 T8EkWPDBSBWhBRjoibSy6EnZiwjRqj4eBHxQIIlooRQ8TTSimpyS6TPIEX/Kggp6yDkcv3AZREB
 j
X-Google-Smtp-Source: AGHT+IG25O4hwfe+IpKY5LV03iNAz8PTzws+o50rK+KbtNysL7y7ycXLHO+k5LAkqLi1Yq8m6yBKQQ==
X-Received: by 2002:a05:6402:40cd:b0:5bb:8e10:176d with SMTP id
 4fb4d7f45d1cf-5c0792b16d2mr1174313a12.31.1724331742300; 
 Thu, 22 Aug 2024 06:02:22 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a4c5999sm883105a12.64.2024.08.22.06.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:02:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 816055F8D5;
 Thu, 22 Aug 2024 14:02:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:02:16 +0100
Message-Id: <20240822130220.4135741-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724331743; x=1724936543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WNhAnnMGUyhkVzvHO2fstUWMgB4Kzvx37m21AwYXEKQ=;
 b=CwFMJoGaOhIAFIS0FeoWCtmY3uYOJwCnFga0Mv77PQdC7IF81B2QILAKUNAznPaqLS
 UpkDcXeNCH6Du2UpWNvqZ1LVDQBITbmfzl7Aob7OsvRcbsrI2PkucU6LwHa53kTIFc8c
 ubGqIlvofwl0XAp74iUgGl7Y+mW/lXKbqhZpjMStpbGxRP/OxR0rbhv6+t6/iX3n4MuS
 eHwSBHedI/aOaCMsI972qMMX1sf1IS5Bog6kAWakL4NsrzMDCYJE5CoYzJsFnxTVg02p
 dupDKXWJi02vJ6eb0rnyh321uD9OinV9yPUHQw8+NuW7PQG+OH2uh+6mwdAor+6O8dQC
 8e7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CwFMJoGa
Subject: [Buildroot] [PATCH 0/4] Update Mesa and enable vkmark
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

VGhpcyBpcyBwYXJ0IG9mIGJ1aWxkaW5nIHRlc3QgaW1hZ2VzIGZvciB2aXJ0aW8tdnVsa2FuIHN1
cHBvcnQgaW4KUUVNVS4gV2UgbmVlZCB0byB1cGRhdGUgTWVzYSwgZW5hYmxlIHRoZSBWaXJ0SU8g
ZHJpdmVyIGFuZCBhZGQgdGhlCnZrbWFyayB0b29sLiBUaGVyZSBpcyBhbHNvIGEgc21hbGwgcGF0
Y2ggdG8gZW5zdXJlIHdlIGVuYWJsZSBhIGdldHR5Cm9uIHRoZSBjb25zb2xlIHNvIHdlIGNhbiBz
dGFydCB3ZXN0b24gYW5kIHNwYXduIHRoZSB2a21hcmsgYmluYXJ5LgpDdXJyZW50bHkgaXQgaXMg
bm90IGFibGUgdG8gcnVuIGRpcmVjdGx5IHdpdGggdGhlIERSTSBkZXZpY2UuCgpBbGV4IEJlbm7D
qWUgKDQpOgogIHBhY2thZ2UvbWVzYTNkOiBhZGQgb3B0aW9uIHRvIGVuYWJsZSBWSVJUSU8gdnVs
a2FuIGRyaXZlcgogIHBhY2thZ2UvdmttYXJrOiBhZGQgdm1rYXJrIGJlbmNobWFya2luZyB0b29s
CiAgYm9hcmQvcWVtdTogYWRkIHBvc3QtYnVpbGQgc2NyaXB0IHRvIGFhcmNoNjRfdmlydF9kZWZj
b25maWcKICBwYWNrYWdlL21lc2EzZDogYnVtcCB0byAyNC4yLjAKCiBib2FyZC9xZW11L3Bvc3Qt
YnVpbGQuc2ggICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKwogY29uZmlncy9xZW11X2Fh
cmNoNjRfdmlydF9kZWZjb25maWcgICAgICB8ICAxICsKIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1o
ZWFkZXJzLm1rIHwgIDIgKy0KIHBhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgfCAgNiArKysrCiBwYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCAgICAgICAgICAgICAgIHwg
IDUgKystCiBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgICAgICAgICAgICAgICAgIHwgIDQgKyst
CiBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW4gICAgICAgICAgICAgICAgIHwgMzkgKysrKysrKysr
KysrKysrKysrKysrKysrCiBwYWNrYWdlL3ZrbWFyay92a21hcmsuaGFzaCAgICAgICAgICAgICAg
IHwgIDMgKysKIHBhY2thZ2UvdmttYXJrL3ZrbWFyay5tayAgICAgICAgICAgICAgICAgfCAyOCAr
KysrKysrKysrKysrKysrKwogMTAgZmlsZXMgY2hhbmdlZCwgMTAwIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvcWVtdS9wb3N0LWJ1aWxkLnNo
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvQ29uZmlnLmluCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS92a21hcmsvdmttYXJrLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3ZrbWFyay92a21hcmsubWsKCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
