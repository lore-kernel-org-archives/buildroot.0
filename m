Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56915CCF2CF
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15369606EA;
	Sun, 18 Oct 2026 14:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHW7pe1Ov1yX; Sun, 18 Oct 2026 14:24:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 115C560670
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333477;
	b=kFl4eZz9MY1lsI1I+n5K6jYBAQv6O9kMOXZqAIIr25lytg1Cvnh1odVpGCTKGgZe8yyg
	 dvdizzxUczjaOG1bWNMIIYIjn5ne08IdKL6sxW1Sk8hJPA9MDzsK82+wJS74cnG0MjR+4
	 ucmUCIoVoVwuJ4zsEFWCSqxqOpfMfnLm88Tk7F9uMsEDpeqNYgq5CAKgB9apW6NjlmZHr
	 LqM907tayiJwESmsMJQURZKK/8Ir3sMH2xWDF3y86f0Pwj8EzBm/j3N/zXYb2B8N25Ahb
	 3YjYSBeamX/Lfw530zGDgc/AR8Tppv0GPaLMmN8AVp24bGXZGAk9fNAdVAYZaFWDF9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333477;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=12rpikXB4xnv71vMLDxPA9BacLyDGQMl4HNLkJH6nbM=;
	b=O2WmL+DngtZhqEfPdGf3RAe7xNVZoZnl3gLS8Oes9fqxZu6QJyLmJrYwGVU9UC0aT55W
	 KVv2SMAAkRIovJttK6vLIR6NyQg1Y8sGAUFfxovVYvaxsheGLIvVaN6l/NnjOrY/eVF0f
	 s6YKy18otB6N6pq+MCYfHb9oaxG5cp3VhqU4QdUpPgeuQl0UEMgC6V5ec06WbEzzFjmIv
	 K6ar6owSLPA9D0py5svjNUtN3blbORkgaPcFhEvfmzBJRoZ6nKGyCWpPNDVb+ZsRFN2w9
	 Y6WKyOPeIJs/4Zkk8feJVEXeYe+UsiAcRXSpVRZuN23uYac0+kiGvL3S7cD3lotSucg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333477;
	bh=12rpikXB4xnv71vMLDxPA9BacLyDGQMl4HNLkJH6nbM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TTFntUYC3JDAxJYpYXv4bqdZ8Cl5Qio5QKpM8jV1IFCozm2nTavtjgaKwY7enqIq0
	 3c/nYzev0cNlPEjnP0udAaeYW1/J5x3x4GiJiv/A572qdweas5+wmibhhoTo6eGtDp
	 zZPNwsqWSwbeRkbe2lMfCchNXUg8P7tWnHmIJNoYVdKXvpFtRX/nFJt01oHCU2mcys
	 M7nJ0ImSfNIJ3NLCmHe4zzesN3BSzKyEgg7eYBZ4gWskw0Z/sN9nWvqx4Klx1JWnP9
	 GGqwa2AEGewXurVdsbZcFs6gaV/3ORRNiYmp5X/BnFkrRZfuXZBELSEA6daSSeHvgN
	 36F6vBu5jZ0uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 115C560670;
	Sun, 18 Oct 2026 14:24:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1EA761
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B718C40210
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHm9YMaGKE5m for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 11622400E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=m1AS+DMnhlAjovn4O3psUrXCgSWSU2zu7iactc7ZshokKRYQEmD/kIU1SxkTOTS3Tidi
 yzfqttjMmJaCFeNmkarFn8NriujHA6zfY5x3ZrxF/zHgxMHM/7MYOIyHxZm75r1EohOtq
 xKj6Ia3gTy2kcrEK3uL4ThVud832ekfVVAvT2Dc/YT8zhsNlRsUzBoUb2EvP1TeNuMfZN
 9+Zl3rfIoooSh5cJ3/Aib3at5FnFxtQQkpfRZq3Kz6BcJiO/jPQ0wsv/qm5yMsNeiuMB1
 CQzmzHc0UDerPlxADmM919xg0beuJ+vPz+vhFM4CfJ+LqWMAVphaUBLnzhbERv2j7KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=q0s9G1qHhYen6DAwzmOoois2SrpYBXlFIJRrHKMsrHk=;
 b=fL7yT6SJZJpcEUmVwCqdlUaObnPUNdGnh1WaXp1SguPo1Yu6wbEI5j47K83/joQffVFF
 oEdFvp3GcueVJTkdePI4926tHFuXe090MlsZsuEtO991B0Euu9eHR+8GAbDRwEEit4u56
 r3m1C+M9cjJrkxv0EggObejYSAfiANNYAR1t+NLOLq9s9SEVd5AUTJCsuic96t93dbM4f
 yRz1icFVywkkZngb2rlmdgWp68+FRix6UPNznu9ksv1Qi1KA/ycSeodNC+YXPs2TnRYsC
 hRTzmLXtmKEt0pSzVBik60Z2tk0E0U5e1bfMUhxTvN9KbW7BpANrTaSV+ckNZHGvNdQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11622400E0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3AB19828F; Sun, 18 Oct 2026 14:23:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9eb1cb09c7e96b9891a9c866617a20fd6482e42
X-Git-Newrev: 568e20810739758e3f9da6ea967a3eb3582f5b23
X-Patchwork-Hint: ignore
Message-Id: <20261018142303.F3AB19828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-git: bump to version 3.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/568e20810739758e3f9da6ea967a3eb3582f5b23
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-git/python-git.hash | 4 ++--
 package/python-git/python-git.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index f86121683b..5ac0e5f85b 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitpython/json
-md5  1d057defef1a684993a1b664062c3f64  gitpython-3.2.0.tar.gz
-sha256  fb92310af6844d96adc95ca066ed2e617c00e1dbd146a326626c81e72e18cc2e  gitpython-3.2.0.tar.gz
+md5  86218016f8db6759afa4129c307b5998  gitpython-3.2.1.tar.gz
+sha256  0f1229ec5c057bdabdeeda8bda4f17bda679ab33dbccc00f24e6a480553c8613  gitpython-3.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 8dd87cfd65..5b70dec755 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.2.0
+PYTHON_GIT_VERSION = 3.2.1
 PYTHON_GIT_SOURCE = gitpython-$(PYTHON_GIT_VERSION).tar.gz
-PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/6e/2d/6f6e649818da44d4499604802c89329b8d9799687a124e3a5e467a643336
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/c0/ff/fee293f1ec3e1b64db6eb270e00964f29c086d769201474cedb8d1608930
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
