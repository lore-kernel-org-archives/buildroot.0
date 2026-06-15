Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC603CD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93AD5418F6;
	Mon, 15 Jun 2026 19:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77wihXLYpBlP; Mon, 15 Jun 2026 19:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B16E1418F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781552545;
	bh=99JzD2Ih/yLkUNgdz/woG+y+uDbKPi8Wj18XvqGu2lY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ofTRfxuThAIcbBMib5KMsgvUlhDSeUxwgaKyftiwm37+X+81i3kkdAeh6fQa1fSMN
	 93PZxSHYYIof9zJ67fumhvt3/eXv8ivqsxEUi26vNYYE7mjvHyRfFW79aqNdHteesn
	 4IWqdQ1b6hU3ci+Iz1vwcu1KIEpSeHZ1MB7sQF70xHh8kdyBIoN1Z24DVzBp3A1frm
	 HxIvDYcI/Wkm21s/2TDLVDqVF8bZbQ4ucJ6nuvBp81AVEEbW9xrkEnoK5vhASNw6Up
	 EfdFYIj+6wff0BrhPG20Onvpgex9Ywh4TpwLSu8Rkud3xBReOJNChgsXpdvg8ZwsC4
	 /tpt2QMonNQFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16E1418F3;
	Mon, 15 Jun 2026 19:42:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1594A2B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F01786151E
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTpdv9rpmpqY for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 19:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13B006151D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B006151D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13B006151D
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 19:42:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04de.dip0.t-ipconnect.de [91.58.4.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33D00A4C01DD
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:42:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46146)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZDCO-000000002To-3fyX
 for buildroot@buildroot.org; Mon, 15 Jun 2026 19:42:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 21:42:20 +0200
Message-ID: <20260615194220.518965-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781552541;
 bh=eNv8mpH8SAeVbug+TdSKTKduS5pxihBjpc8hhyWLsUk=;
 h=From:To:Subject:Date:From;
 b=rKOGDsWAOPyrypwVjh0/olbG1EidasPGkKqbRoBrYCwifpNLm1HWM6yAJohIku+3l
 Gsjf1woD+PNC+A7BZmKd5jBeSO+G8Zook14EbrY5gAWOCt5mnOHAMSSAAUpKm+67i8
 rUXhBZVda4lSChijnG+RhJAfLkmPCjLz6XalJSAh7Ozykn8m9VEV7hhLE3Nhne7bd6
 OwzgRanL9GTSG9NakKo+BeqS1BdMwbwml7oXl+Is74pofkgrsfaejlVKVM380F16uI
 9mP/aVDbky8ZkOuT/5b/BaTVnIjBaN+MshrAcIs8sljMxQAhHnmblJAZJRGXhCC+bH
 dWoKzC8zrcgsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rKOGDsWA
Subject: [Buildroot] [PATCH 1/1] package/ytree: bump version to 2.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.han.de/~werner/ytree.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/04c8746de3d0345b9c9e7102e89730eb85758f48

 package/ytree/ytree.hash | 2 +-
 package/ytree/ytree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index d986b68518..1fbf7eca73 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2366d2d5fc1f644460323863e5be9974584bc9b2d66d7247165a8ff1a0991114  ytree-2.12.tar.gz
+sha256  caeeeac334dac83921bd8b657ad2d4cf234c15da4ffc7d15dad0bda99e52f197  ytree-2.13.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index c597367f9a..cdd16fd3dc 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.12
+YTREE_VERSION = 2.13
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
