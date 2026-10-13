Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808A8CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41EBD608C5;
	Tue, 13 Oct 2026 21:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuTbWgd-cuWb; Tue, 13 Oct 2026 21:58:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CB54608AD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928711;
	b=OzixvGoKrMly8Db2/pl+ciSNlZQBlolFtU1YQEhh2AsQJW6DSgTuFw2x6cJWXGXQHPI8
	 F6UNvqItSeH4sm0x3F78gSHoE8G1SkrrLiSNxf4DkcdGlKvqCcy4hV5KEEBNoW3AGwy+S
	 EUETgnhZf2rNSXADbSISajuOgcTmpIfMbFaCLXI2lSyfFmxdo9Qst8gdyZnAzvO2KRSVF
	 drUvycGcWHEV8b9vEwr4Bq2EnrLJJid3iyZrjUKO2vChnoJ+2jZMA5x+eSTI4rcUTcuUH
	 XZYy7d/byRJcWJqnzHkUy/h7CVB34sn3l39W0Y+M5dSLQLdBHtMQs29tMRIpnzxPzZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Pi5KnpEPak4dG2yzBFyrLppx+h+10B+Qqvmq5io+nck=;
	b=LsZT0HwR2id1qmAjWe08FzQ9MQ2g2cY3/BshuT4azuGnHZ9XAvPpAET0SHqVyYKW5Jx3
	 UR34ZMwDGK0JLO6T2k/6FjxYC0MsqLV4VQGpLl7rSPfiMvLDwnZCwIWKj8M61OF9TK8RB
	 fwdia+pxaGJa87e+1xc0w+Pz0GBUz+e6gTyGt8vtMIxZsYq7VITWm8RrM5H04EqImoRxB
	 qUsdas1o9jAwqGOnCh8TkDeMyrtG+IJE2u5IyXOoAhAN0ENfm1G3Y1GOvGwYfZZgC8O1u
	 Y2JS80giE/QD+h2w15Nh8WVspz1wuTnKhd92375u3h+Ml+V4BcquoOaDSrdqyAwG+/A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928711;
	bh=Pi5KnpEPak4dG2yzBFyrLppx+h+10B+Qqvmq5io+nck=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X6GygFfuYQXjOC5cpDLcxXm4KpabGLhYFJ3wW2yupLiyzlUPp+YiGVYJSVcEIHYq+
	 u7IPEFch2SAaujH+IY+RJz5/W6ujqq55Jlox/AXO4N4dHgesNnJVRvA5VZG/dAnVw1
	 nNzDJt1y80hp9y41P+Up3d+JMZg74Q/Jg6uCUVmIHKxESn+bO0k/T5kUTIz/DEgay+
	 hOXWlA3Tl3SZoOe3/w2D9LtYFeQrUUvFEfZaF491Y+xKIl5MEWdG0SzxZY0qzdaiac
	 7zkpZtSj3ubcXWRUi12j1cZ4AV1GZ9JZtqaj95JB+9btLxMrzB8S4XaOppG8j1t3xm
	 qNUWkas+0lo0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB54608AD;
	Tue, 13 Oct 2026 21:58:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C5E52AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 526BF40723
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RiDJDGbjizb for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5455A40709
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928708;
 b=RA+dwDDErhrrQgVrANNBMbT78pYP//UbHME542lciqQLUWOzbi2QPOpXAnFijijhsKNt
 igAVGH/h1O8U8WMBIq69H4k/gD2enOl83WBNNqPESpM15yPuvSRVD6hzlfmSyOtJMzFZS
 609nierOlt6AyTfhxaor+ne21UHIzq6ZNiUU6TVs9yHtl7O7H8QCduEDlAau7/y47mVwq
 SdODFS8mRacE6xMYXU68M6GIjOSLDbSlLz+gav42IMC8kXQFgAjAmVDCJ28bkSShYFLMe
 Zm/NFRzQkKIfFJ1b/3Gqrk3DCKKGF+1jgx1bQuVWpfsds+j1LItkQO30yK1qhLdH3Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928708;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WXYY9GZ+bOND5Rz7zPVB+UOJSf8SqToAYZGnR9cyaE0=;
 b=e2RTzwGz02K0BfC9cyek5NiR2KKT5XrVFiL9PsjfNKFBcTepy2u8x9tgX+y/1UQpDqZ8
 hwjEFPnHb+x7Sn0ufLAkb4n4md7IH2JMgpqOeArD9fjsgmZuRIHXtwPYZD1sksYDdX0yp
 6+xm4jaldgXanuc1SoSNf+2UMoUg6eV1I3tXLFb0K8Il0w2q/MJgbrhLTuiWU2hAtUkL+
 +zZu8zWS5D0vs2Xa5itIj9No02O0jzRE67Yn/1yd0va1W37zE+lvM5Cmb1LLt3JxwK2JD
 Vj46cdohGPHHmyuvYTm3CF1GBNyLSzlwAiTdX4MD5Pe85DkzKNR0Aiq6QT34Oa2aKKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ODPU+XsZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ODPU+XsZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5455A40709
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791928705;
 bh=WXYY9GZ+bOND5Rz7zPVB+UOJSf8SqToAYZGnR9cyaE0=;
 h=From:To:Cc:Subject:Date:From;
 b=ODPU+XsZhwhrYKJdGM5+6xPRsnO+0iRd3BfR2M0n8ROrfqFTQwVAXsxARyptBTJ0Q
 oWKfr63winjm3+ZVOHvQ7bfLH77eeKBHrtqVPTreHrCQMNuNUF5FPfkRU/RoVxxsZD
 fgcmMJg//GBMlwDerhsmv7H1CFBvADI1ear1lqp7eJoEdnOjJZVEa9NhXJ4wE+GbQ5
 aBhFkeE9TIYfQQwCDy4XJy1x/NAhRZl+TnrdDDfXB5exex6QH0DJ/DEFGQebk1a8FR
 ug62HDSpFaXS00M+UhYx+oCoOojTVcUZ/NmD8AtLkt4HFPeCiDw/nAdmQrHtWfTayX
 noReLn53oMCqw==
