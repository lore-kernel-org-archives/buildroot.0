Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA42EE645A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 19:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C9784052B;
	Wed, 31 Dec 2025 19:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_K5JDn3tWl8; Wed, 31 Dec 2025 19:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6313C404D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767207991;
	bh=BcT+WvAt5gwi8eJ43FPSOWKLi34Uhol2D4VAzr+etwo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MSc9dgFAnF1xvlFUY43ouTcz866ROFVy/QzsTtf28vZclV2OWq8eY06Pd6JVs18Vz
	 kPDZdaQF2SD7HwQewqsmuJ54LEiLO71oXAnfLWfw3NAlZWbviyLWq1RPLe1WqstArd
	 szmw3frQt/ArouiTkoKvQTy239sxEz3YQcjpDcGwFjOmBb8l1NePUtw8jwjPAjO6oT
	 O89P6XdmgrBHQqHA1ggJriPQFwcxMDGiGXPeIKMniGsD8uH2It7aViiGEBQBZSLnNl
	 h/21M88OGWXiA8gfp9rPEg3nMHVXCTnq0jw4wbiinKz1CqoZIRNO48/161a4r7+i+V
	 umvW3vPvOyK1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6313C404D7;
	Wed, 31 Dec 2025 19:06:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B9AA249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 511B280B78
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJYOSE1N_TuA for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 19:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7310680B37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7310680B37
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7310680B37
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:06:28 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-459fa8b6044so767264b6e.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767207987; x=1767812787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daL9dUMNFvmrHw1vIPBdFG3hZMlUjBm73Cb1+sLftiQ=;
 b=rhsq0WcqKbsLgTqu/rmdCGh6LMUDXzNpbiV6if8BaOk9h+jbN6wdql8Z6/6AgxSEyy
 eAw5jvx3zIff1HImevp/nEuE5QCm/+lYmGBNtNLtN1xNWkQORjUCShwC94Fh/fkvPtam
 kOuvHUEnxnDL0VvM4Dwh3mxHcsTnmWISLfG2UqYhK+EuivGO1ZbbWy4RiXeKhJ+ZFcUf
 yLPyMlaDue55GBlTexmythfbxwGgHJL6YRNMBK4ghnqa7r0N1FABamCJMt4IJvr/o69O
 pIYBEiIK6j7Ync9R91YCbsZ+tkZZ7dBYbjCpYHaswLem/WKCvy77X7y56uApHTu0UefZ
 KCYA==
X-Gm-Message-State: AOJu0YzY4T5G1DyrTqYHVHiQEc3D8rh7XvtcIdxZLTIvrI/aeZXXMd0M
 2XZADiGFzXoVr0EmbyaxfFFVsom+yWzwuIovErcj3dq95yV3Vfappd+fOFNHVB0t8iA=
X-Gm-Gg: AY/fxX4TZ++F2mjYMUu2og35VRL7bQ/V5DZzjrpGGFmiidWg4C5VGNUxzsSwIkXyAe3
 8PYZ+9CrKL4Wyr7pP63sObpzmvZRJdZr2mr+NSiOzJoo0qRPU2N3Fz3rPsJhSr+oxbmFu9ulMta
 GJ9dg7H9i2Kx2uE/GzQYgLh7j4Fvy6TZ01gr/x9w7XcJatd+YlpIk9VkxftYtzWuHpmiROm/TqI
 SaEh4AQU+Cjc7zSt61k6AhdGvkdetcpPGG6GzOU/PdwbAC1+vLxbkv7rLHyoFRdmhpoIaDTpUG9
 3uMDSNteMnTKMOeHzHS+WzBnBVxi2+fkgOD2nXWxKKjY1+ku7gQ8Piial3q1mBTMwZWFQmdhwNv
 Yp3CT6KOTmbXpVBGByxhJDPnhXwpAgEHMI+v/9VD76nL1km37Y47qJvF7yUDCylmbmqWIzdqfj4
 W1qCQTkKvrZnJBnXtdH/21aq0dke2HCO7S+gWIncxuLbiy6seYWdW4nYqRkc3ie0ahZEcsVSuIB
 TwiZtaqeibwstbGTD/ehjVZTKHMsiTSGNthAQXOSvmyNtEPdhZqz1A=
