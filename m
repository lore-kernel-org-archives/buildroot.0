Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5831EA4FBA
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E6240D28;
	Mon, 23 Feb 2026 14:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KzagQTylehn; Mon, 23 Feb 2026 14:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38B8409B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856273;
	bh=d+8/AdddgOotk++c3FYdV0H52USyV4OgcBV47FgGtQU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SEKQlq91xX/1xzaWYJ8C3bGfGRpn8gK3Bo/tiPUeXm6O+biMP0mXG2GZSwDsARrHU
	 N5Cvi3rBj4k1vnE/H5QFagE0gOXdBrNHO+GP1aPlKcHn9pQEERv9KXlbhwmzzQ+ybn
	 CmBNMCS6/dpB6AtPF9RfEkq43u2xbNuaRdZDjxX7oX9cJKxS4CWKScCeEvB7pvSiVb
	 C9dxc5cl/A2cG75Uo0Yk2wtI6K2HGAw7SZwkm480UM1CjJnmZv/kEuqKeXhuNCWNB+
	 U71LAszhCy/n2UEycSxWaBxGIEjUbvaajGtfU7WxmLZK5P5/iCVZi2qAf+cmwMgECT
	 e9n8WdjbCuUTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38B8409B6;
	Mon, 23 Feb 2026 14:17:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D50249
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 582E6842AD
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NtE6lzd2qe5C for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CC54842A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC54842A6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CC54842A6
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:17:50 +0000 (UTC)
X-CSE-ConnectionGUID: 057jkr9PRWK3vWv+617cGg==
X-CSE-MsgGUID: JvdeqJmcTjq24DUOlTUV6A==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:17:48 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:17:47 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:17:46 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:17:45 +0100
X-CSE-ConnectionGUID: G/cdoLYtRWqx1nhiz9P4vg==
X-CSE-MsgGUID: whlW3XSYTXCQV5u3umnXSg==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="395647779"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 23 Feb 2026 15:17:45 +0100
Message-ID: <cover.1771856259.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856271; x=1803392271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VnKWYPzV0iAIv0jyiajpCiAvGIKCx6qGe17eDY9BobE=;
 b=d3GK4qczpmLgyYc8cWhOsvdyjuYaCnkcAxlbscpqpa98wJaMfSelrXo3
 Xp4ToiB8fEjvgHiCn/h64hzYfwsXquMNyD/vffYbaJ8LwopmvYS3VW8ud
 qjpuV+9CTZpyxmH0/xqaDMnrPHWHIwEawBOqBnBROu8YTjCH7ZJHqsWDq
 KKHdi1JCZl6fXuiX2bHp+MOu8jKVaw+dTwyh5kQpKZm9fxI0TyLUZI7C9
 0WlSn1yLxF2kASSGQaqFCgXu6E4oR27ZTpflXRc3K6f1ppoXhGXibBOKK
 dBTUuKxs2OPtOTQ8304SkOZCGIXrBam65UDg0q5NjMRMK9OieUbY0O0Vb
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=d3GK4qcz
Subject: [Buildroot] [PATCH 0/8 v2] package/mosquitto: bump version
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
 Danomi Manchego <danomimanchego123@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fiona Klute <fiona.klute@gmx.de>
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

Changes v1 -> v2:
  - clarify help text about broker-related apps (Fiona)

Changes since RFC:
  - add options for various parts


Regards,
Yann E. MORIN.


The following changes since commit bed675a240de6643792edd879cbe187b2ee6e0f5

  package/c-ares: security bump to v1.34.6 (2026-02-22 21:56:31 +0100)


are available as patches in this mail series,

for you to apply patches up to 4a23d0cf09f1c12e1a93552b59113153b2078511

  package/mosquitto: add option to enable the persist-sqlite plugin (2026-02-23 09:36:13 +0100)


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
