Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A46C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Mar 2022 22:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 102E3400A4;
	Tue,  1 Mar 2022 22:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6mSJd3QemQY; Tue,  1 Mar 2022 22:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C18DD40383;
	Tue,  1 Mar 2022 22:51:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 928061BF34F
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 22:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74A6E814A0
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 22:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWT8Tu0665Bq for <buildroot@lists.busybox.net>;
 Tue,  1 Mar 2022 22:51:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DA9A81495
 for <buildroot@buildroot.org>; Tue,  1 Mar 2022 22:51:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r10so22899839wrp.3
 for <buildroot@buildroot.org>; Tue, 01 Mar 2022 14:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sr6DkVcwe+npbmyfKyYHvLIpoe05lBX5SUviUrtGZhY=;
 b=dTmFTkh0D2EEDEfMXWBtzIrIV5WlO42357iZfIoN7AZeO3hLVO/w1yKdpK115Oat1f
 CCOZ8PW9MQeHiBIeAyuchHsbLbn8GNYZYMADogKRr0PQZuD2C1+7esIDRLwJ1z661BXS
 JIZSWf8po0N1952nYXMLqpX0KLa2nR02+o7hO3uK5/GIbjBKcKfNTS9CzuwygXFSFvNz
 7XZCfAZ1VIvtNwGhAa1n6Ju2qpfXpakX1LDANUd3cctN+AQQewIR92JwOC7eSQ9fPdgU
 Hikh+zc8M//R0EgFz0e8JJ59Vv8g90Haj8ceI3IMp3bNB0viTl4KGlz4stNngUUZLNFR
 vbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sr6DkVcwe+npbmyfKyYHvLIpoe05lBX5SUviUrtGZhY=;
 b=niTMBJVD8MnJfVVeItIjBwi0On0JzzL9yqT9lrXFKzBfpjASBuFF1uFm7xFavRAeAY
 IJsLek8WP2RYQ3OXIWgWNfjuhSVjIuJUuRyf1ctpHXl4VQaTrc91WMNAf0TQwqk88LP4
 q11AlVUYim7Dder0OfrQRR1rqho6Vj5tHT0r9Vd6O46qYeGsP8Il8bPIfgzbB6et7ZPJ
 3SIFfboL4J1r9z1K8ftc+vfGSL9MANx0XDkPl7vzf8PmR/bu/MMSIJqpD8yLxGkmBATL
 8WLPH29uWoMMeov5QJ5/KQ0sJYoqZXxpxWoKbHcI8aPXK6TS/2JG0jPn3GvRD/nDvr1V
 UW8Q==
X-Gm-Message-State: AOAM5316XK4XymdNrseRsZWo8C6bnuGIMKGymyMHU1Da35z1WaVVKUzO
 iWaPNbqZEYUtZkweESBs+dD1Aj/MtiE=
X-Google-Smtp-Source: ABdhPJyI/Ly7b2SAwFRMGcAzdcnpBUWPQimx9d9XqmxxlNzSelEpSCFGmJI1q2/v+7yB71zbYdxHYw==
X-Received: by 2002:adf:dd12:0:b0:1ea:9398:8f4f with SMTP id
 a18-20020adfdd12000000b001ea93988f4fmr20042924wrm.458.1646175095998; 
 Tue, 01 Mar 2022 14:51:35 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a7bc11a000000b0037bf8fa8c02sm3602718wmi.13.2022.03.01.14.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:51:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Mar 2022 23:51:07 +0100
Message-Id: <20220301225107.988549-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libfreeglut: bump to version
 3.2.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ropped-up-with-the-release-of-gcc-10.patch | 69 -------------------
 package/libfreeglut/libfreeglut.hash          | 10 +--
 package/libfreeglut/libfreeglut.mk            |  2 +-
 3 files changed, 6 insertions(+), 75 deletions(-)
 delete mode 100644 package/libfreeglut/0001-Work-around-for-an-issue-which-cropped-up-with-the-release-of-gcc-10.patch

