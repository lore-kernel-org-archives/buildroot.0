Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2864EC4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 17:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 838B383E9D;
	Tue, 18 Oct 2022 17:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 838B383E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1vEpvPhrlsd; Tue, 18 Oct 2022 17:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C539383E93;
	Tue, 18 Oct 2022 17:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C539383E93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FE681BF44A
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 17:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A33D41A4B
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 17:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A33D41A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3eZXuB-94h_B for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 17:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C30041A3E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C30041A3E
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 17:05:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n12so24564438wrp.10
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 10:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P2/u2sjSOqdXr1OYO9hSLLMjAikWDdjF7pnrFGMij30=;
 b=u9z5v6cBNGiDxIuWHxsj0N3CQMohRjX89QBcL1jsAqGi0b/HWyFrib90XkZWtPFVi6
 jLe6CAioHs+a7tX9lY+SaBhSuBPaJQwtnibr0MOmZLMNG8Bdj/oxUSR/+2f+HB1ivtBr
 ihgtl9rqfCqsq+3y05bJ4vrrK/TSu1RFMKUGUtwI6LkjW1yAOwNMVxh+T3E91rR5zx5R
 lwp1GIsCSwtP9QJl7fOAGpRwVVZlqysxedYKuwGay5U2rH7KK6RX2XWdTc9aJ7LpOcCu
 Jm8BgZUVpy0I3MAIgwe9qH2sqb7s22rWfbHyu+9GXjGlvxThY2d3N0FQB16OTALzVXB5
 1zyw==
X-Gm-Message-State: ACrzQf0Oi8s/gCtr8OAg6X1LKeCNc+RKSQHnET5yAckvCf9RC6TU7In5
 AVD6Mv4Y/3uiytnZa2fnbSo25ZLnPyk=
X-Google-Smtp-Source: AMsMyM57Q51TmFyFA8fb8svPRi0ljtmYNu6LCC1aCl8rmVYTlnzPLeOOXan9HJNoS0yKQYpetVqzQg==
X-Received: by 2002:adf:f7d2:0:b0:22e:3ca4:a657 with SMTP id
 a18-20020adff7d2000000b0022e3ca4a657mr2549622wrq.177.1666112737231; 
 Tue, 18 Oct 2022 10:05:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c465100b003c65c9a36dfsm13129127wmo.48.2022.10.18.10.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 10:05:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 19:05:31 +0200
Message-Id: <20221018170531.190643-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P2/u2sjSOqdXr1OYO9hSLLMjAikWDdjF7pnrFGMij30=;
 b=HyteoSKi5hNMAqK9p0PON42Cyymp/qjauIwt/AVDi/kmf+E3HZQr3K3zMETbg8SoFW
 9zIUWwEQ4QYrhu3Nan05oH9MdPBePXjNoPtVKnYmVw/2s8TucAPlrIjVhJZRcE83sejH
 flglfPFXDhyk9+GAHi8E3VO/PZuU15UG+/e1aiY3QDsBHh5YeVz3OP2IZc60uPq7mLlj
 MD4sNXi9Sb0WYJ1TUm5tezgaVyW5Zo5JO1fEJZ0DDVOqUvNYExt4UgrkVmi0QtC3lIb3
 Dvyt/gchlpKIBFZ12Y9nACGmgL+yxHLJv8it6OAxXT0LyxIouXhoNqSMWgtGtFKwLbpy
 Tcog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HyteoSKi
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: fix build with gcc 4.8
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

Fix the following build failure with gcc 4.8 raised since bump to
version 2 in commit 026265bf7e09e0348aefa79e7a1f32add925f23b and
https://github.com/ewxrjk/sftpserver/commit/dbbf0d45425a72a790d25b889ca2cfa909aaaadf:

In file included from alloc.c:25:0:
utils.h:204:48: error: expected ';', ',' or ')' before 'dest'
 static inline void *sftp_memcpy(void *restrict dest, const void *restrict src,
                                                ^

Fixes:
 - http://autobuild.buildroot.org/results/2795213c07c4a961cee0ae7a4e7cccb8bcd6f68e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gesftpserver/gesftpserver.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index b47ec1c5d3..5a3ab0536c 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -16,7 +16,9 @@ GESFTPSERVER_CPE_ID_VENDOR = green_end
 GESFTPSERVER_CPE_ID_PRODUCT = sftpserver
 
 # forgets to link against pthread when cross compiling
-GESFTPSERVER_CONF_ENV = LIBS=-lpthread
+GESFTPSERVER_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -std=c99" \
+	LIBS=-lpthread
 
 # overwrite openssh version if enabled
 GESFTPSERVER_DEPENDENCIES += \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
