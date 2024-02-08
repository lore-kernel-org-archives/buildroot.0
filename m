Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11CCC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 10:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FFD441C4E;
	Thu,  8 Feb 2024 10:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99Kvq0c2YePF; Thu,  8 Feb 2024 10:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4492E41B98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4492E41B98;
	Thu,  8 Feb 2024 10:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6DF1BF2A1
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 10:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BB8361B1D
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 10:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPLHd3nkT8QS for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 10:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1344C615F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1344C615F2
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1344C615F2
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 10:51:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-511612e0c57so2814416e87.2
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 02:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707389511; x=1707994311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GlztSVVMGm8NmyrmcWgwLBE2NMkJivNTUTGjTyo0eU0=;
 b=l0bLYXxAZeW0v64xjaY3tr+mAcK/dD4bIMBxpOMx6s1y/Twnahlm61EUuXDOTVmKPu
 +LzShnQgerQLjmXqg4y8RKO+hrKSJcS3P9vWtU2JyrTh8Fw4oQvq0eh3YrPL8HuBGfZe
 JlI0JVVfbPj/6veFm8OAX4EfeRMC91daIc8SgVWr7ZJuHprm03PqDOtJ1KKFMP+pyOZE
 wEVtmVsH+IW2x63o3gopZ6GOqK4cXgfQ2FylSU9c5hSjswvM9aq2u5UN3czHkjvqP35M
 HO3AGXi7fZDgroeCjOQ1b/uOvGPNPey2ClAgls/JHNVEGOr2ImT0On0r/cBO3WdPC9j2
 p2Fw==
X-Gm-Message-State: AOJu0Ywsj43ICiOBLP8lKiR7pev99QOS8gmqf39PcXlesLyMtvy165un
 MmnVJ+AM8+WoIsFKFMSoZzk5WhU4gPirsQlesT3MNwvFpZMX/UA4H4mdctyPsIw=
X-Google-Smtp-Source: AGHT+IEjg0HkgxIYZKiTC+DZoipdAOR3QNkagZIxqCg7n+VH/xqeYYb4Nrlt1m/VblTsh7mvgPG0Lg==
X-Received: by 2002:a05:6512:480e:b0:511:3a70:b954 with SMTP id
 eo14-20020a056512480e00b005113a70b954mr5175373lfb.18.1707389510479; 
 Thu, 08 Feb 2024 02:51:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/SgOIdDAJPzbCL8ptjzsCshW7+pPC8bGV3v4+njNEImGOLyKliveAIH5vYlu6TYbu1TO59/yJdNxPSAYQtkTNBd/c7zPxCgZ0GRQOxS4mnCZh2oNWS6d3l/awjzGE+uYcnuhk3nGt+cgf3x5CVc8feS2fiIDrZv6cSedHwyHONrWlX8+B26I31ZG1WS5DnbgNjrMtywI=
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512114b00b005117231c058sm31932lfg.273.2024.02.08.02.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 02:51:49 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 11:50:34 +0100
Message-ID: <20240208105034.2401301-2-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208074901.1654224-1-roy.kollen.svendsen@akersolutions.com>
References: <20240208074901.1654224-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707389511; x=1707994311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GlztSVVMGm8NmyrmcWgwLBE2NMkJivNTUTGjTyo0eU0=;
 b=m5rVVf7HwVKpWRnE4NrD/BWBVPUJbe+5JEnPX2mh8FaWRihif1V5IwSrRrJC+VMuHY
 hW7xYyZwHXMedjQ8xnHKJQdMljQxzmC0PdSPd8kuX/sLwF6bpScADjuP4vsU0ldWJ+Ru
 WPBa2Wa+VBTYxLPtI/0Ji69brvEnBs6jtMichx157lhuKRp4l4nUBu4USsYH7PrgtvGE
 PZd/jxgnWYWRN7WWplQwZyqKCMB79LquQ1f+Sms67nvQy/BiQ9uxk46ZmKZBRvr8UT4y
 1Ugwfk2MMM36ebZ2vVZnhSrvTiyR021YJGCP8iHIV6uDUFhXcx7zfbgPYQUGQ/f+L/fR
 8urg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m5rVVf7H
Subject: [Buildroot] [PATCH v2] package/python3: fix install
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
