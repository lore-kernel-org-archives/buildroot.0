Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C00C5DF7E
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 11:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7785440696;
	Tue, 18 Aug 2026 11:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a29FB2ilKbr; Tue, 18 Aug 2026 11:10:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390E24069D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787051428;
	bh=XvMs0ofVMogkxiz1Rx164198aSJF+HlvkEU3U2VvaJ4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=qb8V95biPjgdDm3PJeowZzCPVEZGPxv1bbZKtErwUEc/Fe0xyUux7NWYfn7Co9RqO
	 OG9S4d8g35Z7dKvOkyksP1sUq+usUU6+ke3qeTSxJ85H2MnOyh5EUlDt84v+nPqUVd
	 Q4Kz8WJlMdbR9j24+p02dOGX4LobIO8S96aKq0+mlji8CUOdPj5IaDcOX8LZHx7Tgv
	 ziE5WHA2lC+g8JbpOeTiGnKFKY4JkcoVFTvVJf23QCOPlCnqEcTgZS+8vyXnvOYPsr
	 VlBIrjMFL2QNrrvYiTHoI1J+LjHOTOvH7xHnpzi2Q9kVnyFeURd9AKsRXOmKfjxtBX
	 7Zm/C7E1sTq5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390E24069D;
	Tue, 18 Aug 2026 11:10:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDF70194
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 11:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E00D0607E7
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 11:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 019zkujiIFN3 for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 11:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBC6B606BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC6B606BA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBC6B606BA
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 11:10:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjjCF-1wZ0S13PUR-00kFJi; Tue, 18
 Aug 2026 13:10:18 +0200
Message-ID: <f762f643-9c56-43c1-beb7-be234764abe7@gmx.de>
Date: Tue, 18 Aug 2026 13:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260813143405.2868517-1-fiona.klute@gmx.de>
 <20260813143405.2868517-3-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260813143405.2868517-3-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:LAGYOCiIUQw9ftespXU6udzahtmz9Oqd6+rozv+fUOXT48SjXVI
 dgWuG5Ri4A2T3rqlHOgtl06jh/ipzTbdjdaXtDCmV2JP5sirj8neRhkFGa+E2E7hdcnV0Tn
 M1eKP5tHomK8oMsOhwyvFW1JBRWQHt3t9L3yGmeZw+eP024AvPfRSaNbaFCN3/VIpwioQg+
 72FRM0rG3xBxrIqd37d8A==
UI-OutboundReport: notjunk:1;M01:P0:4fHQB+fENBo=;43hmM13v2BH6j6D0McfHMi9kTYW
 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
Subject: Re: [Buildroot] [PATCH 3/3] package/dracut: add subpackage for
 dracut-util
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Thierry Bultel <tbultel@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

I'm withdrawing this patch for now. We definitely need target 
dracut-util for fully functional Dracut (I'm working on getting 
initramfs with systemd to work, which the current tests exclude), but 
there are a bunch of things that need fixing upstream, and depending on 
the results this may take a different shape.

Please see [1] if you're interested in the upstream side.

And thanks to Julien for excluding it when merging the rest of the 
series, that was a good call.

Best regards,
Fiona

[1] https://github.com/dracut-ng/dracut/pull/2588

