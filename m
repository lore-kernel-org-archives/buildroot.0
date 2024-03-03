Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C61C54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD784414B9;
	Sun,  3 Mar 2024 09:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id usc2osbQWram; Sun,  3 Mar 2024 09:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971FD410BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 971FD410BC;
	Sun,  3 Mar 2024 09:12:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07FA61BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E95DC8238D
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDdkZRVaz8J4 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:12:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A382782386
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A382782386
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A382782386
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:12:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CFD5313F88E;
 Sun,  3 Mar 2024 10:12:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 10:12:28 +0100
Date: Sun, 3 Mar 2024 10:12:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZeQ-_DWTmCTjfxPU@landeda>
References: <20240302163138.152368-1-fontaine.fabrice@gmail.com>
 <20240302163138.152368-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240302163138.152368-2-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709457153;
 bh=CnvKDWTY6Lf68ADAC2RDVbVWFaOLmAneOzJE4z2uMFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=elkHy6VviO5OjCj5qr4OvP1k9jIkB3YCDNqO5khf4IFUPMPNBM8olOEpS65QhDCSZ
 JnJy+AuY+eAlqsHjOwlU9thc3uYYiY9eEUcT+W1bXWl+2N4/ve36Bt6rOv+92tLZVj
 UA1e7Q8IQ+wvS8JrgyoDc1FrzJzZ1voLNdKsNYqHrlQqNU7TsWBlsRzwdb9KIXu+he
 5tUi7433+f9tH3c/Tbsg55w92/Qa5SpxtHM3izDOJaV9u18r+ubOYfFsFLae1fnXwT
 4W4dQcF/Y6CKZh2mf88+NQsQTzqWEsWKvqjTNRRLGcQ2Y4gdNV9O14ELGFO+GB3Y29
 fZEjGr9n7BDMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=elkHy6Vv
Subject: Re: [Buildroot] [PATCH 2/2]
 package/python-setuptools-scm-git-archive: drop package
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

fabrice, All,

On 2024-03-02 17:31 +0100, Fabrice Fontaine spake thusly:
> python-setuptools-scm-git-archive is obsolete as
> python-setuptools-scm >= 7.0.0 supports Git archives by itself.
> 
> Moreover, it raises the following build failure without pip since its
> addition in commit 9359325c6081df89ff57667cb49e0d12cd553b97:
> 
> /nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/bin/python: No module named pip
> Traceback (most recent call last):
>   File "/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/lib/python3.10/site-packages/setuptools/installer.py", line 82, in fetch_build_egg
>     subprocess.check_call(cmd)
>   File "/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/lib/python3.10/subprocess.py", line 369, in check_call
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/bin/python', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmpaxobatcs', '--quiet', 'typing-extensions']' returned non-zero exit status 1.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d05e412170c427e4f210da164c783b3527f15892
>  - http://autobuild.buildroot.org/results/50f80cfabccbe5c75cd889ce6af2b418e376d4e5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../python-setuptools-scm-git-archive.hash        |  5 -----
>  .../python-setuptools-scm-git-archive.mk          | 15 ---------------
>  2 files changed, 20 deletions(-)
>  delete mode 100644 package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
>  delete mode 100644 package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
> 
> diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
> deleted file mode 100644
> index ce790a3d59..0000000000
> --- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
> -md5  cfcdab6edbe6b710ab24ad355e7cf7a3  setuptools_scm_git_archive-1.4.1.tar.gz
> -sha256  c418bc77b3974d3ac65f268f058f23e01dc5f991f2233128b0e16a69de227b09  setuptools_scm_git_archive-1.4.1.tar.gz
> -# Locally computed sha256 checksums
> -sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
> diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
> deleted file mode 100644
> index 153343788b..0000000000
> --- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -################################################################################
> -#
> -# python-setuptools-scm-git-archive
> -#
> -################################################################################
> -
> -PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4.1
> -PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SOURCE = setuptools_scm_git_archive-$(PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/47/d6/c9a8d1ea95613f79b9b914cf9a5e8e420b7625fc54137c1d7c9cbbda5adf
> -PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
> -PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
> -PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
> -HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_DEPENDENCIES = host-python-setuptools-scm
> -
> -$(eval $(host-python-package))
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
