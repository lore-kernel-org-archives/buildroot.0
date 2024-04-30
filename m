Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BC3C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD206058B;
	Tue, 30 Apr 2024 20:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVnW4kFo3D46; Tue, 30 Apr 2024 20:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAAC960A82
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAAC960A82;
	Tue, 30 Apr 2024 20:05:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB4441BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6B184074B
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HziWcT3ryKmG for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A37840749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A37840749
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A37840749
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:05:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5988113F880;
 Tue, 30 Apr 2024 22:05:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Apr 2024 22:05:41 +0200
Date: Tue, 30 Apr 2024 22:05:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <ZjFPFeaiJzEkHfTJ@landeda>
References: <20240418222607.1487698-1-gsmecher@threespeedlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418222607.1487698-1-gsmecher@threespeedlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714507547;
 bh=/hE5TXPV/YUY8qP1eVOROOxhD0xILYYl1Da1qB2Atks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OlTSfLJhsIuUnqUS0+kWuwCF9L0Vp8yrgqTFmxjr+OYDYgZCSv9SU02PnR6q8wser
 5AKHsF6H3RULOVv5jHSGnfmDpoLmWvRVd70u/ZSqleup07+LXH8X9BWdoOtpHdug7U
 JzlxaN/wndgx1H6HswqkuQVn6WJryq3qj4QamWjIgjCGQhU0r1z56DUUSsjGLeIRbW
 6T+qAKv2xNatJt4QZ7glneyFeuFIvpYbFf2rsBdJq0CQFTNCKfuIimvf45EbSCSh2t
 hE624xg+36a1gZrH+kgbTEHLTsdqbl4NQkze2v7j+Wa8AFm9Gjp94TvKM2fB1RQ4fC
 xypwoiDFIqZHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OlTSfLJh
Subject: Re: [Buildroot] [RFC PATCH 1/1] jupyterlab: new package
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Graeme, All,

Thanks for the effort in porting JupyterLab to Buildroot, I can see that
it's a complex stack!

James, there are a few uestions for you below (search your first name)...

On 2024-04-18 15:26 -0700, Graeme Smecher spake thusly:
> JupyterLab is a "web-based interactive development environment for
> notebooks, code, and data. Its flexible interface allows users to
> configure and arrange workflows in data science, scientific computing,
> computational journalism, and machine learning." [1]

Although I can see how JupyretLab is interesting, I am not sure its
purpose is so interesting in embedded products. I know that Buildroot is
also used to create OCI images for cloudy stuff, but even there I am not
sure it is so interesting.

To me, JupyterLab is a quick-anmd-dirty solution to whip around a little
bit of (python) code to deal with some data from some kind of datalake
(or datapond, or datapuddle? ;-]) with little to no maintainability in
the code, just slightly glorified snippets not much more complex like
one-liners like data.plot(type="scaterplot", range=([0.0, 1.0], [-1.0, 1.0]))

Yes, I know the above is a bit exagerated...

But see below...

> Why BuildRoot? JupyterLab makes a great
> interactive front-end for embedded instrumentation:
> they replace web-based interfaces, encourage open scriptability, and
> bridge the gap between interactive and scripted use-cases. High-end lab
> gear (think: oscilloscopes) generally comes with some of these ingredients
> but it's usually vendor-specific, often half-hearted, and usually
> inherit its ergonomics from IEEE-488 (no thanks).

That last bit had me really laugh (I can relate), thanks! :-)

But now, I think I see where you're trying to get, so let me try and
rehash what you are saying to see if I understood correctly.

What you are suggesting is that JupyterLab be used as a frontend to a
device, like an oscilloscope, that is highly customisable (think:
trigger condition, range, duration, number of inputs, and whatnots) that
makes a progrmmable environment better suited to use all those features,
but where giving a bare python interpreter is, well, too bare.

Is that right?

If so, then I do think it does make a lot of sense indeed to have such a
stack available in Buildroot.

See below for a very high-altitude preliminary review.

