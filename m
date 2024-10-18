Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E7CD30004
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 12:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49BBF606C2;
	Fri, 18 Oct 2024 12:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_R8669ufZvp; Fri, 18 Oct 2024 12:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D20B6066B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D20B6066B;
	Fri, 18 Oct 2024 12:59:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C0772804
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 12:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CF9580CA5
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 12:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNIcNo27lxhn for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 12:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46ECE80BF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46ECE80BF6
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46ECE80BF6
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 12:59:52 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 5DB8BC2954;
 Fri, 18 Oct 2024 14:59:49 +0200 (CEST)
Message-ID: <f517190c-6fcd-4101-afa6-f6ea521feb9e@grenoble.cnrs.fr>
Date: Fri, 18 Oct 2024 14:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Buildroot development <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241018043437.28475-2-bagasdotme@gmail.com>
 <D4YXO0EB2YTF.3Q4E8FN1YH9PB@collins.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <D4YXO0EB2YTF.3Q4E8FN1YH9PB@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1729256389;
 bh=0j8PTdUPKLBzweO/rVRRAAEq+nNKxB1xT78H19Xd/HA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qXfimIQiyMvDA5KpbHBO5nEOFByGXfigRcP4+G2+S5mBOAYpNv1Qvfee19nRBglrx
 A0JRZ3pY0N3SFq3219AqIeC2zf92kNladdSylSFjZiM29IQYLE9/apURCf81LrXwPr
 XMiofBubiVHTznAFqjxnfxMeOzYZBUmm6MDI5g3+qghatMAm056IunXH4rNmDY7dGv
 7xKyulz4yOAjJB22p1uk5xb17rkvPA0oe8aq6dnTBrI8FTYV1tcReyh6jl7SQahxzO
 7zMZyVde9XjrU0ah/RziDFT5p0pibPImYYOe9Eax00GSibhE5abjfrhtfjUtXKkdmZ
 +bdKulGDShEFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=qXfimIQi
Subject: Re: [Buildroot] [PATCH] package/git: require wchar support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Bagas Sanjaya wrote:
> Git version 2.47.0 fails to build on systems without wide characters
> support (e.g. uClibc-ng without BR2_TOOLCHAIN_BUILDROOT_WCHAR
> selected): [...] From upstream discussion [1], git requires toolchains
> with full ISO C99 support (including wchar). As such, depend the
> package on toolchain's wchar support (BR2_USE_WCHAR).
>
> [1] https://lore.kernel.org/git/ZxCJqe4-rsRo1yHg@archie.me/t/#u

Brandon Maier replied:
> I sent a patch last week that did this same change! Thomas Petazzoni
> reviewed it and had some comments I haven't had time to address. [...]

I took a look at the issue, and here is what I found:

 1. There is no obvious way to disable building the git test suite.

 2. uClibc always installs wchar.h in sysroot, although this file is a
    stub if wchar support is disabled.

 3. Patrick Steinhardt proposed a patch in the git mailing list[1] that
    would make git compatible with wchar-less uClibc. This patch,
    however, won't work for us for a couple of reasons:

      * It doesn't apply on 2.47.0.

      * It assumes that, when using uClibc, __UCLIBC__ should be defined
        *before* the first #include, which is not the case.

Below is a version of Patrick Steinhardt's patch that seems to work on
Buildroot/master.

Regards,

Edgar.

[1] https://lore.kernel.org/git/ZxEXFI80i4Q_4NJT@pks.im/

------------------------------------------------------------------ >8 --
diff --git a/t/unit-tests/clar/clar.c b/t/unit-tests/clar/clar.c
index cef0f023c2..6de0b415b1 100644
--- a/t/unit-tests/clar/clar.c
+++ b/t/unit-tests/clar/clar.c
@@ -18,6 +18,13 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 
+#if defined(__UCLIBC__) && ! defined(__UCLIBC_HAS_WCHAR__)
+   /* uClibc can be built without wchar support, in which case the
+      installed <wchar.h> is a stub that does not define wchar_t. */
+#else
+#  define HAVE_WCHAR
+#endif
+
 #ifdef _WIN32
 #	define WIN32_LEAN_AND_MEAN
 #	include <windows.h>
@@ -763,6 +770,7 @@ void clar__assert_equal(
 			}
 		}
 	}
+#ifdef HAVE_WCHAR
 	else if (!strcmp("%ls", fmt)) {
 		const wchar_t *wcs1 = va_arg(args, const wchar_t *);
 		const wchar_t *wcs2 = va_arg(args, const wchar_t *);
@@ -798,6 +806,7 @@ void clar__assert_equal(
 			}
 		}
 	}
+#endif // HAVE_WCHAR
 	else if (!strcmp("%"PRIuZ, fmt) || !strcmp("%"PRIxZ, fmt)) {
 		size_t sz1 = va_arg(args, size_t), sz2 = va_arg(args, size_t);
 		is_equal = (sz1 == sz2);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
