Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D133C55162
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 06:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF49605AC;
	Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNu7e5CuW8D4; Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D091460649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740395;
	bh=QoiiM3FuynEZuhSzeQ4bALmifcuREab0VM1l1tF2cyI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GjUjIv1ucMAaE4I3GKYjQpcCVCBOVOZkCy69uALb1o5g+71q1MyjXf6ka2UpMPrwW
	 AiBCdFb4wjqhrKt7GJI5OS9UtD/tSQWk5VpQHhtAvh5nVzEtSqXYEIFBsg09FS7Lu3
	 QDAl25s7urxygRRxw1cJ3vZJITG1cPf+Fb3p0Xw6Ttd9QDKtYieJiOeQ+uge27G7Zj
	 lmAZDwjeb270mWH8JdEIWawqlI0+tFZDNazBzMq4llQpyzO6Trc1Ez91QO4WI/grF3
	 7xYFWGm//qiUz/hnpDfeakQLmrVsOM3MNtb5Gt04LBYlu2J6rn3ozanY6oTQzl50ZK
	 bsAE/cz00Ajqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D091460649;
	Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C29036E
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 821AF80C9A
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDHLJc5CTOOy for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8211080C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8211080C98
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8211080C98
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso7129355e9.3
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740390; x=1786345190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ps6DDiHRMqddWAblv3fWYb7MzIXsZ8gFk6A9/6FSuw4=;
 b=N8yPSGBfaOEku6t90ff3rfTJ6BAF7qXUPVwAUKcUpSCAqdpkp8/P2s6V5oKHSyiECB
 weXbB3BdMxV8+v1DfCPF4EOrf0rYRv59VrqHoHlCjbWYixxsCm7UPPc8c4zmywGT6n7Z
 orsehKQOdWUXlAuAe0xwdPRuWbF6jF8DmiP1tvvZ74m40aHJ74CivAxVhMv+1zXlUorX
 7uvaPxSOnfLxifQwumwi+kg9/bHN4mFaj97zlrxDtzCzQAFhH/ivI3dj+APxBfiM0Pd+
 HfDT2i7OjsXbzRMPEloViCgd2+klmhD1pe/8jSzPzLPWvsnPFAv1327GuHwbV1lg55U2
 chjQ==
X-Gm-Message-State: AOJu0Ywogid6HYHWchMlGolrYPxM6DmBakvx4DDYhqP3Sv5FyURXV0+j
 0ZG7jIELhIBA4xcYY7Ozr884APXqWOtLw6Ie2LMrThFho1T/kg6u3RVKPgDt3Q==
X-Gm-Gg: AR+sD13PbT8NETPBIqHmOqyRz/vbhgV2RlmVVL2t3P5F1ivU1w3eIAEy9Sc7QMm2QX+
 24xbLQJT0rqLC+j6jNK2zLXYk+Lx+cIkzNq2Dya0uK7u3q+3MD6J31sUivs2rj/Ktr5/2rDZKd1
 9xXo8Ub4Qs1gtqH0c1OHpivWLcJKY4t0CMneoivm9ZEWrhNLt4+X4Dn84EcT4NRfBTo+IY0vfXw
 8K9kMChNdd/PP2QkOBqUL4tAiT9b2CuXyi8DSL5h20lV1tWg9GqabE3110NzXnWBJXXbNhGs0nw
 FdKwi+ac6HohEIL7wRCbxo5+a4sczuenbDEbtjgHFWOwoRFv8ujWPWo5A+uc+ElcBjP9q1+dBzN
 OqIiFMWywsYZynnX2Vh5W+0sW1tgp4PaC/rtOqeXQO0GnS/+2qQMTWi2wCLEn8sfn2fOJvBAH/B
 ARv20uB1FQ7Yu+xts2RriDBDsO8zSmeJYQEzWEn2/9exnQvF4BY/KeVrw2faz5C9JQtPSO4KVRE
 sQaqAchLdOu4y8PXmyJXw==
X-Received: by 2002:a05:600d:6405:20b0:495:5e86:4e11 with SMTP id
 5b1f17b1804b1-4980c672c9fmr140872925e9.12.1785740390304; 
 Sun, 02 Aug 2026 23:59:50 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:50 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:32 +0200
Message-ID: <20260803065940.224429-2-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803065940.224429-1-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740390; x=1786345190; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ps6DDiHRMqddWAblv3fWYb7MzIXsZ8gFk6A9/6FSuw4=;
 b=LNMAtezxsa+EVn/z+75wbELXtk6nqAPDbHYbeX2XfryE87t7Zo9HinwNWzn7tf9jQI
 jVzvZeHwM12HvbNZgOGhibUJngtC6jzFWpyJpkq8fjHjRGFRrgMfDiCbZI22k60AanDu
 esyzqY22yEg4W6UQAYDV99mgBSA4h6C5msdRjCLUF/hh1cCUMzryba99Tg3fWpuHt+ow
 iRg5DIUAVqCNFK/HBZURYZ6lT0nnKyvA1ceSWkenGth0xwqHoJZOgY46tMNfrjD5Y5cO
 N/PzYlWBA5NFE6+GU1Fp4ysxhV6rA11uOlwXhBQYj5ohbbNsMr1WeWr2aQyZqsdo4TBW
 Pc3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LNMAtezx
Subject: [Buildroot] [PATCH v4 1/8] package/qbe: new host package
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

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 DEVELOPERS           |  1 +
 package/qbe/qbe.hash |  5 +++++
 package/qbe/qbe.mk   | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/qbe/qbe.hash
 create mode 100644 package/qbe/qbe.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3530d515a..23c95db6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1177,6 +1177,7 @@ F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
 F:	package/janet/
+F:	package/qbe/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/linenoise/
diff --git a/package/qbe/qbe.hash b/package/qbe/qbe.hash
new file mode 100644
index 000000000..2250c493a
--- /dev/null
+++ b/package/qbe/qbe.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://c9x.me/compile/releases.html
+sha256  a6d50eb952525a234bf76ba151861f73b7a382ac952d985f2b9af1df5368225d  qbe-1.2.tar.xz
+
+# Locally computed
+sha256  2b026a9038be00b1102da922775ffea4857ea755f63694efc36dcbcbdebf23d6  LICENSE
diff --git a/package/qbe/qbe.mk b/package/qbe/qbe.mk
new file mode 100644
index 000000000..04391d739
--- /dev/null
+++ b/package/qbe/qbe.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qbe
+#
+################################################################################
+
+QBE_VERSION = 1.2
+QBE_SITE = https://c9x.me/compile/release
+QBE_SOURCE = qbe-$(QBE_VERSION).tar.xz
+QBE_LICENSE = MIT
+QBE_LICENSE_FILES = LICENSE
+
+define HOST_QBE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_QBE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
