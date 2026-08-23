Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAC2C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D29280B7F;
	Sun, 23 Aug 2026 19:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rf4K3HKohEjF; Sun, 23 Aug 2026 19:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787515152;
	bh=WcUuLU4wrnxVVvygPzN0/bExEHiG8tDwNfJPLjK/o78=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qaJ3zIE9WnheSmRrJTWyER+S7hASi8Ew7z9uBrZEhJ88iL6OTff+6TJvGE8CgHscG
	 D/R+m56Y9YZDMoWdxFIoJ6fC0605K0IYu6QaKRWXdrtCIV0v1R55Uqznn5hBGXz43u
	 9vcF4+Ug5agmVHwAtYF+oSNchZprZPE1mZjJMgUrf3GkdYqmAXjHb67ONJ2os2rPRx
	 4imSHDheN4NpVngSI4htrz4yHTtzEqyqK5qACT+loBOscMWjpartvOVWY8RABBzqMj
	 0HKR0Df5XgBwpy1CU2l/btfPX5ZuWrX1uA4o0SXhwwcVZ5dn9kiyNraH0xvcsDetaZ
	 qsiplYs7m4q6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A65B80B6E;
	Sun, 23 Aug 2026 19:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FAC2FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B1D080B6E
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0soSmqmQbRZ2 for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=BlEPAqAh
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A72DD80B6D
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:59:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=BlEPAqAh51lKMIT1gB5ikpUGDXU2pgZbsPZsvFbJng79VkfoA5+LlS+sk7aa5gXVy3JffvbsUDGJrD1meyn8Lxb/2tgt7J6E2mXW3cUSug89B9N5/i1i4U/WlsV9F5aI8fAGIUXqi1qaz2//bq/uEq5BslLERpHH/Z3NVvq2GlhJ56BeB56S7KlV7YMDkYTOueN8KGqUgQaahVQ6dS/zl/IueCPRYun6MiWbVMMJN5AfKG6nPuXVyr11Y1wifT1trN0ozqeQfIE+OGwxWNL8qCrE+cOaDkFVmOcYyLh0V8YodRdEZ6+nihAec+Ew5+OeqjA1LUDq37lEWGyIC/bGBw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=nby/mxQRTXn9iZK4B/ZnwKW7Z5hmkOdIM6bdltoUj8c=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 60579682;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 19:59:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyELS-0000000AO3D-2myH;
 Sun, 23 Aug 2026 21:59:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Romain Naour <romain.naour@gmail.com>,
 Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260821162029.1736114-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Fri, 21 Aug 2026 18:20:29 +0200")
References: <20260821162029.1736114-1-ju.o@free.fr>
Date: Sun, 23 Aug 2026 21:59:06 +0200
Message-ID: <87wltgboc5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] board/qemu/x86_64-efi/linux.config:
 enable CONFIG_EFI_STUB to fix with grub2 >= 2.14
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Since Buildroot commit [1] (boot/grub2: bump to version 2.14), the
 > qemu_x86_64_efi_defconfig fails at boot time with the error:

 >     !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
 >     ExceptionData - 0000000000000003  I:0 R:0 U:0 W:1 P:1 PK:0 SS:0 SGX:0

 > This issue happens because EDK2 and Grub 2.14 are enabling NX and the
 > kernel lacks the CONFIG_EFI_STUB configuration. For the full explanation
 > see the commit log of [2] (board/pc/linux.config: enable CONFIG_EFI_STUB).

 > This commit enables CONFIG_EFI_STUB=y.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219375

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/da278ba1dab7e29369879c8a29cbd1b42dbe9ce0
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/1c1fa6ce67448ef8bab16d795623be730ff658ea

 > Reported-by: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
