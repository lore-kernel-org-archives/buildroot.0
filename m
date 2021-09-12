Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3118C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:21:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA87E60EE0
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA87E60EE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9766860BFB;
	Sun, 12 Sep 2021 20:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hygPy1Id-0GS; Sun, 12 Sep 2021 20:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CED260BE8;
	Sun, 12 Sep 2021 20:21:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCADD1BF404
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C97E44046A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12-eHIwALs3E for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:17:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E2DC40458
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:17:39 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jg16so16355921ejc.1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 13:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ui/s6br9u98rbg/JHTFYLzMgLIsjnGxUX67oP2T3+r4=;
 b=mLd4LIoe10nP5PCH84vwuksGLtHNMtMnvykUwjYr69fz4U47tiUEyzzpB/7ofgTKhR
 2DlrFocEn/ZqFOQqqnLACgk4R4B3lEy/77wFJ+ZFRkaaet39Oh62Dwuom2kDOmNXI1jx
 pEFaL0RZhZGRGI54sjRR2UY6+CXpPd7NJDMdKGyzgZIqIm25/48TD0uJRXBGICIaaBBY
 uMmnIlo03OveiIsUrL7Bhrh5xJf6j4oEtIMUQK8oeiDHoyMAYEVlXsYr6fe8xlI4sy48
 U15CPlPgozX0fv1eAMja0jhGJjYg5sng5KkHN8foXtqgo0EuLqLhXIpKbOBhQht94SR0
 uLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ui/s6br9u98rbg/JHTFYLzMgLIsjnGxUX67oP2T3+r4=;
 b=Vi+MPxmvpqXbo3/3jMEVimCpPtMdDoDke1ycUrxbyCO1X/fgsDdowhqHY76lEc3yhe
 ya2OvGgPnsuUNzvo5Fl3QjP6GmG3NlDydnoNfwhReupgEUhXnUI3Mc9IIsuT99sJDo//
 Q1jb/WSy5s9+IeOJvFhIDEDii3z2I2gi6NT9s63dhHkgnjDmCxDbb7HgNxjaoh4HHEwa
 O+ScU00EX9+8r+eFq46c1wZtbRDR2tGvD2tolrS6eYpnsw+kQuiXPAsp/WV1LKJqwD+t
 eSO6Bl1edf0w6traYpdz49Ta5Rw0RQ7v/+6CI7L4NiBvGpnFotPOcMdYf4W7Q7ZfuHBH
 5Hmg==
X-Gm-Message-State: AOAM532vVqE+YT1GM9n3rFSyYL8vLOiIt5oyBHi4a5u1nZwLp/pOl8hK
 oS/SZyOIO1G3Sya6kDLR0Vg=
X-Google-Smtp-Source: ABdhPJxC5OjH2slWeQxeeVyNx4+tDt2QkS+Fzgv/EWFqGm7zDZiAUrk0+7kS//7KA24nKmFqubZ46Q==
X-Received: by 2002:a17:907:96a2:: with SMTP id
 hd34mr9263549ejc.113.1631477857379; 
 Sun, 12 Sep 2021 13:17:37 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 t1sm2779812edq.31.2021.09.12.13.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:17:36 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPVux-0006U2-UT; Sun, 12 Sep 2021 22:17:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
 <20210829024632.682029-2-james.hilliard1@gmail.com>
Date: Sun, 12 Sep 2021 22:17:35 +0200
In-Reply-To: <20210829024632.682029-2-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 28 Aug 2021 20:46:26 -0600")
Message-ID: <87zgsh1rc0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/8] package/swupdate: don't require
 website for services
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > The swupdate services do not depend on
 > BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE, so install them unconditionally.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
