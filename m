Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A80AC5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC3A605FF;
	Sun, 23 Aug 2026 20:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YhcjNDIURMb; Sun, 23 Aug 2026 20:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787517591;
	bh=O3BfhgbtOS9TIFzhrB1LMQumXyochWKOf2yOTk/GJIM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MfeOCya0wG2Y+as3aysaZruQslSKXNVbEuAuCHMvRR2dcgdXNTfYhu14aC4dvjCgx
	 V8QYeN+BPryRdsaTypVRGnQ6Alxo4rF4MQ5aOoSfExmJKElaXctcWU7XSgkvVB9og9
	 Hg+pU5FEeAOIMCqddLq3FADPxIuFMTjc0JRQOoBb7XOGlOwEcYMwcgiWOA9/qwjUHN
	 DwnnRVGthUVNpX95tw/WdYMc70+rAQ0zOvSPSSQyhBelzlVKUF+7ffLUQ8juHhVEmD
	 DonpmgMstf/fECO+g4R6BYYlhyanXIOn5zc2RuuAo3ZL4uSkAa/zKbkHKeNc9IVgdb
	 IsZj60o53a86g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 283DE60747;
	Sun, 23 Aug 2026 20:39:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6603042B
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CD6140059
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taem6DaVEQ3I for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Q/K8SzL4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4574440056
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:39:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Q/K8SzL4SVhTE3wFNRo0WN9qQjGjgcTZNmUtxtvccT919b2WUhLcrgxbFzConCFbRKiRMVb/XCKa36yD75mGeQZDqQF3ZycXow63TalkV1j202fr7pftfWfPiKiI39N68xZaw5UG2Bt98phHeoGAol8/lB7ay3UK623UnlxRPNsbAO75woYbcOVQTu6A23/j3IooK6+ACLQEBr00y4zrpicQEA+gYhCAxX5/ZExHP29cJHzRxdIDGEMNeK4i5PPdSzmrITzvd5C9ZqtCKaQ6k3oCRPNxI1X6t8lkRCWBZApwGnbMJlm84rlruYNVIFhY9j7w8c1PR2PwYYqeUMbIiw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=YQHhIyOjY5+shvV34R9Q7jok/qJBwPVKdU50RpuIp2Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1785387431; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 20:39:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyEyi-0000000AQL6-49Ga;
 Sun, 23 Aug 2026 22:39:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260821164832.1906581-2-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Fri, 21 Aug 2026 18:48:32 +0200")
References: <20260821164832.1906581-1-ju.o@free.fr>
 <20260821164832.1906581-2-ju.o@free.fr>
Date: Sun, 23 Aug 2026 22:39:40 +0200
Message-ID: <87a4qcbmgj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] Revert "package/fakeroot: bump to
 version 2.1.4"
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

 > This major fakeroot bump is introducing xattr issues on hosts with
 > SELinux enabled (for example a Fedora 44 default installation).

 > Trying to build defconfigs such as:

 >     make qemu_aarch64_virt_defconfig
 >     make

 > produces error when building the filesystem image:

 >>>> Generating filesystem image rootfs.ext2
 >     ...
 >     mke2fs 1.47.4 (6-Mar-2025)
 >     ...
 >     Copying files into the device: set_inode_xattr: No data available while reading attribute "security.selinux" of /buildroot/output/build/buildroot-fs/ext2/target"
 >     populate_fs3: No data available while copying xattrs on root directory
 >     mkfs.ext4: No data available while populating file system

 > This reverts commit 344d64f38539b28a5b8753d18ceb43ff2ee969bd.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
