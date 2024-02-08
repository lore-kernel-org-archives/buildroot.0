Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B006C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 09:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B925941A68;
	Thu,  8 Feb 2024 09:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMhphxuSgNho; Thu,  8 Feb 2024 09:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C46D41B6C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C46D41B6C;
	Thu,  8 Feb 2024 09:41:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A02341BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CF0742E1A
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNXxPCxP2hb1 for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 09:41:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B81642DFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B81642DFD
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B81642DFD
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 09:41:48 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51142b5b76dso2638341e87.2
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 01:41:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707385306; x=1707990106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GlztSVVMGm8NmyrmcWgwLBE2NMkJivNTUTGjTyo0eU0=;
 b=QxBoBL2KE7Lj/X5radppN/n2rp29xeZKW8QxdK4txiXAzI1JvZh46KbWrJTiqwKA7c
 5o6Y5JZl+JIPpnmv9AvA4mMBUnaiLYU4XTCjrA5DrCQpcfZc88DAtsY9I2KpW4wrS/fS
 3CFs5TsQuSDeGN2A1oNHCNcV6XImzkj8vEyvSGgqgA917mPUZ6LWxnKDVLrsGJ67atZO
 XYmYulVS7ngV6WkeRxVTMTt9420Vg88fGfDoxZUXeMQiy9VV/ozqd0E7mOeZdkp6NXsu
 NAu5C9wtHUmMceYaqDGH+LMTWDxjA+nYkAReMg9q86xc9HuqJFYBeQPWtjnr51idpkcO
 vWhg==
X-Gm-Message-State: AOJu0YzZGFZi3jHEKb0DmJ9I09boQOY98l8cUWP2AbXtTVvpUExYMwvM
 6R5UavqM+zO8DZZjRrly5ZLGcTVNo8jgbfXVYq98AdLHZO9u5gmLNJ4FD+DtDWI=
X-Google-Smtp-Source: AGHT+IHmNw/eZ5Q5+tgezxXbGgW3AI6pAxjSOuF/Tng3THbav5WZTKdmfsBcTwgPD1IdlEgCqiWxdA==
X-Received: by 2002:ac2:554e:0:b0:511:4db5:99f1 with SMTP id
 l14-20020ac2554e000000b005114db599f1mr6378943lfk.47.1707385305973; 
 Thu, 08 Feb 2024 01:41:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHt46TelibiKtleNv6V2FoWa//CloMbLMaxC/jxFdeT/2GzfO0UGpvqGce67F7HRQhOWSkcCORijXvBY+4gjmJn/FCREw5O2ti65l9+HMTvGKkQe1gwEYK9Pz7+Jv9HzobUQ5T/WhQvigeHJSefXOc8U0DGx1iP824dIVqeTIpKhAwm/XjCA52JVNxiPn9GZ83UEFhcDI=
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a0565123c9800b00511619cd1c3sm491369lfv.10.2024.02.08.01.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 01:41:45 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 10:41:36 +0100
Message-ID: <20240208094137.2396094-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707385306; x=1707990106; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GlztSVVMGm8NmyrmcWgwLBE2NMkJivNTUTGjTyo0eU0=;
 b=EqLD/7QhreHfSJR0OuF18/JJcMo/KHtK5q69OlP7VRaqIke754+5CirgS+MdzXMOWX
 qcldTFq3Gj1dXE7Zn2JslZtW44C5A8r931lh77u6mUG0y9EyipwTEy/mKLduTxyI9KDE
 YOaH74w9IKzQQP5SrQ9gsfT+0ZMvULo1EEtVavYA0mqfnj1MWQxSJuJ9UHecLujhYbWn
 /pt22KsuIihuFenSxcg4Iya0V4r9q/zIjY5SpOBAtPa/cF7yDEp3h24Npl4XPk4L9zjW
 oL535o1+dSV6aFPhM5+E2PjyGONQ0Nc2+sr4Wz0t5G5oY7NvJjFFjW0mD7JMWX0is8ZG
 EDUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EqLD/7Qh
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
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
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
