Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AD1CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0000A8141B;
	Sat, 10 Oct 2026 08:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ivp-3OYj8Bib; Sat, 10 Oct 2026 08:25:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1054B8136F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791620745;
	b=PMoQ+Phw41Mh+u/3fVmiHbIUA7P3JJY/nhK1R3lCUzRBv4U/3wh+HDDWg6kg08ixegIA
	 8uvkG1IGNgI4btSVJw2u6OshYMPcu537PCw01MMLT1nmX3rL4zVLia75t1dS4XPsYqX1l
	 fPuM2e/FeigjECR7tAzNtgch6CmvENNs2pMqnK2d56t6425ig1DUskKjTEbWiWVtZeaQN
	 FhCaPN4Wb3X8yVt1idV6mygwXZ3a7d9QoZ0EFxC1oinrVX5egjfQCmhVfpPaxFFnPIluS
	 uHUvzFngsNApeLGpiKJ6yLdlzlb1dbwC+hkAowijC439tXPIaQYRHt4IM8p5pO+46aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791620745;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sbScH3JN+QvYs7Pgv0aFoCJXJh4C6FS/7o1R1J7livk=;
	b=KgASHZ1KV+G2Wi9ZGZ7Qbw4A57AwHR4u1rRKG1w8bvMWRG88ul4wQBun7Fh583VPAOta
	 JUZQHgHMj0kcwwmiIDOFFt97MISyIO4tphQdYJ0mI9AWAx8WiES22bT6LgRtNs/z1Xo90
	 m8kM9ZxBL9feIjqufh0IGGEzJU5WDW9ZhxjW1+3LJcMWsnzPdxqkl/rP8ed8bNOBzAXYd
	 oxjkujZ6XlesjxZhBekeB/lckvTjHBjfo2lKBoCC5jleS07cbdv03cFLIYXTcgwM9U6JA
	 KlcyA0IUVCggCsTBqaX0AEIaSWfXUZr7C/KeWFBg7nyN7osUnqD6DtwM9XwUsxHSy8g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791620745;
	bh=sbScH3JN+QvYs7Pgv0aFoCJXJh4C6FS/7o1R1J7livk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IM5cHiXhPzXl6u1XRUzpWrEO2spqethK2Gr+81Ycg2Eg4FLrnHVktY8JeNI+ayFy+
	 eB0Q6IuCpPw7kYv3HGhiHL0aJAaV+iLRFUs1a0tIXo+jRyg4JrLXC7qUI42bu4DDOF
	 +Nktd8d1xOpuwRk5QkEy8HyqbWnWo+xyf9aXuV4N/dZYfFXGedpIE28QRieOSlQET1
	 u70aHlihZ2CuHy1DWZHKo4cZ+Pw1bMrR8hG93Ltm5LyGhGG9+GPLkrftvjnca1Q93E
	 RoscgVEaqZqlh+1hzNUauS8FOKBEitTh2kKXVe9MrurGNLuhiUqmaeNcJGI2wohjUX
	 QZtf2l7csGU6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1054B8136F;
	Sat, 10 Oct 2026 08:25:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1697C380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0D84400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUUA8kcjQ5tQ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:25:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 520E740004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791620742;
 b=Rx7t/qN60A1m2rzqRwKwm64sP2TvK/Xqczfd4n6eBkgtGUhcn4QvXTq7/BS0Ecujs2tM
 Pt1c8yDtO7xVmYqLBYsJaAo4bSLuSZMSGLvRHQ6b9to5kAqhTGQGQLcxNqDc924o8GQT0
 YQO2KDmiF9f9A1iAWb6EqtqGcvHhirQwv5Mg0UWKq2U1WNcvvMKwSWulMA9QPLEFU+OQ8
 w9Z4XuCFgtbRcmeAyKe2jbfJu+q8fhi/V3/I0MydH+qIKlPEgdVDm46YCDoUhXS4LOCU3
 1KPFty5Ag7AnM/vPCgfE6bUzpTlHDkJqV6DTDsbc85/TRCd18T4aqnFFBFHDP5BTivw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791620742;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sSoenwiJkBPhzuq1kxsYhBPv82XYb8sdgLFWjVaPJuc=;
 b=FDKiyBjCYUkVQ2pyCpc88rrKRpY25Eh1jsImzlw1bbsPd1rxZUxeAzcPoyMQuhpNZZeZ
 48cSJWnRTVQ1fWguLbrFBvZ0qQUZA/4GIqn1ETxFFlwup5Q0UKTMUqSRFqApbhi8nK6ef
 GYmDdMjCg54vDzh4yI+fn0BPIbsPU6dtkzYhedZ+Zh+q4paOusfS0QWqCJay8oJhJ8F+i
 mCFSrtG4xKFLBLIIQKhtJBJ6KkxqGC9gbUldatY7k7Tj/LNKZkX0ShdbwIIncsFuvKo9m
 Grdu0mLTlrohCbVxqOmWm+oDrTWMKCVVtL5FYM43WYX2n2TZ7D+XljdvgXsfqX3Yrrw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 520E740004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:25:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3952D8EED7; Sat, 10 Oct 2026 08:24:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:06:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8df2ad69de03c61378a85dc08daa1e9a2fa46920
X-Git-Newrev: 74e263769831e7e7b68c16980292c0261c518155
X-Patchwork-Hint: ignore
Message-Id: <20261010082424.3952D8EED7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sip: fix build with
 python-3.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74e263769831e7e7b68c16980292c0261c518155
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Added-support-for-Python-v3.13.patch      | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/python-sip/0003-Added-support-for-Python-v3.13.patch b/package/python-sip/0003-Added-support-for-Python-v3.13.patch
new file mode 100644
index 0000000000..d05e5d8a84
--- /dev/null
+++ b/package/python-sip/0003-Added-support-for-Python-v3.13.patch
@@ -0,0 +1,56 @@
+From 7a345846465304d311c717c27940223700aef0ef Mon Sep 17 00:00:00 2001
+From: Phil Thompson <phil@riverbankcomputing.com>
+Date: Fri, 24 May 2024 14:08:26 +0100
+Subject: [PATCH] Added support for Python v3.13
+
+Eliminated all compiler warnings on all platforms when building the `sip`
+module.
+
+Removed calls to all deprecated parts of the Python API.
+
+Resolves #22
+
+Upstream: https://github.com/Python-SIP/sip/commit/51f3e60007f54fb5a96d649d16e36195022c00a8
+
+[Bernd: backported to 4.19.25]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ siplib/qtlib.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/siplib/qtlib.c b/siplib/qtlib.c
+index e166529f..258aae09 100644
+--- a/siplib/qtlib.c
++++ b/siplib/qtlib.c
+@@ -132,11 +132,26 @@ PyObject *sip_api_invoke_slot_ex(const sipSlot *slot, PyObject *sigargs,
+         Py_INCREF(sref);
+     }
+     else if (slot -> weakSlot == NULL)
++    {
+         sref = NULL;
+-    else if ((sref = PyWeakref_GetObject(slot -> weakSlot)) == NULL)
+-        return NULL;
++    }
+     else
++    {
++#if PY_VERSION_HEX >= 0x030d0000
++        if (PyWeakref_GetRef(slot->weakSlot, &sref) < 0)
++            return NULL;
++        if (sref == NULL)
++        {
++            sref = Py_None;
++            Py_INCREF(sref);
++        }
++#else
++        if ((sref = PyWeakref_GetObject(slot->weakSlot)) == NULL)
++            return NULL;
++
+         Py_INCREF(sref);
++#endif
++    }
+ 
+     if (sref == Py_None)
+     {
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
