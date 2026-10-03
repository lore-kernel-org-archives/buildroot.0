Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A98CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E84816EF;
	Sat,  3 Oct 2026 13:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cV5Qg0BvjxLi; Sat,  3 Oct 2026 13:57:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E056381702
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035879;
	b=qWIvPSbjUjaXsDwtlsvOoKyVtPjS/kVipGfTIbofSkkjTJE5tfYfmpicUJXWeNp4sTGn
	 C4rDbGpwdYwB7yvtOIHt+TDNpFslMIU10/v8ei+o1EIes80f88uCzbX29+8JRZ1Avo9FW
	 gAUfwlqEH9DJSNoO/vos8owsSg4JRmDnphoCzo0AIdsheCKWfc34y7gRVBqgsWq9LwcN5
	 M7UJfYiDTh9UK/a8CC+UbSV4XoadBoK6OxZ5eF0X1757xEcqiD0NuPTNZiEqlMfoFMY78
	 2zOFJDEfKWEzTuzHvMj5qeb5xJTAooO1bfYotngzzAP5JJJ6IktvdVqia90JC6oD4FA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HcnxudOu26e1ku/69b8TGf0mJkUsfsWjpTzyD7ejJqQ=;
	b=YuqD1IGpL06abKjCqWWKHImZhIougoENundVLkr3mGn+sPpiPpd+2MfHkWxSQGhxhLaf
	 GrZEbnnwwybzUik2xVFVYy1sdxkj/zRy+sj3pbSVRX7I1g+9dMc0UlEjZWk2gNvO/AXqp
	 /duKYqt4FQAjkTt6IRmqMaYWyvZbP4Sx34JL3y+jE1/foDtTAx54yDM7kHzu1v/zcpG4Y
	 FHOBtkPLXUamo/QwbAaJ/g4BvQKJToHrLoNyHoitOHLmEJCuH3rA8066SgqzR0JW6YtmC
	 RCN6WPsFkCjtiQSQbGIy8D5tteBJSv4t40rCjKDMMcTbTyitzRcdwmdKQppRKcQAjUA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035879;
	bh=HcnxudOu26e1ku/69b8TGf0mJkUsfsWjpTzyD7ejJqQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g+ze0peFgJQNb3gfS0JAP4w+oxvcCa5Ids/tCZWUK1u8Soh/nS8GtX3Jts/q5HvUH
	 BTxOvy2SuhpCmP3BsBkXjxKIMDPSEWKEWxy47tQhTZzmtcMMQ9jI2uSFSGKrfS8AI/
	 B5FAnsIFs90PAtcxOgE2nfozuHjw43lPo8umJ1vpTc7WCwmImMufM3E2zhYbqkt3ON
	 6mPjrJf+tUXpRXNQkqA+5WOR5zSMRnhNUp2YlklHNn+7d5ihxuarqj7W2ZGJf0S8Qb
	 EKt3ZyGdIA3cd2QQ6h9E+HrKrpgInuTz/P0p+xplv+ZRDedakdtX+Wt+SdbMUL/iWV
	 380FzS37MPD3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E056381702;
	Sat,  3 Oct 2026 13:57:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B536B32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AD42414DC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id om1fMWWtgPdr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 12645414CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035817;
 b=nhlNJh3BP4+pFMoYMbmMLo5nqOPPrR97584yfPj3/b3pueyl7ERxc2hynclVdcD2KqDu
 tKzYAINwpm7A4yruKXr+O2B4t+xWKeowy+o0tg3QAz3qV6bhoHr5S6FuN1rU0c3gijy/+
 hQ7SJt43EPp+5LV7rUbePdN9QLG8HrlcDzSnJJY22VmEVeag9akY1Erj7VAg1NXbdGVIH
 RcqF//kfdQiWpgrG8ImzJFGii7jlJbZqF4BmNgeCYYSCFDweQ6tVHsPGj9wOnRKj+vWvR
 1dDxFNcO3qeEwqefftHV/HVbonV9g969hurxJZyar4JafRnq01cW4MfYvyULGLxPhjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035817;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=srJKLx5VgeFMoAAHJPY0NFp7blU9Zg8lvdomgdiXvuc=;
 b=eBtqlcXrGE5C3oWNR5U6GRg+2JzA4MyTJOMb99OAtGtxRCAeH/uPcMWem21F+mHHS7bC
 nKa/M9bfrYUzGRn73MRp6zIQV506IFrKUkQR8YsAcV5oVq0Rg/n9vOaG8CKvApoUIubUo
 E7ymim+3AcOZHP1h5MyGYT83a22Uow56T4LxvKTnlU9gRDAuepCcnxf/O2ApX8/29xCRG
 w+WjoEiXSp5slAqgbOO1BKHZV9rmF8puXjIOx5Z1jPPbbP8M9qoEbmevvy93crfgZrL5W
 G4SjYrfZDYgyP37RIo19xUe3Jy7lm4ejbmyWdTdg2ul66cgzmhIizHmDemaQqspu/HA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12645414CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D9CA87E10; Sat,  3 Oct 2026 13:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef9480086c372ac43ca74f5c142e322d2b1b4893
X-Git-Newrev: 9dc679ed9f7008340f8027169faa1b224c2bc4a2
X-Patchwork-Hint: ignore
Message-Id: <20261003135542.5D9CA87E10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiodns: bump to version
 4.0.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9dc679ed9f7008340f8027169faa1b224c2bc4a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Skip dependency checks to avoid requiring pycares on the host.
Setuptools reads the version statically without importing aiodns.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index 4cde1c4b1d..8230f2b6e6 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  c69a64f09c0999f63ed759f5046d5bb4  aiodns-4.0.0.tar.gz
-sha256  17be26a936ba788c849ba5fd20e0ba69d8c46e6273e846eb5430eae2630ce5b1  aiodns-4.0.0.tar.gz
+md5  7ae651ddf081635d3b83bf4366947850  aiodns-4.0.4.tar.gz
+sha256  cb10e0c0d2591636716ad2fe402e977c16d71bdaf76bb8cb49e8a6633596f736  aiodns-4.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 6befbff203..ea07ce72c7 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 4.0.0
+PYTHON_AIODNS_VERSION = 4.0.4
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/10/da/97235e953109936bfeda62c1f9f1a7c5652d4dc49f2b5911f9ae1043afa9
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/9b/22/a2d928e0e42baad0471d12ec44c71152ac870486e8298dddb2893b888c29
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
+PYTHON_AIODNS_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
