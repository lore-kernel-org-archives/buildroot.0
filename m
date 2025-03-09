Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87099C282D1
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 10:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCCF605EA;
	Sun,  9 Mar 2025 10:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jH4IcdNsOH1i; Sun,  9 Mar 2025 10:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F94605F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F94605F9;
	Sun,  9 Mar 2025 10:58:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEFCE1C1
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 10:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E139408D4
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 10:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDG1wOVmSJRA for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 10:58:35 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=gero.schwaericke@sevenlab.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BFC6E409E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFC6E409E7
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFC6E409E7
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 10:58:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac27cb35309so123825466b.2
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 03:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741517912; x=1742122712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O7MyRyUvLb/4jqmwwegiQodl7bIUm3CxoGvhUWV1fnY=;
 b=CQuYhekOzdDLnYV8dMZtC60/MdbhUXT21D3Dpbvfka/EuV+FPDk0bYJ+7RDv/aCG+N
 3PcjjhG1hF2nWVudXCPLfgxoRb82aCfxn0DMtsz+ImG9ZmridO1caa+/MCPeWBLNukJA
 ei5SQraAKLmr7qmkyhYJV0CejxephtJOj3Y7DKfiJvvypmEaqZOuy7VOnkAVoh3EvIvC
 Y7LgAaNkjWMsDo8hqFRxdbOaD7/BuGgzLH6/0v5/h22s/atcUh309/5uCWqSeNBNje7Z
 BXLdVlEHUD6xu9rkvhBKA4URvyrSy0gyRd7XYR5U8uD2UgBNZSZjdgjAZ5V7Li2ylts7
 D/Lg==
X-Gm-Message-State: AOJu0YwthUhol+9jmiIyIyy030nOoinMaDwKjaB93dLoteWHOjwAKa+N
 GPdyloy/NCX7wzmigHPBoaL8V2R93UkQdhsruJLBMW1aTGMtRvLIWudJRzQtcOM32T25rbL0QWI
 /
X-Gm-Gg: ASbGncsi8jE0h+/U6Qtnf6L+1PzI2VctTQs2AI+uYfYiyQB8xvkHSyeSu3P9IJ4zkLe
 CZiT/h7hPmOlZEuGT/VxrwQgfCQxiyDYIQ0zjrppdQeJG6kZDelrhF6KhBCxKLcXESEJojzCtYP
 HkfSb9XZCYgKs9sj+gojtdcTooPOT20J/41SmltqJDwDWfFMdSKkRaYCG6xClDKcjzUHyb9wLRS
 p3vHa/0d3RkHKcuONO5Nzv6wSA6vLrPTbI7QDKgsYkzWLweF9CYqCIisOjkbW2pWs/ttrN3pxbu
 2g2WBnuasQQD2Uresf3ONCKl18GnkrcyH3QmU3GDUbWGRNmRkjewfIw+Xz6bo7/A+3SfvARg0Dc
 =
X-Google-Smtp-Source: AGHT+IFgK40Pp3hEe+eyhaQAQFBo1RhAhkg2D26bk/nYAZMpC7Cw2L7wLExSewZ6XJV6Mr/R768tQQ==
X-Received: by 2002:a17:907:938a:b0:ac2:92df:fab3 with SMTP id
 a640c23a62f3a-ac292e003e5mr99826666b.16.1741517912449; 
 Sun, 09 Mar 2025 03:58:32 -0700 (PDT)
Received: from Theia.fritz.box ([2a02:8109:8ab2:a800:d63:2b93:3ed0:eeea])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23988b0b0sm579373866b.130.2025.03.09.03.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 03:58:32 -0700 (PDT)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Date: Sun,  9 Mar 2025 11:58:02 +0100
Message-ID: <20250309105806.157831-1-gero.schwaericke@sevenlab.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sevenlab-de.20230601.gappssmtp.com; s=20230601; t=1741517912; x=1742122712;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O7MyRyUvLb/4jqmwwegiQodl7bIUm3CxoGvhUWV1fnY=;
 b=uZ1xX/Ti7xmitzkU32E08dzqGnZawWhHq7HAYaUv0ViqTIYaRzdCPx35DkUgZcrywn
 jus/4ZpTMhUiE3wh83Upx/7+mQL+8tObxvmlhluVfJgk1IcyxnlsTzZo4IxpNQw7aGNJ
 gMWpcML9ca7mQdE1XPzHDMgZohgr122xf/5aUlWnF4Q/LYh02+phflFffTLDEOG0HCX8
 GgCDJUGy27X2Th0e+JW/sfBtU+7H1xA/EcNzPv02rgqR4aORKWTlE3xdXjTRPd+6zdHe
 4MqAXd2a6RXZOiMIeINALoCXeWbANone23xAWN1NHkzyPzZRjyXMzxOrXP7R0s9YODGp
 y1OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sevenlab.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sevenlab-de.20230601.gappssmtp.com
 header.i=@sevenlab-de.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uZ1xX/Ti