X-KAS-Sym: v3:f51bdf72230551df:iRrhmmgc7+3BXX9A7J0fNbonZj/POtdddEk4Wm3Jhqtu+
 sXfYOd4zBWKrruPbrjPdv/aES5XyA4HhkYwm1co6isH0XaNMXgtqj5ztLda6xfN7JMCG5kC0l9e
 eg7Z6CBkYtSFlvHI38C/3xfc6/ar0E34i0+9kgHjEx4muSh1jt+pz1nqnncJQ+adhAsuZfnsXvq
 YBz93Ws0X6CBfGw73C81W2yZVNFEiDXmm2njJa1Z97kdSXiwA83kCl7e1Iei+EnLIJKwlHgl7U+
 TiUmmYdu0QK4VggGIaCUOAcqzRcmHRIsp9t18czpbCJYDCR+z7UrxaMk/Rs6hLK7VsWaFchw==:
 4gax+F59bXCnWY8bMXJSCrVQem/QRj2AM8gPLunu/pbj03kW5APOtOJlD5lPiiqJKQFYy5ukPLf
 3HBjxU7XjcFsamxaarAXHhij2SnVaWEGJcuEoCqmztHruBPbZ0jzdCJkynkJ/+WRn+nMxY885Jn
 TkvAOz3cv0VkXpo25M5hb1PsCqhEaEgfAh/KpMWcUj2/7CRD67jwaUIyDLH0ZUiuFpWpcfkeyat
 7DteF+2M2/bjHgAQ6rIVjooMiEUXj2nTi0/lEiNuW7Kr0fufaF/YYDYtlzIuDd3RaET9in67Yfj
 Q3f5LGSP4LiqdqZC2v2QW/16q/CWpkCT/tgwwNGVPvk91g43Yi4/MaWr2Kp/6zRNNI+ZG4ugpuc
 +pcywWeZ3MiUzhM0cM4obqIaBekcKvi1zMDqIqvIWumV+pASNzJZqa+BmEBSpMLjAmyNxRSSq2k
 c6nSS1HBgG6Thb9ljBm2K9Vbz6exM5He9Clp4/12jtEum9RYgUitQLueJr9AVDXC3QsOcjq0cJe
 GLIi1O/QwR4mWzee9o3hSzY0kIbm+ddA8Iw6KMGsgvF05/60EHQf4eqYt2kHataShfcSOMpW0q2
 Onc9WO/n73O6YEoPKHPUWIlM5NUO67fwbEPO5N3Sk6DUUQz71Vto1s7jmRYRYcd27CRy5w4eiv8
 9gGm+TIXwraDZOOo=
