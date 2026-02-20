Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEDCC55ABC
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A5483DF2;
	Fri, 20 Feb 2026 11:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLUbLMOFnrFx; Fri, 20 Feb 2026 11:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD60383E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588399;
	bh=VIvKKWe35q/YVon/lRNvX4uDAyZeL5XQZcaNqU4CSXY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=M1etfIFWBX35mxapvRCygpPMjsK1ckCaQB9Kqk6LHWFL04319/NSTRmlLkr59V1ip
	 4DlA3hQdbGNLTI5sRxzC4yUUoREME3aFgr/UCI0COTFNuXWiFw+VhfiqiHCpW0z0cc
	 liH0eX1cDallq6GbLmrmXiLUKDx2e9nTk8sMtvHZ1objtKi/BLCKT4MZle4tbFd5z0
	 cFXx5HPL4VtfFPP50g5y0BwwEev/vR7Kks7dCpRGWsrVL2U5umOjcR5x+2roIH0z6b
	 U1Qz7KH/VNH7t1domUlprq+kcVfhFjezL7AWS3usl8nV9Vunt1OkMzStXCcq/YpeIV
	 90eKfNsgmACEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD60383E5C;
	Fri, 20 Feb 2026 11:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE2B4206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABB0B83E5C
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NT6t3_DeeIdm for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:53:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 081FC83DF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 081FC83DF2
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 081FC83DF2
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:15 +0000 (UTC)
X-CSE-ConnectionGUID: SnotP8d3Q0Wyi6YaurCOkg==
X-CSE-MsgGUID: cTFyrbrySSqtMUQXc79ong==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Feb 2026 12:53:13 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:53:12 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 20 Feb 2026 12:53:11 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Feb 2026 12:53:10 +0100
X-CSE-ConnectionGUID: KryLjP1zShGtsRbL0/DqsQ==
X-CSE-MsgGUID: MjjrSWZ5TXeljslGJm7aNA==
X-IronPort-AV: E=Sophos;i="6.21,202,1763420400"; d="scan'208";a="398431875"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 20 Feb 2026 12:53:10 +0100
Message-ID: <cover.1771588390.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771588396; x=1803124396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C1q0Y3KWJrbMpHsKrDuipjFmTzd+0PtgXkmvFKfPRNM=;
 b=XJn2WATi4xzcwefUzvDbMmIw/ZTLBhYmP3gDwLIGOXv5AcsipAO4AnmZ
 6AlpOZTblhufeSi6rn62ifwQpXz985C9vHKpVnCMJgZV23odqyYrqSGmJ
 98tclW3mnsoap6j+GF+E6428c2Stv/ZJ6BTs78gqYrWrgTL1Ivuf2FPHA
 wVSuSFYBQmIk2pRULWkSM4KPKcQX0kwSYNfZ5LtfranN+EB/gOEu5WaCi
 /0Sgq82inv7U1jMblSXkwEt6zx/KWFDCkEYWgPxOHVbWNIRiZnzP30vKJ
 tbSl5IYZHyHKDQ7eDWJJo9kYdPpWpB3mQPMfPBPMU5Q7mng7OEPhgczij
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=XJn2WATi
Subject: [Buildroot] [PATCH 0/8] package/mosquitto: bump version
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
Cc: Danomi Manchego <danomimanchego123@gmail.com>, "Yann
 E . MORIN" <yann.morin@orange.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This series brings a new version of mosquitto; it is quite a big
endeavour, as it has switched to using cmake. With this, it becomes
possible to easily install only the parts of mosquitto that are needed,
and we do add some options to that effect;
  - CLI tools to talk MQTT
  - CLI apps to interact with the the daemon
  - native websockets, or legacy using libwebsockets
  - HTTP API
  - plugins

The 2.1.x series is still quite recent, and has already accumulated
quite a few fixes; the most releveant ones have been backported. As
for the few patches I've authored, I'm still waiting for internal
validation of the Eclipse CLA before I can push them upstream...

Changes since RFC:
  - add options for various parts


Regards,
Yann E. MORIN.


The following changes since commit 6ea50235a2ead1f65fcb8069fdc8a606bd45c3e4

  CHANGES: update for 2025.11.2 (2026-02-20 09:21:57 +0100)


are available as patches in this mail series,

for you to apply patches up to 0a67d2a3b35a4f15274830d78c422403e82889f7

  package/mosquitto: add option to enable the persist-sqlite plugin (2026-02-20 12:53:07 +0100)


----------------------------------------------------------------
Yann E. MORIN (8):
      package/cjson: add host variant
      package/mosquitto: bump to version 2.1.2
      pakcage.mosquitto: add option to install CLI tools
      package/mosquitto: add option to build broker-related apps
      package/mosquitto: add option for websockets
      package/mosquitto: enable HTTP API with libmicrohttpd
      package/mosquitto: add options for password and ACL plugin
      package/mosquitto: add option to enable the persist-sqlite plugin

 package/cjson/cjson.mk                             |   7 +
 .../0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch  |  50 -----
 ...T_DISCONNECT-being-called-before-MOSQ_EVT.patch |  41 ++++
 .../0002-Add-configure-time-check-for-lanl.patch   |  47 -----
 ...ntial-crash-if-group-id-has-no-group-name.patch |  36 ++++
 ...to_loop_start-leaving-the-mosq-struct-in-.patch |  62 ++++++
 package/mosquitto/0004-Fix-missing-SONAME.patch    | 139 ++++++++++++
 ...d-length-not-being-passed-to-MOSQ_EVT_BAS.patch | 234 +++++++++++++++++++++
 ...-outgoing-maximum-packet-size-limit-check.patch | 155 ++++++++++++++
 ...x-will-messages-being-incorrectly-delayed.patch | 213 +++++++++++++++++++
 ...ct-parsing-of-unix-socket-address-in-prox.patch |  30 +++
 ...eList-only-require-C-when-actually-needed.patch |  46 ++++
 ...0-broker-properly-check-for-getaddrinfo_a.patch |  38 ++++
 .../0011-libcommon-check-for-getrandom.patch       |  83 ++++++++
 package/mosquitto/Config.in                        |  98 ++++++++-
 package/mosquitto/mosquitto.hash                   |   7 +-
 package/mosquitto/mosquitto.mk                     | 198 +++++++++--------
 17 files changed, 1290 insertions(+), 194 deletions(-)
 delete mode 100644 package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
 create mode 100644 package/mosquitto/0001-Fix-MOSQ_EVT_DISCONNECT-being-called-before-MOSQ_EVT.patch
 delete mode 100644 package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
 create mode 100644 package/mosquitto/0002-Fix-potential-crash-if-group-id-has-no-group-name.patch
 create mode 100644 package/mosquitto/0003-Fix-mosquitto_loop_start-leaving-the-mosq-struct-in-.patch
 create mode 100644 package/mosquitto/0004-Fix-missing-SONAME.patch
 create mode 100644 package/mosquitto/0005-Fix-password-length-not-being-passed-to-MOSQ_EVT_BAS.patch
 create mode 100644 package/mosquitto/0006-Fix-outgoing-maximum-packet-size-limit-check.patch
 create mode 100644 package/mosquitto/0007-Fix-will-messages-being-incorrectly-delayed.patch
 create mode 100644 package/mosquitto/0008-Fix-incorrect-parsing-of-unix-socket-address-in-prox.patch
 create mode 100644 package/mosquitto/0009-CMakeList-only-require-C-when-actually-needed.patch
 create mode 100644 package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch
 create mode 100644 package/mosquitto/0011-libcommon-check-for-getrandom.patch

--
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
