Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E314BC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8429D60B3A;
	Wed, 22 Feb 2023 22:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8429D60B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKLvEFL18CX9; Wed, 22 Feb 2023 22:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A82D760B96;
	Wed, 22 Feb 2023 22:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82D760B96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA6A1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1394160B96
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1394160B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoMlpXq8xKZr for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:18:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D273860B3A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D273860B3A
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:18:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so6460701wmc.5
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=06H2v+hxqcrpEeQFRl6eelWfJACDeLGcTU10m1FkAys=;
 b=IBH2mkRAjH1XvRrPxlX5qABJNEuSIgTH6SwWRkweasU0pdLT0fLKKURBGbTIdMSL2I
 YMQaxxNDL570JraeoDUAt+Jfp1xT8mBtEKnJsZvFHvk2KNLH/s6YAMQRIl1b+p/37TYC
 2+ZGeKVEjmsC5uC+zBNvMoCXR8XQR+T2HkZCH54fU14HJ3sBR3cFNtjQ9EWuTAktGe/2
 K41LYU0LgE+6jRpe1GNIEGB3kBQrW7NeuL15I+K2NN8d4Fs2R3EdVFBNC9Xl8U6RhTIt
 U6QonagQjuQeZTWR8t6U36jj3vxoL3BOviWUdAQbprzcnPCIA8aKsZT25TXJrwu2Lp6g
 CbXw==
X-Gm-Message-State: AO0yUKUbLNNTZTySShQ1Uy027pT418+tNUcY5KEFc5qhRitC2lAyPTpD
 X59r5bMpsw9y/gF7USaCn9M5f3L9Pcc=
X-Google-Smtp-Source: AK7set+RAqRkgZuBVDQ6zk+3PbTNd0g4ldF+E/0Onhhrc5aHb5rMm2wMDmelJtKCNdDeLIAbl5djNQ==
X-Received: by 2002:a05:600c:a42:b0:3df:9858:c02c with SMTP id
 c2-20020a05600c0a4200b003df9858c02cmr8617566wmq.1.1677104278537; 
 Wed, 22 Feb 2023 14:17:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c210500b003e00c453447sm9033710wml.48.2023.02.22.14.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 14:17:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 23:17:50 +0100
Message-Id: <20230222221750.558885-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=06H2v+hxqcrpEeQFRl6eelWfJACDeLGcTU10m1FkAys=;
 b=iXODe7nxZy+TMKx4eYU7HqKFDWVLTllQEgPBnvlXAkF05jL02nGpzSAZf/6p/S3x+m
 0I1jgdb1ies1nHXrDcyh2RPf4fD3vsYQHB05TzHTBQ1wkR/e/X6JjZ9OlBt5sSkIYrRW
 DOmb4L5MLevJ7t4MkOhWOOPfAoho0TlkoOa2YTdS0YqAVkm29qwRNJ/sffVU/+bP+aQu
 GQ6vmSoYSdzA6JuQpm0Yho9HJO3F4tCxRWH7Jz7aDX0pTpd1ujuCWMgdMNZ0Fw/DT/gk
 nhu9gEcpokdmdebv0MRNaediBA++RoTGdVaah7gYf0G/ygBzG29bAoHoi9cKeIcSb1m4
 4z1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iXODe7nx
Subject: [Buildroot] [PATCH 1/1] package/optee-client: fix uclibc build
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version
3.19.0 in commit 917a961d9c77d5f1aaa47206add9b9ff80e74a82:

/tmp/instance-5/output-1/build/optee-client-3.19.0/libteeacl/src/group.c: In function 'teeacl_user_is_member_of':
/tmp/instance-5/output-1/build/optee-client-3.19.0/libteeacl/src/group.c:75:12: error: implicit declaration of function 'reallocarray' [-Werror=implicit-function-declaration]
   75 |   groups = reallocarray(groups, grouplistsize, sizeof(gid_t));
      |            ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/03eba71ab9b87676f2606ecf2a9b5a151fc396bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-use-realloc-instead-of-reallocarray.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch

diff --git a/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch b/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch
new file mode 100644
index 0000000000..88f5a4f87e
--- /dev/null
+++ b/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch
@@ -0,0 +1,34 @@
+From dde6306458331371be5df15e3ca953697d2463ef Mon Sep 17 00:00:00 2001
+From: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Date: Thu, 2 Feb 2023 17:22:29 +0200
+Subject: [PATCH] libteeacl: use realloc() instead of reallocarray()
+
+Use realloc() instead of reallocarray(), since uClibc apparently does
+not implement reallocarray().
+
+Fixes: https://github.com/OP-TEE/optee_client/issues/339
+
+Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+
+[Retrieved from:
+https://github.com/OP-TEE/optee_client/commit/dde6306458331371be5df15e3ca953697d2463ef]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libteeacl/src/group.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libteeacl/src/group.c b/libteeacl/src/group.c
+index 10965dd0..bd165a11 100644
+--- a/libteeacl/src/group.c
++++ b/libteeacl/src/group.c
+@@ -72,7 +72,8 @@ enum rv_groupmember teeacl_user_is_member_of(const char *user, gid_t group)
+ 	if (ret == -1) {
+ 		p_groups = groups;
+ 
+-		groups = reallocarray(groups, grouplistsize, sizeof(gid_t));
++		/* we use realloc, since uClibc does not implement reallocarray */
++		groups = realloc(groups, grouplistsize * sizeof(gid_t));
+ 		if (!groups) {
+ 			free(p_groups);
+ 			return E_MEMORY;
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
