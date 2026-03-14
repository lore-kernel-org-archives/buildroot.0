Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C51D10706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 612F440C69;
	Sat, 14 Mar 2026 14:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_FKFUa-kOSg; Sat, 14 Mar 2026 14:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88F4140C6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497221;
	bh=NXeiUygwMhYwTTwwgpEHpBnuUjwiFCuty/PfsxS4NzI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lHNPKX85LhXRP+moohlS4MLSRuHCng3M51ET6x4LSaMID6+/4C7AArJd68Qnw2CCS
	 LC3eg2OLMKaRv4Qt+WsR4HZTXzWKkT9n33Ji6J4RUIX7CGc1TNAYXIDcL7b67mYFk5
	 lY0dXEsgUT4jPd1e7PCZy9TcbLFD9Ogh5V+UI/maA7YSuEtSfVAEcIYRCINWX8kipU
	 iSWIYJj2+oZIqTTvvJMntxy2H0UlfhUm6VWu2Ln95HPKA4aLz7M4zdSwZzLXw/7ksK
	 kQgwQ01NLYvci+e3ggVJniaI7KT9K8wWKDXheLXDMOTeO7rbxtNs+UMnKUUh+sV3D/
	 jHr1Fi6cwcBbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88F4140C6A;
	Sat, 14 Mar 2026 14:07:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1C9A3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7D0B8129F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIg5-MJvPB43 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD9048129A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD9048129A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD9048129A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:06:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BCD89A4C13EE;
 Sat, 14 Mar 2026 15:06:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdR-000000003UM-0xY1;
 Sat, 14 Mar 2026 14:06:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:04:59 +0100
Message-ID: <20260314140633.2967249-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497193;
 bh=1Qbs8miSAris7+ClHoDVr9GlgIrzHJsurbF3An2ucT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Tp1m5jsgYxFLRWB/sqMLk5sCnmPLMrJV50OlAuoCeGMMUmQ2ijh9HlxUX8iA6z+iq
 2Hkg5VufBwvjfalOBId5TkkWgCSaC7rS+dhJ8b23hrXZWgivaLegeGAGYV6CqvfYY1
 hohNBk+OyLqcmsaagE61/4yR8wXq64Y2bB3obzCFBs1N3iCTErkTfFq+VqD3xWAnBB
 CZGn/NnVhp0t+8OCsR/IqVfOsXTye05zHOalKXwZlGhAMfVCUOR1Z5qhFuyiszETIu
 UtU3ndV93IRh6pkJqQ/L+pr8S4O/Y32hd0DwiZs+1/dFKMmFQzoz+lSbfkCq5cWIjv
 vZorrRKPJCTOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Tp1m5jsg
Subject: [Buildroot] [PATCH 03/96] package/python-aiomqtt: bump version to
 2.5.1
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/empicano/aiomqtt/blob/v2.5.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aiomqtt/python-aiomqtt.hash | 4 ++--
 package/python-aiomqtt/python-aiomqtt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiomqtt/python-aiomqtt.hash b/package/python-aiomqtt/python-aiomqtt.hash
index eab5a1938f..01dc68f671 100644
--- a/package/python-aiomqtt/python-aiomqtt.hash
+++ b/package/python-aiomqtt/python-aiomqtt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomqtt/json
-md5  9ded3fea036dc979d7855a6b3fd1dc33  aiomqtt-2.4.0.tar.gz
-sha256  ab0f18fc5b7ffaa57451c407417d674db837b00a9c7d953cccd02be64f046c17  aiomqtt-2.4.0.tar.gz
+md5  75cb0ed1ad029d19cb76478879aba12b  aiomqtt-2.5.1.tar.gz
+sha256  25a0a47d157e8f158d2da1110ea4786c0615518751e94f7b04976c977a8ff20d  aiomqtt-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2cdee9e997c759749069649dfb9060fdb885da82bc50c0dcb4841b1dcab0b032  LICENSE
diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
index c5b932838d..53a2125d87 100644
--- a/package/python-aiomqtt/python-aiomqtt.mk
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOMQTT_VERSION = 2.4.0
+PYTHON_AIOMQTT_VERSION = 2.5.1
 PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
-PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/45/9a/863bc34c64bc4acb9720a9950bfc77d6f324640cdf1f420bb5d9ee624975
+PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/70/44/cfc58272783a11729462dc6df5adbfeabd084f840f609054ac772ae98c19
 PYTHON_AIOMQTT_SETUP_TYPE = hatch
 PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
 PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
