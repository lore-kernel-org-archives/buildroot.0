Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690B2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:26:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7F9660F21
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7F9660F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F2F260706;
	Mon,  6 Sep 2021 12:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5BEBEcqVaaz; Mon,  6 Sep 2021 12:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F17016061C;
	Mon,  6 Sep 2021 12:26:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7471BF2A0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A17A80F83
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCgp6xAVpr9r for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 12:26:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 340FB80F82
 for <buildroot@busybox.net>; Mon,  6 Sep 2021 12:26:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id q3so9319748edt.5
 for <buildroot@busybox.net>; Mon, 06 Sep 2021 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=8njudpCnmw8eVdAa+g/9STZIhKigN2nlvI9LFQpvwEo=;
 b=PdNULWM1olYwSUaq01DA5p3ieVaeYJO0GW0XWV38ewUKeGqqOTYj5HFoGeSJKsKmZl
 XsjWqIHlaJUg3sblyYxVef1JqTAdRr20Q6/Y1Smsm2aYfJI+3OkjPXjujF9G2w/MomEK
 rybnIQqn+5Zzu/3iYyebaDy2w/IA/TjSqutXox/rwpMP1uX6ykUhYOgApBsGroksLf8O
 KZ+x0eVrThL71AxwSPbEvMe601D30rhWpOTbmLm76REOf6pl1ziHc1d6yJk35frAn62Y
 jcJV4DV60UJNZ/cEd4QNsHDVDfC+GWvDqN4/8SnPM17M8eUwLT5WpowS8eDltK9zWivH
 dcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=8njudpCnmw8eVdAa+g/9STZIhKigN2nlvI9LFQpvwEo=;
 b=Ra9ycrowBNR9k3Y4o0wUDMTXGDfWBBijY6Lo04m4CCHxoDwr8hRG5J7tkcceM69FNc
 eyJtx9vR5/S1y34b3Y50RdlOYOoyHoQkYpXN3cXnyH/pIlDO3uxPcowZTvP325cOQjRN
 tuA2r22PQc8WolqhZmfrA0CMMkJnpoBx0dhvt3bJuxww2rv+HVPFHtMPszm7xVM+9Fz9
 S4jwca6LuGflfzFPsvqeckkig1L5VG+hABjMGzaK4LWUMjAAojyQX/lw/CwU7z/KLW2C
 ML13qExAp4PFwyZXhojJyaXz/TTgefiK0mrxON7lH0RI1gtrkKY9PgK2q061bm/Wiggo
 RWPA==
X-Gm-Message-State: AOAM531hOEq9Uyp6FCXn6Z0Cqyro5MGvfE7Wp91Qp9UQXXAQOGFPGCrG
 /QRVX6/9EQEDKDTBykw8lRA+b75fvng=
X-Google-Smtp-Source: ABdhPJzbgK1ApGXCSDpTSUJcHTZy+jR48bXTwVd/LQWXNPmshbDU+Wb7eyZyHgumSl4xiHqOtpf4nA==
X-Received: by 2002:a50:c94d:: with SMTP id p13mr13244931edh.246.1630931179387; 
 Mon, 06 Sep 2021 05:26:19 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 l23sm4635165eds.29.2021.09.06.05.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 05:26:18 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNDhZ-0008Bs-Db; Mon, 06 Sep 2021 14:26:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Matthew Weber via buildroot <buildroot@busybox.net>
References: <20210819142558.10417-1-matthew.weber@collins.com>
Date: Mon, 06 Sep 2021 14:26:17 +0200
In-Reply-To: <20210819142558.10417-1-matthew.weber@collins.com> (Matthew Weber
 via buildroot's message of "Thu, 19 Aug 2021 09:25:58 -0500")
Message-ID: <87v93dkhzq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/eigen: override Fortran path
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
Cc: Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Matthew" == Matthew Weber via buildroot <buildroot@busybox.net> writes:

 > The language detection is falling back to the host system
 > Fortran compiler. An example of this is in RHEL7.9
 > (gcc4.8.5 20150623 (Red Hat 4.8.5-44)).

 > This patch bypasses detection and points to the location
 > where the compiler would be installed (if present). In the
 > cases where it doesn't exist, the detection falls through
 > and leaves Fortran disabled.

 > Fixes:
 > http://autobuild.buildroot.net/results/8354da225d1e5e337aa7ea62a7e6524fb5f1135f/

 > Signed-off-by: Matthew Weber <matthew.weber@collins.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
