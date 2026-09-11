Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A450C88E4C
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 08:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAD3560B93;
	Fri, 11 Sep 2026 08:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyP5vXvK_Cvm; Fri, 11 Sep 2026 08:06:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1ECBA60B18
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789113992;
	b=PnFpqtmC+KxMbHSkBf7+Y8nH5SU5RAEQs5AqmU9T0SJWhaGuH/NR/vLk5E+Uco4AQVH0
	 2CfaZzx0NnRbDMGOd7XXcM+okrXgSP795iqKb4pHfGYgWC4RhGjd5wEErQyOtiWWnODhs
	 kp8ygi2zruOz4qBySmTTFaUnGdJmNlyXjHZ1MD1ZtWiCE+asx/1VLOulF32tjPg+Op6Jv
	 tYztRChsZHV4aUE+DSWMgKRuzsU421A0xQcmgxBCxKHAP7CNCVC2BmexH70cqCcJ1ru3K
	 SW3+ePp+vv7o6VqJRAOpfMAXODEIG4ncTC80EPQZ6X3jHAIOKH1I1JAitUeLiDlPRKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789113992;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=19GdqpE7ufNMfOYZo5ooRQs6AXhGLqzrWI6bkUlJgfA=;
	b=PTbFuaUkwL+s5pz5sRp4m4uwZrPHbzL6xPtTAVN1SthhjDsVZC41PL6+oL5idycNzgik
	 Oz5hRveu8gLRZ04RKYwmVDk2yqdf09jTjBZ3o1WVdmPwi45THAVO11EUloF+Zh2Svrnnr
	 xq6nWRxrK+nLmkb89aowm3tzW/sPex04WU/3sVAaNQjzbz3nX1QFFzS11MWUWz3WQhLbv
	 /oP8/EU/9msi+y1x3sPv29D80hHdv6W9CB/eIhHlP37JwvhoTGsdHGGc7tix2F1kDugKD
	 XVuu6Ap7uIMHY+51FHkxNkmuGYTB4K2FoLBaOcBObD2dpyDAAVAalyD4eXyCVg1EYwQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789113992;
	bh=19GdqpE7ufNMfOYZo5ooRQs6AXhGLqzrWI6bkUlJgfA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aKQQem9U3XC3pmnW77mbwsMWw5la28nNZTvGLEcPTjVy9XqzRDR/K9EUYxPwS9D/g
	 3e4PWnMrOzjvbBm8BLAWmycc8/S1vnHYfB/KPPWrUQh8tOY6hoh/ANnuNXZ//d2LWr
	 aMIXLVAAf1b+dGz+xWmq3dW7TTnxkPYia4YkcoDvI+/T0NKZh6wC0cZApbCAbr/3bY
	 tqdQSiEn/GQHwzBFdEfROMqxuzlk2tFjf8kUBpTCsLbEaQh+FCEJUDYnWScuTNSCkd
	 jh57b9T5etvZ3KjkF2lJfD+7e/t4VVoPNT2cAgci36m9muWSMsmprgWuaHh6NQJvwW
	 PtLw15UCUMH0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ECBA60B18;
	Fri, 11 Sep 2026 08:06:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1E4B769
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 921DF811F8
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMxN_TxVmhiv for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 08:06:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 98164811F0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789113990;
 b=gW6xjEugGj0QrX91PCNW6tKIsqfksg/qpkMOIuTqwZtSt0NSOiCl/b+twoPTTBWQO6Qt
 8mfaVzAP+v5dIr3LYHRMfKm0+6Fhk9D28YQSoOfn1um2O3Cv3KC35QTpZ8Kn030kgeXkC
 5T/qZ8V1xVCZFCAakO0rxkMctfqEAyGiAnJqmWIIAvbaVwHLSV+nDnVz+zQ2Z4vtjHFc+
 VDPOgLCSEJq6YKbNdVkgFQiyOHIzLVim3+3VyqJz5trwqh4A+bVoy5pqOaegdkwkcN+uc
 zcBeRmXuM8BnP2KoeaydeWiHFg/9C+JriF32OGsvPkk6+WkOkTqLC+KEbI2tk/Ikqkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789113990;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JPvXGmYJZWhQ3smHI8LQlqEpNj2NKcVAhtKM4tgx/cU=;
 b=U2uH0S7yvQMdyiN+xH8cRy5vvQ2kaxlzDJuF4CbDsOrFveD9A0wYo5yVOR1t5JlPPIZj
 zj61eNkDCiylWTdGVVnyL6v+exSvE4LYYhHwh/gOuxPC4w8kPTuSfce3nUZGQuBmZJYaa
 lo6JJ7egtNLkvDi/krw4jpFGxclBjHyDlI58drt9vy7T3wo7z8O5f95/XQn0m+/SMc4CR
 TtyxXnwpKmTxiHxHRv+7vl/Sdm9E+MFJnjffeepF9pv+GWjH+LAlNfz6PnhkGgmVl68+r
 p9/o+hmF3uvOA+lPfJSBemmi0LG68MVrMiFlsz9O1b70WuyBj9B6gIWrnweMN5sJ9pA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aYpyS+uU; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aYpyS+uU
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98164811F0
 for <buildroot@busybox.net>; Fri, 11 Sep 2026 08:06:28 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so3815365e9.1
 for <buildroot@busybox.net>; Fri, 11 Sep 2026 01:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789113987; x=1789718787; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JPvXGmYJZWhQ3smHI8LQlqEpNj2NKcVAhtKM4tgx/cU=;
 b=aYpyS+uU1LvSDx3Qpc+2nZ1K7don6cAaBnZgQA7BghqtHMYi5UHd7N/sGf9pWfiUL4
 Se5CykRrZycIQZaimnqWQF31JA2yDKhFQQwhFKZLjYtpfhisFy7t2IgA0DK949GpNJ+x
 qOQl8Fiiqww7IHZlaJKgDvx3ZpoPg0ahRDZB/3q7XW8rYU5eiR/USmcrba4Y7LVo+Qu3
 yt8SLfjWRyxxqnhBjvMJ95ItKvHmJdRUFsuu+cdtEg/iEIsGzDT50x3GaTD0l+07Lh6x
 XLfiCJa9ucN66cy1jX+2C20VHmGWErmFVhdcPA7QiM81iOuAtA1iLls0Xtun9xMpR0gP
 HjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789113987; x=1789718787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JPvXGmYJZWhQ3smHI8LQlqEpNj2NKcVAhtKM4tgx/cU=;
 b=HAtx7Ki9dWVSL3gmqIqIX1zMReIuftRxzzAEPcas91pJlEs9Aocb5hOJK7hRaaaR8e
 H3V4xS3/ZaEKyXoTTtRzUcbQQ2rjD4feYVN6ZWomvdVsfnh5UMbB8fkhQ+wlQmA0OV66
 T90bnxrJ8QGb6OsQiBMNg5j6k1AW0c93FeqlUrS6xzcRZQvX+HgIacLHd2rcom1zt32h
 h6ksF7KEs4DexcKS1DdFOm1sPE1fFAl289EpC+EyZ2UrY02JgaCa9KR1Mtc7i7boCqR9
 EnSig5l8iCa0ScQ3ri1KtkBt4BimoeN0//xyfHphRFak4xT2D5vJPiU+GQ4gn0OaD289
 JKDg==
