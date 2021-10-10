Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD45C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 21:12:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C4460F22
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 21:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2C4460F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84EF460698;
	Sun, 10 Oct 2021 21:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XW_-sNiLzkPr; Sun, 10 Oct 2021 21:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E19DA60659;
	Sun, 10 Oct 2021 21:12:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 638B21BF41A
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5728860659
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 21:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmUQVrfapKHP for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 21:12:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A144F605E0
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 21:12:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e3so15679781wrc.11
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 14:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=pf7O0FCkBtX+8kiCGODELHgfXtvKWkVl20ubqWxZW+4=;
 b=NAckHH816oDrdJnWS7/1hfLRw0RY5eztBPwj2IbPcTpoLYpO+ttx5hjnTVXie14NFq
 wdq5fFF66WqD9cJaMlhpR5OPgXhv1CqwtHRAo6c2w2H2NB3LxiMVYFNcIWaRwxjSD46Q
 ZZm5hlf7cSDwlbhStb/yDI/NjUMCAxuA+FmzgTqvroryBK7yFBHd9Du6jsFe2FV27KvB
 uLoUfbdlh9/Hw96pqb2HdEW7/CGw5EikvxiWmiv2PvZc981tXHZdrBvOGfqrqrmnZBsY
 TgCvhdBBbxBvJS6wB7yo2vJhxPcfjLk+s7WkG98d1FsjYJSppdToM/y1rT8HiRiv4fjf
 KJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=pf7O0FCkBtX+8kiCGODELHgfXtvKWkVl20ubqWxZW+4=;
 b=T1Q1jLrkJDYx+icsEPCWgrhgZv/gPoG/cHes9sXDsj9o0Job7CzDtB0EOm9376clVu
 F57qz84M8jG0Drpmfz/YNhaLACYmd3giBHNLIE0F6ElOcYSgEbA/C4O4FhiSSUXLWTC/
 SHRrExENUltfQAx3HLdJ/IZc9RDO4qU4XMJFWr6d1Zl2Eab1CGv3Fj/HdKSABbYSDIkJ
 ajL1YGmQvp0SDTszqIvXPwtNMBxENh9SWbzQuHAM87/t3KBj1Bqn8Df5Ib+dHto/7Udp
 bx4bb0ueZ/CWv8jKcSHPjSZQlLtXfx3afK8K0KyF7g8zyR51sqtK8hVVDzxmO4ciQrlU
 ExRA==
X-Gm-Message-State: AOAM530/ceOneXFFxGPDvwzthZBka+FBfVcPvf6CPfz/gmWac4BUA7h8
 Mw0KxxRJ3/Xa3FqD22fCAEABfFXUu4E=
X-Google-Smtp-Source: ABdhPJw1lp9pmLXM4QA4OwopWpFNLibnetLODXznEFEYQyTu8gMUnu8bcked7lpfXcqfdxjUdw12zQ==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr19530582wrs.262.1633900335695; 
 Sun, 10 Oct 2021 14:12:15 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id v3sm5954717wrg.23.2021.10.10.14.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 14:12:14 -0700 (PDT)
Date: Sun, 10 Oct 2021 23:12:14 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <YWNXLl5AEUGtvMK8@pevik>
References: <20210921205112.39176-1-petr.vorel@gmail.com>
 <fee5adb3-0cd8-3538-bf3e-d04af8153007@mind.be>
 <20210930200402.GO1504958@scaer> <YVYbAxgEomvMo5IQ@pevik>
 <20211001180304.GV1504958@scaer> <YVixgCleG0rdvHMI@pevik>
 <a4efaab5-7296-da52-05fe-9aca99ca617b@mind.be>
 <87r1cuwm8d.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r1cuwm8d.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [RFC PATCH 0/2] use `command -v' instead of `which'
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

> Hi,

>  >  From this, I actually conclude that it is indeed safer to go to
>  > command -v, with a wrapper script that we add to $PATH to handle the
>  > case where make tries to bypass the shell.

> If command is always a shell builtin and we already do the dance to find
> bash, how about just doing something like:

> $(shell $(SHELL) -c "command -v ...")?
Peter, good point, thanks! That would safe us to modify path.
This works on make 4.3 on Debian with /bin/sh, I'll try to test it on more VMs
(+ find one where plain $(shell command -v ...) does not work).

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
