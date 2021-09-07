Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADBAC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 10:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9469610F8
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 10:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9469610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D25605D6;
	Tue,  7 Sep 2021 10:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TMX7lquFuW2V; Tue,  7 Sep 2021 10:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F25C7605CF;
	Tue,  7 Sep 2021 10:08:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 949C51BF3AA
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 10:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 914CA60585
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 10:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wa_bWVRFt9ZH for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 10:08:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46E5B600B8
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 10:08:46 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id jg16so18628342ejc.1
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=xLCDNYLrMDxGUaxpcWxtgpkYv3lgT+dMD7QAkzs37Xg=;
 b=MStYkVLwNggXR2YMcGto4WtEnXs2ZhZ4e7eaBEO9aSjpIcRHZyG4lG2ZBFeCxdIGKv
 0fSaIkwtYRXaIzCe4khDACgkBzJACILRja/nVhrAa8nknorw/C5xFj9yEYa1TH2+vWSj
 PRYmTnuZVV4qpkSPcEsu+m9uO6oH6GUxSRcnS5xYI41CJzeaExc1ANscjZrkRW+HhSRU
 rKduZiCX3zY2ha9YYS+b6NASpN2f0KViEEnKShGNBrY2lT4tdrkNLyAf+e75syTbJxbK
 +6CO+1CcNSt+U0wlaWNaEKCHHiTGpDj9GDr338dwVEJzKnJA/frNDHnDSMRgG1AwzZnA
 0JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=xLCDNYLrMDxGUaxpcWxtgpkYv3lgT+dMD7QAkzs37Xg=;
 b=N9Dsbh9yKn/k2jmYKDzJRt8hxmW5x03BXkskx7KQ6to+txaJY8UmupkeFaHj+dVmZO
 Idte4Bb1sM5D3CTFvE2BWvcqo9QBCwmeYc8HxBpcvUlAY7vYtG3Y4aib7WNakf1PcDB3
 ygIugIbJOZR/nZS+oT5PU/jtlAsWu7YSaJDtWkzbrfnqdbRzavxI9I4JilHZ5a0vs9QK
 GzoWPq5VvC4zUPp1RKTjnaU/fdOd8GQehHGmnICxVdmpf4S79RDkCw1iicYk4AsEnX+e
 qK4cH83kqUFUtYCFq2lzKZ7JcKHlkbXNaEQ2jbLHBuN/d7Wxh4JLlRMP5Su79qrGyJ8s
 uV1g==
X-Gm-Message-State: AOAM531kKpo/Ft5aubiia7L32V809FWIbt5LyIrodnKHeKEbcMvBxArI
 f333TQJZsSuXMxvtijuPNYK8KEXMZMY=
X-Google-Smtp-Source: ABdhPJwyfxiaibaUeXYnDk37qCtqcNui5Ks5NR9ZOsyZJvVPkXBrgo+QW5lZ05JCtof4Dth01d81Vg==
X-Received: by 2002:a17:906:2346:: with SMTP id
 m6mr17665274eja.512.1631009324568; 
 Tue, 07 Sep 2021 03:08:44 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 q9sm5261583ejf.70.2021.09.07.03.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:08:44 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNY1z-00016M-EI; Tue, 07 Sep 2021 12:08:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20210825202152.6C58189079@busybox.osuosl.org>
Date: Tue, 07 Sep 2021 12:08:43 +0200
In-Reply-To: <20210825202152.6C58189079@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 25 Aug 2021 22:20:29 +0200")
Message-ID: <87o894g0k4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] configs/pc_x86_64_{efi,
 bios}_defconfig: update kernel to 4.19.204
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=206c098f78da33cade7c2b8b6f8b71368c937c74
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > gcc 10.x is now used by default but the kernel 4.18.10 used by
 > pc_x86_64_{efi,bios}_defconfig doesn't build with it.

 > Bump the kernel to 4.19.204 release that contains a lot of
 > fixes for newer gcc.

 > Fixes:
 > https://gitlab.com/kubu93/buildroot/-/jobs/1525741062
 > https://gitlab.com/kubu93/buildroot/-/jobs/1525741060

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
