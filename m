Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FC8C0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4FB2612B2;
	Wed, 26 Jul 2023 21:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4FB2612B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfyf4KqO6iUy; Wed, 26 Jul 2023 21:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B86612C0;
	Wed, 26 Jul 2023 21:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B86612C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D79F11BF980
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0BB3612B8
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0BB3612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViKIQy2FFIJ3 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:37:33 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C69AD605AE
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C69AD605AE
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7835971026fso8875839f.3
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 14:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690407452; x=1691012252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zg2eQrrrmH5qeIogJWWWd4ZP2IkdP1eYdF68sbtwAiw=;
 b=a4151kkw9s1NYv5WZDLtsvrCJrYTJh/p9qGrME3hedSUd80NcYdkOeY84a4RMl2nCI
 +7xuA2DSiSRHr3jPl47SDamrz0QTJXG9NiZKGCIJFdTa3gkifU3JgncCteY9ZkOWI1T2
 KGWiVqb8XnWcekJtTwZCkpYkjAlBLmPTgtFi5Uc+KJMvs9Fu6XTh9vUcoQqrUz/1R34z
 Q+O2i5KQvUaM75ruV3r5FSxxRofecLn0lIFTjPI7+ED4UjGLY+bGyyS5GfUnmFBfIPB4
 NrN1R5XH0p07yHrKxFQpESgfTZvhDRGjo7jvONKXCaiD0SgBjbPxOKd4s52Ib6tah+Ij
 Yfdw==
X-Gm-Message-State: ABy/qLZDwwY+NN3+ooQntQSD2Mmte5lCQqnKd3vFsxVlqREJIaQ5Xof9
 K+ZXRcHQqqBGQknwOTuel6kparZWhe9afA==
X-Google-Smtp-Source: APBJJlEjBz5315w93Uxutjy/8fLNM+kZktZUs2BdhCMoyDEbgejcxNpgDgRCNVBstz5jxMPdiE7ddQ==
X-Received: by 2002:a92:c54d:0:b0:345:cea0:a676 with SMTP id
 a13-20020a92c54d000000b00345cea0a676mr3692872ilj.10.1690407452381; 
 Wed, 26 Jul 2023 14:37:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 u3-20020a02cbc3000000b0042acf389acesm4353726jaq.71.2023.07.26.14.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 14:37:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 15:37:26 -0600
Message-Id: <20230726213726.20750-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726213726.20750-1-james.hilliard1@gmail.com>
References: <20230726213726.20750-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690407452; x=1691012252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zg2eQrrrmH5qeIogJWWWd4ZP2IkdP1eYdF68sbtwAiw=;
 b=Hzp91hUySawp1rSsQz8TCdKfTbJTyOcGnk04b+NocWEND9ZVtJD7MyQMxdudcBGEz4
 aJIxPzVxXc7eNxgOk28w4hNH2M2idoG+xXb6A7nR1Q8CUYZEJqG7VR4Yyt3/69BIquXT
 En8jNOCbiRsNov8i9/7qo/tDn5WyPa0j8TaWRKr6894MlMFIRceGJMTCN0XJaJ9lgK/t
 ZFGf5IudjjTy268JtowsuIDCKap2sQNEzCXCB9FB55nOXBdPFQYxeast6CScWqCDT/dk
 uhWdlEIZ2RiCLRMlG5J+U8nkCkxItAJ2zmQ2Pm4Y0IgIKqqcNUtRvR+kqL1sjaUCS+4R
 RdWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Hzp91hUy
Subject: [Buildroot] [PATCH 2/2] package/python-orjson: bump to version 3.9.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index f1298c05ce..773fb14568 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  b932fc1e43598fb91022b1dc651afeaef650793a2a590ca4fbeef57a3808abf5  orjson-3.8.4.tar.gz
+sha256  048938fd9153f37eaf7a08b748de94ff87b2488dd3bd9f96c3ae784527a961b3  orjson-3.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 8eeadecb3d..f5d4ad1046 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.8.4
+PYTHON_ORJSON_VERSION = 3.9.2
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/8f/2d/ae31eddf7e097eec5e25c7da954ef6e944f4dbf79153676f94cea3dc5116
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/30/a4/96bcb52da0de9ccfcd99a60719b995c9b9c3aaa3a70701f0790ce856c10d
 PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
