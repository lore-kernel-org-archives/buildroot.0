Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04286C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 00:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7133C8143E;
	Sun,  6 Feb 2022 00:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ve0U-nyKLaU1; Sun,  6 Feb 2022 00:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CECEC81450;
	Sun,  6 Feb 2022 00:09:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 050391BF395
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 00:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E096C605A3
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 00:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=posteo.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_rdVXCcKYyJ for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 00:09:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF964600D1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 00:09:05 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id B8F93240103
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 01:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1644106142; bh=wd5alswuZuDSX25UaWYA9UJzBk3V8UAtEFR6We528Ag=;
 h=Date:From:To:Cc:Subject:From;
 b=RR5KbPy3LX7OriVFaDz5dfkFmddaLR+0jzQ42+8Mwy5S6ubhICTOgiSEk/tbaqyQM
 u+dXXQ6olK0qAkZ1aBOm3u5W5sz6TKXe/5QQoKMcPbxEQheo2ficzsUQiFlht3PQvq
 /O6KMB08iSl3nK930WNag5awvAWnMaiM0sk2JJVkKZAK20bir2/OekM4thgkzrSWAm
 JqlL2LLJ//7DxVQPftQrE7Hlnwh35TxcnhrZewSOu7N6iIfSy7JpIIhXAenLpMRx6p
 PbsuCpVkhO0Cie64YKLvsyvqVD+sXSzlnc9KxILF4FYZSNG1SBuCI9KQJOnXtPE+MZ
 HySdOval5WxGg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4JrqPm2nD5z6tmd;
 Sun,  6 Feb 2022 01:09:00 +0100 (CET)
Date: Sun,  6 Feb 2022 00:07:11 +0000
From: Daniil Stas <daniil.stas@posteo.net>
To: buildroot@buildroot.org
Message-ID: <20220206020711.3dc6e42e@ux550ve>
MIME-Version: 1.0
Subject: [Buildroot] [BUG] boot/arm-trusted-firmware: Stack protection
 setting doesn't work
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bug was introduced in commit ccac9a5bbb
("boot/arm-trusted-firmware: don't force ENABLE_STACK_PROTECTOR").

In this commit the ENABLE_STACK_PROTECTOR option was moved from make
arguments to the environment. But this value gets overwritten in
make_helpers/defaults.mk (and platform specific makefiles) before it
gets handled in the lib/stack_protector/stack_protector.mk.
So setting it via environment doesn't work.

You can check it, for example, if you compile TF-A for stm32mp157a_dk1
platform, and then check if bl32/stack_protector.o file is
built.
It gets built only with commit ccac9a5bbb being reverted.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
