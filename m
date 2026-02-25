Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21DFF4BB9E
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C8441E5A;
	Wed, 25 Feb 2026 10:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J__RMrnOFfXo; Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3A0341DD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772016943;
	bh=h3FNtgppb4nEQamqetGd/ZIKbfa5u1yl5m7YV5Ugd9Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i+ybyh1P4O3N/wAeRkYXbKAK6unni1mz3S/kKcAfY7JcbgSfO5uJ19XinvQtEhPBN
	 lgMltFssrY4oHEQC2iPPYE6mKk4jTQps6c5ONAakyGVqAltnAkqakNhKFwXPzKDxNT
	 dUStqH8qRIDZB5VBRIFDaoja/DptZLWQUH8IUCN1N4YMgoykUVOrf4l47m4YFu6Mk2
	 fE2v5ysMLHLyJyZVZLoVqE6LHlXqAn6IFUyluCXpA9ru0ViFS3N+z4P4oSQtTp6cCu
	 OLzs9WoWWWnCYFHwDLFxapTEHIzz74CSNSfoCnO3oB4r+sU1MidDKe2D0BhO2MfSF2
	 xLQpJLtRr58fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3A0341DD4;
	Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 389771B8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E21241DD4
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1Rwe8OKrD6r for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 10:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BD5E40697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BD5E40697
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BD5E40697
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 10:55:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b8fb6ad3243so915281566b.1
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 02:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772016939; x=1772621739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTUX/jB7W9yFCSb10nD0E95oBqSsVefal0d3uR0KLnI=;
 b=u0EgqOcZ0OiPQp7h5Uov3w6Tjycd/J2aehAvwIgkHgQttXuLPsQpLXVd6vBZ1tRrV6
 vyNW2NPICdA2gTP4QPScEm41+CoaK/1lRO4jz5c1KGpVGylASyl6XBppZJWWESvEovI1
 QiigYQHNWWxxc5TXnxTcO01FEejTxfoap8MBd+E7i3+SYzVB1WNFt6EbJeJ9J+tIFdyj
 RbzMvou8q6NguU3eBi99pDMZkddzbMjvr1pDvCWag2K/qtZLDWocoIa8xkAriePxjkJD
 VwI7ECD3yVsUJlDykY7I6ZwbeoTeJrLgo0mw4POsTgLuB/UbiqAZbN1b7KBEszYN+5jV
 EuTg==
X-Gm-Message-State: AOJu0Yw8ILTOvGZoN9ao1cYLG+5pTN6LSFx6TD59goia0KKEKWnZHVml
 vNQhyZykFjvbIcy8wclRwMjv42i9PlpOszcnoe2tLQE2yj/NmNSCmA1KvKgZCksEcQizu59lrIT
 ytFf8
X-Gm-Gg: ATEYQzyBdCxgB/4m0chQuU9zJvR1AjLMtNOI6zqCuSvzq/9wgkxq178uPFfBxqO2FaF
 8Zmk4nBb9XYSWLqyQNzF2WuG0PI4cLBBsaCJas4v2RlUksAujTyTAV2Z8ZEbTJoHwiCqaAjerJQ
 y4l1nRFLng3tw+nJbBF05mfqF6RPBBH+RnHV19V5vKgvsi2Qw9enKizm9LKE+HGZVwDqY/4LhCs
 60drIY0nx1KpBUS+1SHJcDVUAlXXJGq4hx8B8Uhn4wN/OdUYwYHKYAuOZOSLgY24vIONcC/upCV
 eOxqwDMI3dais7Dn0XG6hKvTFgB5h+xLGKmBFAgyewANv/wMEmicfXIqRUO71NJ9XMBq1mAFTr4
 8F/oANT66eYrYNT6B+Wi0HseCZxNs6Lj+tsbv+QeEVXnW3HQxRC4iZkkUfz3F4D/M+rq6zbXcnh
 dYMWJR4SzFZ6M+19k/XmHPhg1fynoT9FAPjA==
X-Received: by 2002:a17:907:6e87:b0:b93:335f:18cf with SMTP id
 a640c23a62f3a-b93335f1ad8mr348861366b.46.1772016938840; 
 Wed, 25 Feb 2026 02:55:38 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b90bfd4e95csm174864366b.41.2026.02.25.02.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 02:55:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7B2C35F834;
 Wed, 25 Feb 2026 10:55:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 10:55:29 +0000
Message-ID: <20260225105537.1420002-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772016939; x=1772621739; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JTUX/jB7W9yFCSb10nD0E95oBqSsVefal0d3uR0KLnI=;
 b=F1NLdU2ZBAcqjHFj63T/Ll0d0sSQlMLYs9/VmrAAZZnanbYozA+0HE9FXlVR15EUi5
 7wSa5IrmD2M80oA+L496pd0kuMGah4lCJ6p3BKJOrxLsYqsLU9CcUGmT+eX+UcjGwbD4
 qnYasyESEf7bW2EJ7/6iAdKKYyuzCC8Yc4xxJfle4D1dnuow/v1CSCTOaEmwZDYaQRQ9
 HWV+lXL4j/4yzy2pOQxSkevzBm70dqvbs/iPCnyGYqZavFsK1Ev/IrOIEuUT5TWEtxRq
 frz/3jTkU5Hr4jpPt+5Zg/TLDCDHnRtUDZGKmZWObNTkyO2IwhT6k1fZT1WBc3sVi3Si
 kwRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=F1NLdU2Z
