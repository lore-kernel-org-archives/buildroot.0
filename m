Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1715C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48F4B60FC1
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48F4B60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B36B60601;
	Sun,  8 Aug 2021 19:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfaYqqZcdV6v; Sun,  8 Aug 2021 19:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C0BD605BA;
	Sun,  8 Aug 2021 19:04:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9931BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C11605BA
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bEsrBiBLQ2wn for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:04:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC5B660591
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:04:50 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id i6so21256012edu.1
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=hubLdBRAtWXqujlNzw+k+3cxomYeI21MsCkNxKEa2P8=;
 b=Y249qYyo1oYx5OgtFIyrcBVboBPO6ipaxZDpH6QM8IiKrlVt94gWiYFbMjziCS1+te
 dKpWj+wpmSgeaLRnS88bxzmfS0T6++ddgIkpKD17PRDayVLNQ+sNHO9MEc4REL7RnNXg
 HlVOPziMEIfqveIejaszRdU7dM/vRmgZwp6r9ThTKLClyI1S51p9Ym/VaNBbDIlZrmT9
 +mLfYNKLUlINYtdVxQuLXkF8v/z68GnpXLwwzRM7te4++SLGrLPrt8eLWr6XdxWUoc7M
 NlUxVjZKijBnKpREExD1xlHwqHoKIgpID24DF4xmdutNkqXg6CSul+npkweZthEp/Vuj
 os3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=hubLdBRAtWXqujlNzw+k+3cxomYeI21MsCkNxKEa2P8=;
 b=GKsVk9ZKOOYtZYwgz4wHHNwO0HBKseXVt7iKYWz3aUf4a9gliJWrPD0/hM6qJgpvsS
 2RGAClil68oMnVLNlKchhDmkk49D4xMbzn0wn75Ef5QNOqkEytFq2WhxHD2YeYKhZ2c5
 3zlQ0Y/cA1jhtnJSU4WtW+lfG5HTWoipFs3wbxxcARU6L/+klu2UdTRRr+rxxPmaX/Pu
 TJ3tNjZDWtsrlKfzRIq/H2qwabOtRgfQ9+y+XE56NrFMFe++9zehRU8lNPOmbwNDAyaf
 5/PiN5nPXFlbr3Ud4Ge86LqKfTtHoLhQ/gZjG2WSi2XukB6Vz4P3bX6RT4tw70eYhkW3
 8TVg==
X-Gm-Message-State: AOAM530f4SKVSvM+gv49/t60UrgfjMc65LRkOWMSdcbj0lxHhwfAFWiY
 OE/Wfajydz8Xggi/qM23JE0=
X-Google-Smtp-Source: ABdhPJyftzXG9g89n7qk9wHl617wx9MkE+sg4NiuKYwgeeH+8MLdg7grPCeCqnYDRDLT9w5fsGWudg==
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr25219454edb.385.1628449489208; 
 Sun, 08 Aug 2021 12:04:49 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id s7sm6976966edu.23.2021.08.08.12.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:04:48 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCo6J-0003Cu-Vd; Sun, 08 Aug 2021 21:04:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210803084245.2740449-1-giulio.benetti@benettiengineering.com>
 <20210803084245.2740449-2-giulio.benetti@benettiengineering.com>
Date: Sun, 08 Aug 2021 21:04:47 +0200
In-Reply-To: <20210803084245.2740449-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 3 Aug 2021 10:42:44 +0200")
Message-ID: <87bl67bvw0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101737
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > pixman package fails to build for the SH4 architecture with optimization
 > enabled with gcc up to 11.1.0:
 > http://autobuild.buildroot.net/results/b20/b20869bbb48edb1f0a847ea9e2e1a0462d6350be/

 > It's been reported upstream:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
