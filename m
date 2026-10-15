Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BE0CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3A960ECC;
	Fri, 16 Oct 2026 13:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id u1QeqasQGZw4; Fri, 16 Oct 2026 13:11:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1ED396115B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156314;
	b=mvSsNlCq6yCU2SeM68/kPo9INPtXoobnrpXaA22b8wXjB4+RqND+21kHLwoSfe9pdZ/t
	 DeifH39fgbvU/MZjdfPDeItMGRlvUxDfRuRemkbIwlWlUWL32EmUbAW6arJUyxZSa1ffz
	 xR1m3zhZziggSV8HIZT0mgfcw3eQo3gT4urUV9bnKx9wEMjQRpxAmC0qUg38Un+1RUZhT
	 Vl7lXJ7SiUiCq4QtBSsG5J1G3hBVkMZJCjoYmlb81ARO4cE5fitFHL2jzzG6jNp1VZBN6
	 LoTnwyC0AUmYfT3BAukS8QZmhknNyJX2bEen/pnNeOklfsIGShyOuvrKi31EUf1CeeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=il3NXIuJSxtmAlMVzK+RbguzJ3Y5YcHJHlPSTfdElro=;
	b=o+vZ833E4r6DLekK6EeJw6B/I91Mip5OYi9P1awY6H5qCITFFWAf/ZayTI6rCKCX3tm6
	 DzISRiTqgtTlULYvt7FL5EckQDyIMX9sZ9HiqSxVKOW4KLfeBJhP0cgYIsvn3RxNijWF0
	 4bNJYiD0pQo2PgYOgTM47L+wFo8eCbQ+jnLJ0nC4HRcI21AQ7BWVuMlr3ifLNAx7HHkT4
	 vPQnqnblvN2EXhDjg24DVdJFGnjQuH7jitrlwt8EynLN9FianorpA8kp2kzFoDwIIhc7L
	 MR1T8pIeqQDkPClso/af4WM/I6B7Wuk8CgzV8VdJM7ObZH7/waT3zRGgyOrLUX1PXlw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156314;
	bh=il3NXIuJSxtmAlMVzK+RbguzJ3Y5YcHJHlPSTfdElro=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TrAWUFP9Zvbk0/Cuz2f2GOqPUGb26vSV8vx5gneDzFxfy0AroHw2iTQpOxoEDntAq
	 Tu1PEI0F/6lrR8K70otZwP0T69a3KEiYAEyAfIOcCDY8Uzwlla0dBxQJmETWRD2fb0
	 kzrOKu25HeLukBT7bBN66PaqAcfLZKY7mevKwEB6imtV9G8bvPeFKXUEROsDTKqG1i
	 fqWqU2UrePGhahs+P/OXqcYZDrTyr4XYo1239yMdppmzjuGvOVwX+zaQmy9z9VCgGB
	 RU7fwOKD7/qcOkkxrWSil8RLwrF2m6YbhS22f6wNxsKPZxy/MNo2MICjv85TZ3tpkQ
	 I8DDx+8ZgwJ7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED396115B;
	Fri, 16 Oct 2026 13:11:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D03F105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 582A64016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBvV1tBmpUp8 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AD76C40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=L2b1ZfnRE4WJxurLJ8TPjQtFbRE73PJBcYNpEaCLkA2axQDzuck0kU0ssQe/ZUWoAB4c
 58re6JmrGhS+zT581f0We+NIw/Aq11brHyLRVsJvz37W736CWpSjK/hb/A2jwtzujNOjd
 pXRJ626PtsDg1ZvohO8rUiEAHpTngF6soyGkq/WDkt7oc1IgC4sQMAwgiTi6LU0SRHqma
 hk1mEEO0RkZrHtPcFKKGr2B3ALPZWGokXfP3KYs5xgFCxcoDIPgo9grO/6kHk+43vd5bl
 HWxo7BRG8cwwmiPFUFizHrkLAtf26KahqReEXlzBagO//Q4rfPnDaBB3XqVkhxQ2rvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DjiBLdk7umxgM7w73tTkarmSqpGbYVQrEKq2pjhy+ag=;
 b=DG57EObeI+s3bbvg59UjD+ASSGzA4/L+ZAlz6eays2xS4pIPO+Z2fm+yf0RjRhPYGQX1
 pXBwZ8gbxWdSxfFUr9pC1hy6h+by6vIOJ11Au0+yHj9r8AQpyNoCoGXsPL55XLUk7TITn
 K7Pk1RvX/66rUOlmkDNHlNp/hAu+is/Fv+TPnlNmjBgsHe83bXxV89DaGCb3SE19z9Wty
 p1+E/9EU7KdGZC/TNDpkrPpfTPeLNJiezUHV/DHgHOgOlWr9ONnvl0Ze5/mAM5mpUEgkg
 oiMrKy/9XZWRi155YdQaJSBMuOGMh25kTSoFN/oSh7SG3vMpwmYg29XrOK/dup8ND+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD76C40042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DAC3960CF; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:53:28 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ede00e3bb21c734c7955dc5d4612164d8cc4a776
X-Git-Newrev: a9295cc3e4028ac46840fc209eb6f2be9d9f7cab
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.9DAC3960CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] linux: always select
 host-uboot-tools for mips
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7052195672277626898=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7052195672277626898==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9295cc3e4028ac46840fc209eb6f2be9d9f7cab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since Buildroot commit 40e266ccb9 [1], host-uboot-tools was always selected
for the latest Linux kernel. This change is intended for autobuilders, and
was introduced in Buildroot while the latest kernel was 6.12.

However, further investigation seem to indicate that itb images were
generated for mips for a much longer time. Linux commit eed0eabd12 [2]
seem to enable that image format, and was released in Linux 4.9.

This version being EOL for quite some time, we can therefore assume
any "not so old" Linux for mips will need host-uboot-tools to finalize
this image, and therefore we should select it when building Linux.

[1] linux: select host-uboot-tools with FIT on mips
    https://gitlab.com/buildroot.org/buildroot/-/commit/40e266ccb9
[2] MIPS: generic: Introduce generic DT-based board support
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eed0eabd12ef061821cbfa20d903476e07645320

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0f7c08d8fb36e6e12522ce6f8012c91ace520204)
[raphael: resolve conflicts]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 401f2828cb..de1ad9b9a9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -4,6 +4,9 @@ config BR2_LINUX_KERNEL
 	bool "Linux Kernel"
 	select BR2_PACKAGE_HOST_KMOD # Unconditional, even if modules not enabled
 	select BR2_PACKAGE_HOST_IMAGEMAGICK if BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH != ""
+	# mips always generates an ITB image
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	help
 	  Enable this option if you want to build a Linux kernel for
 	  your embedded device
@@ -32,9 +35,6 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (7.1)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1 if BR2_KERNEL_HEADERS_AS_KERNEL
-	# mips always generates an ITB image
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.254-cip72)"

--===============7052195672277626898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7052195672277626898==--
