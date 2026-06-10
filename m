Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900F2CD98C7
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 20:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491F882309;
	Wed, 10 Jun 2026 20:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6cuKRccdaGt; Wed, 10 Jun 2026 20:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8BB882307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781124876;
	bh=qf3VsZsdhQ5zLPzrKDROoLIV+Fqyqz6qlKwyJ1GhPNk=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WRLorWo045uOcNhF4qr5fJE5VbGz59O337KnAF2ydec+TIK8DkghLmdtwtg2S4cQz
	 1J+t8kY/B4bq6oF589wiTdGXEEROOzZB7mGYmwgRnS/ww59jP9QXchrUUaL2Cs3p7W
	 0m+byPNdS2h0deb4hU/KYYv5uWtsUwzTZaDVVCu6c9q3eFdDSo6zq3/cxOzv5n0J0S
	 FEHS1O8kqid79MZp1Jm1rNKis9txDv7Ed5oY+uUeduDTSP5krIh1CZfk/P0LWMUbbz
	 Qny1TxnNmZXXBfvYGOR3ik9sJdz150sdgf4DfHHv0R/AlWXIDRlGTnWAXfIGfcSkBQ
	 53IV3qqqVFHeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8BB882307;
	Wed, 10 Jun 2026 20:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 546DF187
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 20:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 466AB60D70
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 20:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3WVxacFznlG for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 20:54:33 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=ben.wolsieffer@hefring.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00F0460D68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00F0460D68
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00F0460D68
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 20:54:32 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-517863a2edfso57862311cf.1
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 13:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781124871; x=1781729671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=my1S3Q4Kas5n0ViUkzQxOg3grxHDdsbjBkCQlnCXN/Q=;
 b=OFnwG6LcYPLUs/0p3+n2urlq/wfSNPoCoqp2nD+qT2nGOC8Nraw4VzsF9piQN6vJQg
 QGXczXewMpHDqOVt+nu1ulgIIoLYngquIrHaUQcRxK1WjO0g6K9YBcF1PZoNS6v+xpA8
 wFHCzMEtpwkHdMRFkuxGupgfHGlylDwCfEJGenqK7oOq7LsjQAZj3piU3MLIpmNwhALG
 PBPpf61YTMslpMjDoPFL6okh87YK8SdEYJUN3O1SJxnlDYTEzParLVeC93TuLPtJNBHA
 ZXl1AbKNfvQ9S8YsjBy3cJfcnDQIadtb+CLEBEzdAAvJcsSz2Svp7Ka2COL3gGGK8wdT
 XPMg==
X-Gm-Message-State: AOJu0YyqGne3ajMXZlzFI491sUiqrv0CIAwBP/PQtBXCoSP+IpADogKa
 yXbSbwSKzneojuZWEThOy2GiANTBOKVZ6psP4CWCo7WxD4arRQxerNWdtTiy3DaVr4zQECQdL8h
 I4ibl
X-Gm-Gg: Acq92OGYcnhCG67stsB3/bL0jRGNHHPuFlF/GK1eFOoMEmMUOMcEYdJxRI+fFNS2S7q
 LJExsaRE7D+0kI6i/FIAQW36byFKmPykm2zlrRX7QSegwoYld+eYKxYji5NChrvWv6H0pGZzfxu
 hIgCqbOzA2U4xjvf9SsrqCdMSQc9AC3GuJy/fr+RQSmOF2e+p+Lh8YOZ9F4O2d32hB2eE+fLGer
 KLOEPJOWIkm4UIpqjL9gAEsuoa1PwxVIOSiaFOxQYQ7y3E0lD98IerEhZ0z0xIxLcV6HHVSwlhL
 iS3JH7rkPsFZlmNlrIACkwKRIqzebAFmmfix7vaROhwHwg5Myq3vXIqkvhfUAZmUQAjeYZJSQCL
 rcEqrj+wy+FTntMLDoH12DZ9IOpCQoEQNbaczkUEchK4kMoya6LZjW1HSB9XSanwYYpXb6rjI3O
 f9pMRU2PLFn0o2T1OWF/5v0nqTFZMN0lr9s1/9bXI=
X-Received: by 2002:ac8:5702:0:b0:517:88a0:9b2e with SMTP id
 d75a77b69052e-517ca51751dmr137713361cf.4.1781124871516; 
 Wed, 10 Jun 2026 13:54:31 -0700 (PDT)