X-Gm-Message-State: AFuF++mmMHkJEhbUz7REQizWeBJA3A3bxDuejPNDirleEPLjfk+PKVpd
 b34PzN3Dl9ZHh9PGLQVxI7lRc/8ktroypQwNhRQpF8a1cBQR+b60orQjVi9ezQ==
X-Gm-Gg: AYBFou1D7BUshqMmI/puhBc7Olg6nPJt/NYPJfwuvQVjMJmbGk14nMALu3uTBMHPHaC
 WcsFuZLPl2X+V+TSu+CH0xlaqQA2+ktaTh1VxUaBSzb9FuWqyypi9lI19iyC7gxdJEybEHaz6Ft
 kA4+O+GBiTTEEwfkAr2UKusJTWnHh7Y8hj+nFxd0q/jd3R7LcLjXxTckCGCa+4wUoC17RXApFIV
 vJLATy1SIP9sykuFRbkyORVapxBcVUU908j1ZwlEqkF95PncRJfN4eOKSK3mFlFiCYmA26j/2/8
 oiSrlzsS2U8R7oZwfrfXfrn2cUWt9sFLX8Vb9hWwNrP98KSmmdAFXLQW/z6DdXcRYmVP7mEJIvJ
 vbnjlIqKt9+KbRRi1Fux+CrbZrFWXgj5TZ7EAkKVo697yS/x9QeG+c55qLGHSQybaMX274ot+va
 Gdp+N4PjsSg/iXhD6A4TNuSUBlKK/1kOQ0sCoLnEstQGXhq+66HnqFPnREAUaEZ/N2pVJYbxUHG
 ecieDImlFuvNbbfv5kQH2+cw+qaHtfGTGEVWXGsA8/FN7KZaBkZTgQ=
X-Received: by 2002:a05:600c:3b23:b0:49e:6050:9fbe with SMTP id
 5b1f17b1804b1-49e619c2722mr58668485e9.15.1789113986556; 
 Fri, 11 Sep 2026 01:06:26 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c2985dsm232793095e9.6.2026.09.11.01.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 01:06:26 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri, 11 Sep 2026 10:06:08 +0200
Message-ID: <20260911080611.55857-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/luasyslog: bump to version 2.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luasyslog/luasyslog.hash | 2 +-
 package/luasyslog/luasyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luasyslog/luasyslog.hash b/package/luasyslog/luasyslog.hash
index 1e2a5ddec..3a04cd339 100644
--- a/package/luasyslog/luasyslog.hash
+++ b/package/luasyslog/luasyslog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1b19ca142130f93c3f8f2e85303ff50cc6f4ed4aa52b8569176ae56e3dc3f43  luasyslog-2.2.1.tar.gz
+sha256  59c1f570b0e262b1e0fd47b650ebd1dcc8e152f004a0ac7a0dbcf7bfac394654  luasyslog-2.2.2.tar.gz
 sha256  833457938f5155e65dabda12a5c9d4b6fd7fb92dd7ead584c1c30cfb0c84adf4  COPYING
diff --git a/package/luasyslog/luasyslog.mk b/package/luasyslog/luasyslog.mk
index 972d4c5a7..d512e45b8 100644
--- a/package/luasyslog/luasyslog.mk
+++ b/package/luasyslog/luasyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASYSLOG_VERSION = 2.2.1
+LUASYSLOG_VERSION = 2.2.2
 LUASYSLOG_SITE = $(call github,ntd,luasyslog,$(LUASYSLOG_VERSION))
 LUASYSLOG_DEPENDENCIES = host-luarocks luainterpreter
 LUASYSLOG_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
