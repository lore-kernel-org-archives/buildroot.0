Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDECC982D0
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 918D080E27;
	Sun, 20 Sep 2026 10:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngQf-dfr0D11; Sun, 20 Sep 2026 10:11:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CBAC980FAA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899108;
	b=fvsXOLKSzMVsY5gZjDSvBghGYOqRcKYrVtKVuxTnK7bSNo+uD8kQVOj4gsXROVVuwE49
	 RhDg2mNsV2HqY9sJbOYSnU0t2z0qlBJGUh9FB8Vhz5aRsrNjN0tNFvEImGHUoBlifhNEq
	 ekChPPjAouOlzrCXPgdp1BBO+fsYr4+VSjRtIwW/AkfW039N7VJcvJ6tQooIUFMdrv7Ts
	 5dctjAHiiWv3fMzXPwsfRRTsD8Ts6W7DQ9GENypLNZQ0mVJiGvr8tFb3E0ZiOYvj0wy5w
	 NSGQKWuMAOhqIN/5IIAHfBRcDunrLAJvu8JBwW46jYXOoA5Pgu+IQ/nIRI+tKZP1SqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R1rHps6Jj0I5FpnyaMfJCRU+vFu1n+nt15TDmCeM4TQ=;
	b=aaE2kfN37HJgoFd3twqDFZz/uJvxXXVNxjMaW6ITCvrRzgQYY2UjXY+ip0nDgjFeG4EE
	 W846rrF48RuVven4qiGayTke8uSx/rNy1qjWQ1aAqOx6yWTz5clo4SqtI1Auhe5iT1qYv
	 ce5vPwamkjQHkzKtrws1mcOmMYVGaWFpfFEM3HhzP/Xfvx4FvVLEflBpkLHWoJzcaoO6c
	 8r7nPi5EqOyJOT/B24bHBRYXXMVaDvAEwy5iDbA5dIM6KkonF0U3SR0Wfh5bCxSFlh80S
	 jGNAH5paUXojCE5WNo8934BCbeo06T3p52MXcpVja1PVpLIftrMgWmileYtBueYK+SA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899108;
	bh=R1rHps6Jj0I5FpnyaMfJCRU+vFu1n+nt15TDmCeM4TQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=agBtBW0hojwn/UwOYGa0mYbX+mC6UQV/1wUWuiukYsecRpHX55KvWEfzYAtAb7g07
	 +fk2gaGShJPrq6tLzJ7iW0Wzxecr/T1Rcci+H9wtNNAPZl546SZv4ks8kRjPRocJML
	 AGy8fO8JGgO9ljZ7/qJP99OkuDvMl4UzXC/EFuPbYzOEpPWve1OKMj2qJaNnZm7EcZ
	 NlG36Z/HJj6Z/LzbZGBMYXLwTLOS/viZnKh6sQIi8dlh/uitCYeaxCrCVcCFm74/sx
	 q1aw1eMpeTw+u4MidArOFcVw7Y9bKh5aVrQmfxG3S8VZ+33xAk5nLe4PornLzSf9q+
	 z+g0P1pvozAxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBAC980FAA;
	Sun, 20 Sep 2026 10:11:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55216392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46F9F40062
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrmQxYihYMzM for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:11:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9EA284005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899106;
 b=kgOYKI99xnWcH6cHDGLskQqCWiVyVTBGuoGOw6GtLukPV+1C6WYw1KmQLkCDR1mwm70x
 nRUp0mQAPfn+x4ivXvCXoWm6+1TVmuYE95fNY2e7So1sGjUR5roraiSjEflSPu+KgBMG6
 127C0RBrsvk4p4xwj+JMQguBITrm+e92K+81FjuVniK793AiNtZw0/Xyrc419g5iP0uY8
 BsjXqCeJQOughfZ9ibw0HfLj1Ea1YJfALYi4/3rWlg14qPcZ1hLpRirkhkggIEm1TVmS1
 HvaP+tWtALU6X6q83bTkIJtzkbIrqysZuhuOmMsj5T5Q4/6kKIZzyXdCiJsGMXsBXFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vwL8Fw0Y1u5kPwObD5acle8U43tgdGPGer/fCZOx9J8=;
 b=OVZeqYgvl+1NvkovKrCCaKFJLblGJH5GKPF1cAhVB3sZI6h8IO/u2A7r1mxIc9wL8Aot
 hUkED0huGqBVbGM3O9ylgURNWnx928PLc+nc/MrscuAwsZxkVmqUmsLn1XRzxyMDVs9xm
 aYELngbmS0gljhSM7V9PFhvQOxPSv4HwXrCuy/j7jvRMmBnkli8Q/0Ay1XcomfHq1C20Z
 Od3PfAAo/94jl49lnO3N0Ma0gUnueyw0ObK1ScbWDm75tpBh/H3Mfkxrzl3kY2tj/ZNi9
 DaWtpNe9CmRyPj52yEPFrYE6XJh2rnYDC+YvV/evJgQPPEZoDLQqjagHrDk7nDWVXKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EA284005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:11:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AC498DAC6; Sun, 20 Sep 2026 10:10:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 12:09:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c23815ad18883fd47d0065a55e2048dce51ffd03
X-Git-Newrev: 8f472d08d87dadb4301db2afbb72088bf573d7c8
X-Patchwork-Hint: ignore
Message-Id: <20260920101038.5AC498DAC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmpeg2: fix build with C23
 compilers
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f472d08d87dadb4301db2afbb72088bf573d7c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libmpeg2 contains code using K&R-style empty parameter list
declarations, which no longer builds with C23 compilers.

This causes issues with:

- GCC >= 15.x, which defaults to C23

- GCC 14.x, since the bump of autoconf to 2.73 in commit
  a6e8c07a330a389e9578d8f1110e41becac264d2, as it causes -std=c23 to
  be added in the CFLAGS by the autoconf machinery. This doesn't
  happen with GCC 13.

Fixes:

  http://autobuild.buildroot.net/results/53daf0b4bd8b476252ca219e53a966405ece7e51

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmpeg2/libmpeg2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index ec23dff57b..4d4e17d13d 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -16,6 +16,10 @@ LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPTS = --without-x --disable-directx
 
+# Compilers using C23 no longer allows K&R style function
+# declarations, so force to use gnu89 standard.
+LIBMPEG2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
+
 LIBMPEG2_CPE_ID_VENDOR = videolan
 
 ifeq ($(BR2_PACKAGE_SDL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
