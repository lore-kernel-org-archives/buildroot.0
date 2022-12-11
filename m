Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D240DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 00:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F12C81768;
	Sun, 11 Dec 2022 00:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F12C81768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CqLP5Rn4UE5N; Sun, 11 Dec 2022 00:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 705D9817D3;
	Sun, 11 Dec 2022 00:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 705D9817D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F61B1BF860
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 00:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16D12817D3
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 00:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16D12817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqP3xVx1idhA for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 00:57:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11BF381768
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11BF381768
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 00:57:22 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p36so12819280lfa.12
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ujwrOhpf8zX/nt6AztfcPtC23l42DDZC23syUizioTc=;
 b=pNaPd/VLL0aN+TY1XUWdiLGpVjvfbQbNT4i7PLDL9+7sMOL8GwusXi+Hkff+ebzb4A
 eDOIfNZZmMRm1+48h1uxa1PdTLR+6wG75ejrQxssBFJ1XjUMUFtpVQ3QyZAf1fNr8Pbm
 g0SiFNzkNMW3mVCsFvJ68mbBODcAWcrIN7GS4BDy69ohz8KKpOEjd8WXo9EU3JeB44Vf
 LWx/3lrcItCJMBPYJjqWTYEMz6TkY92hEOV4TjT+ZeLZClkr6G3KEc6eano4pW575dgf
 0mqsI5SRU8Fw93hDxPuXh+5DkWujvJ6cs+OPtwmUKVt1YDuyR+Rk0/KItr3KYHQDWTke
 avWA==
X-Gm-Message-State: ANoB5pli3UQCE2Mn0DkyQiOxC5apZsOadsnwAtzXf6f+JoOLBEZxFcE2
 dXXl7qZyR8+Zq8RZyarMoKkWfZUduPA=
X-Google-Smtp-Source: AA0mqf78QKn0ZoD3ge+cs6PNSTU5FVr5gbBYCeg4nMeAtsnBbjEcMHp1CTyJRpr62kxZadUwhw1ybw==
X-Received: by 2002:a05:6512:304b:b0:4b5:892:3987 with SMTP id
 b11-20020a056512304b00b004b508923987mr5884573lfb.9.1670720240704; 
 Sat, 10 Dec 2022 16:57:20 -0800 (PST)
Received: from luthien ([98.128.186.92]) by smtp.gmail.com with ESMTPSA id
 h8-20020a0565123c8800b00499bf7605afsm929411lfv.143.2022.12.10.16.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 16:57:20 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20221210214647.40198-1-fontaine.fabrice@gmail.com>
References: <20221210214647.40198-1-fontaine.fabrice@gmail.com>
Date: Sun, 11 Dec 2022 01:57:05 +0100
Message-ID: <87bkoasqou.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ujwrOhpf8zX/nt6AztfcPtC23l42DDZC23syUizioTc=;
 b=aP/iUUaMppHYZKPZr5wnGcbrwylSoGyqGuwetzo9Qc80Bvbys05tJYqEshi8yKmxtl
 /lwBKpQKmxlTgdMnmVNnbxErY2Bh5Ea0ZhW2qDZBv/vYcsafi4U5Ecj0d3PoQRmnNuhL
 ccDA/uqblBwNO8FdIszG5VIey9lf6dL4JngNu37IDA3OIfoT6B9LNQU8TVWBAFuDGRdS
 4F8nXvFKpZmKhgEi0BFepUPO8dNxSDJxbv9h5j6PT6FJJMa+paVE6AASJwdUQyBaRpYU
 YhxjFm0r0MoaPbyxA1Zbx/3VCiHTpsD0mr/wOYm0R0xPUpeVmIWGlnqBnh7ug4MqYSlE
 sZxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aP/iUUaM
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: bump to version 2.5.6
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cheers Fabrice, was just getting around to this but you beat me to it :)

On Sat, Dec 10, 2022 at 22:46, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> https://github.com/troglobit/smcroute/releases/tag/2.5.6
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Maybe also include an excerpt of the most important news from the ChangeLog:

 - Batch mode supoprt for smcroutectl
 - Fix strange behavior when joining/leaving the same group
 - Minor spelling checks of documentation

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
