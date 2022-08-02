Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0644DC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876A381987;
	Tue,  2 Aug 2022 22:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876A381987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOt1hOFxFIhJ; Tue,  2 Aug 2022 22:44:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A05EA81975;
	Tue,  2 Aug 2022 22:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A05EA81975
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FCB01BF20B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85C2A4098F
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C2A4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-K4QdXs7WJA for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:44:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62DE140928
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62DE140928
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:44:45 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id t22so7029452pjy.1
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 15:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GfagQge2ddWw+5+iWBf4t3635omQFxsf5Gl/UY1tE74=;
 b=de9agz9JaluU4SjNpU5XeXuPkQjJDOdo2KN2cPyXfG0clYp9KwM9IK8rXg3QAeL8hO
 XPOctUqw2r5HdUPcwKRdEU6J07bUl/1CVvCW0FfDkzxNkxXT9PcYAL9RpvzxRHvMXtVz
 ca6W1HieUPjKAyAFKWW0L6D/pl17pYp0xHqPnRjJB9MV1iiO2DZiqs5jUtTP0ZJjyfIK
 uQwuIr/6hCkNQpTQn9lkkfMO6Xnnv1G7HJ93FmFg+CzXnrgHhzokuIBrEj7pZm6ZJmYI
 U5m47G4pGSiC72K9YYD3aSahPbmuFLWW7iGxpk7xP7VcuOZ65TvuNfkcZMwA01HAik+G
 IM4Q==
X-Gm-Message-State: ACgBeo3P8mHoKZmxNMDqtqROW2o4JUU7Sx4fJImcreZ5/VjwK7cL8nCt
 M/YJN7ahVlLrva9ctzDcbVCOeFiK05Eh8HhjppsuH/SHREE=
X-Google-Smtp-Source: AA6agR4L7KYgl8korrwk4Nim35SQ1N4IWYKgnSn4amsZoVRtLkj0zL+s+bfCqM1whqmBjsFv6tDh5G0kSnABEaSfJCE=
X-Received: by 2002:a17:902:6b82:b0:16d:d268:3842 with SMTP id
 p2-20020a1709026b8200b0016dd2683842mr22650417plk.16.1659480284640; Tue, 02
 Aug 2022 15:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-4-james.hilliard1@gmail.com>
 <20220727223102.6daf1e27@windsurf>
In-Reply-To: <20220727223102.6daf1e27@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 2 Aug 2022 16:44:32 -0600
Message-ID: <CADvTj4rvcKW-av9ajcrR0hEarYxbSfJqE2P2-1Zj7qj8NBoMQA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=GfagQge2ddWw+5+iWBf4t3635omQFxsf5Gl/UY1tE74=;
 b=KmDct2E/Uo67ROXF09+Qk18dR5p3JX4hXGRL3IO5lDdUVNN5MKgzTZLm9D2PyT3CtS
 1YcgH8w+PDoHo/w4xLLGHVk+qk0AUAK5oRJ5/Ew054cep8ql26T5yQSZBFz63C8Ht6D3
 Jk8a9Qbn72G+eQrunwQWxYo+9hPVGF9ftLpmU9VXzP7GIGpoXs4HuCABYA3DOOFGW/dT
 2sy4ECXgIm+Zfl9WEfNfWcZi2kK7kfh2N8LvGjV/CM48fLVe8cM3jI0v6VP0RZXTj3Ms
 rpsAc461qtpnm39vfCfafisdrmfNquXGyftbBSPbgg0MDB+Piwh+k97rwsIA8E0afW6b
 lNuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KmDct2E/
Subject: Re: [Buildroot] [PATCH v8 4/5] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jul 27, 2022 at 2:31 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Mon, 14 Feb 2022 18:53:06 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Currently the qmake gcc sysrootify path logic causes issues with
> > per-package directories, disable automatic gcc sysroot for qt5base
> > install and override all qt.conf paths manually to point to their
> > correct locations.
>
> Could you clarify which "issues" this is fixing? I am now looking at
> this patch because it is the only one that has not been applied, 6
> months after it has been posted, and the commit log is very fuzzy about
> what the problem is, and how the commit fixes it.
>
> I have just built the following defconfig successfully:
>
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5MQTT=y
> BR2_PACKAGE_QT5SCRIPT=y
> BR2_PACKAGE_QT5SERIALBUS=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> Basically building with PPD, qt5base, and a limited set of qt5
> packages. Could you describe the problem that you encountered, together
> with a defconfig that allows to reproduce it?

I recall it helped with qtwebengine's gn build system integration dependency
resolution logic which was mixing up host/target deps a bit.

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
