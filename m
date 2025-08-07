Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C54C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D09D40565;
	Thu,  7 Aug 2025 18:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejFB1sHLNieJ; Thu,  7 Aug 2025 18:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C014056E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C014056E;
	Thu,  7 Aug 2025 18:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6089C4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 452A5605F1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HD7fEi_ztz4 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55FC060642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55FC060642
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55FC060642
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:10 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-454f428038eso11232235e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591048; x=1755195848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4kB0CyRUzZTj29+GbEKxDhjOaIDOj56tYKB4cO1gIHo=;
 b=oi+X5F5I29FAQBn1liKlqj0CVsU8YkqfmBpV2qWLbQBn5CDYpwU1J9u9RF/cdbgpuL
 g/SzbfCyVItJ0DpIa2+zwSiKUPhdUoeFSpoQh4As5iki+tpswRQx4vnYFQcgc5meWpCG
 7kwQWL+TEMENRsuTxKI4UPx/EDAlno9tQ+7TdzR/VTKogurYXar2mzmzUqSroA0HEuR6
 sertL5uyKVWKACsEpb2TvXsoTh5DEbVVCzlWkmPFpb/68M34EkFPUs4TEWA4mWdgDEH6
 VeE6qFUuaKmUL2KXsK69nL+E8poeaXj/J4PUp6AwlJLJJQ/0a8FiNun58T2KjA2dbCNO
 FT1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9+dtv8nexmWPkfDa+vT4fFQkZitPg1aLo+ZkB04a/H9uIQvDGDSo6wFqLdgP2XcgNzTCi5k7UiIs=@buildroot.org
X-Gm-Message-State: AOJu0Yw40TCIBzMlSMQVfQ+D7oSvtFt4HwB6cq0tpGNSX4Rwi+XgiLh/
 cGO1iHIKnc0OcSM8qUmTFkpwSBDlYVOF5lb3lwFXkdQblihofA/MzbYyyKCBKm11NnU=
X-Gm-Gg: ASbGncsjML0EZndh5XW79G0zW+JDxXmssKQKvO1Ur5u8TUMwd8qgJc3q8OBRcrQqugA
 hWDCNujARItADN6mrXdJ1BEeRc20bWNR9y3n1dUbqIFVAlmMPeq+BiDVntW167RcsUYad3XQu2m
 sPnhKbVsbfWYIuZH2MCVKcbw3N+43hm8EMFD/DD0RpynRf3s1sRNGvP5YwntFdXVvZBYkHMCTDk
 xZNA2Asstk38jz4DwG10C8y/8TbiB1IKX42rh6rX8zlLDFZ/XlqrEK4Er71KCAkIAbWlKq/d34j
 Q8lnf7ut8DjwKoKafeFxGcUvIF0zXrV+zMan5r6+h7IDcEXkgDWi+oO7XDbRWDKuiVA/szjoOxN
 ze3FiIUBVjErssg==
X-Google-Smtp-Source: AGHT+IEJEDa9K1D1HNevxXJI5Q2rnXs915P7xQYgEvNMhgakRt4o9xZcBivSdr6Q10TnfbThb9oHTQ==
X-Received: by 2002:a05:600c:46d1:b0:458:a7fa:2120 with SMTP id
 5b1f17b1804b1-459e70e6ee7mr73265015e9.25.1754591048400; 
 Thu, 07 Aug 2025 11:24:08 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459de0d4cf1sm164773275e9.13.2025.08.07.11.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:08 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:07 +0200
Message-ID: <20250807182407.724546-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715223723.745122-1-james.hilliard1@gmail.com>
References: <20250715223723.745122-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591048; x=1755195848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4kB0CyRUzZTj29+GbEKxDhjOaIDOj56tYKB4cO1gIHo=;
 b=SgIKESKQCaYTI0ZukibOk3Nmg4wrnZgoRFR1COpaGeJSVyUc6VpZf3I195IvojWm4L
 5mkScSxXgnnp1lQv57PX9HVfqjpBzlCj1vXLbSEajm04SWgcpJCd6UFBDVpPTghN59qC
 ugGOkm84jwVcxG5wlXnBT6HGa7dkiPxPtUIAm6AtNr+7iWMR+Dtygs/uG69p2lUaPD8y
 VSPcYK9NrKPOm3h0h4hnbW7QyPOZ5kUOUglELv4RzvoeXeRZxEb5QV9FFkJE6Y2HpoPk
 ihkFqowujutHnKIc+v9Lwxu9CVdq314AxgC0SxQHti72lw9IpsDbY7Ry7/7moUKlgWks
 eTqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SgIKESKQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 80.9.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Rebase add executable patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../python-setuptools/0001-add-executable.patch  | 16 ++++++++--------
