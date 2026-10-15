Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEF1CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24791611D4;
	Fri, 16 Oct 2026 13:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 15lfd4dJbFAf; Fri, 16 Oct 2026 13:12:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 13676611E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156328;
	b=jrW/D66DBrI/+YEfoLeNN9WcWTleLysis1gVUE8Cb+B8lnvuKP5A6eN68NtOT49JF9se
	 YBi0pJUOyhmeOXFlW9T9aeocOhfBFJZcks3qiaR+JU2lJjbajNjTasL0rE1gHSDv64M42
	 NTGnf0ALKNMU+gZbeBA5+pkXVhiFW6duKOE16aoQq7w06D1S64LLWRMrbzfJRpOeg3PBW
	 EkW2KTb1ZlB9XtRM70Rlunb4YFwoLxxRB35vt+j2iR9ilFMfdhf+p5a9KPhFNVq37GuZP
	 hbYbAzGZ/RRAv15s6m0DiLMNCeIPthAoe8ldYwLa/vZ2KQYtjlF8H8ujrkDOkpHNaQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156328;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9TGa9SXZ9tcstyGhvdXwtY5QaqeW1FFeikSirzKg2ho=;
	b=lEeDMK6RcJ2HdOo4243mh3yLD6okeaui3J3F3nWabuIP0bzmOVnNotTrsXocTFGPlYFJ
	 M/8BQ6sYzuLt/dCo6KRdoarRyICHIAq7K8dTZk0ilrqoWGf9TPJyQvnmNpSG/FAM1In0P
	 YSU2asNFKDRmkgRj0y1JOaQ2ASEWBnNR/nd0aE/Pe/0Mi3B9JSbzWYsPRyJpJoqyk88Ms
	 PPb4dP1Qy6zEqI4CCyJa4NSCGC1gpH6fwXHIPDWe/yGDBosA749TTSVssgktdUjdLzBC5
	 rWYStE4UqCll9YWOJKHnlbJHL1qfkHaa1nHtkfJQhaVdsvrVEFLMSZ5GqzITppgfMrA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156328;
	bh=9TGa9SXZ9tcstyGhvdXwtY5QaqeW1FFeikSirzKg2ho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ipMc9rHlCbsgD90a8zXqMUw30xxZZCviR4JqNccIth9EKZdgf3C+T52fN5owKkw21
	 wYyDDJQUymmtKzQPMZMWKXobE2h7J2zMNghsm8LxYcO6bsIHgUOvOLZKb3JQossIyU
	 vYIDUpekKmL+bPtOOVc56Ylrbv/mBO+WuhJOIqHFgp7Xf4k0oaUYZGIlSCrSRBlxCp
	 npPzbcP0W0yTeaHYS5HVqm4DsNPNkSHaS3Bhg5vluM1jacicMkZkkSj4D3Mg4FrWu0
	 Ywu1pkA5OIwG1zUilg13PbALEIYF7J1tARydPUFSoosx7Sfx4icCzVddvz+Ws0cSeJ
	 4Q99gR6T1cUXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13676611E7;
	Fri, 16 Oct 2026 13:12:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC6F0769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D16DC60B2B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7-wQWwTlzsN for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D599E60ED4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156190;
 b=Uku++pgUUo2Kg811yHn1dQj0IRgSKjI20tz6CIc6XELx0zIwKmhhL4i0zp5hYmQXfafH
 8qtQ66TrKUzLPBrAnayLs8hkGPMaitKzN7ogNnL85XkwH3NURKykLX003UrGXE7sHinK1
 YPpBKRJZqTJVufo3ZNca/1vrWOhXPLyx+PDGsttJdStn7TaUKg1udwqH33CJmcYmmAjWY
 pu085mAZ+vd2CFv+qCNve6v0+6xZ6yKx1F2zFx5bdVXaHQiDReKwFUF2xNW3KpxfF27PQ
 kBthbd8YIfdNgGxTg32iJNNI3HGaveYlM3dp47BS90OIVdSlnpvcxyJUDi+Q7aSAykg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156190;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VnhByMqXARUcOqPlqhc1M29wigFXxw8uGLppVSTFKVI=;
 b=JRZfKiI7EzvcUaCB4chnr0KdpmzcePZPd40/X9uRVJF2yAEIpxhA8KqiwPK+v032souw
 ZnFYJsz5SaC9cT2PYw8VYIbT98FJjSs/qnBgb8EisGg5xenDvySxz2N22Yh9LOfvOcnLR
 Nlp1J53qsVSRyuAhp+ulSEtnSPrTp7BjSDM+6PlnMgaLnv6Ol6vR0NAKcLVaObpl+uwwh
 L+gUnRZsRcJN8a3GPpKlAhjP286GtVkRuxwnjGxjt3xw3i+X8NO2z8WEZx+gCNb0o4Xnv
 aqzTd5qmg5f1SLnY5PYfA8OOn1XLEa2UenCLy+zRE0AhbB8k4iwTfLvC8cNVQe3TGHQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D599E60ED4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9C0D960D7; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:17:38 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 78a14e155a93bcde0392c05ea59fb5e2bda6662c
X-Git-Newrev: e2071312ca2d8ff15241af7eefb327abbb408cc4
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.B9C0D960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libarchive: drop
 dependency on host-pkgconf
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8116223708501575610=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8116223708501575610==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2071312ca2d8ff15241af7eefb327abbb408cc4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit 95db5707dff571c7f3485b3aa63bf5977c7bf08d bumped libarchive to
version 3.8.1, and as part of this, dropped AUTORECONF = YES. This
allowed to drop the host-pkgconf dependency, which was only needed due
to AUTORECONF = YES. However, the host-pkgconf dependency removal was
only done for the target variant of libarchive, and not for the host
variant.

This commit aligns the host variant with the target variant from that
perspective.

This is not tagged as a fix, as nothing was broken.

Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit ddaa55ead5a12866363f69c562806acf297322cd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libarchive/libarchive.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 5b6aea3407..88dbf2a48e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -146,8 +146,6 @@ endif
 
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
-# needed for autoreconf
-HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
 HOST_LIBARCHIVE_CONF_OPTS = \
 	--disable-bsdtar \
 	--disable-bsdcpio \

--===============8116223708501575610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8116223708501575610==--
