Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB6AC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:45:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76E760D07
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A76E760D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76A2140158;
	Tue, 27 Jul 2021 20:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqBjU7qHersB; Tue, 27 Jul 2021 20:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5AEF4013F;
	Tue, 27 Jul 2021 20:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9B031BF9C2
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9C1F4013F
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aa4iiTNltz1y for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 20:45:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F3354013A
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627418698;
 bh=7yXhlI+xinWb4wzlpS7FJfwZR62g1SIZVxVuO9M8kNI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ZpmRtyqT+kYLDClE8sqQ4D2eI9j82RLJsljtZcGcjGwP6NaxjcJZNYJyAlvaoeZLk
 1yLd/yYqwXAEa9+IPnyzsSYeP6ZYUCx/wYQSmlIBDkrwwRb7+xqkpEP4O2mrcbbw3k
 R0od7cY+yXFCV2jeKv7sNqrtCD/lqWkqq4u5Hhks=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.64]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUnA-1mztqS2eHK-00raSK; Tue, 27
 Jul 2021 22:44:58 +0200
Date: Tue, 27 Jul 2021 22:44:57 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210727224457.0fcc5b55@gmx.net>
In-Reply-To: <20210725214033.53587914@windsurf>
References: <20210722181929.24015-1-ps.report@gmx.net>
 <20210725214033.53587914@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:DKt33xOYgD06xKnM6W2Yg+ysnbUJOb249lUaLFTQsLxhjSwvJfK
 GYljMEMOqmJBVO0vLynmqaGXZIL+KV+gxUqZiu0l1zBCfg11SWOqT4rNWZMQSP7mruSSqdZ
 SMzRBMKfzEVdMuaoKHsA+LDhFLLrBmDihl42oWRWfyJ5TdnesQWu6v8sXgxp2RLpWvMAGBb
 D8Q2Vgl3B9o5+D+0kwVmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FlVJ+6QR1NI=:uuP84TVsVRrGxJc+Lz2dMY
 wBtunkqIyz4DUIpKp8/uD2nUYSf9jsrZkQlC4+0hBxBCDXtuxvZlAZIyJWXfDlr/6JNNmZD3Y
 sij8il6J1ocYQMJ7OMUBrt53hGcWiDyUiondTRAeKeHXBskGndglm3Y2gQ8E9LBrldbp3Hd0G
 y0z38E3RftsSwOjYRG9EOcPK0Q4iZnF1isvG+bXlmR9Ak/ui1Hmq4tp3Z6TXP2B9BY1Otww9Q
 3dXzUaXGSC6fa6ijlobz3V6wjKFwOlCIykSK+CvTAY4Hm5OZQMw71SGvTD71RJH/NJpJzt1AO
 aVFjkj5+sVKVEXfW7g1jDa/BeYDd/ZT+bSdWDeLVuu81/KRipVtbFMAZTMOHUZDCvQGh4pGHr
 I4z5ZpIpJJAmwuqG+Xjqw6FtwIu4+YB/zzEmrlOPs30ROSwvUFgY3vXm2ng+ySaeGHPSB/7F8
 XdKY5yAZ1kNccTdZG5xkYuR+kohujFWTyAlqz4mcnKSEfnDRxtOoPJkiGXC5imkDxG5u0FuU4
 +vbvcT51KGiPlGEv50eEyBnN8V4v9p5UM1dCkBin1bc4K6k1BomNIYf8gtQJ/YmC4w30Wm5ki
 2yBgQI9VLh62yqSsGv1pDwdS6tpyqhtonA6Kl7tDc+v6tnggJqLld+KmjW59OY5chVIuWSCwE
 4XhBGpScRc9LFkTVbRxmCH0Xireoqtr6SrdxlhalmivL8zMc9DM2WfG4H7b1Khig7x64ISOri
 mpWmxhPtmDbS33t9c+u9TLG3xUDvhW9BsTfU72zQwIBy75+ZwDq1V1oHILyTJ0XJxu5xYKRxk
 /YJE3dK5mL/ySW5DxXuJVhrwp5UPS0Ie7/8NfRbv3aLL3HI9E2nxqSIsUdX8UgLFG6IFY8/kF
 ThSUKJWhGoMEjX/ldyL+5bSzqI8XsPpreSslDL1xqJi7nFxFfeRNHEbXK0RJ3oOh4OBuRMYuL
 RRgLoFgNXK4+TbNgyPfY9wsORBTESIiE3DV0ZfOENHqnv6E/X0z458SfuNJrxvrNmEaIpEFdf
 KYO9BOsjFJhKKW3uWapUIbRIMpEgPDqwg0m4ChOQ81M89eg2JucQdrRraCCWQXK+TohlsYnVf
 LqUsTCaFd3IIG35lXxIOiIzEdYcfR9ZEUi/
Subject: Re: [Buildroot] [PATCH v1 1/2] package/mariadb: bump version to
 10.3.30
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
Cc: Ryan Coe <bluemrp9@gmail.com>, Scott Bartolett <SBartolett@thorlabs.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

On Sun, 25 Jul 2021 21:40:33 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Thu, 22 Jul 2021 20:19:28 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - rebase 001-add-extra-check-for-librt.patch
> > - for changelog see [1], [2]
> >
> > Fixes:
> >
> >   CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
> >     Flow control statements are not properly nested.
> >   Call Stack (most recent call first):
> >     libmariadb/CMakeLists.txt:423 (INCLUDE)
> >
> > [1] https://mariadb.com/kb/en/mariadb-10329-changelog/
> > [2] https://mariadb.com/kb/en/mariadb-10330-changelog/
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/mariadb/0001-add-extra-check-for-librt.patch | 12 +++++++-----
> >  package/mariadb/mariadb.hash                         |  6 +++---
> >  package/mariadb/mariadb.mk                           |  2 +-
> >  3 files changed, 11 insertions(+), 9 deletions(-)
>
> Both applied. In the second patch, I've replaced the hardcoded "gcc" by
> $(HOSTCC).

Thanks for improving the patch...

Regards,
Peter

>
> Thanks,
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
