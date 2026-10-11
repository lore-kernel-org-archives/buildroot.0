Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EF7CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1216340595;
	Sun, 11 Oct 2026 13:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BU4Mul1o2_Fi; Sun, 11 Oct 2026 13:09:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 326CD406D8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724168;
	b=ldtHU7ft8IXszF1vmeyhyNIU09YD/PlUVFUPJKVtMigtqRuDF/71twXWzSyJKRveTfKG
	 AJq3Y3atWUj/qtQGA8nHyPmjCTZLywvILscq3rB16NYVfLT1//dYSDZhWiWfdxKoq/i/K
	 PoqA9RcHW9aCCnde5DFmbv6TskXwl6YxLffUKEyBUmZ3fnE4gfdv39JyRLNQ0Bm8FD8FJ
	 wTGxqqP8Kd/LH61wHNfSNTocJBH6sSf8r8KGbFrxikcobW3itzLZNVf2AWI4+2KlMAaF/
	 1KJluJfL/fLx6NKnxBI5tU5eEgWFcnC+W4I+TRjrN6VdxoxW1GFltaOYgPU5UqNMDwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vq471Sp1KZ5m7PCBni7WpMNrTzKsZrLxF1MSnT4KCkE=;
	b=llGen/JCaHQricy7SKiOiDQK0w16YeMya7HfHiYm6trCAhlAZFrO1rO4dT+enIqV+yjD
	 zN93gouNMYrwz4yQ24p9bmA3uNqyvBkH1q3xLxWQ/GwMtE8K67ey62QD/kFeW06ngsmlG
	 pw7R74tevS8ajbrCKMHwpEEqR7oiPgKVQFLZs85qy7ucXqaQbiWk7zSkVpSkQRy6Rzogq
	 X2ryVQJQzdWA/9Xg1Do0e/yDAJkNtRX9S3LlrlOSMpH0x/R9BFgOe62HHVLiQ3UTJ4Quj
	 SXcprDlahilfM0jAzPMRzCcZW1FVeFIXmebxdc5f3n0UwXbxgCExtwh/NiFSUgM40vg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724168;
	bh=Vq471Sp1KZ5m7PCBni7WpMNrTzKsZrLxF1MSnT4KCkE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IaooWgfbdekaUEEwSGQ2fJwjuoln/lhXm4+hAp3JEwctAg6LyojkzIzhE14Ytif1n
	 Azz6Hl1XlOsX51iZTzK019+oKgbIysGQBQebIYOjTIMsgk7x1XdsO9vIKisX+3KNkK
	 FKSEBNuwZAdjrpk6VS/CMF7kGPeALPt1nkx3kF4HyOwcz9GN7DbXE/hLc579XCnc51
	 Lg0zuy5ahl9TWEPEv0qysGW03eNMZUAeJ2Gpa/pMnyzvACnNzwpQWtVLMb6lWN9bmx
	 78gBA4mFvf0DkmGTtWhyN7LNrbh0wsf73/S/bzJimVw9EPCYDGdEbf2Qw38fnt+BaS
	 6liwFHbYx4VXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326CD406D8;
	Sun, 11 Oct 2026 13:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C716D5E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42998400CC
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54HCMP7eb5gD for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 69FE1400D1
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724166;
 b=WSJvvNv2xAyUvNsSn7cv+t5kzVP9eJJvQMXvB6ulBVP8gTIZ7sPTRQKgWVaHIOCGC/Q8
 zr7tc1uwJVtKgKZjbc+fzoHUSlCoaX9PuEe6T0rENV1KU0Yv2mpynNHQrMLdFF4rAGrIF
 YRWP6146lDvxCKp+mCs0Ao2ZMBlMAq1mcewFmhqFSOp8inSs+2/CFhsgZd752KO0LlBoD
 5kNqjz1RV8SiqIq8dZZcavCVYqCqzHTeDdYyBttJF0YLNE6eSvwdfhjy9BvjZ9m3FjlHk
 NnrT8QEIWJqU0emAZ4RAssTCrMqJP/0H2NQ7za8GLVoqTaBbZPyfbXRy7M9dDQYq+KQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724166;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tGL5W8+oc0rH9OWSnDl0NPgBOotSh6RUubZxmRqLbfw=;
 b=gktVydVArDFsDUrmUD2T9/lFWgdDehafi2mo2ibJlDU3ac3jTyaRODQCiBbMa6YVlXZq
 khwLmnCQ+9CSevyl3TCruwEcFbSlsIugPjlLGePXQqtccA8Daf8ZYEsRqg50nMDF3Exgw
 fZX1wF4ULLyybvVN5wRsIBWfORHagniZ3pZkgl/n4u/0/+OArqe/GrYnLHLfVCgbhxVVx
 uJu3GCrabqa27s/o8Iq8Z8rdsbU2g6HovKJAGfCKyxjHUDBHi9xoAAnLA8CPkfbsa0DYR
 SnG/0A5SeGERzwQmZNyvy8dHCJqBXvxtulyxDEhsLxkpohGKGF1MC3G/6n4yaIaxvXQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Unt6dt3Z; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Unt6dt3Z
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69FE1400D1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723683;
 bh=tGL5W8+oc0rH9OWSnDl0NPgBOotSh6RUubZxmRqLbfw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Unt6dt3ZpfLR2xkey+e7zSKf2WV7bJNYsp5CyYTHS95o3JFwaK1aWea1llPFTHb9L
 Mr6fClZVjieHpZoPvzV3gM8f3lRFt+yTE5ePHgz8z3oVZ9oAbQWCzUAQgHA3YtMrJH
 TUx0TcFO3BVU0k4Z1it3SPu7e48j22QjfaHqTZytQdXxKsv6X3C/OpM3BXAX0MA1vn
 UUYkxd/4pcxlqUMNYVRuT1yPlfDrJrzNsme0HgcUsVFdeFKkRbPnifaeegh2n7YlpG
 GRIfAuwpx1oPp35J26nk2uxWNB7YU4u69Sysg2kjdJjYRq5y1nvAFn6/g/ktALV552
 ctTbGGEsh/Ksg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 2l7BmlV87AXb7qBMHY2wkJj6YNJtEf5Sc8gXPGn9vaOFoU6jhGTQnbgfk435rOPXQuHckW1mN/2
 p0ZCi9IqQ13YnCZkF+UDM8Cx4W6Qg/zB0flU1Ls+Di+p2G0b+hLOgThfh/FG7U7mnzD1I3b1hiL
 4+gpRnY/RkIR1or2sLKWGXeQW37u5x8tP6/RposT6bKrjT1tW7CoAGBn+NolfACNZVepYj2541U
 sFVQNM4H+odsGZ9q5lR6+GdOcCNCrWkYI0KUgMlHZprgOV1Kd5mC55oltEEsE9sRnbvvWDwRKy9
 c5eukUd2mJAwZKz9lhl8Jft9X/7jXFDqc5ohGI+5YICvL0Z5IdLKss+O8XldVMElx0tNCmNI56u
 LqjtqtCVN8Zq1Cwf/d9XTyi+PfYLrBk0f6UUZaW6AWi9IYDFEu50j2M+gqKKcS2OMCSveXfW5sN
 DyO9IRaVJw7j+0smOAs3HRLfFFEe7IIGDZjfoOupEYpUTeQSSuVnPVtAkQrz71zgocA14vQFfhu
 qR/uy1C35GPk3AtTpRrlIxKlm4eynZp+gStaBXBV3bFtmu1hr8tPAPKElZAdoL9s3QB6KFXYiws
 XbzPTUE=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 921C6A4C5896
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-2EwO
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:44 +0200
Message-ID: <20261011130058.3443432-40-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 39/52] package/kodi-peripheral-*: mass
 version bump to Piers
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 3be4eef39b..541507704c 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7392c30a9e49b0cd219cdca14f5b20ffce9f4a52c349c2cdf37cb603dd21f516  kodi-peripheral-joystick-21.1.23-Omega.tar.gz
+sha256  d4b2d2ed3276053d2da5f198fca248243a55d7b50730ca9e274d84636765e048  kodi-peripheral-joystick-22.0.11-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 698b918266..0625dba460 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.23-Omega
+KODI_PERIPHERAL_JOYSTICK_VERSION = 22.0.11-Piers
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 833905b9a3..2791ce3074 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f74b0493e0f17e297f271b0befd01406dcaae121305bc7cb9d0ece6200cc675  kodi-peripheral-xarcade-21.0.2-Omega.tar.gz
+sha256  ca391349b0184083ee76918ae37359f2df541597812476c4a18b0c5e0b3d62d1  kodi-peripheral-xarcade-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index a46c616323..0fda4dbdfa 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 21.0.2-Omega
+KODI_PERIPHERAL_XARCADE_VERSION = 22.0.3-Piers
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
