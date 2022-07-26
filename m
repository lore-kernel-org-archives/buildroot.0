Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABDDC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 515B581BCB;
	Wed, 27 Jul 2022 11:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 515B581BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YT2DIZ7dKOA; Wed, 27 Jul 2022 11:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618D581BB2;
	Wed, 27 Jul 2022 11:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 618D581BB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E37771BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD85140354
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD85140354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3VwxD6zCtnT for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62A3E402D7
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62A3E402D7
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q18so13257128wrx.8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NgybuJOMeGJh8G5rR2SDy30Kgttm7p338TjoELutkzM=;
 b=CA6af1fpmOtcsOx61luZ1NvjU7l+yRrR4NZFpe9QBP1sQV8pyY9XYzSmGgp8wmnc0W
 qRhf0ynriWuJvg5e8I3udy9aaQb667/wCYrrC+cfe4zj99w/S+chj0h1kJhwmUnEGVyL
 GrcXjWciB5oweecYoJxEsalv4iZOCVZwxw6mgfD0L8QX00ZdJbemSMVACeLw7xPwVw0c
 lLyYOMERLASukAgG7RhrAW+nZSrg2TyGvbAA7NNr50DYu40pIQO7L/yZUlKINzgmPjn3
 BGTZEH7qaBFeBIrcxs1iFTYXH6mRymEHqlV2MM/pIZI0IonVgekuQ+U/jeozQei41Egk
 +8xA==
X-Gm-Message-State: AJIora8TY3HetsdDPj0JwY/7oiuV+wY4q83Dk5tmsSb0DhFdCbu5h7j4
 xufXogFVZQCunDGnPw5jIStKOA==
X-Google-Smtp-Source: AGRyM1v5l4pnFiNBmVrziThHOFTCICJfrCkMbg9vDzm8Ofz76CDrrbB8UWwlYjRm5co2iClXyouUIQ==
X-Received: by 2002:a05:6000:18c1:b0:21e:b5e4:8afe with SMTP id
 w1-20020a05600018c100b0021eb5e48afemr3720565wrq.81.1658920090322; 
 Wed, 27 Jul 2022 04:08:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 bg26-20020a05600c3c9a00b003a3279b9037sm2059519wmb.16.2022.07.27.04.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:09 -0700 (PDT)
Message-ID: <de698bb9-334a-b132-f417-7f7c3e39ea06@mind.be>
Date: Tue, 26 Jul 2022 22:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Andy Yan <andyshrk@163.com>, buildroot@buildroot.org, ps.report@gmx.net
References: <5868454e.114f.18036cf775d.Coremail.andyshrk@163.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <5868454e.114f.18036cf775d.Coremail.andyshrk@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=NgybuJOMeGJh8G5rR2SDy30Kgttm7p338TjoELutkzM=;
 b=QTOMs6mvxqzGMlUQNAwAVMPgws4x0nSk0YNYAGuE4Shzx40oB199P0L6IwX0FUJuA7
 4cY3Dq2MT9lXt53hacnBuXm5uGcKkr6hlHAUmShgKRSr2N4Zsk9K+OmPY/2wQp2t+v/+
 o0dq5TEqyABuTx6C2S4Wr7Wowyo+YKC0Z+qM8FTy/rxen6yEd6V9xboYNl6z/sIwE8qd
 LH0ixI8kLDGjmnGgQTE65W7k+npJFQdNHNhPgxXZp3oKa21OSbCsR45adLO+mllszp9x
 AFm+dD/ODTBwUQ9WLRQHrfbA+e26IYej1aHJ20Njesv+dp1r53IvJIDcKixUO0e2gXgk
 ZaBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QTOMs6mv
Subject: Re: [Buildroot] Is there any plan for supporting Qt6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/04/2022 11:16, Andy Yan wrote:
> 
> 
> Hello:
>        Buildroot is a great project, it gave me many convince for building embedded rootfs.
>        I found Peter has submitted Qt6 support at the early of 2021[0], but it seems this series has
> not bee merged yet. May i Know if there is any further plan for Qt6 support in buildroot?

  We now merged the very minimal version of qt6base. The next step is for 
someone to step up and add the different qt6base features, and the other qt6 
modules.

  Regards,
  Arnout

> 
> [0]https://patchwork.ozlabs.org/project/buildroot/cover/20210213174013.32584-1-ps.report@gmx.net/
> 
> Many thanks.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
