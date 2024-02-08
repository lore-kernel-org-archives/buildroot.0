Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48AAC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 09:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56A2941A68;
	Thu,  8 Feb 2024 09:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3j1xDM6n4-Sh; Thu,  8 Feb 2024 09:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16E50403B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16E50403B9;
	Thu,  8 Feb 2024 09:56:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2F071BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C027484DA2
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wP0KxUeCnl7b for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 09:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E21084D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E21084D91
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E21084D91
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 09:56:29 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51142b5b76dso2654052e87.2
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 01:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707386187; x=1707990987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GlztSVVMGm8NmyrmcWgwLBE2NMkJivNTUTGjTyo0eU0=;
 b=GDuyb5zu9Hkt9RiaJ8mBdyYLhuXCYi5QLe1/dg4Z+Ix206pXzFOYJIh2YC1t3oFONc
 Mdx+haY+FpNXH7AXNmQqcWojupHwFQeR4Yk6u3bErh5roO3kddbZ7bPdgrKMzqWDf9xC
 NqFlHRk/qJalHZaN+juuRomyskDUjvmb+QUf/vvxr2y45rarg8W1iT/JkEQW+/LDi+nu
 tII/w6eVoIxJZ+dOzfVV3um6m1KOTeEaxhuU1sN+5jt1esNazYriEX/a8zodDK3npgMP
 FATKxaRRZz4/rdHAZ+zTwXyWQnPM1g//BQ1pJLJ2oa1dUNqohwXfsZSDhzbPY1h/wBut
 RAmQ==
X-Gm-Message-State: AOJu0Yx0V6qWXyEuNsdiWg2co+x/bAqIknImnjVLSTkyGaIeQUW9Yfvt
 Ahc58lx8sUPHfBCr+5WKX+AKQomOOqb/ctLXhi1ruztsoDgUnabc8EYY7zF/abo=
X-Google-Smtp-Source: AGHT+IGjAUJGEwm2Eyl2ziKD3BDnFNMK4h3FVW1bipdw1hkSySv4UMo6rPEnj3J99Gqjb99zJ2lx3Q==
X-Received: by 2002:a05:6512:b84:b0:511:4975:30b1 with SMTP id
 b4-20020a0565120b8400b00511497530b1mr6963517lfv.0.1707386187202; 
 Thu, 08 Feb 2024 01:56:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9OEdlxnDcBrN9l3rcrkCIjr8z88wfpiKWjKKyctxc0oNzZtdMhaokKNGvQPbuEcKSVqWD8JA8yqy9rOuuxX1xHibaj4BK/jREjbJ23lJQG8RMRdLuDcg7/78P4VVEG7MeKbIWxAeeqn2HcP1Sim+XRx7xAqOOU1Zz2GVeXkYo6HwMwWsp1UxijX4Ys583qA1s0nA9J9o=
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a056512369700b005115edd71c9sm491275lfs.165.2024.02.08.01.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 01:56:26 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 10:56:14 +0100
Message-ID: <20240208095615.2397148-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707386187; x=1707990987; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GlztSVVMGm8NmyrmcWgwLBE2NMkJivNTUTGjTyo0eU0=;
 b=g5DTz+X/PLRdge7TCSH+xy/uv9JBDIiqcTrjsmf+8rMJjbT9vZG3VwTDTZh02/w2nP
 AB8Ac3TXzMoVSSK8Pu8lQu/hfa782nFVD9FXMxFGqVBVsXS42UPrgNAmU6CopGDN8zu/
 diqqmPcgb78p8+C0BHva/n363j6fsbaQsFIuPhhS7Bdi84OdBVWkAtJ5UxAOXfLph/EO
 Q4G99J85Nkz1VKXzm/ryfEJHt+TrkT4CvOL6oeyRtQMD2ESb7qBhkz9w1+zl9A/uBRNI
 bAmzhajhPar6E2mSrXguP3imM8T6vWDRsTqrW7bhcVbt4aM+S5v5ZDv1EJlpQT/SdG9X
 pjXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g5DTz+X/
Subject: [Buildroot] [PATCH] package/python3: fix install
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following failure in the install step of host-python3:
    ...
    /usr/bin/install -c -m 644 pyconfig.h output/host/include/python3.12/pyconfig.h
    [ERROR] _tkinter failed to import: output/build/host-python3-3.12.1/build/lib.linux-x86_64-3.12/_tkinter.cpython-312-x86_64-linux-gnu.so: undefined symbol: Tcl_AddErrorInfo
    The following modules are *disabled* in configure script:
    _ctypes_test          _testbuffer           _testcapi
    _testclinic           _testimportmultiple   _testinternalcapi
    _testmultiphase       _xxtestfuzz           xxsubtype

    Following modules built successfully but were removed because they could not be imported:
    _tkinter

    Checked 110 modules (31 built-in, 54 shared, 15 n/a on linux-x86_64, 9 disabled, 0 missing, 1 failed on import)
    ...
    /usr/bin/install -c -m 644 ./Lib/types.py output/host/lib/python3.12
    /usr/bin/install: cannot stat 'Modules/_tkinter.cpython-312-x86_64-linux-gnu.so': No such file or directory
    /usr/bin/install -c -m 644 ./Lib/typing.py output/host/lib/python3.12
    make[3]: *** [Makefile:2068: sharedinstall] Error 1
    ...

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
Changes v1 -> v2:
  Make the --disable-tk option automatically set py_cv_module__tkinter=n/a (suggested by Thomas Petazzoni)
---
 .../python3/0012-Add-an-option-to-disable-the-tk-module.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python3/0012-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0012-Add-an-option-to-disable-the-tk-module.patch
index 7fafbedddb..08617241a6 100644
--- a/package/python3/0012-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0012-Add-an-option-to-disable-the-tk-module.patch
@@ -62,7 +62,7 @@ diff --git a/configure.ac b/configure.ac
 index c8ae60aa6b5..7caa361138d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4503,6 +4503,11 @@ AC_ARG_ENABLE(pydoc,
+@@ -4503,6 +4503,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -70,6 +70,8 @@ index c8ae60aa6b5..7caa361138d 100644
 +AC_ARG_ENABLE(tk,
 +	AS_HELP_STRING([--disable-tk], [disable tk]),
 +	[ TK="${enableval}" ], [ TK=yes ])
++AS_IF([test "$TK" = "no"],
++	[PY_STDLIB_MOD_SET_NA([_tkinter])])
 +
  # Check for enable-ipv6
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
