Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25A4FF886F
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AECD161094;
	Tue, 28 Apr 2026 17:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_3sM2GERDvU; Tue, 28 Apr 2026 17:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47BA760F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396835;
	bh=fZ9mhW+LXvDq7XdRH7eApbd9LHhBBafJPFx996KOSEA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iYvTBgdtmGnEZGIrsmEtxZc8t5R/0h6gqqPVqG4pveRslXMueaWC7G9YB0uxHsp/b
	 CXb2/nRz8WLITHPS2pe5txN1u/OxDbLLOcBxIMB9ocEKh7LAWM+Ke8vlEJMHzcFBPf
	 nTcgk0y1yo95R2YcDhChRLsVzRR/I/Sg+gYtujLXvJ3n0MmOfxGpKuDN0h49dxwQNu
	 dk/CeGjs1T3Chxh6Zm/1sASDQipOLdV7GOUdiXl1rk4nWPlUri2d/shv15+9hIzprf
	 Y0Egiq7s0pWith5HNf1hwqwEQYpcJIeZ9WHoDbKoLiEnarHNh6tZGWtu2uJjauPDWv
	 c/bFSjsP4qSwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47BA760F26;
	Tue, 28 Apr 2026 17:20:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD2F31B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EF4D83B7E
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkY9fPl7I_8J for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:20:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f44; helo=mail-qv1-xf44.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C0A5383B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A5383B6B
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0A5383B6B
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:20:32 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id
 6a1803df08f44-89fc349b5ceso166707416d6.3
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396831; x=1778001631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDHwbMiXSaFPGVCB2xU2SzwBCngcGS7SRxvDaHwKHYU=;
 b=KZH3/rNysy97Ngg1reYeyAamXFFqgCqQ3318PdFFuc4HC4hHe9nyXRvnfrhxxZ0TAr
 j60AlQjDpuj5aU07CbC9rGLt6QZbh1OD90TlT5hxYg1OvspxjOGJpE9o2saUQMl8qV34
 cqOj35Ybve+Ie1csTbclKgJCZhfQR8Y5k7kYlnytLeVxj0oh8bZBA3lai/w2FHOyQE6Q
 ymbTl2m/0wb3yzFDaZtTVEjBaFs7fkYfdsciSMyGh47CPJjIid6Q2nyiSZEJdHnQ4k0P
 s/yyWR1SJM4aVCHKCnetzFlgpDdKRm1M08DoltmWJUmMYAsxXGSC0jEXF4G0LCfuposZ
 oE/w==
X-Gm-Message-State: AOJu0YwAYY8pWZgWjcTr3pzYyzSS+D2LbrudETavEIY18IC1Dwus8A3X
 xzsRXtv6pPyQOwvlmb8tfWGFip8GdzsNRqfTt6ICzniF+YgeE1c+RPR8PbKGh89tyf6B3w==
X-Gm-Gg: AeBDiesVhmd0/y9PC1LmWGoAQkflI/iRtP+/4tLnGmCEzldc/rfeljNzedAq+r/4yZC
 04EFyuBY3QUb9HNMiSFgeDYHF+TmoZa2MG5xqq2x/pbybhnBc9Kfcl+uw8eclD2IKVy6uWTVMbI
 RRsNHfBqtUWMGFu/zax24JNwKt1wRp2wFOKwKq4IZtfYYV8D/UC/btK5SKChgYeHHv2CcgrNdHq
 0u3S7rt+8aDxM87paOfn/9O/vYsgenAJI6pI/Xl6nlgqAsgK4yigFMnTGjx2iCIKvXsyiUn7Kxf
 80FlnXJ0g+LuEy5TgGRfgFt77P7VN+n/vQgr9CZb9PcmlNslwgbwp+dhYU9mP0bjEQ2v/ObIQBd
 9sof245HkSgzM990vmC5T7iwBFHHuHVMiiJbUur2xTx8htx46T6NZwn/BanYfEb8gd3hNMFf6eW
 6XWowGBIHx2uazF4NrTHooke4e5zB/bOoFGT/2r32sWgIA5fFL5uflLnJt5c3jCj9RSsHzoYQN3
 EGubA/feia3dX7Kg7bO
