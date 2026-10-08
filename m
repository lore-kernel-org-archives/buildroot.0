Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE59CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2227608E8;
	Sat, 10 Oct 2026 09:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31goo4tmbeaw; Sat, 10 Oct 2026 09:22:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7A94860672
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624140;
	b=EFvf5dQ5+1+eX4MaY9ohTBbEfzhAoH+UDZlTVmnq8ZK5z2s+fCD83EaqJP/P9GawEjOO
	 n/p0gZi5W7h+dcJQM9t+NIJ6okA9iP50rAJujCYwUuwxsE8TcxUnSHZ+n8qWXSRFkw1Xh
	 kiAPFj8Iaif+Cnug8i80oy5xkTsgrqHSLYB+5AlY063Qeljv904DgvPJnWtmHlehHlHwh
	 ar3KVWR74NtKSBNRQTMzZIsseJNecKNszwsf3aJMZtYDnphBor2NUoR5aIwfyjprtER41
	 i2Us85e4ymyNzhzfVzP57ceDoZLR6s/2AVn6MXdGTJsnrZ902irBPaAZ/4Tv5DximNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UlHL3tbYD4s8AFlhh1wM0osLpusWlZk4b+vG6g0bowY=;
	b=QEwPNcuYd+8X7DXyr0fx3qhLn19uHevhnjVjWuoE3SaZ2uQPUWV4wlUkGAGnH7SBquyo
	 SyW7CbJ6QVvZzCFxijR85SOzZdR1z3KnNXo5ze23o1jtn/NyE4q0yKxRw5Fz1sEUlychz
	 kKQ3VJzXSp7JMLC9YtxymNiTsgwp7W7mvJyJRrazzS5cHmr0lVsSZd+2A/gQ+5YJPdbi2
	 Y50p7quURx903w3AO8UCKeePlcE2ayBXIiZ9EtFo5w4Ks1+ZfZ+gcWkCepGUwvg1YQoN+
	 Fw7mVu7X3wceH9bXnmvubUSuW+On2ZIOdbNxHEl2fzfTgeCs7g0t/xZi9PxHcqt7WQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624140;
	bh=UlHL3tbYD4s8AFlhh1wM0osLpusWlZk4b+vG6g0bowY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nBIIubxt4Q6ql21HdzwmMKEkGSgHwK0+bNYEi5Ph6HTd5cvlWvz6ie1wb+vwubjJU
	 IOChcv27BGi2Hxl1NEN07z47arkk4C/1zcR8pP9IQquEc3oiuGOcXEC7OGy+1ONVlF
	 KGDEPlOa6vlXcDire2r7YHXRCLflZFiEE6SWjAtm9jkyKF+nMHMLdSIPTT6gQZmgvY
	 4KZPyKpIhHN7SL1iQy3piBqXDkneoD8kmffA9HkPjthdRFxzPd4hSxBNrHiVTmyjnf
	 7eaC3gzGeV2ybrwDVyQstqfsC949BD2W6oDA501NUz6M60TPeOKuKE63pF59TVKDrh
	 7SR5d2cX4mbJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A94860672;
	Sat, 10 Oct 2026 09:22:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7069DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9444860623
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io4Z1jDszlCn for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C7CE960656
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=oJoq7MxNXTVmdtQ6tOa/dzDEMbGB8VIfQ16EONPTUWInOzYbkYcMywCSclv3nvD2Cobn
 QLBQezP24U0tYEVKVJetgUUVIF+GkJbrOEQIbSAMl6NOgdEuIH2pj3bDpkW60lHq+iVKX
 +RxAEezZS64Abl2qYENzOFc2t/xLMcgASBjVnTcDCeqIjoKlS5LUi2U5rdp6Q2oRDeJAw
 bUVrxdKEzfOON2UCdDXBiPOAPLH99MPhpDJWD3PpKr1/O3fXXR4as+DPf+Hi/tcO8xjxI
 docEngn/lorBywDmYLNzNnKZ4uQkDwpEIA0jo1cSVbau7qA2to/cLN4LcnDh68MxUWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Q/uYL4k+KUmj5dcEwmyUoz6MpaQqrPi4w3wwMUMM4p4=;
 b=QVAwbbE6lIa60xtEbpAKj4YCN0mC4xdY+u3SqfYxH6ShWfNYtBCcjqa2Xdwp7wPhENrC
 pBzZfbuAA4jHebYM7B86Xd0IyEGPUplJgmIYdqT3bPfe4HT5eVQNiJ1sFWtvQNfzuAQea
 ROij6FpUNdc2Gc2kNhQT3AFysoifaQUw30poW3J4huHDrCjL2HcomwDT3pX/VhhyVRSnk
 jwIL5E/Lhh+bQptokEk+pJTbZc9OKxmFDDv+omnG9FWQJd8qzf5sxoR/Dc0PGXWzeZwGT
 ym21qmFOyvGs8TRIi+nGf3saK6K9QF6yCGa1Lqp7vu1NkBpToPY9clQBuazJc4Sxj3w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7CE960656
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1B9C8F0B1; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:28:20 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0bc7fbf48f7d0eeb19a5f87f4a01adeda17e508c
X-Git-Newrev: daa15b62e46b6e12f4e3ca60cbd36cbcbe94d0be
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.B1B9C8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/openjdk: CPE ID
 for openjdk
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
Content-Type: multipart/mixed; boundary="===============3974195922591691673=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3974195922591691673==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/daa15b62e46b6e12f4e3ca60cbd36cbcbe94d0be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The CPE ID on version 21.0.2 in NVD:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:oracle:openjdk:21.0.2:*:*:*:*:*:*:*

The automatically generated OPENJDK_CPE_ID_VERSION cannot be used
because OPENJDK_VERSION includes a '+', e.g. "21.0.2+10". NVD will not
accept a version number with '+'.

Signed-off-by: Bjørn Damstedt Rasmussen <contact@bearware.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 875cc7bbf18f7878d9f32d3af9e02575703c3719)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/openjdk/openjdk.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index fbc860019c..e1d68e9a45 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -17,9 +17,14 @@ OPENJDK_VERSION_MAJOR = 17
 OPENJDK_VERSION_MINOR = 0.18
 OPENJDK_VERSION_BUILD = 8
 endif
+
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
+OPENJDK_CPE_ID_VENDOR = oracle
+# Override automatic CPE ID because '+' in $(OPENJDK_VERSION) is not alphanumeric or ._-
+OPENJDK_CPE_ID_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 OPENJDK_INSTALL_STAGING = YES

--===============3974195922591691673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3974195922591691673==--