Received: from dell-xps-15-9500 ([2601:18c:8002:3d41::5])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51795d46f12sm170723591cf.16.2026.06.10.13.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:54:30 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:54:28 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <ainPBN-nPls65Mwg@dell-xps-15-9500>
References: <20260603201439.3893380-2-ben.wolsieffer@hefring.com>
 <87qzmnjr2g.fsf@dell.be.48ers.dk>
 <aiCZpdX4M_muNuQG@dell-xps-15-9500>
 <87ik7ykbex.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ik7ykbex.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20251104.gappssmtp.com; s=20251104; t=1781124871; x=1781729671;
 darn=buildroot.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=my1S3Q4Kas5n0ViUkzQxOg3grxHDdsbjBkCQlnCXN/Q=;
 b=YNSJ5cxmhuTmD/ZWayZz6tg1ZWI2fVNq/BXgpMpLRpxJTScQUrHbSUYkGjSBllPf8a
 LqePp3jElhwmet1nzoQPqmx/Cm3BE0vZ+ZxeJJmi0g7lkmcfskQqbesL3ZBsJvJE1Exi
 Kpr2RsMfQp6djn62R7el3a3q6HRW0IuS/PQSaS5wbl2zMQlvdqNBYG+dVCRwdZPfpY5W
 RELq3FK5WQ/oSGbJeqM85Gh4/KjwQQofyaCQxEzt7Zc4OjC22g6aKn4pgIF7f/0gMDKL
 RbJjIaeT6sdtroxSA4Q+kSCCutipjaGU/joaLyrbEuw5l8O14ugXKFbaX/yXOQiI/rHu
 S1cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hefring.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hefring-com.20251104.gappssmtp.com
 header.i=@hefring-com.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=YNSJ5cxm
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: allow installing only
 sftp-server
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

On Thu, Jun 04, 2026 at 09:33:10AM +0200, Peter Korsgaard wrote:
> >>>>> "Ben" == Ben Wolsieffer <ben.wolsieffer@hefring.com> writes:
> 
> Hi,
> 
>  >> Out of interest, what advantage does this have over gesftpserver?
> 
>  > I have come across gesftpserver, but I admit I have not used it. I was
>  > dissuaded by the "experimental" label and the lack of recent development
>  > activity, although the latter could just be that is not much work left
>  > to do.
> 
>  > In general, using OpenSSH sftpserver provides full compatibilty with
>  > common clients, because it is what most people test against. I see that
>  > there are a few OpenSSH extensions not supported by gesftpserver.
> 
> I have so far never run into any compatibility issues with gesftpserver.
> If you are concerned about openssh compatibility, why not use the full
> openssh in the first place to get rid of all compatibility issues on the
> ssh level?

I went ahead and tried gesftpserver. It does seem to work fine for my
use case. When I originally made the decision (several years ago) to use
dropbear and OpenSSH sftp-server in our system I didn't carefully weigh
all the possible options. I didn't know about gesftpserver then. I
defaulted to dropbear because I wanted a minimal solution for a no-MMU
system with 64 MiB of RAM. It is probably possible to run OpenSSH sshd
in inetd mode on no-MMU, but I haven't tried.

> The two sftp-server implementations are more-or-less same size
> statically linked, but with your patch openssh-sftpserver pulls in
> openssl and zlib even though it (AFAIK) does not use it, so depending if
> you already need those for other things it may end up being quite a bit
> bigger.

Yes, I forgot to mention that I also use a patch to make openssl
optional (only enabled if BR2_PACKAGE_OPENSSL is explicitly enabled).
zlib could also be made optional. Also, because I'm using a no-MMU
system, I have patched out the BR2_USE_MMU requirement and enabled
UCLIBC_HAS_STUBS to allow OpenSSH to compile. This works because fork()
is not used by sftp-server.

> With that said, if we can find a clean way to build openssh-sftpserver
> without pulling in openssl then that would be nice.

Since the vast majority of OpenSSH users will likely want zlib and
OpenSSL support (to enable compression and a wider range of crypto
algorithms), it probably doesn't make sense to require the user to
manually enable BR2_PACKAGE_OPENSSL and BR2_PACKAGE_ZLIB to get support,
as is necessary with my patch that makes OpenSSL optional. I want to
reach for the Kconfig "imply" directive in this case, but it looks like
Buildroot doesn't use this.

An alternative is to have BR2_PACKAGE_OPENSSH_CLIENT,
BR2_PACKAGE_OPENSSH_SERVER, and maybe BR2_PACKAGE_OPENSSH_KEY_UTILS all
select BR2_PACKAGE_ZLIB and BR2_PACKAGE_OPENSSL. 

Thanks, Ben
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
