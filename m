Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F40F8FA9E
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5453041312;
	Tue, 21 Apr 2026 17:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0rL3JvehAq5; Tue, 21 Apr 2026 17:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78B2341302
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776792421;
	bh=lN3CxI2UFhKvBHT464Gl6RwFxGNFGNMRJUxeh6YtG54=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=EsG5OoeNx/yo+0cZlcb0iEaLb0TqtK/SKEYiXSWUwRfzn7yP3A1yyttf7TMfpRVJI
	 EWyO2pX8SQg/f0qydnE2NDKDJzHLyjU6qjFWoAas8dYgxemLuh0xCbmySQdzZ2lpcE
	 ffNAeeD4txjd7uL1To7yMS9zK2X9fRQqMCVXi/2xNIGQdwpbiwjiDCJppxcQvFdAlI
	 i+m0IaeV9R7DkRvAYQ8ujGKK5YrOkUinW29ZqP4UFSuancHFU8c8P2cTp/VdOxQSz4
	 XcIIxY9OMRa/OX4kDHfMtLlkaznC8AaP7eexK/BvSMGfhd9C4wMdh65jloJvTwfMuA
	 oIPwNEbL+Ey5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78B2341302;
	Tue, 21 Apr 2026 17:27:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E35F24D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F892607EA
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yh2SRMoBnjh2 for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64B22607E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64B22607E9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64B22607E9
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:26:59 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0D8C860140;
 Tue, 21 Apr 2026 19:26:53 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 19:26:25 +0200
Message-ID: <20260421172625.735873-4-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421172625.735873-1-ju.o@free.fr>
References: <20260421172625.735873-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776792417;
 bh=06fBc+k5jkpr5CBqFMac+6hFryiApSOhjlxekpnQgVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sqF4GhHl1xwIWGo7vFsXFA25KewBSJktn+N6QQEB/ygzqANwGlTmF/hKRDOspfMye
 QFOgQ9DxFxjov7ypYdUi6FfYPJSpwKljEDpDHmeGZRLOGuFa4WTBGLk5bAs7f6+CTa
 rpgltW0FamwX5vf0P73jEOTfECUxiijUOKqRaUkvq3CW7/qHJcHa/227nZspQMrglG
 p99JAXeyIk1YaqHe4uuIZemi0ynk+i6OkOPKKLJwdYEwIaTa5ELXlqF063Pm4XXWld
 eYTgQH8qHUxN/5VQUVQY9cZelPVblZE3DOcdFm9T3zUafxLkNpIP2wu6Hv51ivLXAX
 DS9Ex3vCytTew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sqF4GhHl
Subject: [Buildroot] [PATCH 4/4]
 package/python-magic-wormhole-transit-relay: bump to version 0.5.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See NEWS:
https://github.com/magic-wormhole/magic-wormhole-transit-relay/blob/0.5.0/NEWS.md

The upstream source archive name changed (dash '-' changed to
underscore '_'). This commit updates _SOURCE to reflect that change.

This commit also updates _SITE to use a stable URL which will redirect
to the package archive, to reduce future maintenance.

This package has been broken at runtime since Buildroot commit [1]
"package/python-setuptools: bump to version 82.0.0", which removed
the python module 'pkg_resources' which was deprecated. This new
version removes those usage and fixes this issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13904071794

Note: this commit fixes only the runtime invocation of transitrelay,
the complete fix for the test_python_magic_wormhole runtime test
also requires the update of python-magic-wormhole-mailbox-server.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/51365ff06379aaf6fcc9a751e8ff32ac694f3e92

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-magic-wormhole-transit-relay.hash                | 4 ++--
 .../python-magic-wormhole-transit-relay.mk                  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
index 3f038728be..286f2766ae 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-transit-relay/json
-md5  73be034b4a57e9d190cfb658cbaa5fbf  magic-wormhole-transit-relay-0.4.0.tar.gz
-sha256  912d835da21b11266c77111dc9b5e5800263fc0b98f0a179962267df41819e8c  magic-wormhole-transit-relay-0.4.0.tar.gz
+md5  8305bee7b0307e485c42ac933cbc6ddd  magic_wormhole_transit_relay-0.5.0.tar.gz
+sha256  a2c2e777cafcd843a2f22f0a4b3c3bd3cae85cc2303fead1646d1763ad6d1a4a  magic_wormhole_transit_relay-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d70f6469bb210c2aa4c0dfd74f498ef5f0467a137d8296479088e7243c5884eb  LICENSE
diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
index 03a2d416db..4f83c6fc51 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.4.0
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic-wormhole-transit-relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/d0/87/cb71073e53ea7e1b6f892c52e4114caea81b887a7d34e665b15dc81d669e
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.5.0
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic_wormhole_transit_relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole_transit_relay
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
