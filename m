Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE566CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A777E405AB;
	Tue,  6 Oct 2026 16:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqbxJXktZXGg; Tue,  6 Oct 2026 16:30:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2E72E406D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304258;
	b=RGDVNztdSiNE+ZuPcqnxJeMzWsqA9KGUAuPzMzsgIrLkKiIoGGvZPcPs1sUduZuoTXVi
	 eBFBzjKtJ3YT6qDdqYyY/DaHyoEogEcL2kh0HYpAv+4lkhNoz7HkLdseZUZBzCv1c67h7
	 YZpnb14SwLI4lKdS+2Lc6wyR29zj0SzJqVKogfyAhPOBDoPDBYZTzJW+9wIRtugJLktRg
	 i2GwY0m11MmX/rSVOxPV5ckNLtvHbVPKH1Ct9wOcn6dt8fhzO5Ol/qvJ338dI7DSL0ffP
	 oFrj9aZC54E6bwmHCuDVgdIOfaz7bVA3hsCX6uhzxGPnxSXwG5zswTHKF05xsXFAZ2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zwQRU8xb1MG6XRN80wTE85MVerq/mPrMyAaKADrSNMY=;
	b=OePnvuDZ+RacBDYc6Per/kI/w35ikG1knjUWayaYTKYHs5MNsnj0baUSx2mV3xZhM61E
	 04qg7l/pBeJNxOUY/HCI2+uDR+512zGF1gDZeDd1bHsTksSKGtPfI8cwGOUGu+y/CJw+j
	 wpS96dSBOpe+Na3X3Zl3H9OObNlvC5Qd4uaKdlPtRoUjRqrHZ6ACsGOw49YiUyWzPWqaK
	 +mSx7PP4AFqCMIWlYAmXwi/t53CEkMFWaTK0sx+t8vYfHgSfTtGHTfEtVTGKhhC6xH0zA
	 dCYAJALqt156wO78QbasxTKWDk+tKkKkz1NqVlQxD5XOfBLroQl6jOcvRBOKx6Hhemw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304258;
	bh=zwQRU8xb1MG6XRN80wTE85MVerq/mPrMyAaKADrSNMY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mol9KXDMuBCguvaLeoAYysa1WIOI/ZlBKyFwUETfd3cMI+0PqBlP/n3kzkPcfN02T
	 y6JsIPIQvX41aT9KTzSlwhJxr8k83c7Eik+EkE8mZjn3m5r8ZVD/Vb8BK8AdWzkPRe
	 6Ahq2l+iYLqgn/iqgbeuLh7IHOXyQYsN8sTtd9IbN0KIhzSPGCYCSgSSDAQwv/Qa+5
	 pCKyJze3arPGFijdZtwpzNIxESE/99U4ixfix/IkhUW6cqAAWnFQ+8MSDJtvWfIrbl
	 L4WmIBzgaFjdE9CdXFEXeancjwr7ktKx8h5e1Qg2UDO1XB2mkujSFYKh4dfPnwoZUZ
	 KkPWZt5yIureA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E72E406D7;
	Tue,  6 Oct 2026 16:30:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F8D341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F0940274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7OmrD-vNeqb for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 790B54009F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304046;
 b=AKjDGdi0Gw74Ank/p+6T+gTamFCnmAe6/dB5g7Grn5IuHOY7u3/eEtzFJGkuUgnl7mHd
 B7zL2+SjHuME9kdJsfo2ODOvNXu5YA3iMzxF1M0N99OcIJvLdKVgn8KENWnnA7AYX5xpk
 tUaLzGDO1UZMoXREPOTDx/6+dpXgO+0igVUGkdqF8fgXHIBxNBlZQ3U2OfyBEYohl2lnH
 6PTjOoPAACnjwud5sEXevtkxXmY9Q1OHhVFKFk3TB2A0xRUn1C71QHN2TwJjWv7lgkSM+
 9Vqwr0y4EJx4qwCklTeFQMtsU+1Le8F3BN23ZZUZklOxzn8jnUs9VXHfLtLQOJmFz4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304046;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5+2ETS7ITeS4aOt0axM5v8SKeLc/8Mo+qMcToccSCPc=;
 b=UR3Psse0wgSu2KdlXIG8tlvoNY3wxALevJIQBcFqgcLuK2pKLUyNQuURFYE11HZ4O957
 Lp7yUlFG+vTHaFvMl2/RlnKp3Y9O423NkrrRdZPWeMS18YFG73zs2mF8urh6/+3O4BxDN
 knzyZFcCXP9LGiRe2pySoJP1Say+1qQwfEpn3BF97CwrsTIXrTwyxeRiPUfp7AwBbsLhD
 ChH4tNOW432DucpAjNodJmdzG6QIJT7418YUPVUtzvgIXqfEhjEBR0/PoiMKaYUpSlodM
 7MQoFAp/kk/kkqpk2P/TqZH85eBMQZohT+6ev3en1a4Dj7VlAyYav1rTkztCfgr0fLw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hrVOhDLc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hrVOhDLc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 790B54009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=5+2ETS7ITeS4aOt0axM5v8SKeLc/8Mo+qMcToccSCPc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hrVOhDLc3+jhw+910Tg7IZZReaijHB90J80tRe7dXixVPY+PCat7XUFZDM17cRiox
 OJdeYVgSrjKhNJu1XNAmPCjLH/VYJ6PnEL6lRWyyrNV6R9IAsuSu99Ma0L/kyKz+M9
 l7Rq7JV+2xrqgJN8RvMnLAi9tgBuv4mgcRM8xYdGrzd1vVR3pj/VziEiTib2q2uXzO
 W//XDdEdLOc9kX+pwMqI1DpnOXNyzlpJiS5BzSgRAUyeZdvWoeek2Gj7nJQtoOwUuM
 j5c7LBMrMlYl3KctN+zT/gxBVUilWUm6zE2EXBv389PBGviMxJnGLRIPJrOar5H2Eu
 39xTaTY5baAwg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 QYGGdH8nGApQsDLCCsKn+87q0uoCR0ox7MOjbb3TsNcEHU2H9KxqhHp2c6st9uKISPjkO/m85Hp
 sRJ/wXjab1bSYOZeQktEiFyZPp83va+PxKL50jJkxNHuFI5/h4q8KVGMM2AOj0/cWgjl3ZInIFy
 nI8GcPwCHhzOKBH7lIdbEnOkelP3tDmgVs4//HtZ7mZMuHmT1Tde9SkrcOuOFdrtWuU2QiRBNmm
 Go6MWSkp2fDSUnp8f7dJWO/xcY0yZn8FQUb47rmokTK9JOi7uUU1fcad7HiiZ/4ZDcOa9x3iTON
 46M2CxU+va1FJ34i1KWcqbEFOIvrxIxc5ZuOvPVN8byCKY01nM/lI2zViGEhX+vyT90qCGLAmEY
 DazbTpK9hvh+j/yiU5IHpQLTc1i321+5TnV8okVD4dAd3Sd/tOYLQ67oSXzgw2OkmNUljON0lWW
 +rkozFgl1evWHbk3aYf0lTUz8103XiOZXLDrf4SFxDfKz9F0drHO7vsMgfip1GKGZfPvPw2RRp8
 zs+4MoRtYyGEWnH5vfYrH/Nk48zBqvT5VBRUwaQzMrK5rM8maKlN9tYw8H9RsVL4pLI6Rm1mfUE
 an08FE0=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DB1BA4C52EC
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ut-000000000ir-0ozZ
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:21:01 +0200
Message-ID: <20261006162106.3439373-81-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 80/84] package/kodi-screensaver-rsxs: bump
 version to 22.0.5-Piers
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

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-CMake-4.x.patch       | 346 ------------------
 .../kodi-screensaver-rsxs.hash                |   2 +-
 .../kodi-screensaver-rsxs.mk                  |   2 +-
 3 files changed, 2 insertions(+), 348 deletions(-)
 delete mode 100644 package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch

