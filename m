Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF18C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:25:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D65A611C8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D65A611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 046A983183;
	Sun, 19 Sep 2021 11:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TjJ3ctuITAt; Sun, 19 Sep 2021 11:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5A0830E6;
	Sun, 19 Sep 2021 11:25:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C611F1BF2BF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF14A4024B
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7i-iAg4i0NCQ for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:25:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0401B4024A
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:25:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A3D982003CA;
 Sun, 19 Sep 2021 13:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632050699;
 bh=5kVz141h+HmTlpy0Vq37AfAPUo9FSmV4zg9Ebr10yw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QJ/eYcSu4enePu5tiTJF7h4otJMxkCXXN3Y/6h4Hjge1jF913zn3DToPmPYbxzJtE
 X4YV8q7SP6UX5BWAfZcMxoYbJFlmer8orZ6kWm0kzjsq6UxcRRmwGKP65442yDslWS
 9bmo08RtEFR1VHU0ZBJQ12BYtWzOObFt66/jHp+78hV76dQlRJQdW0kxTRVU81NzPe
 aH76N1FMO1F3zVoYpCLTcGyB0oDdp6/wV6sPgYf6pnJOukqrIgHEoMW1JZ3TIeMA2w
 5CSfO1bPiI4LCQTudJUxNlT7OzaxDRb1D9C6qERoSvmKHbdXl8DmXBxe9+woB1IPdo
 V1sF7LEUiixRA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 13:24:53 +0200
Date: Sun, 19 Sep 2021 13:24:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919112453.GP1053080@scaer>
References: <20210919093901.1873403-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919093901.1873403-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/wayland-protocols: fix build without host-wayland
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-19 11:39 +0200, Fabrice Fontaine spake thusly:
> Don't require wayland-scanner if tests are disabled to avoid the
> following build failure raised since bump to version 1.23 in commit
> 7eedc9cc1e0c3cce1c18cb150157cb2346075b23:
> 
> Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)
> 
> ../output-1/build/wayland-protocols-1.23/meson.build:11:0: ERROR: Dependency "wayland-scanner" not found, tried pkgconfig and cmake
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2744e50465a9cd9d3726d23298ad6c943ef49a21
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3 (after review of Yann E. Morin):
>  - Remove host-wayland dependency which is only needed for tests
> 
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Use host-wayland dependency instead of wayland
> 
>  ...and-scanner-is-only-needed-for-tests.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
> 
> diff --git a/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch b/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
> new file mode 100644
> index 0000000000..ff3ec5719c
> --- /dev/null
> +++ b/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
> @@ -0,0 +1,42 @@
> +From 80e97bd00bf6263845aa98b411507baba28be67e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 19 Sep 2021 11:01:00 +0200
> +Subject: [PATCH] meson.build: wayland-scanner is only needed for tests
> +
> +wayland-scanner is only needed for tests so don't require it if tests
> +are disabled
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://gitlab.freedesktop.org/wayland/wayland-protocols/-/commit/80e97bd00bf6263845aa98b411507baba28be67e]
> +---
> + meson.build       | 2 --
> + tests/meson.build | 1 +
> + 2 files changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 94b49e7..15dbc37 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -8,8 +8,6 @@ wayland_protocols_version = meson.project_version()
> + 
> + fs = import('fs')
> + 
> +-dep_scanner = dependency('wayland-scanner', native: true)
> +-
> + stable_protocols = [
> + 	'presentation-time',
> + 	'viewporter',
> +diff --git a/tests/meson.build b/tests/meson.build
> +index 66337e7..74824ae 100644
> +--- a/tests/meson.build
> ++++ b/tests/meson.build
> +@@ -1,4 +1,5 @@
> + prog_scan_sh = find_program('scan.sh')
> ++dep_scanner = dependency('wayland-scanner', native: true)
> + prog_scanner = find_program(dep_scanner.get_pkgconfig_variable('wayland_scanner'))
> + 
> + libwayland = [
> +-- 
> +GitLab
> +
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
