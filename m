Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8EAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 16:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2CB28532C;
	Mon, 13 Dec 2021 16:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFMHlxTbYgOf; Mon, 13 Dec 2021 16:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2720385322;
	Mon, 13 Dec 2021 16:45:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 676F01BF361
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 16:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5515760A99
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 16:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_LfyBECSHxC for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 16:45:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D015607DF
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 16:45:07 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id q74so39678570ybq.11
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 08:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ktFlkJSa42ssWDcZSSVFVuy7pDhBTG33JiJNnzp9MrA=;
 b=myDjchxCWP3wB+zK/obKRvMsg9nGo2jMpAZgp8iF31GrRxavTZrZTQANPyqqF9Cg5Y
 sEv/FYv34ek2xp1Myx6LveM0opWYULoSyafN46HffARr7ad8D4fl3IKNzXkO2AELU7Hc
 tXF/fdaDEJmg53+8tnFKfsKPGXG7mw0XLKWne8O87RxSPnAYZEBvyS4odFUBWKrCCcE6
 ICqSGwubUNq6eqv56EzKWCTBbuR9Uz3OzJMTm3jlOsl5m7+5q0F03X/ZdjvMZXHdsJLR
 7aQmkW+ughIDmHe3fs54qsIbRQwwfBXoDNhpDVAn/bYtnkDHiY5t67uB9riOQtcGcRYY
 MFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ktFlkJSa42ssWDcZSSVFVuy7pDhBTG33JiJNnzp9MrA=;
 b=M03JQeKfPD66yQvwTXebUfc5yKeQ/lOybR0B5L0rHUKwsgdFeoz7srrVq5APx7Yzp5
 PxZI6c/b07adi5ul/nd33M3bCPHAQZ+YxW6ivKDagPIqCl0sIup1ohm3cZBh2Q005UBr
 QAuFRkEIwVMXg+53Ft2rgW77JHnRyt4x5u5CZMD2Scj5rgxRJmfFt7ZdxnJIITlfD5+8
 Wv4BKsIdL939453aJn2oYFxBgswzrq6l2FlVLu4hAvEKR/g8nFaj0DjVpGssSJ8wTKT2
 GLunzNwbNFDRKyK3gqOprVNxYZEr4eMHyhR6AzX6XoNOU+gN7ohccowSUrHC6CYbE9uA
 kE/g==
X-Gm-Message-State: AOAM532AghoHE5MjheUE4ip2kzEh294bW493Ns7ZCny1cf3ceOXpN/cT
 +KlivQLGxokAZzV2XltiI8/k5B8az7DTUHrzz1c=
X-Google-Smtp-Source: ABdhPJyagM3DSqqmMgCT8tTnnWxXcz5R/VSnDGnn571qG/cfDKvS4MLdbeEVxJoRizkXre5aRgO680q2KUass+WZLCk=
X-Received: by 2002:a25:bfd2:: with SMTP id q18mr35635575ybm.542.1639413905570; 
 Mon, 13 Dec 2021 08:45:05 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkBa2iycZvTW3pmSzHq6EmWTGoQfD_iHQ5mWyDyVRBYHeg@mail.gmail.com>
 <5be296cc-0cc1-77c1-01dd-8cffc8ecbefd@mind.be>
In-Reply-To: <5be296cc-0cc1-77c1-01dd-8cffc8ecbefd@mind.be>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 13 Dec 2021 17:44:54 +0100
Message-ID: <CAOiXNkCVncE4gGNU9Bhu_sZcVgZfF5eemYGrLRdk1DHeuFSu+Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] -E flag in apply-patches.sh
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> > I am wondering if there are any particular reasons to have the -E flag
> > and if it would make sense to remove it from the script?
>
>   I think that's purely historical, from back in the days when many patches were
> downloaded externally and some of them could be really odd.
>
>   I expect that none of the patches that we have now still need this. However,
> you should probably check:
>
>   - all patches in the buildroot tree;
>   - all patches downloaded from somewhere (git grep 'patch\|diff' -- \*.hash)

I looked through the patches and did not find anything suspicious (however,
no 100% guarantee :-) ). So would you consider removing the -E flag from the
script in the upcoming release?

Thanks,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
