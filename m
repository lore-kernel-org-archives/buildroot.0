Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED55DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D2784282;
	Tue, 15 Mar 2022 21:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbValy8SAua4; Tue, 15 Mar 2022 21:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3BB68128C;
	Tue, 15 Mar 2022 21:14:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA1131BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8CCF60761
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnkslY5HRjGB for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:14:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BA226068F
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:14:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w25so397786edi.11
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=N8AQ0WruiSzFotMJNOzDbsqgyBIl9EwHVn7mfvg8nC0=;
 b=QnXhYFE0528PyfzFkZL+DWhJoS2McpE42OqfQuFJ4eUU44J2Bz9FN165QtmSYYcWaL
 cW854ePWnNc1X6iTcKSCsJq/w+Z2rer/1TMZSx0mPRcV3q9YXj1Bg+59GQkNZoK1xqFo
 bmzwajJUTiVGIk6N7Vubf7BMEvkEk8Ez8ZlWeYRyHX6fLLoCxhicvPbYmg5Xh/00qL4a
 mk3aphR3aRIWTnqFrLzjsvPpsWUlgtQbj7m2x3e/9S2m2ACW/KDyMAISCF09f3Th1R2R
 blBdf8duzYZSHJYBKu5dlFjEp3UEGWwY1hZv3QoxTYcNWoVseUKBr17L5m9mEC3udeeO
 +xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=N8AQ0WruiSzFotMJNOzDbsqgyBIl9EwHVn7mfvg8nC0=;
 b=6TCuIq0Vo4ejEnYVi8oD14CvGcYvPfum0zf8kDsG6gq2+53ADrUVK2+WdriWjGa7qn
 lXDdgVL+BMCnz/oFbLvoUvW0IMmS9IMLgdXQGG+pBhp1sKepDA/myyWl18+7ELsq49M+
 3nteJuKzDZlcF+WtUZ5r/7/+PPQUwJ7noA4n4LlIT/TLovhHBvfJQEVIyHGCyI+qYANt
 W7SAgLMPjWc2ENIBtnCdwnHrBINNd2HuXS+03iLmnK6/Ap+1G0dt4fsghXsNEgI4koyY
 I98nbQ0zgQBQNUrxLwddPZXQ6+qYWqPVZmJBiJTiVqFhWpw+te4SbLjZdn4+ZSMrXZJ1
 +mTw==
X-Gm-Message-State: AOAM530oBolkbHsF/XJxic+uxmS6+S3cLB3dqi9UsbMDrGxu+wEYIwMX
 hgp4xo2K7QXahDDhVr2J4qgSYkkq1r5Ssw==
X-Google-Smtp-Source: ABdhPJzjuIIm4XMtlMqtUulWpApZFs7j2a6s8dguvRr4ylhDCbtK4K+z7HWFTxg5+iM4xmFLaWYxvg==
X-Received: by 2002:aa7:c04a:0:b0:418:d7e5:cd51 with SMTP id
 k10-20020aa7c04a000000b00418d7e5cd51mr2000893edo.385.1647378839300; 
 Tue, 15 Mar 2022 14:13:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a17090637c300b006d8631b2935sm53903ejc.186.2022.03.15.14.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:13:58 -0700 (PDT)
Message-ID: <b7114145-a0cd-2bfc-8e5e-bc8f196b8488@mind.be>
Date: Tue, 15 Mar 2022 22:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220301225107.988549-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220301225107.988549-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libfreeglut: bump to
 version 3.2.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/03/2022 23:51, Fabrice Fontaine wrote:
