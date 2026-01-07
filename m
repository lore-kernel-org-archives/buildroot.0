Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E1D0D16A
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E9480C4B;
	Wed,  7 Jan 2026 18:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lx6J_8S_0hp; Wed,  7 Jan 2026 18:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F6980D4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767811586;
	bh=xfA/rr0ekdOWbfh1xpoc8PRtO3+BO9YKQvPRI77RG6Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gIOy/fcun8xyG7KRFvx4y+nsoCQpWlaEmzC7nE25T8GUoc1IDw1tQfFw/fcgVS7h2
	 3xT+PiufJkJtsNfBr/yhcNs5wkeDx2+NeAxdtHlpWgy0h44rpKp0JNbLyBM323MeWM
	 QZ16z8RhjgAsBSYeZzG8z0dEVURKejfCkGS0by1KSBiri0NuLeGS68Ib7h1pT/5Clg
	 dXaw7Q3hR9muXNTZyQ69nZKjOIKSojhhQfooQHa6M1arsltkF5W8mRUCtwYA6m9PQX
	 KpDBfulrMp7fIzJKszMeXn0uCMTEIdoPNVXXVbv20V9WH5gJ/mxzE2gjrQaJ5kEQAe
	 h8YxQHvA9j7fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F6980D4B;
	Wed,  7 Jan 2026 18:46:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63475436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4977C80D4B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAVsidIuGkb8 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0B6980C4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B6980C4B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0B6980C4B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:46:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81284A4C35B0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 19:46:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42640)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdYY0-000000006Xx-0KHo
 for buildroot@buildroot.org; Wed, 07 Jan 2026 18:46:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  7 Jan 2026 19:46:20 +0100
Message-ID: <20260107184620.93518-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767811580;
 bh=MQp3184p4HxFOTTqfLfJ6oeOyotyR1PIGA6taZMbcrU=;
 h=From:To:Subject:Date:From;
 b=Yo1NyEs8GNUI+mgucA/CnZcnnwZ11moignZW1DOoipAzWSRC7MqVu4iHAiiKkmJSz
 gARA6K4BpfCpwA3mYr8NJocu2/FOBFKTX1pYpbMlIpoTO1OLhO7vuIN/6d6iWWjazQ
 7pthC4oWZcPfnTCuVRzbNuq6IqGuDJ8PMWwpurhkLiGCmsEZQ5RSpSnc8yQ9OFpYbL
 PNJoSeEKm97VQM5p7CmQCPa4F5EPPpVFyj+KTWksUrWgT9Wmr2VbjvPF8XoeeQZLJH
 Kv7ehk7Lh+CNjNLi28C0Dr23l/V2Xwt8JXWvriu2oy3G2PikKV+HQ/lqmw/ziSr9W8
 WN5m0CgggNmwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Yo1NyEs8
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: disable "Log
 repository revision and branch"
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

Buildroot commit 79adde0180e834f839c770caa14d5253544d9719 bumped the
package to 1.13.2 that includes upstream commit
https://github.com/resiprocate/resiprocate/commit/0f13a697072ccb257391c1b59834f0e883a144df
which added the computation of the git source tree hash, current code can
be found here:
https://github.com/resiprocate/resiprocate/blob/resiprocate-1.13.2/CMakeLists.txt#L54

This code causes a build error when neither the package source nor the
buildroot root directory contains .git/ as seen on the autobuilder:

 -- Found Git: /usr/bin/git (found version "2.43.0")
 fatal: not a git repository (or any of the parent directories): .git
 fatal: not a git repository (or any of the parent directories): .git

The package source does not contain .git/ due to usage of the github
helper to download a tarball instead of a git checkout.

If the buildroot tree was created by a git checkout the configure script
of resiprocate will pick-up the hash of the buildroot tree:

 $ grep RESIPROCATE_GIT_ID output/build/resiprocate-1.13.2/config.h
 #define RESIPROCATE_GIT_ID "15ac4a40d0f62730a67286269c4153d85043f1d1-dirty"

~/buildroot$ git describe --match="" --always --abbrev=40 --dirty
15ac4a40d0f62730a67286269c4153d85043f1d1-dirty

and no build error occurs. But using the hash of the buildroot tree makes
no sense and will create non-reproducable builds so we disable the
function "Log repository revision and branch".

Fixes:
https://autobuild.buildroot.net/results/0d6/0d66279c378d21a14d10b7cafaebbeceda3fd12b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/resiprocate/resiprocate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index ab8299302a..8e57bcfb6d 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -21,6 +21,7 @@ RESIPROCATE_CONF_OPTS += \
 	-DBUILD_REPRO=OFF \
 	-DBUILD_RETURN=OFF \
 	-DBUILD_TFM=OFF \
+	-DENABLE_LOG_REPOSITORY_DETAILS=OFF \
 	-DHAVE_CLOCK_GETTIME_MONOTONIC_EXITCODE=0
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
