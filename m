Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD7CC5DF6A
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 07:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF00B606A7;
	Sun, 16 Aug 2026 07:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWgaPsrvHx1t; Sun, 16 Aug 2026 07:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEBEF605EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786866829;
	bh=A3GLgx2ojoEVPluNBH0t7tSC8WAMqRijqYCbAIKOdgE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dcyd02FR2YIA/COOBDDR0PRF7f16AUFXs8xMeglscqRS9zleQEv+UtkzmgxRS4P2y
	 CJlcUq+BHJxOEb4Fo5WgV7GSazFnszjalbzhNDqt3dMW/8cNXgSP7IFEtiUeChsLJr
	 e0dahTwilYRTzGi3CTy6PZyyCDyvBccDBIIDD38ezZwJ5GQGJPDMSSiytqAxLynpSt
	 sTNxIa01KHEIKm75EEOjuyrsbWl2m9wKUJqk30lSFl6s3+e1z9DWXg6GiTsO1fLZoB
	 akNdL2PyE6GRmVbFqK75akB0zyGLW0Am33zcvtscoxaZyhdhrsA/xv3T93/UY4zjPG
	 VzXTziEXSyXug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEBEF605EB;
	Sun, 16 Aug 2026 07:53:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00ADA334
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DABAE80EDA
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC7zJqhV0A_t for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 07:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEC6780EE0
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC6780EE0
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n0zmgjvT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEC6780EE0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786866825;
 bh=3QAsxHBjHf/s38NC5QcW3ySdER+lh6AlS9ks+ddDuz8=;
 h=From:To:Subject:Date:From;
 b=n0zmgjvTtxWJE0TyU3J8Sn5x3n9ynzEeT+5G7X4e9SK8hjSe5LGyJ3/3uKixx2f5c
 ehJe7wOrdZRY0d0whStXB1at8Rtfa40hBaVtisnAOCPG1VRfKzj5zXIGzPZw1Xutgt
 WFBe0cqKNRUElITF6kZCRQAHRQxCUOKKEtdT442Nu1G6QWAXkW5bj4jzIxiuTsDaMj
 aoKh9TolNiCq4ihLkPbsbtKLoR84ZWN0kTvD4pblrLWHYtFxNcRBOGrd1SUy9H6eX1
 hjrCtF2lZAzeKzf7Afv1NJ18n5iXxCFp3VqvTIQimA0yOf4WlkSM9uG96hhm+rE1mD
 VFBusYcHE1nMw==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA89DA4C109A
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 09:53:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42330)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvVgf-0000000078Q-1S5R
 for buildroot@buildroot.org; Sun, 16 Aug 2026 07:53:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 09:53:45 +0200
Message-ID: <20260816075345.1844714-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to version
 10.5p1
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

https://www.openssh.org/releasenotes.html#10.5p1

Changes since OpenSSH 10.4
==========================

This release contains a number of security fixes and small bugfixes.

Security
========

 * ssh-agent(1): fix an interaction between agent locking and the
   session-bind@openssh.com extension that is used to identify
   forwarded agents. These binding requests were refused when the
   agent was locked, with the result that operations that were
   intended to be limited to local use only could be performed
   remotely, including the ability to add PKCS#11 tokens and make
   use of keys that had destination restrictions applied.
   Reported by sn0x-sharma

 * ssh(1): avoid potential realloc use-after-free in the client if a
   remote forwarding is added via the local session multiplexing
   socket while a remote forwarding open request is pending with the
   server. Report and fix from Brian Mingus of Cognatory

 * sshd(8): make the authorized_keys "restrict" keyword apply
   correctly to tunnel forwarding too (which is administratively
   disabled by default). Reported by Erichen, Institute of Computing
   Technology, Chinese Academy of Sciences
[...]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed with all OpenSSL options disabled:
https://gitlab.com/bkuhls/buildroot/-/commits/04ce3d1ca73e5df02acdf7878b408faccdfd51e9

 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 297e1c95a1..aa84d011f8 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.4
-sha256  ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238  openssh-10.4p1.tar.gz
+# From https://www.openssh.com/txt/release-10.5
+sha256  d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11  openssh-10.5p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 5575ba4f97..dd0a6e023e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.4
+OPENSSH_VERSION_MAJOR = 10.5
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
