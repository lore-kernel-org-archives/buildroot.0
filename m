Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1063010706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF3F34177B;
	Sat, 14 Mar 2026 14:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbbwNhH8ujEb; Sat, 14 Mar 2026 14:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E69041776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498295;
	bh=fJX7VuIkSmRigG+teF4UDXtI5w7M9ZL4RFmsdqLlao0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GZZ81/CQeOjc16pMTTUvT8h8OVOEozcJ2gVThn7KV+Q7/s91bqQBZouFsgoN9KgFV
	 oL5VJD+sO6wtB4M7qdlm6F0DJOvr7qtcq4dRy2zY6zD95qR/a1JF2ok/+SZMg1cl4s
	 yzcu3iWKbfcicKCOAD5xIMbKLMYfBibD/6zVSi19MMZuXzCbHtShG+OCq8ARx0Gs1k
	 JBhXS+/auIts+air2f0o5FNncx/mtId2HYydhuIhkvkVurD1qpO+tS+pXfU7DLkStx
	 R8m+trJOW6opE1y1+WAs7t5N1HBwvJoRxQ7DudcvRUqHxq4JsVOW/nzruT2gqmbwFl
	 cibfxaaVzTJkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E69041776;
	Sat, 14 Mar 2026 14:24:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94616201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91ED341776
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDX59AXaQtYP for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:24:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C99141775
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C99141775
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C99141775
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:24:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C34FA4C1DD6;
 Sat, 14 Mar 2026 15:07:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-17py;
 Sat, 14 Mar 2026 14:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:44 +0100
Message-ID: <20260314140633.2967249-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497226;
 bh=9L51J/8c4VWooOW8L8x80sVn1UiM0GhBAxp0DYfslaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ORbWb+k1J2v5RI6e6sjPKiax+l3U12r9JtAZTS8EvUerIp00EZuGQTlP9P+MrkrGS
 XNnYsu0n0h+P9pq6hNm7w9j6y1nCmn1He/aOuLTxhaO5E1v/CDZYtT4DLAHbotFZhr
 90QRW6NQWD2HC2ZNdVmVvJHuUgBlyMPK7eeRa6TLAono6J/d5iXZZ6SZUg7rMDrfmH
 b1fG2FI0IRTHOO89IV7n7/IYIIkq2VqcFluPE25CF3xq33RTj6hc/DUHWVXXXTKM/x
 kxuYEzQiiqR3tBTwtKcMBsPPGpoFEa6uacngaqPzRcKBB4Jthv01koYvv3WzN2buDf
 fAxS1f+Rn9h0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ORbWb+k1
Subject: [Buildroot] [PATCH 48/96] package/python-pyaml: bump version to
 26.2.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyaml/python-pyaml.hash | 4 ++--
 package/python-pyaml/python-pyaml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyaml/python-pyaml.hash b/package/python-pyaml/python-pyaml.hash
index c1029bba59..d761e088ba 100644
--- a/package/python-pyaml/python-pyaml.hash
+++ b/package/python-pyaml/python-pyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyaml/json
-md5  b5b6dc631c2c117ba3373faecf6d72f5  pyaml-25.7.0.tar.gz
-sha256  e113a64ec16881bf2b092e2beb84b7dcf1bd98096ad17f5f14e8fb782a75d99b  pyaml-25.7.0.tar.gz
+md5  c3bf0c6966734fe2283cb4c8f312178a  pyaml-26.2.1.tar.gz
+sha256  489dd82997235d4cfcf76a6287fce2f075487d77a6567c271e8d790583690c68  pyaml-26.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dc1342cc1cb49e24c1c9e8a495acc9625ce2e04146c116279af0ab0949cd829c  COPYING
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
index a39f6d5568..a299bd3618 100644
--- a/package/python-pyaml/python-pyaml.mk
+++ b/package/python-pyaml/python-pyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYAML_VERSION = 25.7.0
+PYTHON_PYAML_VERSION = 26.2.1
 PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
-PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/c4/01/41f63d66a801a561c9e335523516bd5f761bc43cc61f8b75918306bf2da8
+PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/38/fb/2b9590512a9d7763620d87171c7531d5295678ce96e57393614b91da8998
 PYTHON_PYAML_SETUP_TYPE = setuptools
 PYTHON_PYAML_LICENSE = WTFPL
 PYTHON_PYAML_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
