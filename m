Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C31C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F4B610A2
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 09:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87F4B610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DE6380DC6;
	Tue, 14 Sep 2021 09:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rty_3MKvorce; Tue, 14 Sep 2021 09:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E4680DB4;
	Tue, 14 Sep 2021 09:46:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93B1A1BF3EB
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9053080DB4
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 09:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNwTAedAlzMS for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 09:46:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D71980DB3
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 09:46:14 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id j12so22632385ljg.10
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpkwxLF1Rues/yub6836mmkfCe+MegKC9ULPlwGxons=;
 b=exfT2lzkb3r1gh5UZubRwcZ4fPGnpTQyeF6upUlbmJ0Y+deR/cFtfsTWvLiX93tq3c
 22ZjVLPBY6m2r5doZtzYv67d97TaDYg61/98P9Fy/pCH/dPSPbSIinyODmSXs27G2pdQ
 YFQpIoM/kMDr64/A1rw2tTvRkd1tOdSXAu0F/JPAEPGPaGZT+z/Sg+D1vGhEde9p38ZH
 tWgAQxt/IOwugrWkOWCE5oCVbYiBFU7FZ3XVBl1KTZ/yVCpDkQ/gx4PEWZPSWgsRZFTo
 8qSPaqdtbaGg8LSzznt7sRoGVaZT7T3CG/KwLQxg0XhmIVsrV8ohtcEZV8UFIqXJc2+T
 Px8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpkwxLF1Rues/yub6836mmkfCe+MegKC9ULPlwGxons=;
 b=ljQdbmw4s+iSvaGi0/dsHGKtcMhLNDGeMgil3SJpJhRnmXNxSyYuC6FY3SDnBuWf+M
 xG/FLhqrZCK8nxGBNSU0TCRBAo+kvpSKVZy58gJF8bnBuaBtX39aCWnll5LVhBHD51RR
 qcjmRrBULjz8dLBOhLZ6BxsXwaqqR0AzUSkCE39qNcmer9+9UOQkw2528G1nGe5HoyhT
 2wM+oEGYF8FygSl1TZR9ToqDlvb79rp5bhrzEwy1xcfZy1P6INJ3q4s23yZjzyhrfqBE
 f+Gs/3SUiah79X8nV6o8NdwjHD1E8eihD6hzWoBhL6zApA2MUqEfSyVZpO53wkTHEwyX
 ck3g==
X-Gm-Message-State: AOAM532YHiSe3jUqY/yEwQBKaVqLiC3Zt2uft/4pBuOLODgJZjYF+tC+
 ldLqCij+fLXvShjnTk4Eb20xhl+pqz8ILglK
X-Google-Smtp-Source: ABdhPJxGb77G8310bAe9rmjw/Uh+cyHyIbAiJzqy+Q16mrlw74L4iGJLUTGLy/GDuKr/loYUXXAUpg==
X-Received: by 2002:a2e:a486:: with SMTP id h6mr14949121lji.208.1631612772423; 
 Tue, 14 Sep 2021 02:46:12 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id e19sm1276092ljl.47.2021.09.14.02.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 02:46:12 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 12:46:11 +0300
Message-Id: <20210914094611.1782735-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iptables: add init script
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

