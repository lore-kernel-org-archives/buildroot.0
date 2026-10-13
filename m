Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB4CCC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D0580C72;
	Tue, 13 Oct 2026 20:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkGbwraAuAJP; Tue, 13 Oct 2026 20:52:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED05580C3B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924762;
	b=aBqyfIOuAbu0//GlrsLKsJuvlLxjW24ZME6PcC05Eq6KTPjp0M8kwc3zwgBONEgMjtMa
	 a/gyNlmiHZRL4Q9PdYcgrXkJD5WdFxkn7VcFCbX+fttdXVUikh0toPEFyw8kxtkOhO8Y8
	 iejweLSDnIYBWVf0g2ZxZxW7n+pKFaYUokigP6kED3sYhR4su4QmPHY7dIpfYjCsoTQbY
	 2SblQh+b9ISyJEp1jeyszNBagu0+2Bt+cBofiwbfoCFOHlvOwy7UuAfs6PBJ9mFyyT7Z+
	 cnnXYjk7Or/wI1+tzUwQk2U+4H3t9x2tOlTjPWo/px41Tq5Oxw9MiWgmbRPRGKRPzYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924762;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mUouPd89JY4GR8yX7tvkIsgojUHBZ0xIyFCbxSbmX8I=;
	b=RlWvtrw5FeK2OgzqZjWRWF/L6+Iy9JnevAHjUzLPX+jMQ4Uv5qQqP0Wb0K6usVrNSfEV
	 7GXKTHzTqclwOfBoMNm+MIxihcSZEgBQOPx9uU4nO+xdeas4UyGJFDqrwk3qD6yLZprwE
	 Et3w1DEkF47Zpm6HCEA1HELh8mGBl/ltyJ8cRK9BlWl4hiIjVb/hfasWOhWKmOn1CCsgQ
	 5SDQPHGXIdtUY/Etl50ttWiK0IljwDHDyYdgUg0AOnrLxLScKb7ncAxOOrsb9SH67yRjJ
	 cw1N/mFlu8/CvhbJcDPqQ87fTppfdbqPyF8ck6zJExwYp9Ew10UKZEqb76bolicCPFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924762;
	bh=mUouPd89JY4GR8yX7tvkIsgojUHBZ0xIyFCbxSbmX8I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MpfhQDsJpkQM8l8nebs3KGzGrViSsaHS4o1mw42TbRxxbz0wFqIHfTFHGAVC+SQSi
	 wggyqx9K6/QEzwW0/5TeK2RR/7p5Wz5sj0fKA3NzNdGFwVuDW0XUDMaxqk9frWudSl
	 p4c50eFJLMwzPbfplMLFweK+yaFR2f1m6aaCRQv4KhGu3ZOjHPX4hPWxSKKTK63Hy8
	 mmObbtRKxbZ6Gu64Z1O82d1QSLCoR9b2CISFFHKcLE/RxyYIp366ooGuEiQcD3lNHa
	 cjNGmCE82PRQ/hGk7B2ZNcWnGY99YIpT4ylGsu3OSU6ciavRGk8wz/kEEvNOU9ML8V
	 S4yVFfqCQc7sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED05580C3B;
	Tue, 13 Oct 2026 20:52:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C48F2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BF5C60705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPymOxB-WYde for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0666607BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=bwyMkWWR+OAkhtMAkAgzZt+6mlmia5NsMqBTe/vxzZDx9TB/ssp2LQhvMDhKqTsLtXn8
 S7QCm01eckBp3KNfRtdyIPcG+1jNUVxbJCHVgXD3D9XgtPiYIDgHBKiLoi10dMNXtEHFk
 MwT2mfGO1hHW2Nw8hxjt3BkydRH852B/ocJjSvDUmmBNBXLVo1PYCFyz1sX009wHeLVpu
 R4HsOrPxluPXIXnFfyfmUb1b3kFZyd1xZwTRVR2CT1rSjXHafY9rAHB0xOz13BhhQAmxo
 NPZNcgE4CrxC1ZsSmtwHq0fjpqaqlTPIGsXYhVsaA8XhCGTfcdq88ORAvksryNN+8Tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=whnk53BHMTBiqq9K1BaM+64f+z7Ix2HkqSmAegYwWgo=;
 b=Tl33F6eACB006Qfy4xyNPHmZkC61jRnT9Di2FgPWPwLgYMzLli5EqErQCrja1DFMH7Ev
 4yCj71+HdctuJYDrAxzv3gvUMNWx8knDXmFgz355D/GxhBkBmOfZY1NacD5gktcuB4WlX
 rZpws+AsEWTnroPzlbLAhFLHuiCNmrljXSEp7dIffZGxVEzAibmkau05Y9d1mt/c91WCu
 UHSDum/ijcVUXje6wOAG7VGvkSVoJkPl83dqg39JJ2Fq7sA+kPcVnEw+mYAKF2wwOaAka
 Ri/yFozZMLbMmchkFZKtk6KOgKstbPfadRguntDDpiKsDapYiV4I6cwGGJn99TCMDLA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0666607BA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 168AA9550E; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2045e55fac6e401dfe64956d5feeff82c21de3b9
X-Git-Newrev: d6344b3992595059b77a28ae7d143df11749682c
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.168AA9550E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump to
 version 2.42.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6344b3992595059b77a28ae7d143df11749682c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index c99105cd6d..d546dbae68 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  96fb3d02ea327ff1051fe3a7a212b9f1  google_api_core-2.40.0.tar.gz
-sha256  ebee7d1b138b5362beecec260e6e8988ac97346562c7382ccb6f0ad8435c599f  google_api_core-2.40.0.tar.gz
+md5  d24f5de1ee29fe538f3b042188f7a51c  google_api_core-2.42.0.tar.gz
+sha256  82cf5daa2ef1b456d4e29ff1de1a5c2995c7be3ccf4fc608184326e03390c1ee  google_api_core-2.42.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 0da2f694f3..55371ab811 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.40.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.42.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/23/f7/0fb8c3618c783ad49da1aaf97f93a4bb9e4ed522135516b44d129a7f85bb
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/ac/aa/2aa84799e6920216f8aa2866d3b43daa20f7060dcb6efc8f0449e8be0ab0
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