Received: from fli4l.lan.fli4l (p54a1b220.dip0.t-ipconnect.de [84.161.178.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF5B8A4C35FC;
 Tue, 13 Oct 2026 23:58:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36996)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xGkVt-00000000333-1PLc;
 Tue, 13 Oct 2026 21:58:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Tue, 13 Oct 2026 23:58:24 +0200
Message-ID: <20261013215825.319471-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/2] package/llvm-project/libclc: fix build with
 llvm 23
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

Buildroot commit 5f79161e4a8756acdb25c8500de9b2dee663f2ac bumped the
llvm packages from 22.1.8 to 23.1.0 causing configure errors with the
libclc package:

-- Check for working CLC compiler: /usr/bin/gcc
CMake Error at cmake/modules/CMakeTestCLCCompiler.cmake:29 (message):
  The CLC compiler

    /usr/bin/gcc

  is not able to compile a simple OpenCL test program.

  Output:

  gcc: error: unrecognized command-line option
  '--target=spirv64-unknown-unknown'

Update various configure options to detect the correct host compiler.

Add post install hooks to create symlink which is needed for mesa3d to
detect libclc.
Fixes tests.package.test_mesa3d.TestMesa3DRusticl.test_run:

Libclc failed to load. Please make sure it is installed and provides
                spirv-mesa3d-.spv and/or spirv64-mesa3d-.spv

For details see
https://gitlab.archlinux.org/archlinux/packaging/packages/libclc/-/commit/ca75c4b19c76ae856a368d070d914b12f71203a5#line_9b9baac1e_A71

Fixes:
https://autobuild.buildroot.net/results/3fc/3fcdcb71be590b090df2f765c68aeaecc44dd215/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/libclc/libclc.mk | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
index ff00871747..cefdca63d4 100644
--- a/package/llvm-project/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -36,13 +36,28 @@ LIBCLC_CONF_OPTS = \
 	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 	-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
-	-DCMAKE_C_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
-	-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \
+	-DCMAKE_C_COMPILER="$(HOST_DIR)/bin/clang" \
+	-DCMAKE_CXX_COMPILER="$(HOST_DIR)/bin/clang" \
 	-DLLVM_CMAKE_DIR="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBCLC_TARGET=spirv64-unknown-unknown \
 	-DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR="$(HOST_DIR)/bin"
 
 HOST_LIBCLC_CONF_OPTS = \
-	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-
+	-DCMAKE_C_COMPILER_FORCED=ON \
+	-DCMAKE_CXX_COMPILER_FORCED=ON \
+	-DCMAKE_C_COMPILER="$(HOST_DIR)/bin/clang" \
+	-DCMAKE_CXX_COMPILER="$(HOST_DIR)/bin/clang" \
+	-DLIBCLC_TARGET=spirv64-unknown-unknown
+
+define LIBCLC_LINK_STAGING_SPV
+	ln -sf spirv64-unknown-unknown/libclc.spv $(STAGING_DIR)/usr/share/clc/spirv64-mesa3d-.spv
+endef
+LIBCLC_POST_INSTALL_STAGING_HOOKS += LIBCLC_LINK_STAGING_SPV
+
+define LIBCLC_LINK_TARGET_SPV
+	ln -sf spirv64-unknown-unknown/libclc.spv $(TARGET_DIR)/usr/share/clc/spirv64-mesa3d-.spv
+endef
+LIBCLC_POST_INSTALL_TARGET_HOOKS += LIBCLC_LINK_TARGET_SPV
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
