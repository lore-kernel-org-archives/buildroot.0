Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2109C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 15:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3507608AB;
	Sat,  1 Jun 2024 15:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmDLERTLjDQo; Sat,  1 Jun 2024 15:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16B78611AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B78611AF;
	Sat,  1 Jun 2024 15:42:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8DF1BF2EA
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6628D846A7
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONNH1E4T7HDt for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 15:42:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BE668467A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE668467A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BE668467A
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 15:42:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 940E813F8A9;
 Sat,  1 Jun 2024 17:41:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 17:41:59 +0200
Date: Sat, 1 Jun 2024 17:41:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZltBR4HNEeCcAjM-@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-4-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-4-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717256523;
 bh=rXpR0IVXN2WPqjgxQUjWyAsIp5lcMmPGPMKEYPymjW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEHsc2cHeEsjl62W0FgIqui6CE/Vy/Hgmq1OKcb4EggWq7wciFEtolVeyXbLFYhWt
 Arow5kqzOdncBDjLHReuglVRcr6K7Pp522thuU8AdV9vHLIFG2EtdNv1mhhth/aBfh
 Wc4ZgTHY1+6oHLagmoZPkcojgv//ZOpNnCcdnnht5+PBlut5yqbXiQ1Y3/3cV6+HrG
 GXX8CpbnLfhZQDMgANzvEINZsZ3/dvVSmM/SURYYoJoZjNut3s2VWTVDnPwRVzYQ4f
 VRewyg7k78i8n2ceB+gTNYZS2GqVfg6GiskbB4EA6qG/Nc1e0mw6250SkP9O3rwWeJ
 EbpPJAFowBwrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bEHsc2cH
