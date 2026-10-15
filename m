Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AD0CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB26607D8;
	Thu, 15 Oct 2026 19:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnET88qSfCNk; Thu, 15 Oct 2026 19:33:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 248D360AA1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092793;
	b=XJ+iw95teGmTjGZXzU/yg3Z4bSYhm7PT31aKFNCuIsJki1tiRYdpyYF4GnTGc5gUc3JQ
	 u22YPwhEWkBth1VlubqH0MrI7PVIm3DXYUlPa1Z4XnOTeU2XSpbCoG53VX9zUBt/D5Jhq
	 RCgyf5FTAD3RstvJa4xPXcANvu42WcmaLoMsJBV+WP8ICu+oBVZGxNokaBgXQ4MnLIz1/
	 HwTZGhByQYLUscrajPJlbzlzaDxKNKZPIazN4ieTLVD3XEbtp3gSAqtFNxS+wDPfYj3a8
	 wWp2QAIPPlzy/qNiBpwdLxo2WRw73rW0TZ8171OlEuAi3XpNx7ZJM7LNV0ANbgbOCjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=+PWECrYPRym1Sy+9PVe6EyGT7uk06zJCBjsuxAVJ0Pc=;
	b=GCFgUk7/KuF2MW+5JnDVUjBUszAIk8MzWUiNSq6Ts9c7x4l+nMWVyilstVKo6YjwxjCF
	 NVje7I8W+lHsjzOGPljO7DGskKdsIgyz8p5iOERwLNHy0Tndd2iP7t1ykJ+0abbhEalYU
	 WHA1/r+6xNHjoXhi+YS7FTmQSIXJc9aRFoMqyTqYoEuVdvnrnOK/WUU6Ex9gKaNuMFc1C
	 Rdk/HwQf+srZ3HBpMiZz0uFB9b2VrahWGoqJqpp8ld0AdWmTbtGsf8Xcoq95ZK/ukDoJm
	 u2ejRqX9wj8eNXxH8MTEi4hjgMpoKGivzNxvNs8BqD3FEFd+CkuPD3HSqm55LqjcARQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092793;
	bh=+PWECrYPRym1Sy+9PVe6EyGT7uk06zJCBjsuxAVJ0Pc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d1Z0RbcXPtfv2ehvy/NPhVSgGzXJp/+c5ZiajOREIvIni2WVzJyz7kkgXckvcCwqP
	 zMnjO9La9gufw5R6ZjxdSMuvYQF7JGhcVTj2jBpAjAtM0L6k5waHWFLwEMXApdWz3e
	 cvKGqR/ilw0U4Dv5qE6jskxFEUJEhhSaJqc8evxDt2Yyx4yccxPmFX6EKPnrlpWorV
	 vDmTWMsG06uAl2loEQsPQR1c6HE2YGJ9qq0y7Z4IhWJFTyNJNgu7jwK0M32u8THVL5
	 cbAQdO4cb36Oo5eeDKp0k9eoWl8dueHsKJBRxXevta0aM0MHm6qPxF1ZmqC2D5BCKp
	 2EZNIQNlB6jug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248D360AA1;
	Thu, 15 Oct 2026 19:33:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA191362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC71240261
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfkMuj-NWo4M for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:33:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0E3AC4005E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092789;
 b=o4eMRQHZdnoXBgM1XwIFDuG/VrvT1p4VpbNLoN5b98C0AU8T8T5Z/N0jKYK9V9qRhpEw
 5UoOPuOU8YaNvJZnsB1VOtayVlluJDh/s60PQH+padgywFhHEsk0VKzIPP1i6cp+cT/Wb
 LwVjzs0ajK2LqRjiwhlb9PxT1eKX3HRkyt1KwmdnDZUoRInN1/dN+X2lZEFI7jOr93pcg
 DSf9PNm1O4vSkrD/RElXReVV6On4WjSJlnwcmkAX9Li6AAlQpRk71HSfgp9llqGUNmF8r
 DDCpHKKVO4FAtQiI5ZbbiMw3bwPMNivEjkCsXKVrX1QcCewBPzxE0bxRLY+vy1TWfUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092789;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=auIWZuCOjAQuGuHqvRlalCfbrxK8AugI9YPUNvdXKUY=;
 b=IQewH9m4EiCXas5gRbUANjBQObzM4W8BSwHGBhSXGABpYmBPKkaoOc66UPqFP2A4U+g5
 /cxHBrTd5k1gKgqw7d2FuThOx2rfmXV2ykg11Qm5c/5LEJVb9taTfTYMaqqAwVEpxkRYz
 dDPB83eupZLlLub/vnLkFSz37UTqK44EBMKsg5KQiYfRlRcaHJA9HrRA1uIjiBHowb8z6
 WggAkYLt8W4Nj+aX2TjpF2VTFLKt6q6JYGfw41zHGNxg4CbNNbIx6dS6+Go2/+Mn/Q58a
 r/4DuRSlBnQW0o9K8tXXVbGm4ibxiDrkr94mtSCC1FRJ9sZfp20afGgs+oOJQvNNVZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hjWc0QgG; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hjWc0QgG
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E3AC4005E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:08 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-6ddef424972so1714373eaf.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092787; x=1792697587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=auIWZuCOjAQuGuHqvRlalCfbrxK8AugI9YPUNvdXKUY=;
 b=hjWc0QgG5ZXpPoSYMLkwSTQt0aLHNzLYHzLr8p5hv/MxEj/7BlsAHNo/TY9BU9woM2
 S+Pi9UcoWFEJkb2wBUyeir3KdDekLpvZOZMlfQOZjKLh8i6zmsKXPHwVuG1afS6RqYMb
 6Q1IiQVcIo9Lu86EFrQKgQFS3hgJ8G2ZzGMgS5bbOHoyM8r7JLHV9gQtdHLScvGVS4th
 cHo+XcFhnTGBEhPNE6mv3PbLHTxfybTbR6c3C0FW06fZ/Mb8B77PO+fyNqihdI52C3Vt
 VCNvqxpfBpldfU/oLbH9C8G7nDD/7yNjdWWv2qTj6WJ/w+1ie1Z5U9w473MBi0EQvJ3R
 gSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092787; x=1792697587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=auIWZuCOjAQuGuHqvRlalCfbrxK8AugI9YPUNvdXKUY=;
 b=ySYBeSyZ1DIMA0xyX8zgaimmBZ6n5gpaFDotNHXovo4dULl5AT+pE/0vhWUBk2On7l
 Ym5GN7HNzfRUw1yGJmi0XOJdA83kHw97OLKx/mpE01sqMOCEVzHyXE1xYwcarcNO4nbv
 cUasfN3HHYMe6X2SOgWu8MPMobpjoiE22K+9Q5cR22p8upaApBszNQnBAhXZoK9rU8Gq
 iPnVunGuZ+mkzQRp6+7RQWPcPzmec41gbNFU2WuBp9UFJNXPrb5jXBxobeb3ciDLzH/k
 LEe9EcUjyZCHHLuZt5ubUn1ftPXt6KmyLYF4y894LR21zyh7MGh7/8Z7q67d1jMNQIZ7
 /SBQ==
