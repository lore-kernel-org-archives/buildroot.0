Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E736AC83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 11:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AF77606A9;
	Tue, 29 Aug 2023 11:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AF77606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHcr_Kbyi5pP; Tue, 29 Aug 2023 11:07:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E541E605E0;
	Tue, 29 Aug 2023 11:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E541E605E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 622021BF42D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 11:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B6C8605E0
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 11:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B6C8605E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhQH67qjeHF0 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 11:07:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AD52605C9
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 11:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AD52605C9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32459240006;
 Tue, 29 Aug 2023 11:07:47 +0000 (UTC)
Date: Tue, 29 Aug 2023 13:07:45 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230829130745.64f9ae5f@windsurf>
In-Reply-To: <ZO2RmRfF1fvQNzyi@waldemar-brodkorb.de>
References: <ZO2RmRfF1fvQNzyi@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693307267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yK5M+0+j/Y6+P+BH/UTOSwJOcyiU/YcMhUFsvm5dKMo=;
 b=ml7gaKJiE9CVTL07H9juR8/9VefTZAOCHHTXX4PMLHqa8GL1Dw5fVCfAoVS5OskukpmSx9
 +cy72Wsp74LkbD+E87li2D79pYm5GI+mB7vbtE3ApaqAg0hx5viTDqHPobI7upF1x9xUF4
 ovco8H0mIFS29Lxg7mlv2mpayDpip7hyDGCa14jjEH8CiDNRvZYZJjKeDfRvMSALoKHjPE
 n86Skrl8ftqNKJUxRZu9xbpxaPna/MwupIJjQ+jSXs8pcRBuQgn7zbV4yg/sA287nRJtwU
 po0K113TR43VnddmbIvBaPboGRoqxZVjqwu/G4wYjjGrrFI+Q6EmAGp2bBPNTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ml7gaKJi
Subject: Re: [Buildroot] [PATCH] package/shellinabox: fix misdetection of
 ptsname_r
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

On Tue, 29 Aug 2023 08:35:05 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Shellinabox configure fails to detect ptsname_r, because of the following warning
> binutils 2.39+ emits:
> ld: warning: some.o: missing .note.GNU-stack section implies executable stack
> ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> 
> Then the build errors out with:
> shellinabox/launcher.c:772:12: error: static declaration of 'ptsname_r' follows non-static declaration
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3e4/3e478d22e820703ddfd11d1491e631ef8ed6b29b
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/shellinabox/shellinabox.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
> index 58c1668112..c48b3db96f 100644
> --- a/package/shellinabox/shellinabox.mk
> +++ b/package/shellinabox/shellinabox.mk
> @@ -30,4 +30,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>  SHELLINABOX_CONF_OPTS += --disable-utmp
>  endif
>  
> +# shellinabox configure check for ptsname_r is failing when
> +# binutils is warning about executable stack
> +SHELLINABOX_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -z noexecstack"

The problem is that this is not affecting just the configure check, it
is also affecting the actual build of the program.

Also, we have a similar issue here:
https://patchwork.ozlabs.org/project/buildroot/patch/20230729103022.378621-1-bernd@kuhls.net/

Can we find a better / more general solution ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
