Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BE1CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8030F80D87;
	Sun,  4 Oct 2026 16:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDoAeRXDb0AF; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8ECCF80D7B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130078;
	b=SpShCrMdGOAew8k/X7hJUCIdAHHA0a0hjWYaO/TOsvMwOBJBUch++n3M8BJbjXH3724o
	 z2bitLhfNvD95nLALIEyAWiGuGuAH2oq/TrXeGaW1DJAN/fzgMges+PmCKZMCJo/yI8I1
	 c5tW1otJOAdDsKk9HHDnLjxPMR6yFd6Ju9ym23awxjKWSQmSLo4fkYwvzlAfxZdguTw/m
	 oSIJHGuwr3eLejFF9I6l4COUhwFXnpPjDPPY8XU6us8xbUO4oe+EE0KL1Bmf2w3kbO0mJ
	 ZaCmoKFjLn6ytLh/oXPjb0bZdo0XPoNS9GGzpEtjz7RAYqG6q+L2L3E6PgHdjm4ksEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tFl9ywEEwk4Ctfa/2+QpS79zShuBilpp1ZsyHEmr0IQ=;
	b=FeI5vIce0NtvUzBAE+I+y1SuXvPY2qjZPaj5ZUFHeeJFkQvR6koFDfyDfT6CklpIq8s4
	 kOEQoGCzCnRlJg3GtnyicsxezKkECCCdeN4NFBnMbKOMW3rrSuASgfrDPrWfUL4q5AMxz
	 1WNz5Psy9eCRD7/eqIc6HToX/0lLUOGuQwGftz33ApZGoynGBHXL+TdIXOQvh4Wx0ITe9
	 eiVV5RBikPsllTyNMDsLvfUm3T9xYJ28KHvfbXMM4lOovBO3KBM6y5D3h//VJxBZkYESg
	 JJJKOoeMw1SUvBzzLL3a1RwvN/ff5wc1+hYugiRHaP/qEPtr9ePS5u5duegey/bTgXg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130078;
	bh=tFl9ywEEwk4Ctfa/2+QpS79zShuBilpp1ZsyHEmr0IQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FAVK3zXg37FQz3PYs7J60UN+Ita6qVn2kEBoR8UsV6PGLYNHSHpx3uDg+GT90bQ3y
	 rNsISuDS11jb3eByEdwmfJ2+Wh964t2y9XTR1NSrtiauZ3zDFbxbd5/X6HHQbz6kEG
	 gUeWndrCKwKkP85EoEYqRUeIHj52zVXe5moCx10xLr/EeEAAq2iF2H5tysv5yP4Z9O
	 RlbTabCVnAHeIBumZjM6uPhzM7RsSjft59mspMagc0uO03FMZj33aUB8Tr6PpUGuvb
	 Ez4GfVJmpJfCEcJgFY6bQd4avEKTb0Y9cmMzthGTdDWwZJk0gzBkjQJwmEc6wRe3EC
	 U0r9Lbx+YhKnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ECCF80D7B;
	Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC23E34E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D242D80D7B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lr-Ga7pQ8M2R for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3016680D7A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=Ir0Qc4DfY1WgMlbFfG3wAsy2IWHV/Ce8WBKHwDjWU5GbAziq8mlyBWPHtpKMTSy3onYU
 78ck0H78GVTmbzF/6c+38UfV4/u4t3MMbdpvS/ujJ5xB5zVOAoomMyeCFLHtTEUCz/WHQ
 zPeiEKU7uRfu6X0OHiBylxiBA8E1k3HDzslwlsYsRu5HJk53fD8ee8a7TKVLUp9c6gCMO
 7TezZpFxIFaYieIC7AO0OI08gO59fkPSqp0CeSZHloNX0kkBxlYAfvyHu6btB1wUD6Rwb
 Pg1S2R3BzHoZzTUJpWBTUZpzhEL+XCEL4qjPvPtLEjdfkppUDTJBCFpsvaq506xCUpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ApCLPWtCZkvhG2XOPfCf7zk7EosbzTXt0+YvAWjg3UM=;
 b=rzXgh/Nb3gJojld5IvOInV1ab9oE6ZU6tJpMx2dHUVWq+JDQMXKgt/4zLIGxVl8WkYRW
 RHwPTeNthCid6NFpemu9iRUF3CYR85B/4AbiOYipphhnksI4vp/BMKmc+rKPzdXyYzbMG
 6K9AV6yqbdZMerU7ZNJxk7qxtRYm0++fK8P2b07qCQ+BUP50f4zvSi+Gcekf0kUglsAbU
 1pXoGyOWkBloMC04WMBQEz5fBbmtRHDnXVydbZ/VAd49DoXigsX2zb7FL/bQUomftsxPk
 FTVsvwGHYXkDxV2SjbYpJPc1QArjfQN4ix+sbgdlQ9YD0M/wOEpDcEjdAdpUHW+JxBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3016680D7A
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E768A8D220; Sun,  4 Oct 2026 16:06:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:02:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28dc0c3ec1d6294689e84bb36171640f14781c95
X-Git-Newrev: 89d113bf6c1fbbdaeed5a291fcdd3b86c732c126
X-Patchwork-Hint: ignore
Message-Id: <20261004160641.E768A8D220@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-proto-plus: bump to version
 1.29.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89d113bf6c1fbbdaeed5a291fcdd3b86c732c126
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index 0f43e2e266..03f8b4d45f 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  53f43e79ef6085de9931338147283228  proto_plus-1.28.4.tar.gz
-sha256  5ff7ecad828e032a491fcb86947801768e32237f99dd049b649965b892ae9a63  proto_plus-1.28.4.tar.gz
+md5  8592a7cce4c385c5a6c098da6fc4961d  proto_plus-1.29.0.tar.gz
+sha256  cfb4e62ad7e13dd18f346cabbda00cab39930d36a05791fd81ddb074d6ee884f  proto_plus-1.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 6999d0a2b1..f57c1a23c5 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.28.4
+PYTHON_PROTO_PLUS_VERSION = 1.29.0
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/40/a6/4fbadcc2044034449b3f8f0ce82dcf3005d53f37c136642103fd4836a31c
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/46/70/783e33ffbb4466cc154a94f79b869b92a451e2bd45605054e68ff68b7af6
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
