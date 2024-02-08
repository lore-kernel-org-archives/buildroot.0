Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB05C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 09:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B26840012;
	Thu,  8 Feb 2024 09:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2N6kWLexkbT; Thu,  8 Feb 2024 09:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19FCA40477
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19FCA40477;
	Thu,  8 Feb 2024 09:38:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DF041BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B9A884EE4
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBfxz2tCNtid for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 09:38:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B6D28448D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B6D28448D
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B6D28448D
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 09:38:35 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d0cd9871b3so6282301fa.1
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 01:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707385113; x=1707989913;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GlztSVVMGm8NmyrmcWgwLBE2NMkJivNTUTGjTyo0eU0=;
 b=YcZnT09DcPnzxNJpiOfXoOkVxyAO5iAZasepiUhpgztN983JzEqCy33JK3LYbmw43C
 nMXh2b07HF0GsAugYh0ndHeuH4Ez6my7JsT5O7j+c7FKnMUz0pCRNorSip3ZJ2GRtQqL
 ePyZfzz2xvDJndAsKz7jX5pQeK/7reBexBYFrR2UxsheDAaqsldqoXQSsOY1cHYkb/xx
 Y7m60dri1dwPklJUs4N2R6I5nIkfpHlBFrWWK7B+bLoUWdsJK5zf8DLINlWAb9eHY+0V
 wQwfRrh76fHRxqLusilx0bS/uyyIw9zUHMUxWSxy/d0KPmF64/t9HowbEioG7qGnp6A8
 smJA==
X-Gm-Message-State: AOJu0Yy9z7CZXZ2dq5C4rfwtgPleJiNlHr24yI+G9IMCJMNGLk27EuoQ
 NLNvTBP/eyLrtlLRnE2S2XunKZKJ5qympSEgA3rgoaLXoSQhuXQrH4QZlwqJ5Co=
X-Google-Smtp-Source: AGHT+IEK7NeJ/IwuegREmQSKhqrcgq9ugbNSLtZcG9JF5gcfHWCCHtA8pUZeWCgazKLUWk2pbS6WLg==
X-Received: by 2002:a2e:8786:0:b0:2d0:7e5b:31d2 with SMTP id
 n6-20020a2e8786000000b002d07e5b31d2mr605620lji.4.1707385112706; 
 Thu, 08 Feb 2024 01:38:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXByB5QRNtOqSaSVq4oAt/zW/fSA5r5wasEK+1wjjoqPgrpN4pt5AA2HyjHSE7GbS9fEmHOwbEU5JurwCmP+h4EhWAk7zW25VN/R8WI+AFbLB7yw2Xzyium7bgyfD2PBbEVjat5rJvBFSD4JuKq5MWUtvSX1krBNr4tLTI5OptmBwMOyRUUKrW0YkG3j0qWMmtzqllYcGs=
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a2e9650000000b002d0c14e4f94sm431828ljh.74.2024.02.08.01.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 01:38:32 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 10:38:12 +0100
Message-ID: <20240208093813.2395828-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707385113; x=1707989913; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GlztSVVMGm8NmyrmcWgwLBE2NMkJivNTUTGjTyo0eU0=;
 b=QOrpuwvcfLoNCFwNpDYfNHcot6e2vRGhrki1HB60yvyUClqahB9sCubCC+pW17ab1b
 7A/rCFq5jSiuhxOd9AMwS7L/IxRc+jgsC3f0/7EHlSsmsG2jqx2zPYjkr7gIYdmGDNch
 TNFbqq797HJhxkImmzkbVOpLMoxsuDQIblfgfYgQWwcCJZTyk9ZXfhU0ndH37ww98uO/
 NIxC0ko+Bsa3VVVYLr1IKVPO1iciLkcwzSFTmba7Vqmxey9u7LUYgeMcgBPSOGuIMXE1
 XhYPGy7pzehJPzVabkN/qWF9IxI1EwUO4ajX3TxHf6AtqY47Ew2FLS+HWoGiAVjDv5eh
 XQjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QOrpuwvc
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