> For example: JupyterLab is already used in Xilinx's PYNQ framework [2],
> which uses Yocto as a distribution builder.
> 
> [1]: https://jupyter.org
> [2]: http://www.pynq.io
> 
> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> ---
>  package/Config.in                             | 21 ++++++++
>  package/jupyter-client/Config.in              |  6 +++
>  package/jupyter-client/jupyter-client.mk      | 15 ++++++
>  package/jupyter-core/Config.in                |  6 +++
>  package/jupyter-core/jupyter-core.mk          | 13 +++++
>  package/jupyter-events/Config.in              |  6 +++
>  package/jupyter-events/jupyter-events.mk      | 13 +++++
>  package/jupyter-ipython-kernel/Config.in      |  8 +++
>  .../jupyter-ipython-kernel.mk                 | 19 +++++++
>  package/jupyter-nbclient/Config.in            |  6 +++
>  package/jupyter-nbclient/jupyter-nbclient.mk  | 13 +++++
>  package/jupyter-nbconvert/0001-certs.patch    | 23 ++++++++
>  package/jupyter-nbconvert/Config.in           |  6 +++
>  .../jupyter-nbconvert/jupyter-nbconvert.mk    | 14 +++++
>  package/jupyter-nbformat/Config.in            |  6 +++
>  package/jupyter-nbformat/jupyter-nbformat.mk  | 14 +++++
>  package/jupyter-notebook-shim/Config.in       |  6 +++
>  .../jupyter-notebook-shim.mk                  | 14 +++++
>  .../jupyter-server/0001-dependencies.patch    | 14 +++++
>  package/jupyter-server/Config.in              |  7 +++
>  package/jupyter-server/jupyter-server.mk      | 14 +++++
>  package/jupyterlab-pygments/Config.in         |  6 +++
>  .../jupyterlab-pygments.mk                    | 14 +++++
>  package/jupyterlab-server/Config.in           |  6 +++
>  .../jupyterlab-server/jupyterlab-server.mk    | 13 +++++
>  package/jupyterlab/0001-dependencies.patch    | 14 +++++
>  package/jupyterlab/Config.in                  | 52 +++++++++++++++++++
>  package/jupyterlab/jupyterlab.mk              | 18 +++++++
>  package/python-bleach/Config.in               |  7 +++
>  package/python-bleach/python-bleach.mk        | 14 +++++
>  package/python-comm/Config.in                 |  7 +++
>  package/python-comm/python-comm.mk            | 14 +++++
>  package/python-fastjsonschema/Config.in       |  6 +++
>  .../python-fastjsonschema.mk                  | 13 +++++
>  .../python-hatch-jupyter-builder.mk           | 14 +++++
>  .../python-hatch-nodejs-version.mk            | 15 ++++++
>  package/python-json-logger/Config.in          |  7 +++
>  .../python-json-logger/python-json-logger.mk  | 13 +++++
>  package/python-json5/Config.in                |  6 +++
>  package/python-json5/python-json5.mk          | 14 +++++
>  .../python-matplotlib/0001-dependencies.patch | 19 +++++++
>  package/python-overrides/Config.in            |  7 +++
>  package/python-overrides/python-overrides.mk  | 14 +++++
>  package/python-platformdirs/Config.in         |  6 +++
>  .../python-platformdirs.mk                    | 19 +++++++
>  package/python-prometheus-client/Config.in    |  6 +++
>  .../python-prometheus-client.mk               | 13 +++++
>  package/python-send2trash/Config.in           |  7 +++
>  .../python-send2trash/python-send2trash.mk    | 14 +++++
>  49 files changed, 602 insertions(+)

That's a huge diff.

What you should do to ease review, is to split your change in multiple
patches, one for each new component you add, in the order from the
deepest dependency, workigng toward adding the last package that ties
them all together, e.g. (assuming 30 patches):

    [0001/0030] package/python-fastjsonschema: new package
    [0002/0030] package/python-overrides: new package
    [...]
    [0028/0030] package/jupyter-server: new package
    [0029/0030] package/jupyter-client: new package
    [0030/0030] package/jupyterlab: new package

It would also be wonderfull if there was a runtime test for jupyterlab;
see in support/testing/ for manu examples.

