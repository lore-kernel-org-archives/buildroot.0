Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5740AC54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 13:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3757360629;
	Sun, 10 Mar 2024 13:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZiJlv5Bs_9J; Sun, 10 Mar 2024 13:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A9B60637
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A9B60637;
	Sun, 10 Mar 2024 13:25:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 340361BF300
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 13:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20A4D60637
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 13:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbU0A2ZxvE_r for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 13:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9DA660629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9DA660629
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9DA660629
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 13:25:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7D017B0059B;
 Sun, 10 Mar 2024 14:25:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41984])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Mar 2024 14:25:14 +0100
MIME-Version: 1.0
Date: Sun, 10 Mar 2024 14:25:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <20231212160112.94272-2-hypnotoad@lindra.de>
References: <20231212160112.94272-1-hypnotoad@lindra.de>
 <20231212160112.94272-2-hypnotoad@lindra.de>
User-Agent: Webmail Free/1.6.5
Message-ID: <e74314eb89591838527daf1e9fbb5278@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710077119;
 bh=KrzhULzrVVatemxh+8DgfUNzi57a8QWutRtZrcPhWJo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jLpFUSnDBFzPVKBrddyY76lHT2eKDpBkMU0tsFbUwPF0JRGU3qkCMocsvvnWbP3Pt
 BguElVQBlm/bUgnYERP9JiapnsYpyPz82N/SnwIrhRuO6Gj2fqbWM9UeAn+6UA6rh5
 z8fFop71PQUvKoDbgiqSi3o/QTa0yt8ewSD1QQBopllAtX6g2H1TLzzZbBav2h+vtp
 o72VyjC2J70So/r0dqPF2co1e1iuXmE+rb0qEnwVAhRv+D1uhA1hv4lPs2dbrLeMmb
 tktr/Yf098633BHsC1hXQ9KIYHQKKO//dsdWfR79HY0WKOW+/BrJGfjq6b8nG1PmUR
 7JRW/OsfQaIEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jLpFUSnD
Subject: Re: [Buildroot] [PATCH 2/2] python-qt5: add PyQt5.sip module
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
Cc: gwenhael.goavec-merou@trabucayre.com, yann.morin.1998@free.fr,
 asafka7@gmail.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ralf, All,

Thanks for this patch.  I have few comments on it.

There was an improved version of this patch, sent as an
attachment here:
https://lists.buildroot.org/pipermail/buildroot/2023-December/681200.html
This may be the reason why this series got forgotten. For sending
updated patches, see:
https://nightly.buildroot.org/manual.html#_patch_revision_changelog

I am commenting this earlier patch revision. I believe my comments also
applies to the other version.

First, I think this patch could be split in two, in the same series:
1. the introduction of the new package python-pyqt5-sip (alone)
    The commit log should describe what the package is and why it is 
needed.
2. The runtime fix for python-pyqt5
    The commit log should describe what is broken, when the problem was 
introduced.
    (see examples later)

In order to follow the Buildroot convention, the first patch one-line
title could be changed to:
"package/python-pyqt5-sip: new package"

On 12/12/2023 17:01, Ralf Dragon wrote:
> This fixes the following runtime error when importing PyQt5 in python:
> 
> from PyQt5.QtCore import *
> ModuleNotFoundError: No module named 'PyQt5.sip'

You could also add a quick package description and the reason you would 
like
to add the package in the commit log, for example:
"""
The sip extension module provides support for the PyQt5 package.

This package is needed at runtime by python-pyqt5 version >= 5.11.
"""


> Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
> ---
> Backport to: 2023.02.x
> 
>  package/Config.in                              |  1 +
>  package/python-pyqt5-sip/Config.in             |  6 ++++++
>  package/python-pyqt5-sip/python-pyqt5-sip.hash |  4 ++++
>  package/python-pyqt5-sip/python-pyqt5-sip.mk   | 15 +++++++++++++++
>  package/python-pyqt5/Config.in                 |  1 +
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-pyqt5-sip/Config.in
>  create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.hash
>  create mode 100644 package/python-pyqt5-sip/python-pyqt5-sip.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index fcc09b07c4..2d6a077d16 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1253,6 +1253,7 @@ menu "External python modules"
>  	source "package/python-pyphen/Config.in"
>  	source "package/python-pyqrcode/Config.in"
>  	source "package/python-pyqt5/Config.in"
> +	source "package/python-pyqt5-sip/Config.in"
>  	source "package/python-pyratemp/Config.in"
>  	source "package/python-pyroute2/Config.in"
>  	source "package/python-pyrsistent/Config.in"
> diff --git a/package/python-pyqt5-sip/Config.in 
> b/package/python-pyqt5-sip/Config.in
> new file mode 100644
> index 0000000000..6f26271f70
> --- /dev/null
> +++ b/package/python-pyqt5-sip/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PYQT5_SIP
> +	bool "python-pyqt5-sip"
> +	depends on BR2_PACKAGE_PYTHON_PYQT5
> +	depends on BR2_PACKAGE_PYTHON_SIP
> +	help
> +	  This is the PyQt5.sip module which is needed to run PyQt5.
> diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash 
> b/package/python-pyqt5-sip/python-pyqt5-sip.hash
> new file mode 100644
> index 0000000000..8039cdafd9
> --- /dev/null
> +++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
> @@ -0,0 +1,4 @@
> +# from https://pypi.org/project/PyQt5-sip/12.12.1
> +
> +sha256  
> 8fdc6e0148abd12d977a1d3828e7b79aae958e83c6cb5adae614916d888a6b10  
> PyQt5_sip-12.12.1.tar.gz
> +md5  c2117da3b4c0e081c1c5a9088b8a4d55  PyQt5_sip-12.12.1.tar.gz

Can you add here hashes for the 3 license files?
See also comment in the .mk file. You can then check with a
"make python-pyqt5-sip-legal-info" or "make legal-info".

> diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk 
> b/package/python-pyqt5-sip/python-pyqt5-sip.mk
> new file mode 100644
> index 0000000000..3f689b9d47
> --- /dev/null
> +++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-SIP-QT5
> +#
> +################################################################################
> +
> +PYTHON_PYQT5_SIP_VERSION = 12.12.1

There is now a v12.13.0 available. See:
https://pypi.org/project/PyQt5-sip/

Since this patch will likely need a v2, could you see if you can 
updating to
this new version?

> +PYTHON_PYQT5_SIP_SITE = 
> https://files.pythonhosted.org/packages/c1/61/4055e7a0f36339964956ff415e36f4abf82561904cc49c021da32949fc55
> +PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
> +PYTHON_PYQT5_SIP_LICENSE = MIT

License seems to be:
"SIP or GPL-2.0 or GPL-3.0"
Where is the source of this MIT license? (I grep'ed "MIT" in the
sources and was not able to any occurrence of it).

> +PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE

The package also contains the license files:
LICENSE-GPL2 and LICENSE-GPL3.
Can you add those here? (see also comment in the .hash file).

> +PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools
> +PYTHON_PYQT5_SIP_DEPENDENCIES += python-sip
> +
> +$(eval $(python-package))
> diff --git a/package/python-pyqt5/Config.in 
> b/package/python-pyqt5/Config.in
> index 9fa7676f98..c2a1976950 100644
> --- a/package/python-pyqt5/Config.in
> +++ b/package/python-pyqt5/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYQT5
>  	bool "python-pyqt5"
>  	depends on BR2_PACKAGE_QT5
>  	select BR2_PACKAGE_PYTHON_SIP
> +	select BR2_PACKAGE_PYTHON_PYQT5_SIP

This line could go in a separate "python-pyqt5 fix" patch. Could you
also flag this dependency as "runtime"?

	select BR2_PACKAGE_PYTHON_PYQT5_SIP # runtime

The commit log of this second patch should describe issue, for example:
"""
Commit b36ce7eda0 "package/python-pyqt5: bump to version 5.15.6"
updated PyQt5 from version 5.7 to 5.15.6. This commit forgot to
take into account an upstream incompatible change about a PyQt5
SIP module. See [1]. Without this pyqt5-sip module, pyqt5 is failing
to load at runtime.

The issue can be reproduced with the command:

     python3 -c 'from PyQt5.QtCore import *'

This commit fixes the issue by adding this missing runtime dependency.

Fixes:

     ModuleNotFoundError: No module named 'PyQt5.sip'

[1] 
https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11
"""

>  	select BR2_PACKAGE_QT5BASE_GUI
>  	help
>  	  Python bindings for Qt 5
> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
