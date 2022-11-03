Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61346C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CBBD81F8F;
	Thu,  3 Nov 2022 21:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CBBD81F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLxtJSaVXFGA; Thu,  3 Nov 2022 21:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A9BD81E42;
	Thu,  3 Nov 2022 21:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A9BD81E42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB83A1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B755761046
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B755761046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id styg-OK_Czd7 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:29:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EAB961037
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EAB961037
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:29:51 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id h14so2865830pjv.4
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wH1aS1soN1lS1Lcn4k8wP3wA2TxgZkpUneC2B4zNlcE=;
 b=nSW4tbRn2ktFSvqwOQeRDfz6PzqRM+6GoNU0ZNI8H4y1onVnBaQo3pF+jjh3jjoig5
 wtmY2TRiUrQRM51gp+T4JA/qa2YA0L74bvfUwAwDsC4WAclwLA8TjfSi+3tqrGoFBZ1P
 0NAuADyDDZJZKSl/uU3D7qN7l+MYfIHNsWaW2pYliR/t8txdS8cct3M2ISpMqIAorWUg
 8uTgxbYyJc1igGEng4TiUQOh230wf6RuMUcuVcfwZqtpX+ufGh3HopsVq8rpNO7KwOg6
 9xh0XPu+QzgEE+KeqolQtYk9RfL9LUy12mFBYFkdWudpdQPSvkxxdMPpYwDCaonTDNwo
 Ieow==
X-Gm-Message-State: ACrzQf0m3QQWuek9FOTu2wlMnuhRNEhnVZqFHmD1PZYMWHuBjrkCtgW+
 6Ac3vsqrUFwUMKIwDXUmNQghxuhOkKvuuC53y10=
X-Google-Smtp-Source: AMsMyM6mYlyIr3qdeF8h6/81J2A293bzf1rKHSuTuAe4rslwePKQDmGSRquvu1V/lpRlfqkAe9yXA94j7MIa06RtwGE=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr31646911plf.57.1667510990798; Thu, 03
 Nov 2022 14:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221103210719.3477688-1-james.hilliard1@gmail.com>
 <20221103210719.3477688-3-james.hilliard1@gmail.com>
 <20221103221050.3a3cf4f8@windsurf>
In-Reply-To: <20221103221050.3a3cf4f8@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 3 Nov 2022 17:29:39 -0400
Message-ID: <CADvTj4oMCoHLnhVup=JuL6aBoWNb7oydNvFodsZVVdzNST-7jA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wH1aS1soN1lS1Lcn4k8wP3wA2TxgZkpUneC2B4zNlcE=;
 b=VP190laPpvK2OlPwUSb6CMeRwXkfh89DBkvRHnpBheUpZIf4UQS4xH2sXp5Gv4n0xG
 ntfmkH4JXUbmnP1vNK4BYVRnFS6r4FlKpOEDRP3eByyzFsv9ls0n5SlbkSYSU9RKoU+o
 6g5isgaBhCamjr2dO0gzSeoNWuO6H6Hf4J0Jgd4U/gIBaDH3udS6RwOu1qfCwYWiwaaW
 wfJ2CaesoFxEXYKLk2ZzAJhcp2PTLU/IPJsfj5UDBb2u9BrSlswWACHPRJYkS/ibQaga
 VaVaRGMVYqF6tQOYNwD5IJgO8eaaOSw+W9iEszuP9oOTnxc2UbiAnlnXyp0GQcH+j39+
 6Crw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VP190laP
Subject: Re: [Buildroot] [PATCH 3/3] package/python-wtforms: bump to version
 3.0.1
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
Cc: Lionel Flandrin <lionel@svkt.org>, Grzegorz Blach <grzegorz@blach.pl>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 3, 2022 at 5:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu,  3 Nov 2022 15:07:19 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Add new host-python-babel build dependency.
>
> Is this a legitimate build dependency on the host, or a bug where it
> confuses it being needed on the host at build time vs. being needed on
> the target at runtime?

It does appear to be a legitimate build dependency:
https://github.com/wtforms/wtforms/blob/3.0.1/setup.py#L12-L15

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