[--SNIP--]
> diff --git a/package/jupyter-client/Config.in b/package/jupyter-client/Config.in
> new file mode 100644
> index 0000000000..1086780aed
> --- /dev/null
> +++ b/package/jupyter-client/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_JUPYTER_CLIENT
> +	bool "jupyter-client"

It's a python package, so it should either depend on BR2_PACKAGE_PYTHON3,
or select it and depend on the same conditions as python3 itslef, i.e.:

    depends on BR2_PACKAGE_PYTHON3

or:

    depends on BR2_USE_WCHAR  # python3
    depends on BR2_USE_MMU  # python3
    depends on BR2_TOOLCHAIN_HAS_THREADS  # python3
    depends on !BR2_STATIC_LIBS  # python3
    select BR2_PACKAGE_PYTHON3

(this comment applies globally to this patch)

> +	help
> +	  Jupyter Client
> +
> +	  https://github.com/jupyter-client/jupyter_client
> diff --git a/package/jupyter-client/jupyter-client.mk b/package/jupyter-client/jupyter-client.mk
> new file mode 100644
> index 0000000000..1946585929
> --- /dev/null
> +++ b/package/jupyter-client/jupyter-client.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# jupyter-client
> +#
> +################################################################################
> +
> +JUPYTER_CLIENT_VERSION = v8.2.0
> +JUPYTER_CLIENT_SITE = $(call github,jupyter,jupyter_client,$(JUPYTER_CLIENT_VERSION))
> +JUPYTER_CLIENT_SETUP_TYPE = pep517
> +JUPYTER_CLIENT_LICENSE = BSD-3-Clause
> +JUPYTER_CLIENT_LICENSE_FILES = LICENSE
> +JUPYTER_CLIENT_DEPENDENCIES = host-python-hatchling
> +
> +$(eval $(python-package))
> +$(eval $(host-python-package))

Why are both the target and host variants required?

I found nothing that has host-jupyter-client in its _DEPENDENCIES list
in your patch.

[--SNIP--]
> diff --git a/package/jupyter-nbconvert/0001-certs.patch b/package/jupyter-nbconvert/0001-certs.patch
> new file mode 100644
> index 0000000000..a9d00f3483
> --- /dev/null
> +++ b/package/jupyter-nbconvert/0001-certs.patch
> @@ -0,0 +1,23 @@
> +Use certifi Python package for CA certificates
> +
> +Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> +Upstream: N/A (system certificates manage this outside buildroot)

Sorry, I am not sure to understand this...

If you need system certifcates, then you should select the ca-certifacte
package.

If you need certifi, you must also select it (and propagate its
dependencies):
    select BR2_PACKAGEPYTHON_CERTIFI

