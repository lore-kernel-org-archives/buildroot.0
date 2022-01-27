Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DEEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 10:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB44D60A6F;
	Thu, 27 Jan 2022 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Adt9JtiMlSxA; Thu, 27 Jan 2022 10:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28E2F60F3D;
	Thu, 27 Jan 2022 10:34:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6981BF421
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 10:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F00A060F3D
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 10:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUsg16t5dfXE for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 10:34:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from studio-punkt.com (studio-punkt.com [37.221.193.131])
 by smtp3.osuosl.org (Postfix) with ESMTP id D470B60A6F
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 10:34:45 +0000 (UTC)
Received: from localhost (pd9e2b73d.dip0.t-ipconnect.de [217.226.183.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (No client certificate requested)
 by studio-punkt.com (Postfix) with ESMTPSA id BE568121969;
 Thu, 27 Jan 2022 11:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio-punkt.com;
 s=dkim; t=1643279684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Jxb8np+zb8CsJc58c7JoKm5uE9G7R9hWfG3ZLn9Ysw=;
 b=iIny8pBTUelinocgfA751SeAbg5eGJRZMqYjZtNHm97f91zI3OX/wrVpUYsuoBl0jphDPM
 uQsdV8JzVwQzIJXSzAkUXTqSozYtTCSttlTn6H3An7SFTP0K1EqWgLWYZyxuJWXUilAFIk
 FOBCWVXouv0sqQ6D+6HlyEuF4nwXVJ8=
Date: Thu, 27 Jan 2022 11:34:39 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YfJ1ONOCVVlA5JC7@anne>
References: <20220124104116.12902-1-evgeni@studio-punkt.com>
 <20220124104116.12902-2-evgeni@studio-punkt.com>
 <20220126221708.GK457876@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126221708.GK457876@scaer>
X-PGP-Key: https://evgeni.studio-punkt.com/pub.asc
Subject: Re: [Buildroot] [PATCH 1/1] fs: fix /tmp and /run clean-up in POSIX
 shells
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
From: Evgeni Dobrev via buildroot <buildroot@buildroot.org>
Reply-To: Evgeni Dobrev <evgeni@studio-punkt.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

indeed the support for [^] vs [!] is more complicated than I thought
initially ( see "Rationale" under https://github.com/koalaman/shellcheck/wiki/SC3026 ).

Would the following be a bad idea:

echo "find $$(TARGET_DIR)/run $$(TARGET_DIR)/tmp -mindepth 1 -delete" >> $$(FAKEROOT_SCRIPT)

- it avoids the glob support complication
- it is shorter

Regards,

Evgeni



On Wed, Jan 26, 2022 at 11:17:08PM +0100, Yann E. MORIN wrote:
> Evgeni, All,
> 
> On 2022-01-24 11:41 +0100, Evgeni Dobrev via buildroot spake thusly:
> > In POSIX sh, ^ in place of ! in glob bracket expressions
> > is undefined.
> > 
> > Signed-off-by: Evgeni Dobrev <evgeni@studio-punkt.com>
> > ---
> >  fs/common.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/common.mk b/fs/common.mk
> > index 45beb5ae7b..64a94d9ad8 100644
> > --- a/fs/common.mk
> > +++ b/fs/common.mk
> > @@ -186,7 +186,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
> >  
> >  	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
> >  		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
> > -	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
> > +	echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[!.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[!.]*" >> $$(FAKEROOT_SCRIPT)
> 
> TIL that bracket expressions are actually valid and specified by POSIX.
> 
> But we do guarantee that we do have bash as a shell when running
> Buildroot, so I think it is fair to also run the fs script with bash:
> 
> 
>     diff --git a/fs/common.mk b/fs/common.mk
>     index 45beb5ae7b..f8a6da6bc4 100644
>     --- a/fs/common.mk
>     +++ b/fs/common.mk
>     @@ -172,7 +172,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
>      		$$(BASE_TARGET_DIR)/ \
>      		$$(TARGET_DIR)
>      
>     -	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
>     +	echo '#!$(SHELL)' > $$(FAKEROOT_SCRIPT)
>      	echo "set -e" >> $$(FAKEROOT_SCRIPT)
>      
>      	echo "chown -h -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
> 
> However, $(SHELL) is not always correct, so we'd probably need:
> 
>     diff --git a/Makefile b/Makefile
>     index 5fc7137e5a..bb9955f5b6 100644
>     --- a/Makefile
>     +++ b/Makefile
>     @@ -30,7 +30,7 @@
>      # we want bash as shell
>      SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>      	 else if [ -x /bin/bash ]; then echo /bin/bash; \
>     -	 else echo sh; fi; fi)
>     +	 else which sh; fi; fi)
>      
>      # Set O variable if not already done on the command line;
>      # or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
> 
> But in the end this is quite more changes than what you propose.
> 
> Can we also shorten the command?
> 
>     echo "rm -rf $$(TARGET_DIR)/{run,tmp}/* $$(TARGET_DIR)/{run,tmp}/.[!.]*" >> $$(FAKEROOT_SCRIPT)
> 
> Regards,
> Yann E. MORIN.
> 
> >  	$$(call PRINTF,$$(ROOTFS_REPRODUCIBLE)) >> $$(FAKEROOT_SCRIPT)
> >  	$$(call PRINTF,$$(ROOTFS_SELINUX)) >> $$(FAKEROOT_SCRIPT)
> >  	$$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
> > -- 
> > 2.34.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
