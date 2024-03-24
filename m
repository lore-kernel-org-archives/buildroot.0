Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CF5C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 13:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 546F581B7B;
	Sun, 24 Mar 2024 13:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_io1LvYe_Rk; Sun, 24 Mar 2024 13:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7211181DBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7211181DBF;
	Sun, 24 Mar 2024 13:08:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE3CD1BF5A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8ADD40645
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3ZaltovdlD4 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 13:08:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6E2C40642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E2C40642
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6E2C40642
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 13:08:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D9E7A4C3333;
 Sun, 24 Mar 2024 14:07:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49344)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roNZJ-000000005iJ-3biC;
 Sun, 24 Mar 2024 13:07:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 14:07:19 +0100
Message-Id: <20240324130721.29945-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240324130721.29945-1-bernd@kuhls.net>
References: <20240324130721.29945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711285642;
 bh=F5z/Byqqbbf/NbGnSaqjm5EdmRjolb8aVOnsShWUwVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bVBXZrgYTI69s0BWwx3ImSfmPYbcmUsi3p5TU+0o6kSwBQmkq6oQiB5RXppNdHimr
 B0XniL12yT+U+GDSxeJISLpE4DNOG9MLqLBISZTpq1echcN/xcGVIUXI3Gl+ZnP576
 TBc84eLM/algrgtApNW1ru+kMTg6sVP7RBJguo2buKsb53CVSsP/C6f7/90MpqlecN
 L3jZgpGEZP7iBLhZBBYvfPkQv7Ba+iq+TYhuXVZVMmmv/XrFbeaf+JCE/8SauZrZnS
 Z5Y83aWo7UInNHfxpIcrk0A3tkpyCPOwdPFWsQSm1KsQ9h7JsRsttlCgPaht46GI3c
 vv7S4JeIcSizg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=bVBXZrgY
Subject: [Buildroot] [PATCH 3/5] package/intel-gmmlib: bump version to
 22.3.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 9527cb9a56..d9cad026c4 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5fa23407d4780c4ee8acd68e9ec9186e1721238150dc36ca9ab469a335891d2a  intel-gmmlib-22.3.17.tar.gz
+sha256  381f7ad104e3d0d8dd6c3ec0c8304e410a479c439e72db35c83fb7e2b0ec556f  intel-gmmlib-22.3.18.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 5502687a4a..94a07ebfb8 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.3.17
+INTEL_GMMLIB_VERSION = 22.3.18
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