I think the commit for that specific patch jupyter-nbconvert/0001-certs.patch 
needs to be a little bit extended if it really is needed (but I'd like
an explanation why the sytem ca-certificates can't be used).

> +--- nbconvert-7.3.1/hatch_build.py	2023-04-10 09:58:09.000000000 -0400
> ++++ nbconvert-7.3.1/hatch_build_new.py	2024-03-11 13:14:03.900065615 -0400

also, those filenames look dubious...

[--SNIP--]
> diff --git a/package/jupyter-server/0001-dependencies.patch b/package/jupyter-server/0001-dependencies.patch
> new file mode 100644
> index 0000000000..61da5ba7c6
> --- /dev/null
> +++ b/package/jupyter-server/0001-dependencies.patch
> @@ -0,0 +1,14 @@
> +jupyter_server: Remove hatch-jupyter-builder dependency
> +
> +Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> +Upstream: N/A (needed to break buildroot-specific host/target dependency loop)

James, can you have a look at that please?

> +--- jupyter_server-2.12.5/pyproject.toml	2024-01-16 09:57:59.000000000 -0500
> ++++ jupyter_server-2.12.5/pyproject_new.toml	2024-03-11 14:20:27.318247718 -0400
> +@@ -129,7 +129,6 @@
> + artifacts = ["jupyter_server/static/style"]
> + 
> + [tool.hatch.build.hooks.jupyter-builder]
> +-dependencies = ["hatch-jupyter-builder>=0.8.1"]
> + build-function = "hatch_jupyter_builder.npm_builder"
> + ensured-targets = [
> +   "jupyter_server/static/style/bootstrap.min.css",
[--SNIP--]
> diff --git a/package/jupyterlab/0001-dependencies.patch b/package/jupyterlab/0001-dependencies.patch
> new file mode 100644
> index 0000000000..1e3b36dd9f
> --- /dev/null
> +++ b/package/jupyterlab/0001-dependencies.patch
> @@ -0,0 +1,14 @@
> +jupyterlab: Remove hatch-jupyter-builder dependency
> +
> +Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> +Upstream: N/A (needed to break buildroot-specific host/target dependency loop)

James? ;-)

> +--- jupyterlab-4.0.12/pyproject.toml	2024-01-30 09:17:41.000000000 -0500
> ++++ jupyterlab-4.0.12/pyproject_new.toml	2024-03-11 14:17:16.914647903 -0400
> +@@ -187,7 +187,6 @@
> + ]
> + 
> + [tool.hatch.build.hooks.jupyter-builder]
> +-dependencies = ["hatch-jupyter-builder>=0.3.2"]
> + build-function = "buildapi.builder"
> + ensured-targets = [
> +     "jupyterlab/static/package.json",
> diff --git a/package/jupyterlab/Config.in b/package/jupyterlab/Config.in
> new file mode 100644
> index 0000000000..9a91dc7a31
> --- /dev/null
> +++ b/package/jupyterlab/Config.in
> @@ -0,0 +1,52 @@
> +config BR2_PACKAGE_JUPYTERLAB
> +	bool "jupyterlab"
> +	select BR2_PACKAGE_LIBARGON2
> +	select BR2_PACKAGE_JUPYTERLAB_SERVER
> +	select BR2_PACKAGE_JUPYTERLAB_PYGMENTS
> +	select BR2_PACKAGE_JUPYTER_CLIENT
> +	select BR2_PACKAGE_JUPYTER_CORE
> +	select BR2_PACKAGE_JUPYTER_EVENTS
> +	select BR2_PACKAGE_JUPYTER_IPYTHON_KERNEL
> +	select BR2_PACKAGE_JUPYTER_NBCLIENT
> +	select BR2_PACKAGE_JUPYTER_NBCONVERT
> +	select BR2_PACKAGE_JUPYTER_NBFORMAT
> +	select BR2_PACKAGE_JUPYTER_NOTEBOOK_SHIM
> +	select BR2_PACKAGE_JUPYTER_SERVER
> +	select BR2_PACKAGE_PYTHON_ANYIO
> +	select BR2_PACKAGE_PYTHON_ARGON2_CFFI
> +	select BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS
> +	select BR2_PACKAGE_PYTHON_ASTTOKENS
> +	select BR2_PACKAGE_PYTHON_ASYNC_LRU
> +	select BR2_PACKAGE_PYTHON_BABEL
> +	select BR2_PACKAGE_PYTHON_BLEACH
> +	select BR2_PACKAGE_PYTHON_DATEUTIL
> +	select BR2_PACKAGE_PYTHON_DEFUSEDXML
> +	select BR2_PACKAGE_PYTHON_EXECUTING
> +	select BR2_PACKAGE_PYTHON_COMM
> +	select BR2_PACKAGE_PYTHON_FASTJSONSCHEMA
> +	select BR2_PACKAGE_PYTHON_IPYTHON
> +	select BR2_PACKAGE_PYTHON_JINJA2
> +	select BR2_PACKAGE_PYTHON_JSON5
> +	select BR2_PACKAGE_PYTHON_JSONSCHEMA
> +	select BR2_PACKAGE_PYTHON_JSON_LOGGER
> +	select BR2_PACKAGE_PYTHON_MATPLOTLIB
> +	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE
> +	select BR2_PACKAGE_PYTHON_PACKAGING
> +	select BR2_PACKAGE_PYTHON_PLATFORMDIRS
> +	select BR2_PACKAGE_PYTHON_PROMETHEUS_CLIENT
> +	select BR2_PACKAGE_PYTHON_PSUTIL
> +	select BR2_PACKAGE_PYTHON_PYYAML
> +	select BR2_PACKAGE_PYTHON_PYZMQ
> +	select BR2_PACKAGE_PYTHON_REQUESTS
> +	select BR2_PACKAGE_PYTHON_SEND2TRASH
> +	select BR2_PACKAGE_PYTHON_SNIFFIO
> +	select BR2_PACKAGE_PYTHON_STACK_DATA
> +	select BR2_PACKAGE_PYTHON_TORNADO
> +	select BR2_PACKAGE_PYTHON_TRAITLETS
> +	select BR2_PACKAGE_PYTHON_WEBENCODINGS
> +	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT
> +	select BR2_PACKAGE_PYTHON3_SQLITE

Woot, that's quite a list of dependnecies!

Besure that, when you select a package, you also propagate its own
dpednencies.

For example, to add:

    select BR2_PACKAGE_PYTHON_MATPLOTLIB

you also need to add the depends on from matplotlib itself;

    depends on BR2_INSTALL_LIBSTDCPP  # python-matplotlib
    depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS  # python-matplotlib
    depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL  # python-matplotlib
    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9  # python-matplotlib
    depends on BR2_HOST_GCC_AT_LEAST_9  # python-matplotlib

and so on... Yes, this is going to be a bit tedious, but is required or
the package could be selected when all its dependencies (direct or
indirect) might not all be available.

Also, it is customary that, when selecting a python package, we add a
little blurb that hints it is a runtime-only dependency, like so:

    select BR2_PACKAGE_PYTHON_MATPLOTLIB  # runtime

(the goal is that, maybe one day we'll have a linter that checks that
whatever is selected is in _DEPENDENCIES, unless it's a runtime dep. One
day...)

> diff --git a/package/python-matplotlib/0001-dependencies.patch b/package/python-matplotlib/0001-dependencies.patch
> new file mode 100644
> index 0000000000..ed72892ba6
> --- /dev/null
> +++ b/package/python-matplotlib/0001-dependencies.patch
> @@ -0,0 +1,19 @@
> +Disable dependency on numpy at package level (satisfied by buildroot)
> +
> +Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> +Upstream: N/A

James? ;-)

