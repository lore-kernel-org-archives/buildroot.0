Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F52EFD0078
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 21:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F80B40C60;
	Sun,  1 Mar 2026 21:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laDfcspQ8jdH; Sun,  1 Mar 2026 21:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91E2840C1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772400177;
	bh=+4iIHUiTDJLGoJenD2a6JDm5P/V1a0I0RTaaLe/S8ng=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJcPPbrW0BborLYl5+sO5uGAFb4rD62VKNdTCHZKg+WzsaiTqJGPllBesFBJb9qMq
	 lsNTCRBUESDZ91DYIOJauOws4otw+yZKjuaMe8aW7MAOlLY4MVxTdlYtkuqG4pROFE
	 fmEJIC0yhY6JPSqm4JuIgXrhPfBjegG1ATA0fUeq66l2trmf0WgiBHTA5z2uTgduqw
	 6y1StfdluJiiSjA/V7K51+TUyS18d+8yeZsnAoky+hwyokmlXsyyBD9N1isDf6+wqa
	 JQOwY599k50Xx2jwfoUQeWWgMqpkMn7gOn66aH+EOTj5Cs6fUIvPCzaKdCH80HNuRT
	 xBLViYtGYeMyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E2840C1D;
	Sun,  1 Mar 2026 21:22:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 491AC24E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4622E408BE
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5WAx3mBdTKs for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 21:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD59D40515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD59D40515
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD59D40515
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 21:22:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 466660523; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Mar 2026 21:22:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vwoFT-0000000D27A-2wQ2;
 Sun, 01 Mar 2026 22:22:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Jared Bents <jared.bents@rockwellcollins.com>
In-Reply-To: <20260301193708.3268222-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Mar 2026 20:37:08 +0100")
References: <20260301193708.3268222-1-bernd@kuhls.net>
Date: Sun, 01 Mar 2026 22:22:47 +0100
Message-ID: <87ms0rmehk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=bWUeHsWLYIiAXP3hiPhYGpgAoYMiBspLIC/xw1x1EzpQ1NQpLIHzg9+QuFQUwJyokKH+m3K64vxKvWce3L+b6F60odnviL7OlJHQl4LtY4fMFxLnZdTo6mp4pqt6WpprT+orNe56OH/gw6hTOMWAa10UOZnTmfzG44yr6z7WG8AOfbrLjtLPgPmBXewpMLzc3SYpFVVlXi6mJ6ridw/Fjj4x+gQ9P98m/WoMf5Ue7Lr1B3+plPwquhVQpprb98Kxyrw/Inr7Lgvs5Ycc5W4nf8u/EFfexCt2S2ejI8JlHoHYjftE8+uAi4Kxb56opJmKNn/rRg9N4vBi55Bhs0Bd8w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=fKDFO6J5HKt9UPALRz9jlTJcKtDWLFDUwt1/wqIYF8w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=bWUeHsWL
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: fix dependency of lxc
 support
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit ed12e2fbed3d4298ebff9da54fe56b91fa75c41e in 2021 added
 > BR2_PACKAGE_LIBVIRT_LXC which selects BR2_PACKAGE_LXC but did not add
 > the dependency !BR2_TOOLCHAIN_USES_UCLIBC which was added to lxc in
 > 2019 by buildroot commit 63aad8a53e33e3fae4793e05662f47637e9e9bfc
 > causing Kconfig warnings:

 > WARNING: unmet direct dependencies detected for BR2_PACKAGE_LXC
 >   Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y]
 >     && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]
 >     && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y]
 >   Selected by [y]:
 >   - BR2_PACKAGE_LIBVIRT_LXC [=y] && BR2_PACKAGE_LIBVIRT [=y]
 >       && BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
