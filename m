Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674EDCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 304D881839;
	Sat,  3 Oct 2026 15:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSEQ3_f36g5i; Sat,  3 Oct 2026 15:57:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 455C181763
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043022;
	b=ohR0YukmZaKltJA1uN8hQ0mHUL79jEpXF4p29A7a8b2E8miLeOeHz3/uDhTpoASzw3y6
	 CZAOJKQQKr7WyJdCdAJj4dak/jdKjQ98QpvH+mt6Zhv5whw8ZO/GOW+rEnHrEX0Qshsj6
	 ab4F+7AhYW0F8ynfZorUX95xCttUKCJor9+UHD4FHeYaF6uFx83FyI4XTWCj0WKniCUdc
	 J5Y+h1sw2XTTYafjbRmGKrUMPf7vK/6vNF8hrzmTrZ6tiIroC+6bkcJmEW2JdYKNPtbbg
	 xp5CH5Rs47po0NIdlxKb6PPGro0OK2CsWW5PhxAQo5pXKE/AygVUmZAsSM36z3QHEnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043022;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/4yZebm5cLTKrcyJK1OHL2Bpjbe/DNfExWayI5J64TQ=;
	b=FadyuAbt5BTVJgNcY3gZFdxjC1Ct0z3fAhxk8kyMXWw6gtcp2GDICxqh1c7Fa3+OqtgJ
	 ptyVs/rk5QRHlbJA75rW6bJaZE6pvL8umUc+4HO7le7p4CMC9AFZItHLueOknnUXo0u5R
	 jDBcMLjel759bVRHPZwenS7XzoezTl4bNoE7DG9PEfYLJQpC1fbsupuPQQruvfLo/u5Gc
	 hNPhXrxQPbbYegSP4t4xVJ2kz7DkejeskBUEWa7ehHSC5Tb97cU396XaSQm+36ahd6iSl
	 /Rvfc0iQ1JdvwOyoNc8sOOH0Ytzuz69wUwsRVjwNN560StsyUdbQCTnZakj8VDVm7wA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043022;
	bh=/4yZebm5cLTKrcyJK1OHL2Bpjbe/DNfExWayI5J64TQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CKU29QgOFnv7DckMKLJrhD7ri+K3UCETDJl2f3NrAmXrifYKiXV9CvG7jVEj2ZK6w
	 bZG9GlEL1cyI7TjN9kkgHaRhE22/2i3cMRTJb6gtozD/BqxcPaVNNI+qgzE5enL1uS
	 MkolnE+LhPBR6RrS/XleVj0p5N8r15T4dI+1m8OTyBy7hSd940Hg0dTccUcLOchv7Y
	 cc2q37ePbKSYrgu5WDFyav2xlRej+ssmpX8ZpyE4iRYXf2Iqs8kvtHFS+e48Ax5mON
	 x2te4a1MsoxSew/xBfNklLEByOq7sObrwRQWGjeUtPCm43M/Izr4URqDeZhJUrfSdA
	 6By/FSlUEpWnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 455C181763;
	Sat,  3 Oct 2026 15:57:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 474BD1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DBB46067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6AYWpQB_Ucm for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BBA98606DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=JZcj39WMfg7HmZsInsmDwa181b+IrzgZFZP3AAh9safjjRZFEjiUMdfEczyUlW0xMxd8
 G3FP9Ok1tVIqfrIAvNkSp2U4CR+AASkufvbFrGZ26B9r2kHAKdO3Ddd8Kjwkt0hyMMxTP
 whLV0963G74FYyVZfWM/iT+DqGRndJuLBFn5XWCWMQwlwWeVjMx719TnmZcIFSOVOaYGM
 J7rRX4skN3yBJmUbphIPW5CFMAea76fg0E0pAwvby1NltSlfE3NW4Lbqrc0EJ2jQLyI5v
 hxbIsCo4PhmLAhzQc1dkyF+5fZRVagEyoc8Ol3DrQ7xT74Y3E0HlQf1D+ytYAZLh+1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Y79nEMb++Xa6TKeVomoycaIU5wyLJ4az53HsGlcGPH0=;
 b=R24wCa/d51Q6tmCvc2h4nRhSZ/xa8jh1oOgEmf0QM+a7AnAK1BP9QXHto9HajqA6NcFb
 OyKJG7pQQyVa0x2wBTapX01XqSfRGQpKd/PhVCgsODDImjiHp55L+VCDnz/gZq5PR+VKn
 dRgcqtRjs/tqxJDa2e3qE+zfHfkxchaYQuLyQEJO7c9JIDaw03N+ICyxf0XdEZvZt41Zm
 /Z3mjn7a5E7dMZ9cIlHAOq6RJ9vQw8lQ1s3Lf9Iz9FzChYgrBDx+yUxcSJDZ+FbJnyOVU
 7hQqf1dMuwaIxZ+reaICO9wXC1DEt74VzJ8b5loPqQA+BMhzPB0gdJWhZZMkkNKe3rw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBA98606DC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07D5E88806; Sat,  3 Oct 2026 15:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d53be7278bf4b35f67be1bcab9f08fb1ab284169
X-Git-Newrev: 059d2bce5e0eba5ef47395d8b4acb913ed019f9a
X-Patchwork-Hint: ignore
Message-Id: <20261003155254.07D5E88806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paramiko: bump version to
 5.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/059d2bce5e0eba5ef47395d8b4acb913ed019f9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 64e49fd90f..3815f5888e 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  86c64e731c55db62c0be2ddcb97e6be5  paramiko-4.0.0.tar.gz
-sha256  6a25f07b380cc9c9a88d2b920ad37167ac4667f8d9886ccebd8f90f654b5d69f  paramiko-4.0.0.tar.gz
+md5  5767a11ec78dc1da7cb9e99559aa0ab6  paramiko-5.0.0.tar.gz
+sha256  36763b5b95c2a0dcfdf1abc48e48156ee425b21efe2f0e787c2dd5a95c0e5e79  paramiko-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 6ad0fa0d1b..6f313ecf3a 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 4.0.0
+PYTHON_PARAMIKO_VERSION = 5.0.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/1f/e7/81fdcbc7f190cdb058cffc9431587eb289833bdd633e2002455ca9bb13d4
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/62/93/dcc25d52f49022ae6175d15e6bd751f1acc99b98bc61fc55e5155a7be2e7
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
