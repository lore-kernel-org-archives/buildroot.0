Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDC5C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:25:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D98861040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D98861040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0896B402DA;
	Tue,  3 Aug 2021 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZtKLvQTsXfh; Tue,  3 Aug 2021 14:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38756401BD;
	Tue,  3 Aug 2021 14:25:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEFB21BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE9DA60727
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7cBSeyvjUzB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:25:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 643EA60643
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:25:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso1899198wms.0
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=GW7DQ14a3biHcYCcOoHDal7HMvH5NHYbO9ZRNNWvnDs=;
 b=SDlYgjr3R1trqavm9cKI2nFF1ZTbI4eBKHJN9rRYu3Yz7yg/ASJ0WqEX9rUn3xPprS
 zsMVG4j3CMEPRKaa1WXxYUkldrQA0He/Fys5wRmxxjc0LNaZhB+RET5uXp6+goo5sD71
 pjaLkbYGN05hUCI1XrWF6F5wOdW9XfNirRraOvJ2JTfuSyyvl7Le1Py20gergdgfW3N3
 2iMdPC7xp91x8rCXXSwIPdphDSU2a0qFIqoGH1OsWfrXCM16PEwioQ3tWag45Emzww6r
 QyMyLol2eqFk51/3RLDfYeok32ll/wOsrnE8CrlnGH0bRR9yTc8mtmxIVyrKLTcLa8/g
 axVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=GW7DQ14a3biHcYCcOoHDal7HMvH5NHYbO9ZRNNWvnDs=;
 b=Y4SHYibhbzcoIpjS5kXkOHoyLMQleyfvRdjnTmJYDY0wsxAgQfsOGqrR1F7vtL7lXk
 icpyvWR5NHXv4hh/azkMOPX74RXoBjP6mqHU99KNP5qvrQMpe37sMPl7wTAghcbTVsH9
 U4IL/ZTXIk+j+bXBhZGeSxjwWotFVk2TwTTfsTlL6RWksUkycVUT8vqYxVvzjFD/byCb
 Hzsr5ZLMIyPQ4ryzI6QB5XohkSXqzwu9gp9wRT83i3vVmmis08fKT9g5LpNl6zVbaWN0
 uOdaFS/sP9z3K/C8UZrw/JYC+DMzEkN8H+o2AqEheX5zYGumEdFkg8Sxg6bQf4fs2/uF
 kC5Q==
X-Gm-Message-State: AOAM5319EMCkXSgeCOV+gaZN3qRSqwf0tocRf+/3dCZ3msI4Th3lQT2n
 uzv3QM2AdfHqPRiyxNS9SVo=
X-Google-Smtp-Source: ABdhPJzLlyXr/gG0NivF7wco/QbWIyz7R76xdTtWUuR+r+LD2CR2vAHmzLmC8lEfMOtg6MHipqjlYA==
X-Received: by 2002:a1c:a94f:: with SMTP id s76mr4399952wme.17.1628000733540; 
 Tue, 03 Aug 2021 07:25:33 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id a12sm14706191wrr.84.2021.08.03.07.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:25:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvMJ-0001l2-PF; Tue, 03 Aug 2021 16:25:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210706091500.3236-1-heiko.thiery@gmail.com>
 <20210716233058.26b0ed6c@windsurf>
Date: Tue, 03 Aug 2021 16:25:31 +0200
In-Reply-To: <20210716233058.26b0ed6c@windsurf> (Thomas Petazzoni's message of
 "Fri, 16 Jul 2021 23:30:58 +0200")
Message-ID: <87bl6ey59g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/linuxptp: security bump version to
 3.1.1
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org,
 Petr Kulhavy <brain@jikos.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue,  6 Jul 2021 11:15:01 +0200
 > Heiko Thiery <heiko.thiery@gmail.com> wrote:

 >> This fixes the following CVEs:
 >> - CVE-2021-3570 linuxptp: missing length check of forwarded messages
 >> - CVE-2021-3571 linuxptp: wrong length of one-step follow-up in transparent clock
 >> 
 >> See mailing list post for details:
 >> https://sourceforge.net/p/linuxptp/mailman/message/37315519/
 >> 
 >> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 >> ---
 >> package/linuxptp/linuxptp.hash | 8 ++++----
 >> package/linuxptp/linuxptp.mk   | 2 +-
 >> 2 files changed, 5 insertions(+), 5 deletions(-)

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
