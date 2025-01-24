Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908B4C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DC0E60776;
	Fri, 24 Jan 2025 19:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmKFVcixshZB; Fri, 24 Jan 2025 19:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 357D460783
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 357D460783;
	Fri, 24 Jan 2025 19:22:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B1E9944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2566F4017B
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIKCiXS6Ol_N for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:22:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 014E840096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 014E840096
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 014E840096
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:22:52 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3ce915a8a25so7761635ab.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737746571; x=1738351371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x2aEymMCb9uC7a0A1oM3PEevR0494QblaS9vw14i5lQ=;
 b=uqBdE+F+okf3FlO4IiifIVDT89XrioUSl/tHO9tQvk6mSL3GFV/gxyMBFrtCGGdCQo
 VWFBsZWx0Q96YJ5irBHlpkSORqIFoddZ9X7UP5mkDj8CTllrp53XyROIHqdbpb5/ZCuu
 1I1FvPmnzY29yiXAvjbU3DbilPG6avLjoNYcGSrRysu6/uN5K/vnalsWdbtfHvyaeBIN
 7iqj8gHMt3b1sSn1S+T+fjkUusQhnxq/rWLkpgQwhEsmivaSC7CSMRxhhlXiUsO77miA
 yN/D5+xokbwhvJ2EXNUilHHHGDQ6Z4KP9uQ4zWiMt9SQFFYp0XfYZ5/KjC514dsLB7uu
 AWZg==
X-Gm-Message-State: AOJu0Yyl6yIF9YK+Vlg1plgIyItLRwHq4LsgrcIg2kYS5lZXngK39Z+9
 icA67X241fEjW6IvZ/EuJsHJ/rv/78i1Ql+iO8Ql8CmTAgIZJJRq+IzG+Bmi
X-Gm-Gg: ASbGncsd2zqBdIDrGWJsWWBWqsWINU4KHbMB1os92imHS2LqXUt6il2ZKpP9tRYyM+C
 PgYuK+5JYdx62iBnCZkTnZDxDTFcmxUu5ONp57VJTL/MGLTpCg502o8mojUNdkU4ogC4I7tMKIQ
 GRh3j1c7IYiFH85R5EHByjlGsvMi3yXgZcJDzGe7TGTYv+jBIibrVPWkH3h593gjbLu9i2eN9r/
 /DMi3eRUvPdj6aVockvitRDfFovyL/rYw8r1+q6g8WfGByDH1rojCVFtbNh+1VjAsGDg8hPju3S
 baVv7WvHCExeMF7HKqUCXOftn1YsDoAGJhE6sQDyuuS+ob8Cda2PWT8=
X-Google-Smtp-Source: AGHT+IGkOqohCXPtf1lTkjGk4pg3Ei2JRudYiKCricfvUIhXKLKQyeSEkhBp+zNYn8aqIjKEiIzeCw==
X-Received: by 2002:a05:6e02:4409:b0:3cf:ad21:b7d7 with SMTP id
 e9e14a558f8ab-3cfad21ba46mr118445535ab.9.1737746571634; 
 Fri, 24 Jan 2025 11:22:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc740f5bfsm8453395ab.8.2025.01.24.11.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:22:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:22:47 -0700
Message-Id: <20250124192247.3813308-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737746571; x=1738351371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x2aEymMCb9uC7a0A1oM3PEevR0494QblaS9vw14i5lQ=;
 b=BD3AoOMSiPQfg+GNHC5WLtuybmvFWDxGWd9o/O9w5rRsMjtq+Ng7GrcmvqqSFYF06r
 Sir2eSfG875V2EYSdyeTgQS2pI31N+hhuH+M+1ruwB/ChaicnKmU1aueOWW6MJzX5OhL
 ltylKXUGxlOv6X847bjnXeO4R86TyldKEJXQYxYrUqY0Tdx2BSKLEwtxO6LD29kxKOfK
 Dzg8TdHSDR9+Ht7G6MUsV33N+lR0wTkBa4r/W3ygEyfmNah3it8nFCRaEBiI7Mrs1A4p
 itTGxZLKOTGI91TEM7JN1k9FimEIceDF3ZyGChCdnugItHl2fj2mCN8fsyHzAXIEn1KC
 +AYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BD3AoOMS
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.70.0
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
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index 685336584a..c57ece77ca 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  397e8c15a8b474e664225927a7a5fff6  grpcio-1.69.0.tar.gz
-sha256  936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5  grpcio-1.69.0.tar.gz
+md5  ad83dd7166a99b20c0e004b538eb5ad9  grpcio-1.70.0.tar.gz
+sha256  8d1584a68d5922330025881e63a6c1b54cc8117291d382e4fa69339b6d914c56  grpcio-1.70.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index 81f4b1fe0c..24c0a08cae 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.69.0
+PYTHON_GRPCIO_VERSION = 1.70.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/e4/87/06a145284cbe86c91ca517fe6b57be5efbb733c0d6374b407f0992054d18
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/69/e1/4b21b5017c33f3600dcc32b802bb48fe44a4d36d6c066f52650c7c2690fa
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
