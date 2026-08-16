Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4915C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 20:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67AB040624;
	Sun, 16 Aug 2026 20:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RS0l7yhPnT2M; Sun, 16 Aug 2026 20:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08A5E405F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786912389;
	bh=Jat+u9L/Q3sehPhQTf1BslEXZ8LiTrySWd3W1QEq+Ng=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E3bnVh/JSsETmEZsSZH6ECOs1KSwUCrK5cWusEX4q2IjA2mqeId6Ukm67+ZPTlVbA
	 H+fcFsfvAd9KIFElNXb9fQ5Qomx8AVn4lLJXlyw5PRAtXtSUiU1L5ovC/WVHCO7vSg
	 4Z+UURq40kDPIKYfQtqZiZcuuwYqUSdQ3qWuEWUmb3ohYsDCdAyJWV0he1V+a4J07p
	 FDAxmOzVhIrFlS4ax7KWH1rr7NJMuDAuKNnvS7vxdddOXWMeY0UIWVs69ZudSPICU1
	 ECjLB5BDSc1bPsgjZoLEWE92DqgD4PGg//LDkG/2mSEby7X7b/H/vIpevWkRoMpXfY
	 yIywAta+arwuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A5E405F2;
	Sun, 16 Aug 2026 20:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34A6223F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B449605CE
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtUSZ9bgJ7RF for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 20:33:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3E7C605B5
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E7C605B5
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bawbs8pQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3E7C605B5
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786912381;
 bh=zqDs7zyzi+z+gbtA60wEHiZADhGvoKLnJj7tDi4ENhA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bawbs8pQ6SX0c4Jlmp/dXAucPiSgNOdomDw+qUsS+sZTsU3MsKb/690TJCumuweYi
 0aLgVi6Cu9GJLg3zQxYSwpwKoc9cCRS1tkVfhOT/qcTmdQ1kLGHNmL3BAdi8HmR/Ku
 EZufd1JuP1/b2HGKW7PVnSnNV9Clz0QUUTQRlBaQtdQvks1zpfrsxVdCYqu//8ZoWR
 xmae5H9Sawv4q7umTK8rEvbEqaqtrCBiNb/UH4NH2Oc/LgEunOIC6+jiA4x/SuwZ8I
 eoXm3caOsj2+j5Czt8Up3G4jzapydF5yvh7TGhiVgrkoXB/afzRzo9aeKC2LZ0UgnQ
 N9oJUdo+ANibA==
Received: from fli4l.lan.fli4l (p4fd6cf91.dip0.t-ipconnect.de [79.214.207.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DC39DA4C4BFE;
 Sun, 16 Aug 2026 22:33:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53480)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvhWZ-000000002MC-2yZa;
 Sun, 16 Aug 2026 20:32:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 22:32:06 +0200
Message-ID: <20260816203207.3980846-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816203207.3980846-1-bernd@kuhls.net>
References: <20260816203207.3980846-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 4/5] package/docker-cli: bump version to 28.5.2
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For consistency with docker-engine. Release notes:
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.4.0
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.5.1
https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.5.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/99b74ab8c322d7aacf9b9bee370fc273a0dc7fa5

 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 1424f95752..06758086bd 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  172dca437abb36485275a8d43550db90b6878bcc676fc0b73a67a57a15026cff  docker-cli-28.3.3-go2.tar.gz
+sha256  5864ccdfceef3a9e8ddb29b4a555d5b82a551b5258067aac164b6156c6cfdc08  docker-cli-28.5.2-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 8d1b8f1bbe..8ca74af7d0 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 28.3.3
+DOCKER_CLI_VERSION = 28.5.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
