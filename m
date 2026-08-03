Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DB3C55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 11:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4736260746;
	Mon,  3 Aug 2026 11:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-igdKfKftBH; Mon,  3 Aug 2026 11:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EEBC6075E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785757890;
	bh=7nAJ4jC4ByTIOjh+ZZK/CtjuF2tLLjCRK17Gwux9ehY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qih4x0wyOhS+yCw/WjD4mK+rN248h0OFbLslCEPCV0igzeAJfXSgF7gvt2dQFj8W6
	 d9cRrOT8g8r6hSx/Jg5CazR4fo+KQmfk9UXqYTqY5+IcC1pXaWtOypPVWAj6XqU5AQ
	 eIm4S1vJL6jHNQPLmaRfGldU2iZFNtViCTxHqxG/5UCGszsZkBJqwFlZAibzYdYNr1
	 YnWJ4AmazQh0I212HmrOGy/h3Yj8jw6Jp6oks89mQ2uznqm5iZLir7yYb98LhSHtHz
	 BNKc2vYdNSm7tYtq+PeBhLYBgu+/uyGo4jxyScwxWfOHfdiUnTu3J2YDIyTWhPvWve
	 sezMIL7cZP49A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EEBC6075E;
	Mon,  3 Aug 2026 11:51:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FB2350
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 11:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0ADBA40513
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 11:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XcefyVnymZt for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 11:51:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fvb@funkworks.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E66A40512
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E66A40512
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E66A40512
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 11:51:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4955158f26aso13693685e9.3
 for <buildroot@buildroot.org>; Mon, 03 Aug 2026 04:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785757885; x=1786362685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=meb+CXU2kRMgRi42uZzfNHSbV2MVJgPxcFNaXFLN6cU=;
 b=gvDhdmH7BzDVGb4VbWJLReWncyOHGaqGDRJzToqON1747x/0rQ7blnueUFokzrtX8X
 X+ysQDBDaP6PPPLDPBDUOJHKFFMmHB2exDoslJndpMIYicJl3xDfuW9ZD30JBswcN5dn
 8Uv8PTfEBEJwqPv6TrTizKk/aB4OG/ytnfiJxvYwfnTV+UxmkMc2Yd8P9kMkUB2C7GDf
 TzKWvwxdgoH4/NLkVWjFxT+h30tE8XcVhdh4zq7ZncnwZJZHJiBYilX93sRzl2wPN0Wz
 MZX9+nEIGHlL094WynZfl9DUvxyGFkl5GLSBoZnnjVsLduR5W145jabblQFH3M5YEJA2
 /KaA==
X-Gm-Message-State: AOJu0YxjHg1oxxpLRTVaDRg+u9axn8EPImeZUO645N+ePS1hzIvBnr1a
 J9MUYDKG1+Ol8LVJ4NNFinhVXbjlPwQE1Yxv1apxQvM2VodxZxQ5Pt1zh/WIP3BB8HAtk0plaAG
 KDvZQPa7S
X-Gm-Gg: AR+sD138X80UdvgXmm/G2YBtRnp1fZ6ptOwiKcr28YLUWp3dTEm8BPbOu4fIetwE0Vg
 k4Q/D+0HXCO5NEoiJAnl0AzpHkg0trkzp/XXZoos9GXaLuM2nKLswahWMUr1h+X3Oqjv8JwpFlm
 jr+6f8v3Qd3N54wE6RXBZ9AN7OGethqZEq2BoFhyuRltX+DP44AriIdAuMQ3IsiX+rrSmuCxWLf
 ifJuPtqSzjvBvDo3E+eJcvBdSiLDw2KYWAVfqqwAvBaG4kJ1bbAKSVV/OCMqPHnQ9qe+vRotida
 YH0FZu/HlAxoKNxVtojiN6ejr96OtmRyMtfcRRksp+6GnBJMQn4+F2/lEQGuiWOyQZc6WLoc1QC
 5QuXrfQZtECNC26cdsLDLfFpfY/r0SoEljxcumRDOj2bGbHH6Gfu3YfYa3b55zsV3ssnjq2HYIt
 yZAiOC2QKRkEcBQGbG/51helmr2x9YM4GdX4GusDCNQSRkVuSaqemWPFNHRx9aDlU0wPW58Zk0E
 1sDOpIhk7d23xBQ8HdZw21hZVAHBpGqlhTvnP4RjXXwICA=
X-Received: by 2002:a05:600c:c113:b0:495:4689:1e98 with SMTP id
 5b1f17b1804b1-4980c674e1dmr170178495e9.10.1785757885040; 
 Mon, 03 Aug 2026 04:51:25 -0700 (PDT)
Received: from tank (118.73-178-91.adsl-dyn.isp.belgacom.be. [91.178.73.118])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-49807b5f0adsm216768615e9.4.2026.08.03.04.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 04:51:24 -0700 (PDT)
From: Frank Vanbever <fvb@funkworks.be>
To: buildroot@buildroot.org
Cc: Frank Vanbever <fvb@funkworks.be>
Date: Mon,  3 Aug 2026 13:51:21 +0200
Message-ID: <20260803115121.378977-1-fvb@funkworks.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=funkworks-be.20251104.gappssmtp.com; s=20251104; t=1785757885; x=1786362685;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=meb+CXU2kRMgRi42uZzfNHSbV2MVJgPxcFNaXFLN6cU=;
 b=W0aBf5/mUW89bW4HxLqsQtMgvirZWQjNHQUA3LsapFKOfo5e5yF5ELqM8ulFQPEwrR
 M6F3Vs0q7juCHVCOrjlGxW6pKruIFjAaqP+NuriI4vgYbGxU/jiSdpCKR4Mndgr0MqQN
 Jm3eR936YnVLzG2f6NVnbRz/aann4TcU/N6Gs+wa8zTgBBImKMLX8RrziO7st4Hm2zSg
 p9+uULbqVWMEx/LqbBOKFErpX7A2CjqAi0uwiyXG0eDlJj9IdVDZQQvkOBbTgBF7dk9R
 l8rR6+HeoytPq2Mbmjo1YcBpt60CoYeaLP67SLoCSK9BIbiq+ncow2zk9bE6P8KjG8MW
 lFQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=funkworks.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=funkworks-be.20251104.gappssmtp.com
 header.i=@funkworks-be.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=W0aBf5/m
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 version to 3.0.16
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

https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.16/CHANGES

Fixes CVE-2026-52761 & CVE-2026-52747

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
---
 package/libmodsecurity/libmodsecurity.hash | 5 +++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index aab9d14d67..011059d91d 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,5 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.15/modsecurity-v3.0.15.tar.gz.sha256
-sha256  c276c838df6b61d96aa52075aee17d426af52755e16d09edca9f9d718696fda7  modsecurity-v3.0.15.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.16/modsecurity-v3.0.16.tar.gz.sha256
+sha256  739be3c71b1939f14e91afe1eeae654acbd440da11bd29790458840bc315b4c0  modsecurity-v3.0.16.tar.gz
+
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 8920cb012e..653b4fd159 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.15
+LIBMODSECURITY_VERSION = 3.0.16
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
