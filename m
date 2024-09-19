Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2346CCF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 18:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD42A40131;
	Thu, 19 Sep 2024 18:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4WABw9rdNNT; Thu, 19 Sep 2024 18:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D6F40200
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D6F40200;
	Thu, 19 Sep 2024 18:33:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3C5B1BF31C
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B037284A01
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEfi2c5AtZxE for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 18:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEB70849ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB70849ED
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB70849ED
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 18:33:21 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a08dbc6019so5781885ab.2
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726770800; x=1727375600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FdYJTR3/7PVV4PsIyCGPm5VAergY8eLnR4AeOP/w3Q8=;
 b=j4jY4rBvRHN98JRNskZNxVk5QCsc+kuOwhlcK05UN7PS34HkkCyWcOLOAfiJKQ0Pxu
 cP9+D+JJe+L61VeQ06YuCN9v/+724O/M5ZvLkNjzWU5T+PWhhsiYnlBuRgT9LLB9iw5J
 h/wfrI5+oLAu3y8epX7BCpvYDl1MdWzeQJsg1H3R73xpcA0/AuzGq5g2jyZNxsyb0JbH
 jQWbjigLI+zPN5nvBe1OFgNsEfhbrcjTEiPOYVTdW0Ur0CQUXOlrbRk1998491HPgA/I
 ZEmPEh2/QdyeH/mPqzwc3i/4F6glLdIutQySOmIOn/SJyrCa+sId0V0ZUVCdAT7ecwBl
 4IfQ==
X-Gm-Message-State: AOJu0YwTXUv3da4wktjvhtzmMh0aCpYmn5mschG1QSyTEg7oGyCViQ1w
 pEIIp1DfnMbWDWBxwyQjh38BIyshSZRmB2Qak9/gXssSUBGBGSwDpWxPFw==
X-Google-Smtp-Source: AGHT+IGSj7ykptL25saEowpwf7jdKgCV7NzItdLVgBOsaWfGQzN201DzpZ/TO5/gBB6AODKLCKVeCA==
X-Received: by 2002:a05:6e02:2163:b0:398:39f:8b4d with SMTP id
 e9e14a558f8ab-3a0c9cd0a71mr711165ab.5.1726770800142; 
 Thu, 19 Sep 2024 11:33:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed19ebesm3101842173.112.2024.09.19.11.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:33:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:33:18 -0600
Message-Id: <20240919183318.647681-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726770800; x=1727375600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FdYJTR3/7PVV4PsIyCGPm5VAergY8eLnR4AeOP/w3Q8=;
 b=YAfNMQFNmIIRN9kcACxfo0VppdLs42RpE+InEQ2uTFIpLoVRhzEjCyvelORKVwJIgU
 qekwEFNDZh6HazDIwLkKjLDsf2PKPirWQsA534WJfgYBsVISqNsR3zOjgpx0IgrAglEu
 gXJdPyWnzgcojC0H/kTZo53ZKPsoWZRXnVcRVBysiu7e3w9eV8vchOPYOsHrekBZi2WS
 sX3o4B2IXy4TYUeCnbW5yUs8rd068dOZ9P31TD4Uv0fMTq6C6jbn6Dfez6OMi9o1tLwD
 kKHRFECD8/7nPDN92EyEfLcJgLliHUmoay/iT/n2yE8i1derIoZZGGBUpqO6UG1c3a0f
 8hBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YAfNMQFN
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.20.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 3071f60df7..99fcbc04db 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  c16ec7e898efa0302cde6ac3c83ef8a2400f865d44941085b4f87784325fb89a  python-rpds-py-0.18.1-cargo2.tar.gz
+sha256  49fe05f6d243cf4c4c25848340eda678b985debaebca30ba1573aa34b9cfbbef  python-rpds-py-0.20.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 398ac6682b..fc23eaec35 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.18.1
+PYTHON_RPDS_PY_VERSION = 0.20.0
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/2d/aa/e7c404bdee1db7be09860dff423d022ffdce9269ec8e6532cce09ee7beea
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/55/64/b693f262791b818880d17268f3f8181ef799b0d187f6f731b1772e05a29a
 PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
