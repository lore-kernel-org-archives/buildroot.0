Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E71C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 13:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3C638461D;
	Sun, 20 Jul 2025 13:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoLY_IYO3uDA; Sun, 20 Jul 2025 13:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0EC884557
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0EC884557;
	Sun, 20 Jul 2025 13:32:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80B89117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D03384557
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C34QN2FESNZn for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 13:32:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D33784383
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D33784383
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D33784383
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:32:41 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-8890bebb4aaso1914691241.3
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 06:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753018360; x=1753623160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DjuFjlnNEaP8BkCYDDFsT0HhTfXGBcBbyM/Y7fczgkg=;
 b=TpRGf8V2Rk3dO2EcShmlCWNPKxDoPsUAdi42moarVsZDRW35Nu01uN00HTxWCB3gDJ
 G6bHZyk8GNJWHz7SqaiXJnpNUksrQuCZcOGg+jHEwqemVLO6XONbRKy2Op11vGdt0S+C
 ui0pzHcOeKy9yd/pE7BMWTsVo8+INbAW5H2jHoCotodtJKSFlltYfGdaHti1K53dNr6Q
 tpALLV+hc2d5Pl5ex7B01dTrDcpaC8LU3kChz0Smx79eDu+O/ZJJfbIx2GqQ2BhRr+ep
 6+gBJVxB7z7l3JRk0/fVvIxytC3qjo9hdF9MBpOnVYz9VVUOkjRODQzmxkLurPmwSBcp
 Ovog==
X-Gm-Message-State: AOJu0Ywqv3I+UioslhpjxQI9bUAh7R+GsrWliyruQI+2mO8hbDRE9ddN
 vPC0l9dEivSK2F0Dr+nDaVxFuGeiuvivnNydW6nhfy0M9DtZM9M/21tMSBjs4mfZXYTD1W2EELf
 gAFkxzElNuwqbsVFbzc5NiiRR3ZOxmGo=
X-Gm-Gg: ASbGnctdYzbD/NaphjH+NDVzHGuuRb4gGCZq4b+GmjnPV7zZaLEhpPKsM2IpDOuY15B
 QCe2+BpvgRd4Iw8IwKUT0O6ZIKNa/amas0wU1/asscxUUnqlSP4ekOzS5z+sV46hTWICURgBP8d
 3/kIhZUdi+S6GMKVoD2PbMYE3kmtuTKBatoHVS4v3aNVsBNWcuzcAAObW9kl2kthQb1iaAGfz5A
 hv03zGj
X-Google-Smtp-Source: AGHT+IFImy5qSQOI6sHFXTHzGqak21xooLhPIyFRTz5MeIW7/irkBT4MuUuHZMfmtCE0EI3yCCJXunNS8NYFfTUSybo=
X-Received: by 2002:a05:6102:6894:b0:4eb:2eac:aaa0 with SMTP id
 ada2fe7eead31-4f9ab385f20mr3989651137.19.1753018360177; Sun, 20 Jul 2025
 06:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250718040903.1386179-1-petr.vorel@gmail.com>
 <07b1fa0c430c0c566d444c48bfcf1df1@free.fr>
In-Reply-To: <07b1fa0c430c0c566d444c48bfcf1df1@free.fr>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 20 Jul 2025 15:32:28 +0200
X-Gm-Features: Ac12FXxDSHOe8RP1h7y40NIXtexskkrPb_blJ08Y4wISrffNFhRxk2dygyTtEZo
Message-ID: <CAB1t1Cxj292thNm5gvp0fSTW22csAVGvY334rs88PiRQtW=uAA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Andrea Cervesato <andrea.cervesato@mailbox.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753018360; x=1753623160; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DjuFjlnNEaP8BkCYDDFsT0HhTfXGBcBbyM/Y7fczgkg=;
 b=WCtSsaXMt0AfbYFNb1cIBwVHAHawHU9A1GFQhYSH18BdAObW+RoYIrJ5Xasf7Jra7I
 16bmikBl4RADaKmtfzUNxCKSURHN0/zKS4sSDEVFwPesxKB0XfkCDByZP/ksucIlY/tp
 90iTK2B9BC0lmrpqdPMzxT2MIzwRaoMgtp32Hi70L5Q5ru/cdhrepOUuunrTgmb+LFZp
 BjgEjMROweVQyz3tWyF6MZdYCPYsQ6YkacSrBPDd7lDj66UdZL5x4oAPRN07mkJcg+BT
 NFqqtjJbiLH9kfMBTVwrhwNGPdCYv5GWTR35BQ5FiE1YW/b08/FloOzHVMeUuFHN5Eme
 szng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WCtSsaXM
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: backport musl
 build fixes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sat, 19 Jul 2025 at 19:23, Julien Olivain <ju.o@free.fr> wrote:
>
> Hi Petr,
>
> Thanks for the patch!
>
> On 18/07/2025 06:09, Petr Vorel wrote:
> > Backport 2 commits from upstream which fixes LTP on musl on kernel >=
> > 6.14.
> >
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi all,
> >
> > I did not experience the problem on current bootlin-x86-64-musl
> > toolchain (used via utils/test-pkg), but Andrea is using a different
> > toolchain based obviously on newer headers.
>
> I am able to reproduce the issue with the following commands,
> on branch master at commit 7c8cca9:
>
>      cat >.config <<EOF
>      BR2_aarch64=y
>      BR2_TOOLCHAIN_BUILDROOT_MUSL=y
>      BR2_LINUX_KERNEL=y
>      BR2_LINUX_KERNEL_LATEST_VERSION=y
>      BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>      BR2_PACKAGE_LTP_TESTSUITE=y
>      EOF
>      make olddefconfig
>      make ltp-testsuite
Thank you!

>
> However, this patch does not seem to fix it. It is probably because
> you added a patch modifying configure.ac without adding in
> ltp-testsuite.mk:
>
>      # 0001-configure-Fix-build-on-kernel-6.14-headers.patch
>      LTP_TESTSUITE_AUTORECONF = YES

My bad, yes touching configure.ac requires LTP_TESTSUITE_AUTORECONF = YES.

> Could you confirm the reproduced issue is the right one,
> and adding _AUTORECONF fixes it, please?  If it is the right
> fix, could you send a v2 including the commands to reproduce
> in the commit log and adding this _AUTORECONF please?

I'm sure it's the problem, but since you provided a reproducer I of
course do the testing before posting v2.

FY there is also problem with uclibc-ng, but I'm not sure when I get
time to fix it.

Kind regards,
Petr

> Best regards,
>
> Julien.
>
> > Kind regards,
> > Petr
>
> Best regards,
>
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
