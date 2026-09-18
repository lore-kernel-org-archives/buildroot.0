Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8DEC982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D11260EE4;
	Fri, 18 Sep 2026 19:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9brkJxu73s9; Fri, 18 Sep 2026 19:54:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 66F2360EE8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761291;
	b=dTgegVryXIVnEV97jEBJFFyoqyY56mw+NhbpW7p66sAHrxvIS84fOnGo1x51v78QZ0o6
	 jp0IFVe/quhR45Sqn/YgLxCvjr8eb7unXS07CXGlotTdugh4Gb95tDFn+bZdhDgjVbeiS
	 RckjKkQr7hfABPS7MyK1AK1OudmgKdVrBcH4ls4DeXPmaHXV4I8FHR0vVWPnOO9GjYbjY
	 V5bjxldlrlPl4+ohvX6rghjHBc+AIvkPlD7usmy94ySnhU1Fj5xS+B8TLjXgL6R17D0Mn
	 jFY/57T3Gmk9xgpY+mK4PTK527141HgBRmGyW2gr5X4y5F/WisxMYZUIHHRhCcsEJOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761291;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4GWAq9RyTpDjsdj3X/EHBo6NjdLWeJcr7LYdv3x5ay8=;
	b=DuvK9vAjfx7nLwpMq6cJw3U+oP7GujG1a+8oArCuxg6SSiPJ78PDBPZ1dV43zE4w42NR
	 h74xTGYozq11J7aTYaT/w3QZaUX2UuAck/qIk7syOWw7MLqBMeyzdc3JnUtTAIfRhFR2f
	 aTAyNwji5ZpvsAR/4fuH3EgA/AqJjwDQ6UQWFf4/LSfAX5JEMWEQkxl97qihNc+lbsB1M
	 Wn0YxlhwbN9zUTZAq7Xpo7+IXIwQbZBd0q1YX0hUVEbQNnP4VdZYS11beyuEIDCWNnixd
	 ZJpS6qY5ZN0IPdqWlBwOVVBQHfNlS0O8auOO8EaCn3mWo/UefxOaGymAX9I6kU2oR1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761291;
	bh=4GWAq9RyTpDjsdj3X/EHBo6NjdLWeJcr7LYdv3x5ay8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K2PwTdW4YH9Y+EjtA8iLPlLJ7vbPfhxhGIfDp/rZJIpwWxMG+rzS9llGXfEn2DARp
	 jxaQ7lJD/Yge8i2a8OQK6batSfrhQ8L9+AhkAqAWZhqkXHYfbMC9M5bGOeCaiCmnaR
	 FaMD6cjAV4EBxx3EIX/zMMKcCRXheQoKPXfbyO4XhSxGxSMx4JxzSeTyJUsxtuhzRl
	 pjUXpXJ4Gg600RDiELCTozM9jMVhpHbPgpqQVpuVdYEvZJMmJcibQmTm8LtnSdnTQ8
	 FFqLxeIc+zBCwi2VylM2fZ1RzDb5kZhfuB0gg668P5Or9dmvrFJ4fkMDV08D8AOCfA
	 YsQ80c1b6ed5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66F2360EE8;
	Fri, 18 Sep 2026 19:54:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 688E125B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E9F060DC6
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fKtz7VhHl59 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9C8C660E9C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761281;
 b=MflQSW4VoFQLHQevkvVQvFGn55xYy5fpyPKpkThF1dLjIrHx6/AE4wTZx7nocmcq16S+
 NuVy1DQasZF40L4nzqbJnLvCXXMHPOpXn05Xf/ghfOFohEg8SvJ4h48yXtxhJKoVnVlPU
 X4qvzQNVXhb82f6JZHmR/ad1xsSSVZf58mqaR6QfYy6te7Xd/ujIhLX+ThcjOOHOXAhtj
 1bFWf5uszTYyTcmYNpYj6TzzufQpu2TMf/F1zhADdQbykoIr20uo5ZKewyJ7utcJzqib6
 zCVcwTHWgdlYFzYXLifFRRT1jIKk2bgu0HJBskCuFYskNPHZXwrWyuF8UJqjwUHb55w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761281;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Fiahzfn1aFblWKsQ1ZO3YyxyYgsblajsS6vVaB/4hIs=;
 b=BXw60ZStBpjq84SpPsSawXUWbPZ9nOP4qBgesAGbn96l7DLBTbHnta97NksVEQSHVQHc
 5bHl/L1XxdW+q/o0ULk5vQUM3J8AHVwOK3CqkjASCwmz7jjOyuinFXfEsXqxaLEZUr4w+
 uNPKkM5CE1O8LMrC6ETh6S2pUZ6N3t2FXP+pJ+afstdlAchWRSUefUSq8MaQE8UBRsLej
 BDnGzquU1jSkIXgAm3qtSWj1hRlH2sDdrkoqoaMc7jNkGnLyOoEvBmdHGrkGlEEXvrQfh
 0pt849B5zqKJ/fCtoHKVUYZyT0R6TV9lWv5cKc3F6mbmr+YX99RT/OTQvcOJUdB5oIg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C8C660E9C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:54:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3313E976A4; Fri, 18 Sep 2026 19:53:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:53:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d3fb5c061cb12b020b758806d95bc3f6e5c085d
X-Git-Newrev: f8a1acdb6c300b32c4b29a9b41e9cafbd1389962
X-Patchwork-Hint: ignore
Message-Id: <20260918195334.3313E976A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swig: bump version to 4.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8a1acdb6c300b32c4b29a9b41e9cafbd1389962
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.swig.org/Release/RELEASENOTES

Added upstream sha1 & sha256 hashes.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Fiona Klute <fiona.klute@gmx.de>  # libselinux
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swig/swig.hash | 4 +++-
 package/swig/swig.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 21590c422a..f3d4a1829e 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,5 +1,7 @@
+# From https://sourceforge.net/projects/swig/files/swig/swig-4.5.1
+sha1  fab5ee9e27b703ea964e55abca585567ebac9bcf  swig-4.5.1.tar.gz
+sha256  7fec50b27deddab5455a9633780b6341eddfb96215a7619e93a76eb27178f653  swig-4.5.1.tar.gz
 # Locally computed:
-sha256  2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b  swig-4.1.1.tar.gz
 sha256  f53abaeed775018d519a1b9615f0ca17894772bd9ca21c2a156bf340ac41c13e  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-GPL
 sha256  7f50d942373a871211c5efee03f3db2f9efd1cff1002b0ef8e3748baa611a5c2  LICENSE-UNIVERSITIES
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 71e5e05f96..e277f5049a 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 4.1
+SWIG_VERSION_MAJOR = 4.5
 SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
-SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
+SWIG_SITE = https://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison host-pcre2
 HOST_SWIG_CONF_OPTS = \
 	--with-pcre \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
