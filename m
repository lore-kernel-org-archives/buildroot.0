Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AF0C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 18:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F03E81948;
	Wed, 21 Feb 2024 18:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzSIVMfD5ftB; Wed, 21 Feb 2024 18:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EFD2819D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EFD2819D1;
	Wed, 21 Feb 2024 18:16:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA4901BF3EB
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0DB740448
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGx620FBOiNw for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 18:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FF8240292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF8240292
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FF8240292
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 18:16:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33d01faf711so4429309f8f.1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 10:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708539412; x=1709144212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/2vqxamXkkpJymf+IAIbPz2DXVSdlUrzWt8riIcU1I=;
 b=gEIMrmJ/KIBF66F2/tuYTMOmFg7u+R/apjlmnXz9t2LbKdUFG4Fyh85IxqVB7nuXnf
 ToNEB5WKplBcdEPzGF7CBU4le1DdLDHEhC2dhnaiozHg8k1Bkz+Owc6xcPNDKKJDrUQ1
 6aCjKK+0DDe9MGhTFOLpp6/I5/IW1UXJbyClHQ8VZcfpdLfg42o4k1ENcC2nEG3AHi2G
 zTJYr0QWqB+7IcMzhIO9K35LmYYwAr/Ox+T4gqfTK8FMCaE4/1N3keUc/xKNBG9DFN8n
 J587vEpR6N1SWg/TKld3XGIS+tgpaVwxvTjemKY+0mD6iwI7eAo37b3hzPLjyJT2yFPT
 CD4Q==
X-Gm-Message-State: AOJu0YwkGqvTSAGa6OCdueD7hrEdxi/haRVlB21IBeZFXzNv3a0heI3Y
 PIPQjhfJt6cT08LY4qBwfUbHZTwn82RPujfsqaAryNtPYcUuv3xNitXCHbBr
X-Google-Smtp-Source: AGHT+IGvF+EMXOgFlS/NJeMRc0Y1MjHMhHC3GeQS8bfhIfAT4Jre3mWk9WXxzbchFNTFCxeFXxq7Tw==
X-Received: by 2002:adf:f9c5:0:b0:33d:14e8:70e2 with SMTP id
 w5-20020adff9c5000000b0033d14e870e2mr13231238wrr.53.1708539412199; 
 Wed, 21 Feb 2024 10:16:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b7-20020adfe647000000b0033b406bc689sm17830263wrn.75.2024.02.21.10.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 10:16:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 19:16:50 +0100
Message-ID: <20240221181650.1115046-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708539412; x=1709144212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K/2vqxamXkkpJymf+IAIbPz2DXVSdlUrzWt8riIcU1I=;
 b=ajF3adRc1VSeteXD5Q376vQV1cemMDXvFkbBEGjNoDjVwXejPRrRrd2PtCAntTkFpU
 NgI1HCalK5cjwhwFQKeIn7PLKrcBbUcq3zm4Oe+nVMWpqnKlp2xfUzfAcR3Z/buF3P/+
 WF+p8bmepN+3/Tt4nO2KPdPOTkNVwW+lL0FSf+90AL5T5xWI4JclnjfeSPQTMllZPQ+y
 HBmd0JsRJCmqRa5lq5+5m10wNWVqbZ4+alQ1husElhcTFdzk8stqm7914v2gguV1pp36
 zq27qitbLGssHiez0uEMNcwSYawHGADRwNrrkh7c3UUFfRLWUFgWwJ99miM9tBrlo8yE
 B9Pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ajF3adRc
Subject: [Buildroot] [PATCH v2,1/1] package/zlib-ng: fix arm build
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

zlib-ng usage uses CMAKE_C_COMPILER_TARGET which is non-standard and
is not supposed to be used by the CMakeLists.txt machinery of a
particular package.

Indeed, [1] specifies that:

  Some compiler drivers are inherently cross-compilers, such as clang
  and QNX qcc. These compiler drivers support a command-line argument
  to specify the target to cross-compile for.

buildroot is not using clang nor QNX qcc.
[2] also refers to this variable only for clang [3] and QNX [4].

Therefore, zlib-ng's usage of this variable is a bit of a hack, and it's
actually why it works when passed as an argument, because they are in
fact not supposed to use this variable.

So set CMAKE_C_COMPILER_TARGET to BR2_ARCH to fix the following arm
build failure raised since bump to version 2.0.6 in commit
d2249821d3f30202ca2a35ad24918378d9a0a0e8:

-- Detecting C compile features - done
-- Arch not recognized, falling back to cmake arch: 'l'
-- Basearch 'l' not recognized, defaulting to 'x86'.
-- Basearch of 'l' has been detected as: 'x86'

[...]

/home/buildroot/autobuild/instance-0/output-1/build/zlib-ng-2.1.3/arch/x86/x86_features.c:17:12: fatal error: cpuid.h: No such file or directory
   17 | #  include <cpuid.h>
      |            ^~~~~~~~~

[1] https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_TARGET.html
[2] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html
[3] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-using-clang
[4] https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-for-qnx

Fixes: d2249821d3f30202ca2a35ad24918378d9a0a0e8
 - http://autobuild.buildroot.org/results/1551aa69be19239a8d8e081f033e4027d679ab8f
 - http://autobuild.buildroot.org/results/075d704c0f11710353bac43478e4501addcd747d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni and Peter Korsgaard):
 - Update commit message

 package/zlib-ng/zlib-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index fbb906503a..33e8754c9d 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -13,6 +13,7 @@ ZLIB_NG_PROVIDES = zlib
 
 # Build with zlib compatible API, gzFile support and optimizations on
 ZLIB_NG_CONF_OPTS += \
+	-DCMAKE_C_COMPILER_TARGET=$(BR2_ARCH) \
 	-DWITH_GZFILEOP=1 \
 	-DWITH_OPTIM=1 \
 	-DZLIB_COMPAT=1 \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