X-Google-Smtp-Source: AGHT+IG9gMmBD7RFjOno7X2rZoIq3hHlUXwI9RSHMq7sFLz84wSEcNFVMDtIjwIn7Qnp7JxHLSnBFg==
X-Received: by 2002:a05:6808:150a:b0:450:b28c:6b79 with SMTP id
 5614622812f47-457b2247114mr17948713b6e.59.1767207986974; 
 Wed, 31 Dec 2025 11:06:26 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-459d35531a2sm5340579b6e.14.2025.12.31.11.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 11:06:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:06:23 -0700
Message-ID: <20251231190624.3980084-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767207987; x=1767812787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=daL9dUMNFvmrHw1vIPBdFG3hZMlUjBm73Cb1+sLftiQ=;
 b=HXOILwJoLsBHsrmIgQlLBpC0nCQyuhkKnuX+L5Hj3lZbuTRgSO5kokrIEdwfUcDOiT
 adHoFv5Wc6HDM7IUQ/aRNnXDla17U9uLOXFiP+z6w4YuVBK0k9b3wJGXkwRCxND22eV8
 2M7hiq0MdzhsXIGfUyPlB4vKYN3TwSOD30b7PHYNHebwokDEQquYJvjAmwlYrXe8xfBr
 lxS4srOzEMoQusy22JUaIx2eIQ3jRcxwnBCcO6n+RoY/TqAHdGy1/YmiFYGLgyEKILxK
 iaA6HZC3jAGnMtqJJ/M5aHjG6iKV9TSiggncN+nugvCXODiro+x9EKpQQ8uZ21HOaJW8
 ODtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HXOILwJo
Subject: [Buildroot] [PATCH 1/2] package/python-coherent-licensed: new host
 package
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
 .../python-coherent-licensed.hash                  |  5 +++++
 .../python-coherent-licensed.mk                    | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-coherent-licensed/python-coherent-licensed.hash
 create mode 100644 package/python-coherent-licensed/python-coherent-licensed.mk

diff --git a/package/python-coherent-licensed/python-coherent-licensed.hash b/package/python-coherent-licensed/python-coherent-licensed.hash
new file mode 100644
index 0000000000..b23a9db414
--- /dev/null
+++ b/package/python-coherent-licensed/python-coherent-licensed.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/coherent.licensed/json
+md5  5c943470c62e4a7825e783a53816fd18  coherent_licensed-0.5.2.tar.gz
+sha256  d8071403ce742d3ac3592ddc4fb7057a46caffb415b928b4d52802e5f208416d  coherent_licensed-0.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-coherent-licensed/python-coherent-licensed.mk b/package/python-coherent-licensed/python-coherent-licensed.mk
new file mode 100644
index 0000000000..f827610046
--- /dev/null
+++ b/package/python-coherent-licensed/python-coherent-licensed.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-coherent-licensed
+#
+################################################################################
+
+PYTHON_COHERENT_LICENSED_VERSION = 0.5.2
+PYTHON_COHERENT_LICENSED_SOURCE = coherent_licensed-$(PYTHON_COHERENT_LICENSED_VERSION).tar.gz
+PYTHON_COHERENT_LICENSED_SITE = https://files.pythonhosted.org/packages/cd/e9/63d2dcccb5496cc99d96f29a8a5f3e2c6ed0bba7fedb840862f92816ee17
+PYTHON_COHERENT_LICENSED_SETUP_TYPE = flit
+PYTHON_COHERENT_LICENSED_LICENSE = MIT
+PYTHON_COHERENT_LICENSED_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
