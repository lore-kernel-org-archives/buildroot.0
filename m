Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8B3C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61AF3406A4;
	Mon,  8 Jul 2024 22:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kqu9Zyh_5EUc; Mon,  8 Jul 2024 22:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73619406BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73619406BD;
	Mon,  8 Jul 2024 22:01:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FD741BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69988812E9
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZ1aJHbuV--5 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2360A812EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2360A812EE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2360A812EE
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:01:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F17320002;
 Mon,  8 Jul 2024 22:01:04 +0000 (UTC)
Date: Tue, 9 Jul 2024 00:01:03 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240709000103.5b81f566@windsurf>
In-Reply-To: <20240704130522.145701-1-ju.o@free.fr>
References: <20240704130522.145701-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720476064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctFk+QJFKI3gV8OrHrlyQVa5pZsv+ZgGgmpV2sANHfI=;
 b=iMYGPhlO1FEF1O46EnvDlF4FQQrjGpnCFEZ97k9oEWYk8YtzMM2O5VNJXmg97M2/YWtbgt
 y5Xu1Ge9xOZXqkbGxas4rRcpGF03fJPBNG0QnvW44Nttbi/5HKwiYTkG/CxS2kaupHmwsY
 zQJBPNnbT539PT9fMXU+NOyhvvOMxhIOj+P6XvlxLACYPujZXU6leR8VW39yZdtWxAVRld
 COtMV+cCPcQuwu37jJ2dc5H4sznW2hERnGSrCWkMHnI1l986L2sKk3dALDzxWd4vAp9UrW
 W+FWQIxQiZcUmHxXJq/dEqd9gvO3mBcImTFU7Fsjb1Qpt9HPAtQDy8gRtj11aA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iMYGPhlO
Subject: Re: [Buildroot] [PATCH 1/1] package/wlroots: update the patches to
 be applied with fuzz 0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Jul 2024 15:05:22 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, wlroots fails to build with output:
> 
>     Applying 0001-Add-feature-macros-to-more-C-files-.patch using patch:
>     patching file backend/wayland/output.c
>     patching file types/data_device/wlr_data_device.c
>     patching file types/data_device/wlr_drag.c
>     patching file types/wlr_export_dmabuf_v1.c
>     patching file types/wlr_idle.c
>     patching file types/wlr_keyboard_shortcuts_inhibit_v1.c
>     Hunk #1 FAILED at 1.
>     1 out of 1 hunk FAILED -- saving rejects to file types/wlr_keyboard_shortcuts_inhibit_v1.c.rej
>     patching file types/wlr_pointer_constraints_v1.c
>     patching file types/wlr_primary_selection.c
>     patching file types/wlr_relative_pointer_v1.c
>     patching file types/wlr_screencopy_v1.c
>     patching file types/wlr_virtual_pointer_v1.c
>     Hunk #1 FAILED at 1.
>     1 out of 1 hunk FAILED -- saving rejects to file types/wlr_virtual_pointer_v1.c.rej
>     patching file types/wlr_xdg_decoration_v1.c
>     patching file types/xdg_shell/wlr_xdg_popup.c
>     patching file types/xdg_shell/wlr_xdg_positioner.c
>     Hunk #1 FAILED at 1.
>     1 out of 1 hunk FAILED -- saving rejects to file types/xdg_shell/wlr_xdg_positioner.c.rej
>     patching file types/xdg_shell/wlr_xdg_shell.c
>     patching file types/xdg_shell/wlr_xdg_surface.c
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...-Add-feature-macros-to-more-C-files.patch} | 45 ++++++++++---------
>  1 file changed, 25 insertions(+), 20 deletions(-)
>  rename package/wlroots/{0001-Add-feature-macros-to-more-C-files-.patch => 0001-Add-feature-macros-to-more-C-files.patch} (87%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
