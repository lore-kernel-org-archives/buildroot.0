Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4D1C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:28:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BDF60EB2
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44BDF60EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 027B36072C;
	Sun,  8 Aug 2021 19:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVlStJxblN7v; Sun,  8 Aug 2021 19:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7059F606D0;
	Sun,  8 Aug 2021 19:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5311BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC3F24012D
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fr-EbjJ0ObJa for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:28:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D862D400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:28:03 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d6so21242721edt.7
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=TaFcCIEcMmUC3iJkIKbCDmciqeJJROO5py8j/xvUtyg=;
 b=bpuf5wM9KUbj2VN4wKU8lFfXWVMePPhszZjofSizDfKDuhi33SbSYdj6fHQp92eL2t
 QdOv+WNeT0gGELV4eQ1h8zU89829RTE/dpnGo3wv1HeheaNRUIRveDEf2WMlYA4Na7g/
 HrR/c9fwY3X+SG9nV3QJ3xkopUqB6cMpM7JrLFmK/5SiC4nRBZijHhmnjpfB8WtqJz96
 BsetNd0bR6DYtJSUG/g/estlr1gHKY7ivTnB+LX8Yi8Zjpz3UnWwIh2h37l1G1M4mEs+
 gNv4YRgiIeV5758aI1yFY8+CqvDhOa1IM6XC4gUR9RjcqyfJ+C9hbeGDvAdHm6NxueBW
 XadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=TaFcCIEcMmUC3iJkIKbCDmciqeJJROO5py8j/xvUtyg=;
 b=PPCCPfmLXKEOcMIx+a9cXuc3OAvDW8kreOtejVYfrn6sraSxipQ8we16Lr689LN116
 xqBMMPvVF/GX4BIZzLTBxvI0r6pzcfMuzfieZFRK6Ww18KD4FNJHbboMr+gQrmDOQlvL
 keLkkfcG1JClz4BA1lerFYswxj1Nzld6pbRf0NFlj/W0CiLSqYqPAaUzIJbS2f5c4qLy
 K5sCHHzEdYRYqWZI88IlRceg8v10dQ6gD5SzjKJEGyNYc36+fQCObWbt/1nO48LCXGig
 ABTmM7QBT6NdZKjoiMLM9jWFz3/dwlffm3ZS2FgS0TZ4fwIImBn3dEk1jSaOVmq/NYK0
 tiQQ==
X-Gm-Message-State: AOAM5338E/DpwvKYMIeHPyC92yhqgKX8PaPkg7gtwVwqbH6j/Ltr1foW
 7nMI3PozvV7VyWauV+BZybs=
X-Google-Smtp-Source: ABdhPJzIVi5a4NxFpsnhU9tAW29yMHcd1ZDbhJDWLv2XInixWrilQz9WdhQ+7/haaLpfzzQ/oHvgGA==
X-Received: by 2002:a50:d6cf:: with SMTP id l15mr25374086edj.319.1628450881953; 
 Sun, 08 Aug 2021 12:28:01 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id g11sm7111185edt.85.2021.08.08.12.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:28:01 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoSm-0003vE-Mj; Sun, 08 Aug 2021 21:28:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210807201428.1796318-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 21:28:00 +0200
In-Reply-To: <20210807201428.1796318-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Aug 2021 22:14:28 +0200")
Message-ID: <87czqnag8v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,1/1] package/guile: fix build on riscv32
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on riscv32:
 > system/base/target.scm:132:16: In procedure triplet-pointer-size:
 > unknown CPU word size "riscv32"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Set wordsize to 4 instead of 8

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
