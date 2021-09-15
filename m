Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43301C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1133F60F92
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1133F60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAB25406AB;
	Wed, 15 Sep 2021 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9-HUotESk_Y; Wed, 15 Sep 2021 19:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267E6406A9;
	Wed, 15 Sep 2021 19:49:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26A7E1BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 153CA401DF
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXnZtJPSbY0J for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:49:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A838E401D0
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:49:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d21so5636541wra.12
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2xAJ1fd4Yu/IXVoUqT8+E+Mnf5XpVOT7TNI4CoZ5YA=;
 b=poyKCErbLjieWtNjfKl6dVmqaAXe+LQt2VWE6AsZXeeDwSxJxJnWsVW/t0NkC/kZvB
 +OTaFfz+sF0pGkksg++pP/Yq4kqiAHntKcuGyR+aEf5s00+23+UGZtz98AT0hDgWwS3n
 KNb3olvGXeEvYsIIMLpUKQlqBzu9ZSXJlnJ7j0yxy2Uyoy14x+s70hTqmEuCZfFxBUE9
 GwKEA+v54WmyIrpCCQfweNBZOzZDWWRXqlq+5qmQZPpXwCakj5nBLaYyO1S51MaUsJrQ
 XMxNOypT2vF0/CcNNh3Uq/oz4K2g3vL0C7E8xtFuXy/ZMhHnNqRZi6QX54Z2Uazlrd4H
 YRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2xAJ1fd4Yu/IXVoUqT8+E+Mnf5XpVOT7TNI4CoZ5YA=;
 b=EGOBzrWV122GyJdeeukGkPtdVbAeN/VHoecQm6nd6uE2GTJoDoweQNaepUJxky0+bc
 NKlo9UP0L8LBtQWiLW4aGew4OeYiZfX/TjUl+o1kI/Crq4DgHNzgAQKaVSclyqmxZpY1
 DPNhKCrpmlBpg8dQmLg9qH1YrfjANYzuw8sNMSnd4OZcEizxp1i17QJHZEez/9hVGdSt
 rhgRdWBJfQ1XKUouDZ9BRvyv/mLhcBpmcsP7zCxSE61Urh8EiwLrI1mTK3oM75tQ4+S3
 0UC2wAeomQYg3O3ymE0WLn8aP3g25wfLR8IZOA6mT3SSWwuBdYRasB4U7VNWfpWkBkh/
 +Zgw==
X-Gm-Message-State: AOAM5330LyrasstUbH05ya4wrq3NZVQtUgMBeaNE9GLQgbXt1/t8wECX
 zM1YsvbdHkRh9jhtojEPk3Zkhi1QL0E=
X-Google-Smtp-Source: ABdhPJznJLNxAR82ERTRLPpKVa+kmsLpfnpUmhdf5iUqJlTYTTO6G1YW+1kVk47WCalH12UI4Xk+Lg==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr1918924wrz.280.1631735385602; 
 Wed, 15 Sep 2021 12:49:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id e3sm1193247wrv.18.2021.09.15.12.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:49:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 21:48:19 +0200
Message-Id: <20210915194819.841337-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: fix CVE-2021-37750
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The Key Distribution Center (KDC) in MIT Kerberos 5 (aka krb5) before
1.18.5 and 1.19.x before 1.19.3 has a NULL pointer dereference in
kdc/do_tgs_req.c via a FAST inner body that lacks a server field.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-deref-on-TGS-inner-body-null-server.patch | 47 +++++++++++++++++++
 package/libkrb5/libkrb5.mk                    |  3 ++
 2 files changed, 50 insertions(+)
 create mode 100644 package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch

diff --git a/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch b/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
new file mode 100644
index 0000000000..ec6f623380
--- /dev/null
+++ b/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
@@ -0,0 +1,47 @@
+From d775c95af7606a51bf79547a94fa52ddd1cb7f49 Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Tue, 3 Aug 2021 01:15:27 -0400
+Subject: [PATCH] Fix KDC null deref on TGS inner body null server
+
+After the KDC decodes a FAST inner body, it does not check for a null
+server.  Prior to commit 39548a5b17bbda9eeb63625a201cfd19b9de1c5b this
+would typically result in an error from krb5_unparse_name(), but with
+the addition of get_local_tgt() it results in a null dereference.  Add
+a null check.
+
+Reported by Joseph Sutton of Catalyst.
+
+CVE-2021-37750:
+
+In MIT krb5 releases 1.14 and later, an authenticated attacker can
+cause a null dereference in the KDC by sending a FAST TGS request with
+no server field.
+
+ticket: 9008 (new)
+tags: pullup
+target_version: 1.19-next
+target_version: 1.18-next
+
+[Retrieved from:
+https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/kdc/do_tgs_req.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
+index 582e497cc9..32dc65fa8e 100644
+--- a/src/kdc/do_tgs_req.c
++++ b/src/kdc/do_tgs_req.c
+@@ -204,6 +204,11 @@ process_tgs_req(krb5_kdc_req *request, krb5_data *pkt,
+         status = "FIND_FAST";
+         goto cleanup;
+     }
++    if (sprinc == NULL) {
++        status = "NULL_SERVER";
++        errcode = KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN;
++        goto cleanup;
++    }
+ 
+     errcode = get_local_tgt(kdc_context, &sprinc->realm, header_server,
+                             &local_tgt, &local_tgt_storage, &local_tgt_key);
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 89f219d913..d41e7559a5 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -16,6 +16,9 @@ LIBKRB5_CPE_ID_PRODUCT = kerberos_5
 LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
+# 0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
+LIBKRB5_IGNORE_CVES += CVE-2021-37750
+
 # The configure script uses AC_TRY_RUN tests to check for those values,
 # which doesn't work in a cross-compilation scenario. Therefore,
 # we feed the configure script with the correct answer for those tests
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
