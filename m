Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FF3CD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE61D6134D;
	Fri, 12 Jun 2026 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDWFpQa8kZj4; Fri, 12 Jun 2026 20:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3DF66134B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297483;
	bh=u2R4YdfGZjd1XDzC2HZ2ZO2U6oXf4YPPkKstqRolLqU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I418CGg0lap8KSiCo8lNRmIx0w+4sVmXuuST2jDAyl7URk0J46HkD0CwN6KyTFtrW
	 TKdJTO7FyIndRaxCtfq6QMk4/AUmY7I+Qox06jAt4y7yGsRFVICe72rfwFp/jHqGCl
	 9STAysLuhwh8Y0foK+plaqAS5DACoLzfv7+PBUPK9EukM4m9wqb+6X5KK9QO1CQQMF
	 XiwsZwNHiCq6sjGyK0expiqlBjImIeqkkb+TtGb4iZWZz5KifKM+OZ8MALPr2Kf8bu
	 iZ1jOooUCNMyM3r9EmH4K1TqZIEawPrnbcMTcuNq8QVRx64M6pvu5dlZqlZIfCPg0D
	 +8OxnVnFO46Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3DF66134B;
	Fri, 12 Jun 2026 20:51:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 784F31E9D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ECBF8414B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyJI1hvP9fzo for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42F5B816EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F5B816EE
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42F5B816EE
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:19 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso16659885e9.2
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297477; x=1781902277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ACV0SRfTkQCkX7DmCl+eGDWRRwuwepZzG8DCPUT2VQQ=;
 b=pLDMF75gh0zup7j/FBTOwqARdSX9QD0n3jKEmsJkQhehshA3LPs6rO+G+lf2FGvs3a
 OWjuZfXae2mYAglJk1WJJrUdkEyAMNFNA4xv9ZdQ0sPS4IpUYd4FcX8Bm0qwtLjULyFQ
 TKtW91sV7l005ETo087XQ0GsQ4SjrgvOZBHUfG1GmODmmUAxHTG9WtJRuzaWAqbPGPuA
 XTTp0OBVI933glYNbNFC4daxLCs/1aeFWyxZsfucBuXYOts2xeKRvivUWp21pxz5FGrN
 ogMKNwhb9Pq0EK6ESg9DUbMMmPLFglN/B/CsNPWyFLM5WajYK26KSmcN8nTMiNGJ7WfO
 pJ/Q==
X-Gm-Message-State: AOJu0YyO1ldQ1hAA6Vcgo0rOvBejN37+nka4+II2WhbX09866TAXbvO6
 aDxuXfaqwlsV8NZyVsrvcp8W+N0oSj3q9vruGWH0qdIsjl6kqYCFjYXkz/yoqYOJRphnghwrbOm
 BvkujJg==
X-Gm-Gg: Acq92OHTbN4dE5J5Xs2kFCD5U8DDtjt1E6IPyupUrQ9/hJi0rrZLGOnH+jMoxz3QvhS
 SLTK/ZAp1KSQ+1e98GIHNgjsVeVo67iQqq/J2MAlo0DIXVFiV9jYFMvnTac2sSJOHaNZluY88Y/
 svN+AAhxFeexXyxmHGrc1DfGZJdq4Zkj7Rp/O0QDT59mZYjAoEsax3qGuCUoH1pE7SfKrKK412P
 g1pWl0isX3avOc0qnnVxACtKXKFjbCIm7XXtE+bZX9iAkac3ADjLC3sIXYj1Zii6qWM2pWSG948
 nJj9kN303m7XPKM9YSrF2DP+5DUNUXZySusAbSg3kcBaCQWqn2WvtSAjt3+RDcwZ6jZw2ZkSBDD
 rnOYNdEqtFBUgShFzl85oN5d3JD+1sifVlKGkJ1Pv46zWXIyjOXwKYyhzUbx46TgqxTMSRcfYzp
 AdvMd+ejyE2OfT3WwnCi/3zH8jtlq3UwxSvSX6WSBj6E8tQ19rFg==
X-Received: by 2002:a05:600c:83ca:b0:490:b473:8f78 with SMTP id
 5b1f17b1804b1-492200db580mr12749525e9.17.1781297476200; 
 Fri, 12 Jun 2026 13:51:16 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:15 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:26 +0200
Message-ID: <20260612205029.269642-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297477; x=1781902277; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACV0SRfTkQCkX7DmCl+eGDWRRwuwepZzG8DCPUT2VQQ=;
 b=hw+6ts9x0vnLNx1Ge5bYq/pj7lj68/ah34IR5ADjJQbcJ2+n6YMxU9CSJW4J123z6q
 /P53qKfE2jbCLRFqgl5J3iBgFYbYRKahRolwV67P1F9/piu6rB0cuHJSYip38Aeop3RV
 SlARcW9o2bMwr0GbrFgjiEowsXS/x3l1EV31sDM50tVplqJYzm6h66dQe7eJPNEzO3B9
 ZmsaE7JtzIA0uBG+4PDQ0Lh2Zz1w1jrZn7+XXWvJKNvE37Mm5bhBLTOjf1Jek2VvbFTC
 9kvKrJPddW04JQp/wG5FYqvvVhUDm7yXOYLrLZAwaFZmL8Pv3pYmNHqMDTTTQqvztxf/
 4omQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=hw+6ts9x
Subject: [Buildroot] [RFC PATCH 7/9] package/hare-xml: new package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/hare-xml/Config.in     |  8 ++++++++
 package/hare-xml/hare-xml.hash |  3 +++
 package/hare-xml/hare-xml.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/hare-xml/Config.in
 create mode 100644 package/hare-xml/hare-xml.hash
 create mode 100644 package/hare-xml/hare-xml.mk

diff --git a/package/Config.in b/package/Config.in
index 5cdf0c13d..1d0dac96c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1883,6 +1883,7 @@ menu "JSON/XML"
 	source "package/benejson/Config.in"
 	source "package/cjson/Config.in"
 	source "package/expat/Config.in"
+	source "package/hare-xml/Config.in"
 	source "package/jansson/Config.in"
 	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
diff --git a/package/hare-xml/Config.in b/package/hare-xml/Config.in
new file mode 100644
index 000000000..469a9907a
--- /dev/null
+++ b/package/hare-xml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_XML
+	bool "hare-xml"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides XML support for Hare.
+
+	  https://git.sr.ht/~sircmpwn/hare-xml
diff --git a/package/hare-xml/hare-xml.hash b/package/hare-xml/hare-xml.hash
new file mode 100644
index 000000000..25c1f3c1d
--- /dev/null
+++ b/package/hare-xml/hare-xml.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  56703cc20f70878a02f37967385e9af3659733b31c91c5f34cf819d235a20a28  hare-xml-0.25.2.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-xml/hare-xml.mk b/package/hare-xml/hare-xml.mk
new file mode 100644
index 000000000..be30fd934
--- /dev/null
+++ b/package/hare-xml/hare-xml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-xml
+#
+################################################################################
+
+HARE_XML_VERSION = 0.25.2.0
+HARE_XML_SITE_METHOD = git
+HARE_XML_SITE = https://git.sr.ht/~sircmpwn/hare-xml
+HARE_XML_LICENSE = MPL-2.0
+HARE_XML_LICENSE_FILES = COPYING
+HARE_XML_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
