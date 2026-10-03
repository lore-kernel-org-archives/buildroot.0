Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D7ACA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39CFA6061C;
	Sat,  3 Oct 2026 23:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6mL_uFUv0CH; Sat,  3 Oct 2026 23:32:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 302D66061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791070361;
	b=F/MccLDSzipJTEMb+vtG3jCSgM2BrfG1Cdd7rjx1nVc32MgNcZx9UIZSWmbFOFiVh6IN
	 cbCxnUCA2Ia2VwMRhpEZn39TaOgehy/AVgTSQFiGzsj6zgu2r7PeRjQ2NSwpzkidXt81j
	 BKp43uk42ExLpQMi1AAQ8c5+K8Sa9/4dEq9qGF68jIcQmmNe8tVz+gY6MLLyhDn+AnVVB
	 cMKatknECQ9+Zy16fgwVes07Jv5iYePNKk/xlUyca2oEK794ejuGlIsFsyxOOOA7M9FFS
	 /flgydMSzQHK+OL1/Sy9fFH38DCL+xyueF6Z+nmfSDOnruKgUFEVBxesP0jaMMO2oLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791070361;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RyZjy04zeis9FNsohjeWz7qFR33ZrHlh+LOk1gco8jg=;
	b=GARooIR4CYvWuDkIRgACU/U74CgrpactBiwmBviHt9J0LR/16Wq9dv5K9i+1z1ei5QTa
	 swlZ3XOJzvulZ05Urhc4vhBD6neQBvYkVixwr7djkD9SSPsnneqLZAz6ciaGeYQCKIE0s
	 dmOwqd6ZNSup/8a6HBaUe5p+WqodLV8PY24AfOmOpYROYAP2Eq/2/0v7hCleJyKTXMvOf
	 4685heyQ5VOC04VPjUjQVEFk2O6228i1+a4H79qflE0gfQd/A+FME1FE3wPYCFDaZS7qD
	 T0R0zGGzG/MWdV57GyNbhcT3hyssogVkU+VIGdCv/GzGUjZJAda/CMddHICWnYI6EEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791070361;
	bh=RyZjy04zeis9FNsohjeWz7qFR33ZrHlh+LOk1gco8jg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IcCRe+eyj0ALwuAb97GNNigM0yADQZhGMHtRwnaWZeLBi9bnuxT0NW7ivrDRDiNbO
	 2sz6FLxMdMzltminFY1CTCQo+xzhkKCtEkJbAblzeEpVzLspazzXuT0t7g3HzJvMpI
	 Lv1jhHZxWTFtebIp63Wp8wal8Skud0y7KDG5TfoAgkoNQmY8NwJR0D7PcsWIRPeiFf
	 8JfU8ObNt2ZBVNeaBlGWPJHfTWfZNN/jlhEqJJQ1If3OcFBQKbDpREyz7HI742YQR6
	 +79lw5g8ojrFiWdtnBzUw0o/Km5ejrf6KeXCEzdoEQnDowEVi0xDynICPIpez90MCY
	 56X7N98CW+cHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 302D66061D;
	Sat,  3 Oct 2026 23:32:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF6272E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D164340723
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGB3jIp-oW2i for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:32:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ECEDF406EE
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791070358;
 b=PDtZ7M5aErw2AlophPU+DD00p0e44CX5TKSdlqQA5RCfW29j2edo1emDIVaOmRpkFxMP
 uLwygv/iPct3MlmrfuvqjQFvpkdTCgNlq7AdAAedQ1qd+ZxhK4Dgpdfi/vYg2jBwFMJAr
 u6jVhsFch52m2AZTLzC4Ine1c+fINyPNioftXTuOuIt/Xqu7NKD0PB53l8gsW4yJ39AZ+
 G+IUAxtXxlFE6NBRbpPknCjgWcGo+FzNVj2fRAJ5pE1YIteiE5zbLqycc9htxIHdHqyXE
 +aNRypW9o6I9mzhiFd6JBnUZ+cPeToVBxV9E34qZLSuoJYhIiadx1ooN5WF2OUH4hCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791070358;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=vOVG7KJrzK8c1lbySoWj4yI/Gv83jMBNDFbdo+uCLRU=;
 b=au8piiY2XawAX37tBZ5Wo0n19hkYMbE4VYiMFEKbP7ziyGzsaG5IRHZUT+kXBr18+F+Y
 26PQGmOFCQGnZEPGdZheUzrZ8CPdOjw0v4JyYm/YglpZWCiSDfBgAM6fpInoKXZnR72ve
 RNxR5CaW8H91ZJluwbcbIZor3Z23rfxHlpEsWso9eH53dExSL85vfoEzi83btbXUXfGXl
 quycsR5ByxwRoG+kWXMWSdR5FKXFDFI2AJXU/e2/k3ki1gaZox/3a2VAg7PwAto9NjAUo
 N1Ly2AbP16UQtYuG7fWNx8uwlwHo1xQhTahrIq3R28ZT+NPCvpGoiCiimdvo3a5ji7g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=a9uK5GZF; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::28; helo=mail-oo2-x28.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=a9uK5GZF
