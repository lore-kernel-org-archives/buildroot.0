Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B225C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91F1E40167;
	Sun, 21 Jan 2024 10:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F1E40167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBolqFOGwldO; Sun, 21 Jan 2024 10:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64D2740198;
	Sun, 21 Jan 2024 10:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64D2740198
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 837091BF4E7
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B565418D4
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B565418D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p36J-9EA62ID for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:00:29 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BDB4418D0
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BDB4418D0
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33921b8988fso1888644f8f.3
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 02:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705831226; x=1706436026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVNYpZI5xrppC4gnAhY8NeXXrjM3v7olmyeMqbBHliE=;
 b=IVDAF2j6cdWzItNpj31lLoWuW1sPkDDkSUNI+/0HhHRs6/+6PH3GX88L7UZ3oxhiEZ
 yXeib64BncYpvNH3GuF8aQWJ101CKkWpNxAO5zHIWy9MsFQ2BoqLp1UN1iqafBncYw+L
 MKmVjbJ4SVpZhsi0T+3S0dL4ftP8meKimHPcawn+CgXHf8IcyvSgZE+mSCaMdSqNHrJk
 PzXfH6Eoq0EuCCAg7mA9vl+lcoaP8JBzRKZxr+OFOvM+MoHfHVbX/oRQRvym1TAtjVpJ
 AgpRU8seNTLGHF1iJ5Hio2iQiCoIKNekef81HF5R7bJAjzDd/1z0ZSgcJeAJYJ1mXzRD
 3ubw==
X-Gm-Message-State: AOJu0YylIH1UFtQ9imAY8Bas2ZfIl9erWgq1DJB1HPRiFPgUKr1a7+c+
 3SORhnEQnoPRW1N9jxbFmi6gTQlmBwYFmLYF801ALSx4d897iFNpZL9nwcCF
X-Google-Smtp-Source: AGHT+IG4ftgbjJWDGnNT4N4j93Mk3TjBAFXcgJInkrvI7QOK4ofw71tj/zjvSG2f8aHOw5SSx/qnRw==
X-Received: by 2002:adf:f210:0:b0:337:c727:f632 with SMTP id
 p16-20020adff210000000b00337c727f632mr1272366wro.44.1705831226030; 
 Sun, 21 Jan 2024 02:00:26 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x4-20020a5d4904000000b0033928514699sm3566673wrq.2.2024.01.21.02.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 02:00:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 11:00:23 +0100
Message-ID: <20240121100023.316551-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705831226; x=1706436026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UVNYpZI5xrppC4gnAhY8NeXXrjM3v7olmyeMqbBHliE=;
 b=J4WAbacvGAff+HxZ0mrsOEYtW9Zt0cg4OcCFqQt9kTzVJqwJ8ZFvTACCevxYQoC7tf
 Cqnaa6ChO+go4s9O8JRJxsWoCfkbreYVEXLloBa9/qOPfkUrmahz5nVIiWYn9Rr1/Ccv
 d7XeZlxMajNfNjKphzmM8QPQhpeJW2uDRucdtLiBsq0SBh+iDJPFrAZTilDnBcbTACpA
 G7ZEEqzB4C+aCKK9RkIcCY0ESoSXA+Qx/klcRD9TMkcAeWmP1qOpspm+7zmAcHxv3gQA
 3mUlfE9o1pYr2pNMCP07Ynsc3Km27D40uG5rapv5IY00jRnhNsK14bCef8aicE7GSbmr
 y+4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J4WAbacv
Subject: [Buildroot] [PATCH 1/1] package/lynx: fix openssl static build
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
Cc: Mario Lang <mlang@blind.guru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use LDFLAGS instead of LIBS to fix the following openssl static build
failure raised because lynx filters out duplicates (i.e. -lz) in
CF_ADD_LIBS:

configure:12958: checking for inet_ntoa
configure:12995: /home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLINUX  -static conftest.c -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -lssl -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -lz -pthread -lcrypto -lz -pthread  >&5
configure:12998: $? = 0
configure:13001: test -s conftest
configure:13004: $? = 0
configure:13014: result: yes
configure:13095: checking for gethostbyname
configure:13151: result: yes
configure:13232: checking for strcasecmp
configure:13288: result: yes
configure:13401: checking for inet_aton function
configure:13443: /home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLINUX  -static conftest.c  -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -lssl -lz -pthread -lcrypto >&5

[...]

/home/autobuild/autobuild/instance-7/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -DHAVE_CONFIG_H  -DLOCALEDIR=\"/usr/share/locale\" -I. -I.. -Ichrtrans -I./chrtrans -I.. -I../src -I.././WWW/Library/Implementation    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -DLINUX -I/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include -I/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/openssl  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Ofast -g0 -static  -Wl,-rpath,/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -Wl,-rpath,/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib   -L/home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib -static -o lynx  LYebcdic.o LYClean.o LYShowInfo.o LYEdit.o L
 YStrings.o LYMail.o HTAlert.o GridText.o LYGetFile.o LYMain.o LYMainLoop.o LYCurses.o LYBookmark.o LYmktime.o LYUtils.o LYOptions.o LYReadCFG.o LYSearch.o LYHistory.o LYForms.o LYPrint.o LYrcFile.o LYDownload.o LYNews.o LYKeymap.o HTML.o HTFWriter.o HTInit.o DefaultStyle.o LYUpload.o LYLeaks.o LYexit.o LYJump.o LYList.o LYCgi.o LYTraversal.o LYEditmap.o LYCharSets.o LYCharUtils.o LYMap.o LYCookie.o LYStyle.o LYHash.o LYPrettySrc.o TRSTable.o parsdate.o UCdomap.o UCAux.o UCAuto.o  LYSession.o LYLocal.o  .././WWW/Library/Implementation/libwww.a -lz -static -lncurses -lssl -lcrypto -L/home/autobuild/autobuild/instance-7/output-1/host/bin/../x86_64-buildroot-linux-uclibc/sysroot/usr/lib64 -pthread
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.4.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-7/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(libcrypto-lib-c_zlib.o): in function `zlib_oneshot_expand_block':
c_zlib.c:(.text+0xb8b): undefined reference to `uncompress'

Patching aclocal.m4 is not possible as autoreconf fails due to missing
AC_DIVERT_HELP macro.

This build failure is only raised by autobuilders since 2024 for an
unknown reason.

Fixes:
 - http://autobuild.buildroot.org/results/6d4119b54fc6b6111a03f81e131e83bae0d844d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lynx/lynx.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index 3f62f4f5b7..b441eacef7 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -53,6 +53,8 @@ LYNX_DEPENDENCIES += libidn
 LYNX_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libidn`
 endif
 
-LYNX_CONF_ENV = LIBS="$(LYNX_LIBS)" CFLAGS="$(TARGET_CFLAGS) $(LYNX_CFLAGS)"
+LYNX_CONF_ENV = \
+	LDFLAGS="$(TARGET_LDFLAGS) $(LYNX_LIBS)" \
+	CFLAGS="$(TARGET_CFLAGS) $(LYNX_CFLAGS)"
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
