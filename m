Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C6CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:42:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A239C60555
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A239C60555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 550E58305C;
	Tue,  3 Aug 2021 08:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiuF49goFK-o; Tue,  3 Aug 2021 08:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6B783051;
	Tue,  3 Aug 2021 08:42:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A76C1BF357
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79EE960602
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAsXL6dqKwgo for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 08:42:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEE52605B5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 08:42:51 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Aq0cmrnDxrXl6Aq0cmmCyF; Tue, 03 Aug 2021 10:42:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627980169; bh=P1cS/zCSfXj0Njj6lZQPmVLFY2s+erTXRg3zdRnQdWE=;
 h=From:To:Subject:Date:MIME-Version;
 b=FYpDG7k5ecWea9owQAdK5VVybgJahWYPWcmax4v9/K2z5yfVZqpMFlmJa32EMb7eO
 ERknsYgtO4Aw+8Cs/hnSUQciA3G5+5eOQXkjeUyGPFlkSewBW87Go4Q4sjm1k4O3IA
 KgGmKlv0YshNTNHygvb/s3g2ABueTRbIsOsyh596tIgH61syCJCzbybBgsrbWmrvBs
 zFRLsi+9A2sj4jXNzoIbIoVhFZPi+A85VoGpOEqWKvWsQ2IeeHMEFsnMri26LuiUjF
 IYfaz/0tIU7igsSEuB4ma4pbSKgYNNFsSuZFQ1OFV4Y8nLd5kx51JA8hNLg+aCRxFg
 d6ilN1VmtYUYw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 10:42:43 +0200
Message-Id: <20210803084245.2740449-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfI9QobHbQqUIuTb7jLN7iZsBdClzJFOrIcCDlgRcpRi/dc6goIo1+QdjBZ6Ss0fPVA35x7XgFxbRW1kit5SDNQvFTfjXfZRvW/CJRcEDXmiwuENy+VqN
 OFSPRiaLZRizbNssrSQvq0EkgNBz8EnL4aNa6GD3NNtQbGSoxS3LcqFwvHWeGKGkaabsBdJgJAhEXlBVn+hmR0+A+SmO5OExlCcBjrrqAnyHuUu9qP30iZCy
 kd6hTKSEQdWpJfoWBooqWo3HoErm1sVTS2gFI+qr+/2bWUXKEyAnYnHN4Shzw1z9EAHha3E3JxwWaLF7Bk/GdP0mT1R1D22UkXJglhtvZ0UlnIzx2tBNXRKB
 KF8z8COz08QgS3W8V6DkjCGZY3hP4JnMh+D27D1xT7DYlTblE0uQrM0oY4E8cvWaym8BB9AP
Subject: [Buildroot] [PATCH 0/2] Introduce and work-around Gcc Bug 101737
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset introduce and work-around Gcc Bug 101737 opened by Thomas
Petazzoni:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737

Bug shows up while building package pixman and it's worked around disabling
optimization by passing -O0 to CFLAGS.

Giulio Benetti (2):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_101737
  package/pixman: fix build failure due to gcc bug 101737

 package/pixman/pixman.mk | 10 +++++++++-
 toolchain/Config.in      |  7 +++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
