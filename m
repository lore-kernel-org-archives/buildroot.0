Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A57E7718D
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 17:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 669166083A;
	Sun, 22 Dec 2024 17:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbTjiX7pLutM; Sun, 22 Dec 2024 17:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B1A76087E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B1A76087E;
	Sun, 22 Dec 2024 17:10:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA64B5E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7D566087E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEez0sy_xe2c for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 17:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59BB26083A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59BB26083A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59BB26083A
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 17:10:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 214036012F;
 Sun, 22 Dec 2024 18:10:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40986])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Dec 2024 18:10:40 +0100
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 18:10:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20241222162615.1872897-1-thomas.petazzoni@bootlin.com>
References: <20241222162615.1872897-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9e230093e58ed8947245818dfa9e27f4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734887442;
 bh=Y4afW+5Pj/a9MXfcR0DiU1nQZwPsPmfNFBSCH7X3VjM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bANukxeFakfWGrUS/mOHf7h4R5KLCFjsiYW4BTNJL3x6xV6gYkeShNIVvCZ5a5jvz
 ZAxg8UplKQob9wAorxXXcqtosxdJ+7+1Zd+NVPOL4A4esyRVSBJQq2o4xfnSoxPxtM
 JTWli7c9oITEV1j8277CmA+pm2hNDRWXOVlHujkAUXJlWz6d62MM33ly6PKe63mLqh
 NZ4pE07ri2OblzSwd/PABOT5BTfcf9EkOEJlfdEoU575qQDcgFBlT/+ttZNoHRRUeD
 0ZFlx3oioaGAMs2eJM+aM0l51PLER01Y7Ab5sYY/6lnF1wc+gFgfjDyXVNgu21YEl4
 LQhUJtCWNBDxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bANukxeF
Subject: Re: [Buildroot] [PATCH] package/python-autocommand: add patch to
 fix build issue
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/12/2024 17:26, Thomas Petazzoni wrote:
> Since the python-autocommand package has been introduced in commit
> b6f3278539216f55fb18ff7e63ce2da39ed0c3e1 ("package/python-autocommand:
> new package"), it has consistently been failing to build with:
> 
> Traceback (most recent call last):
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", 
> line 353, in <module>
>     main()
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", 
> line 335, in main
>     json_out['return_val'] = hook(**hook_input['kwargs'])
>                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/pyproject_hooks/_in_process/_in_process.py", 
> line 118, in get_requires_for_build_wheel
>     return hook(config_settings)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/build_meta.py", 
> line 327, in get_requires_for_build_wheel
>     return self._get_build_requires(config_settings, requirements=[])
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/build_meta.py", 
> line 297, in _get_build_requires
>     self.run_setup()
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/build_meta.py", 
> line 497, in run_setup
>     super().run_setup(setup_script=setup_script)
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/build_meta.py", 
> line 313, in run_setup
>     exec(code, locals())
>   File "<string>", line 8, in <module>
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/__init__.py", 
> line 108, in setup
>     return distutils.core.setup(**attrs)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/_distutils/core.py", 
> line 158, in setup
>     dist.parse_config_files()
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/dist.py", 
> line 632, in parse_config_files
>     pyprojecttoml.apply_configuration(self, filename, 
> ignore_option_errors)
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/config/pyprojecttoml.py", 
> line 71, in apply_configuration
>     return _apply(dist, config, filepath)
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/config/_apply_pyprojecttoml.py", 
> line 53, in apply
>     _apply_project_table(dist, config, root_dir)
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/config/_apply_pyprojecttoml.py", 
> line 79, in _apply_project_table
>     corresp(dist, value, root_dir)
>   File 
> "/home/autobuild/autobuild/instance-12/output-1/host/lib/python3.12/site-packages/setuptools/config/_apply_pyprojecttoml.py", 
> line 181, in _license
>     _set_config(dist, "license", val["text"])
>                                  ~~~^^^^^^^^
> KeyError: 'text'
> 
> This is due to incorrect license information in pyproject.toml. This
> was probably missed as the package was merged ~6 months after it was
> submitted, so probably at the time it was submitted, it worked fine,
> but got broken with more recent versions of setuptools.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/c9114834eb00569cdb8ec3251ccd5ecfd906c9c9/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

> ---
>  ...eclaration-and-rely-instead-on-Trove.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 
> package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch
> 
> diff --git 
> a/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch 
> b/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch
> new file mode 100644
> index 0000000000..9e00269cb0
> --- /dev/null
> +++ 
> b/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch
> @@ -0,0 +1,29 @@
> +From 4e54dc74f2d6f735cb187343f01c44693ea86f59 Mon Sep 17 00:00:00 2001
> +From: "Jason R. Coombs" <jaraco@jaraco.com>
> +Date: Thu, 4 Apr 2024 17:23:20 -0400
> +Subject: [PATCH] Remove license declaration and rely instead on Trove
> + classifiers and LICENSE being included.
> +
> +Closes #32.
> +
> +Upstream: https://github.com/Lucretiel/autocommand/pull/33
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + setup.py | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 41f86a1..d154562 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -13,7 +13,6 @@ setup(
> +     ],
> +     package_dir={'': 'src'},
> +     platforms='any',
> +-    license='LGPLv3',
> +     author='Nathan West',
> +     url='https://github.com/Lucretiel/autocommand',
> +     description='A library to create a command-line program from a 
> function',
> +--
> +2.47.0
> +
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
