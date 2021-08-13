Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF643C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 11:31:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7062A61038
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 11:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7062A61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F0C6060F;
	Fri, 13 Aug 2021 11:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fn5a5eB13kS; Fri, 13 Aug 2021 11:30:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43BB66063C;
	Fri, 13 Aug 2021 11:30:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88F131BF2AB
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 11:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7575B4016B
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 11:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_C8oR3hOh96 for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 11:30:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C03634012A
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 11:30:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3581DE000B;
 Fri, 13 Aug 2021 11:30:47 +0000 (UTC)
Date: Fri, 13 Aug 2021 13:30:45 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210813133045.03e4e6a9@windsurf>
In-Reply-To: <20210809223547.2961300-1-fontaine.fabrice@gmail.com>
References: <20210809223547.2961300-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 exec_prefix
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 10 Aug 2021 00:35:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> exec_prefix has been removed since version 1.66 and
> https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a88b1ac548516ab25140a2e9dea8cac894bbac93
> resulting in the following build failure with rygel because libgee
> installs Gee-0.8.gir in
> output/host/aarch64-buildroot-linux-gnu/sysroot/share/gir-1.0/Gee-0.8.gir
> instead of
> output/host/aarch64-buildroot-linux-gnu/sysroot/usr/share/gir-1.0/Gee-0.8.gir:
> 
> Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or use --includedir
> error parsing file RygelCore-2.6.gir: Failed to parse included gir Gee-0.8
> If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
> Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
> 
> So replace exec_prefix by prefix
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b04b27bbb84fa6ab9a8441e7bd94aad45226dce9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gobject-introspection/gobject-introspection.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