> - Drop patch (already in version)
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ropped-up-with-the-release-of-gcc-10.patch | 69 -------------------
>   package/libfreeglut/libfreeglut.hash          | 10 +--
>   package/libfreeglut/libfreeglut.mk            |  2 +-
>   3 files changed, 6 insertions(+), 75 deletions(-)
>   delete mode 100644 package/libfreeglut/0001-Work-around-for-an-issue-which-cropped-up-with-the-release-of-gcc-10.patch
> 
> diff --git a/package/libfreeglut/0001-Work-around-for-an-issue-which-cropped-up-with-the-release-of-gcc-10.patch b/package/libfreeglut/0001-Work-around-for-an-issue-which-cropped-up-with-the-release-of-gcc-10.patch
> deleted file mode 100644
> index e98e71537f..0000000000
> --- a/package/libfreeglut/0001-Work-around-for-an-issue-which-cropped-up-with-the-release-of-gcc-10.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From b9998bbc1e1c329f6bf69c24606a2be7a4973b8c Mon Sep 17 00:00:00 2001
> -From: jtsiomb <jtsiomb@7f0cb862-5218-0410-a997-914c9d46530a>
> -Date: Fri, 21 Feb 2020 22:25:31 +0000
> -Subject: [PATCH] Work-around for an issue which cropped up with the release of
> - gcc-10. In their infinite wisdom, they decided to build with -fno-common as
> - default from now on, breaking every piece of C code which used to declare
> - common symbols in header files, as was the convention since the dawn of time.
> - We now have to duplicate all declarations to an arbitrary source file, and
> - change the header-file ones to prefix them with extern.
> -
> -git-svn-id: https://svn.code.sf.net/p/freeglut/code/trunk@1863 7f0cb862-5218-0410-a997-914c9d46530a
> -[Retrieved from:
> -https://github.com/dcnieho/FreeGLUT/commit/b9998bbc1e1c329f6bf69c24606a2be7a4973b8c]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - freeglut/freeglut/src/fg_gl2.c | 14 ++++++++++++++
> - freeglut/freeglut/src/fg_gl2.h | 14 +++++++-------
> - 2 files changed, 21 insertions(+), 7 deletions(-)
> -
> -diff --git a/src/fg_gl2.c b/src/fg_gl2.c
> -index 38b0acbb..54b4285b 100644
> ---- a/src/fg_gl2.c
> -+++ b/src/fg_gl2.c
> -@@ -27,6 +27,20 @@
> - #include "fg_internal.h"
> - #include "fg_gl2.h"
> -
> -+#ifndef GL_ES_VERSION_2_0
> -+/* GLES2 has the corresponding entry points built-in, and these fgh-prefixed
> -+ * names are defined in fg_gl2.h header to reference them, for any other case,
> -+ * define them as function pointers here.
> -+ */
> -+FGH_PFNGLGENBUFFERSPROC fghGenBuffers;
> -+FGH_PFNGLDELETEBUFFERSPROC fghDeleteBuffers;
> -+FGH_PFNGLBINDBUFFERPROC fghBindBuffer;
> -+FGH_PFNGLBUFFERDATAPROC fghBufferData;
> -+FGH_PFNGLENABLEVERTEXATTRIBARRAYPROC fghEnableVertexAttribArray;
> -+FGH_PFNGLDISABLEVERTEXATTRIBARRAYPROC fghDisableVertexAttribArray;
> -+FGH_PFNGLVERTEXATTRIBPOINTERPROC fghVertexAttribPointer;
> -+#endif
> -+
> - void FGAPIENTRY glutSetVertexAttribCoord3(GLint attrib) {
> -   if (fgStructure.CurrentWindow != NULL)
> -     fgStructure.CurrentWindow->Window.attribute_v_coord = attrib;
> -diff --git a/src/fg_gl2.h b/src/fg_gl2.h
> -index ab8ba5c7..fb3d4676 100644
> ---- a/src/fg_gl2.h
> -+++ b/src/fg_gl2.h
> -@@ -67,13 +67,13 @@ typedef void (APIENTRY *FGH_PFNGLENABLEVERTEXATTRIBARRAYPROC) (GLuint index);
> - typedef void (APIENTRY *FGH_PFNGLDISABLEVERTEXATTRIBARRAYPROC) (GLuint);
> - typedef void (APIENTRY *FGH_PFNGLVERTEXATTRIBPOINTERPROC) (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid *pointer);
> -
> --FGH_PFNGLGENBUFFERSPROC fghGenBuffers;
> --FGH_PFNGLDELETEBUFFERSPROC fghDeleteBuffers;
> --FGH_PFNGLBINDBUFFERPROC fghBindBuffer;
> --FGH_PFNGLBUFFERDATAPROC fghBufferData;
> --FGH_PFNGLENABLEVERTEXATTRIBARRAYPROC fghEnableVertexAttribArray;
> --FGH_PFNGLDISABLEVERTEXATTRIBARRAYPROC fghDisableVertexAttribArray;
> --FGH_PFNGLVERTEXATTRIBPOINTERPROC fghVertexAttribPointer;
> -+extern FGH_PFNGLGENBUFFERSPROC fghGenBuffers;
> -+extern FGH_PFNGLDELETEBUFFERSPROC fghDeleteBuffers;
> -+extern FGH_PFNGLBINDBUFFERPROC fghBindBuffer;
> -+extern FGH_PFNGLBUFFERDATAPROC fghBufferData;
> -+extern FGH_PFNGLENABLEVERTEXATTRIBARRAYPROC fghEnableVertexAttribArray;
> -+extern FGH_PFNGLDISABLEVERTEXATTRIBARRAYPROC fghDisableVertexAttribArray;
> -+extern FGH_PFNGLVERTEXATTRIBPOINTERPROC fghVertexAttribPointer;
> -
> - #    endif
> -
> diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
> index 2771cbde2f..ce9fb9e299 100644
> --- a/package/libfreeglut/libfreeglut.hash
> +++ b/package/libfreeglut/libfreeglut.hash
> @@ -1,6 +1,6 @@
> -# From http://sourceforge.net/projects/freeglut/files/freeglut/3.2.1/
> -md5 cd5c670c1086358598a6d4a9d166949d  freeglut-3.2.1.tar.gz
> -sha1 7a62e0d2caad92ff745bc5037592b2753f0b2f20  freeglut-3.2.1.tar.gz
> +# From http://sourceforge.net/projects/freeglut/files/freeglut/3.2.2/
> +md5  485c1976165315fc42c0b0a1802816d9  freeglut-3.2.2.tar.gz
> +sha1  8e53cc0251165d02cce8d6d5054159c310958b74  freeglut-3.2.2.tar.gz
>   # Locally computed
> -sha256 d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f46841399da68  freeglut-3.2.1.tar.gz
> -sha256	b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275	COPYING
> +sha256  c5944a082df0bba96b5756dddb1f75d0cd72ce27b5395c6c1dde85c2ff297a50  freeglut-3.2.2.tar.gz
> +sha256  b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275  COPYING
> diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
> index 379de3121b..484b0f4b97 100644
> --- a/package/libfreeglut/libfreeglut.mk
> +++ b/package/libfreeglut/libfreeglut.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBFREEGLUT_VERSION = 3.2.1
> +LIBFREEGLUT_VERSION = 3.2.2
>   LIBFREEGLUT_SOURCE = freeglut-$(LIBFREEGLUT_VERSION).tar.gz
>   LIBFREEGLUT_SITE = http://downloads.sourceforge.net/freeglut
>   LIBFREEGLUT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
