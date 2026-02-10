Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC46EF0702
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 16:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86ED81CDC;
	Tue, 10 Feb 2026 16:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J57tmxIChVG6; Tue, 10 Feb 2026 16:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01C3781C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770740179;
	bh=PooUNRpuM6De5uCw5vwU+LO0x0UWt2DHylNtFDKuYmQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Khs0n75Ud4DewBK/CFhWWneWIkuZsOR0kp6zuQUBBcsJTLUwcN7sEz+s0lEtcZkLs
	 w3DrflRVGDulQhKRP3BC/+LZ2cOu/49pMJ1DKPEIfrNVP7XDbCpn4K0uRUdUTP/7CW
	 n1FKziQzXRKmjBLLDC8VhioMKM1BG4XpbQhRoZl48TxGxG9fusufq3QhDCzBYpNor0
	 NCePuU18hVMWqy7xTJW2ZldnRdhNb8z+9HQBGLmGDIYtncF0ygjku7l1jmrfAsoIK1
	 +alLbMQ16AigEpdfQSVmZ13XgKmAXJkxda3LDURJOvG8aW2+k5lirp3IVZ052I5Tro
	 i+rsP6t/xxZvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01C3781C21;
	Tue, 10 Feb 2026 16:16:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 269A4F2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 084B3404F3
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPWwyJflANk0 for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 16:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E38A8404F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E38A8404F1
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E38A8404F1
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:16:12 +0000 (UTC)
X-CSE-ConnectionGUID: djZjSOYGQ5CfSrMkcbKP1A==
X-CSE-MsgGUID: is5YkL3TRCWtSgU3q3d+3w==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Feb 2026 17:16:09 +0100
Received: from unknown (HELO OPE16NORMBX505.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 17:16:09 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 ope16normbx505.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 10 Feb 2026 17:16:09 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Tue, 10 Feb 2026 17:16:08 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 10 Feb 2026 17:16:07 +0100
X-CSE-ConnectionGUID: XZFUTJNuSnSnxayuWoLUOg==
X-CSE-MsgGUID: WqQxJHmXTDCfTc74xyK4Rg==
X-IronPort-AV: E=Sophos;i="6.21,283,1763420400"; d="scan'208";a="391129926"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 10 Feb 2026 17:16:07 +0100
Message-ID: <cover.1770740165.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770740173; x=1802276173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o1J68sRQrAyXDx/y0Ecq0DrolulXKAh+GBK2Ny1x07g=;
 b=ThMyd3v3mET5W7dfTQd3TzJG7t6KIpPFS7cdtNWFTEg5Byi9YiRCyUQx
 YqBkfaAKK5jfvzyjc49GZK3GKQaX09rem0eoUQJNJloHk5JAMgS83s2XN
 cNHGdfbDoi4RatAWuVHilwBwfXqwy4vDSpKvgbunn+oLDMlj/t1YcqP8K
 1rKzhwO9sS99xubNRyJslb1E2DqunAgvT2bQ9yJ2kL67tzpYzKGvaSy5R
 rihGeeHXaQD7MHgN+PQAHlmGIgVvzskROHZlVn+tO4/7efdY+fvcNNYHy
 o8xMvHjMx1gyFFsnbz/tD9N+iKfjR5ruKwrAUYMdtxiG96iHWWk5FZZ/B
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ThMyd3v3
Subject: [Buildroot] [PATCH 0/2] [RFC] package/mosquitto: bump version
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Hello All!

This series brings a new version of mosquitto; it is quite a big
endeavour, as it has switched to using cmake.

This is a preview version for preliminary review; new patches have
been added, but I'm still in the process of signing the CLA to
contribute them back upstream; when that's done, I'll update them
with proper Upstream: tags.

Also as I have a bit of time, I'll address adding new features,
especially websockets (with internal implementation), managing new
plugins, making more things optional (e.g. for cases where only the
broker is needed), etc...


Regards,
Yann E. MORIN.


The following changes since commit 6f4e61bff84fd601c45a00c72215deec8b513b39

  package/libpng: security bump to version 1.6.55 (2026-02-10 13:22:18 +0100)


are available as patches in this mail series,

for you to apply patches up to 3f65ba4b87d826d45fc905c4e30b674f6cf7bf06

  package/mosquitto: bump to version 2.1.2 (2026-02-10 16:55:06 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/cjson: add host variant
      package/mosquitto: bump to version 2.1.2

 package/cjson/cjson.mk                             |   7 +
 ...eList-only-require-C-when-actually-needed.patch |  44 ++++++
 .../0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch  |  50 ------
 .../0002-Add-configure-time-check-for-lanl.patch   |  47 ------
 ...2-broker-properly-check-for-getaddrinfo_a.patch |  38 +++++
 .../0003-libcommon-check-for-getrandom.patch       |  83 ++++++++++
 package/mosquitto/Config.in                        |  15 +-
 package/mosquitto/mosquitto.hash                   |   7 +-
 package/mosquitto/mosquitto.mk                     | 173 ++++++++++-----------
 9 files changed, 268 insertions(+), 196 deletions(-)
 create mode 100644 package/mosquitto/0001-CMakeList-only-require-C-when-actually-needed.patch
 delete mode 100644 package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
 delete mode 100644 package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
 create mode 100644 package/mosquitto/0002-broker-properly-check-for-getaddrinfo_a.patch
 create mode 100644 package/mosquitto/0003-libcommon-check-for-getrandom.patch

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
