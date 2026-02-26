Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD3DFD8FC3
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE9B984787;
	Thu, 26 Feb 2026 15:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dl0BkyYZn2Gi; Thu, 26 Feb 2026 15:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB01E84789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121251;
	bh=qLPZ2cXMTzAnozTHfCXNZiGAbbKTec+rBbA6ibPSCBU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=p/70B3kmjCocoeCTAco8qjGuGexTiwMvF8pBoHCSLRPbUAsqN0eUxBZyLEgqS2HYs
	 cTNdAhvwJNEMDhCo+oJtlLNXf5hkWCDGJPccgT7A0swj2kY7qIeqAV6BPsgtlPmMZf
	 1ClV8+88uk6kwlJH4hrvw5RdjCek1y/EPHOvKATLdZNGiWTWQxle6+l2jyHdzlZMdy
	 J2tLM84qcZ2W22s/mp6GXdezaKw3Y7EDFbaikuvVd9ml/SGx/r7+qiZszqBjUOU3H1
	 UVdE4Xld97XA5OY7IL5xZT6tBAUl/WaZEsNwb1TAgEVD2GyZi9HfSTvzz0tLNWS2/D
	 g1PQ2sr8h97eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB01E84789;
	Thu, 26 Feb 2026 15:54:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1316A24E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECE3884783
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1i-sn2844wV for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BF3B84781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BF3B84781
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BF3B84781
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:54:07 +0000 (UTC)
X-CSE-ConnectionGUID: yXqTNImTSfegT3s4+fBKlg==
X-CSE-MsgGUID: /7JmeHNcSAOvdefGh1DtLw==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 26 Feb 2026 16:54:04 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:54:04 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 26 Feb 2026 16:54:02 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 26 Feb 2026 16:54:02 +0100
X-CSE-ConnectionGUID: dvbmeOPiT+uGZjS5AiOtPw==
X-CSE-MsgGUID: EblZ8zP0T5GDPGcwIQ++yw==
X-IronPort-AV: E=Sophos;i="6.21,312,1763420400"; d="scan'208";a="396999561"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 16:54:02 +0100
Message-ID: <cover.1772121240.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1772121247; x=1803657247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dlGgFMYYTmFJhL9KToC+XfU68Av+Vk2lOdyQ77rtaf8=;
 b=h2C1IFG2BkGNr0zizJu/PIV/wGbnFM6JGTAsbwCZ4u5iFd5j2aI5SlCX
 d34Y4M4vQojkoJY0/daLUA3bPzk3bvlsAxDxiIjC+/dQxdW8t/8thhH8V
 NUzm8XZ9EnuATXRvQIB8Efk2gVvIbC8+9Q0aQ/Lmm/buMIHpi/3/TmNCJ
 3VluFw49sIHyxGGp/a+hoxM2jo8OcDs0CuMj+I2W/w1LC6iujx3ZQZAOg
 VbSq4rBXBLCPGc4KawCzrqV/pADXUKLxHEFjPpUH9BqZPWbpMz7mh8Pc7
 XNbALyTGpE6adrO0ziJW2OpH9WVaqMNNiG8NahNcBRS1H9F2wPzsfWmIx
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=h2C1IFG2
Subject: [Buildroot] [PATCH 00/11 v3] package/mosquitto: bump version
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
  - $SYS and $CONTROL trees of topics
  - bridge support
  - HTTP API
  - plugins

The 2.1.x series is still quite recent, and has already accumulated
quite a few fixes; the most releveant ones have been backported. As
for the few patches I've authored, I'm still waiting for internal
validation of the Eclipse CLA before I can push them upstream...

Changes v2 -> v3:
  - new build options
  - backport additional fixes
  - drop my patches, now upstream

Changes v1 -> v2:
  - clarify help text about broker-related apps (Fiona)

Changes since RFC:
  - add options for various parts


Regards,
Yann E. MORIN.


The following changes since commit b28f9363c5afbf0782fad6ca5faf71fdd89ee15c

  package/patch: add patches for CVE-2018-6952 & CVE-2019-20633 (2026-02-25 22:11:08 +0100)


are available as patches in this mail series,

for you to apply patches up to 484bf45a56ffd2f343265076aefefdcfa8694aaa

  package/mosquitto: add option to enable the $CONTROL/# topics tree (2026-02-26 16:53:17 +0100)


----------------------------------------------------------------
Yann E. MORIN (11):
      package/cjson: add host variant
      package/mosquitto: bump to version 2.1.2
      pakcage.mosquitto: add option to install CLI tools
      package/mosquitto: add option to build broker-related apps
      package/mosquitto: add option for websockets
      package/mosquitto: add option to enable HTTP API on listeners
      package/mosquitto: add options for password and ACL plugin
      package/mosquitto: add option to enable the persist-sqlite plugin
      package/mosquitto: add option to enable bridge support
      package/mosquitto: add option to enable the $SYS/# topics tree
      package/mosquitto: add option to enable the $CONTROL/# topics tree

 package/cjson/cjson.mk                             |   7 +
 .../0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch  |  50 -----
 ...T_DISCONNECT-being-called-before-MOSQ_EVT.patch |  40 ++++
 .../0002-Add-configure-time-check-for-lanl.patch   |  47 -----
 ...ntial-crash-if-group-id-has-no-group-name.patch |  33 +++
 ...to_loop_start-leaving-the-mosq-struct-in-.patch |  59 ++++++
 package/mosquitto/0004-Fix-missing-SONAME.patch    | 136 ++++++++++++
 ...d-length-not-being-passed-to-MOSQ_EVT_BAS.patch | 231 +++++++++++++++++++++
 ...-outgoing-maximum-packet-size-limit-check.patch | 152 ++++++++++++++
 ...x-will-messages-being-incorrectly-delayed.patch | 212 +++++++++++++++++++
 ...ct-parsing-of-unix-socket-address-in-prox.patch |  27 +++
 ...ct-maximum-packet-size-restriction-for-in.patch | 116 +++++++++++
 ...0-broker-properly-check-for-getaddrinfo_a.patch |  35 ++++
 ...make-Only-include-C-support-when-required.patch |  56 +++++
 .../0012-libcommon-check-for-getrandom.patch       |  90 ++++++++
 package/mosquitto/Config.in                        | 118 ++++++++++-
 package/mosquitto/mosquitto.hash                   |   7 +-
 package/mosquitto/mosquitto.mk                     | 198 ++++++++++--------
 18 files changed, 1415 insertions(+), 199 deletions(-)
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
 create mode 100644 package/mosquitto/0009-Fix-incorrect-maximum-packet-size-restriction-for-in.patch
 create mode 100644 package/mosquitto/0010-broker-properly-check-for-getaddrinfo_a.patch
 create mode 100644 package/mosquitto/0011-cmake-Only-include-C-support-when-required.patch
 create mode 100644 package/mosquitto/0012-libcommon-check-for-getrandom.patch

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
