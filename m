Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7284FC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 21:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A064035B;
	Tue,  4 Jun 2024 21:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUUV6ievUuCx; Tue,  4 Jun 2024 21:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E2140136
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E2140136;
	Tue,  4 Jun 2024 21:49:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62A4B1BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1459606FF
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 21:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZB_xAfivw59 for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 21:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA86F60664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA86F60664
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA86F60664
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 21:49:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EF19313F8C0;
 Tue,  4 Jun 2024 23:49:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 23:49:16 +0200
Date: Tue, 4 Jun 2024 23:49:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <Zl-L3DSNbK7ncrHz@landeda>
References: <20240602031427.16506-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240602031427.16506-1-vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717537762;
 bh=0M3wPFCrJ+45ttJNfAeNQr5s3Oht/kR+M9yQ1ECag34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dB0izUxLT9e2zeF+2mDT6bxoJp/YRwiua79j4jFJ8Zk31FBxTLKqcK8pBm45YA6JV
 EKElAw8OysrLWQEmXDegYaK+RMRqJEZYPDvl9/Sxgc+RhhG4f4zE2WW2bhxfAhuxuE
 IUTnktX6jeeiXl3nhpBHvZNSkKsSTeTrKg+Zryzlmr+LPhgVb+ZfN/f/AYkTxfA3P9
 j8qRCJfsT24cggTbi4PxyivSV+f8IQd1jkSihTXd+ApQhWEjJ0HLiGEVVa8Y9QF5am
 rH/qDyXPcFt+/8j5jk7kCuXG0EE4go+p513FKzoF8V/g6TFQrAHmOArrqf/5e9w6N8
 fj+quvkyvWOSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dB0izUxL
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: miscellaneous fixups
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2024-06-01 22:14 -0500, Vincent Fazio spake thusly:
> There is no longer a need to lie about having mercurial installed as of
> upstream 5c4b0d063a, so drop the ac_cv_prog_HAS_HG override.
> 
> `PYTHON3_REMOVE_USELESS_FILES`, while not exactly useless, had been
> referencing stale files and not performing full cleanup:
> 
>   * the "m" ABI suffix was dropped in upstream 6c44fde3e0
>   * the smtpd was dropped in upstream a797fba888
>   * the wininst* binaries were dropped in upstream 0e2a0f72cc

For each, I've added the python version they first appeared in.