diff --git a/package/libfreeglut/0001-Work-around-for-an-issue-which-cropped-up-with-the-release-of-gcc-10.patch b/package/libfreeglut/0001-Work-around-for-an-issue-which-cropped-up-with-the-release-of-gcc-10.patch
deleted file mode 100644
index e98e71537f..0000000000
--- a/package/libfreeglut/0001-Work-around-for-an-issue-which-cropped-up-with-the-release-of-gcc-10.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From b9998bbc1e1c329f6bf69c24606a2be7a4973b8c Mon Sep 17 00:00:00 2001
-From: jtsiomb <jtsiomb@7f0cb862-5218-0410-a997-914c9d46530a>
-Date: Fri, 21 Feb 2020 22:25:31 +0000
-Subject: [PATCH] Work-around for an issue which cropped up with the release of
- gcc-10. In their infinite wisdom, they decided to build with -fno-common as
- default from now on, breaking every piece of C code which used to declare
- common symbols in header files, as was the convention since the dawn of time.
- We now have to duplicate all declarations to an arbitrary source file, and
- change the header-file ones to prefix them with extern.
-
-git-svn-id: https://svn.code.sf.net/p/freeglut/code/trunk@1863 7f0cb862-5218-0410-a997-914c9d46530a
-[Retrieved from:
-https://github.com/dcnieho/FreeGLUT/commit/b9998bbc1e1c329f6bf69c24606a2be7a4973b8c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- freeglut/freeglut/src/fg_gl2.c | 14 ++++++++++++++
- freeglut/freeglut/src/fg_gl2.h | 14 +++++++-------
- 2 files changed, 21 insertions(+), 7 deletions(-)
-
-diff --git a/src/fg_gl2.c b/src/fg_gl2.c
-index 38b0acbb..54b4285b 100644
---- a/src/fg_gl2.c
-+++ b/src/fg_gl2.c
-@@ -27,6 +27,20 @@
- #include "fg_internal.h"
- #include "fg_gl2.h"
- 
-+#ifndef GL_ES_VERSION_2_0
-+/* GLES2 has the corresponding entry points built-in, and these fgh-prefixed
-+ * names are defined in fg_gl2.h header to reference them, for any other case,
-+ * define them as function pointers here.
-+ */
-+FGH_PFNGLGENBUFFERSPROC fghGenBuffers;
-+FGH_PFNGLDELETEBUFFERSPROC fghDeleteBuffers;
-+FGH_PFNGLBINDBUFFERPROC fghBindBuffer;
-+FGH_PFNGLBUFFERDATAPROC fghBufferData;
-+FGH_PFNGLENABLEVERTEXATTRIBARRAYPROC fghEnableVertexAttribArray;
-+FGH_PFNGLDISABLEVERTEXATTRIBARRAYPROC fghDisableVertexAttribArray;
-+FGH_PFNGLVERTEXATTRIBPOINTERPROC fghVertexAttribPointer;
-+#endif
-+
- void FGAPIENTRY glutSetVertexAttribCoord3(GLint attrib) {
-   if (fgStructure.CurrentWindow != NULL)
-     fgStructure.CurrentWindow->Window.attribute_v_coord = attrib;
-diff --git a/src/fg_gl2.h b/src/fg_gl2.h
-index ab8ba5c7..fb3d4676 100644
---- a/src/fg_gl2.h
-+++ b/src/fg_gl2.h
-@@ -67,13 +67,13 @@ typedef void (APIENTRY *FGH_PFNGLENABLEVERTEXATTRIBARRAYPROC) (GLuint index);
- typedef void (APIENTRY *FGH_PFNGLDISABLEVERTEXATTRIBARRAYPROC) (GLuint);
- typedef void (APIENTRY *FGH_PFNGLVERTEXATTRIBPOINTERPROC) (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid *pointer);
- 
--FGH_PFNGLGENBUFFERSPROC fghGenBuffers;
--FGH_PFNGLDELETEBUFFERSPROC fghDeleteBuffers;
--FGH_PFNGLBINDBUFFERPROC fghBindBuffer;
--FGH_PFNGLBUFFERDATAPROC fghBufferData;
--FGH_PFNGLENABLEVERTEXATTRIBARRAYPROC fghEnableVertexAttribArray;
--FGH_PFNGLDISABLEVERTEXATTRIBARRAYPROC fghDisableVertexAttribArray;
--FGH_PFNGLVERTEXATTRIBPOINTERPROC fghVertexAttribPointer;
-+extern FGH_PFNGLGENBUFFERSPROC fghGenBuffers;
-+extern FGH_PFNGLDELETEBUFFERSPROC fghDeleteBuffers;
-+extern FGH_PFNGLBINDBUFFERPROC fghBindBuffer;
-+extern FGH_PFNGLBUFFERDATAPROC fghBufferData;
-+extern FGH_PFNGLENABLEVERTEXATTRIBARRAYPROC fghEnableVertexAttribArray;
-+extern FGH_PFNGLDISABLEVERTEXATTRIBARRAYPROC fghDisableVertexAttribArray;
-+extern FGH_PFNGLVERTEXATTRIBPOINTERPROC fghVertexAttribPointer;
- 
- #    endif
- 
diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
index 2771cbde2f..ce9fb9e299 100644
--- a/package/libfreeglut/libfreeglut.hash
+++ b/package/libfreeglut/libfreeglut.hash
@@ -1,6 +1,6 @@
-# From http://sourceforge.net/projects/freeglut/files/freeglut/3.2.1/
-md5 cd5c670c1086358598a6d4a9d166949d  freeglut-3.2.1.tar.gz
-sha1 7a62e0d2caad92ff745bc5037592b2753f0b2f20  freeglut-3.2.1.tar.gz
+# From http://sourceforge.net/projects/freeglut/files/freeglut/3.2.2/
+md5  485c1976165315fc42c0b0a1802816d9  freeglut-3.2.2.tar.gz
+sha1  8e53cc0251165d02cce8d6d5054159c310958b74  freeglut-3.2.2.tar.gz
 # Locally computed
-sha256 d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f46841399da68  freeglut-3.2.1.tar.gz
-sha256	b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275	COPYING
+sha256  c5944a082df0bba96b5756dddb1f75d0cd72ce27b5395c6c1dde85c2ff297a50  freeglut-3.2.2.tar.gz
+sha256  b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275  COPYING
diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
index 379de3121b..484b0f4b97 100644
--- a/package/libfreeglut/libfreeglut.mk
+++ b/package/libfreeglut/libfreeglut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFREEGLUT_VERSION = 3.2.1
+LIBFREEGLUT_VERSION = 3.2.2
 LIBFREEGLUT_SOURCE = freeglut-$(LIBFREEGLUT_VERSION).tar.gz
 LIBFREEGLUT_SITE = http://downloads.sourceforge.net/freeglut
 LIBFREEGLUT_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
