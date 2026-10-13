Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C1ECC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA226087F;
	Tue, 13 Oct 2026 21:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TB7lQNltThxV; Tue, 13 Oct 2026 21:26:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD935606B3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791926817;
	b=ieQJ7sZSL9s4VJNQamySej+ac0tQjynh3h+60Qyi8K85bQEvLM5bL53RvjGyWw+VOK3Z
	 m2ddajmEDqfg263OBW/CtbmGKkm7GjUkZ/TTVY6PeWC9PwoYO/PnQO3sCwMMJDutYP7ob
	 n231JrFePGh0yhA4jiYsGWaGTbm/aDNxa1DFiiC3+HVsqk3agJl3dH5deD8RTzfYImR9v
	 UuyXSV7TGLN+zkuqeFCv8W31y7t/zjV4U/KNL6tXv2FzBzRT8o/0G9GRNvlOS82ARwuy+
	 ie8gzpsAZqYZKHINP578hhsTet1wjaxalUi0A0tnL7hdBtjmEHjxUW6fa02UfaY62RA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791926817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nkwi0AK8lfNlK/msMlgUqIMvkFlcdFArzmIyyDB8dGg=;
	b=RttTqkz4kqide/UJGS4JmtSqJnSAL6udBaoWN7QSjZSkiIFk3VCOD/e3MpTB53VOSBSF
	 t5Jt2dZAZum0CMGx/CJzr0yyKGfbVii4O3qnRrOXtKCI+1RS1xAq8TOcWnTDUiIx3YtCL
	 qAFP/09T8a47R4PXRnFmjbLLBrwResIWOv4LSsK5zMgwVX97PLRTpZGLRHsGVmRBqAICD
	 rSxW8eFZrDBXmHNpq2YKQO1SV2F4f2/UO5RrlXCK1N4p6bLj6pyRrS4IWV/GcJZ0gCGV+
	 aCafRUhxEuzXbW1Z9isUTekAENanVMNWUvIDYPb2OEOSSG9m6iDBTxPcUu5C9XNkpdA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791926816;
	bh=Nkwi0AK8lfNlK/msMlgUqIMvkFlcdFArzmIyyDB8dGg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f9JdY7nJImCBmzgWBzY8bzoio8iwi8jptYTsdgRajMumTJhNygD1vozUGx3QrQu2V
	 7GT7P2YupKS9ayLlE30UxthEyI2fsBs7GJcoYgUpSYPUyGZap5OMNbTKTQ0NlOcaEc
	 xFg28FIMgP5VQFX58hSWx6po3altRdFLKz4I2XeUy/PJ74SFYurS/eh/y3QHh4Z94d
	 nF7FyWEIQH4bxWArMTdHG/NEndYzOvhBJkoJdJmEycJXxphreOctVHf472KWy053jF
	 TKaK35VZkdXL+WfQzqXNrw1rQN63KAtm99s8KrEHxPGU9iyyhe84mmTXBiXO9rdyQI
	 vn+7hrITP/cCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD935606B3;
	Tue, 13 Oct 2026 21:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79D861DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C344402AA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLMEHM_-d0j7 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B57DD400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791926814;
 b=aSTA+ExpiKrX0VlndnmnSj1FSR3XBSzSlzd6Ba8vEMqogxAYFnDNtTy8fdjXLOUZq5YZ
 EBBE4DD5U3FBa++bnllGTD1eHXqjtHe88yhtb+TB0warjyVNe0XjQmJa7NKe8Nc72a3YC
 04E7JdSJrZn2AF9E8BiIFKFoDL87GpN83xOyjPVwsxP+m/oNOn1Kmdcwzt9c1V6ggICLs
 jx1YI+5oiZf1UcVFi9HV0MJz0EhHdK7YNfGOyC47ddVH9ocuT7BN8V/BxFxsi22pGdq8r
 CltVz4s2Dy4GPAN/xqQ3Buf4+nir2JMg+Ub6jtivKcuU0kFCyWDmOJ9dUzLABdiefFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791926814;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ep+qNLyRwH7WzFybi2OGiT8dsx5HW4EfRZZA0ttSVLg=;
 b=Gz3ozmDLxaNW5Yn3JshKPCkosMhcq2aj9bhOvevFzli4D0gU8OZXSApHgaJ5JC6+CetX
 ddTXQx67zduV1Gy0hxyLaXsdW1dlFnIQXDd5OL3bHkUv6XrfF/Bu0SM3sg8kLlwKJHkrN
 pi4ZrTtcPTYSZaC6Uk5QchtHktr/P/R9GNBzyM81KA8CVBAoGt6X6hEgFg+hGG+pIiXpn
 Q2x+0wVIRTw3MYCSe/hmUNQ5BoQNNt3MtylOeKzJACRJY0f6qx3DKMidOf6N+yWV7jHVq
 ZQQgT6DeoCIpFjraUzuetgaB7FoSzQ4v0YDCkR76ylisYR9Yu3jGtv8egSaTnrqNQmw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B57DD400DB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:26:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE06995B7E; Tue, 13 Oct 2026 21:25:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 23:26:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 139f19b5bc63fe59e4da97fd16014aadd89a30dc
X-Git-Newrev: 90702e00569f43d743add49ef25a71a20ba1d32a
X-Patchwork-Hint: ignore
Message-Id: <20261013212534.DE06995B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to version
 2.14.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/90702e00569f43d743add49ef25a71a20ba1d32a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index a818d02069..68ffab3df5 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  38980d18ae9c2e8d54a2cdd46a46d40a  pydantic-2.13.5.tar.gz
-sha256  51a9c5f7b2f8e636f04c6cada605d9b6a3bf1348fdf945a3d8869b19bba0ee08  pydantic-2.13.5.tar.gz
+md5  d1d82b6afbe5cbed83544dd99a104c02  pydantic-2.14.1.tar.gz
+sha256  94f478203dd03404682a1ada216965651dd74b1d2d5ffd62e00e0837caab5c26  pydantic-2.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index f9e1baef9a..0a48204cca 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.13.5
+PYTHON_PYDANTIC_VERSION = 2.14.1
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/53/ef/fc4f868f4e2cee79f863883abffceff107875f569b848507319842d2a681
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/7c/0b/8e10b2e693af8ec54346a14caf36221334775975a747c9ceaa3f8371d96d
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
