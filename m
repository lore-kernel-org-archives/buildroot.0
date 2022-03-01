Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C8C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Mar 2022 22:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5D160EC6;
	Tue,  1 Mar 2022 22:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-O6dmuKJ20V; Tue,  1 Mar 2022 22:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C65C60EB8;
	Tue,  1 Mar 2022 22:34:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD1A1BF34F
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 22:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17D7E818BE
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 22:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byEJvwDxVybE for <buildroot@lists.busybox.net>;
 Tue,  1 Mar 2022 22:34:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9F1E818A2
 for <buildroot@buildroot.org>; Tue,  1 Mar 2022 22:34:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id c192so19538wma.4
 for <buildroot@buildroot.org>; Tue, 01 Mar 2022 14:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iln0NGrzFqL7tcCnirpPxxs00gcFP+gDAocqSHog0HE=;
 b=AeRBIJXR800+r0czoYdRh+R3R2UsubRsQ1dg27qVlhDdSY+HikITFDZQoFak3n+5za
 awBvUL30oY2vntCQHuvllW4nKXISsl/jxU+tPeEj2JqwuPnte7okBAukO9DTgJHKHD9d
 sMp39IVZqEUHRzWRZ2LwOlqggijpbaeIyy9b/xbz2YsWUr8zY5gHSXK3G/AMtcnguK05
 Zb/LvE0DRWCX7wrFvelnhXvki7np8bHFuZvWp3SRiQEbwnPaO9g6DRZD6crvLEDG15aJ
 Xbi8SG0PO9fBmlRQPDU28WJCZ7JZ4d9epcHAfeH7uazt5L+w6VgWh2GzYjJsfC16f+IF
 8pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iln0NGrzFqL7tcCnirpPxxs00gcFP+gDAocqSHog0HE=;
 b=4SWAkg7q3GEo5TyptQx1JSG49TXg5Dd8hP5XBPJuuc/FmHo3HXOAekHHyTkGwK7GIJ
 b+KTy5JETn6Nb+ySwDXzgjz7R7sOm4PqlPZAS9XnjcgYCqJE9z+N54AHn1OdbIt2Ud+o
 f+EWLLPSE6qgjMQVZ57ksyK6zKU1l0k9U3W35/1AgRH/+JcA548Y3HGysIvTXyEhzD8q
 T6oKMTwG3fT9Y/SELhLpyRlIZH3jEsZN0PPtrcaXLiE+YnqT3b5X9U1fiXM8BDDfoV/B
 rcmsVh6bp1y8Je0XgeIHLUbZUmmDLzu+Oy1HaMN5Zezd4EI6peKfft9Y55jYlB37QUUt
 zAeQ==
X-Gm-Message-State: AOAM530P74Qv6L+fmMlaFSEhEIRzBhvrbSlly91a3H97TevnKDxEBClK
 pJJbct1qMjs8MKsYRZaJ/0YrjISK3VM=
X-Google-Smtp-Source: ABdhPJzmlp9BmZyMrtmo8Qm9IO2RXbRWGdIM4YUNooxfaZGpRXHoY+IC4tPFw3a+yC054agv/wA00Q==
X-Received: by 2002:a05:600c:35c4:b0:381:782e:9645 with SMTP id
 r4-20020a05600c35c400b00381782e9645mr7317018wmq.63.1646174085836; 
 Tue, 01 Mar 2022 14:34:45 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d522f000000b001e85b14dadcsm14753596wra.5.2022.03.01.14.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:34:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Mar 2022 23:34:16 +0100
Message-Id: <20220301223416.947624-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/ace: bump to version 7.0.6
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ace/ace.hash | 5 ++++-
 package/ace/ace.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/ace/ace.hash b/package/ace/ace.hash
index 92fd42e131..2387927879 100644
--- a/package/ace/ace.hash
+++ b/package/ace/ace.hash
@@ -1,3 +1,6 @@
+# From https://download.dre.vanderbilt.edu/previous_versions/ACE-7.0.6.tar.bz2.md5:
+md5  d1656851619aff15365270ccf2d56c6e  ACE-7.0.6.tar.bz2
+
 # Locally Computed:
-sha256  a28339750620c70cd29a8a7088a4bc6ebaf1ff7ba667498a0279ac97f0e32e01  ACE-7.0.1.tar.gz
+sha256  4a0cd7da4851f769fddfcf33f663eba4afad824efeff9f59f134c4640ee80216  ACE-7.0.6.tar.bz2
 sha256  687bf9d16119e0caf6fb5c18214928fd6ea0da10df91e906255b7613af8061d8  COPYING
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index 8df89d8c6f..7299f0d40c 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ACE_VERSION = 7.0.1
-ACE_SOURCE = ACE-$(ACE_VERSION).tar.gz
+ACE_VERSION = 7.0.6
+ACE_SOURCE = ACE-$(ACE_VERSION).tar.bz2
 ACE_SITE = http://download.dre.vanderbilt.edu/previous_versions
 ACE_LICENSE = DOC
 ACE_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