>  package/python-setuptools/python-setuptools.hash |  4 ++--
>  package/python-setuptools/python-setuptools.mk   |  4 ++--
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
> index 9e12c4b628..aaef27ed75 100644
> --- a/package/python-setuptools/0001-add-executable.patch
> +++ b/package/python-setuptools/0001-add-executable.patch
> @@ -1,4 +1,4 @@
> -From 995cf87c0dfc420908847a06661cbae21d16a8f6 Mon Sep 17 00:00:00 2001
> +From 6fe6747c7d7509cc1af9667e1dae610657e5ccdf Mon Sep 17 00:00:00 2001
>  From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
>  Date: Mon, 7 Dec 2015 01:14:33 +0100
>  Subject: [PATCH] add executable
> @@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>   2 files changed, 11 insertions(+)
>  
>  diff --git a/setuptools/command/install.py b/setuptools/command/install.py
> -index 741b140c7..5a281237a 100644
> +index 19ca60145..c4bb536b9 100644
>  --- a/setuptools/command/install.py
>  +++ b/setuptools/command/install.py
> -@@ -39,6 +39,7 @@ class install(orig.install):
> +@@ -35,6 +35,7 @@ class install(orig.install):
>       distribution: Distribution  # override distutils.dist.Distribution with setuptools.dist.Distribution
>   
>       user_options = orig.install.user_options + [
> @@ -33,7 +33,7 @@ index 741b140c7..5a281237a 100644
>           ('old-and-unmanageable', None, "Try not to use this!"),
>           (
>               'single-version-externally-managed',
> -@@ -73,6 +74,7 @@ class install(orig.install):
> +@@ -67,6 +68,7 @@ class install(orig.install):
>           )
>   
>           super().initialize_options()
> @@ -42,7 +42,7 @@ index 741b140c7..5a281237a 100644
>           self.single_version_externally_managed = None
>   
>  diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
> -index 4401cf693..38f5d5092 100644
> +index 537181e32..6893e6a8c 100644
>  --- a/setuptools/command/install_scripts.py
>  +++ b/setuptools/command/install_scripts.py
>  @@ -18,6 +18,13 @@ class install_scripts(orig.install_scripts):
> @@ -59,13 +59,13 @@ index 4401cf693..38f5d5092 100644
>   
>       def run(self) -> None:
>           self.run_command("egg_info")
> -@@ -45,6 +52,8 @@ class install_scripts(orig.install_scripts):
> -         )
> +@@ -39,6 +46,8 @@ class install_scripts(orig.install_scripts):
> +         dist = metadata.Distribution.at(path=ei_cmd.egg_info)
>           bs_cmd = self.get_finalized_command('build_scripts')
>           exec_param = getattr(bs_cmd, 'executable', None)
>  +        if self.executable is not None:
>  +            exec_param = self.executable
> -         writer = ei.ScriptWriter
> +         writer = _scripts.ScriptWriter
>           if exec_param == sys.executable:
>               # In case the path to the Python executable contains a space, wrap
>  -- 
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
> index b5bac10fe2..d0ed270e9c 100644
> --- a/package/python-setuptools/python-setuptools.hash
> +++ b/package/python-setuptools/python-setuptools.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/setuptools/json
> -md5  652d999eca1412525c01e4c5b6e2275b  setuptools-79.0.1.tar.gz
> -sha256  128ce7b8f33c3079fd1b067ecbb4051a66e8526e7b65f6cec075dfc650ddfa88  setuptools-79.0.1.tar.gz
> +md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
> +sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
> diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
> index 1ee5448100..e013000c57 100644
> --- a/package/python-setuptools/python-setuptools.mk
> +++ b/package/python-setuptools/python-setuptools.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_SETUPTOOLS_VERSION = 79.0.1
> +PYTHON_SETUPTOOLS_VERSION = 80.9.0
>  PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/bb/71/b6365e6325b3290e14957b2c3a804a529968c77a049b2ed40c095f749707
> +PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
>  PYTHON_SETUPTOOLS_LICENSE = MIT
>  PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
>  PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
