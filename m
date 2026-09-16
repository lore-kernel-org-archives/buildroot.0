Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4482C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8D36075A;
	Wed, 16 Sep 2026 20:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkosrWgzQgqc; Wed, 16 Sep 2026 20:18:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B4E666069F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789589935;
	b=q1WF41mw5bQhVT9H37XqboT7bBE1TZJLB1J5dpzql24hyTtmjJJhYF6LdLi6f9KNL+L3
	 EAKQOQDbaP6bDL90dblDb/AfoXh2RQx3bQaWJ/PCky891CmOP2awMPx9uTYwvNJtLVdfe
	 bdOiFCOz3IiRqIncWzXUWuJwHKFxN46HVtDy0tgEDCuUYDUxd+58bHh3L9xozo8XylNRZ
	 aPWgfQUPKYz1YHQhBc9+XeC5rjW4fM9XSbZOBfgh6pbtFpVMWSyVzZf/AFXqhYoWy7jWM
	 DRivTGA50Si+ZwlVpCfHafyiUvSzlsC9Ems0fseV5A7Q2sfzb+AUolQkakxdy3nJMWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789589935;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Q5/+sIAFiG01xwtU/xoBQsnVHBc1DHybGudMG8UokKo=;
	b=K3qgRCcZ12VxUT7fVRwsRYUgUFwjWhfPzmWbXmofs08OFJP7GgrjXmK1TMBxli5sM/lh
	 eLzq75kD0tNjk99Sn3b2J1hS5zqVXYcUKfsgkJbNadSHrGS9Y92Fz5cJ/r90xnxyrdP5n
	 bXvg6IszKz5GaDoR9/Sot0oASoi8CeIbskzK02+iuYO/6YaGyCamd+g5cO2EeljPVjCLc
	 IEOi4xuobc//UXbO1mZbkP6HrlI71bblH4u81vlh9V5c8sda3UoMHw6YPBwK8OOQjG1EO
	 1ky1BvZxNmPXf50AASvxUmGvrun492gfiTQByeuzuTcOBRCuM+xVTvNMH9bogv6NTaA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789589935;
	bh=Q5/+sIAFiG01xwtU/xoBQsnVHBc1DHybGudMG8UokKo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f4GqziVOs25EfMFmEdzQm4zk57gzLUrQt4FAheX7ynTUeN55OH/dOsQxCjZRyqV+r
	 bQvNvwtQM3hcdMhhqBD8yI65GULP5cV6+NU0z8746FKzZo+50keHquFXAtmIWLkEp/
	 Q7VhLSs6YM3OjPOyPIt/A84f3bnAxDSsdSPPuqdoAd1QZB65ocTvVSXVLmU//H8f8z
	 rsIFaT4bXfHJbrtnE501inkQnCg4nFwKv1xlYmkv49RvdAGAb0Ot4G4D/AUUbvDYCm
	 tMvxpdoX9uwNYygZozIXAV7lWDLWesCBk0lmItaItPPfNufk8QDGinkORMymc9tapj
	 VaQfMEgmzo8Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4E666069F;
	Wed, 16 Sep 2026 20:18:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5DBC2EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BF126069F
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnlG3j8ZNR4p for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:18:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D35C56068D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789589932;
 b=b9tNU1Ou45ttXcdvX1fB4O76P2Nc624jyEl86dL0DK4eqI8ogUaaz0Y+yJN1zgjdUXDV
 AvZotpo6NdC/2ELccDA9qudzJZT/v7R8rOdi27qvuEdbI3ocIvmKMM/91JZDVQv8pVo8a
 /U5vIvp9w2jaKUI+etgkeg8bedzgaGWRIHmM5H3KlBYFVxu+0UA8RdVSlBUCMHN8wp1La
 no+gyldD03tBYcAFx/Ta5IWFOgDTY171/0+i5clSelIDmiR+UxUa7yVBqBjSZFsd+kIzO
 TjOeL1yYgSGrPGQVztKtOkwT3b9mlJhSLxnpF9tNWfSu5iBXOn25nff18aGMz9WsVrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789589932;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pQYfPcNpoC/kl0G0DkLNJiZfGuz/7mob1AAWxS0VNZc=;
 b=qCIQ/jinEMGWAJhrfFNVlbMORrPfkCiYJj9jvv0+asdl8sv8j1OMeDB2su100jmdWZkf
 kvkwcjcD/Dsw2N+YP6B5iwtFB3Y9gj/z8uccXyTTa1BAiWKNA+cup+ERkEcCcWfG0mNko
 Vdi3cSbY9XIdr9Smvsn1U4YjgbnjGXAzkOISHto2m2ZGymiwDlJikIj8DZNDq1dD/4PPr
 ikYDirX0Y96AkDOZ9m/CEKoMlkjUcQKqTw0u4TGoWW4OxRZNDhM/HdPDt7F6cAlVz6XBg
 xIDWNmtBMgCidUaX+Ssp0InnTmqnsSBjB8wF53HAAau39cpMGAeDeUbcYA4q0ZmgFBw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D35C56068D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BB5192270; Wed, 16 Sep 2026 20:17:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 22:09:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b424201cc05f9646bc732abb26dab1e0aba78306
X-Git-Newrev: 5ab14b940a499ef08c2c2530169fd9cd623b66c9
X-Patchwork-Hint: ignore
Message-Id: <20260916201746.5BB5192270@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luv: bump to version 1.52.1-0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ab14b940a499ef08c2c2530169fd9cd623b66c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index f47257f37e..779046e651 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc706d9141c185bdce08b6fc8a9d4df05c3ac3676809ee4e9e37e1553d821237  luv-1.51.0-1.tar.gz
+sha256  3e6eb820a3aee034f85f9cce9bd77b5d42f34d128a1ccec877adf28c913577c7  luv-1.52.1-0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 0349f7afba..3d79bab163 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.51.0-1
+LUV_VERSION = 1.52.1-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
