Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2446C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 22:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C87C40103;
	Sat,  2 Dec 2023 22:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C87C40103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_y_vTb4845b; Sat,  2 Dec 2023 22:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D2344020B;
	Sat,  2 Dec 2023 22:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D2344020B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C65AA1BF375
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 22:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC54060EC7
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 22:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC54060EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmKPjkQlDb-F for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 22:27:09 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DAEA60EC5
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 22:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DAEA60EC5
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-332c0c32d19so2810583f8f.3
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 14:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701556027; x=1702160827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZuoYVCTdqgk+faqrXEYK3dOfaRrU800vIuwuKi/IMDM=;
 b=BTYRVmJ+16kCPDckZewNb/vAO86Mu0AwlFzAHKJygSotnnCrj6xF35fl0/obg13i6L
 iSvrOo1knRa+XD8ejqZM6JSe9+QLicVzRShY3Q2FQ0o1KGueFiubtw8UrcwUVDoJA/7W
 WsD95OKeIHBBwswiq7epJRk3H+ZKJfziwDMYeLLdaD//zwH2Aqp2rYWlRfEKHrOLnQH6
 BcmN+WTflutzApYzpYxkewC4QxXyE6Yv4t5L/LR4RdmUh3pa6kVec5bA/lRVl1uV1w3L
 Yx+77hiwbwTKljxUd/76Af4VhcNsHqk7R51sJ7M7rY7fUoC4xe5PSUQEVxayP03MBEOx
 EtYA==
X-Gm-Message-State: AOJu0Yy2vfjS0zCFqzozo34KIUmKJg+6zt9eXgfRFtam3rhAHybimc4C
 Oy+p3sdp4uk6WvmhXb2Th02BlT3KDdM=
X-Google-Smtp-Source: AGHT+IEU+GazG/o70G6sJIYux1chuefWqTV+Nryx8r6PT8uHYhtV4chd99cB4Zv12lkyK26NtyHouQ==
X-Received: by 2002:adf:f44f:0:b0:333:2fd2:2f07 with SMTP id
 f15-20020adff44f000000b003332fd22f07mr2227844wrp.128.1701556026647; 
 Sat, 02 Dec 2023 14:27:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k26-20020adfb35a000000b003332faefd86sm5797062wrd.0.2023.12.02.14.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:27:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 23:26:44 +0100
Message-ID: <20231202222644.315091-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701556027; x=1702160827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuoYVCTdqgk+faqrXEYK3dOfaRrU800vIuwuKi/IMDM=;
 b=I6qCO22XzUNWGX2vRvCQowrFaDk8bKIq2qw2FcBNIFy/l/j0cMqn92io4piaNt/pPB
 d+n9rdyNlE8i3u2orj/uZmbSJb0+nrqGcUZjzbljP3DehDRot9ZiFP5fgpcNbonQzveN
 zmjim7N4huoZaOkdPJzq6eAW91rQbHXUlRZfaPKx1aBhMvFF2illabNPrRW2mvEstMHS
 RCFveU5Ghvlvg6ygN2wJWNoWT1oMBob4fEowGppPYlPEZVri1eXwWD5A1AwzbJ2hvsil
 biJdL6wlBwh8tpa6Wh8/wp/nOYEmEFqSncxHfgt8RdjpAJ6C806t1I70rjYiQts5dLe2
 cLeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I6qCO22X
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: fix selftests with
 kernel >= 6.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following selftests build failure raised since kernel >= 6.5 and
https://github.com/torvalds/linux/commit/9fc96c7c19dfab67bf81b25fbc4f49b7752d5060:

make[1]: Entering directory '/home/autobuild/autobuild/instance-4/output-1/build/linux-6.6.3/tools/testing/selftests'

[1;31merror[0m: missing kernel header files.
Please run this and try again:

    cd ../../..
    make headers

make[1]: *** [Makefile:186: kernel_header_files] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/7674abb454b46ca768e44b6838a0d8724c772dd6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-tools/linux-tool-selftests.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index e29c7f59de..0bcc47af0a 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -23,7 +23,8 @@ SELFTESTS_DEPENDENCIES = \
 
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
-	ARCH=$(SELFTESTS_ARCH)
+	ARCH=$(SELFTESTS_ARCH) \
+	KHDR_DIR=$(LINUX_DIR)/usr/include
 
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build the selftests in $(LINUX_DIR)/tools/selftests and
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
