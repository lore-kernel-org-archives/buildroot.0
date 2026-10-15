Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F060ACCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A17E661221;
	Fri, 16 Oct 2026 13:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id tkIq-fvIp1yO; Fri, 16 Oct 2026 13:12:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7869861224
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156342;
	b=iiqli+BRpywjyA3tj/P4lXw2uLCS00qqW+vnmrXj2XSnTe2DNUis4FxsQ/CtjfhfU+lA
	 zsEGvjlXPFXsK/efxp+HKgavXahVcK5wZnNCdWKdEVOUVrqcVkk5SUiVM+SAukPly0Dhk
	 3d8usjCPhOFJJ16j/mD7Qpq+VNTcTwfdQsbXVvbEfgneL8caNJIJoTC0zvsI9eDFaKrop
	 uuhWfHa73aKU85X/usNAOpr7+hhx4vxkqr9spOPn7aSK1V/e4H3KseXhy7zo5PONcBaH5
	 so8AB3ACsboiP5HcfhB0qHF1Fqmgs0VKLTV4GSZf8K3WfzoS6csBZfh/XIxl8cBpEGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156342;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1A5ur+c7NQZywalM675WIp3/V3rFf2Jk9p6Xb3wFwF4=;
	b=hqQ5yXoqXGJOc+V31f4KaUEcn1X2+D/aTE4Td/eIUIjOBbMzkLHzufBeAGGW0b/GAXTd
	 hpR6rb1soA7SXbIzGt2W93xt0/+ta/9UBDGt+qE6TJnMuI4X9zaXMm0Bw+ajvJJ8tdD5a
	 vjfbhFyq/B5FOf2KRKxcVLvUtqML5nlM+/DK0xb2o6PiSuq+pNX3/jyIXpbzh8SDPGrFd
	 eKrUwTYuXPcCMa8ufQhn7y0OUgOJREaog8YjRdvF+mGcChQTM8oOq/zKfOCjL3/o3RSDy
	 avBxAG9kCQcoPH4ZJ8uQbXRSZh6NL/MbePSoMPBHX6NvGoIBJLchNXyAOT/jE6aoaKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156341;
	bh=1A5ur+c7NQZywalM675WIp3/V3rFf2Jk9p6Xb3wFwF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MbVPuSpkVM6xb740QWHi3u1U6VO7Czc/UvzgSiSnUq2FFp993lsQoRoPD8lD77c/l
	 aUo6W+brohRjwPQl0UCF9l3nm6+MQBuN3p06F2cWSV3NckSGL/3Qm6Rj5UWsYkx+tA
	 5jSvxIo7JOT8DFu/CFa0s3x+aVjfZ0pDhKyMW7z4xxVKrTxokbbUi3K5Yq6qg5cbu1
	 +8PbA8XIlWGspX4etEh/t9BzteqSav5FhYlyONDJS0zLnxVc7awTaN1Hj3jY21KQsb
	 mdN58QMy7NwiWoAgaVR3MXuAuPOFfYOKHbSg+0g7EsXYoGtkVMRfW9B2RhtqNwFk5K
	 /3ZRNtUJfWk9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7869861224;
	Fri, 16 Oct 2026 13:12:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0B24105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85E5760E9F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2im7myBeUNe for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4A44460F1C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=eBrVVit/r1jcDKcP8FNqhxRL76Pl23S9yoIFNbLo0iF+V9zNaAslhS8vlJWeN3l5g+JA
 Qk+GxJL0VinSJFvniiX1QgdqI8aVmQkjtxKj0h3L/vKQNHr85Um8Vt2WOnXmAokXO+Pn+
 c+A6kphKnUlgGDmu5bjuXs+VNeB6jF/f02qg+WDu411/XbvEleny4HwmxspQDtYa3eqK4
 GhoVI8XiXVQaYTJx0HFe1w0fQJElLzJeldKsG8TfxI161DxaFn2NLvj2hnoKszSj8XY6f
 4+Q+vEI+zTbse+UtHr7CttxdQnImSkC8EYbSbivUAkVgeahU3ts3vYsg99hl9vfvL4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1dXMEAtqHFNsX9o7mNcoHDbVEZKge+qI4ZZdto6tuTY=;
 b=bWoB1ffR9dQMLOgt7azROQRBni2bGAn+eakpqIzCl7v7mbnQrbbgKA0vd/bDucM0AT/H
 TqdK9VasZH18XfwIVt+yNfkiFUdBTCtecooi6VduK0oW2FUsAdMnusCSzXJjWnom1c5vw
 K4bgMHzhK6+l5HuuB1w20oTDZ+da/Sca53pxJvsRBvUVNnB5qtMpxEgytL8P91RZajvXX
 KtKiEl9oedeIh5yILjscQsga2YCIlhc5b9HLF7m3nnNeiawKF3vXQhbJEF8IMsM5op2Na
 85GsAzbmblvhLaB3HWI7MFG9DUUFrzIFve80+cobbhphPkV1qSt2PenojpKEf+Uq1aw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A44460F1C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A5CD960D9; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:30:06 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4afda3339a5d1d61fd820d8d02920cda32d4ca85
X-Git-Newrev: a6ff89cc79459d5414dd9680b8326d280a5dbd8e
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.3A5CD960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/expat: security
 bump version to 2.9.0
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0372003630413818231=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0372003630413818231==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6ff89cc79459d5414dd9680b8326d280a5dbd8e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/libexpat/libexpat/blob/R_2_9_0/expat/Changes
https://blog.hartwork.org/posts/expat-2-9-0-released/

Fixes CVE-2026-77214 & CVE-2026-102633.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b6525e9cf89394d45e1c74085d0d1d039bd890d0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 262ad4bf0d..41778fc536 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
-sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_9_0
+sha256  1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051  expat-2.9.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index be4180992f..be5d8ae0b8 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.5
+EXPAT_VERSION = 2.9.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES

--===============0372003630413818231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0372003630413818231==--
