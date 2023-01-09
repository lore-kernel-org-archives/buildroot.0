Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF091C54EBC
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 00:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B20760A70;
	Mon,  9 Jan 2023 00:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B20760A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaS6eiGklLKp; Mon,  9 Jan 2023 00:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A910160A66;
	Mon,  9 Jan 2023 00:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A910160A66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B208B1BF865
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C3A8409A0
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 00:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C3A8409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Thcro3ZpD5_N for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 00:10:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4B8C4098E
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4B8C4098E
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 00:10:40 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id n63so3825183iod.7
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 16:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wl7B7dDYmPDzEEC3w5uGz3h12NklssFGrrpYf4tDBOI=;
 b=H+uNnrjIh8+OG2pOLW+lomUpviEwZI+U2lci8JBCF+MRMEuLfv8Mr1iX13s/tQMspx
 cu/v2AfkbgpScWd98BFfF/ICwFd0lmG598mNoAZPuS1GwEu6FUu5H7wv7CG6DnRcUs0F
 z7aHfAI+De2avyrZMD30eL50ZmsFKbkxXXkefaFyiodZexnPkTXMs4e3h4Byl+Bd4PSz
 tTkb8U01+/rXOmbTkVSIbizJpZIVImnYEC7ZmCqAWFlgVV3wCts82gizHRITJILLO3Jo
 wsdDy16TDLoOMryGlCGkHqNJ2SeR3Bd1mEcdH7HpizSXeAFhvq275XVwP0ZizAgzrEgZ
 2zBA==
X-Gm-Message-State: AFqh2kohzc0+JK5MkWZA71buioSP9RHYtv3tFD3sAzAfZFBjo2nF+ffs
 5XDgzIFqslhnEh9wSd32hlReoZhcjav50Q==
X-Google-Smtp-Source: AMrXdXt/Pm3gDmJhO8IsRZB8ZAr7WA9sApES+DyUi3rr68KAI34dXXBvR/jbSQteR7TDWzAp2kM88A==
X-Received: by 2002:a6b:e806:0:b0:6df:619e:6589 with SMTP id
 f6-20020a6be806000000b006df619e6589mr50265519ioh.19.1673223039492; 
 Sun, 08 Jan 2023 16:10:39 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 d2-20020a0566022be200b006e00ddb4517sm2727579ioy.48.2023.01.08.16.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 16:10:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 17:10:36 -0700
Message-Id: <20230109001037.641422-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wl7B7dDYmPDzEEC3w5uGz3h12NklssFGrrpYf4tDBOI=;
 b=oa4BL5yW1PpdKoDVOzeimx5sJEd0Ok2V5En8dOAsjEXRglB91cN8m0IJ3tCdoodUhk
 ipCno2jQZk8Q3eyHimGZrlUmTUAITqIR3Sk9KmYMKBvdux8ZfTNEvDDoJ+O+75SIxQ5/
 X4FfOXa1/f6LEm74XMHj4zkyxnZhdLKs8mYyTaD5sH0D8DwAzxKDto31LWPBYzsQs4ok
 EfAU4/K8o99j4j0EM2Nal4dSn4bbQrBmF89HeMEV+68boPllKfhcDzEdDgmSC02IyLyf
 6R+e1oKeUFRJuFMkJk6T6Ida9UdMeQvltNPagOjlVIskLOLrOh4sVNov4+/SrSs2Beag
 LAeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oa4BL5yW
Subject: [Buildroot] [PATCH v3 1/2] package/cmake: disable ccache for
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
