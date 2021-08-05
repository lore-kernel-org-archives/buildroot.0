Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517A0C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:55:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD9761078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CD9761078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCDA4400AF;
	Thu,  5 Aug 2021 09:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JuF2VO9Xl2N; Thu,  5 Aug 2021 09:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9CD140277;
	Thu,  5 Aug 2021 09:55:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 147A91BF852
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1125C6068C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Gmwk7BjIf3Y for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 09:55:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 437A960648
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 09:55:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c9so5699325wri.8
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=QFe1f/eaJ+pqJLPE+ifR1SHn9w6D16WatClzdmTsso0=;
 b=DnyvA9UBFbSgb3d6mCjZWHUv0b5fcHRBWyA7Ib3nJgTm0pbLVu7Ax3pvtOn6139kfI
 95XokAfg7FgwUiqmMik/zXmWqzWHgooCEKW7v6bIrKESolNhhkF2304HuTPT3jifR37C
 fQt4qPrf3wNdf2Q0Bz5M43AEVh2aEGRuc3lEdI5apQUrTpAxnQr+gwm3HNO3f5dh++a1
 APa+QMvvFuVQ7quFxCcFpzqjcdjdu6TM3Zgi0h3dD1KAfjkT6weU3Hm297ASg/XNJsS4
 q08vVmCPmy49C5haNiGjPTIU0uihmDvxWRR9cAbRBswCVuqmES7LEjAPa1uraEeNDrqZ
 y4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=QFe1f/eaJ+pqJLPE+ifR1SHn9w6D16WatClzdmTsso0=;
 b=Xg5RyplQ/soxCks3hzDduF75zxU9JdtCfYd92dDzs7sbf85PZOxeTjeCL+pLyDdHA8
 W11jcnWs5LZqP/PMvf51JpqHCY4ZUnBnwxnVMQ1Sj6yfVJnPrWqUkW9kiolQmGfTbm66
 XDrekAK8RjJSi3Am/NexVAgbz/LX/jxPs4e1NxCDrflx3XXUR8nmZIkLZDR2b5ROoKwI
 TzeyIijDanKtE6UjZkxtfK1l0KnnOKoWJBvI+S2B9ZxofGNjEefEMk/4VoOWyr+B17jL
 3kwdI3twKewKUZcNLzylDoggfUyYzWP1K6QBQe6BtfM0kV+P0WQhXAOD/Gwlw2HTcH2q
 dsFw==
X-Gm-Message-State: AOAM532JPVgUyqP3/UcAJ8PoqRXlXur8ueR8ls7h3ftACa40c2p8v0+l
 opirr5rDiX633TTaJjRSwQI=
X-Google-Smtp-Source: ABdhPJz06QWCXNuNjcIDvv8z8Nlfb6NkO7gcYyFPtIDY2slI/wBnC+EuIjlqP35P3gCumHTt9XeZ8A==
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr4319792wrs.228.1628157310297; 
 Thu, 05 Aug 2021 02:55:10 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id a207sm10326342wme.27.2021.08.05.02.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:55:09 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBa5k-0007tG-NO; Thu, 05 Aug 2021 11:55:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210724210333.906728767A@busybox.osuosl.org>
Date: Thu, 05 Aug 2021 11:55:04 +0200
In-Reply-To: <20210724210333.906728767A@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 24 Jul 2021 23:36:49 +0200")
Message-ID: <87y29gkyh3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/audit: replace deprecated
 matchpathcon calls from init script
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
Content-Type: multipart/mixed; boundary="===============1250700552888845887=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============1250700552888845887==
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=90dd1d6178b01f6da3e59e43d0c7efdf984a72d8
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This patch replace matchpathcon calls in the auditd init script by
 > calls to selabel_lookup. Indeed, matchpathcon is now deprecated, and
 > this causes warning during the boot process.

 > Signed-off-by: Jos© Pekkarinen <jose.pekkarinen@unikie.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard

--===============1250700552888845887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============1250700552888845887==--
