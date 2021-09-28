Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12075C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 09:44:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A582161052
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 09:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A582161052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E51C404E8;
	Tue, 28 Sep 2021 09:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m15LZHiyFKAD; Tue, 28 Sep 2021 09:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82994401F7;
	Tue, 28 Sep 2021 09:44:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB85E1BF983
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 09:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB72980DBC
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 09:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpicLTQc7q9e for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 09:44:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34A2F80D5D
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 09:44:07 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y26so50711217lfa.11
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=dX1Dgw7uMgWrYZi+F+aLI0dawcHwtcYU4zlQCVbTXM0=;
 b=g2+aMZen6Ou8u1YJoonCFKWgB+pli+L+SHmrQ547LC95MZhXaO9du182qoterztlNl
 QmkDg6e8oqmvIsMRubvPDo9/GvcP8WeP+QQQqdd+fraPsrXevnWGUTfWRZydmrET/iWf
 6+8ZLMzD/Fh03ac4LLU1/AOjaoXVL8Fi/poa14WAlwVDejAy80jaojRiF1oKdlvLp8s0
 XJKHGSQDe+61IzZ6pxCcHANFMb8X3sUCQx+cI3o42SNOoxOCyUmOhWV6lVZTPUzjJuOz
 d9isqZRoAhLIL1d80j0JEmogdeGlpFtBrZ6zD9NbSErGRaYZKfWdEfI7FpV1OwmxFeFS
 snHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=dX1Dgw7uMgWrYZi+F+aLI0dawcHwtcYU4zlQCVbTXM0=;
 b=dGf6IY9NugZZLUm2shbjft7GK3uw/dgbw6ORWY5XZEUBgNw1VS0K8Tyw4r6MtzUT+E
 sG5GbxygaMkcDMXmjlkFGWkUIWvPXXmm02XtNpfNACJkx/UMZkVST/ZehsEvVLjlS8NP
 q90ByaBHLKymjQ9q24L5+3+07Op++YHry9XK9LEha5AeKL/je7HQsbDPtXS5WosTedcE
 60ZcdCZ0ApPj9qsv4ZkqMwZcwuRT5J7DjIstlMKShlQ51vF7TI547eeN37nNc+Q0gjCE
 +tnrCPNQcgaiK7jMsXJHs0RsyXQdzU1eDM29GXquuZl40bmZJfAQD0dcH1ni0KU6QpeH
 0vXA==
X-Gm-Message-State: AOAM5330AHP+fnz0A6rSg0pbNfHqAttxCbaSKrlgPg1qPKAdEx48HKll
 +mWtkLm/MItqyKPQ8VYSIR81HqR/Xhg=
X-Google-Smtp-Source: ABdhPJxhpACOrOHIqsM69He47ftghdBbzdQb4QjpduCpLBpNdDfqSkE08CGZKAyp3YOKWCtidtZiWg==
X-Received: by 2002:a2e:b8c2:: with SMTP id s2mr4926029ljp.171.1632822244679; 
 Tue, 28 Sep 2021 02:44:04 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-158-174-22-41.NA.cust.bahnhof.se.
 [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id s29sm2481192ljd.54.2021.09.28.02.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 02:44:04 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 11:43:21 +0200
Message-Id: <20210928094323.2566981-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH 0/2] bump smcroute + misc. fixups
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

here's another update of SMCRoute, fixes issues reported by Debian,
e.g. a nasty problem with deleting routes over IPC.

  https://github.com/troglobit/smcroute/releases/tag/2.5.3

Also included in this patch set is:

 - a minor change to the start script, pointed out by Arnout earlier,
   that verifies the PID and process name before attempting to kill the
   daemon in stop
 - a backported patch to remove annoying error messages in syslog
 - kernel config fixup, same as mrouted package


Best regards
 /Joachim

Joachim Wiberg (2):
  package/smcroute: bump version to v2.5.3
  package/smcroute: cross check PID with process name in stop action

 ...Avoid-trying-to-delete-inactive-VIFs.patch | 51 +++++++++++++++++++
 package/smcroute/S41smcroute                  |  6 +--
 package/smcroute/smcroute.hash                |  6 +--
 package/smcroute/smcroute.mk                  |  9 +++-
 4 files changed, 64 insertions(+), 8 deletions(-)
 create mode 100644 package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
