Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA0FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:27:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36676069E
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E36676069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC84F403B9;
	Sat,  4 Sep 2021 20:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrjEIcd0q5co; Sat,  4 Sep 2021 20:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CFC2403AE;
	Sat,  4 Sep 2021 20:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 376541BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32C5540113
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjE39rQGd7-0 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:27:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1979F40105
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:27:27 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z19so3739341edi.9
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=lSOpxNv4hMhUlVq/2VuCOuBmtP7QGYeMFMAOGVxGel4=;
 b=qSrmSMQqEeSH/UHhiUCpWARAdex1CyIJHDlj1EkKyP6EfL6v4aE7dPanvW4cPMJ1IT
 dr8oeoBAH40ieosGXcZNSZcznbxMGvFrU2Ik0LlzNVdA9SH71Dsqigwri+FV/fxOO3Gb
 LhkIwwFe+aLC1f5/IuD6+fMzuKcSVX4qxHGm1zDRkaOOcvH6Ra1R1QVt6Nnmk+iLXOAx
 s0wG1PDu2YESrMtW+RERF6AvD4V2goSPBuUq6hQop+jXJjIgjFHMLshjBRyAQ0BHvsAy
 oB/mVpIYu31jpCPNVPd07909RLE+VAJs7AHlkTj8HGeBdCBFjknL/Avaq+TtVibPtd5a
 fP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=lSOpxNv4hMhUlVq/2VuCOuBmtP7QGYeMFMAOGVxGel4=;
 b=epPB+PK6r+9GnctdE1GZU8eWHJGEg57KLLh7il8rm/koUUejWe6sixLMsK7JlBksYW
 0ugUzB2wtNLgusNqxBendc2q20ftvnGgwRlJck5ViL1ecWHps+8e0ONMk5svmX41YvIG
 92DOMwQma4Z2cvD3JG9MpIH8VslD8QxAr5jE67phtMNYXioCAW3Siq8qkqD3jw46+l8F
 UXOTB4GH07NxBu/R+jVOtMPp+O9fkCPSWfNGJxWeVJVVy0LqUyQaAUhbFKNBkC8UKIME
 My/dJHwONyqBmHpljQ71jkBasVAZk/Jl0MvLJwJ+NHprP1WtnUY4Vx9PwHRoJalpa0X+
 ln0w==
X-Gm-Message-State: AOAM531q3t0MVW7QobWrGzaDo/o5vLQF6gL5UPmLGo7Cpgv7wB+NCyGF
 SE1W+cjiK5QRC67YWWVmiI/HV3lirPQ=
X-Google-Smtp-Source: ABdhPJw2BtLI7BO3LVmGcjUJyKR4G8BTpd6I4s2OXleRcdjF0DGslZsS1JXBzhAyAz4Y7/yF5lRKlg==
X-Received: by 2002:a05:6402:1c1e:: with SMTP id
 ck30mr5556530edb.103.1630787246140; 
 Sat, 04 Sep 2021 13:27:26 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 u9sm1822581edt.60.2021.09.04.13.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:27:25 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcG5-0004mM-01; Sat, 04 Sep 2021 22:27:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210826220129.5DFEA8DC52@busybox.osuosl.org>
Date: Sat, 04 Sep 2021 22:27:24 +0200
In-Reply-To: <20210826220129.5DFEA8DC52@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 13 Aug 2021 00:02:42 +0200")
Message-ID: <87pmtonl1v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit branch/next] package/prosody: security
 bump version to 0.11.10
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=047b85e7d5c1b936d886bcda49fea9e7f435cbfa
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

 > fixes CVE-2021-37601
 > see https://blog.prosody.im/prosody-0.11.10-released/

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
