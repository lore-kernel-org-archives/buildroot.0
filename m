Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D3BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:35:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97E3461055
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97E3461055
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F17A80E25;
	Mon,  8 Nov 2021 18:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijm0NkiAYKcQ; Mon,  8 Nov 2021 18:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E29F80E1E;
	Mon,  8 Nov 2021 18:35:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF87C1BF3F3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDDE4400B5
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PihLJNOggTBm for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 18:35:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E54E40003
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 18:35:22 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id k9UGmI72yueW5k9UGmLDfD; Mon, 08 Nov 2021 19:35:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636396521; bh=UUMBfFDflgx7RQnzLocbulJAPryaNJqdXA1AkCBoppM=;
 h=From:To:Subject:Date:MIME-Version;
 b=YRWA1EQZKaHlfQ/k5LFaxHfNc/KUEKIqk1aP+B0jxde7qi85PBG7YGb/+CFU139Jp
 sKkrZL+ctJgRtsTxdYY9SUSVHIMyhHrQ56Yj9BjOxeChe0CsUB6BlC20/qAnNv4caJ
 lAriSahR05eB8wUYku89vU11X5Q1ncorwPID61QfgFSN58GcT0td7tFKwUA3zdub71
 bGCyfuVUW3CxW+u2+eY1pfFZbcj0fpR3M4zGG+RJmGBGgYCmpFlbm+0njB/D7Qv2mQ
 qAzAXGPDOrrPhH3ZI0djPGuq+78mTrRfUnRtnNONe9paShEWxJy2gSxwp6YxduM3nt
 Ml8JqA3TUbjNA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 19:35:18 +0100
Message-Id: <20211108183519.2561478-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211106181322.302485-1-giulio.benetti@benettiengineering.com>
References: <20211106181322.302485-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfK/xnP3eMjhTIZZIaV1QoDE0mNvIViuOg3KA26gkoiQgOQ00tnmkWM8CbJJ46URWrET+N1Iq7486+RTe0iutWICfviKcxaudpgwC66sxodCGhhSBlu/4
 bLNlOXbi3kLt7zcvdEntfjFj5wNzhytIP/gT49hiPAS8pupXhui8HWpc4hSKSyNfus1Tg6T9bulqQDzO/tffepfwYjLkZr+CItLSiMUGUAMh9zkq3bVxZ18U
 h8Qlf7ULBSRKqpnvVjcvyLBLWE7a0rBL+fs3Crw3RIV6PjW87KmAj9FAwDibvVKnRAlPTiSfk8hzOOi5/rhL0LS7GwvTfIrbCsctuw8dRIFOyMDoeoNTUkZN
 teZoQw4HZjnrZMrv+wA9W6i7Zh0dQkyxKgi77F3YDOy5w7gzb7q2pQzpH5OzkvifMDvjNbNATwyErmr/tL5/7LY4VboMKUVQ+jGzt6lsv22NG69rjx6HuKGu
 ktPD50yo0uztyRPK
Subject: [Buildroot] [PATCH 0/1] package/harfbuzz: bump to version 3.1.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Peter Seiderer <ps.report@gmx.net>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following patch bump harfbuzz to 3.1.1 and superseeds patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20211106181322.302485-1-giulio.benetti@benettiengineering.com/

They have released very fast this version committing the patch that was
local in the previous patch.

Giulio Benetti (1):
  package/harfbuzz: bump to version 3.1.1

 package/harfbuzz/Config.in     | 6 +++---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 package/libass/Config.in       | 6 +++---
 package/mupdf/Config.in        | 6 +++---
 package/pango/Config.in        | 2 +-
 package/qt5/qt5base/Config.in  | 2 +-
 package/supertuxkart/Config.in | 2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