> +--- python-matplotlib-3.4.3/setup.py	2024-03-11 17:19:07.569386025 -0400
> ++++ python-matplotlib-3.4.3/setup_new.py	2024-03-11 17:19:46.297258324 -0400
> +@@ -300,12 +300,10 @@
> +     python_requires='>={}'.format('.'.join(str(n) for n in py_min_version)),
> +     setup_requires=[
> +         "certifi>=2020.06.20",
> +-        "numpy>=1.16",
> +     ],
> +     install_requires=[
> +         "cycler>=0.10",
> +         "kiwisolver>=1.0.1",
> +-        "numpy>=1.16",
> +         "pillow>=6.2.0",
> +         "pyparsing>=2.2.1",
> +         "python-dateutil>=2.7",

OK, so overall, it does not look too scary. Big, but not so scary...

Care to respin a series with all the packages added one by one as
suggested above?

Note that this was only a brief review; when you resend, do not be
surprised to get additional comments on individual packages, as this is
gong to be easier to review in details...

Speaking of details: do onot hesitate to add a bit of details in your
commit logs, so that whatever issue you had to solve when wiriting the
patch, is explained, even if briefly. If youswondered about something,
chances are that we are all going to wonder about it as well, so your
solution needs explanations. But most important: think about yourself in
10-month time, when you need to look back at what you did (e.g. to fix a
bug, update a pakcage, whatever...)

Finally, I think the commit log you provided in this patch is not really
a commit log, but rather a cover-letter for the series. It's nice to
have a little blurb about expected usage in the commit log, but it bette
rfitsa cover-letter in this case, with the commit log of JupyterLab just
about the details of the packaging itself (i.e. what is special to
package it in Buldroot). Such a cover letter could be mostly made of the
explanations you gave above.

Thank you!

Regards,
Yann E. MORIN.

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
