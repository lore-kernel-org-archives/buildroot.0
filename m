Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB2DC79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 15:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2CD280E09;
	Wed,  9 Sep 2026 15:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLUvMvspL5_R; Wed,  9 Sep 2026 15:03:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA39F80E0E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788966213;
	b=DKuvc8uGLDRFTI127pJRDcGm9og+VUNvM+9xvf4/zgDErGV+yL1WvLUcodGupC0dxQNZ
	 F+5ryd3XXsUn+gJQUvBdRZhmyJ4NbuxMkso2rUJuUw5xzr0JbvWGWeqG/gLzj5rwpOiCJ
	 wr8ziGcpiPvls01PurZiqx72Wb9en/hMXdLDL2X6QZHtjm+KptN8+zL0kQvOcoOQmDOcP
	 4bYwX05DL+SnSBUuJGe+fvMuJiqT3/96//OoLjHOFpmL+6OsQwjXlbFaLwxjmI4qUJvhz
	 NLbo/s4+dUFdP8HbK0CNxq57iDoOGAF/JNnXl2+3GotwGmtxbG6lubGC9N4+fugTXug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788966213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ak2agRvZSe23p2SJ6Bg311R6nDYYv2DRSQHTR82T4aw=;
	b=Scnagy1RUlXonnKZe1xexv3eA0fuKUyQfcnYKsXMTiGBUgX4CzFxZx1qesInZLs9NJJU
	 B+BHUYPVPbFv7t+d/sZ3v0sbcLm+vpdY+WIgEY7wlUXqrUeLIb7aVdoe5DJCDwkz3sPZj
	 DmoxLRn4H/U/ngNiC24RW8b4NlEK/79iIhBpE+jrdNCG7FYbVcfi6lBxHOnQvLV82uS5q
	 Wo3Jh04MawMp+3KAxZPyx7EF8qU9531ZVMPmNPg9UQuTmGGkBVT1nQpdQMOIoHF6Lrft6
	 8t824btKjgKH5WLmLXiuYgqeeP0FN9Qios8SlpQdgKGM6dpWOSeokyjRVFMtfFaDCuw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788966212;
	bh=ak2agRvZSe23p2SJ6Bg311R6nDYYv2DRSQHTR82T4aw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YA2l0nqmYol6HQWXpL0yeFX6i3wVPHC6VHjht9Q8QXeiqeVFiYVcSE0JR4IHjERNl
	 qKmMjDB/rDdmp4X15EKiyer38x/bU91FkGTEkP64qOHIz6Y6aWDTcbbGWfHzqGaKzo
	 e4er0ZiK79TJxIEuGn46ql9S9QVufeEPtHOfLAKTq2ZQdbu0CWTvZwUy3tgeqaeQAn
	 JcFctnA+YB1fh+cT1E0gspUzo7TvBCfqIcEOKfhGo/TvwTBo1lo2UzdXmmKpx+/KLs
	 XM5XGraQf1c6yb4cyxRHdwWMAnVE4AIxFaTNoxRRX4wk8Z89tQXwyL3eGjOqLeq6l1
	 KykxhpRYOwpEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA39F80E0E;
	Wed,  9 Sep 2026 15:03:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3090D432
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D083607B6
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvG7H0Evv95d for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 15:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D2380607C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788966208;
 b=PJWdgjWo73C+ylWYXZxSE4vgbKjE8TslsDRy4/qVvJJanaIOW2LzXfQOPMHe9HFB1Y+e
 PTxQbgwqUW8+D1bzraZFjUaHDUdlTBpoMfWdbWH8L+/1j45Ku7jhlAA/WbGRxh0FhBo+y
 2twqDJ1MYGPcBBDMKDm21dBKWFcYnt3lUYTTcD+MQmLDtuLVTKlriEYNinSnVWDuBlyGg
 b/+F8VTCovLyIQCnkJHTEjZoDGeOS2zfE92EJJbU4T9+EpMpISRLhrAXejqN+XtZwN8s/
 NSMk9sNIR1P18jr+4/rZdNU050CHHV5mjY9sKDxPA2By/j8l/OWiLJdyyEkxsgmaG5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788966208;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QsojKvgN9GgFhQwJFhNLiYrAN+UPufmMnammSBXgUj4=;
 b=WGRvLVyS9Rr8jB1NOWLXGuwm7qY5R8N/39aLNiwzjJYO6M/WkTs8YxuFT7Pf4IHoIq3D
 LK7R6dlhG1rkEdSzDGFm8JLUEAMsZEmlJgKf/RnR5aN/f3A4F+M3boKuEj22CDlT/uUck
 NFlBvYkdhVLggTAiA7iQ/Jntyjb4ZVOD0nzuF70B6clv/1hBY6OYZ0tY8zS3QnC2U2jYI
 7RVzr/PuProvxkX3Xmn2RamEpY6kQP6IN4OQBwm/ywWzGQgmg4rJWecjQZHswTSK8c1a7
 l5IOQbFY8zGAb5tJ7mgxxsLNp3dOYQoBzlDVQ8U+vjCbpiJ8VoyE76fbZMHZctebt5Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2380607C9
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:03:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCB94954D8; Wed,  9 Sep 2026 15:02:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 17:01:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ffcb1e181b5de9afa4efa76f2548f8adbc2a088
X-Git-Newrev: 6084d8bb7f83f76f094e9dd3e5b208f70864951b
X-Patchwork-Hint: ignore
Message-Id: <20260909150225.CCB94954D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6084d8bb7f83f76f094e9dd3e5b208f70864951b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.3.3
https://github.com/intel/media-driver/releases/tag/intel-media-26.3.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 0392a45a2a..3f4486aa0f 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb8351e2ac9c1007a6489f3ef53907a464bec5e4fb2a1030f5b2b8fad81cc01a  intel-media-26.3.1.tar.gz
+sha256  bbe4deb0d2f72e5c58adaf17f87b7a11bf639446d99bf4193a116d0588647a97  intel-media-26.3.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 4810bb6ebc..f1a6dde392 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.3.1
+INTEL_MEDIADRIVER_VERSION = 26.3.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
