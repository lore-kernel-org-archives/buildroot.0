Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB768C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 10:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6151860D4E;
	Mon, 24 Jan 2022 10:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68PafXByqxpV; Mon, 24 Jan 2022 10:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADFE860D51;
	Mon, 24 Jan 2022 10:42:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91E141BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 800E6833B7
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 10:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=studio-punkt.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPavCxVTn7pB for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 10:42:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from studio-punkt.com (studio-punkt.com [37.221.193.131])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1B638275C
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 10:41:59 +0000 (UTC)
Received: from localhost.localdomain (pd9e2b73d.dip0.t-ipconnect.de
 [217.226.183.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by studio-punkt.com (Postfix) with ESMTPSA id 548FF1206A2;
 Mon, 24 Jan 2022 11:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio-punkt.com;
 s=dkim; t=1643020919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=W5ND50LYDbLfbBR99fysct6HQmnc945unLz8I2xSRKM=;
 b=aW03c98EsDGdrxnukNBbKTIPTbUmw981tS0Gonv3o24T2bKWOcvB68/TUy4Q24001FVSBq
 obTX+bVh2K9z8O5HJTpJiSF6nvHzCt3VlBiQUyt5jVOufiJSX7FCCY6+QLPmLAjeTe+X1A
 RQG93uBxk00FWECf2A/GRaCHX2QEOdk=
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 11:41:15 +0100
Message-Id: <20220124104116.12902-1-evgeni@studio-punkt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/1] fs: fix /tmp and /run clean-up in POSIX
 shells
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
From: Evgeni Dobrev via buildroot <buildroot@buildroot.org>
Reply-To: Evgeni Dobrev <evgeni@studio-punkt.com>
Cc: Evgeni Dobrev <evgeni@studio-punkt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

the fakeroot script uses [^c] to request the deletion of all hidden
files within the tmp and run folders. This however does not work under
dash (or other POSIX shells) without additional configuration.

The proposed patch fixes the clean-up actions introduced with
5e78e7e97d772124f0d31653aca33731abe5b4db .

Regards,

Evgeni Dobrev (1):
  fs: fix /tmp and /run clean-up in POSIX shells

 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
