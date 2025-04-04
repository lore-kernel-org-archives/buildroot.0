Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC3C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C3E847E8;
	Fri,  4 Apr 2025 14:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaC_8NLg2xbN; Fri,  4 Apr 2025 14:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB17B847B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB17B847B8;
	Fri,  4 Apr 2025 14:56:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA23D117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 14:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 908D340CBC
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 14:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtzCsnqM5_jT for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 14:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com;
 envelope-from=brandon.lumbra@sense.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1D2440B3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1D2440B3D
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1D2440B3D
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 14:56:02 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7c554d7dc2aso343032185a.3
 for <buildroot@buildroot.org>; Fri, 04 Apr 2025 07:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743778561; x=1744383361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tQPTcd5WWZ2AqU231AQj70Sj759keHElwrzV+8eXaKc=;
 b=G9ijN3gAaYelkcMHcTbA6X7R15qRPxQh5zGZLVrRyDEcCcvAOBlH1igkJFhURIAzQ6
 Uh/WCvzlnIFNKC1LVq9Z85ixxdUlINUSmGtArqxN5XVlyXG/wl2vpdTAxxRl2DpPYSR+
 QTW9YTsvlWZEOBc+yAHl2pPZlRnPjUQLrHPdC3i01fwHsfzG5U0o2018EkWjZpf16HWj
 vpkdscqnWGcILDXXf7XRnmVOfR6sz6NmtPd7atB2aHQpnWT9ipqIWWD8Xcgp2j9RWmk5
 mTf3BokqEaGZJhoI8gwxvpsyr0lDB5tC43dvGI9a7XhCi/CQQzOvUWC5ZVuhbYB4ksz1
 xSnw==
X-Gm-Message-State: AOJu0YwtGufA+zy6O68XpDjWpoKljkY4T43turyrxinG1IrNuDkuYi8m
 R/dXzki/Xs1cffDHY3EUfXuMhCtozs+nRh/3EyxROrqN10eAwZILx31pxJNYrg0ylVV++WdP3ly
 A5Qc=
X-Gm-Gg: ASbGncsVqfgreiAiXshy14LiFXzqhgDgnD3wAfrVFBUwJjvsDlVj/A2XZr/NmUoHwXI
 mbs3NPWUMKckO9zHR8a707Mbb1pddlMKgMqzw40/QTNDiew+R7wt+UodThjfm/p9hA4bDh6REs+
 PBK+3K6J5+2oaIFN04gPxSB5yX2bdi9UEi6kILecof9Tut0pBvNPmJAKIEkzwOWpujLx33ANTTD
 dUFjKKzBnSeO2Svz4rzuims5fJVDUlq2Vgh3eMXkcGNBOA4nvyUlCj9c3GM/N6WAIZOK6MAi9Rr
 YXePKcXlr1je/zslGr6GwnLTBPjMRPU59S5cUIbVYpXTJk/wpYJG0fxsZPbNA8fN6LVI
X-Google-Smtp-Source: AGHT+IHBvwcfovVcgUpU3X7Hzc3Y2uGkkhnEmwbzLznOCShRrMYcQdFYN/QxrN1Z2hQeNv5/ih5X5Q==
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id
 af79cd13be357-7c774dd611emr421644885a.38.1743778561382; 
 Fri, 04 Apr 2025 07:56:01 -0700 (PDT)
Received: from brandon-sense.localdomain ([50.170.154.78])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4791b1271f9sm22773471cf.51.2025.04.04.07.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 07:56:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  4 Apr 2025 10:55:45 -0400
Message-Id: <20250404145544.971346-1-brandon.lumbra@sense.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sense.com; s=google; t=1743778561; x=1744383361; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tQPTcd5WWZ2AqU231AQj70Sj759keHElwrzV+8eXaKc=;
 b=F8XpXJFsdR5pYJEwij+JEQMn+lVv02ARMip6bg5fuLX0yKaosMflNHzm+FWdu0++vY
 QPStoj63FGzqbz+7yKrcy/xipp/Mcb1F3bgFXCu0Cz/DV9tRN4AqfQHNeU/2LER3wMQZ
 Gj0HS8OjzJwGAQL+01/MNEU7aienzqqbI8lOk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sense.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=sense.com header.i=@sense.com header.a=rsa-sha256
 header.s=google header.b=F8XpXJFs
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: add config option to build
 in deprecated WEP support
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
From: Brandon Lumbra via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Lumbra <brandon.lumbra@sense.com>
Cc: Brandon Lumbra <brandon.lumbra@sense.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Lumbra <brandon.lumbra@sense.com>
---
 package/wpa_supplicant/Config.in         | 7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 92953f69f0..ff6dc9fbd0 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -175,4 +175,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	help
 	  Add introspection support for the DBus control interface.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_WEP
+	bool "WEP security support (deprecated)"
+	help
+	  Enable support for WEP.  WEP support is deprecated due to
+	  security concerns, but some systems may want to support WEP
+	  networks.
+
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 44cfed495b..c8c07234db 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -197,6 +197,10 @@ define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WEP),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WEP
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_BUILD_WPA_CLIENT_SO
 define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
