Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED067C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D77410BC;
	Sun,  3 Mar 2024 09:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ShECmZEsX3O; Sun,  3 Mar 2024 09:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97DF410DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97DF410DF;
	Sun,  3 Mar 2024 09:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1777F1BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11BF140606
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GsRo59-ClHV for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:12:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 467EA40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 467EA40136
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 467EA40136
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:12:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6B76F13F8A7;
 Sun,  3 Mar 2024 10:12:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 10:12:13 +0100
Date: Sun, 3 Mar 2024 10:12:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZeQ-7S2z8gTqLlo9@landeda>
References: <20240302163138.152368-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240302163138.152368-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709457137;
 bh=xAE0mX+Xg2wA1wJ50yJxTov4ujKmo/NrG39zfMyqhjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d2kqoUuvJCvs15TcZGQ2Qrx2RzDSyl2HZOCgic2mQR6W7PYJAxfjwEISfJKenz8IG
 NGIZtmVbiFD8I9xKRYN18cTs6by3DSmUA8yuPP4L31X5Rh5MTRYlFNZrQZV/BXWH+e
 jUZiQiQZVV7x9sHVqG9C/tSLsfHlPcv6f9sU6Q4JfK5UWTO5Y2M5meVOJai3VqJeHh
 CNI/OXYdbRIBSeNda7O5AOejQAEigXsTLaJB9G83YH4+axBltenOFzdgBTXFJOH9Pk
 +g05RXSyT14Nw28+UV2u2juooygPwcKNwdn+nv1KyxsMi/QsBru5rCWtRe4VJBvwsa
 iPz1snNcW3jNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=d2kqoUuv
Subject: Re: [Buildroot] [PATCH 1/2] package/python-cheroot: drop
 host-python-setuptools-scm-git-archive
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-03-02 17:31 +0100, Fabrice Fontaine spake thusly:
> Drop host-python-setuptools-scm-git-archive dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ptools-scm-v7-for-building-the-dists.patch | 101 ++++++++++++++++++
>  package/python-cheroot/python-cheroot.mk      |   2 +-
>  2 files changed, 102 insertions(+), 1 deletion(-)
>  create mode 100644 package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
> 
> diff --git a/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch b/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
> new file mode 100644
> index 0000000000..837f2804d2
> --- /dev/null
> +++ b/package/python-cheroot/0001-Use-setuptools-scm-v7-for-building-the-dists.patch
> @@ -0,0 +1,101 @@
> +From f0c51af263e20f332c6f675aa90ec6705ae4f5d1 Mon Sep 17 00:00:00 2001
> +From: Serhii Abarovskyi <aserhii@protonmail.com>
> +Date: Tue, 9 May 2023 18:33:54 +0300
> +Subject: [PATCH] Use setuptools-scm v7+ for building the dists
> +
> +Since version 7, setuptools-scm has native support for git archive,
> +so the setuptools-scm-git-archive project is obsolete
> +and this patch removes it from the build dependencies.
> +Close #515
> +
> +Upstream: https://github.com/cherrypy/cheroot/commit/f0c51af263e20f332c6f675aa90ec6705ae4f5d1
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + .git_archival.txt                       |  3 +++
> + pyproject.toml                          |  3 +--
> + requirements/dist-build-constraints.in  |  3 +--
> + requirements/dist-build-constraints.txt | 16 +++++++---------
> + setup.cfg                               |  3 +--
> + 5 files changed, 13 insertions(+), 15 deletions(-)
> +
> +diff --git a/.git_archival.txt b/.git_archival.txt
> +index 95cb3eea4e..3994ec0a83 100644
> +--- a/.git_archival.txt
> ++++ b/.git_archival.txt
> +@@ -1 +1,4 @@
> ++node: $Format:%H$
> ++node-date: $Format:%cI$
> ++describe-name: $Format:%(describe:tags=true)$
> + ref-names: $Format:%D$
> +diff --git a/pyproject.toml b/pyproject.toml
> +index b1e5f60a80..88df57dcc1 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -6,8 +6,7 @@ requires = [
> +     "setuptools>=34.4",
> + 
> +     # Plugins
> +-    "setuptools_scm[toml]>=3.5",
> +-    "setuptools_scm_git_archive>=1.1",
> ++    "setuptools-scm >= 7.0.0",
> + ]
> + build-backend = "setuptools.build_meta"
> + 
> +diff --git a/requirements/dist-build-constraints.in b/requirements/dist-build-constraints.in
> +index 26b57228a9..a37baef1a9 100644
> +--- a/requirements/dist-build-constraints.in
> ++++ b/requirements/dist-build-constraints.in
> +@@ -5,8 +5,7 @@
> + setuptools >= 34.4
> + 
> + # Plugins
> +-setuptools_scm[toml] >= 3.5
> +-setuptools_scm_git_archive >= 1.1
> ++setuptools-scm[toml] >= 7.0.0
> + 
> + # Dynamic (coming from setuptools' PEP 517 build backend)
> + wheel
> +diff --git a/requirements/dist-build-constraints.txt b/requirements/dist-build-constraints.txt
> +index 525f2be30f..8bd4343ff6 100644
> +--- a/requirements/dist-build-constraints.txt
> ++++ b/requirements/dist-build-constraints.txt
> +@@ -1,18 +1,16 @@
> + #
> +-# This file is autogenerated by pip-compile with python 3.10
> +-# To update, run:
> ++# This file is autogenerated by pip-compile with Python 3.10
> ++# by the following command:
> + #
> + #    pip-compile --allow-unsafe --output-file=requirements/dist-build-constraints.txt --strip-extras requirements/dist-build-constraints.in
> + #
> +-packaging==21.3
> ++packaging==23.1
> +     # via setuptools-scm
> +-pyparsing==3.0.6
> +-    # via packaging
> +-setuptools-scm==6.3.2
> ++setuptools-scm==7.1.0
> +     # via -r requirements/dist-build-constraints.in
> +-setuptools-scm-git-archive==1.1
> +-    # via -r requirements/dist-build-constraints.in
> +-tomli==2.0.0
> ++tomli==2.0.1
> ++    # via setuptools-scm
> ++typing-extensions==4.6.3
> +     # via setuptools-scm
> + wheel==0.37.1
> +     # via -r requirements/dist-build-constraints.in
> +diff --git a/setup.cfg b/setup.cfg
> +index 1f2b08f4c3..900c7b4feb 100644
> +--- a/setup.cfg
> ++++ b/setup.cfg
> +@@ -64,8 +64,7 @@ include_package_data = True
> + packages = find:
> + include_package_data = True
> + setup_requires = 
> +-	setuptools_scm>=1.15.0
> +-	setuptools_scm_git_archive>=1.0
> ++	setuptools_scm >= 7.0.0
> + install_requires = 
> + 	importlib_metadata; python_version < '3.8'
> + 	more_itertools >= 2.6
> diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
> index 86e16f7db2..19aa7ae193 100644
> --- a/package/python-cheroot/python-cheroot.mk
> +++ b/package/python-cheroot/python-cheroot.mk
> @@ -10,6 +10,6 @@ PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/08/7c/95c154177b16
>  PYTHON_CHEROOT_LICENSE = BSD-3-Clause
>  PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
>  PYTHON_CHEROOT_SETUP_TYPE = setuptools
> -PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm host-python-setuptools-scm-git-archive
> +PYTHON_CHEROOT_DEPENDENCIES = host-python-setuptools-scm
>  
>  $(eval $(python-package))
> -- 
> 2.43.0
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
