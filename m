Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565CEC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE09560AE4;
	Sat, 10 Dec 2022 18:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE09560AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3EmQiXte3OK; Sat, 10 Dec 2022 18:18:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C27260AD1;
	Sat, 10 Dec 2022 18:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C27260AD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 475701BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F9CE81759
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F9CE81759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_mWaEkMLb7n for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:18:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8300E81458
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8300E81458
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:18:11 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id z9so1463456ilu.10
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDWwoCLBrZCB71tXXRB8EkPMxKWqm+2Ps1hDFAmDamo=;
 b=eZwBjoQh5oEucn9tOz8+n/MgnE490i3PP7p2S54Pi7Jl1syZCBIiDuMh5TyeJiMyII
 +fZrNSfURE3eXhKL/5xyxBdWLT0wZ4b6+sI90aOHECFByTSXWoIWkE/tRV4MByASRrVi
 7WteJ2xN7QWDsXWlwaMb4wcAZ3v4k8a32XMF5acpBKbK/77+YXw6mIIxOCG/KFd8BpHw
 AjHHEHSciUylQdZZCT4X2ARgpD7cHc5+3bYN46gcE3XUPd4vULhW3U1v+HU59IGHKpPF
 W1AcwlrUMEC4zJK4xYSFIEIXoNz1oJstaYpI5NYCdhS3X4+QkdkOFZo33HUIwae5zQ/R
 ElzQ==
X-Gm-Message-State: ANoB5pkOpMyOawLkzJr5xq1R6CZesKp9U23nUcFUR5Z09n/V+/gt9khb
 EzIAyuBjggAnJ3fDPgiqMcZz6mP1LBB4rg==
X-Google-Smtp-Source: AA0mqf42lqaoCh1W238AKUO/lGkNhvo5GaGyqmLi9cEkhYPA7f0hbjD/piue1ZrkBoRoR206/hhNTA==
X-Received: by 2002:a05:6e02:4c1:b0:303:320b:ab52 with SMTP id
 f1-20020a056e0204c100b00303320bab52mr5908629ils.27.1670696290412; 
 Sat, 10 Dec 2022 10:18:10 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p9-20020a92d289000000b00302f958e71dsm1497890ilp.49.2022.12.10.10.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:18:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:18:07 -0700
Message-Id: <20221210181807.2876303-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDWwoCLBrZCB71tXXRB8EkPMxKWqm+2Ps1hDFAmDamo=;
 b=V/N2CzK/hb+1541set3qlH3yY+rs6VuMAKbDhwDUqkzD2yGbTQs2MNvUo6bqpOgIFw
 Ulh9O4+AmAHESW1zl4RcMA4X4q3rX98dNvsvZhTt8H/Pq+Txd7SKGRtvsQNUYUP1crh6
 k7q4oSLDGr9tj2gEEdnQE9/Ec1O+VqMp/RaEwE9MM/Zj5v9NRhcEDdbahHtm903y2REC
 knffqxa1F6RC1vy09d7wwSqUmuAldcpj5+TpBMdSX/DalqqnXOcZE5KNemLeksXO/nNP
 pRJO0YWcn6OZ5RC3OCvlxHiseO4TGAUP5JTY1iKa8BVxSN9lWwiJj35nF/OU2cbZMl9r
 zbdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V/N2CzK/
Subject: [Buildroot] [PATCH 1/1] package/python-jsonschema: bump to version
 4.17.3
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
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index 19b9659d08..f710576461 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  e569b6114d575bdb05cb8ce4676fe458  jsonschema-4.17.0.tar.gz
-sha256  5bfcf2bca16a087ade17e02b282d34af7ccd749ef76241e7f9bd7c0cb8a9424d  jsonschema-4.17.0.tar.gz
+md5  7c65ceb8923c83cb1f22c2b5a86d99b0  jsonschema-4.17.3.tar.gz
+sha256  0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d  jsonschema-4.17.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 8cc624886c..16fc660ec9 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.17.0
+PYTHON_JSONSCHEMA_VERSION = 4.17.3
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/3a/3d/0653047b9b2ed03d3e96012bc90cfc96227221193fbedd4dc0cbf5a0e342
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/36/3d/ca032d5ac064dff543aa13c984737795ac81abc9fb130cd2fcff17cfabc7
 PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
