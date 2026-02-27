Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E393FEFB70
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 18:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B001940CB3;
	Fri, 27 Feb 2026 18:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wE7NdnJqfZNa; Fri, 27 Feb 2026 18:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12F3A40CA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772216402;
	bh=ggQxQUXG4IESkB0QkeRD+DHzfPAYSJ1tSnukJvoVIJs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BHCqPXmsIguqCzy9qdRvKKh4kIkEZg0ALgiz6dek3afW2oD0/waVBOutXH8FLB0MJ
	 66jwUma4lXPo+G19EepBOiIdnrrls+Ge3OGh7exF5Xm/E/xaCfLu1OmdTTFCY/ctjc
	 tV5V91eVr/mZDMSnBCYddh+2a+F2AvpQUTjkXdRhcqIn2F7lTbI7as6I+9zaeoxZdz
	 XeLV7Y9zk6XhDTIVD6PV8zA4jnhRwcFaF1cUGCXHRwsWTq/8MNKquflhRTp6XAlaK+
	 FQG4cPu4T3OBRt+JeyJSxwDBeZ4oCtMgyZN8R0HVEf1WIim23xGV/N7IJop9LsIZwe
	 /AxmWjV3KR8Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12F3A40CA2;
	Fri, 27 Feb 2026 18:20:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 143E2204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 060E14009B
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJXS-ULGl22M for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 18:20:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6386540070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6386540070
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6386540070
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 18:19:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DB73BA4C3119;
 Fri, 27 Feb 2026 19:19:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52458)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vw2RO-000000001M0-21as;
 Fri, 27 Feb 2026 18:19:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 27 Feb 2026 19:19:54 +0100
Message-ID: <20260227181954.1335186-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772216394;
 bh=xg2Ao79Eh70qICIdNLnknGGhWxFGS7JCgHCIFjSbWs4=;
 h=From:To:Cc:Subject:Date:From;
 b=RDmIN5rZOWiHDDiSJ0WtMr0zctWX6O0FsH4yw5p6nrEIRL9vL3WiH29w28c/DTFKf
 /W1POvO+5PpWp4gUKn+DQqHH7qWyU8PKXyi5BLXG4sXY1vgIFylv8X53Z6/faTUx7l
 V64l61kvoCxfb68cnyhibImZwN1Mpa1l6ZN6HylpBpQAKR+ekzPJhfSNaKyCnx0fT+
 fqv85TKbdxvkG4sDtnlmeIdI/aT64vqEFYMaeAl/VShoTgl1tY+dQRE9K6FEK7JRvk
 d22cy7LUcwDQrvMfgdSRwoTEXq5ZNHJIhb8DnhGIeQVnzsU4XvFzgvtpeUVQLCA7Er
 3AwivJt4Cscgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RDmIN5rZ
Subject: [Buildroot] [PATCH/next 1/1] package/wlroots: bump version to 0.19.2
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

https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wlroots/wlroots.hash | 4 ++--
 package/wlroots/wlroots.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
index 77d5c4552b..37ac909693 100644
--- a/package/wlroots/wlroots.hash
+++ b/package/wlroots/wlroots.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.0/downloads/wlroots-0.19.0.tar.gz.sig
+# https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.2/downloads/wlroots-0.19.2.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  aefb0fe2633b0aad1d66123b2f41afab004fb625e2a7790492cdd39a805cac91  wlroots-0.19.0.tar.gz
+sha256  09a0a8d60104c8b0772fee4f60ba76a89aed7e59dff7659d00960fba06bdf267  wlroots-0.19.2.tar.gz
 
 # Hashes for license files:
 sha256  35d427c043dcafe8893b9e7247348f599847c81d9a067703587c80707f3d58df  LICENSE
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index babadea94f..bd2e0eb561 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WLROOTS_VERSION = 0.19.0
+WLROOTS_VERSION = 0.19.2
 WLROOTS_SITE = https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
 WLROOTS_LICENSE = MIT
 WLROOTS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