X-Received: by 2002:a05:6214:320d:b0:8ac:a4f9:da76 with SMTP id
 6a1803df08f44-8b3e31bd0c4mr77643026d6.26.1777396831212; 
 Tue, 28 Apr 2026 10:20:31 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3e2848264sm24517906d6.17.2026.04.28.10.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:20:30 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:20:00 -0400
Message-ID: <20260428172000.2671-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396831; x=1778001631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DDHwbMiXSaFPGVCB2xU2SzwBCngcGS7SRxvDaHwKHYU=;
 b=nCqyeT8yBfsZ4KK8JOaJIsExbgEixJkMaqMK3ydCx9XVsZ3JrS/b53tnMaifiAh9ys
 GdQ6al69ijcpMimfeNMiyjr4jWEeXiuf2yA65mev7YfZhZM6d6GwSovWzwN8k8LmEFz6
 WHlYAPtyQ1dD+kLRMPfPJM+s9466Y+quK1ks6xmCnkAASN+QIXZmzC7gxwHZ1HsCuzuL
 DbFiq7PROoB8Wy3Au7TaDFYLhL8LeG3zXrbGkRV2NdiSNf9nUitSD20e4RvNsyN4yBwQ
 tWPuXZ/Jhvt8GSitMcEncth9P6zKBVwYb1FAMl1osEbixcefCVl4ERUVUSZpgnIhywyZ
 iHNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nCqyeT8y
Subject: [Buildroot] [PATCH 06/13] package/python-nmcli: new package
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
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-nmcli/Config.in         |  6 ++++++
 package/python-nmcli/python-nmcli.hash |  3 +++
 package/python-nmcli/python-nmcli.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-nmcli/Config.in
 create mode 100644 package/python-nmcli/python-nmcli.hash
 create mode 100644 package/python-nmcli/python-nmcli.mk

diff --git a/package/Config.in b/package/Config.in
index 754bdee9f4..83c9e0809c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1261,6 +1261,7 @@ menu "External python modules"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-networkx/Config.in"
+	source "package/python-nmcli/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
diff --git a/package/python-nmcli/Config.in b/package/python-nmcli/Config.in
new file mode 100644
index 0000000000..acdb6a1423
--- /dev/null
+++ b/package/python-nmcli/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_NMCLI
+	bool "python-nmcli"
+	help
+	  Python wrapper for nmcli (NetworkManager).
+
+	  https://github.com/ushiboy/nmcli
\ No newline at end of file
diff --git a/package/python-nmcli/python-nmcli.hash b/package/python-nmcli/python-nmcli.hash
new file mode 100644
index 0000000000..d11842e3e8
--- /dev/null
+++ b/package/python-nmcli/python-nmcli.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/nmcli/1.7.0/json
+sha256  4fb17b6c33d276a264a27b7109fa1d70987570536fa8852b51830f9f7732f982  nmcli-1.7.0.tar.gz
+sha256  9dbbc4debacc85f5f5f074614cd9cadd61da09eaa19f98f6bbb5463c34133820  LICENSE.txt
\ No newline at end of file
diff --git a/package/python-nmcli/python-nmcli.mk b/package/python-nmcli/python-nmcli.mk
new file mode 100644
index 0000000000..449131974d
--- /dev/null
+++ b/package/python-nmcli/python-nmcli.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-nmcli
+#
+################################################################################
+
+PYTHON_NMCLI_VERSION = 1.7.0
+PYTHON_NMCLI_SOURCE = nmcli-$(PYTHON_NMCLI_VERSION).tar.gz
+PYTHON_NMCLI_SITE = https://files.pythonhosted.org/packages/source/n/nmcli
+PYTHON_NMCLI_SETUP_TYPE = setuptools
+PYTHON_NMCLI_LICENSE = MIT
+PYTHON_NMCLI_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