X-Gm-Message-State: AFq9FYLOLVwe5avrwhi8/a0e4dynAwraRdQ255zEbfZ4TQQ5QivRQ4Xr
 gu/0HE6aJ2NxtQvU0KacBQ7hoBmBT5yteHfNe57KeoPhvjF+E2j3yH+F3zyZTQ==
X-Gm-Gg: AYBFou10JZRROHmGFBiN4uzBlRqm4giO+vzWYz3ypRgFIXVSsTQm9QSmmoumkpSmKOh
 P163tbqRXpxRMNFozDEnfrQJVjKL59C2m1pq3j4hCknkeGXT0hHGjBzvpHQY/+3F4svFbkOkNEX
 LGHWZiBrWbEW+LyN7dLhqOoMSbRywYpcfTCPLGkEqEMSwF4fex9LIXl4bQhVkLUA+ejU6/vz7iP
 qw5rgBivdfTJXWpkn71RjP5PAQqKY1K+PCfqx0W2AsTgGE81tvSVMAu+nhCSBRUOOqRkuMGo2KL
 vtPbpA0AeJf9zL2Bd0VuTnWGixOjAGA6LkaGrdox9YaEbUwKUcWGjcbh6jGrJzBEiMVGdhevU6v
 PpBW/jebd6hTM5NSH6FlIxmYu/CAmdqK53Lq9RSlPNaEFw96dBYUTMxSMBKf/gWJF997QFWZ+BH
 /3qZ57DSi/CC9IAyR6GDJyxekiYDKRmzrSrkrcZQNuigbqn7BSDci9elmV7NfWIpbN84efm5GbL
 y7z+LjVGc7DCz2wKspGsI6eHpTfkrhtjlrTE9llEWcn7JFyp/830pStghu2DKhVYBvyjDM47DSr
 EbMgO1tmFZicjMocMFIHZNdppQzt/Wd65ocSzxqFMuwIzH4DK1Vaxczf38bYbUvR4OrhdzMEh6L
 Rw3707/Qx+EnOKDcvLGeeSGnO3PBXS0SOUnJ1faRapFGAFMKEjWOp
X-Received: by 2002:a05:6820:809:b0:6f6:847f:9271 with SMTP id
 006d021491bc7-6f6847f9b37mr10483453eaf.61.1792092787644; 
 Thu, 15 Oct 2026 12:33:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:33:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:43 -0600
Message-ID: <20261015193243.3299884-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 9/9] boot/uboot: add
 host-python-pkg-resources dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-Boot configurations selecting BR2_TARGET_UBOOT_NEEDS_PYTHON3 already
depend on host-python-setuptools, which provided pkg_resources before
its removal in setuptools 82.

Add the standalone host package under the same condition to preserve
pkg_resources availability for older U-Boot releases and vendor trees,
including versions whose Binman still imports it.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v1 -> v2:
  - Tie host-python-pkg-resources to BR2_TARGET_UBOOT_NEEDS_PYTHON3
    instead of BR2_TARGET_UBOOT_USE_BINMAN.
---
 boot/uboot/uboot.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 96b8cd0d2e..daa841309c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -268,7 +268,10 @@ UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
-UBOOT_DEPENDENCIES += host-python3 host-python-setuptools
+UBOOT_DEPENDENCIES += \
+	host-python3 \
+	host-python-pkg-resources \
+	host-python-setuptools
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
