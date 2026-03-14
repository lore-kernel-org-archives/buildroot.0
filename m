Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FBC10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10907410F1;
	Sat, 14 Mar 2026 14:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJC1lMlgdPXQ; Sat, 14 Mar 2026 14:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B82412BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497560;
	bh=ezkHrG4unz6Yap1Udpuj0h5i4zBIFWERq21a87vlpbY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M288BVC8rsYhpMV0czmrqSr0FG18b+8m492wvzPLSpVnmepU6cxcFDIPaVCQz8AGu
	 KKJaoZHiTeGG1JfKLRhDj+cZGa09DBbVJQC+P2DZhaC2XgWB5N49Jh7fxrsPDoaKGA
	 yGsQ/lak3MR9flmDNFo4gNGG75JhGXSlLxCJclm5RVS15OQR98NWyuvblkQ+k2ScMd
	 hST6UcFj4YXK6esWiww6b2Gn6dtORNIvBzLKyEwf9xJrXwaM4dkMP9Ttz+M3/64X79
	 8U8FxZY+qGimAW1YZf4YFiM6ungWx1JeBd8BELNeJa12QfftJgI+8NoVGNdYfHzOK/
	 uO2h9KBmmyFhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32B82412BC;
	Sat, 14 Mar 2026 14:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0A9D201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9232560704
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSK07idRkXsu for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D0A2606F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D0A2606F4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D0A2606F4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3771A4C1463;
 Sat, 14 Mar 2026 15:06:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-18nb;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:17 +0100
Message-ID: <20260314140633.2967249-81-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497211;
 bh=XDfELRuc8xRuN3Jq3hPSZyVRuoaw+c2BnDFi3PNG+Pg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XXCvpLvSSCYJ3YGe0WI53CLyyWkgP+EvuvRqGLwrnJ2M4DDoBPS5xalbMnt9jJLqf
 PXAleLVZB+ZDe0B6QUrTBxAaGnD/a00Hv3q8VBb7JuZ3dMs5/e2SaIwTBt1yEnu6lV
 i93JmYZFii7B7pLPhkHu8qW1uoZ31OvYOrEHP2UjFtF90q6bcMbSxYxUU5EB40EjPl
 oF84CmIs7/L3qVVBVSvKxYZSztl7oKNFJahRZr6EgpdfLp/8U082PNsTHgOYzreL8g
 1trU/EGw7WK3x2/obuBVZPXpqCB6Lg/X2+CE3Ejww10h6nBQ3zBPVXB4a5OaYDR7v2
 djLsEHRMR17Bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XXCvpLvS
Subject: [Buildroot] [PATCH 81/96] package/python-types-psutil: bump version
 to 7.2.2.20260130
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

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/psutil.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-types-psutil/python-types-psutil.hash | 4 ++--
 package/python-types-psutil/python-types-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
index ac43dcce97..0b2e5aa7c7 100644
--- a/package/python-types-psutil/python-types-psutil.hash
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-psutil/json
-md5  4c6196cba53b8b8218bc829681e82a67  types_psutil-7.2.1.20251231.tar.gz
-sha256  dbf9df530b1130e131e4211ed8cea62c08007bfa69faf2883d296bd241d30e4a  types_psutil-7.2.1.20251231.tar.gz
+md5  d4d19bc7bb21bd5ff2c909e425760f79  types_psutil-7.2.2.20260130.tar.gz
+sha256  15b0ab69c52841cf9ce3c383e8480c620a4d13d6a8e22b16978ebddac5590950  types_psutil-7.2.2.20260130.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index f935b28ae0..4a596de1b1 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PSUTIL_VERSION = 7.2.1.20251231
+PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260130
 PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
-PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/09/e0/f4881668da3fcc9473b3fb4b3dc028840cf57374d72b798c0912a183163a
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/69/14/fc5fb0a6ddfadf68c27e254a02ececd4d5c7fdb0efcb7e7e917a183497fb
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
