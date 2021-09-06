Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2F3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 10:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2759160E52
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 10:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2759160E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C37FD8176D;
	Mon,  6 Sep 2021 10:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6tJgvTbxIS8s; Mon,  6 Sep 2021 10:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28B1B81067;
	Mon,  6 Sep 2021 10:38:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6319B1BF308
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 10:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51B2740279
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 10:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9lZ8NPwIOZo for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 10:38:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41FB2401C4
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 10:38:26 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id mf2so12575385ejb.9
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 03:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=furXRV3fag304MqEsmTBZ71RIhjfRy93D7CXC3tsMsE=;
 b=LCIblXStBX6okdqDUCfKguU1KxbVaQR8mkXIXZy8hRJdgcEeO/WtpnzviYtKkf8luO
 iDDCp9TtXJ1uEjonGB277uwDiH6T4Og09UpQCRY1safyi6z9sklomEx8jZCJPK8230Rw
 ozCHr18IXvBGnACLKxjdqIqDkhav/olQijnYqpM258t6f7qIIBti4gCfP1P9PogHeBKN
 N61xUrfXIXUqY5HE3NXj1o7rK0gtBM8KMuD9hTn8dFnls18o1cVngi6MLBII1xyXnL8P
 YakxEMB6lwBTyOhgH14D7KssU9yh7xpOGUG85ibPcvaRVvSBqwVLpYynUv/ZDnhUdA2H
 mNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=furXRV3fag304MqEsmTBZ71RIhjfRy93D7CXC3tsMsE=;
 b=Cm5fsQ81F2zK4M12J8lVDzK4UEBCK3Vp+5sYvSxP4h/AKPKdHR0591n2fU+Rmdf57P
 fy6grVwnMiICplBjJ7KpP2KjvOjU57Nm28uF7JNnTwdcMZzMeiKVrF9oLAADQiovI0+p
 C9spGEPkzD8eVZDppBrE7nEFFYOVfzoUFgf8A2bnmw0rHcgL3ZNPHP10KVxl0QKUPT2x
 +36+vgnZJqDupnhtspYBPI+g6BnGt2wW4oqtvKq6J6aB4sVRveVq3da11898qtmgjBU4
 Lx7VPKT+ZAJ84/zDUWEaUePgLKy8rcH5P08zhuv4h6VP2D6sASsAJKBxIUbCHJ2XlbHa
 0s/A==
X-Gm-Message-State: AOAM533fZyznlk0cj5dXbrXJdwXEbDv9m/4xSekLKN2UqAxLAQGWkG5l
 X8d+7Nb1Xn0fjvDSf5DwgRw=
X-Google-Smtp-Source: ABdhPJxBTpnixZ7bu/RwAosJZXhb6TWNHU931UU4m4Riu3ZG5YOIE8DJLipfeqUGmJW/hepvEn6thg==
X-Received: by 2002:a17:906:4482:: with SMTP id
 y2mr12767606ejo.484.1630924704485; 
 Mon, 06 Sep 2021 03:38:24 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 j14sm4488149edk.7.2021.09.06.03.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 03:38:23 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNC18-0005ts-Lt; Mon, 06 Sep 2021 12:38:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20210813043555.35590-1-bernd.kuhls@t-online.de>
 <0cbfac17-a762-50ee-9d1a-eba90ba9ca2f@mind.be>
Date: Mon, 06 Sep 2021 12:38:22 +0200
In-Reply-To: <0cbfac17-a762-50ee-9d1a-eba90ba9ca2f@mind.be> (Arnout
 Vandecappelle's message of "Tue, 17 Aug 2021 23:23:49 +0200")
Message-ID: <87zgsqj8f5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 13.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Peter Seiderer <ps.report@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 13/08/2021 06:35, Bernd Kuhls wrote:
 >> Release notes:
 >> https://www.postgresql.org/about/news/postgresql-134-128-1113-1018-9623-and-14-beta-3-released-2277/
 >> 
 >> Fixes CVE-2021-3677:
 >> https://www.postgresql.org/support/security/CVE-2021-3677/

 >  There's *quite* a bit more in that release than the CVE fix, but it looks like
 > bugfixes only. So applied to master, thanks.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
