Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32943C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:50:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BC0610A3
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2BC0610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8355404AE;
	Wed,  6 Oct 2021 15:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ag5EKvBfqeq; Wed,  6 Oct 2021 15:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCE4A40762;
	Wed,  6 Oct 2021 15:50:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEEA01BF947
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC86760EB1
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjLwZoSiCYf8 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:49:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8AEE60EBE
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:49:21 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id p11so11588479edy.10
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dl7wySB7F1EIuHSAUhJNYcsz0f/kkBsZ0eHdSoPbOVE=;
 b=FLxApjDK2j4b3mBRXWhpltI7BfTOGVGwSYZYsUXgraLAkSbvy4X3tWhOep7RMIa8KK
 UKXs8oXWtXFWWn8oMO1YWcCnQRBRZl9ZM5BBfidry+p4rsJVNoDD2VZ1lTcdOWMW2kwv
 lt6+u6o9zNUkrvGEIfZ+dPUGra0Z3f4eVbWiJnB5WB222OjUltmjqWhl+qqhTXLVd4l2
 xkI8ZQb4AmZuFETQKDUKKMzs3h+Ugs437DIojzpEPIHt0B+wD4rCCceHlx5+5EeLYkus
 WmwTIZBacTfrL6s/KGNj8xYd0fTqGqCCFf0vyyiNSQ5FV+KyUMtkt/SLek9HTnrkws5+
 7Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dl7wySB7F1EIuHSAUhJNYcsz0f/kkBsZ0eHdSoPbOVE=;
 b=6GfGrbYqwgmFb3RF/jl9H3zwHkWBS5NW0cg8QSED7pnWIqGGZg/+8HWZRiqPm1qa4I
 Migf56Q3EOPsUTwdls3xSJYhKkHMLjVilFiWRrAC0URPpIxNNeWLQkSKde0M8z9v0pMG
 kDKbY6yv9ni+gqgz957kUQ9z7MFrpkxvH2vCTg8vue2oCG0E6w1Ht4JPt+0+nudPX2nm
 z1Caiut/t9les+GmAXH5nPhoh0b/z61M9dltvcWsv7ilhVXm6+tiQnfsekvEMtAwJezs
 ORgelrF+eSGPB1dzYCXjB57j7fsDLgRJ6WgGyEl0rXzQYoMYLIKZXo02SFAZo1myjD91
 Yemg==
X-Gm-Message-State: AOAM533O+/VvRZ0sm2prgpSWpvG55L7OdqHkRa5AbmBN8pBSPy5Qg2aY
 vkKSXpfzNDiJv5V3kELPFR3wrnmFEogv9mME/HL1PTJ1
X-Google-Smtp-Source: ABdhPJxh9YHt6hjylu2/P6Nxq9x0SIatYtm8rDP0LrTw9Wv5OECTXBaCxE0BnShilk5WVfbM2OQ7t/oCAno6uQCNHSM=
X-Received: by 2002:a17:906:1e06:: with SMTP id
 g6mr26108447ejj.215.1633535359619; 
 Wed, 06 Oct 2021 08:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210928085436.583218-1-asafka7@gmail.com>
 <20210928085436.583218-2-asafka7@gmail.com>
 <87k0iq5gtg.fsf@dell.be.48ers.dk>
In-Reply-To: <87k0iq5gtg.fsf@dell.be.48ers.dk>
From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 6 Oct 2021 18:49:08 +0300
Message-ID: <CALFsTFUL2AuH4kC7bGgJmkapsmJQu5N3zO1mpJhFs=_j-QwzEA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-oauthlib: bump to
 version 3.1.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, Oct 6, 2021 at 6:11 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:
>
>  > Plus, indent with two spaces in the hash file.
>  > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>
> The release notes states that this is now python3 only, but you didn't
> change that here?
>
> https://github.com/oauthlib/oauthlib/releases/tag/v3.1.1

You seem to be right, I probably missed that.
I'll send a patch with an update.

>
> --
> Bye, Peter Korsgaard

Thanks,
Asaf.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
