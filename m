Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BBDC5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3D860721;
	Sun, 23 Aug 2026 20:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQTS77FMXt_z; Sun, 23 Aug 2026 20:39:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787517587;
	bh=IKDQBTYPeG5PBblf6Ul6M/vTu2E2OJz3Xjbw2zwsd1M=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lDDFVi21vLarH+ikSWB6I23OVcK8UWg+ycQP0N/4DxzNvyg6h1V45fITxr3zqhCmg
	 5G9K/fF4+Ar7HA5xqBKMfZTimuVn4q/N/HU6Qu3ItrVVC76aJiV41blcHWHTDrct16
	 PLf1N5UXTkN0f+A7mMWVPoPNmbsw7a/PDM9VXw9Zoxeh2tV8kTnySQzn404eykb0jt
	 0xHEF2zaPk52MlZPbDFTUi+nWq2cToyne3dp4YYtZeddleRe0wW1cWyJ5ZabrGAfVc
	 F7wfiP3VjMGEQ76TnGOwwGtuNZ747x18e/brYED1tj1NLPgJEIJFKqE7jAoEtC1DcP
	 0dq9nXZwLszpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EF2D606C5;
	Sun, 23 Aug 2026 20:39:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 104792FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A1680D88
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyJLU23MT-MU for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=RBeNUPkz
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47E3680D56
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:39:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=RBeNUPkzXKbkAjlpbT9IDpWfbc9rnQsN//XSaHFRbfC+WkFxnH3E25SzHHB7LjEhpoaXHyBIx0JrTfn9rlJYRNYPeS18T2dMc0WxPdbdbSKRl5EgPdXnkBpCyTEsVn7qFdqEWsmy0IeCQTy0J9UtXSHFj3hlepcwZOaiAOdQbR6LWBRu5fFEnG4d2VyAtHOD8gMov0QjQPTXVeLVGnc3U3iWrsBBxgO4tlNHynKDek8WHhcY3tIzqF1gX7zk/DGt7MBU2ZNrjwHQGuuU+CfFQUijzqCvwsNyEvWiMNUsHWcsO+nyMItwg3C7OuSD2eMRFE9i+ECOSqNvaIxrCKXaDg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=OMAB61tplyBUhjl6AcRGB/YiJ0qo/88nqS6UErwa5I4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 619566654; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 20:39:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyEyc-0000000AQKy-2K5B;
 Sun, 23 Aug 2026 22:39:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260821164832.1906581-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Fri, 21 Aug 2026 18:48:31 +0200")
References: <20260821164832.1906581-1-ju.o@free.fr>
Date: Sun, 23 Aug 2026 22:39:34 +0200
Message-ID: <87ecfobmgp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/btrfs-progs: bump to
 version 7.1"
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

 > We need to revert the fakeroot update which is introducing
 > filesystem build issue.

 > Since btrfs-progs needed this new fakeroot version, it needs to be
 > reverted too.

 > This commit reverts to the previous btrfs-progs version, which is not
 > using the nftw() libc function.

 > This reverts commit 7aba8ecc6aa74cc9c2604ac3bf5548d0d6c2687e.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
