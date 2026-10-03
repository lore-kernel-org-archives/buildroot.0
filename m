Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C058BCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDCC60E79;
	Sat,  3 Oct 2026 10:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Zy8EntuKpuK; Sat,  3 Oct 2026 10:07:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 99E2860E8E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022040;
	b=gXMBdHwvjSHQ9cXwxIwvCfc+zNcK22JyTPHhW2eDbTdt153dk5B+yc9JT6n47OPxBFLL
	 6cyM/lwN26/CjsTrivLZMqEf9lxmVGiHFwWoADC8duSw+xXs6xqKB2IPPzhx7zvBMcLWf
	 evTV9gZqNi/z12ujmYdDBKuRjPdV+XeBsC/ETzPSew1SkRtTpHnSdLa0oRcMEMv6AETIQ
	 xTdFUyK8JVWrpQlAdM/l1qzZXsXPCZW+N0Rkz2xNb/MRzRqReJjrAk5PJc6FTNv43rr58
	 dY8qf6cuJ7kjeu2cyOljyV6jjgJ7mf+ULMEHSbWA13AaNJf+QBChfaqlXf2jClpgudQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=h9a70gG8Y5QhBASKUeWcVKDMqReYruvQhvzIhBPBd+M=;
	b=jTCrJu9NTxl1hJk5E3xrrlo3h3cSPNh4K+iLkkvodW7cL80NSCfDJou0RsSGprq2jxk/
	 a69thuB5e4PNPWXQWsktU5p227+3pktXssjT9TottH0wsBZIh6sCu5nn+JnKCeXB88Lju
	 ANwL0DqY209cOufeItkGTWcRwmEruj8vPwW5HGNHoh3XbE3e0oz3D9QrawkllODp0Zqu/
	 lrpoqDfCdDcfA37qAxrxugGbs7couqVruWBtGp4o4fxAgxqpoeipuGas/KKaC5EEaEoyl
	 VVMmBmBWJev+LED8G6K1fIvaB5ceNsZPJkdxkHVcP68fBcRHj5/J3xbqeYeTYxT9JzA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022040;
	bh=h9a70gG8Y5QhBASKUeWcVKDMqReYruvQhvzIhBPBd+M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ii3sufxFqtoo0T0zFfiagL/3GvIRmgvCY0mMLq/fHjmr3QDifQ0kxe1BvTFLfOX7k
	 Xp2xlcmVvZBtgVy1n7TmCWdNIHPUgycuEXvCQZ4csluAI3fvvxPzJwp3HDBkRkBLL8
	 o4eG+2D8/mdU9Q5MUP6xZoGgyiU1WTGqzUp2sON3n22j0JOliL+n+H3omDsRNwK4aB
	 WP298NTyOMiH4GNOEWSkqXxxQjkI2rm+4zOv13DnYrHD+2pPXaqPcmgkoOlYVU/uuu
	 LDwRbuufdMzLt/vmyT5DqqtyLKB9yhBwvvVZpehLrMdzRa6OyyTIoCOIDuKQpGgQlO
	 4wohPi/OPqlVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99E2860E8E;
	Sat,  3 Oct 2026 10:07:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0C60476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5BA28122B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TnRBLcQnrOH for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 121C780DDD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=gIRq49cpzJ3r1YIw5z8P3PswoBiIyDQdBGN2UBo8IjrLPPcLD1KDaeBmpD81mEl6KsZe
 INxFqyG5smqC86jB/JmWoHDDu+BSSljk0bD7t2ld+ozTIIIXIKcGQJXM6mbJc65yNjqgs
 xnnzEnaQwFWCiSsA9JI/ZFc2//bRMzbciShJw3+RZJ0oD8kgCayXHR3ypp97+2Gacy1Z1
 FLm9ebR2kNXvbhn3TlbqU5pK7fjcJrfJI1qzo47Yf53RF+3O/CVlCk8l2yGue8yhKeYFo
 3KBH0puiOGvqFaSJxx+FbwmGhyoCqJ5Dd52bXRGXlP1md+0atGLPeTgp9LHnb/0iJzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eGsPZ7uZMWZV/XAaRxHo2GxwOhWLEFph7XxJPOamOA0=;
 b=fIY2UqCG0yRjYoGFO8ewBJTWIuJqC9XVrPAGSHfimEBrkvhnOTMBTH3YJml3JjQXSZtG
 6Asc+LDdAIY4SkCkscWsqbEbJ2QfEbyS2J/qn06X7mionHmy24WLj4cp2GBRSgKN3OO6k
 HyMhLOOPlhYFfJq2Ce8XerkEsjIGX/FTGZ7L6efrkXunDOOhcGeWTXQBDtc7igrhiREoN
 DYpKbv5rM9wENC5KXaeaMU+jRdul6GW2cazmKsxMkllBndJqRu4hrPzXqugY2gc9xHeDx
 Vsv8s/VFFUMrjiSejQzc8qfF1huZztbvvi86ZOH5Igjpc4XPdoDJToMY4nWmeV2WNWQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121C780DDD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70BA988801; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2e77bfea12a94ac749acf6684db3a61427d3f3f
X-Git-Newrev: b894d68617e8a780fdd50ae54133b18cc4683cfd
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.70BA988801@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/python-magic-wormhole-mailbox-server: bump to version 0.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b894d68617e8a780fdd50ae54133b18cc4683cfd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-magic-wormhole-mailbox-server/Config.in                | 1 +
 .../python-magic-wormhole-mailbox-server.hash                         | 4 ++--
 .../python-magic-wormhole-mailbox-server.mk                           | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index 1ebcdb85a4..5a7e1b8d7d 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	help
 	  This package is the main server that Magic-Wormhole clients
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
index d701edfc72..c40de3b68c 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-mailbox-server/json
-md5  29a3ab90583e6858a74f11c3f485a77c  magic_wormhole_mailbox_server-0.6.0.tar.gz
-sha256  b1bf145f3a26d905ebff6820407976d57614f1ad8b9806210e9c4e36579a1f79  magic_wormhole_mailbox_server-0.6.0.tar.gz
+md5  3e99431631c57ff9ceb54dbdd1f05a74  magic_wormhole_mailbox_server-0.8.0.tar.gz
+sha256  c6426c4658cc66722bec0f4231bd52e8088e43379a8508776208dd0252a58273  magic_wormhole_mailbox_server-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
index 616d72dfbf..10c6dcf360 100644
--- a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
+++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.6.0
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.8.0
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic_wormhole_mailbox_server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole_mailbox_server
+PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/ae/ad/6670956e0e464c43b6366b274e12839ba6cae17e714dd68a73cd2a9d81d8
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