Subject: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32mp135f-dk:
 fix boot steps in readme
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

VGhlIGluc3RydWN0aW9ucyBpbiB0aGUgcmVhZG1lIHVzZSBpbmNvcnJlY3QgY29ubmVjdG9yIG5h
bWVzLgoKU2VlIGFsc28gdGhlIG9mZmljaWFsIGRldmtpdCBkb2N1bWVudGF0aW9uOgpodHRwczov
L3dpa2kuc3QuY29tL3N0bTMybXB1L3dpa2kvR2V0dGluZ19zdGFydGVkL1NUTTMyTVAxX2JvYXJk
cy9TVE0zMk1QMTM1eC1ESy9MZXQlMjdzX3N0YXJ0L1VucGFja190aGVfU1RNMzJNUDEzNXgtREtf
Ym9hcmQjT3V0LW9mLXRoZS1ib3hfa2l0CgpBbHNvIHRoZSBib2FyZCBkb2VzIG5vdCBzaG93IHRo
ZSBjb25zb2xlIG9uIHRoZSBzY3JlZW4uCgpUaGlzIG1heSBoYXZlIGJlZW4gYSBjb3B5ICYgcGFz
dGUgb3ZlcnNpZ2h0IGZyb20gdGhlIFNUTTMyTVAxNTcgcmVhZG1lLgoKU2lnbmVkLW9mZi1ieTog
R2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBzZXZlbmxhYi5kZT4KLS0tCiBib2Fy
ZC9zdG1pY3JvZWxlY3Ryb25pY3Mvc3RtMzJtcDEzNWYtZGsvcmVhZG1lLnR4dCB8IDkgKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2JvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMm1wMTM1Zi1kay9yZWFkbWUu
dHh0IGIvYm9hcmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAxMzVmLWRrL3JlYWRtZS50eHQK
aW5kZXggNDY4NzlmODhjZi4uNDQ0NzI4NDBiMyAxMDA2NDQKLS0tIGEvYm9hcmQvc3RtaWNyb2Vs
ZWN0cm9uaWNzL3N0bTMybXAxMzVmLWRrL3JlYWRtZS50eHQKKysrIGIvYm9hcmQvc3RtaWNyb2Vs
ZWN0cm9uaWNzL3N0bTMybXAxMzVmLWRrL3JlYWRtZS50eHQKQEAgLTI3LDEyICsyNywxMSBAQCBD
b3B5IHRoZSBib290YWJsZSAic2RjYXJkLmltZyIgb250byBhbiBtaWNyb1NEIGNhcmQgd2l0aCAi
ZGQiOgogQm9vdCB0aGUgYm9hcmQKID09PT09PT09PT09PT09CiAKLSAoMSkgSW5zZXJ0IHRoZSBt
aWNyb1NEIGNhcmQgaW4gY29ubmVjdG9yIENOMTUKKyAoMSkgSW5zZXJ0IHRoZSBtaWNyb1NEIGNh
cmQgaW4gY29ubmVjdG9yIENOMwogCi0gKDIpIFBsdWcgYSBtaWNyby1VU0IgY2FibGUgaW4gY29u
bmVjdG9yIENOMTEgYW5kIHJ1biB5b3VyIHNlcmlhbAorICgyKSBQbHVnIGEgbWljcm8tVVNCIGNh
YmxlIGluIGNvbm5lY3RvciBDTjEwIGFuZCBydW4geW91ciBzZXJpYWwKICAgICAgY29tbXVuaWNh
dGlvbiBwcm9ncmFtIG9uIC9kZXYvdHR5QUNNMC4KIAotICgzKSBQbHVnIGEgVVNCLUMgY2FibGUg
aW4gQ042IHRvIHBvd2VyLXVwIHRoZSBib2FyZC4KKyAoMykgUGx1ZyBhIFVTQi1DIGNhYmxlIGlu
IENOMTIgdG8gcG93ZXItdXAgdGhlIGJvYXJkLgogCi0gKDQpIFRoZSBzeXN0ZW0gd2lsbCBzdGFy
dCwgd2l0aCB0aGUgY29uc29sZSBvbiBVQVJULCBidXQgYWxzbyB2aXNpYmxlCi0gICAgIG9uIHRo
ZSBzY3JlZW4uCisgKDQpIFRoZSBzeXN0ZW0gd2lsbCBzdGFydCwgd2l0aCB0aGUgY29uc29sZSBv
biBVQVJULgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
