Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0292FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:22:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D62260F0F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D62260F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A05D827FD;
	Sun,  8 Aug 2021 18:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9QLTBfUrOJK; Sun,  8 Aug 2021 18:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D460C827AF;
	Sun,  8 Aug 2021 18:22:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3771BF4D8
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73CBA400F2
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMpqc3Mf3AUH for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 18:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69B7F400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 18:22:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k29so5533891wrd.7
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 11:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=sUes0fdZgX6qRTWnNJilPO+y23uZ3KLZZ9yUR2Z+0zQ=;
 b=NM6pwfxGg8xbIbc9GEs389e5jUMtwpK+nxn2x2Rc4sNCvqMdabTGk2I34ftpE5Bc08
 dLKBZFPO/Pi/KfbPQH28/MoKcPzh0DSZHQT6w+TIptNMIRv92oaNvnpN/GjnMJKUwKxV
 EFMNpxncKiNeMVlKOe2hUQerDxwRgkld35yrUGxmXxNi4PCx4zSt9hhdQp69AEHdFasT
 IWC/GxWR2biltMXanOjZivDoQ7LoJwTeQLkxjZqoPh2N8kgOgKq8FGextaHNDyXisyb3
 QMIu1n8TVj0YpakAxGb3AlexVRnfVsHu0K29ML6VYEf+YKk3r0jwsXwoObe6Uz7/oR+8
 UaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=sUes0fdZgX6qRTWnNJilPO+y23uZ3KLZZ9yUR2Z+0zQ=;
 b=QWNpaeL8i9DtBpknQTav5MkMylq8w2exqhAnscnFZ/UGAyF/W0lA4adly//UxzCcGJ
 usrVBIsuiML6NX8v6EdaBu0VNX/1avKpXip0xOuOhW5JNIAwnD01gzS44l9/LrXcmLVM
 HLcvHVdCDw5TxzWHxUpvsAe/9yAHztvQ2pCMox/Yx9nLT+hTwQi0orlsqZUG/a82fnsS
 EuN9Was8KJGxBsoqYTMGYazRJ6RvXFQxNqv45STGZXSDzGsasivABbOwcAOJUWV0ty4o
 Kq10M+PpJWSMowGh0JiBGLuAWHV2xGBRPUj6OaDWf6t8ixJNNDqoZ/0jjXhFLgeHvlpd
 6DOw==
X-Gm-Message-State: AOAM530Y/xXo7FZMaLjjssGgjkt/XnuR2B5NA3bAMP4AQGSgsFr/cUPI
 kA0hNuNUGy+szMzgK4ErbLYCknyw/4PY5A==
X-Google-Smtp-Source: ABdhPJz1DNA07cmaI5dEOMiRne9EdMii+I7UYL5YZcx8VJ6dN/Zc2iQPMQ344K7wJK1NLdrE/GFYOw==
X-Received: by 2002:adf:f847:: with SMTP id d7mr21439576wrq.352.1628446953558; 
 Sun, 08 Aug 2021 11:22:33 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j14sm16846362wrr.16.2021.08.08.11.22.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 11:22:33 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mCnRQ-0007UN-DA
 for buildroot@buildroot.org; Sun, 08 Aug 2021 20:22:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210808090212.9021-1-peter@korsgaard.com>
Date: Sun, 08 Aug 2021 20:22:32 +0200
In-Reply-To: <20210808090212.9021-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 8 Aug 2021 11:02:12 +0200")
Message-ID: <87fsvjbxuf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 12, 13}.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Includes fixes for the recent "Sequoia" seq_file vulnerability
 > (CVE-2021-33909):

 > https://lwn.net/Articles/863729/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
