Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D959CA6004
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2693A80DCB;
	Tue,  6 Oct 2026 16:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIZdDk_-yfQS; Tue,  6 Oct 2026 16:30:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 57BDB80DD7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304244;
	b=bo0gNsMUjTC6HMCzjcgI23dyeloxaWIk4bbzVVjI2MRybBpOZwd+1rWBBmDHGVPEg2v0
	 OjbrOPQVIbdcnTDGul1gDTWhhY458o9kxeQbPpzTkKpZkrtf/Z+BeW5b9/jMkvPA28rWO
	 D/QSCuhF24tSli/9FP7rqZ1PqmeY8kEr7cDjaWgVy63sMLIRcGj58htsvJvvw7PJg2CkU
	 cFYfZsQ+RBVv2SLe4tVGRaa+lx3GzYYeGC51A4tLnEpbfBNg5garUvA8HB5u2FaVziegw
	 +RNBxaCmZiutIu8DV/EwSsBrvUC0ah66/NZ8/SnUlQcvdzJ9LWeXllZiFcNIEhm9IyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nMaZsmeKzBOnqMRrVvwsGr6bGYn41Gd2uVM4T2l3VzI=;
	b=bB34ODWKsDSjRCFiNab1w8a7xYg3LLemCNC1QQ/Tawub6f6pwjjcaUz1qjHenuW5ydMu
	 S+3gItw522NwKQCY/pqw4QYmcrELAXLvErLCQMSKNutMw7kuQrlOU6XBPgf7NzULvDROo
	 UU/0ZlufG8Dq9uL/mWRr7czEGMrttgwldDzP7M2wQeNUibtOAKWxlAM3nC8J6SCqFyu8C
	 rT3uZu9s078FKlbcJThpQNsnRBpiVddaIsJyUKY1NzreZf7Y17LvxLZxux92BVZlPwJ/s
	 FBNfT9h+gjMGRf9nJ5+DPxyjvd0IpHe/qckxcRuZBtHq+Zzj1ASesm3uCUYsTUebVYg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304244;
	bh=nMaZsmeKzBOnqMRrVvwsGr6bGYn41Gd2uVM4T2l3VzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z6zSREtAp3EjbCuEiR+VZMg7uibeooYkj7I+I3a59I/5U788dt6YMKEkW51x9WHK0
	 l7ffyNrVVX8qN5T4+53l/7iEl2EDDUYdF+fu+914JlE/VLZVNL2luNDSTWywujRxag
	 k3ZnBYArxwqAJ6gocMTB4gUDDaNVj33RLQrUI6TCZ+vwlvmf3MwhqZlFlANHIvzC5B
	 DQNIQp4Bl0KKM9vUBKNCfQlOKP4qAZu+IkF4/8YlC+mHlBWKaYz0V0SKcL3TxSu12B
	 G7fr275mx2MChWcU1SIErVCPy1oEgWlVdWxwM9VCJ8Aeyh+tUNVKFMiUPewfmZUN/k
	 rqDceZHLTbyZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57BDB80DD7;
	Tue,  6 Oct 2026 16:30:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67759341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58282402BC
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWKc2Zwe_wGI for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 761B74009F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=Fd0tVOeit6JUBjG1dw2Mmr0KT3Hu8LMijmu6+W5z4kkMfUPjQW6kLAQE5cdfQ07TEP83
 b1lAhZBw1HrD0F0GGhotpHPjEQ2uaUugxnYxqpIgWSN6h2vcKd9yKJlGqqVQSxaVHPssv
 LB9rfIB+GZOA+pNCsh+eSdq5JXIeF+Ar+wLCgYgohtlxiOCRcrlb2k9ulGr73P161OgUm
 1nZag20q99O8CNrCJAKEI6YQnE0guI7QFWcBK6tR/bbE99Bn5CRmk2uNvWyEiocM0dbJt
 F0PdVwPf6iy8ab0R4cJ2zDVoEnMVKab1ItZPx/jIgHSHwCQgNIdY8Z03xVGkHyct/KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qqcoG1nYMnNU8JxHuxYw08GKgVT+pQN4V3ffkU0ZDLk=;
 b=Na+QI3lHH9JWtyJevEZNuGpwnq0xHjaRwBkoVIhKDygIEdGHcPT4p0TKCv5Mz9KCRE+8
 x4oZhRcqLi25+U9wvcADpCG9yWnRTOAYDjYShcPylUyxO69ZroMhFISVIe6QzI6WZtB03
 azJT8G790HJ5AWD9HriSnJyzpwtvmA1WWAhiTYfSPaExSTsYhh5i1ivS1U6oVmUb7qyVG
 tIa/FOB2gXZMyfRRIlyY6FL0vBwh3HLuRjtFCP1Vqg75VK0Ce6M46VIscoUOZAoTrCE4d
 12rXO5HWk20DH1+RzcYmzXUl6c7EI0jt2zu2oaRm9MNBrsaxnjg7IQ3dHMKdKfE4kFA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 761B74009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CD898DA0D; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:53:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 532aa127b933fd254c211644932169666ec67bd7
X-Git-Newrev: 85019ddb138ac0531b54506473be292abd6984dd
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.2CD898DA0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump to
 version 4.12.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/85019ddb138ac0531b54506473be292abd6984dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index a237667ad8..7f7590a6c8 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  9d6b65f596852735dcdcb3109127d454  platformdirs-4.12.2.tar.gz
-sha256  eab5f70271a490ef74618bb314fbb86e3c7e82fa3b9c922c2ea0e0a1a155d329  platformdirs-4.12.2.tar.gz
+md5  7aed05d0c6d803af78de34d929e51bac  platformdirs-4.12.3.tar.gz
+sha256  427fc0bb321ae0c5b037fa03238ca74820437be162e78b4848c4d4055b9b766c  platformdirs-4.12.3.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index d3463254f4..9610dccc64 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.12.2
+PYTHON_PLATFORMDIRS_VERSION = 4.12.3
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/17/c8/721b3855fe457da514fe249247d404b9b39c5d16532278f70ebaa6acf18b
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/42/23/4a86fc741c38c5b69792a4ef954b281afa69bea9f083f881de1b0d23bc07
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