Received: from mail-oo2-x28.google.com (mail-oo2-x28.google.com
 [IPv6:2607:f8b0:4864:31::28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECEDF406EE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:37 +0000 (UTC)
Received: by mail-oo2-x28.google.com with SMTP id
 006d021491bc7-6d77aa5735aso647803eaf.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791070356; x=1791675156; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vOVG7KJrzK8c1lbySoWj4yI/Gv83jMBNDFbdo+uCLRU=;
 b=a9uK5GZFDvb9/6/21rVqwiA+BGvqVJupRWywpSGplP5oLrl6Nho7q+IPep1c1iatTC
 PkkiPxdBhwKT6pJ+AC9GGbh8KYOpDoATQ7YkUrAFQhvmKXQ3xTk+Ydl8u1lO+cXPWwP/
 gByVTqOOEBW7CfuctazqH+JeZLUaiEr4cuJLHzeJgUol2uOy9KMKhwGgbU16y7QbOV23
 xMA9xsNwGeMID7eyj/6ngeyregli/nvrzdHnyLZtU73IkNO319XOTJUt/WqOUyQIkWUD
 1wx0xa9M5uGbfStNTCuNHXY7T0dvnDvNk7g8VO3rmk4JW/bApxZVBDN53CoHlpKLEPMK
 QKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791070356; x=1791675156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vOVG7KJrzK8c1lbySoWj4yI/Gv83jMBNDFbdo+uCLRU=;
 b=o66VA8MWIOKQpyfudmUmcQsHdcnevBxWlgIL5z1mf3NcZptL+wq5ubIWP3siUdP9SV
 6y6nMZo/nsBdTutU76AHG06yWkZUBMCExLowBHgHu8uBhiXnLf+kIvGygp5e82puZoAu
 8wxjG9L0vUK73MjfsDxIBo+21HxzFHQEZ+PqcJ5xcFgE0SkV0HsOeRZLB8LsnGbR52vT
 bkfneOn5dRe7dXngJCdfh8UwiVf3hG/C0H6skF1FgFQHVT7dWCsxa/ggqfPy7LYL3idD
 C2uv9AYRrCJ4Z8D0gPzEgdXEMEhE1/uwltIrc3pTbjMGg/F9OKLGhCFzjcnrCcPqOvsQ
 /1jg==
X-Gm-Message-State: AFuF++k/kz2k80khXmaNqYkp8VnH7zFJtwpWr00uoek3gM8wjle1S7yy
 rtNt32IeUfEtVV9c5qpCYI1r9z6y0RFwcrwWy+VLGwa6+8d2kvoksxekVt2P6g==
X-Gm-Gg: AYBFou2vdN0t8+Z09Qm/V4nG/jhKDX3onhYevtVQ5DML16EmcHw5XvORUr81UC6Kvi7
 oRy5ZKnElMwpZtifAilbWm/IgmZO0PsaWOArHTwpItcxODDVlM/gQN6ra/LvyT3wsi9lFAJb7i7
 LWpPXfIZOlIpxEG+nASVf3lBHwmlc9o7YoyXGQsTg9IUHSz2pjm7K9J3kxwQde1It9y4Tkfn21n
 ofvmyWq28Ax8pfV8NDwQ6Zg7nnyYacBiO1CKwcRMnSkQyCAaqPUDEOcDzdpSt9B1vJHt+ASM7N0
 CvrEMZl5xR9tESZmYcVZdrNKujzweu81NEDiBc4za/shtL6zUee+Ez+BDWpBs28Wvihb63zBtmC
 3U88dw4tpGo+NeqxVTHs1Oww57y+IMHRybEfhJaVdH2MGVnLaN60FjHpkNBT8x25R11KoGAnOKg
 4Fv8kjv729nyZM3Y2jJCIisM04NZ51Lq5UuS//AcVVTWE0xdMOCmAIlnMKxpikDB9wiMeKbuqk/
 QNKp406DznTKTH2JKd8pFfnwyO7uNbH2CymnI4TAzmBCAuCYfriprvRd/5nlPbbS0F7oh3ph8i4
 LO11Ly7UVH72oTyAtq3BEIYzOm+VKMafIoyKQiyA2c1lrUWmiW9gw/7fWa4Fvx6Tq3rltpU8Do9
 11AOUo+xxDnwlPIhL3E3HeV0CFOFgLqvKQ31+HCLL9CvhEIb05WiZ
X-Received: by 2002:a05:6820:560b:b0:6dd:3534:478f with SMTP id
 006d021491bc7-6df34e67acamr3235467eaf.73.1791070356474; 
 Sat, 03 Oct 2026 16:32:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82279b7dbd9sm7045147a34.12.2026.10.03.16.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:32:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:32:30 -0600
Message-ID: <20261003233231.753958-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003233231.753958-1-james.hilliard1@gmail.com>
References: <20261003233231.753958-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/python-typer-slim: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                |  1 +
 package/python-typer-slim/Config.in              |  7 +++++++
 package/python-typer-slim/python-typer-slim.hash |  5 +++++
 package/python-typer-slim/python-typer-slim.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-typer-slim/Config.in
 create mode 100644 package/python-typer-slim/python-typer-slim.hash
 create mode 100644 package/python-typer-slim/python-typer-slim.mk

diff --git a/package/Config.in b/package/Config.in
index 0b6b7c3188..b2154373a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1492,6 +1492,7 @@ menu "External python modules"
 	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-typer/Config.in"
+	source "package/python-typer-slim/Config.in"
 	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
diff --git a/package/python-typer-slim/Config.in b/package/python-typer-slim/Config.in
new file mode 100644
index 0000000000..b7ebd275ff
--- /dev/null
+++ b/package/python-typer-slim/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TYPER_SLIM
+	bool "python-typer-slim"
+	select BR2_PACKAGE_PYTHON_TYPER # runtime
+	help
+	  Compatibility package that depends on Typer.
+
+	  https://github.com/fastapi/typer
diff --git a/package/python-typer-slim/python-typer-slim.hash b/package/python-typer-slim/python-typer-slim.hash
new file mode 100644
index 0000000000..a28241beac
--- /dev/null
+++ b/package/python-typer-slim/python-typer-slim.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typer_slim/0.24.0/json
+md5  14f8007acf188b8e8c3d41f9f4e00be9  typer_slim-0.24.0.tar.gz
+sha256  f0ed36127183f52ae6ced2ecb2521789995992c521a46083bfcdbb652d22ad34  typer_slim-0.24.0.tar.gz
+# Locally computed sha256 checksums
+sha256  58992cebcf8dfb6e40c4e2112ed12126c243666dca3912a3d78b7ecac4859d49  LICENSE
diff --git a/package/python-typer-slim/python-typer-slim.mk b/package/python-typer-slim/python-typer-slim.mk
new file mode 100644
index 0000000000..0be49b20e8
--- /dev/null
+++ b/package/python-typer-slim/python-typer-slim.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-typer-slim
+#
+################################################################################
+
+PYTHON_TYPER_SLIM_VERSION = 0.24.0
+PYTHON_TYPER_SLIM_SOURCE = typer_slim-$(PYTHON_TYPER_SLIM_VERSION).tar.gz
+PYTHON_TYPER_SLIM_SITE = https://files.pythonhosted.org/packages/a7/a7/e6aecc4b4eb59598829a3b5076a93aff291b4fdaa2ded25efc4e1f4d219c
+PYTHON_TYPER_SLIM_SETUP_TYPE = pep517
+PYTHON_TYPER_SLIM_LICENSE = MIT
+PYTHON_TYPER_SLIM_LICENSE_FILES = LICENSE
+PYTHON_TYPER_SLIM_DEPENDENCIES = host-python-pdm-backend
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
