Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6601BEFCE37
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0628221D;
	Wed,  4 Mar 2026 18:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYW8H73f9DA4; Wed,  4 Mar 2026 18:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A7988223B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772648433;
	bh=JmSe8UqunFYQSW2xPnmyBV/Bt33PFtAzxcapwZOBU4k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kiIiEJNCR7/50PNxqn3/G1x/L8q2nG1uU3u97Fkhdmkpu8o1Pwx24E6cWGZK08oiX
	 hTlpVkl/HK3OQ4w6xO62QICo5rhyLPK/vOt+wFYrZX/y4KDfLPxT0pOzXDDZgNaumL
	 TsEp9tjU1in4U9smvB3xg98piCuzzybKfuhLakQPjEWh83JHSuZSlPOuEYNlNZX+tr
	 XaWZ0rkvw93ekvCOkIQMIPftg1pwOHK7Gxs5lVUsXjNQZ1F41G49zXXRLxuFHGeVMI
	 r3gC3KFVr3QAdts6OKv04l3ajrwhPUF4imW9xDdDR3DM/5HcXZx8GGIVJy8u/LJewX
	 F3ciqajrCBmnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7988223B;
	Wed,  4 Mar 2026 18:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6247B25B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4829C8223B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bf7uO7lCTDBd for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55A208221D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A208221D
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55A208221D
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:20:31 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-464ba2bb3aeso5450931b6e.1
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 10:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772648430; x=1773253230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/oFYnP+9qzG4CukBTlS0vKQsOqmpQnA5IpqHB/3YfVQ=;
 b=ZGsdsKVAqZyboxwvrF7BGlQSoYVxSje7yt52uJyjThl85Slh0R62wpdt9hpmCOS2UK
 lHhO46SAP3S5wxdiaouwiobO8btv/1Sru0m4OvacVAigEdzubd+2i7869Jfnej/CcrOQ
 cI9ZuYPhkgqhVlbdUJptDENUMq4E7PO30Nntp2xbq9M/CypRWzJy1IM9ECA17GEyiBLj
 IUuyuMNVw7b8vkAnNuh6TEV/4bm1u8T2Q3KNgjl0EdosJvyrspyI9f70MgdRf50mkX+6
 PXBPSAqIz3ScHi1tebVdS+RvEYxuaB4Afnxb0ZbwwzUDE2Af/nzz09O3tdsJKQhD1ecv
 Xq3A==
X-Gm-Message-State: AOJu0YzLmAc8ycQTvwvncLd+YGrZDC2kL8OCAFPjTIQOocpjBIico/Iw
 /3OzDkIxBjq5Ksa98glZfiFDfA+Fg1HxJdz0tCSNB6a+2M7YW29zgG9l9Wd7yg==
X-Gm-Gg: ATEYQzzuSvoRmJ6O37J06t1gYjAs0dQ9WBZBO8Kgsfb6UGUWO3uwa5yqfMrNee+TPCp
 7KKqN+iknH0qqxLSlKrlyjnQU+oLtbOJQbsOU74lbv5KkdKZkmCcMEFZq/h8xC9Ka25R4L4JWmG
 koOlmLsqYhSjpWOB+F1qQ/+qYzql0vgkEm5YtcyuNKBWxR+cHFdRRV4IJ0KtTgJ/PPH3qrBYNkG
 yjdbDZsJUR/Y89QBvJ/uAf7Qex1KhVgfz+Shl8qWFJ3NEeel0jDrvevkQ/S+gDRwPc8gfgNBXhk
 kJu8cMhpgzRHUMzpoaKatRPcrxHXLWtdwIXHK5Zn3wmOcgBIg8RNtknV37HaGDxvlWBJ/NsYlxs
 WyQO+wWZi1b5016AuxE1ukJ+OlNoeTiLd734DPjcXCQ4efpARWR59io8PgYLCEzWNgyJfCj9KLY
 Ihx0/5JJMp3C3SZKh5b7KlI9AeAMWqajNYeKBkVPTgzvWNtSSj9XNq2BXtlnro522fiNHfaDs0U
 3ssBK6a3ybkI3uIeRG9Ep2wQPfwJ7QI7i/g93/R50ppirgsSJHMl9mTc6i4
X-Received: by 2002:a05:6808:1a02:b0:45c:85fa:5a3e with SMTP id
 5614622812f47-4650c807a83mr2894317b6e.25.1772648429938; 
 Wed, 04 Mar 2026 10:20:29 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4160cf239e0sm19158250fac.1.2026.03.04.10.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 10:20:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 11:20:21 -0700
Message-ID: <20260304182021.3743990-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772648430; x=1773253230; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/oFYnP+9qzG4CukBTlS0vKQsOqmpQnA5IpqHB/3YfVQ=;
 b=iu7EdLzYAyWVyhMEtepP5cCnpWf1bAc0JYHICuJ5ei6McPQQlElOS+79WOxX4meabs
 ZNzJ3xMRydsIcpAZelj0nDgL2PBtWRTTZ/ysvrdnFA2um+1pdkjaz28OuyndJPcZB/sh
 2EmuSJVxw9TrrNv6BpuaSfrAz2D9cu/3jmLPh7TPr8NzyJQ6+PBUc4q/TtErx46fPhSM
 7yQ+780DubHBtgONLND7BVMCcCWaiE1swT/ktee39R+EBbt19rjQOV+mKwE1gsmrOmJo
 hHH6xDI0DJjJrHHNVGFpnvZbagqbYCwdZHhLe37WAZ+PObYAwQzmnqWVVqtoSWfWsVZJ
 5Zdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iu7EdLzY
Subject: [Buildroot] [PATCH 1/1] package/python-trio: bump to version 0.33.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index bd722a2367..79146dc1a2 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  8bc9dbdc265c291c93006f5e0f1d3918  trio-0.32.0.tar.gz
-sha256  150f29ec923bcd51231e1d4c71c7006e65247d68759dd1c19af4ea815a25806b  trio-0.32.0.tar.gz
+md5  e778db1205fa2ea00dac9340471b8f1d  trio-0.33.0.tar.gz
+sha256  a29b92b73f09d4b48ed249acd91073281a7f1063f09caba5dc70465b5c7aa970  trio-0.33.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 73c1ecb461..4211dbb313 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.32.0
+PYTHON_TRIO_VERSION = 0.33.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/d8/ce/0041ddd9160aac0031bcf5ab786c7640d795c797e67c438e15cfedf815c8
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/52/b6/c744031c6f89b18b3f5f4f7338603ab381d740a7f45938c4607b2302481f
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
