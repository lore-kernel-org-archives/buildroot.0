Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D2EC282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 22:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E508215E;
	Mon, 17 Mar 2025 22:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsFBvRzpqEcd; Mon, 17 Mar 2025 22:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 937B982172
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 937B982172;
	Mon, 17 Mar 2025 22:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 181571A5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F06A941153
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewvkrt0h4obk for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 22:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8E1F408AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8E1F408AE
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8E1F408AE
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:18:32 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8dfso160671839f.2
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 15:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742249911; x=1742854711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rmz/MAAdjKgV/mdvNaYLS+u4wBwPRQC060afV6r268A=;
 b=pS4Va7Qyi8gxMnDsR+W3nLLuFXWlG7g8ukoZdtOMEkzmH+4hQmhg4KuJANYdxrU+N/
 haEf9cp0KNXfrY4yZPcFa1+UPgzJ0xyTuqNYSqu3euZ+lTFI2olvR9J79g9cFduD/UdT
 WmtEMSd+3ld8FWQ+2qpMFwy1QrxGDNNdteorxZBHsVAR4a9sV5rNOQajKsynTtprDGep
 JjesgDzvSEA5jBzFllMfK/+sgSJ0pL0CMEBRxBDI4n0fzSQbEqoXRULIXlhV6Aduo1NN
 swPxsje6LYu5qX3w0XPmj9BUq1bUsJqka4lVE1BwwOrU9kmqCunoDUVa8NckQkhFHQLN
 cdaQ==
X-Gm-Message-State: AOJu0YyYbROKXUPi9M2LZLRSZwOn+1Ssr+xOub6tfehBgRjoEBYR6T2s
 2BamwuaxX6KXUXD+pWWYCT3lmuBDsCovo/owIMxVFQ1yt/y5EC6vO2YqUQ==
X-Gm-Gg: ASbGncujrQiMLyAlXBTA2Ws9GM8/Vnwmd+td6WfExgsuEYYpvt7cxpBA45lr/Avvykg
 lCrtjXxCT4yClG9OxxRdkm/SwBhjxc3Jt5tcgLAH8rZ+Cu2gzTWJJpxL4C5tDb6OC78oa9vLbmB
 nZWkOT7mJw8FoR8CPWSHNRtRMok3dygXMC6GyKqwOX+0S9UG4IWflQRQ70DspaTYq1RRvWi++Ln
 QA30POkzRkJWq9L15uOFABqehB6nPdAv1p+W/E5AX8yQlU/wwfMmUhGnOwI2RDQBNg++MUUf9HH
 a724gDgR7Zb0ZMBZzeSc3pqMXyJ4FJmQUDDqS7VvU8DlghqTUGaP272ur54+4Y0P9h7wKPbZd1f
 M7aybJUefCWs3RGSp5OAz
X-Google-Smtp-Source: AGHT+IHodbqSkMRbtgsvuQ/8fqK1j+phQ0QyESGr0on01Hjp13+sIgxlBS7C+qDmPCrNVb7OGTtVbw==
X-Received: by 2002:a05:6e02:3710:b0:3d3:d965:62c4 with SMTP id
 e9e14a558f8ab-3d483a0adb3mr144512335ab.10.1742249911581; 
 Mon, 17 Mar 2025 15:18:31 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a839495sm29019745ab.62.2025.03.17.15.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 15:18:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 16:18:28 -0600
Message-Id: <20250317221828.3061240-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742249911; x=1742854711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rmz/MAAdjKgV/mdvNaYLS+u4wBwPRQC060afV6r268A=;
 b=NzRYGZ//BDY2etkMYg74UvvTX4y2NsBChKplRp9/ek7IC9qH+/hk8dvGs0sICw/uOO
 2myAiOm+P+AAWHtbIOq6ptGx0e9Ib+y0PJ3ydSZwKnlhR8HlhpGVAAHerYtFVx5DgmZf
 PYB2ISPRq2rbQ+IHWpufUmMha0vEmBLL40+zqLJwTh+5/P9tDhZKdKZ8ESkrt120iygr
 4tqYOI/zEYF5tcygtEswE3XzUeH7UJCJsQXurW34oW3S/WFJoewvTKr3j2Rg/a/mwBU0
 6v7B+n5+lQWtrYm/3G3R7cSUA4rElYHFi5MgWIf2EiqXdxVZ/Z/t1g4GFMWs2qak1Ub2
 rY1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NzRYGZ//
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.24.2
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
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 93a4fab7d9..db7e37c13e 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  1f35e292f86c5f0bcc717d5c6ef41f49  tortoise_orm-0.24.0.tar.gz
-sha256  ae0704a93ea27931724fc899e57268c8081afce3b32b110b00037ec206553e7d  tortoise_orm-0.24.0.tar.gz
+md5  fa3177acfcd186ccdef0936dabc79f90  tortoise_orm-0.24.2.tar.gz
+sha256  83d2373efafc1c5d668c3c5bd4e1e7f4a219526e850909ffe88f184da3808fdb  tortoise_orm-0.24.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index ae51fd4947..e3c1fd5d90 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.24.0
+PYTHON_TORTOISE_ORM_VERSION = 0.24.2
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/64/81/973b629f8a70fc928343f4f8be6121023b6c6f0ee0ae45695955db82af47
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/49/e8/ac7cc41c297f20b3642351e5ff16f53beddea37be285f33f30308838d704
 PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
