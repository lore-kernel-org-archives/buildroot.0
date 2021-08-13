Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50828C432BE
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:38:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D94B960F51
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D94B960F51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B97407B0;
	Fri, 13 Aug 2021 21:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4E_8rvHAzHmw; Fri, 13 Aug 2021 21:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7E71407B7;
	Fri, 13 Aug 2021 21:38:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06BDA1BF40F
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7E9040182
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sw54oNu2SLiU for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 21:37:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp2.osuosl.org (Postfix) with ESMTP id 259F7400FF
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 21:37:49 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.42.73])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ees6mj8VpZx06Ees7mjCkQ; Fri, 13 Aug 2021 23:37:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628890668; bh=C2Ld5kjdj1eClc61xO3djhVIYhbmjUnyIiqX0tU5FIE=;
 h=From:To:Subject:Date:MIME-Version;
 b=Lq4z6KG/vOc5MdeBfRC8hcMMoj2CyBAI3+smavN9HvQjrDeFFCBCFYXATU6cpTRwd
 827zgNycoMcpqJtYIkfNquW1B1gOeqthI0Aga4lch8ArMuziSpEBiFVZ0gupvjgF/a
 mMv/XBQUjemwNBqrVOvHWbjtV4kDXZrROktEBcelHbWnvd4fEw7wLJTkXA+fzZcTr/
 fFzfkm/BQcKaCNocQJGxUlbH0W6FpVGFpUo1MFfw3sGyjncsPwjqx7BpSyfcdH3OuB
 oUYlS8lGjsu6BhjKjb2+qahp2rO+mjBG1EbAxWCJwW8U6+W7heS2ZO2cghjGneHnyG
 Mgz4W1lw8+3mQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 23:37:42 +0200
Message-Id: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNS93U62nkrP3PnTOl9oJRxbGXctoYXgxvz1i285yXaDdyXfwS+8uep/jrF8WsyYLoxBpx+cJaFj8XsmPGb0T2keVsdWNG89ZBTvk4gbeaGArV5LKbeV
 2E3LUEH6kNmIU7Sb/T9SwJvuPd3XqhKCiyKmIEYikDksVj6l1XxpyHmi0dxKg2ZDeJAQtXtlbJWCjRhpASsHUzs2ZpfoD30+RFpRPtLC8GpUkgIiluLt+PQj
 LI/BSVNYKbbtxABSntxEtFK/fX6cvb5v1sNP1+y3QTlXNjGbzM+3y7/nvqytuz/6LF9terr9OcNeMpsLF7J7zKzUtFKGWp/BtayT+kNF8apSTNGe9KPIq9iQ
 8gnqlk8ANf5STm0YfFqOtq8kwC0/dA==
Subject: [Buildroot] [PATCH 0/3] Microblaze gcc bug 97208
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset introduce gcc bug 97208 to workaround build failure of lmbench
on Microblaze. But let's also use it for toolchain-wrapper to make it more
consitent.

Giulio Benetti (3):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_97208
  toolchain/toolchain-wrapper: use Gcc bug 97208 instead of repeating it
  package/lmbench: fix build failure due to gcc bug 97208

 package/lmbench/lmbench.mk     | 4 ++++
 toolchain/Config.in            | 7 +++++++
 toolchain/toolchain-wrapper.mk | 5 ++---
 3 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
