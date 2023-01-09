Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09D6C54EBC
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 00:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1EC60A70;
	Mon,  9 Jan 2023 00:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1EC60A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Duxdm0_zSMD; Mon,  9 Jan 2023 00:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA4E60A66;
	Mon,  9 Jan 2023 00:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA4E60A66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E63301BF424
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B97D5409A0
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97D5409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2n-A5muuDOay for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 00:06:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE87F4098E
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE87F4098E
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 00:06:10 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id u8so4194742ilg.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 16:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wl7B7dDYmPDzEEC3w5uGz3h12NklssFGrrpYf4tDBOI=;
 b=mXcQWpAghgw3NodKcnYKh9QkA2JNMx7BAVuzFjy3ya2Jd4JsDBxmDD3aHYvxbvsmnD
 fMW7lL/N5RXsHTRkQ3gNAKx1XxElVU4exvbRcPr/eoAEenwugBC0CKGcDfIcKUpkGUHM
 jrWDoL69qeyiZ88s1yW5d0SFarHam1rMSIA/bVd8IwmvTG6qvCdvM7zn7k8wZ4XDROlq
 z1pVCEeY5v0dA3DedzyZczUTc6p1WeY4NsKcx/tI7gWKnQJSFoTT2OAZnHnAYLhGsME9
 VhiYILhrxKc2xdPvjjtrkU8c13sJI9hE/y7y2P+u3UZAP7kNnGULNmKUXujPFceAV7/t
 7zLQ==
X-Gm-Message-State: AFqh2krKbm9EXWkxLEYvWO8JURxuyg3mmoAAZtdcR75/jkuxA2gI6lSj
 RYZYJ8XDV4xG7sCkAc8UNJb9Fzt6v6OzKw==
X-Google-Smtp-Source: AMrXdXsmtWc+cPvRwLX3IpptdBn4HEu73BkyovI/JNTzKjZuIRroQyfoYzVtq3CHDVaBdA5w5ziCDA==
X-Received: by 2002:a92:1e08:0:b0:30d:7ce3:448b with SMTP id
 e8-20020a921e08000000b0030d7ce3448bmr10092889ile.14.1673222769473; 
 Sun, 08 Jan 2023 16:06:09 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e10-20020a026d4a000000b0038ac4923addsm2321108jaf.53.2023.01.08.16.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:06:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 17:06:05 -0700
Message-Id: <20230109000606.624986-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wl7B7dDYmPDzEEC3w5uGz3h12NklssFGrrpYf4tDBOI=;
 b=GYDMKEO9OvQ/36+iFiLbG8AbqUD57G7WVPYh7FFhH7TL2/QYD5+9gLvtSlVKQiNu8q
 /6KMMwEutc2PChdnqAt1jXZPo9o4JB+Z9cbA1DMC9Ca4afECCYznLQwCXCK3YPvrhjwd
 JIGROi9TtnN21mbi+QHFPu7JmaPM2CUPu3zn6CGlVO637OGDR5kRwXX5/JCgqBn/DVEt
 ehQo17jBu+OEwrkphUks8SFadLcl3kgrjfPsIJ353liOPTf/i0J9wZ/hHmRoQiWuCmsq
 8ZOMEUr6xOU1ulJb0bg0q7sNpngfatwoTnUkbeffwcmiM37Tx109/rdEpGeLld4j5eJd
 wF1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GYDMKEO9
Subject: [Buildroot] [PATCH v2 1/2] package/cmake: disable ccache for
 host-cmake
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
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming ccache update will depend on host-cmake, so we must
ensure host-cmake doesn't use ccache when being built.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cmake/cmake.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 053658fad6..dc92c8bb4e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -40,9 +40,16 @@ CMAKE_CONF_OPTS = \
 HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
 HOST_CMAKE_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
 
+# We may be a ccache dependency, so we can't use ccache
+HOST_CMAKE_CONFIGURE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	CC="$(HOSTCC_NOCCACHE)" \
+	GCC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)"
+
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(HOST_CONFIGURE_OPTS) \
+		$(HOST_CMAKE_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CMAKE_CFLAGS)" \
 		./bootstrap --prefix=$(HOST_DIR) \
 			--parallel=$(PARALLEL_JOBS) -- \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