> These legacy references have now been dropped.
> 
> The smtpd.py file is a bit quirky because despite having been removed
> upstream, Buildroot's patches to disable certain modules have been
> carrying it forward. This has been rectified.
> 
> While here, rework the file removals to accomodate the ABI suffix change
> and to globally remove __pycache__ directories. It's important to note
> that Buildroot uses legacy pyc placements for sourceless distributions,
> meaning __pycache__ is not used at all [0].
> 
> When necessary, optimized pyc files will be generated into the correct
> paths in subsequent hooks.
> 
> [0]: https://peps.python.org/pep-3147/#case-4-legacy-pyc-files-and-source-less-imports
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0008-Add-an-option-to-disable-pydoc.patch | 16 ++++++-----
>  ...009-Add-an-option-to-disable-lib2to3.patch | 27 ++++++++++---------
>  .../0017-Add-an-option-to-disable-IDLE.patch  | 26 +++++++++---------
>  package/python3/python3.mk                    | 23 +++++-----------
>  4 files changed, 43 insertions(+), 49 deletions(-)
> 
> diff --git a/package/python3/0008-Add-an-option-to-disable-pydoc.patch b/package/python3/0008-Add-an-option-to-disable-pydoc.patch
> index 3c678bef1c..ffb6a7796f 100644
> --- a/package/python3/0008-Add-an-option-to-disable-pydoc.patch
> +++ b/package/python3/0008-Add-an-option-to-disable-pydoc.patch
> @@ -1,4 +1,4 @@
> -From 77fcd90a1236d59d40aa32d3bc4bef4303eb4066 Mon Sep 17 00:00:00 2001
> +From e6284624679a525440dc4bfddc1347f8add22fd8 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 22 Feb 2017 17:07:56 -0800
>  Subject: [PATCH] Add an option to disable pydoc
> @@ -12,6 +12,8 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>  Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>  [ Adam Duskett: ported to Python 3.10.0 ]
>  Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +[ Vincent Fazio: fix scripts array to reflect upstream ]
> +Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>  ---
>   Makefile.pre.in | 7 ++++++-
>   configure.ac    | 6 ++++++
> @@ -19,7 +21,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>   3 files changed, 19 insertions(+), 3 deletions(-)
>  
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 5a40b7c5484..e87bc1fcd32 100644
> +index 5a40b7c548..e87bc1fcd3 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
>  @@ -1877,7 +1877,9 @@ bininstall: commoninstall altbininstall
> @@ -52,7 +54,7 @@ index 5a40b7c5484..e87bc1fcd32 100644
>   libinstall:	all $(srcdir)/Modules/xxmodule.c
>   	@for i in $(SCRIPTDIR) $(LIBDEST); \
>  diff --git a/configure.ac b/configure.ac
> -index b4d7d2cca6a..d56d8f9d1c5 100644
> +index b4d7d2cca6..d56d8f9d1c 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -4222,6 +4222,12 @@ AS_VAR_IF([posix_threads], [stub], [
> @@ -69,7 +71,7 @@ index b4d7d2cca6a..d56d8f9d1c5 100644
>   AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
>   AC_MSG_CHECKING([if --enable-ipv6 is specified])
>  diff --git a/setup.py b/setup.py
> -index 53b066cb18b..d8647724650 100644
> +index 53b066cb18..25e6f4fc26 100644
>  --- a/setup.py
>  +++ b/setup.py
>  @@ -1597,6 +1597,12 @@ class DummyProcess:
> @@ -77,8 +79,8 @@ index 53b066cb18b..d8647724650 100644
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>  +
> -+    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3',
> -+               'Lib/smtpd.py']
> ++    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3']
> ++
>  +    if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
>  +        scripts += [ 'Tools/scripts/pydoc3' ]
>  +
> @@ -96,5 +98,5 @@ index 53b066cb18b..d8647724650 100644
>   
>   # --install-platlib
>  -- 
> -2.44.0
> +2.34.1
>  
> diff --git a/package/python3/0009-Add-an-option-to-disable-lib2to3.patch b/package/python3/0009-Add-an-option-to-disable-lib2to3.patch
> index 13cb273bf8..06f38e92b3 100644
> --- a/package/python3/0009-Add-an-option-to-disable-lib2to3.patch
> +++ b/package/python3/0009-Add-an-option-to-disable-lib2to3.patch
> @@ -1,4 +1,4 @@
> -From 18e19402fab3939223a58481734e685d25c3102b Mon Sep 17 00:00:00 2001
> +From 3fbd10c59a777c4ef7ee1bd3fb70808e25e11703 Mon Sep 17 00:00:00 2001
>  From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Date: Wed, 22 Feb 2017 17:15:31 -0800
>  Subject: [PATCH] Add an option to disable lib2to3
> @@ -14,14 +14,16 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>  Signed-off-by: Adam Duskett <aduskett@gmail.com>
>  [ Bernd Kuhls: ported to Python 3.11.4]
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[ Vincent Fazio: fix scripts array to reflect upstream ]
> +Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>  ---
>   Makefile.pre.in | 17 ++++++++++++-----
>   configure.ac    |  6 ++++++
> - setup.py        |  6 +++---
> - 3 files changed, 21 insertions(+), 8 deletions(-)
> + setup.py        |  4 +++-
> + 3 files changed, 21 insertions(+), 6 deletions(-)
>  
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index e87bc1fcd32..1a0ab0de426 100644
> +index e87bc1fcd3..1a0ab0de42 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
>  @@ -1881,7 +1881,9 @@ ifeq (@PYDOC@,yes)
> @@ -82,7 +84,7 @@ index e87bc1fcd32..1a0ab0de426 100644
>   # bpo-21536: Misc/python-config.sh is generated in the build directory
>   # from $(srcdir)Misc/python-config.sh.in.
>  diff --git a/configure.ac b/configure.ac
> -index d56d8f9d1c5..bf91fb2f824 100644
> +index d56d8f9d1c..bf91fb2f82 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -7147,6 +7147,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
> @@ -99,24 +101,23 @@ index d56d8f9d1c5..bf91fb2f824 100644
>   AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
>   AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
>  diff --git a/setup.py b/setup.py
> -index d8647724650..e02591dae10 100644
> +index 25e6f4fc26..78d880f9db 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1598,11 +1598,11 @@ class DummyProcess:
> +@@ -1598,10 +1598,12 @@ class DummyProcess:
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>   
> --    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3',
> --               'Lib/smtpd.py']
> -+    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
> +-    scripts = ['Tools/scripts/idle3', 'Tools/scripts/2to3']
> ++    scripts = ['Tools/scripts/idle3']
> + 
>       if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
>           scripts += [ 'Tools/scripts/pydoc3' ]
> --
>  +    if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
>  +        scripts += [ 'Tools/scripts/2to3' ]
> + 
>       setup(# PyPI Metadata (PEP 301)
>             name = "Python",
> -           version = sys.version.split()[0],
>  -- 
> -2.44.0
> +2.34.1
>  
> diff --git a/package/python3/0017-Add-an-option-to-disable-IDLE.patch b/package/python3/0017-Add-an-option-to-disable-IDLE.patch
> index f0af3f53f4..fe44ef0d05 100644
> --- a/package/python3/0017-Add-an-option-to-disable-IDLE.patch
> +++ b/package/python3/0017-Add-an-option-to-disable-IDLE.patch
> @@ -1,4 +1,4 @@
> -From f74c580b9e5bd8c710627b48cea4e152426e71e6 Mon Sep 17 00:00:00 2001
> +From dd4ac2662ae1feaa3a29c4088193e48645b080f7 Mon Sep 17 00:00:00 2001
>  From: Maxime Ripard <maxime.ripard@free-electrons.com>
>  Date: Wed, 22 Feb 2017 17:45:14 -0800
>  Subject: [PATCH] Add an option to disable IDLE
> @@ -11,14 +11,16 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>  Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>  [ Adam Duskett: ported to Python 3.10.0 ]
>  Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +[ Vincent Fazio: fixup setup array to reflect upstream ]
> +Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>  ---
>   Makefile.pre.in | 7 ++++++-
>   configure.ac    | 6 ++++++
> - setup.py        | 5 ++++-
> - 3 files changed, 16 insertions(+), 2 deletions(-)
> + setup.py        | 4 +++-
> + 3 files changed, 15 insertions(+), 2 deletions(-)
>  
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 8e5f6762d20..4e407cbcfa9 100644
> +index 8e5f6762d2..4e407cbcfa 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
>  @@ -1875,7 +1875,9 @@ bininstall: commoninstall altbininstall
> @@ -51,7 +53,7 @@ index 8e5f6762d20..4e407cbcfa9 100644
>   libinstall:	all $(srcdir)/Modules/xxmodule.c
>   	@for i in $(SCRIPTDIR) $(LIBDEST); \
>  diff --git a/configure.ac b/configure.ac
> -index cb7e980e5b5..fe497ec9dfb 100644
> +index cb7e980e5b..fe497ec9df 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -7206,6 +7206,12 @@ AC_ARG_ENABLE(lib2to3,
> @@ -68,25 +70,25 @@ index cb7e980e5b5..fe497ec9dfb 100644
>   AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
>   AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
>  diff --git a/setup.py b/setup.py
> -index e02591dae10..ada914c5501 100644
> +index 78d880f9db..ca05faec97 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1598,11 +1598,14 @@ class DummyProcess:
> +@@ -1598,12 +1598,14 @@ class DummyProcess:
>       import warnings
>       warnings.filterwarnings("ignore",category=DeprecationWarning)
>   
> --    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
> -+    scripts = [ 'Lib/smtpd.py']
> +-    scripts = ['Tools/scripts/idle3']
> ++    scripts = []
> + 
>       if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
>           scripts += [ 'Tools/scripts/pydoc3' ]
>       if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
>           scripts += [ 'Tools/scripts/2to3' ]
>  +    if not '--disable-idle3' in sysconfig.get_config_var("CONFIG_ARGS"):
>  +        scripts += [ 'Tools/scripts/idle3' ]
> -+
> + 
>       setup(# PyPI Metadata (PEP 301)
>             name = "Python",
> -           version = sys.version.split()[0],
>  -- 
> -2.44.0
> +2.34.1
>  
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 5d9d77af50..6859fc2274 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -36,8 +36,7 @@ HOST_PYTHON3_CONF_OPTS += \
>  # Make python believe we don't have 'hg', so that it doesn't try to
>  # communicate over the network during the build.
>  HOST_PYTHON3_CONF_ENV += \
> -	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
> -	ac_cv_prog_HAS_HG=/bin/false
> +	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
>  
>  PYTHON3_DEPENDENCIES = host-python3 libffi
>  
> @@ -156,14 +155,11 @@ else
>  PYTHON3_CONF_OPTS += --disable-ossaudiodev
>  endif
>  
> -# Make python believe we don't have 'hg', so that it doesn't try to
> -# communicate over the network during the build.
>  PYTHON3_CONF_ENV += \
>  	ac_cv_have_long_long_format=yes \
>  	ac_cv_file__dev_ptmx=yes \
>  	ac_cv_file__dev_ptc=yes \
> -	ac_cv_working_tzset=yes \
> -	ac_cv_prog_HAS_HG=/bin/false
> +	ac_cv_working_tzset=yes
>  
>  # GCC is always compliant with IEEE754
>  ifeq ($(BR2_ENDIAN),"LITTLE")
> @@ -200,18 +196,11 @@ PYTHON3_CONF_OPTS += \
>  #
>  define PYTHON3_REMOVE_USELESS_FILES
>  	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
> -	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)m-config
>  	rm -f $(TARGET_DIR)/usr/bin/python3-config
> -	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
> -	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/distutils/command/wininst*.exe
> -	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m-*/ \
> -		-type f -not -name Makefile` ; do \
> -		rm -f $$i ; \
> -	done
> -	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/__pycache__/
> -	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/lib-dynload/sysconfigdata/__pycache__
> -	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/collections/__pycache__
> -	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/importlib/__pycache__
> +	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)-*/ \
> +		-type f -not -name Makefile -exec rm -rf {} \;
> +	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/ -type d \
> +		-name __pycache__ -exec rm -rf {} \;
>  endef
>  
>  PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_USELESS_FILES
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
