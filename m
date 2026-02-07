Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16823EE0AEF
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 17:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E8140B66;
	Sat,  7 Feb 2026 17:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4k2VS32UM-pt; Sat,  7 Feb 2026 17:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9924540B56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770486289;
	bh=cZnvG4DpdnY0E/iP+ULbRHA3YKhVmHKyqG545/K4jCg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U8KMJNlDQBoa9Z07d69WgUMj22CO7GzgM82YjxaFbPrZ2Ut+jWVZX7WQnvKlRXKPE
	 ozGUuhstaU2TYZRuX7NZLUG3ScwcB1a5hRvgoiAHSZLtKPwJGuJFloUBav8NjMTIDN
	 7nwDERlYv7nxBO3bnAgGLH82DYiX3/mduvT4yB+MtggJdikM6YHexLqi5o59xT6fNE
	 N74Y3m6muiUwD0FCPi0pukWmVe0hvG5aMiTBX7ScGgELi2WYW1OD/P2IeqgedKW/7C
	 p3/tvIThFeOYIVghaQrKUYDm52GnY0Ny0S5jjwP99KbPllUjicJoE3JO++VrwT4N7T
	 QUYcXhuJpk/OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9924540B56;
	Sat,  7 Feb 2026 17:44:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4F6173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 17:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6933540B56
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 17:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_cJ_GwhZPpZ for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 17:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1FF940B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FF940B52
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1FF940B52
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 17:44:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B4BCA2003D6;
 Sat,  7 Feb 2026 18:44:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Feb 2026 18:44:39 +0100
MIME-Version: 1.0
Date: Sat, 07 Feb 2026 18:44:39 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
In-Reply-To: <a3063f6b395a568ce5bf56c64228bb87@free.fr>
References: <20251108105905.2713315-1-dario.binacchi@amarulasolutions.com>
 <a3063f6b395a568ce5bf56c64228bb87@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <d0ed0d4de1cecfb3c52ef725148b4ecb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770486281;
 bh=gv7dQTwUeZBifKX5/rUxnh+8jf9cE1JU94NfSq5tR7c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PdZM+rc2OZx5ZS01mgOKZaLB97GZ3rxI/jXTq8V8NU6aaqFijzeN86KX1+T6RITbL
 9ezmnUg3j/ViE0zyDDs1bj4NPWQ2E3NtQqVctVY3oAykxzF6XsIOwjHqtP807UAdya
 +sbn4PXa8A+V0NVHYl9gSmI84xixPnQFu9LXIqpPnSHjitkuGJSdh6F6yrkgq9dVyX
 JNLHu4Q+uai89AfxmYFW5PdRlCuEPSg9beOsT2xIlQ4Biu4lLuW3jrzCRAIWuLIXG+
 oTUnmc5XjicLNUukbE9GIAwwfNlU5ccOdmCgASzSg4qJ8H4sY+FSCZ+B4SSJiocyL9
 AmCzZLJD4voiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PdZM+rc2
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump to version to
 6.17
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 09/11/2025 21:43, Julien Olivain via buildroot wrote:
> Hi Dario,
> 
> On 08/11/2025 11:59, Dario Binacchi wrote:
>> For release notes since v6.10, see:
>> https://github.com/kdave/btrfs-progs/blob/v6.17/CHANGES
>> 
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> ---
> [...]
>> diff --git a/package/btrfs-progs/btrfs-progs.mk 
>> b/package/btrfs-progs/btrfs-progs.mk
>> index 273c7e37f2b9..220ea80c7192 100644
>> --- a/package/btrfs-progs/btrfs-progs.mk
>> +++ b/package/btrfs-progs/btrfs-progs.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  
>> ################################################################################
>> 
>> -BTRFS_PROGS_VERSION = 6.10
>> +BTRFS_PROGS_VERSION = 6.17
> 
> This new version seems to prevent btrfs rootfs to boot in Buildroot. 
> See:
> https://gitlab.com/jolivain/buildroot/-/jobs/12025863112
> 
> The target tests.package.test_btrfs_progs works, though.
> 
> Could you have a look, please?

For info, I've hit that issue in another context. The issue seems to be 
related to the
upstream commit:
https://github.com/kdave/btrfs-progs/commit/c6464d3f99ed1dabceff1168eabb207492c37624
which introduces the use of the nftw() function, which is not working 
with fakeroot.
The generated rootfs does not boot because files are no longer owner by 
the root user.

See also:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1081976

I don't know what would be the best way to fix this, at the moment.

>>  BTRFS_PROGS_SITE = 
>> $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
>>  BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>>  BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
>> --
>> 2.43.0
> 
> Best regards,
> 
> Julien.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
