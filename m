Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E447C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 15:31:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0445601FF
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 15:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0445601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82FC640010;
	Mon, 30 Aug 2021 15:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ODG9Ppc1qdO; Mon, 30 Aug 2021 15:31:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB0D7400A8;
	Mon, 30 Aug 2021 15:31:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 765D71BF3E3
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 15:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7214040491
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 15:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kgfy3n7Z0uWe for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 15:31:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15F8540466
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 15:31:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id p15so26602047ljn.3
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 08:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=5TihpaYp3lGoikOCJy83fubkO+hmmONiCScn49lhyIU=;
 b=EXAwkXbry4I2cXrf7RapfOzyIIEl8kQ3C1RSMvtDHjY9j74fv9vEaXt1dD0Wp6AHy5
 NN2U6/sDMCb+zh4CGI5NYR4L9WZrF9StW7Mm2fyG0z+8o6xchaHozTzbdhk1e9A9SExy
 1zyNEdptfLT6crZzWyFOxwDzJVtYZvj2J+Ddx6LlEPK/zdhLofr+pKdHLJ5x5fmfjfjw
 vyOEFrAUeJSKozEb5L3/qreK1QWjPDd70ckmNqSKJuZ9teZD8+0Y09pQRa1fDksQJmUh
 N/ZcdwqZFvvCBgic5Mysbgpc97fhKcC+QTYQHe/ELSIwtmWBdzinH2DDYZ2W83lCwfcd
 ZDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=5TihpaYp3lGoikOCJy83fubkO+hmmONiCScn49lhyIU=;
 b=Po5wM93c6HFlxG0+DuAbXXTMHVdYTcc+L/R3YvBfsUbdgpFLNrQxA31KpxXBayDZl1
 Ghrc2D+WAEUnuQrvUuuSybTxWZj5lbksdmOGOwUvJrnBuujiBdVW6/6iOAmX5LGX8mbi
 hwHcZGY2IVdz/14iX0QxlerRqaczW0Iawei5DeeSEAKfNs8owtFyiVhw84pKKKv/xgDK
 kt/sHLHVmAONrgFVdLJkl6olq5ai5F/fwvNExUwAVZcMn4By6XwMMIo6lilkPHTOT23d
 CfwqQ09vLMGk/4yVO12nvLjwsTS+XsOhizfhW7e4DpPYwRG44sBMUkznrGb7UE1MtZlI
 Y9ew==
X-Gm-Message-State: AOAM532sm2dwL8CnM5NNDceGREr1z65xlHjrzKSQOsxeyH/mi8PFfbnX
 6DuDfDIGfW/gp8+Br3PuvQdgk+cl/CJjpg==
X-Google-Smtp-Source: ABdhPJzOHsYTKwqwOoPypvEX8iuWWakHXZrJAW7+G1zvOMrlbb/VEfoQGNAFWEmoNRB6VuNXgW4qcA==
X-Received: by 2002:a2e:99d9:: with SMTP id l25mr20818713ljj.217.1630337467766; 
 Mon, 30 Aug 2021 08:31:07 -0700 (PDT)
Received: from wbg.labs.westermo.se (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id k20sm1871343ljc.2.2021.08.30.08.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 08:31:06 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 17:30:53 +0200
Message-Id: <20210830153056.3176678-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH v2 0/3] bump smcroute and add start script
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi everyone!

This is the third version of the patch to update SMCRoute to the latest
version.  Previous versions were audited by Yegor and Thomas, thank you
for that!  There is a fresh bug fix release upstream and this patch set
has been updated to reflect that.

Also, there is now a SysV start script included, installed when a SysV
init is used.  The upstream systemd unit file was already instaled when
systemd is used.  Both of them support an optional /etc/default/smcroute
environment file that is sourced before starting smcrouted, for site
local cmdline options.

Basic tests pass:

    $ ./utils/check-package package/smcroute/*
    56 lines processed
    0 warnings generated
    $ ./utils/test-pkg -c smcroute.config -p smcroute
                        bootlin-armv5-uclibc [1/6]: OK
                         bootlin-armv7-glibc [2/6]: OK
                       bootlin-armv7m-uclibc [3/6]: SKIPPED
                         bootlin-x86-64-musl [4/6]: OK
                          br-arm-full-static [5/6]: OK
                                sourcery-arm [6/6]: OK
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed

To verify the integration, manual testing from a clean master branch,
has been performed in Qemu (Aarch64) using with both BusyBox init and
systemd.

Best regards
 /Joachim

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

---
v2:
 - fixed incorrect use of global CFLAGS in .mk (Thomas)
 - bump to latest upstream, v2.5.2
 - add sysv init script with optional /etc/default/smcroute
 - clean up compat script wrapper post-install

Joachim Wiberg (3):
  package/smcroute: bump version to v2.5.2
  package/smcroute: add sysv init script
  package/smcroute: prune old smcroute compat script

 package/smcroute/S41smcroute   | 48 ++++++++++++++++++++++++++++++++++
 package/smcroute/smcroute.hash |  7 ++---
 package/smcroute/smcroute.mk   | 18 +++++++++----
 3 files changed, 65 insertions(+), 8 deletions(-)
 create mode 100755 package/smcroute/S41smcroute

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
