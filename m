Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0395C433FE
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 10:07:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1477461102
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 10:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1477461102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B26D5824CB;
	Tue,  7 Sep 2021 10:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0qyBf1AuStK; Tue,  7 Sep 2021 10:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E0081DE0;
	Tue,  7 Sep 2021 10:07:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31C831BF3AA
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 10:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E1C1606F8
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 10:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GoHamZ7WJbRz for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 10:07:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C7A0605D1
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 10:07:35 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id e21so18534204ejz.12
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 03:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ORa6YyXZrmaEiOYkrYvHOPERyfbmr9ogiPNFG1wrQfs=;
 b=cjI8rvwOt4xs+AEDVLmR4t8aOS3l0+6a/By7MRur1OcYNciQ3wUrywgWOkkt53exd3
 ccLaUJxVFjEqzjaMtzune8mzPp27lMBjNxi5YqJLVYSTHIlnmmO/Wkvs/nrKnFTqQzzp
 LrDutbRI0tICHQN6N4gpR7Pa8q+ONumLgs5FNQfcSswFVrfz16gAYmLjoadhESidu2N2
 ZzjM0s9EnNDyzYHskRaCWg4bVcpYAHD+sY0GWf3gq8OmmmW+HkQgHKHB9Ek3oPBMDMBz
 XP0lcU6gf2CfstGMEuQncW+0IVpE3K7X+GHOm53CSM0cvfA5HBrXrcinqI8VH3UqLOts
 U10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ORa6YyXZrmaEiOYkrYvHOPERyfbmr9ogiPNFG1wrQfs=;
 b=LTN9qovZh8xOxwGquai0/Ibh7R4J/u4BHdNeFwT6Ch+i/LvhSAW57g4ErbnyKanN/M
 cEglEnyo8DarKuA8uy8FZ652wJelhVmSn+82EDFdb8qYD0kCMalP720vyz26FFyJOrai
 MgeAFvlo9WUuRDG+NhLScjN757iFi+klxdqkr1rACOLDZDzhacGeWTomd/AWZxYiilA7
 cwwB9bFRg6rsA9QpXLGkpFUbRfKC+cFNlTiR0E32M0/08KiYNOzlKL4jsbRkAzQwA7L3
 5Pup7YbgDG8qGN1OGTK74TgsZ1WmQUFbZCzoCnfCedacKoKx14oBuQmiEH+WEPIhN+0r
 kiug==
X-Gm-Message-State: AOAM533cxENMQs3oXAK1zOBMwbc1SbZ3aDsX3Yfd7v+vXj3jf0sER9pp
 MG116WbjtGL4rGzBbP6DY1Y=
X-Google-Smtp-Source: ABdhPJzdvUSjwzAFaZnZm1X1yBoQDFlDFOSBKBhhGz4T3v/6ILiK8FHdKPt3CuLprxmiP3Jtqv6Grg==
X-Received: by 2002:a17:906:7802:: with SMTP id
 u2mr18111329ejm.325.1631009253200; 
 Tue, 07 Sep 2021 03:07:33 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 s26sm6301235edt.41.2021.09.07.03.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:07:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNY0p-00010r-RB; Tue, 07 Sep 2021 12:07:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Gleb Mazovetskiy <glex.spb@gmail.com>
References: <20210825151659.59671-1-glex.spb@gmail.com>
Date: Tue, 07 Sep 2021 12:07:31 +0200
In-Reply-To: <20210825151659.59671-1-glex.spb@gmail.com> (Gleb Mazovetskiy's
 message of "Wed, 25 Aug 2021 16:16:59 +0100")
Message-ID: <87sfygg0m4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: Fix alsa-plugins
 compatibility
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Gleb" == Gleb Mazovetskiy <glex.spb@gmail.com> writes:

 > Previously, alsa-plugins would not work if alsa-utils was installed
 > after it. This happened because:

 > 1. alsa-plugins copies some files $(TARGET_DIR)/usr/share/alsa/alsa.conf.d
 > 2. alsa-utils removes these files during installation ( rm -rf $(TARGET_DIR)/usr/share/alsa/;)

 > The `rm -rf` command was originally added as part of the fix for
 > https://bugs.buildroot.org/show_bug.cgi?id=1573 11 years ago.

 > The intention might have been to allow for unconfiguring some options
 > and then rebuilding alsa-utils. However, this is a scenario that does
 > not work anyway.

 > The simplest fix for the `alsa-plugins` compatibility issue appears to
 > be to remove the `rm -rf` command.

 > Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
