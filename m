Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD11CDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 18:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5114404C3;
	Sat, 14 Oct 2023 18:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5114404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHjqrjVo-s-f; Sat, 14 Oct 2023 18:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A777540A45;
	Sat, 14 Oct 2023 18:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A777540A45
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F22E11BF2C1
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 18:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7C4E61122
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 18:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7C4E61122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jw7g7xamW0Rc for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 18:15:44 +0000 (UTC)
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 628BB60671
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 18:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 628BB60671
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7E7E7440855;
 Sat, 14 Oct 2023 21:15:15 +0300 (IDT)
References: <20231013184554.337101-1-bernd@kuhls.net>
 <20231013184554.337101-3-bernd@kuhls.net>
User-agent: mu4e 1.9.21; emacs 29.1
To: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 14 Oct 2023 21:13:52 +0300
In-reply-to: <20231013184554.337101-3-bernd@kuhls.net>
Message-ID: <87a5sl2hpy.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1697307315;
 bh=6TaoXlyEBlPBfl0JCaayQ1shKR70Utkmhh32Jdi/f7o=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=lten1eLK+qpuYtzQitg6E+BNn38xuWpyZwnzlXyQHd2jZcJS9s/+DjB6d+9Iyg0Ep
 fLZrEY1AyIO0jqKsOiiFYduEXN9ddlkLZAfxctb5nhBUf37u+pA6X9o6FQRLzy+HZF
 6/d5gZljO33RQ5J4GaUPHrFmtSqWxGSQR/qs99aV9kuubo2HUFXamJzAyyaN4qfEwT
 uP9YPS6sEQv2OYrW7F9VyT7eH1AzAuVElDtzLa32LzM5E8+IWYIsQZCKQX3zxlGa1e
 D+WIAcnpNN8X7ynKjjQRx3YVXAUvfj5uvJjKtinxI1i5ItbVZvPZv5VWWEO2zv75TD
 lFAJEdbf6mYJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=lten1eLK
Subject: Re: [Buildroot] [PATCH 3/4] package/alsa-utils: Fix musl build
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Fri, Oct 13 2023, Bernd Kuhls wrote:

> Fixes:
> http://autobuild.buildroot.net/results/bce/bce46fd8aab9ef4918228e8cfc5f8b5abe71e859/
>
> This musl-related autobuilder error occured when building alsa-lib and
> is fixed by
> https://patchwork.ozlabs.org/project/buildroot/patch/20230927052204.231589-1-bernd@kuhls.net/
>
> When continuing the build of this defconfig we see a build error with
> alsa-utils which is fixed by this patch.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0009-topology-include-locale.h.patch      | 33 +++++++++++++++++++
>  ...nhlt-dmic-info.c-include-sys-types.h.patch | 33 +++++++++++++++++++
>  package/alsa-utils/Config.in                  |  1 +
>  3 files changed, 67 insertions(+)
>  create mode 100644 package/alsa-utils/0009-topology-include-locale.h.patch
>  create mode 100644 package/alsa-utils/0010-nhlt-dmic-info.c-include-sys-types.h.patch

[...]

> diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
> index 3429d0b406..be222501b9 100644
> --- a/package/alsa-utils/Config.in
> +++ b/package/alsa-utils/Config.in
> @@ -65,6 +65,7 @@ config BR2_PACKAGE_ALSA_UTILS_APLAY
>  
>  config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
>  	bool "aplaymidi"
> +	select BR2_PACKAGE_ALSA_LIB_RAWMIDI

Is this related to the musl build fix?

baruch

>  	select BR2_PACKAGE_ALSA_LIB_SEQ
>  
>  config BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
