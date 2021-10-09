Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB04C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 14:17:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081E260E98
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 14:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 081E260E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A07C98309A;
	Sat,  9 Oct 2021 14:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-xW7MrEPQFS; Sat,  9 Oct 2021 14:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21CD08308D;
	Sat,  9 Oct 2021 14:17:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E51F1BF83B
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 14:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36E9560B97
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 14:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFfy5WT8t4ku for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 14:17:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ABB960B33
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 14:17:18 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id w13so13748462vsa.2
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oTiGsLJfClTIVoXYcdQJYhiz1IOQurXfl8VMaLRGGGc=;
 b=UL7e4BbSwT75B77BY9nAF5nOf9FwgMj0XxTIZLUDr5ZqQyv1RlfpyvGrPruLQ5zcv5
 IHExm19p3JxILGWr6JmmtqRCCgjWItJxXIX/8L+SpoEqdyTYAiEylpLpQtpgYfsEzhre
 IqYRGk/8VCsX+J8zqLVzyHumX604iREgyNhG0/SvBU9Wx6fV9X9A4o5JJctVRuIJdb1E
 29qaOm990kPbOuilT8qkiAt78CL3gOjCZ24kR/4BW5mZPy+QRbhkzTz/Gouq+6lEVgBq
 TN/7gLRHxFGMfGX9y/hOooO6R4JiD08U40vEhVLqUYcWgeyWzMgs5uNfynI6tHv76GJD
 4g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oTiGsLJfClTIVoXYcdQJYhiz1IOQurXfl8VMaLRGGGc=;
 b=OK6Se6TaQIGQq84RTVr69JyGc5+0iEck/E5Lp5EtN6j13NaygkjiHS2WSIAv6hk3VQ
 7IZjbtdZGZv7P16w7kDRYL1V4RhsqONKFUglQ/6puB8/OqLS6cxew/v7qDYvaXpmHh6Z
 CvuPWWHuo1WKIg89snALluxp7INn6Kfe+09r32e8/VVRGBhekdPmiduBqPhHA/oArw2R
 lRF0jljpEdEKjPRwGmeASx4lT8Q8ANBK3a7GslofB6B13Nq29+17cwlabTL61HrzQohA
 qg4OaSERfCrm25R4R4A2NTKpa4gKhTGhl7oJ4geimp5wR8T61f6ctCqHI9Xx9VOElCyt
 A9zw==
X-Gm-Message-State: AOAM533goOB/c/0H1hbAxo8+cmauCIe8a6znspqFeIXi2Wc851cmuy1S
 c2pPdhYu4b7PtbAe9qV9QePCKmk8KFOS0RtObxc=
X-Google-Smtp-Source: ABdhPJwrJVbjZmx0lavezu0RXPmHCp8a4+TNr438z/nRR/TxdNkKjM1FmELro/xYtWOfjd4fpVioTDA8sRfFkEQHYJ4=
X-Received: by 2002:a67:ee4b:: with SMTP id g11mr14233499vsp.5.1633789037125; 
 Sat, 09 Oct 2021 07:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0DmMfBTdmnrD9UYxCqEJq6gbut6WJv3Nr5QKDe_UL3UQ@mail.gmail.com>
 <CAOMZO5DZxRFKF=tnkHRk5wKzoRW2_F9py8onUk_5ppzz0S2nuw@mail.gmail.com>
 <CAJ+vNU16uqMnCDBmOMnVyLtLHzU=K61YU2Rtx_3BWYzLzMBaPQ@mail.gmail.com>
 <CAJ+vNU3qyPwoSy2YfH7yjTSkX6A=mWV6iqk8difayO0MFU42VQ@mail.gmail.com>
 <2439f331-726c-4192-b821-addce6518bfc@mind.be>
 <CAJ+vNU3fwgap6J7hWqJyRqjen=CP53OAFAMvdt==bN8wyXFo2w@mail.gmail.com>
In-Reply-To: <CAJ+vNU3fwgap6J7hWqJyRqjen=CP53OAFAMvdt==bN8wyXFo2w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Oct 2021 11:17:05 -0300
Message-ID: <CAOMZO5B2P5MHQ5D=h9L5QKtFDc7LrM-tnYrUXDWr=_mGoe5msQ@mail.gmail.com>
To: Tim Harvey <tharvey@gateworks.com>
Subject: Re: [Buildroot] buildroot config for installing kernel and dtbs to
 rootfs?
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tim,

On Thu, Oct 7, 2021 at 5:13 PM Tim Harvey <tharvey@gateworks.com> wrote:

> Can you explain what you mean by extlinux.conf approach?

For boards using distro config in U-Boot, it is common practice to use
an extlinux.conf file that describes
the location of zImage/dtbs and the kernel command line.

For example:
https://git.busybox.net/buildroot/tree/board/wandboard/rootfs_overlay/boot/extlinux/extlinux.conf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