Am 13.08.26 um 16:34 schrieb Fiona Klute:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
> 
> dracut-util is a small executable that provides dracut-getarg{,s}
> commands for scripts in the initramfs. As such it must be built and
> installed for the target so it is available when building the
> initramfs.
> 
> The reason to create a subpackage instead of adding a target build for
> package/dracut is to avoid a conflict in case someone needs "full"
> dracut on the target in the future (to build an initramfs on the
> target system, outside the Buildroot build). Also using ./configure
> would require a dependency on kmod, which is not needed for
> dracut-util.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
> ---
>   package/Config.in                           |  1 +
>   package/dracut/Config.in                    |  1 +
>   package/dracut/Config.in.host               |  1 +
>   package/dracut/dracut-util/Config.in        | 14 +++++++++++++
>   package/dracut/dracut-util/dracut-util.hash |  1 +
>   package/dracut/dracut-util/dracut-util.mk   | 23 +++++++++++++++++++++
>   package/dracut/dracut.mk                    |  2 ++
>   7 files changed, 43 insertions(+)
>   create mode 100644 package/dracut/Config.in
>   create mode 100644 package/dracut/dracut-util/Config.in
>   create mode 120000 package/dracut/dracut-util/dracut-util.hash
>   create mode 100644 package/dracut/dracut-util/dracut-util.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index ce316334e1..34a848fa74 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2822,6 +2822,7 @@ menu "System tools"
>   	source "package/docker-credential-acr-env/Config.in"
>   	source "package/docker-credential-gcr/Config.in"
>   	source "package/docker-engine/Config.in"
> +	source "package/dracut/Config.in"
>   	source "package/dtui/Config.in"
>   	source "package/earlyoom/Config.in"
>   	source "package/efibootmgr/Config.in"
> diff --git a/package/dracut/Config.in b/package/dracut/Config.in
> new file mode 100644
> index 0000000000..496b72c105
> --- /dev/null
> +++ b/package/dracut/Config.in
> @@ -0,0 +1 @@
> +source package/dracut/dracut-util/Config.in
> diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
> index af68728457..51e428ea2f 100644
> --- a/package/dracut/Config.in.host
> +++ b/package/dracut/Config.in.host
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_HOST_DRACUT
>   	bool
>   	select BR2_PACKAGE_HOST_KMOD
> +	select BR2_PACKAGE_DRACUT_UTIL # must be included in initramfs
>   	help
>   	  dracut-ng is used to create an initramfs image by
>   	  copying tools and files from an installed system
> diff --git a/package/dracut/dracut-util/Config.in b/package/dracut/dracut-util/Config.in
> new file mode 100644
> index 0000000000..1de35bed40
> --- /dev/null
> +++ b/package/dracut/dracut-util/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_DRACUT_UTIL
> +	bool
> +	help
> +	  dracut-ng is used to create an initramfs image by
> +	  copying tools and files from an installed system
> +	  and combining it with the dracut framework.
> +	  dracut-ng is a drop-in replacement for the legacy
> +	  dracut project.
> +
> +	  This package installs only the dracut-util executable, which
> +	  is needed by many of the Dracut scripts installed into the
> +	  initramfs.
> +
> +	  https://dracut-ng.github.io/dracut/
> diff --git a/package/dracut/dracut-util/dracut-util.hash b/package/dracut/dracut-util/dracut-util.hash
> new file mode 120000
> index 0000000000..22e15cf0aa
> --- /dev/null
> +++ b/package/dracut/dracut-util/dracut-util.hash
> @@ -0,0 +1 @@
> +../dracut.hash
> \ No newline at end of file
> diff --git a/package/dracut/dracut-util/dracut-util.mk b/package/dracut/dracut-util/dracut-util.mk
> new file mode 100644
> index 0000000000..e14e6bc5ad
> --- /dev/null
> +++ b/package/dracut/dracut-util/dracut-util.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# dracut-util
> +#
> +################################################################################
> +
> +# The following assignments work only because dracut.mk is included
> +# before this file is.
> +DRACUT_UTIL_VERSION = $(DRACUT_VERSION)
> +DRACUT_UTIL_SITE = $(DRACUT_SITE)
> +DRACUT_UTIL_LICENSE = $(DRACUT_LICENSE)
> +DRACUT_UTIL_LICENSE_FILES = $(DRACUT_LICENSE_FILES)
> +
> +# share the dracut archive, build only src/util
> +DRACUT_UTIL_SOURCE = dracut-$(DRACUT_VERSION).tar.gz
> +DRACUT_UTIL_DL_SUBDIR = dracut
> +DRACUT_UTIL_SUBDIR = src/util
> +
> +define DRACUT_UTIL_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/src/util/dracut-util $(TARGET_DIR)/usr/bin/dracut-util
> +endef
> +
> +$(eval $(cmake-package))
> diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
> index 0bf755319e..6844ac0b65 100644
> --- a/package/dracut/dracut.mk
> +++ b/package/dracut/dracut.mk
> @@ -51,3 +51,5 @@ HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_BUSYBOX_INIT_MODULE
>   endif
>   
>   $(eval $(host-autotools-package))
> +
> +include package/dracut/dracut-util/dracut-util.mk

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
