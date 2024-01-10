Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EDDC4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79BDA41776;
	Wed, 10 Jan 2024 15:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79BDA41776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmxY0r3v_TWs; Wed, 10 Jan 2024 15:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3BBF40565;
	Wed, 10 Jan 2024 15:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3BBF40565
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 514721BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29ED483D22
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29ED483D22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBuhi22z2SKX for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:23:09 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6F5483CEB
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F5483CEB
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5ce07cf1e5dso2135406a12.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 07:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704900186; x=1705504986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UsY0Imv5VtIp4PCohAzB+uox/rdEY84fQ+J30YCsfDM=;
 b=XCavYS58K6MJfWVUUcPhLH7D88/0gWUYANeDQ7PuMHivIQMMTuZSo/pgB6x1ikAjRW
 fOR2bqxCMGfLzk7EI5uzMCw8iz2Maj8BUhvFV2tYKZCi+sBhoeUjOlfqsWGJkDpsx9Th
 KS9vClGu0ksdRxAtCnB0Xr/aH2MUTVnM1bsiCGnigTq6Xazcyu+SICxq64/Oka+bGkAT
 PyQWUSRKb5wbZCErIroepI93Qdc+oDBYUtfq5fkD2+dXxGDUJmzBV3TCZXqz34KUnRLt
 uV4wqSIjjXC0+QIMp6LTUSqwgvYcmvmdZ5tHtgZDQs/2IomqfUiNlTMrHA3KIUCM23ja
 6NMg==
X-Gm-Message-State: AOJu0Yx6MvyzI86GSVVL+q+oSy802FGOKpp+wxpAiwD5yy253tAQeHsc
 KvRtzQa7wYl2NUTIA43WvG6lJexIfcrq5K9NzmslNARiZa4=
X-Google-Smtp-Source: AGHT+IHggrdrecCOfFqcYo4NOaMF3jJIfBd6OXSyoac3c/COPGz2hsuYVTtxvrO2jSCKLR29/Tl8Yg==
X-Received: by 2002:a05:6a20:be2a:b0:19a:1172:d07 with SMTP id
 ge42-20020a056a20be2a00b0019a11720d07mr787406pzb.57.1704900185575; 
 Wed, 10 Jan 2024 07:23:05 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 mr17-20020a17090b239100b0028bc870da3fsm1733298pjb.22.2024.01.10.07.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:23:05 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 12:22:45 -0300
Message-ID: <20240110152246.1605712-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1704900186; x=1705504986;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UsY0Imv5VtIp4PCohAzB+uox/rdEY84fQ+J30YCsfDM=;
 b=BXaKPvwmIe0qwBM3P0l+WnGQN6DItIUZlY/EZuGWZYbs2WDAgEnfsFIA4NChZyCo0G
 IQpY1HUcXa1thCqhqUGRllmcPWFl2p62Nqf0n0dkqQlpoyAygYsvyjxy6MWj/yPuxic0
 qHBqFv2oTkFZilIszWtPzP+TvGGnw1sa+VR1/6FttU02cbJJv7B4005Es2uKFeHYevC6
 2HgC3zuim2ZSrsnu1vhszICA+VMBbDyr56MQR99mv4eFd3WnXR2O6XMJM7zXOHt6lpI4
 X5mDPoAXn809wYDK+wCVa3LF2onMIb3T3XzM62OctqOaV4xKbyFLFqYvkd11//XXogO9
 d9Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BXaKPvwm
Subject: [Buildroot] [PATCH 1/2] boot/uboot: bump to 2024.1
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsIGluLXRyZWUgY29uZmlncyB3aXRoIHRoZSB1Ym9vdCBib290bG9hZGVyIHVzZSBhIGN1c3Rv
bSB2ZXJzaW9uLApzbyB0aGlzIHBhdGNoIGlzIG1vc3RseSBmb3IgdGhlIG1lbnVjb25maWcgZGVm
YXVsdCB1Ym9vdCB2ZXJzaW9uCgpTaWduZWQtb2ZmLWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2
aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KLS0tCiBib290L3Vib290L0NvbmZpZy5pbiAgfCA0
ICsrLS0KIGJvb3QvdWJvb3QvdWJvb3QuaGFzaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvQ29u
ZmlnLmluIGIvYm9vdC91Ym9vdC9Db25maWcuaW4KaW5kZXggMjFmMTlkYjg5MC4uYmVhZmIzODkz
MCAxMDA2NDQKLS0tIGEvYm9vdC91Ym9vdC9Db25maWcuaW4KKysrIGIvYm9vdC91Ym9vdC9Db25m
aWcuaW4KQEAgLTQxLDcgKzQxLDcgQEAgY2hvaWNlCiAJICBTZWxlY3QgdGhlIHNwZWNpZmljIFUt
Qm9vdCB2ZXJzaW9uIHlvdSB3YW50IHRvIHVzZQogCiBjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9M
QVRFU1RfVkVSU0lPTgotCWJvb2wgIjIwMjIuMDQiCisJYm9vbCAiMjAyNC4wMSIKIAogY29uZmln
IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT04KIAlib29sICJDdXN0b20gdmVyc2lvbiIK
QEAgLTg1LDcgKzg1LDcgQEAgZW5kaWYKIAogY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfVkVSU0lP
TgogCXN0cmluZwotCWRlZmF1bHQgIjIwMjIuMDQiCWlmIEJSMl9UQVJHRVRfVUJPT1RfTEFURVNU
X1ZFUlNJT04KKwlkZWZhdWx0ICIyMDI0LjAxIglpZiBCUjJfVEFSR0VUX1VCT09UX0xBVEVTVF9W
RVJTSU9OCiAJZGVmYXVsdCBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFIFwK
IAkJaWYgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTgogCWRlZmF1bHQgImN1c3RvbSIJ
aWYgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVEFSQkFMTApkaWZmIC0tZ2l0IGEvYm9vdC91Ym9v
dC91Ym9vdC5oYXNoIGIvYm9vdC91Ym9vdC91Ym9vdC5oYXNoCmluZGV4IGE4YmQ4MTc5MDAuLmZi
ZTVkMjE1NDAgMTAwNjQ0Ci0tLSBhL2Jvb3QvdWJvb3QvdWJvb3QuaGFzaAorKysgYi9ib290L3Vi
b290L3Vib290Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEy
NTYgIDY4ZTA2NTQxMzkyNjc3OGUyNzZlYzNhYmQyOGJiMzJmYTgyYWJhYTRhNjg5OGQ1NzBjMWY0
OGZiZGIwOGJjZDAgIHUtYm9vdC0yMDIyLjA0LnRhci5iejIKK3NoYTI1NiAgYjk5NjExZjFlZDIz
N2JmMzU0MWJkYzg0MzRiNjhjOTZhNmUwNTk2NzA2MWY5OTI0NDNjYjMwYWFiZWJlZjViMyAgdS1i
b290LTIwMjQuMDEudGFyLmJ6Mgogc2hhMjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhm
Zjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQwMTA1MjFiODgwNjQzICBMaWNlbnNlcy9ncGwtMi4wLnR4
dAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
