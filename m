Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FAE10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 613BB4102B;
	Sat, 14 Mar 2026 14:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0ofZt_NR05B; Sat, 14 Mar 2026 14:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84C6741071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497305;
	bh=zENMORB5gszf37FYcHz8L8shMtmxNKXe8+k7+c6S2wc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Am/doEpwEmT2pcPt8iqAtti081/NI34W1a0TUqxej8fxxqm9mfpKcBche3dGZBIzD
	 mdvkNm1G91TuY0m0kHBmyH9MovgX4HgAaEFcStLrzjjK8foKjkEMJS1zctSARGSRs7
	 fb2rtSrIG6DOVLyubl2s/VjXusUPlPevWmgwjcnhonngN37hSVTheIIj8QXcJM93qD
	 7H1lqiL4p1cXsQkPU1C+9E3rEwdFSldlaonV/0nJL86y4VJNiHVPc39Q0TYlm5pNHj
	 euitfRJjiNut2xj0vDw3qOR1uk1WJg9Zh0cOlYabWqzGQ8PKxp3grTqbMODTYYlEFH
	 xdrYlLksMZVLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C6741071;
	Sat, 14 Mar 2026 14:08:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82372786
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 683F9401CA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdvDhg36ZGsF for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EAF0400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EAF0400F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EAF0400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FC36A4C1400;
 Sat, 14 Mar 2026 15:06:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-10Zi;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:55 +0100
Message-ID: <20260314140633.2967249-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497205;
 bh=LS8OGOJi9ZysepiSohpHDUGpsDRMuszwk3aDq6V5qkM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=O8wS5FGkHx5miQhYIyZusKjXYTkrmL6kuDkNE3qMJcNbOcOJRwAOwj0+7Sw70e9St
 S5KSALhWOYxA/AgVc7qUXG3xBG57O5bGkeNzvFMx5xBfH5w+dGadRf5cdZIWGIdfGd
 kGWKx30QQePjudYWtdL4ozTLfYZH12Fv5n9AxaiArM6LYAwk8WhlH5QUQJ91Cp8Vak
 a0gZjqGJv1l1fm7mND2bJ7sWFCJv7xnedAJWZz1b3N+zByfxG02QzOExtQ8MrkHAK+
 4ByrHkhktEoOfD/CeYhn+NxImKvyp03YirdtxUr9VfWr8fwiPTyfVNC/vH6I/lxe/e
 r7Vrk0iGrjG2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=O8wS5FGk
Subject: [Buildroot] [PATCH 59/96] package/python-pyproject-metadata: bump
 version to 0.11.0
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

https://github.com/pypa/pyproject-metadata/releases/tag/0.11.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-pyproject-metadata/python-pyproject-metadata.hash  | 4 ++--
 .../python-pyproject-metadata/python-pyproject-metadata.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index d226c06c2c..e107c11327 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  748ebfaeb5c1ca2390450e48d95c20d6  pyproject_metadata-0.10.0.tar.gz
-sha256  7f5bd0ef398b60169556cb17ea261d715caf7f8561238151f51b2305084ba8d4  pyproject_metadata-0.10.0.tar.gz
+md5  f5f54a0951177667dfd7eefdfaa11372  pyproject_metadata-0.11.0.tar.gz
+sha256  c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf  pyproject_metadata-0.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 3fa1d55460..8e234f9be5 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.10.0
+PYTHON_PYPROJECT_METADATA_VERSION = 0.11.0
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/75/bd/74706b3671c443944f487a42a0148a507b733c60600df1d34cde41e6d10b
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/83/fa/8bf4fa41adfebd95dce360afe3f5fca243a17932089d3d5486e95ca44c57
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
