Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1967C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5385F40B34;
	Sun, 24 Jul 2022 02:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5385F40B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o9X201q0YqMp; Sun, 24 Jul 2022 02:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 628D440B2C;
	Sun, 24 Jul 2022 02:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 628D440B2C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE55F1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B72EF83EB5
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B72EF83EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smLkiaPKMaKy for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:55:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD96883EB3
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD96883EB3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:54:59 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id c185so688581iof.7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4ijOLOt29TuOSGa84YC69XLb9gGWSWRXgpDki2SwL0=;
 b=y+po8oRTFD8B23fdCVtm8oqvfVjR8UdmF9EDc1pSTXZDNuHVIVPFFoY/zaoR5ouDXL
 zPQzxBUVn/o4CaU1EYE8ovJzkdm7Tt8avJ7YtU917/6SXWEy2OdtghqyUv1yoko0Q8po
 fHB/pnzt6lEAZL02TyHMENaTGGPfhOkSWeHQGY8Fg/hGWRk2ZJjGHP7zrlbeNNk4+4G4
 xnXgUDwoosBob0tb4zV87f5hc3KFibgJuWnSQWKiXo5FPqPPHc2pjuI9Ie6F/o1i4xkB
 8DUEoKuAuq4AtKX27qt7QL7CexOyOiJjYJ0nKsqhiSMhUQ813OVdr1aGolA7aE62wUxo
 GjfA==
X-Gm-Message-State: AJIora/OCYXhwiMvJc9SxbxTdqhpchhhW/SBkgI5itnRxnKyf7n38MDU
 aPz2b1VYt8tvOlxT71tpUziDZb5+9XBppg==
X-Google-Smtp-Source: AGRyM1upHVDkFGskklJvN9GA27F3D6+bXau9rs1dhvdx/sZATP9r+tQcmUxTP94Wjx/1K7s3eFucQA==
X-Received: by 2002:a05:6638:468d:b0:33f:6a1a:8c83 with SMTP id
 bq13-20020a056638468d00b0033f6a1a8c83mr2640356jab.238.1658631298875; 
 Sat, 23 Jul 2022 19:54:58 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 e98-20020a02866b000000b00339c33df66bsm3865744jai.118.2022.07.23.19.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:54:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:54:56 -0600
Message-Id: <20220724025456.1039611-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4ijOLOt29TuOSGa84YC69XLb9gGWSWRXgpDki2SwL0=;
 b=q4doc8vyxQ2yPh8HDeENWrpOhXlb1PQhKtcURZ+LFF3aGsYRGTifDaFJB/5BkPJr+X
 2M84iJJ0BUM2Wuyjltwu55VgZw+wI8KxiXgVIDgadzGCd611XVL1nsHw1i6YvI6EP0sg
 Jr2LoCDQTqF9MVFxpwtBLwNa2Gs8Q2ATWIKDD2XMsUl9mhFkZxD9IfEM7/64fumXN60l
 JRIlL+mvaiS4Y0qdZ/ZiXVy2NnlKlZ1Fw+nOvuoC9uYmMxXo9nsz0QhvUns87qcUXVSz
 JsKsuzeGERgsutVoJLnHetKEWoMVZ/lUTez0Aex34kNhEn5CNodOEAqEb5M0sQh2QUcQ
 Ly7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q4doc8vy
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: bump to version
 1.0.4
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 382bada4a7..4d0f510883 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  2dcb4fa618d7890e5a79de6fe44cbb59  msgpack-1.0.3.tar.gz
-sha256  51fdc7fb93615286428ee7758cecc2f374d5ff363bdd884c7ea622a7a327a81e  msgpack-1.0.3.tar.gz
+md5  1822cdb939e7531f7ad0f7f09b434f22  msgpack-1.0.4.tar.gz
+sha256  f5d869c18f030202eb412f08b28d2afeea553d6613aee89e200d7aca7ef01f5f  msgpack-1.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index c50b7157a0..d9304e4def 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.0.3
+PYTHON_MSGPACK_VERSION = 1.0.4
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/61/3c/2206f39880d38ca7ad8ac1b28d2d5ca81632d163b2d68ef90e46409ca057
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/22/44/0829b19ac243211d1d2bd759999aa92196c546518b0be91de9cacc98122a
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
