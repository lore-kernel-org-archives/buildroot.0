Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119AFCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C60F060601;
	Sat,  3 Oct 2026 15:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ivkw6gb-uODV; Sat,  3 Oct 2026 15:54:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5912260683
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042863;
	b=oCKp/UIccm5O4IKP4vRoRtT9+E46ZV2+yRD4R+mqk7dkHEjRPlOs7jmpOef7Wo7z01a9
	 TAvPnnf4CwI2tx3VAF3JDH/6ofoKnt+34CD82xVOXsEf/PWdh6LH5wGmyNn6oiaEr5P5u
	 4rfQBgXp03RigjKWbm2uYs0cA6IA6MlalxAw2k55ic3KGB80ELOuYjPBqTMERC7vVpvIX
	 wv/VF/bxZTPZG3GVrUqDSHgoryaYEbpdW6C+THSo8uk+kNUC1+cZJU5OkmE7IOgDVQoev
	 UGhXKb+qq2I2wpc3sGYQ7iNAwNaRSeynP+4r/QcZCFxkSjsOZLjqDi8y2Tnzrbb6wjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=39mRdo1MQzdMhz+bZabFhWpg6XsfoDXaoKFPz65xr3M=;
	b=O5ANVCvfAfv7UrVLNLiwEVSPImea7BMKwZj0gj9j2W3HW2Ao9J+dwQI3JhA6auL0/7lj
	 xmwqij0+EkdjBtPj20fOEywLp/eH7BqSdBFFD+L9FUtuT15VNykZi1hiclsdvo7r3vT2i
	 OF1RnNLqt+XjyZuaZNstXLgnsktZeb+8i9hpasywTSEaKf9w+dfeJzwNaVhT8y9NbF8wO
	 lD67+LFQj6c6dqXBl8hlCbr6Rsz/sK3piC46urpsXfNgmS8Utcfiwd0XnjoVvjzyZHr2l
	 a0I3URrZGJEbfTGRu5UxnPMJeNLHnbQjG+psALQiR86QVR5jljsrossBpG7rpTuh8uA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042863;
	bh=39mRdo1MQzdMhz+bZabFhWpg6XsfoDXaoKFPz65xr3M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sfZYV2IrjBCV5lHwkZYiO8vWi8oYTjz6lKoWN7al+UWEK5oAkmih1d2cu2mYWoala
	 xrWR4ptyUnub7nubPP6G5PNjw4SaThfRjVmrXF+xEAScxztzGu19Fnru/dcvDZI6WZ
	 hL3SRqJE8WVF0dpqSUHB9J6dE+7bLuU7MQShrxSybrbwxSLtgeLMHCzb6eO/LTxUsO
	 VbN0bYw21kYZJfxhkihtOGk7nf2Z5Mvb2SdhAclbboDu8TJBbsEygT9Yf2s+lNeWat
	 pVlL8CigUJ2cA+1DJ9UlceJLHqba8FoKy4LZVkRf63yMX0fbPo431sobOBIFLpMbjE
	 g4sbXUAOawPnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5912260683;
	Sat,  3 Oct 2026 15:54:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A88C01D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F89400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wj6ZUtLNiYPk for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E0B0940049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=Bw4UYJw5BS9Vs+KWCk2hZuGZ2v1eE6SODQfMuaCt/MthJcUQdOd4RKTmmVDXxWyF0wM3
 dzR6WbBkU/t+XBeSOXS8Rj8Y8XYqxXrbpY1o3lPvMj6pfQ48PVedkuuFuyAAbAL5ALUQ0
 BDNAbLtDOWlXjjh3u3tuWDxiqcjUtZtthXlo9vfAK3GwxgJis5bJy8xKlC0OW6grCLFtC
 2frAkb1CgaPJrcLEUJWT22sg0uGZa1xPj0wa1rbIXqMqjjmH+uBWrgQ3n2FMqWYxZZd6q
 ImQFNqx1r+wviGrTseeC7TB/w2piP5Oa892tDDBSgqCFe+SHg3giEVgRxnUpDyC7akA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dEuKbRZ8GBdWaosSIFjbFYjrlxQhwCtBEbk3fGHwbfQ=;
 b=qPznDWuqnUrW4MZqVQRBdgXyTKCJNkc7sSybHWFYlwcGn3PLkgLABGh81Wwvlsd3X3rj
 VFfZ8fCc0Prhc7CUhF0D3Khwb9XJ9B60iG2AoiCLI4AToRIzZ45/VzXqwym0XPNsYu0Zs
 TWSFRnRk79tFr/iMUDVsart+UjlNKGiK96mkfV5kMT2VQft6FVaBk3bNnuMBOgs+1cZnj
 cw9t667/VVV0cS2/djq/BngrrU2J9YcXmratP0LO3cT2wBcw+zDQcLG7HyWCM2daWvIQU
 wdEalVbsiO7sqmIwWtZHQ1OmbG1TAE+/nBhh3Vcx8Dpfz/1P3fYXGWet7TgE0WchvKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0B0940049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D4298A31E; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ab3086a839cead70f0c5bf5097ba15107395cec
X-Git-Newrev: 8e9f8e060f71b7ae32d69db5db1495399660139c
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.2D4298A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-psygnal: bump version to
 0.16.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e9f8e060f71b7ae32d69db5db1495399660139c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psygnal/python-psygnal.hash | 4 ++--
 package/python-psygnal/python-psygnal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psygnal/python-psygnal.hash b/package/python-psygnal/python-psygnal.hash
index 29493977c8..6238dd5b4b 100644
--- a/package/python-psygnal/python-psygnal.hash
+++ b/package/python-psygnal/python-psygnal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psygnal/json
-md5  209e3e54ae0b019d43486e8abf9edfba  psygnal-0.15.1.tar.gz
-sha256  f64f62dee2306fc1c22050a59b6c6cdad126e04b0cf50e393ff858a1da719096  psygnal-0.15.1.tar.gz
+md5  3d91dd25a636441ee2aa6d8b703582cb  psygnal-0.16.1.tar.gz
+sha256  8e30df5e8f2a927191afacd22653924ba5ec54ca00f965f4af3ed38e37b727a9  psygnal-0.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  50169b145e35e6ae11a1e05cebdaa7052a58a8a2325dd5c394f8a68199c78415  LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
index e68497fbcb..74c3918e84 100644
--- a/package/python-psygnal/python-psygnal.mk
+++ b/package/python-psygnal/python-psygnal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYGNAL_VERSION = 0.15.1
+PYTHON_PSYGNAL_VERSION = 0.16.1
 PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
-PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/4e/79/20c3e23e75272e9ddf018097cf872ab088bccba978888472656629efa4a3
+PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/75/df/2a94607af05d91638646339acfc02d7c865821c21356ddcfef3d6b4c7fb6
 PYTHON_PSYGNAL_SETUP_TYPE = hatch
 PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
 PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
