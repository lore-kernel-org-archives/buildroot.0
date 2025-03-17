Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF40BC282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 22:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F20412FA;
	Mon, 17 Mar 2025 22:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gh90SRDLlgXL; Mon, 17 Mar 2025 22:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B430412FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B430412FE;
	Mon, 17 Mar 2025 22:26:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F5B01A5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5865833A7
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVLl-HUytKui for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 22:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDAF3833DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDAF3833DB
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDAF3833DB
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:26:45 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3d2b6ed8128so19135805ab.0
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 15:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742250402; x=1742855202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mRrmy0qvUpX08SgBGhcAmY96/4v1ZikkvbCwMwlXmFk=;
 b=EARJyE6t+OzgFUUCpxb6vw+bOsk10EHcY8E9ax7o2T4ZFakCfXBt5DfOiGnDOyNm2B
 Mr+hxLTViF77yNmPEqkj4RiEidCnRNDsBhXevp20TjhPcovG+BEdAO734xbX8eIPXkJs
 5C+7+sVC6GqX4ScaGE1iYWnvwifGb+bemt1GqNerHGqYCGmoU8UnQAUIZzPuIbskG5al
 eiQ9Gq4A2xrNDkw/8pAs0t9ip8rx3zPRwn/J0EjLevtwWbhvKJOxU/bcgbWdOJmgwNZX
 Iykot3SJvjxnMJRnm8gAOCshBi+bPzloXbr07XqS5Qv4g/9f/XT9DXonGJndL9azYtTY
 vb3Q==
X-Gm-Message-State: AOJu0YyqHEDg+BA7h6N88IgJ05Q8RFClNOAMUVjcnYzWM5S76uNid3cb
 K3XRlnPwaqyF8UvKfxffRnZ8beyj7jB8HeKymLGAyo4WlUNsuW5CuJrjdw==
X-Gm-Gg: ASbGncusbNR9i7p36XvPxRHRWIImfRlIipjKGeGcfj0/on8/i5cYsqAmNmmeZy58krk
 Wd7plTz/y7sEmYpVfIuzYZWprv1HCLLDQuI6e8gNpUV8fdC+rKFxfCgWaEzEAtSuqIpTQqhnofw
 aCVYMeZbrJkAT17C10fON2s9Y9ZRXgXvd1/Y2yoP4wXr6Bgn7J+fKcnnF058GNiYsaWfCtm+Z/M
 kRuVr0EwvqVxOxw/JnUqyL/sQTKSmwkymNFUf4VhTu+tyln4AFRO+gm7XGnOAwgSNotH3Pj7uqP
 fDuBYZ150KIK/WZrxZK6jxAzKvxUAGeqDicjTL6st0jArhRec7NMie8ZEB/dUEeDB/HeoG33+pU
 8/P6AcADZCaxzAV8zWOIC
X-Google-Smtp-Source: AGHT+IHGCDJzzNNsj/gEjO/1y/FlhDeQwYJHub0qvuaCCbNxpyK4mn1fyYeHqsZKKWdOW5wE06ML8w==
X-Received: by 2002:a05:6e02:1d89:b0:3d1:4a69:e58f with SMTP id
 e9e14a558f8ab-3d57c0ac81cmr14196855ab.2.1742250401854; 
 Mon, 17 Mar 2025 15:26:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a83c72fsm29444915ab.70.2025.03.17.15.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 15:26:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 16:26:25 -0600
Message-Id: <20250317222625.3063443-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742250402; x=1742855202; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mRrmy0qvUpX08SgBGhcAmY96/4v1ZikkvbCwMwlXmFk=;
 b=IT7/pdDGCX1bOa04WNM4ylOPwxoQ0MxG2eKwjl/I0fNiGrTnCcGmILFiLw5QHaUkRH
 D5Wigo5qx2zjDpFCnDXtYRpIxSJGTh5+lAQzEcNR0ux4X2XREMSF+GxzicFB1WGqpDdK
 n6oHK0aY4K3MpxsEdeBuWZ2UyEVAAv/OIS9GQsZdnoH2XEIPCeo8Ow+Gc/7pxhljqxm0
 vdBh50vTlcGHruXa9ILw5uFnMGypqdmcUmUgMLUh1KI7Z/E7qs/OIcWlPcdBXs5CcTpP
 Z00VRKtmlyNOe2NBLL4k+A367Kop89+7xJaWZorSoGbGJVX8lZ4pBGP2au5F60Ma40Nk
 x5aQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IT7/pdDG
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.11.0
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
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index fbaa515863..2b7c7b9387 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  755ce9ab3d5e7b9f420992ca891a3965  setuptools_rust-1.10.2.tar.gz
-sha256  5d73e7eee5f87a6417285b617c97088a7c20d1a70fcea60e3bdc94ff567c29dc  setuptools_rust-1.10.2.tar.gz
+md5  09bd134c06a3083ed65a6ca01314dbe7  setuptools_rust-1.11.0.tar.gz
+sha256  f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2  setuptools_rust-1.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index ab1023ea4a..ef61da549a 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.10.2
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/d3/6b/99a1588d826ceb108694ba00f78bc6afda10ed5d72d550ae8f256af1f7b4
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/0c/db5a68b4e95229db38a1793d58561870bd68b92b95fed183c6cd48910c9f
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
