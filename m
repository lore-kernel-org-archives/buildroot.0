Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108FEEB48F3
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 10:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A592260A93;
	Thu, 12 Feb 2026 10:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCLRp0UBkVJ6; Thu, 12 Feb 2026 10:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C0360A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770891823;
	bh=WHxVQ4Z7WXG0BFTmxYO7UNk6e0sALhcAFE8qEKfzfqk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m1oqOF3f4CjVVMCvqgW8UNSMhHvD9Ta9/zUOAwRWGAx3/4tSPHcMfjHhH1WI04LQa
	 hRrNxelYaU2SR/+ZctIVD3fq1zkcS87LyVBUd8sLtFPax0ij61mgGZx6QT+d8h4Lnl
	 6U5d2o5aztYYLLM/mPaGHx20vD1U56OsLgU2mH7v6Fvbx+ssvFMFZEkJruzJ/ixu0W
	 rxLUI1J/1MsR7A59blycyvpx9ICt77lXbPZKRzDebPKwSCCw3f2+0wagYc/ztOT3Rt
	 UJFvN+ZDy59uPTCrr5qXtMpk/7MIXye9X+FmPO2EguBsWy5h1f/CRRqg0fC0N0/JS8
	 QRe4sFgiBQp3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C0360A99;
	Thu, 12 Feb 2026 10:23:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0C1FEC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EA936083C
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYXobgzLVgr4 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 10:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 249DB60604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 249DB60604
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 249DB60604
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 10:23:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so60557395e9.3
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 02:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770891817; x=1771496617;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Krr/r6hNp4Nh9hH6niaQmVfOZMUuDJKrQYqemp4OOZA=;
 b=RXAxwfHQh6SC4Ig3x4ja1DHEcNms+BKLteOOPxTggD0k4VYn2jPkw8iEpKgKxgrCxx
 33UGhxP2h6udDiEK+mpVJNXPJyTfWEFp1gPpNW0mVRF3TgpNTcOYAZdz7oGrTipdL3a/
 BLPknEByNXxF/Njn8vhajqu8B3MizqXFDFFvfYIIeydo0DLxvuQG2nxkS2a6x74Hzufo
 gutQqPlP/I2WXAMstxbI+SvTpWg7sFuyoJCCZO3rte37eOstOzyx2qzh2lr6e47n7eIu
 lS0Iu+HzT6zNkK2yCL3PCq6NgRsqy/wB23W6MTQTKlZX0Xt7ggzIl6i4/ePPx+IWH5Rf
 fIYw==
X-Gm-Message-State: AOJu0YzQgGjfyATywoB8nJaCnOZaIKTBcviT2L1NVIz06AqhAQoFzOv/
 eKOoWb+V9uSXFF+t5FbuFl8cgkLbcR7lompzfMBUEM8wcW6YntURWHEatZwsmayuNVoUbev1Uju
 4/N2W
X-Gm-Gg: AZuq6aIn37gZOYjarqyBvGBtlV0bYV6tEi0k59zgwxt/yCbBopGShZNaTeZY4Nt+FED
 LRDOOUAYDwgZ3405NQM5rzn8DG2y5KmYRr36NPF0JSpRGZhLdTpNprzsbbj2kDedqWMOI+mQYMR
 y/Hcm97cgfMxukCF5lVdQMgK/P1M0RlzexOpV2rC3uN91xW4fOKaYkidY02e/g9h3dgt2LdoxRQ
 eZS0sPqc1V5VAKz7DngIWSaXvfm++EoepQDdILFqdcfFtL4yT1F+LLBrmyBO+oZKi0PywX24LFI
 uD0kekyj6juHsU9ME6cgT6xQVjMLTvk2r+Xyi3tK6DiEZhg7GTOMwCbzXvnjnwTCRtJxroMY4P4
 f5T2DeKaFd1bFIGpVdD/n4rQJzdjnO2+cgyS+jkxeMr3oZiDxx0U7vB1h63v3bz85/3iM8V9ZF9
 tZhcta8jWHP8ZlqQA=
X-Received: by 2002:a05:600c:19c6:b0:480:1d0b:2d15 with SMTP id
 5b1f17b1804b1-48365715e72mr32338885e9.27.1770891817291; 
 Thu, 12 Feb 2026 02:23:37 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835ba69255sm38500355e9.10.2026.02.12.02.23.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 02:23:37 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 11:23:16 +0100
Message-ID: <20260212102336.154817-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770891817; x=1771496617; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Krr/r6hNp4Nh9hH6niaQmVfOZMUuDJKrQYqemp4OOZA=;
 b=Oybzue5ztDtwuq+8caqKTZkuV32ZPYBEluUZ0lU+QVv8diSLPo59ELw+eHXwfsFlat
 u9pURGAsEkPRQakEjrnWMEi0aYmjGzx0d4GUwkfdCV52DnlaXEtusOnUue71Vfswz/jN
 Z09mp+tjCroDcIq/4DymEpFjGJQ1mJ39G67HhwIq1Hx44n7GyB+0w+Nb806tjc2Va8fz
 rTw+4VILMzzwcPC7khjzW5ReBX5wAOG+t+OdVRvmxWlfOeOZeHoez21+cocMisNK8BO3
 yUYgd12tqi3ngGnx9L10dmTTDvCPn7Qp8qYw4dmTEfrYYwP016t2iw1ppZkzk6Ed6JxX
 Vuyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Oybzue5z
Subject: [Buildroot] [PATCH 1/2] package/avahi: update _SITE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The github repository lathiat/avahi now redirect to avahi/avahi.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 1efc05c025..9074b374f6 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AVAHI_VERSION = 0.8
-AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
+AVAHI_SITE = https://github.com/avahi/avahi/releases/download/v$(AVAHI_VERSION)
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
 AVAHI_CPE_ID_VENDOR = avahi
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
