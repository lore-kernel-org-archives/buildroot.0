Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C617ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA4DA606E8;
	Sat,  3 Oct 2026 15:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jjApBQy_f8u; Sat,  3 Oct 2026 15:55:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 97778606DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042943;
	b=BRRMe2K0gY8aqwxC4yh3bTcQhdkHpxQeaHn38k97cYCBahqCvydwSfLjwLAk1J5y7PhU
	 Wa/IT/UH2dmRzZdMhgjD+LYiNVlv5BEPKoZAR/En4cIdt6PQeI18A1awCAtJRcOzMvIpa
	 wB0h3qz2vHAXdFW3uH/R5H35xPFrWSsH/S/6sS+iynfiu4Szcbju7ffmkRcXfM8p8BnQR
	 Rc/asqNt1T0mXWNM61P0mefa/j0af05nTJXMGHNZ4ok98plYYfxsMxC54M0G45ZzC7/nL
	 8y3qvYXAEqPsC6DlelodwISX68Nel4Qs+DMpdmGPjHDyxz1YTw/AYDyTXfcqCzgEYzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yX73pKSn/dzJs6cT+FKoXtU+C24Ta5wjZT5k1wdwado=;
	b=ZmEhdxoz8MP6cP+wh9iEYaG6zvsLlGQJW/GwHbdh4i0Pkg3mGv/pTpoabYxvB/Vs4yiN
	 rOn6KsAIBPQQqeMQe8MRAQSV3ic0GYAqXeIeTuIl8VIOW6t9tXdjfAcCp5xKFN+qLWOOD
	 K1j8cwrbkc/BAyqorupe1E942F7LQ64ROO1WUMPuUhGDUr1fyy9sBoAou9ikUYh3oAtB0
	 XeQ5QhJtv0I/oU6iXK9W+++/5w9pQcRuV4KdLY+zfq5D8toxJcurlQWNY1YYY4bgQ2P+E
	 dvXyprc/SmAkdU1zfP8Y9gFXvSgSBdFquqCFwgm7yAqTDbiIQK5DP4M5bS6L+oxAeCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042943;
	bh=yX73pKSn/dzJs6cT+FKoXtU+C24Ta5wjZT5k1wdwado=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a+SrcHwBrJJwM94KPLZLiFmcjWpPyQqiq0uVBlLF8nm7+deUh4KDj1MlqmeYqHPaZ
	 /BzqqChCJq96DqiA4PI5jDCrS5ASLAq4hdsF75keeGbHSWV1sNxI1II95VI8FNP54e
	 QUVx2rMGlNVm61Fw7gv9Vc6BryArTexPK0NTClZ8yz9eOWNHx3v3deUHn4KdM31JRZ
	 N1qGwKKAgCE9l2EsHeIj/I8gwsY3DKpcn1ruDnWhS4q68OZwX2KZl92ahKxp8NIJDN
	 z+YDfSFirPVWaPnpIXQ8BfJeP6Omt5/ai+1OBUZlFEXmZDhCvyjWW+/xXeJkaV7rbT
	 grnlXIASnxnVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97778606DE;
	Sat,  3 Oct 2026 15:55:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99B17476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9795F40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiOb5sOt7l-i for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D9058400D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=DjOgsXoN3ZAElsNmur3VoKtPztASa1hdpBYa1FNfunCePbRvGIr4/HE1zMZfNgDaQtvk
 iBMyjrjMrrbFMSrJgSJD/fWtXEDiY1kDItUdtP3uLk+BjMCgZesLSfkW8uylEosMCqnMs
 Vde5vqcNx4LmV/xob8HQsxrpmHDNxMHEd0mpVVMl2aMaH1AGrs3Ish2/s9/+DCeAuNQg1
 ApBjaWw/LHvQIIbqEEUjv7b+uVVyGlshtwrqy+gApRxp7WuP1o5O0pEr2qWeXVU/rSJOd
 XBsHgUJJyxQszl8PGVt94/5zPrO8HY65KgVynnpHsDD9SHxpteQONbFKtPWMpG/IOug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wLOpca7O10UhS6TWWAzkj8oCpPHdvx/hG1q2ZjXxSlc=;
 b=l4IBmclUozz2HOTXagR0a1Q5Syx6ohRcRUl7xq4zUXyMmJNF9qUKmzOCUukO9g35UY0I
 tURJngziQhIILHsEVlBBjfcjrX1HA5wgKVueBX0jbPlfVGM5wFFGnhwml2DaA4pAPFTeV
 o2bikMfQdw1E0NcinjpeAOWTuSbQnNlrSvy/6pqCx0/UgIycLCgy8ULKY0rSejlyiF1KG
 wzE1+vXtM7GKTU7V3Ry6TC9RZUBvgfmM9jAAejxLALdDqsSlRIssrNyPGRn9BVzZEahlw
 UXonuA4VPCAW4C6UkF4NEI7IaLr5o0HuS2yDnaUuyBZrIt+n9Np8g8CyvkFhNuVcDoA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9058400D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2689C8A574; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4f4aa6313042769f360c8345a5da1439fff4593
X-Git-Newrev: 8809a9459f746053520e6f73bb6d3f81e21c4181
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.2689C8A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-docker: bump version to
 7.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8809a9459f746053520e6f73bb6d3f81e21c4181
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-docker/python-docker.hash | 4 ++--
 package/python-docker/python-docker.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index c8f8e7501a..7585ff255a 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docker/json
-md5  04e92a7b6dc8b88dde3c7cca6850b277  docker-7.1.0.tar.gz
-sha256  ad8c70e6e3f8926cb8a92619b832b4ea5299e2831c14284663184e200546fa6c  docker-7.1.0.tar.gz
+md5  a6f97d4f81fc342dfaf9b4d3d5b154cc  docker-7.2.0.tar.gz
+sha256  cebb93773d334f778e023a7ee352a8d6e13ab1bd3b863a4d4a59dec897df43ac  docker-7.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index 582d9ee1d0..3d26f2ebfc 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_VERSION = 7.1.0
+PYTHON_DOCKER_VERSION = 7.2.0
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/91/9b/4a2ea29aeba62471211598dac5d96825bb49348fa07e906ea930394a83ce
+PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/88/7f/731ff914b0255d3d065f45fd4e626d4b8c95dbcbaada049f337a6ac16410
 PYTHON_DOCKER_SETUP_TYPE = hatch
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