diff --git a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch b/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
deleted file mode 100644
index e9f80a98c4..0000000000
--- a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-From f6ad95576920944e64a368ae4074812efbcedc4b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Wed, 11 Mar 2026 21:58:40 +0100
-Subject: [PATCH] Fix build with CMake 4.x
-
-Fixes build errors with CMake 4.x:
-
-CMake Error at lib/Implicit/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-CMake Error at lib/Rgbhsl/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-CMake Error at lib/rsMath/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-Raise minimum version for all addons.
-
-Upstream: https://github.com/xbmc/screensavers.rsxs/commit/0635422964b6797d693866483d16dff51bcf4b57
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt                    | 2 +-
- depends/common/bz2/CMakeLists.txt | 2 +-
- lib/Implicit/CMakeLists.txt       | 2 +-
- lib/Rgbhsl/CMakeLists.txt         | 2 +-
- lib/kodi/gui/gl/CMakeLists.txt    | 2 +-
- lib/rsMath/CMakeLists.txt         | 2 +-
- src/biof/CMakeLists.txt           | 2 +-
- src/busyspheres/CMakeLists.txt    | 2 +-
- src/colorfire/CMakeLists.txt      | 2 +-
- src/cyclone/CMakeLists.txt        | 2 +-
- src/drempels/CMakeLists.txt       | 2 +-
- src/euphoria/CMakeLists.txt       | 2 +-
- src/feedback/CMakeLists.txt       | 2 +-
- src/fieldlines/CMakeLists.txt     | 2 +-
- src/flocks/CMakeLists.txt         | 2 +-
- src/flux/CMakeLists.txt           | 2 +-
- src/helios/CMakeLists.txt         | 2 +-
- src/hufosmoke/CMakeLists.txt      | 2 +-
- src/hufotunnel/CMakeLists.txt     | 2 +-
- src/hyperspace/CMakeLists.txt     | 2 +-
- src/lattice/CMakeLists.txt        | 2 +-
- src/lorenz/CMakeLists.txt         | 2 +-
- src/matrixview/CMakeLists.txt     | 2 +-
- src/microcosm/CMakeLists.txt      | 2 +-
- src/plasma/CMakeLists.txt         | 2 +-
- src/skyrocket/CMakeLists.txt      | 2 +-
- src/solarwinds/CMakeLists.txt     | 2 +-
- src/spirographx/CMakeLists.txt    | 2 +-
- src/sundancer2/CMakeLists.txt     | 2 +-
- 29 files changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e93c31bc..1a9ca89c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensavers.rsxs)
- 
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
-diff --git a/depends/common/bz2/CMakeLists.txt b/depends/common/bz2/CMakeLists.txt
-index 6b1a0a56..b83f34dd 100644
---- a/depends/common/bz2/CMakeLists.txt
-+++ b/depends/common/bz2/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(bzip2)
- 
- if(NOT WIN32)
-diff --git a/lib/Implicit/CMakeLists.txt b/lib/Implicit/CMakeLists.txt
-index eef20e3b..14fb63d7 100644
---- a/lib/Implicit/CMakeLists.txt
-+++ b/lib/Implicit/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(Implicit)
- 
-diff --git a/lib/Rgbhsl/CMakeLists.txt b/lib/Rgbhsl/CMakeLists.txt
-index 984ce9ba..ca01c592 100644
---- a/lib/Rgbhsl/CMakeLists.txt
-+++ b/lib/Rgbhsl/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(Rgbhsl)
- 
-diff --git a/lib/kodi/gui/gl/CMakeLists.txt b/lib/kodi/gui/gl/CMakeLists.txt
-index 6fc4d87b..1b096d79 100644
---- a/lib/kodi/gui/gl/CMakeLists.txt
-+++ b/lib/kodi/gui/gl/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(kodiOpenGL)
- 
-diff --git a/lib/rsMath/CMakeLists.txt b/lib/rsMath/CMakeLists.txt
-index cc31d308..76100e89 100644
---- a/lib/rsMath/CMakeLists.txt
-+++ b/lib/rsMath/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(rsMath)
- 
-diff --git a/src/biof/CMakeLists.txt b/src/biof/CMakeLists.txt
-index 810bec46..ec344ba8 100644
---- a/src/biof/CMakeLists.txt
-+++ b/src/biof/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.biof)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/busyspheres/CMakeLists.txt b/src/busyspheres/CMakeLists.txt
-index 41650ca6..cc829bd9 100644
---- a/src/busyspheres/CMakeLists.txt
-+++ b/src/busyspheres/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.busyspheres)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/colorfire/CMakeLists.txt b/src/colorfire/CMakeLists.txt
-index 3667cbd4..f8da4884 100644
---- a/src/colorfire/CMakeLists.txt
-+++ b/src/colorfire/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.colorfire)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/cyclone/CMakeLists.txt b/src/cyclone/CMakeLists.txt
-index 8af4172f..084f928b 100644
---- a/src/cyclone/CMakeLists.txt
-+++ b/src/cyclone/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.cyclone)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/drempels/CMakeLists.txt b/src/drempels/CMakeLists.txt
-index 1ebd427f..d4c38a95 100644
---- a/src/drempels/CMakeLists.txt
-+++ b/src/drempels/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.drempels)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/euphoria/CMakeLists.txt b/src/euphoria/CMakeLists.txt
-index d3f55ee3..de2e2f67 100644
---- a/src/euphoria/CMakeLists.txt
-+++ b/src/euphoria/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.euphoria)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/feedback/CMakeLists.txt b/src/feedback/CMakeLists.txt
-index b37c430a..fd417d61 100644
---- a/src/feedback/CMakeLists.txt
-+++ b/src/feedback/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.feedback)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/fieldlines/CMakeLists.txt b/src/fieldlines/CMakeLists.txt
-index de60dda8..b0dc30b6 100644
---- a/src/fieldlines/CMakeLists.txt
-+++ b/src/fieldlines/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.fieldlines)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/flocks/CMakeLists.txt b/src/flocks/CMakeLists.txt
-index c2b4a793..a15db4d8 100644
---- a/src/flocks/CMakeLists.txt
-+++ b/src/flocks/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.flocks)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/flux/CMakeLists.txt b/src/flux/CMakeLists.txt
-index a2de0b2a..6aeda787 100644
---- a/src/flux/CMakeLists.txt
-+++ b/src/flux/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.flux)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/helios/CMakeLists.txt b/src/helios/CMakeLists.txt
-index d64a6194..6feb0ac2 100644
---- a/src/helios/CMakeLists.txt
-+++ b/src/helios/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.helios)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hufosmoke/CMakeLists.txt b/src/hufosmoke/CMakeLists.txt
-index 44d13231..b4fe79a5 100644
---- a/src/hufosmoke/CMakeLists.txt
-+++ b/src/hufosmoke/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hufosmoke)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hufotunnel/CMakeLists.txt b/src/hufotunnel/CMakeLists.txt
-index b18ce736..f8c67c85 100644
---- a/src/hufotunnel/CMakeLists.txt
-+++ b/src/hufotunnel/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hufotunnel)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hyperspace/CMakeLists.txt b/src/hyperspace/CMakeLists.txt
-index 6bd303e2..5733be37 100644
---- a/src/hyperspace/CMakeLists.txt
-+++ b/src/hyperspace/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hyperspace)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/lattice/CMakeLists.txt b/src/lattice/CMakeLists.txt
-index ef884e4c..9f9455f4 100644
---- a/src/lattice/CMakeLists.txt
-+++ b/src/lattice/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.lattice)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/lorenz/CMakeLists.txt b/src/lorenz/CMakeLists.txt
-index ab3026f6..35f749d9 100644
---- a/src/lorenz/CMakeLists.txt
-+++ b/src/lorenz/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.lorenz)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/matrixview/CMakeLists.txt b/src/matrixview/CMakeLists.txt
-index d98a8f14..d5f77ec7 100644
---- a/src/matrixview/CMakeLists.txt
-+++ b/src/matrixview/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.matrixview)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/microcosm/CMakeLists.txt b/src/microcosm/CMakeLists.txt
-index d05b639d..65437c28 100644
---- a/src/microcosm/CMakeLists.txt
-+++ b/src/microcosm/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.microcosm)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/plasma/CMakeLists.txt b/src/plasma/CMakeLists.txt
-index e7fc7956..fd25963f 100644
---- a/src/plasma/CMakeLists.txt
-+++ b/src/plasma/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.plasma)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/skyrocket/CMakeLists.txt b/src/skyrocket/CMakeLists.txt
-index 8a89f28f..8e9e0500 100644
---- a/src/skyrocket/CMakeLists.txt
-+++ b/src/skyrocket/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.skyrocket)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/solarwinds/CMakeLists.txt b/src/solarwinds/CMakeLists.txt
-index f1ef41c7..2417edf0 100644
---- a/src/solarwinds/CMakeLists.txt
-+++ b/src/solarwinds/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.solarwinds)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/spirographx/CMakeLists.txt b/src/spirographx/CMakeLists.txt
-index 2ccb751d..41a245d4 100644
---- a/src/spirographx/CMakeLists.txt
-+++ b/src/spirographx/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.spirographx)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/sundancer2/CMakeLists.txt b/src/sundancer2/CMakeLists.txt
-index a0e47a6d..a3bfbbe9 100644
---- a/src/sundancer2/CMakeLists.txt
-+++ b/src/sundancer2/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.sundancer2)
- 
- message(STATUS "--------------------------------------------------------------------------------")
--- 
-2.47.3
-
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 86174991f0..b9378e1576 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76c1df60f3b4bf4c61f827e07ac61173e3b72defe6ab54d1a1fa34f1cd6f38ab  kodi-screensaver-rsxs-21.1.2-Omega.tar.gz
+sha256  4e44e6b6e804b81208c6d47f156e63e24d5af0e61fa46d5959c61e00ba2b36a8  kodi-screensaver-rsxs-22.0.7-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index dcca031b51..f04daed71c 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 21.1.2-Omega
+KODI_SCREENSAVER_RSXS_VERSION = 22.0.7-Piers
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
