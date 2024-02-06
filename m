Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53198C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09FCB408D8;
	Tue,  6 Feb 2024 10:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09FCB408D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMZTmZFek59f; Tue,  6 Feb 2024 10:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5DB84050E;
	Tue,  6 Feb 2024 10:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5DB84050E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE3E1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6557881E22
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFDPGt_xUmK4 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA91A81ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA91A81ABA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA91A81ABA
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:13:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24BDC1BF20D;
 Tue,  6 Feb 2024 10:13:49 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:13:48 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240206111348.025e3c12@windsurf>
In-Reply-To: <20240107164400.359352-1-fontaine.fabrice@gmail.com>
References: <20240107164400.359352-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707214429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TvrS6I6LeQFaFI3eTu7maDMees5wLS5Wm7IfH+ZHhgc=;
 b=i7MRq/CDrmpTDlMm6fyQHD7BQtGLDwxTVQaiq9odQpCT+8UENrTvF6L+dZWgO46tZeevRT
 JH3y2wIlGQ4YLPw+U7t00ojeoRHIq1wIl5V2wdvc5gfmmZJEEPHfmjq9EPwVhZEKDbLynl
 8+DJcXlgLp7xlEGZXIuChV9vKdlRcr2uMgJ5QzneFLNERMk966f2MhSJSmZaCwPVDB2Zk5
 ZoHUcJlm5ndaL8Bvz/ae98Ytc5tgYfqtWYCHqjDp+BkeBArfJZrPyzOF1ut2ISxiW8siNH
 0f7MHAjjLUEOoUU21Bva6cGvY15tgkeyaPy06uYAIgHfKs60UU4DlMNhuSkpzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i7MRq/CD
Subject: Re: [Buildroot] [PATCH 1/1] package/rygel: bump to version 0.42.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jan 2024 17:44:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (already in version)
> - Refresh second patch
> - x11 is mandatory since
>   https://gitlab.gnome.org/GNOME/rygel/-/commit/18cd2cff6f64b7a54156ac97e5c4f50eb8fd8d67
>   and upstream doesn't want to make it optional:
>   https://gitlab.gnome.org/GNOME/rygel/-/issues/221
> - This bump will also fix the following build failure raised since bump
>   of gupnp to version 1.6.6 in commit
>   b7938d2ae78ace5bffcf523f06304b27cd4edc0b:
> 
>   ../output-1/build/rygel-0.40.2/meson.build:79:8: ERROR: Dependency "gupnp-1.2" not found, tried pkgconfig and cmake
> 
> https://gitlab.gnome.org/GNOME/rygel/-/blob/rygel-0.42.5/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bdf87468199504384f79e4ab59971776d517296b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |   3 +-
>  ...01-build-Add-man_pages-build-options.patch | 150 ------------------
>  ...meson.build-fix-g_ir_compiler-calls.patch} |  16 +-
>  package/rygel/Config.in                       |   3 +
>  package/rygel/rygel.hash                      |   4 +-
>  package/rygel/rygel.mk                        |   5 +-
>  6 files changed, 17 insertions(+), 164 deletions(-)
>  delete mode 100644 package/rygel/0001-build-Add-man_pages-build-options.patch
>  rename package/rygel/{0002-meson.build-fix-g_ir_compiler-calls.patch => 0001-meson.build-fix-g_ir_compiler-calls.patch} (93%)

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