Subject: Re: [Buildroot] [PATCH v2 3/6] package/pkg-golang: select
 BR2_PACKAGE_HOST_GO
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
Cc: Christian Stewart <christian@paral.in>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-15 18:22 +0200, Thomas Perale via buildroot spake thusly:
> Makes every packages built by the Go compiler select a new variable
> introduced in this patch: BR2_PACKAGE_HOST_GO.
> In later commits Go compiler variant will be introduced (built from
> source, pre-built binaries) and selecting BR2_PACKAGE_HOST_GO will
> force to add host-go provider to the dependency list.
> 
> The same pattern is used for Rust packages.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/balena-engine/Config.in        | 1 +
>  package/cni-plugins/Config.in          | 1 +
>  package/containerd/Config.in           | 1 +
>  package/crucible/Config.in             | 1 +
>  package/delve/Config.in                | 1 +
>  package/delve/Config.in.host           | 1 +
>  package/docker-cli/Config.in           | 1 +
>  package/docker-compose/Config.in       | 1 +
>  package/docker-engine/Config.in        | 1 +
>  package/embiggen-disk/Config.in        | 1 +
>  package/flannel/Config.in              | 1 +
>  package/gitlab-runner/Config.in        | 1 +
>  package/go/Config.in.host              | 5 +++++
>  package/gocryptfs/Config.in            | 1 +
>  package/mender-artifact/Config.in.host | 1 +
>  package/mender-connect/Config.in       | 1 +
>  package/mender/Config.in               | 1 +
>  package/moby-buildkit/Config.in        | 1 +
>  package/moby-buildkit/Config.in.host   | 1 +
>  package/nerdctl/Config.in              | 1 +
>  package/runc/Config.in                 | 1 +
>  package/runc/Config.in.host            | 1 +
>  package/tinifier/Config.in             | 1 +
>  package/wtfutil/Config.in              | 1 +
>  24 files changed, 28 insertions(+)
> 
> diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
> index 02f694515e..5966b33f58 100644
> --- a/package/balena-engine/Config.in
> +++ b/package/balena-engine/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_BALENA_ENGINE
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
>  	depends on BR2_USE_MMU # util-linux
>  	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
> +	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_IPTABLES # runtime
>  	select BR2_PACKAGE_UTIL_LINUX # runtime
>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime
> diff --git a/package/cni-plugins/Config.in b/package/cni-plugins/Config.in
> index 25e6ff534d..6d4ca0a5b4 100644
> --- a/package/cni-plugins/Config.in
> +++ b/package/cni-plugins/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_CNI_PLUGINS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
>  	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Container Networking Interface plugins.
> 
> diff --git a/package/containerd/Config.in b/package/containerd/Config.in
> index 2dd04b109c..f014c56e10 100644
> --- a/package/containerd/Config.in
> +++ b/package/containerd/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_CONTAINERD
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
>  	depends on BR2_USE_MMU # util-linux
> +	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
>  	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES
> diff --git a/package/crucible/Config.in b/package/crucible/Config.in
> index b27eb31ae5..1e1b29c3df 100644
> --- a/package/crucible/Config.in
> +++ b/package/crucible/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_CRUCIBLE
>  	bool "crucible"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
>  	  i.MX family.
> diff --git a/package/delve/Config.in b/package/delve/Config.in
> index 9428e4016a..288dc1ea15 100644
> --- a/package/delve/Config.in
> +++ b/package/delve/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_DELVE_ARCH_SUPPORTS
>  	default y if BR2_x86_64
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
> 
>  config BR2_PACKAGE_DELVE
>  	bool "delve"
> diff --git a/package/delve/Config.in.host b/package/delve/Config.in.host
> index dab5ca8914..0938ab0659 100644
> --- a/package/delve/Config.in.host
> +++ b/package/delve/Config.in.host
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOST_DELVE
>  	bool "host delve"
>  	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Delve is a debugger for the Go programming language.
> 
> diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
> index 6f187c9d22..52e7f7c871 100644
> --- a/package/docker-cli/Config.in
> +++ b/package/docker-cli/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_DOCKER_CLI
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Docker is a platform to build, ship,
>  	  and run applications as lightweight containers.
> diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
> index 59128f7a19..f3560e402b 100644
> --- a/package/docker-compose/Config.in
> +++ b/package/docker-compose/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_PACKAGE_DOCKER_CLI
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Multi-container applications with the Docker CLI.
> 
> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> index d48ffe6484..49a002a647 100644
> --- a/package/docker-engine/Config.in
> +++ b/package/docker-engine/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_DOCKER_ENGINE
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
>  	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
>  	select BR2_PACKAGE_CONTAINERD # runtime dependency
> +	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_IPTABLES # runtime dependency
>  	select BR2_PACKAGE_LIBSECCOMP
>  	help
> diff --git a/package/embiggen-disk/Config.in b/package/embiggen-disk/Config.in
> index 667d71c86e..c323fb1b6d 100644
> --- a/package/embiggen-disk/Config.in
> +++ b/package/embiggen-disk/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_EMBIGGEN_DISK
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
>  	depends on BR2_USE_MMU # util-linux
> +	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_UTIL_LINUX # sfdisk
>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES # sfdisk
>  	help
> diff --git a/package/flannel/Config.in b/package/flannel/Config.in
> index eb8d798f48..f37cfaa9cc 100644
> --- a/package/flannel/Config.in
> +++ b/package/flannel/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_FLANNEL
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Flannel is a virtual network that gives a subnet to each
>  	  host for use with container runtimes.
> diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
> index 4289613ab9..cfe8c941bc 100644
> --- a/package/gitlab-runner/Config.in
> +++ b/package/gitlab-runner/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
>  	select BR2_PACKAGE_CA_CERTIFICATES # runtime
>  	select BR2_PACKAGE_GIT # runtime
> +	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_LIBCURL # runtime
>  	select BR2_PACKAGE_LIBCURL_CURL # runtime
>  	select BR2_PACKAGE_LIBCURL_FORCE_TLS # runtime
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 7edf45850d..e1833d0905 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -32,6 +32,11 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  	default y
>  	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
> 
> +# Go packages should select BR2_PACKAGE_HOST_GO
> +config BR2_PACKAGE_HOST_GO
> +	bool
> +	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +
>  source "package/go/go-bootstrap-stage1/Config.in.host"
>  source "package/go/go-bootstrap-stage2/Config.in.host"
>  source "package/go/go-bootstrap-stage3/Config.in.host"
> diff --git a/package/gocryptfs/Config.in b/package/gocryptfs/Config.in
> index 2630cafdcf..2c70b9b21b 100644
> --- a/package/gocryptfs/Config.in
> +++ b/package/gocryptfs/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_GOCRYPTFS
>  	bool "gocryptfs"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  gocryptfs is an encrypted FUSE overlay filesystem.
> 
> diff --git a/package/mender-artifact/Config.in.host b/package/mender-artifact/Config.in.host
> index c7be0ed261..39353b23e7 100644
> --- a/package/mender-artifact/Config.in.host
> +++ b/package/mender-artifact/Config.in.host
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOST_MENDER_ARTIFACT
>  	bool "host mender-artifact"
>  	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  The mender-artifact tool is a CLI implementation of the
>  	  Mender artifacts library.
> diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
> index 0845910880..d478e468c2 100644
> --- a/package/mender-connect/Config.in
> +++ b/package/mender-connect/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_MENDER_CONNECT
>  	depends on BR2_USE_WCHAR # libglib2 -> gettext
>  	depends on BR2_USE_MMU # dbus -> fork()
>  	select BR2_PACKAGE_DBUS # runtime
> +	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_MENDER # runtime
>  	select BR2_PACKAGE_OPENSSL
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index 7d768cebec..4831548f76 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
> diff --git a/package/moby-buildkit/Config.in b/package/moby-buildkit/Config.in
> index 93c852bcdb..1a0b599097 100644
> --- a/package/moby-buildkit/Config.in
> +++ b/package/moby-buildkit/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_MOBY_BUILDKIT
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  BuildKit is a toolkit for converting source code to build
>  	  artifacts in an efficient, expressive and repeatable manner.
> diff --git a/package/moby-buildkit/Config.in.host b/package/moby-buildkit/Config.in.host
> index a3b18548f8..d4eb0d74c3 100644
> --- a/package/moby-buildkit/Config.in.host
> +++ b/package/moby-buildkit/Config.in.host
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOST_MOBY_BUILDKIT
>  	bool "host moby-buildkit"
>  	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  BuildKit is a toolkit for converting source code to build
>  	  artifacts in an efficient expressive and repeatable manner.
> diff --git a/package/nerdctl/Config.in b/package/nerdctl/Config.in
> index 969b9bb40e..062b36ab85 100644
> --- a/package/nerdctl/Config.in
> +++ b/package/nerdctl/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_NERDCTL
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd
>  	depends on BR2_USE_MMU # util-linux
>  	select BR2_PACKAGE_CONTAINERD # runtime
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Docker-compatible CLI for containerd, controlling runc.
> 
> diff --git a/package/runc/Config.in b/package/runc/Config.in
> index fe527b1954..73eac72527 100644
> --- a/package/runc/Config.in
> +++ b/package/runc/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_RUNC
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  runC is a CLI tool for spawning and running containers
>  	  according to the OCI specification.
> diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
> index 4b2555e029..78193cb499 100644
> --- a/package/runc/Config.in.host
> +++ b/package/runc/Config.in.host
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_HOST_RUNC
>  	bool "host runc"
>  	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  runC is a CLI tool for spawning and running containers
>  	  according to the OCI specification.
> diff --git a/package/tinifier/Config.in b/package/tinifier/Config.in
> index fbadfe6bd9..eae8b8f499 100644
> --- a/package/tinifier/Config.in
> +++ b/package/tinifier/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_TINIFIER
>  	bool "tinifier"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  CLI tool for images compressing
> 
> diff --git a/package/wtfutil/Config.in b/package/wtfutil/Config.in
> index 8c3efcea5d..3fd8c41bab 100644
> --- a/package/wtfutil/Config.in
> +++ b/package/wtfutil/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_WTFUTIL
>  	bool "wtfutil"
>  	depends on BR2_USE_MMU  # fork()
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
>  	help
>  	  WTF is the personal information dashboard for your terminal.
> 
> --
> 2.44.0
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
