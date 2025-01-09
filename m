Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB178E7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F91403B2;
	Thu,  9 Jan 2025 20:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xg_gXLhnd-n6; Thu,  9 Jan 2025 20:11:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18740403B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18740403B7;
	Thu,  9 Jan 2025 20:11:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7A2F942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3CB160698
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMBEkXjtm8u0 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AC77606A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC77606A7
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AC77606A7
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:02 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-84a012f7232so77121039f.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736453461; x=1737058261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QObeCK6om7sxiA7dA/rHJd28dMrgswZ1CQIMaxLJmFM=;
 b=VOvF4X2+9FQr3hBydwevoLSBUS4CKj7zD5ELDP+LY+A5q6gXsHk4xS6d94EC3gbqfg
 +h47eRIEmAxi/SQw9OyuA0O8nYVdURGQc6iS7MShkZAuDFNxFD2I1nNbxqMZM02VuFtd
 2k+tniyT1jObv37uMh+/PQttyzaJeC4vOgYdDvE3nic/AonvCGaI7YsJdQyuNIahap3j
 XpFPsT9XcafSq2Obe1OjhqORiA0YfA4pboda1bXTlQxZSSnR+LLA7or+eLasimbLKiv7
 TYljNVNbDG3nHuWiPE4hO+gk4osYXcy2HLF/opgVSr3gr53I6Jf8AogR/bkxrhbnsiih
 ptsg==
X-Gm-Message-State: AOJu0YxcoD2W23rQzbffAIcHlL7+y/M7QtJqD+pPPW2gSVqEsKg75hxd
 Al4HrMW3dNlB6P8I3xxQyPkzN5TxSbt4dQhOvaf7asS4ilAWQEQZGWkjth9oKj0=
X-Gm-Gg: ASbGncsxFva1dypwoQENv0284J34gsl6GOVkUmYE5LK5bBXakgVrUYvnwXceyGlahqZ
 y2s0/gfBCovdS7erzNX2wUq6qgZgCiUO10hVFEHvP/8SQQZ65poPtQ/j9EVuDsEsKjXU42oT9KD
 BtEpRBQmWb3ZIoc9jKAxlUtDBPzNN2rpPqDOaF9E7hws775ejE6vg+qMBkvRtJWVqSa0fYU4XYJ
 QoPsunc/W7EtWb/ZnmfXJ7cbc2h/G9TWjBOC0QRn/lH+joks371Z/bziYweonfxNwewapHHmVKn
 xI256Ms6cG23uQgxM10pLElyadeTOT0=
X-Google-Smtp-Source: AGHT+IEDQAndnhMt5FBA+pwzD6Xk6mU5K/u5XB9VQsqKjVaz+TTj6TBfCpYkUQqdcrHkDh5I50ltcQ==
X-Received: by 2002:a05:6e02:148a:b0:3a9:cde3:2ecc with SMTP id
 e9e14a558f8ab-3ce4757643cmr34315425ab.6.1736453460920; 
 Thu, 09 Jan 2025 12:11:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717838sm479399173.102.2025.01.09.12.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:11:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:10:52 -0700
Message-Id: <20250109201054.2382903-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109201054.2382903-1-james.hilliard1@gmail.com>
References: <20250109201054.2382903-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736453461; x=1737058261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QObeCK6om7sxiA7dA/rHJd28dMrgswZ1CQIMaxLJmFM=;
 b=NmSAC105N5yXMnrgjpwNuaKPX8D9MCDHbe6EaKwZJ/LAx1kWB+Z888bsHM3EPSjZPf
 DfxuRrGkW9B8i1yxK/Om3o5jpD7DuG0bCIbhwXcpig9hNOn3w7dDGEhdp8NLPuCdDnFt
 22NYzfIhLQTszVmd7E0wpXZQ6iZgOYOmRAqnk+MUZybpX69L33Aii9cZFNpNgCEsHm7g
 Tc9z+YEIl+/+NA+d0y8cQeN5YjY0y2i6VFCVjjo8aFWbkWuala992GDs/Alo/SoZY53R
 ZwZ3+zYUQA6wT+pJkEVsYbEC8VAuukfh2dhfnc64AWmcHYWjaN7LjuRfCNMufpMROdcO
 jd8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NmSAC105
Subject: [Buildroot] [PATCH 3/5] package/python-mypy-extensions: enable host
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

This will be required for the upcoming python-mypy package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mypy-extensions/python-mypy-extensions.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
index 494a03ac2c..99b30b2c07 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.mk
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -12,3 +12,4 @@ PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
 PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
