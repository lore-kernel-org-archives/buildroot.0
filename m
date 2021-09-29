Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D638C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 17:31:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD9E61425
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 17:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DD9E61425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1324340251;
	Wed, 29 Sep 2021 17:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbR18POAEljI; Wed, 29 Sep 2021 17:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601764021F;
	Wed, 29 Sep 2021 17:30:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32FF41BF3DC
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 17:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21B424016A
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 17:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8iQr55qbAQc0 for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 17:30:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5C9B40015
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 17:30:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d26so5558929wrb.6
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=7YBvzolDqLBEmOHsJuYsIzk3mfspAjswjGjLTC49/aY=;
 b=BhTo/XfTXU4MvkG7fas8mdmBUtFdoS9mQDjYwOniJ4EtLrcraoqGYr/L48VAtKWH1/
 9abpQoaJiqIWmiu3Z2joMlHJyr7w9rlE+fk0kucAm8mKjwFLOk7TbJSHzor4DHhqVqML
 HlV+CAoZAuauOLR4M5z++La09WqfG96Wf3/9WAGHHLv6X85egxCBNWk3pIDtPN551I5S
 eM6SPtQlSTTOhw/wpr6m7RWkYnxUZtOaRUdYCQKeiTmCchXdK4URe7wukgvIJ+OfTyrW
 ilI/XMjeCj5cUFD/WuaNDH0R8sEXtyP5vS+uRXFHRzsCRdle/PRXJwpRsg6fS9epxJYJ
 zeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=7YBvzolDqLBEmOHsJuYsIzk3mfspAjswjGjLTC49/aY=;
 b=37Pv4DzqiWRqaSVxR/rbNupocDcmxxZ7b3OQykogXmrw7zBtcn5uCxlh7Vtaaf354j
 X7fmBBjq2hVWyTnIRoA0HbSMavLsYgJ/UlsNRJUlNhuopxtBYbKsemsPNY5I1SKXbtDh
 BtV6aM8dv+322iRbdTNWqkiCrVKk/BnlpNnm83y3awKAbQFBmosGMvQYqyjHkYCNvf8q
 /8SzWurCNFHZw0EWjWL8QBx3Gm1zYj/eC61JHpbWMi3CrOFC1wnHRMl8WWElIK1G7hcX
 mb99xIqz21EMlgFf3Ea2KBHaOcbq6L/9ntfG8WF7uZIlBO99+mRIaWCqvSTY8YSdtiyu
 Zpuw==
X-Gm-Message-State: AOAM5336ulOgmN9vx9dy64TEe8e4exAoSykw+r0MQftzHqL7lYXM538Z
 UFIC4x3OkKSsFCnMr6pd+io=
X-Google-Smtp-Source: ABdhPJzJxfjd6K3fKMX+ltYg5W7rMOSf67MLXrEIw4UCn0WwBmiQjeY7iHjl1r7xbj1pu4NCqHvE/g==
X-Received: by 2002:adf:f610:: with SMTP id t16mr1345237wrp.309.1632936652900; 
 Wed, 29 Sep 2021 10:30:52 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id 189sm2640682wmz.27.2021.09.29.10.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 10:30:52 -0700 (PDT)
Date: Wed, 29 Sep 2021 19:30:49 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: David Laight <David.Laight@aculab.com>
Message-ID: <YVSiyejB7ZKWev6I@pevik>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <a3acad98-edb0-1ac7-8d84-a3937a405646@green-communications.fr>
 <515fab0378614d93821aed6a95cbd16e@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <515fab0378614d93821aed6a95cbd16e@AcuMS.aculab.com>
Subject: Re: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
Cc: Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

> ...
> > Meanwhile, 'which' is not standard, and right now, it misbehaves on
> > Debian by filling the screen with warnings.

> 'which' is a shell script that is trying to emulate a csh builtin.
> I've NFI why people keep using it :-)
FYI Yes, version from the Debian's debianutils package was a shell script, but
other distros had GNU which [2], which is C code.

> The equivalent bourne shell command is 'type'.
I also knew 'type' and was suspicious about 'command -v' support across
implemented shell, until I asked [3], because checkbashisms.pl [4] complains
about 'type' and it's ok with 'command -v'.

'type' is part of POSIX, but as part of the X/Open Systems Interfaces option
(XSI) [5] thus it might not be implemented on very small systems.
'command -v' is POSIX but not extension [6] thus it should be everywhere.

I tested 'command -v' is supported by commonly used shells (bash, dash, busybox
ash, zsh). Although so does 'type' thus I prefer to use 'command -v' instead of
'type' in shell scripts thus I can check them with checkbashisms.pl.

> As for 'command -v' no idea what the POSIX committee had
> for lunch that day :-)
> It was probably they same day they added 'fc' (from ksh??)
I cannot comment that, but if you read their definition [5] and [6] has slightly
different purpose.

Kind regards,
Petr

[1] https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb
[2] https://ftp.gnu.org/gnu/which/which-2.21.tar.gz
[3] https://unix.stackexchange.com/a/667293
[4] https://salsa.debian.org/debian/devscripts/-/blob/master/scripts/checkbashisms.pl
[5] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/type.html
[6] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html

> 	David
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
