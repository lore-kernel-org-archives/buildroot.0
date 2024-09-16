Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83594C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0431C40BC4;
	Mon, 16 Sep 2024 15:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcvrSf6LmXbT; Mon, 16 Sep 2024 15:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F1B540BD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F1B540BD3;
	Mon, 16 Sep 2024 15:12:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 81F8F1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7119D8100D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRwKCw6QLIEb for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D07A80F89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D07A80F89
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D07A80F89
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:12 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-a866902708fso89529766b.2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499530; x=1727104330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C69cBcOCOMOxlYSR58i+5h3G27SNKrgJomGCQ4v055A=;
 b=bzzlYRcJNYEIWAqEJnNeUsgD1fVnBP264UdF4155jwefyh85Aowe4R1kvK6Cux2Ks0
 U71vJlC/MYgRAbQff7gjJVAXK2JAeMtP8dJ57gbW9nOXhq+cpdVIQrpJXxSGOYmVCn41
 dqQ1u3hRrKOYM3VKFfji09i2Qgato/2+tFT6ke+Qxg7Y+eNjY5QKT6T1GKnY/tdxHFcN
 qZOlslYtpv7i+xQWyvFo7yHTKCfHvUFrkL6Ou6QGXWGwGwsh20faz1BfpTYmquGzR79R
 n+i+OzW6wcWurIvADZ/LFds3pRheHeO79dF7XSX2f3duWHsf6r6Z2WgoPv8ClhZvKCO7
 X0qg==
X-Gm-Message-State: AOJu0Yy8cqUbztshXDWC+Ea6I5JHAVhaY4X8ZdNiVPA5wKqzZJnTWpg4
 jzBCrtLQBFu9WBEjDhH+TB0cgJ2bpTAIF6kuyHQs1lTeD9rXQJSZAsy44OnACwSsSyZWeiEmPFG
 hNRgs5kLX
X-Google-Smtp-Source: AGHT+IE9iS0YVT4DqUJBS5gnB+NHhmxqQZzHvBH1BAOkmuSiaQ6fdKwF2xot0r567ayhj04ENGm3qA==
X-Received: by 2002:a17:907:7d87:b0:a8a:93ce:d252 with SMTP id
 a640c23a62f3a-a9029453485mr657447466b.6.1726499528990; 
 Mon, 16 Sep 2024 08:12:08 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:08 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:11:53 +0200
Message-ID: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499530; x=1727104330;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C69cBcOCOMOxlYSR58i+5h3G27SNKrgJomGCQ4v055A=;
 b=IfKb/PZrlXgzuRhdreeAfIYv51FTCjI05pwtYwfRTQahguGc9yesuCsuQbvzRJ5VPd
 lybKoz1KQz9gB376yA25FqO3NvQNvA3UDp5h7Spf1ECrKBUnSN4wqspdyJ5YIaa1kd26
 GI/QH5tuEKH5raH5hy43wF1byIZpIRBY7aCfg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IfKb/PZr
Subject: [Buildroot] [PATCH 00/13] selinux-packages: bump to 3.7
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No large changes other than the following:
  - setools 0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
    needed to be refactored to work with 4.5.1

  - The audit package needed to be cleaned up and a new init.d service file
    added.

Other than those two things, it's a very straight-forward patch series.

All SELinux unit tests pass.

Adam Duskett (13):
  package/libsepol: bump version to 3.7
  package/libsemanage: bump version to 3.7
  package/libselinux: bump version to 3.7
  package/policycoreutils: bump version to 3.7
  package/checkpolicy: bump version to 3.7
  package/restorecond: bump version to 3.7
  package/semodule-utils: bump to version 3.7
  package/selinux-python: bump to version 3.7
  package/setools: bump version to 4.5.1
  package/refpolicy: bump version to 2.20240226
  package/polkit: bump version to 125
  package/audit/S02auditd: fix shellcheck and check-package warnings
  package/audit: bump version to 4.0.2

 package/audit/S02auditd                       | 80 ---------------
 package/audit/S02augenrules                   | 31 ++++++
 package/audit/S03auditd                       | 82 ++++++++++++++++
 package/audit/audit.hash                      |  2 +-
 package/audit/audit.mk                        | 20 ++--
 package/checkpolicy/checkpolicy.hash          |  2 +-
 package/checkpolicy/checkpolicy.mk            |  2 +-
 package/libselinux/libselinux.hash            |  2 +-
 package/libselinux/libselinux.mk              |  2 +-
 package/libsemanage/libsemanage.hash          |  2 +-
 package/libsemanage/libsemanage.mk            |  2 +-
 package/libsepol/libsepol.hash                |  2 +-
 package/libsepol/libsepol.mk                  |  2 +-
 package/policycoreutils/policycoreutils.hash  |  2 +-
 package/policycoreutils/policycoreutils.mk    |  2 +-
 package/polkit/polkit.hash                    |  2 +-
 package/polkit/polkit.mk                      |  4 +-
 package/refpolicy/refpolicy.hash              |  2 +-
 package/refpolicy/refpolicy.mk                |  2 +-
 package/restorecond/restorecond.hash          |  2 +-
 package/restorecond/restorecond.mk            |  2 +-
 package/selinux-python/selinux-python.hash    |  2 +-
 package/selinux-python/selinux-python.mk      |  2 +-
 package/semodule-utils/semodule-utils.hash    |  2 +-
 package/semodule-utils/semodule-utils.mk      |  2 +-
 ...e-setools.InfoFlowAnalysis-and-setoo.patch | 98 +++++++------------
 package/setools/setools.hash                  |  2 +-
 package/setools/setools.mk                    |  2 +-
 28 files changed, 181 insertions(+), 178 deletions(-)
 delete mode 100644 package/audit/S02auditd
 create mode 100644 package/audit/S02augenrules
 create mode 100644 package/audit/S03auditd

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
