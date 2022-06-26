Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE90C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 10:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0DD3411A3;
	Sun, 26 Jun 2022 10:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0DD3411A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pscFSx_2Fd3t; Sun, 26 Jun 2022 10:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C741A411AC;
	Sun, 26 Jun 2022 10:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C741A411AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 711661BF25B
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 10:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D519400E2
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 10:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D519400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m53iXU4t9qWg for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 10:20:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2614540B95
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2614540B95
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 10:20:42 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v14so9057786wra.5
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 03:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i4qGM4PY9LE7zZ5142Tv1d1BoBSRBLBXb0z8uugA/cU=;
 b=i6oGVMFs65+EbB+id9Nnk7DIocyb7KZj8rB0sKw3swvOsIPF8+KgBpisZSi+HuP0Jt
 ssI/j8kk4x7azAgADC0CjMQ7yTZbnxKIMQvnAGD4XDQ4KxJK9I4yz4BmXs+5rZmVXhTW
 otrCl9Ya4wGHU5vLWAB3DJTYaX8D6LBQvrEUntANP3FVTXBBD1hxAXAaVxH2AzCrLwI5
 GjzwqlZTIVZMZmtOCp+GNMQGlhCwcQwBabDLBZMc72QZ84Jf04yiszc+xpGgKOskwIF4
 sboAL916Dap8BEWrUkFLom/DjTtwzcEAnUoG3heonZ1cnz0xI6orpIDSeMocXkpYJOu9
 XP+w==
X-Gm-Message-State: AJIora+Lcz7km5LOyLOJik/U27h5hNCiXQaaCE+p7q4MYpT/lr73yDRJ
 IldDX2iESzTmemfJYVvq/89fZKHual8=
X-Google-Smtp-Source: AGRyM1vNlphRpIuPZcG7BfoRpVpFdY0C0cUNEMx/5r66ktiacbL3tpwvq1ggAJKcMjdklhHobcEW0A==
X-Received: by 2002:a05:6000:1f08:b0:21b:ae8f:4f0a with SMTP id
 bv8-20020a0560001f0800b0021bae8f4f0amr7557325wrb.456.1656238841059; 
 Sun, 26 Jun 2022 03:20:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a7bcc91000000b0039c4ec6fdacsm8958486wma.40.2022.06.26.03.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 03:20:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 12:17:53 +0200
Message-Id: <20220626101753.1491335-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i4qGM4PY9LE7zZ5142Tv1d1BoBSRBLBXb0z8uugA/cU=;
 b=OnfbO6KvLIso7EcKom6Iu+ZkLNt1Hz6vWlAaXhc0fuHfdwHjmQ+6tIF8S+CXnJs6K7
 x5QNj8QmjQ02Hmf8dBKsBigZPgg1MIgLIbj0ygXyCqYZnYTqWxRsJX8/nyGpneYz7OWy
 3/2yH2oz1cwuqif16ByxSgFtlIMi6pP1+5w7Cq8+mRfHKhGt8oJ0WH/LLCuzarPwjgJq
 7vuSBfdx9LhykIMH6utk34Xqsf0H4GkDq9hyQNR200a1db4l+1i6LD6B07QgJrcqkhtG
 n4wUXYFzFKQV5zH20J3/9FYSzq2oZ2F8lM1xwOmD8l2jaCtQ0Ne6Kwf/7L9Burq0Gs9w
 CKGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OnfbO6Kv
Subject: [Buildroot] [PATCH 1/1] package/ccid: bump to version 1.5.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/LudovicRousseau/CCID/releases/tag/1.5.0
https://github.com/LudovicRousseau/CCID/blob/1.5.0/README.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ccid/ccid.hash | 2 +-
 package/ccid/ccid.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index 4ef7aff3d4..d42d0778f1 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e6f7645b59a9a2844eb4b1a7eff512960d7f04a4654af02f7fd2f8aded5db40a  ccid-1.4.34.tar.bz2
+sha256  81549b3422469d503996d03a3aed2ef1375b359167f10d66be9e3844e729322e  ccid-1.5.0.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 3cb599d566..c05e28a5d2 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.34
+CCID_VERSION = 1.5.0
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
