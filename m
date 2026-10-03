Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95DCA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C16361085;
	Sat,  3 Oct 2026 15:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CF7Ovb2LQJZq; Sat,  3 Oct 2026 15:57:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E57936107B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043035;
	b=hO62ZpXQCWpdN10RVCdITYmtJTumjrFvUQ32fdeMRWfmWNwNR2uwIzjyDUz4SikS2o0X
	 /YYKo690vcADpU3V2+037lJW6+8pML/YtyfwnpA9pMJ3akbLVkzQ8LuXGgkrxL8F1Y3Sg
	 M1oOhWYX4gpFm0OkUzQKpRb2HNL7VHu7ELt9UC98yVdATrxoE6Rob2TInO5Sr/ZsF+lPU
	 4j7QR72Zm7ZPZ6jtTpbgtv7abKIToPvE98zZkY8nOjDAthSgX0S2KowDMqXuLusQ2NDzD
	 cn0EnlmOEVXKGZUoLkWMqoO1wuzgvneHzqDMdlwZJu28rzSVUK8f8CU8AQLAc60UegQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t4JwVfxUHr47AqLXX5TN380WQUgk+x1cMqMClRmcoNQ=;
	b=ku53Tv1T4caBx6xWrMD9vlCyGlxpCZ0VOzH9kxEng8/b6ORd7W3YuwjU5xKlYhasZA3s
	 HTsAOcEnuFqUMHHRhBLWNrLGbpj5QpLTfrrm3cdbnDiQnPOr4GiXsaBYmquZGlzLiOfNJ
	 KHv+A+ipHauDCyQIN88aexAkDgccwMdXuw520wO/yEpDJgIbrc4hbiEAeyXz6IOM1EuAC
	 BLS9XvFK6e+0sVz3Fb3yCoqsYOMG1bvxGA+KdOfJQOVqtU0X9JKMBfWl5bLxaf5JrJWky
	 QHYhVWercOfykW9AmuyOYPSjoOpNdy3xbXJYDCf3EXlewmVq8wrve3X0ZCVb6jIiUlQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043035;
	bh=t4JwVfxUHr47AqLXX5TN380WQUgk+x1cMqMClRmcoNQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YrivLc7kYOSsqW+7XYOayqIQEUY3EXwMWZNDIKVgUfhpoMLrdVgDX1XZp97f6G+L+
	 Dl/i7t5etpZHRbflFhfP4kzQi6SFi2Guuuw0oCrjsnSbJi3aNJIEsL3kGm0Haq6Qvf
	 ket/doC1MTn/p01oRn9+xhADXGt00xmZIY9Gb33/BszyLRQ6HQFWuG9exHNuDl2PnT
	 dLHOTowJEzPdUNAJ3rnNZ13ya6q2XjWKBI+Hj0mLd9sVEQgKMkEYUP980jhQmky2by
	 R77GCXlT7Cvm3X6Xf5ARJ+IpKoIXcZZCGW85NRoyK23cm5+M0T12kXIzk259YFPZ04
	 1hr8z2tGMNK6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57936107B;
	Sat,  3 Oct 2026 15:57:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0A161D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A63356066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWGZn08IekYO for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF607606B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042849;
 b=sLzwqG/oVa9E9nt23P0p2hbvl1Ddrpd6inRpyXY9F7jIL6XAtyf3855buiv/htIqo2Py
 jT8taJ5AWytgZ2kAbkFqtW/4L6jHAiiIeKC+EQ3psbECbn9c4yqPVzq5ZTAqCq91geobG
 sn0TJu1vaGYRyB7/nNZGXG8fPWm9zua/ykiCDq3zzQVEumcyE/IddvBjdT3W9QJpKnzVC
 UQFuEsECxXpogBHy+ziDh+gZP5kGUsrJAejJoFHMKfFsb3QmthXXtPVp1ZygkDOPVHDTF
 67126G0IZqL73A1BpVhe1TOcTTgJ90z5gGXmTuzsAkOVpX6I+iF8qo6QxlOpwbMmh/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042849;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GM41zr88Ymfoyvh/HYpR8N9Wg6icxoU9VFgYEnkMH4U=;
 b=Px/+oZjOKdiSnB6/2RjAFOQrL8AXQE1nSVMIuLHokHNVWkAbs6Tg0vr3svvP9Wgm6wYr
 dFhgAhY3n/owvifXHnahHzGmVakDBvuwPkO+0vd5L8OtNh94No+I2xj2WmPh1zjmcHxwy
 ImX9acp0MYwZNc0QDbFqzoFmqXSUjX2jYC9DD2JbZW5vzp54r+4ULINZe8lnZTqYS0AKD
 rk6RFZL4wtcEEIcrs5bJUxNIYM0laM09fXbxQ2atn3ZzkCfXiNsBdhp0ufUqvwFVHstq0
 8VJq/g+JK3r34zdMU5E8oY8nRro5pexbFYEVtu6KeE3KRFEVOCp91Xs4I/aZtWpEBwA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF607606B6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A8B18A574; Sat,  3 Oct 2026 15:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:51:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df9f3836d8908dc09be7572ce8e30043848bafac
X-Git-Newrev: ba6811487c631aa30d1b293a6a831664d0c26484
X-Patchwork-Hint: ignore
Message-Id: <20261003155254.3A8B18A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlib: fix build with
 setuptools >= 82
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba6811487c631aa30d1b293a6a831664d0c26484
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...d-Migrate-from-pkg_resources-to-importlib.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/python-xlib/0001-build-Migrate-from-pkg_resources-to-importlib.patch b/package/python-xlib/0001-build-Migrate-from-pkg_resources-to-importlib.patch
new file mode 100644
index 0000000000..7a1fb294f7
--- /dev/null
+++ b/package/python-xlib/0001-build-Migrate-from-pkg_resources-to-importlib.patch
@@ -0,0 +1,42 @@
+From 52394387f94b798af3431cd16cc48b9f6ebcb53e Mon Sep 17 00:00:00 2001
+From: Evan Maddock <maddock.evan@vivaldi.net>
+Date: Mon, 8 Jun 2026 19:01:47 -0400
+Subject: [PATCH] build: Migrate from pkg_resources to importlib
+
+Setuptools 82 removed the `pkg_resources` module.
+The replacement is `importlib`. This fixes the use
+of the removed module.
+
+Signed-off-by: Evan Maddock <maddock.evan@vivaldi.net>
+
+Upstream: https://github.com/python-xlib/python-xlib/pull/290
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 71bdb08..6086f54 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,12 +1,13 @@
+ # Distutils script for python-xlib
+ 
+-from pkg_resources import parse_requirements
++from importlib.metadata import version
+ from setuptools import (__version__ as setuptools_version, setup)
+ 
+ 
+ # Check setuptools is recent enough to support `setup.cfg`.
+-setuptools_require = next(parse_requirements('setuptools>=30.3.0'))
+-assert setuptools_version in setuptools_require, '{} is required'.format(setuptools_require)
++installed_version = version('setuptools')
++setuptools_require = '30.3.0'
++assert setuptools_version >= setuptools_require, 'setuptools >= {} is required'.format(setuptools_require)
+ 
+ 
+ setup(
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