Subject: [Buildroot] [PATCH v6 0/6] kvm-unit-tests: update deps and fine
 tune qemu
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

VGhlIGt2bS11bml0LXRlc3RzIHJlY2lwZSBpcyBhIGxpdHRsZSBvdXQgb2YgZGF0ZSB3aXRoIHRo
ZQpkZXBlbmRlbmNpZXMgaXQgbmVlZHMuIFdpdGggdGhhdCBhbmQgc29tZSB0d2Vha2luZyBvZiB0
aGUgb2YgcHJvY2Vzc29yCmRlcGVuZGVuY2llcyB3ZSBjYW4gbm93IGJ1aWxkIGt2bS11bml0LXRl
c3RzIGZvciBhcm02NC4KCkFzIGt2bS11bml0LXRlc3RzIG5lZWQgdGhlIGxpYmMgdXRpbHMgYW5k
IEkgdXNlIGV4dGVybmFsIHRvb2xpbmcgSQphZGRlZCBzdXBwb3J0IGZvciB0aGF0LgoKT24gdGhl
IHdheSBJJ3ZlIGFkZGVkIHNvbWUgbmV3IGNvbmZpZyBvcHRpb25zIGZvciBRRU1VIHNvIHlvdSBj
YW4ganVzdApzZWxlY3QgeW91ciBuYXRpdmUsIGt2bS1vbmx5IFFFTVUgYnVpbGQuCgpGb3IgQXJt
IHdlIGNhbiBhbHNvIHJ1biB3aXRoIGt2bXRvb2wgc28gSSd2ZSBhZGRlZCBhbiBvcHRpb24gdG8g
ZW5hYmxlCnRoYXQuCgpGaW5hbGx5IEkndmUgYWRkZWQgYSBzaW1wbGUgdGVzdCBjYXNlIGZvciB0
aGUga3ZtLXVuaXQtdGVzdHMgcGFja2FnZS4KClRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBhcmUgdW5y
ZXZpZXdlZDoKCiAgc3VwcG9ydC90ZXN0aW5nOiBhZGQgdGVzdCBmb3Iga3ZtLXVuaXQtdGVzdHMK
ICB0b29sY2hhaW4vZXh0ZXJuYWw6IGFsbG93IGluc3RhbGxpbmcgb2YgbGliYyB1dGlscwoKT3Ro
ZXJ3aXNlIEkgdGhpbmsgZXZlcnl0aGluZyBpcyBnb29kIHRvIGdvLgoKRm9yIHY2CiAgLSBzb21l
IHBhdGNoZXMgbWVyZ2VkCgpGb3IgdjUKICAtIG1vcmUgci1iIHRhZ3MKICAtIGFkZHJlc3NlZCBj
b21tZW50cyAoc2VlIGNvbW1pdHMpCgpGb3IgdjQKICAtIHJlLWJhc2UKICAtIHVwZGF0ZSBrdm0t
dW5pdC10ZXN0cyB0byB2MjAyNS0wNy0zMQoKRm9yIHYzCiAgLSBhZGQgci1iIHRhZ3MKICAtIHVw
ZGF0ZSBrdm0tdW5pdC10ZXN0cyB0byBjdXJyZW50IG1hc3RlcgogIC0gdXBkYXRlIGt2bXRvb2wK
ICAtIGVuYWJsZSBrdm10b29sIGFzIGFsdGVybmF0aXZlIHRvIFFFTVUKCkZvciB2MgogIC0gYWRk
cmVzc2VkIHJldmlldyBjb21tZW50cwogIC0gYWRkZWQgZXh0ZXJuYWwgbGliYyB1dGlsIHN1cHBv
cnQKICAtIGFkZGVkIHRlc3QgY2FzZQogIC0gcmFuIGFuZCBhZGRyZXNzZWQgbGludGVyIHdhcm5p
bmdzCgpBbGV4LgoKQWxleCBCZW5uw6llICg2KToKICB0b29sY2hhaW4vZXh0ZXJuYWw6IGFsbG93
IGluc3RhbGxpbmcgb2YgbGliYyB1dGlscwogIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHM6IHVwZGF0
ZSBkZXBlbmRlbmNpZXMKICBwYWNrYWdlL2t2bS11bml0LXRlc3RzOiBidW1wIHRvIHYyMDI1LTA3
LTMxCiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0czogaG9ub3VyIEJSMl9BUk02NF9QQUdFX1NJWkUK
ICBzdXBwb3J0L3Rlc3Rpbmc6IGFkZCB0ZXN0IGZvciBrdm0tdW5pdC10ZXN0cwogIHBhY2thZ2Uv
a3ZtLXVuaXQtdGVzdHM6IGFsbG93IGt2bXRvb2wgdG8gYmUgdXNlZAoKIGJvYXJkL3FlbXUvYWFy
Y2g2NC12aXJ0L2xpbnV4LmNvbmZpZyAgICAgICAgICB8ICAyICsKIHBhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluICAgICAgICAgICAgICB8IDI5ICsrKysrKysrKystLQogcGFja2FnZS9r
dm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoICAgIHwgIDIgKy0KIHBhY2thZ2Uva3Zt
LXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgICAgICB8IDIxICsrKysrKysrLQogc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9rdm0ucHkgICAgIHwgNDcgKysrKysrKysrKysr
KysrKysrKwogdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9Db25maWcuaW4gICAgICAgIHwg
IDcgKysrCiAuLi4vcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tayAgICAgICAgICAgICAgICAgfCAy
NCArKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3Rfa3ZtLnB5CgotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
