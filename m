Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F730C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:23:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D8C60EEA
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0D8C60EEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B38D83BEA;
	Wed,  4 Aug 2021 20:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKu5knGfF_LI; Wed,  4 Aug 2021 20:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C750483BD4;
	Wed,  4 Aug 2021 20:23:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C58AD1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B458383BD4
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3i_ejHUWf-N for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:23:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B096D83BC7
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:23:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z4so3568539wrv.11
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=/PhVe/8228wvGQ9iwmLq8xKVmCqwlAiiAx6+0Cm8dsE=;
 b=pChEDaE6CL8OWLPeF6shLIMm2+HaFCngB1BJW7KCJs9ETjjeWwZg6XRZldkQ9mdf3i
 rfVxPbINguE/xwKN+1SYzLUblZIn+PxguHYcS6kLhSiDpzZXrA9Mxaer+lkvCpNxDD97
 9B3VAOJQng+KAJMfSItliFtyFJ4BYvwrbnYyy6OwSNQVKUkQRTTHbGH3GdQJM0/ffSdr
 2N34+5oOYEdx9nDFfTFfwIvZqExHNMaAX0jpcDQP+/kKInShx3NBXCCP+OPj7ypbavcG
 v+/a8KXzW2me4oLjXNWJ+O2eM7oIyL4VTFMI64lnY8R991wVnmzexrAabcWjx129pOfu
 jg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=/PhVe/8228wvGQ9iwmLq8xKVmCqwlAiiAx6+0Cm8dsE=;
 b=TNp9/gONNdl/DvB2WzxFjDTBQdYwqI6ZfA5S/AJID7XO3+r6/fFjR2ZxivMuy1Q7Kg
 wNuy8aokp0hQyGQx8dCN0s8yziJf6LgC6O2R+smPLTSqjQ939EW1xRlVdQH0mKNZ4LkH
 MaEwu514AEqxVemtofNYIKZ4MhnBVHFEoj0dbWxlkBkr/NQk6GvUfyj+hHyghgG8aiZA
 QjRPF96OPpIpGLq06mjUmn8hRuArt1BKdcpnwJQjdpsoTk9eDezxRp8kALd3wF2I2Uu2
 OPmgh9+VAYhLxiCjbFhDJw/W1zkEmWRMRW5rWqy83LnmyEw7WPJ91aMyIOm//IGJ4Qaa
 CrGw==
X-Gm-Message-State: AOAM533fi1nfSNWuooIOsi/P2e9petjWd65I2vRtrQJP3DnXJ2dK2+O2
 M+0agesRmJGUa6h1RAlKcZ5SgDY/CEY=
X-Google-Smtp-Source: ABdhPJwPhDPhdkIPmi5AU/Pz1l35mElWkEBRoagZwQ1WerfJzKissFshgdmV2sO2hegRTJf3/68yJQ==
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr1174906wra.146.1628108614993; 
 Wed, 04 Aug 2021 13:23:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id e5sm4572987wrr.36.2021.08.04.13.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:23:34 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBNQL-0007Ms-DE; Wed, 04 Aug 2021 22:23:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210602153848.396406-1-bernd.kuhls@t-online.de>
Date: Wed, 04 Aug 2021 22:23:33 +0200
In-Reply-To: <20210602153848.396406-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 2 Jun 2021 17:38:48 +0200")
Message-ID: <87eeb9nem2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.14.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes of this bugfix release:
 > https://www.samba.org/samba/history/samba-4.14.5.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