VGhpcyBwYXRjaCB3aWxsIGFkZCBhbiBpbml0IHNjcmlwdCB0aGF0IGFsbG93cwp0byBzZXQgYSBy
dWxlc2V0IGluIC9ldGMvaXB0YWJsZXMuY29uZiB0byBiZSBsb2FkZWQKb24gYm9vdCwgb3IgZmx1
c2hlZCBvbiBzdG9wLCBhcyB3ZWxsIGFzIGEgc2F2aW5nCmNvbW1hbmQgdG8gZ2VuZXJhdGUgYSBu
ZXcgZmlsZS4KClNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5l
bkB1bmlraWUuY29tPgotLS0KIHBhY2thZ2UvaXB0YWJsZXMvUzQxaXB0YWJsZXMgfCA1OCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvaXB0YWJsZXMvaXB0YWJs
ZXMubWsgfCAgNiArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lwdGFibGVzL1M0MWlwdGFibGVzCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9pcHRhYmxlcy9TNDFpcHRhYmxlcyBiL3BhY2thZ2UvaXB0YWJsZXMvUzQxaXB0YWJs
ZXMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uOTM5OThiNzhkZQotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvaXB0YWJsZXMvUzQxaXB0YWJsZXMKQEAgLTAsMCArMSw1
OCBAQAorIyEvYmluL3NoCisKK0RBRU1PTj0iaXB0YWJsZXMiCisKK0lQVEFCTEVTX0FSR1M9IiIK
Kworc3RhcnQoKSB7CisJcHJpbnRmICdTdGFydGluZyAlczogJyAiJERBRU1PTiIKKwlpcHRhYmxl
cy1yZXN0b3JlIDwgL2V0Yy9pcHRhYmxlcy5jb25mCisJc3RhdHVzPSQ/CisJaWYgWyAiJHN0YXR1
cyIgLWVxIDAgXTsgdGhlbgorCQllY2hvICJPSyIKKwllbHNlCisJCWVjaG8gIkZBSUwiCisJZmkK
KwlyZXR1cm4gIiRzdGF0dXMiCit9CisKK3N0b3AoKSB7CisJcHJpbnRmICdTdG9wcGluZyAlczog
JyAiJERBRU1PTiIKKwlpcHRhYmxlcyAtRgorCXN0YXR1cz0kPworCWlmIFsgIiRzdGF0dXMiIC1l
cSAwIF07IHRoZW4KKwkJZWNobyAiT0siCisJZWxzZQorCQllY2hvICJGQUlMIgorCWZpCisJcmV0
dXJuICIkc3RhdHVzIgorfQorCityZXN0YXJ0KCkgeworCXN0b3AKKwlzbGVlcCAxCisJc3RhcnQK
K30KKworc2F2ZSgpIHsKKwlwcmludGYgJ1NhdmluZyAlczogJyAiJERBRU1PTiIKKwlpcHRhYmxl
cy1zYXZlID4gL2V0Yy9pcHRhYmxlcy5jb25mCisJc3RhdHVzPSQ/CisJaWYgWyAiJHN0YXR1cyIg
LWVxIDAgXTsgdGhlbgorCQllY2hvICJPSyIKKwllbHNlCisJCWVjaG8gIkZBSUwiCisJZmkKKwly
ZXR1cm4gIiRzdGF0dXMiCit9CisKK2Nhc2UgIiQxIiBpbgorCXN0YXJ0fHN0b3B8cmVzdGFydHxz
YXZlKQorCQkiJDEiOzsKKwlyZWxvYWQpCisJCSMgUmVzdGFydCwgc2luY2UgdGhlcmUgaXMgbm8g
dHJ1ZSAicmVsb2FkIiBmZWF0dXJlLgorCQlyZXN0YXJ0OzsKKwkqKQorCQllY2hvICJVc2FnZTog
JDAge3N0YXJ0fHN0b3B8cmVzdGFydHxyZWxvYWR9IgorCQlleGl0IDEKK2VzYWMKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsgYi9wYWNrYWdlL2lwdGFibGVzL2lwdGFi
bGVzLm1rCmluZGV4IGRjMDE0NjY2MDcuLjI4MTFlNDFlN2MgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
aXB0YWJsZXMvaXB0YWJsZXMubWsKKysrIGIvcGFja2FnZS9pcHRhYmxlcy9pcHRhYmxlcy5tawpA
QCAtNTcsNCArNTcsMTAgQEAgZGVmaW5lIElQVEFCTEVTX0xJTlVYX0NPTkZJR19GSVhVUFMKIAkk
KGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORVRGSUxURVJfWFRBQkxFUykKIGVuZGVm
CiAKK2RlZmluZSBJUFRBQkxFU19JTlNUQUxMX0lOSVRfU1lTVgorCSQoSU5TVEFMTCkgLW0gMDc1
NSAtRCBwYWNrYWdlL2lwdGFibGVzL1M0MWlwdGFibGVzIFwKKwkJJChUQVJHRVRfRElSKS9ldGMv
aW5pdC5kL1M0MWlwdGFibGVzCisJdG91Y2ggJChERVNURElSKS9ldGMvaXB0YWJsZXMuY29uZgor
ZW5kZWYKKwogJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
