Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F9BC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:36:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD5E61130
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DD5E61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D81B7400EC;
	Fri, 20 Aug 2021 13:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgamvNO-ImCu; Fri, 20 Aug 2021 13:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 319E7401AD;
	Fri, 20 Aug 2021 13:36:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 983B61BF35C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 876A94074A
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJ9WQstGRzJ2 for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 13:36:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67C124072A
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 13:36:48 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso13589249ott.13
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iR016YUnZxKHmO1c7CgJykT4OxrMFLq0Anvyo7JvV/M=;
 b=IdhVG5HuJ1SYbvqKvYu8sW8drNRe3AIZB93TayOkauGsx3uJwcELR6Cf2rJPfFkiA6
 q8jEFsO/qNFNNXTd8DmNtpbJj8zl8uaRtU0CT6mzekVyuGHFCDWGC+vGsHLZdx+O0BZB
 10r975qJOgGyF2H9fOigs5gSbNw43tIL7jM0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iR016YUnZxKHmO1c7CgJykT4OxrMFLq0Anvyo7JvV/M=;
 b=EN6Qnu8Aub/2DomnDbR/QnGyvwkNWVxy4GrwlPPXodqH3ueX4+uEnIOhV27mSizTdw
 hbQPtvE6pVX2FYuaF214OR6++WTyRwAHj+7DvbUqbg/JdpSFKbIWsRX44K7eiIITaNC6
 GN3lY9ONr8J6FIkRC/RSD/OTZEzc8IMTa0otG7Ap61xxG0oFuY33ygLwCXgvjrAeY6xF
 afxzDmOVmIYQupjubDYX7vhrDubl2iP7HBPgEhSAmuJfqDXZ6LtOjYhr3Cg/IheTsR8M
 L0ioPbfR4f6g1vuGb9mNjrZ83xQtaa7JkfTMgBobDFCHlteSvb6i//YTn36MhR/Htm6B
 9ehQ==
X-Gm-Message-State: AOAM530/GAItrd/gtmXE6KWSiRWySRBAJqtCr9SJWCV0CAZmwq0X/ilJ
 P5ChTSnfTaV8aGLZdG5h2OY7rw==
X-Google-Smtp-Source: ABdhPJwz0IAcQD2l3zJHJ3tosWRptpmQiA+dRSjGSH0LRiFBK5Vpz8vIhPK8omB7AT6U8HVBqdFUAw==
X-Received: by 2002:aca:c48d:: with SMTP id u135mr2719319oif.106.1629466607315; 
 Fri, 20 Aug 2021 06:36:47 -0700 (PDT)
Received: from p1g2 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id u19sm1390743oiv.28.2021.08.20.06.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 06:36:46 -0700 (PDT)
Date: Fri, 20 Aug 2021 15:36:43 +0200
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YR+v61E8bNsqF+Tx@p1g2>
References: <20210805212736.2799576-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805212736.2799576-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/4] package/freescale-imx/imx-gpu-viv: move
 pkg-config files fixup to the build step
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

On Thu, Aug 05, 2021 at 11:27:32PM +0200, Thomas Petazzoni wrote:
> The fixup of the pkg-config files modifies files in the build
> directory (@D) but is done in the staging installation step, which
> doesn't make much sense, especially since the build step already has
> some fixup logic. So we move the fixup logic of the pkg-config files
> into the build step.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Agreed, makes more sense to do the "magic" in the build step.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
