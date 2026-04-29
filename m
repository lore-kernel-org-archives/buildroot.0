Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FEAFF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 11:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A85042164;
	Wed, 29 Apr 2026 11:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNRtxZ1RgFRO; Wed, 29 Apr 2026 11:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A48BD42166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777463276;
	bh=30IdTiN2Ev8Bam3sTo20sG9a/H5QSsSCBfGj/qmCB/Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qZFgFmjnzDD7Wm4Ha/rQ3jtfZVxYpxG83TKhJ/oe3Fv2EHsNgSzuBjOV8POmNqWkX
	 Bm+fPPQT6N20JvGczT2NyMaeuPNZ0UdRNbPvXrQcQcS/n/Phb5OkuQsP1l2In7kng4
	 lAQ6KRgZcauVmCHcvQHbh6tVjDv/ssvjOZy5PAyGGdUUer4fvNiurGHJQy8324v1H4
	 LVDjBdQ9y/oD6rPC3uwIVdu/xVYORG3ewniwZWdqPiEmyHgDgZPsHoWUAX4ydfoBW6
	 BJnh3ywFe6kyH47VzI4DwOsFA380mbGgP6lZW5TJzsoburtjd3VM2GNBHSpwC3yp49
	 Xpd8rk5fs5gQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A48BD42166;
	Wed, 29 Apr 2026 11:47:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8D47231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 11:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9A7D61594
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 11:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2W61mmx8JleQ for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 11:47:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.42;
 helo=mout-b-112.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9D8E61593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9D8E61593
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9D8E61593
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 11:47:53 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4g5Fsw45C6zDv8q;
 Wed, 29 Apr 2026 13:47:48 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 13:46:08 +0200
Message-ID: <20260429114608.1129730-2-manuel.diener@oss.othermo.de>
In-Reply-To: <20260428073542.1027653-2-manuel.diener@oss.othermo.de>
References: <20260428073542.1027653-2-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4g5Fsw45C6zDv8q
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1777463268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dgark+9FjV/eLdRhrqjo/SuixUZSxGQiZcUkCC+5BMw=;
 b=WPlLr6hjNJjE+Zq8xJVIRvhY6r76jPSRJfsMv1uIfKKLEnB6ZkZy/+Wf4mainv48kb6aTv
 LfgZ558tre2EL80/S4AJ60ZA/vLqZogi4/mP1uO6cTyw07V6i1p5uIE4qpzAzKCVAM5G/a
 UWKNGYbMhiabxrB1G9Ck6g+Tc3tn8w+Ekl3uwndhySXNkf9HN9adg860+R0DbaW+9MQiOs
 seRunDUNxJ2oQ9YF3dTulwOt3HGA0qFlyaaWMUnwht9X0DVHsxeB08wRMzyfEHruEPYdu/
 JfACL9pFmyZD64POtIXffUS+qWHL4lIwAoxSf/57R+fRyKLWztCh1454+1DkZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=WPlLr6hj
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH v2] package/python-pydantic-core: bump to
 version 2.46.3
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
Cc: Julien Olivain <ju.o@free.fr>, Manuel Diener <manuel.diener@oss.othermo.de>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

---
Changes v1 -> v2:
- fix hash to use -cargo5 (suggested by Julien Olivain)

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 61775e5522..53f354358c 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  cc643029337df7a2e90799cedbd75fef0636c6a467e74d22f4dfec4c1959359e  python-pydantic-core-2.41.5-cargo5.tar.gz
+sha256  26c3aeb21c7cc215b360611ef01fec1072ce49e2ea710b1cf340848cb944f9fe  python-pydantic-core-2.46.3-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 7394e947ec..333c73a21a 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.41.5
+PYTHON_PYDANTIC_CORE_VERSION = 2.46.3
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/71/70/23b021c950c2addd24ec408e9ab05d59b035b39d97cdc1130e1bce647bb6
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/2a/ef/f7abb56c49382a246fd2ce9c799691e3c3e7175ec74b14d99e798bcddb1a
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
