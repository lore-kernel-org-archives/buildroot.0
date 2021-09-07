Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F91C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:00:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6015961057
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6015961057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3635181C21;
	Tue,  7 Sep 2021 13:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZvyPkijq7-E; Tue,  7 Sep 2021 13:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1DB80EAD;
	Tue,  7 Sep 2021 13:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92F2C1BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 810A240122
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0vDbQcMkzLF for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:00:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8679140252
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:00:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g8so12552408edt.7
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=vOC2iWfjjukaAMnYvkQGxwbjGQmRN++Anu/aNogZnvw=;
 b=fLHQHDlnWFseQ1k8FRuREX+wFl8SV/6MbcDeOcpP1pAu8ek3+vonlws5W+GL5Ypddj
 CRfcVYkwA777z3G6BA7YEWnEexKwELqPzRndJBtmIKF1IkSGl5k/doxPiLirD2vMURYl
 OOJQ5lWZoejhaxm3DDpwyP8t5G+TdQEHdpcdeS5+QP2KnOem8T1l7LMacONYegnS+SKG
 z+1uZgeZ97UaN90abjfPOEBLhPautrDrwwUWOmGAIah6NgylWvJYQPLvaE0ImEkPgQCy
 6X+VArCQY01B1shMH+o4+kY0rQZAXbyYHDFLQSQvRwhBOYhgYXZ+jx14I8PYDyrclRJD
 eelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=vOC2iWfjjukaAMnYvkQGxwbjGQmRN++Anu/aNogZnvw=;
 b=SolHKXHvNv08TFqMXghR4P4QGYdfhGf9jiA8DH1VPutQitqIsuvr4ewCAUxVPDpRmp
 P7C/LIQk3p2nsYAqoY32npbttKPLSN8Atl+FXaHKlgx4CwyioaMT/h1hKTJBt5Of+Eh2
 y7HmQOdOl/a5UiKXP0H8T/D1q7WQs981GbRYHB3T2ujwg2OWVexfbNeGEKU7GL1uXLMy
 lOZb1p6CtIuQRI36zw12I5e6RUIJliaoyHPkxe04xT81mvTIN6FU/genJmpBpwGLwD/8
 8+7xuaWItRT5j1inZ+KPcSnprjhiQK6zh3NSauvlfBvpirAsu7yw46KyQzDyf47pfoV/
 oanQ==
X-Gm-Message-State: AOAM532J5h1uNET+Pqx9IfFvKlF/NvXLChozpabnS29j+OUkU9eWldGZ
 XWAFKRICC2osu4ZdLpDJook=
X-Google-Smtp-Source: ABdhPJzifjCLtyjuZ6z3ndI4qCJbHw4krE8rXyFyi7/87aiPBf4d8bVNxVMQC5WZIr8EPgLP7X1JMA==
X-Received: by 2002:a50:998c:: with SMTP id m12mr18957998edb.327.1631019628790; 
 Tue, 07 Sep 2021 06:00:28 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 w13sm6993827ede.24.2021.09.07.06.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 06:00:28 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNaiB-0004Sw-KR; Tue, 07 Sep 2021 15:00:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210828071352.359497-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 Sep 2021 15:00:27 +0200
In-Reply-To: <20210828071352.359497-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Aug 2021 09:13:52 +0200")
Message-ID: <87tuiwee1g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ushare: fix NLS build
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit c4e1a075101914f8e0d47f8bb9c06bea13ba0fd2 forgot to add
 > --enable-nls to patch resulting in the following build failure:

 > Unknown option "--enable-nls".

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6ab2555b419355f01310f230fe612f2a3699bbfd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
