Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5F4EE498F
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67DB360791;
	Tue, 30 Dec 2025 17:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8LZqiEcO7qK; Tue, 30 Dec 2025 17:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03CF660607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767116433;
	bh=5L/kMDE56xpsNRQ7oepXH5lgM4eOIRg8LF99gRhXAnw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BB/UCvcmKewXXao0g+dbctmkKSEkzBl2XUrp94Fp+eDFimIL7V6M6Fh4eyUJpdnhm
	 haGm4nPoy9JcZupsX2aGg3EgbF+JgWYyK6+bfcju2wyQSwUEwhCPldszQCFlt1FVFe
	 /ZtCalGCLeoWweQ6Hgu0jM1yHa/UQHQI4ms2XC9PHduHaf9O1VKuyYs9d7ZTGUQhwl
	 wsEq8ehyzuyVmdpkqVSrxn5Fa+pSsh5RlRvlcfXsH1a9bcpCxX+jXOyB/NL+I/KwPV
	 VRypYIwMOQ94CPZG9XTY7ezq/xJ8reXGk6kuLuEGJAHtva0XuvWVK5SjBNY7xxziy8
	 ifEgLkRBNxE7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CF660607;
	Tue, 30 Dec 2025 17:40:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA43D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCA09400DA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tA4zMvvwyKOc for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E83364008D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E83364008D
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E83364008D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:40:27 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7c71cca8fc2so6386026a34.1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 09:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767116426; x=1767721226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N68vLrXNhK31Oo51PtzNDPfHUx6PZtvJyp2ip1rIWBQ=;
 b=PuO8vPHIcCm55EvEZzfJsa2AZ5yui8zE6DCycJgsm0SdcSOPPQGgQH6HAHq7AVJZ3V
 CE5i3J+/eDBohtOUohDP2PC7pxnBkVofB1Yn4IwnX49F2FiUNsCi2k3dnCgUAeVfg/95
 zqNXz6IzCufjQfgCYh/tj+gEjWSSyc6y8BxreFh1XpML9CmO9BwXEiNwcHjN9ThPVLlh
 fvP/cH+DZbVHH+T3jng52JGjnPg1oCGi8xPbOdugeixiXY7TS+pjwKp92u9FiSJsxiRo
 6D/SWY4dam0/282mhBLhXYZ8CpXdLQzsgullstIzXDSIHM9dIxQ+mJIo8ziyEBzR9Zaf
 s5SA==
X-Gm-Message-State: AOJu0Yxz/PE31XEzr9bvRzR8L+bNwyr5+X5A2uLyVAm5rmJHLIQwhFih
 A0hoAO7E6CrzenH3WJVrfHFcDe68RKsgWzDaP5AOs56mCLTPZ68WrS7Bh7UgI3HmcLY=
X-Gm-Gg: AY/fxX7kLqU2qqYYmMyR5tpRJbh6WeGpoNF+1blD8WrT7wXqLOoF/xwcl1pcH536EOD
 nYUbv5P6Wdr6hI0mz+fm5wDPFi7abO54oie3y6zUR9xSdTDAH1s9yDyOqWPFacToK82GdvUbrlD
 V6ahdFGG5e8N1gk2wG22FxserlJFq3OkeeTH1002TxmTXkCPClRAtxCboigu5px4uyNxgWxerrk
 xulEib9n/daXaK76JkWKildWYHhwEU/QkCHCrUGTh4jDB2+glhJIzKLLiPPV0uaTPd6+5yWVTJU
 VtzQH0up+9IvG7+JuiUz4addeJBVR8NwBUnC47dVAQqgDOPiMBc+xqiqwpewDtbU0mO2Hl74FwB
 1c387k7anRag0AlfOZr243YVCgE454ggUH2ft2HuWf4fc5leZ/S77DZeSb9QKkN9iVT47FB1R6Z
 uprW5Bl2HuQm03dieO/m+mmin+NmiwPQh3GTWzP+9Id9M5rFtwlqYwJZtmJr/rgKi7KcfjQlirn
 H8ZZPU9GIWm2ChEzMQpcXkV/zyq61yxfFwMnuw2EidK1Xq6gbG6gxw=
X-Google-Smtp-Source: AGHT+IEDGwVKKolvHLWLQKMQYWGMdiiRJgPT0VFgzxpkDU78eR3DKpsdBLaVAUmEqyPksrNGGGUkPA==
X-Received: by 2002:a05:6830:43a4:b0:7c7:6da2:6d67 with SMTP id
 46e09a7af769-7cc6689d9a3mr22850047a34.3.1767116426430; 
 Tue, 30 Dec 2025 09:40:26 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d6b04sm23025051a34.16.2025.12.30.09.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 09:40:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 10:40:22 -0700
Message-ID: <20251230174022.1945745-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230174022.1945745-1-james.hilliard1@gmail.com>
References: <20251230174022.1945745-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767116426; x=1767721226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N68vLrXNhK31Oo51PtzNDPfHUx6PZtvJyp2ip1rIWBQ=;
 b=IpPCELdTdVyjchBCi8VMVu5whMMOIn5g9lEjnyXWULH5JDGsfm9/aTMrAvhhD12CoL
 lrnoEP/FwCFE1gP9s916YIB0CFOTmRQ4APFEwMj4N/NQp4ljYOIubdCh5Wu5T7SQbc3O
 rCtKNbH3hg4Oty2GQP3LzPrkoKVwc1Udqh95kuRf7hIUfdUT4gp42/UcNvRky3brwIsZ
 hcdoKwNbqJln9x1rwR8eNTVWeYv+9qPxoyGXOEqmwSXg0Be5ElbvqCDYFNvcfglMderS
 T/kBTGob2NHRaUXsNKQsQFrJRL1yAjlfkgrDrWDLoEpvua6+1HyKJenjIJ9XunCJ3n7q
 slbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IpPCELdT
Subject: [Buildroot] [PATCH 2/2] package/python-cython: bump to version 3.2.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 08972cd035..3c33ad0536 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  f508595cc0951a77b70c07100df1b4ff  cython-3.1.3.tar.gz
-sha256  10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089  cython-3.1.3.tar.gz
+md5  7cfc3278f4eb7a072446f08dbd4647ba  cython-3.2.3.tar.gz
+sha256  f13832412d633376ffc08d751cc18ed0d7d00a398a4065e2871db505258748a6  cython-3.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 50e2e6e1cc..f99dddc310 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.1.3
+PYTHON_CYTHON_VERSION = 3.2.3
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/ab/915337fb39ab4f4539a313df38fc69938df3bf14141b90d61dfd5c2919de
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/39/e1/c0d92b1258722e1bc62a12e630c33f1f842fdab53fd8cd5de2f75c6449a9
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
