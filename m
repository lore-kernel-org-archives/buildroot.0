Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B28C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 14:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2734440AB5;
	Sun, 19 Feb 2023 14:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2734440AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hliF3iGFp4kC; Sun, 19 Feb 2023 14:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DC9140AF5;
	Sun, 19 Feb 2023 14:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC9140AF5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05F011BF386
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E19BC40AD5
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E19BC40AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ju0FSMWwzSW0 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 14:25:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B9BD400E2
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B9BD400E2
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 14:25:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 s7-20020a05600c45c700b003dc52fed235so485780wmo.1
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 06:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vngLtjedt1P2TBILFMctahuGCBJK5/KpuHNKu0wJq+o=;
 b=Zoib+K79faDWmAu+vGRhc55CPfdyLlISwuHXlFTKa3I760pRAXDFgouKZxXLgoPshh
 sKaaoEZJ11gisv7PwwtxHaImTAO2hRYE4a1HT0P2xm58rgGW2nhes98YiK8JNlXjSH3a
 vwNGaxI/vNZmRO93zJKWmfHXZcAGhv7RX1lxJs0ANCz6bCy6FSUMTCqEv5T2X9bNkIPI
 8JJ13sxHrrSIFDTOuaG958KQHynPHM9g5za4crPIHwS5N0ERR1BvUnbcM3ZwhSaUAIJU
 bhLQNYNPSj/H/HABMkHxuxJuVcQe26V+RlSa3urDFJjkbhoa3ixjDsa9iexzC9lxu6Ba
 bnyA==
X-Gm-Message-State: AO0yUKWPg6GC11ncuJISy700UAQX4v2wyodT+nma8uqbDsp6rJXxKP3O
 tle5z5w8+lm43aLXPjomoMk2owrgU9c=
X-Google-Smtp-Source: AK7set9FHtw7W8J5dQtJzHtVckPJSoD46I7m37jFBjrzCWBNmnciNHrZGxfxdmsWURbMpIGilYq9KA==
X-Received: by 2002:a05:600c:1609:b0:3e2:1592:ccf5 with SMTP id
 m9-20020a05600c160900b003e21592ccf5mr8073456wmn.8.1676816754241; 
 Sun, 19 Feb 2023 06:25:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c00ca00b003ddf2865aeasm6172774wmm.41.2023.02.19.06.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 06:25:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 15:25:48 +0100
Message-Id: <20230219142548.626439-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230219142548.626439-1-fontaine.fabrice@gmail.com>
References: <20230219142548.626439-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vngLtjedt1P2TBILFMctahuGCBJK5/KpuHNKu0wJq+o=;
 b=j/OSZxOMNG0jCKrhiH2+ZMG7/yXMtiDloyMGg6Gqoh/fGy5ktnMfTGWc++iGTLl/p5
 ZhVTktBwsjwgrrn5iWIjFa1DWknm0oDKxPhr6hsoukhqy35LSi97+gilmrAao+pyQLtR
 u2YPrVIodj3nKnN2DU3nlHVOh7QOWd9YvAj5jT2fR3hiBknPM7hxAc8TYv4ivcYcXe+s
 5uZTOlMnKKeOM/krr/uxhZjrRelTMxJxBZCeOPFqj7LAnFF20fuZk02TpVAVGle8t9gl
 Wu4LCIznoE1ZGqj2/RumVTbTzRHY7xxrNWpDz+wb7XeV6G0UXV9j2ine2X6byKywYCcc
 HZlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j/OSZxOM
Subject: [Buildroot] [PATCH 2/2] package/speechd: fix build without makeinfo
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without makeinfo raised since the
addition of the package in commit
9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found

Fixes:
 - http://autobuild.buildroot.org/results/d4f193545eb31864a9bac5a9d05bba39d3c7ff3e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speechd/0001-add-disable-doc.patch | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 package/speechd/0001-add-disable-doc.patch

diff --git a/package/speechd/0001-add-disable-doc.patch b/package/speechd/0001-add-disable-doc.patch
new file mode 100644
index 0000000000..dd17b10e4f
--- /dev/null
+++ b/package/speechd/0001-add-disable-doc.patch
@@ -0,0 +1,78 @@
+From d88557d3c29c33f76af20cb7a6eb798f6f598c23 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 19 Feb 2023 15:18:35 +0100
+Subject: [PATCH] add --disable-doc
+
+Allow the user to disable documentation through --disable-doc to avoid
+the following build failure without makeinfo:
+
+make[3]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/doc'
+  MAKEINFO ssip.info
+  MAKEINFO spd-say.info
+/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found
+/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found
+WARNING: 'makeinfo' is missing on your system.
+         You should only need it if you modified a '.texi' file, or
+         any other file indirectly affecting the aspect of the manual.
+         You might want to install the Texinfo package:
+         <https://www.gnu.org/software/texinfo/>
+         The spurious makeinfo call might also be the consequence of
+         using a buggy 'make' (AIX, DU, IRIX), in which case you might
+         want to install GNU make:
+         <https://www.gnu.org/software/make/>
+WARNING: 'makeinfo' is missing on your system.
+         You should only need it if you modified a '.texi' file, or
+         any other file indirectly affecting the aspect of the manual.
+         You might want to install the Texinfo package:
+         <https://www.gnu.org/software/texinfo/>
+         The spurious makeinfo call might also be the consequence of
+         using a buggy 'make' (AIX, DU, IRIX), in which case you might
+         want to install GNU make:
+         <https://www.gnu.org/software/make/>
+make[3]: *** [Makefile:492: ssip.info] Error 127
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d4f193545eb31864a9bac5a9d05bba39d3c7ff3e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/brailcom/speechd/pull/810]
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 4 ++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 26617c78..480eb50e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -22,7 +22,11 @@ pkgconfig_DATA = speech-dispatcher.pc
+ 
+ BUILT_SOURCES = $(top_srcdir)/.version
+ 
+-SUBDIRS= include locale src config doc po
++SUBDIRS= include locale src config po
++
++if ENABLE_DOC
++SUBDIRS += doc
++endif
+ 
+ EXTRA_DIST= config.rpath COPYING.LGPL COPYING.GPL-2 COPYING.GPL-3 ANNOUNCE BUGS FAQ README.md README.packagers README.translators README.overview.md README.style.md build.sh speech-dispatcherd.service.in speech-dispatcher.socket speech-dispatcher.service.in po/Makevars.in po/README
+ 
+diff --git a/configure.ac b/configure.ac
+index faaa8629..4f2af908 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -168,6 +168,10 @@ AC_SUBST([EXTRA_SOCKET_LIBS])
+ AC_SUBST([ERROR_CFLAGS])
+ AC_SUBST([RDYNAMIC])
+ 
++AC_ARG_ENABLE([doc],
++              [AC_HELP_STRING([--disable-doc], [turn off documentation])])
++AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
++
+ # Check for python support.
+ # Python 3 or greater required
+ AC_ARG_ENABLE([python],
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
