Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAB1C44500
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 17:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F1C4092B;
	Mon,  6 Jul 2026 17:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SacPBcos1y-V; Mon,  6 Jul 2026 17:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B17BF4092C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783359237;
	bh=XmUqEw5BiRkdSjjTdRF5xDGzEEBNx0ZMGclzHMMyOl8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B++Pb0Ah8yh7IZ3z/w3pjmTfTnZJwqO8pPRmqdgvZS8MiKrUpQp1pifb8WcJt7400
	 00VXGpEA/zAuylbnwytigklYExYyraj8sfxsX4UtNKbJQEiDJjJIiQDUZf1nmX1G2s
	 IEYiVNjXBHzM+VrUaM12AS+K1mRqBTzS7RSIgtHQWAroda3AOJws2d7UBK8hPeYhTP
	 bFSfRA7TtNyZitvgThtU15lyTcadiePzWdf/HktwwAvJSN7A5V4Uly2NgXSBFu1CB6
	 /k/3RziowWgZkmQT1ty9G/6+/ei25VHEmIHJUW5lh9A790pggBsAA8c/h9Df74kWVh
	 ZSRu01SmQNiLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B17BF4092C;
	Mon,  6 Jul 2026 17:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69E8F316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 17:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 531A26061D
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 17:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8BpUH9JEJ9O for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 17:33:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A33B605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A33B605EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A33B605EB
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 17:33:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb1c.dip0.t-ipconnect.de [84.161.187.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D6D3A4C16E0
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:33:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34722)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgnCX-000000005ji-3G2t
 for buildroot@buildroot.org; Mon, 06 Jul 2026 17:33:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  6 Jul 2026 19:33:49 +0200
Message-ID: <20260706173349.2555859-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783359230;
 bh=NV/vZ33LkXnzYwcI7H7pSxM2S5RqgVcLBSXD+esMcb8=;
 h=From:To:Subject:Date:From;
 b=d1zfjdIK97pG0ZXji9ZPWA6Q9aWiifJaDrrsV48lyZ0RTpvKmfh6q1IVSwXnpfkit
 2A1DxZken7pdZWQLmbR0EacQ2XROCo6cbIUOAlz1DvYmlj2fNdTO7rSFe3Sfkiepzg
 kwQn2juMbpJ+LzZrkfoRNhNgP6anPjPKW6tCsUeclEGDfDa1kTavk8ja3bI84pZTbD
 LNZsVOsmo4+eYWUXx/phZqZ3EVN/s1+jjAdvFAqpXpKKNHUHpay5oqABXDwK56ggxj
 CVujdwJi5G36skwdHdyUTjGVOVnbTiTfjXzB1j6Vtf3rdM2k+1lSto1LqBirazQA51
 n4GpbyKKMDfYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=d1zfjdIK
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to version
 10.4p1
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

https://www.openssh.org/releasenotes.html#10.4p1

Changes since OpenSSH 10.3
==========================

This release contains a number of security fixes as well as general
bugfixes and a couple of new features.

Security
========

 * sftp(1): when downloading files on the command-line using
   "sftp host:/path .", a malicious server could cause the file to
   be downloaded to an unexpected location. This issue was identified
   by the Swival Security Scanner.

 * scp(1): when copying files between two remote destinations, do
   not allow a malicious server to write files to the parent
   directory of the intended target directory.  This issue was
   identified by the Swival Security Scanner.

 * sshd(8): when using the "internal-sftp" SFTP server implementation
   (this is not the default), long command lines were previously
   truncated silently after the 9th argument. If a security-relevant
   option was in the 10th or later position, it would be discarded.
   Reported by Steve Caffrey.

 * sshd(8): add a documentation note to mention that the
   GSSAPIStrictAcceptorCheck option is ineffective when the server
   is joined to a Windows Active Directory. Reported by Yarin Aharoni
   of Safebreach.

 * sshd(8): DisableForwarding=yes didn't override PermitTunnel=yes
   as it was documented to do. Note that PermitTunnel is not enabled
   by default. Reported independently by Huzaifa Sidhpurwala of
   Redhat and Marko Jevtic.

 * sshd(8): avoid a potential pre-authentication denial of service
   when GSSAPIAuthentication was enabled (this feature is off by
   default). This was not mitigated by MaxAuthTries, but would be
   penalised by PerSourcePenalties. This was reported by Manfred
   Kaiser of the milCERT AT (Austrian Ministry of Defence).

 * sshd(8): fix a number of cases where the minimum authentication
   delay was not being enforced. Reported by the Orange Cyberdefense
   Vulnerability Team.

 * ssh(1): fix a possible client-side use-after-free if the server
   changes its host key during a key reexchange. This was reported by
   Zhenpeng (Leo) Lin of Depthfirst.
[...]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines show no new errors introduced by this bump:
https://gitlab.com/bkuhls/buildroot/-/commits/1a2823463ec674dc95d73cb0469e49ab218912fe

bootlin-powerpc64le-power8-glibc which was broken before:
https://autobuild.buildroot.net/results/507/507cb5458e29499ad1ab0f07b2401dd707954c2d/

 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 2d242b4a99..297e1c95a1 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.3
-sha256  56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4  openssh-10.3p1.tar.gz
+# From https://www.openssh.com/txt/release-10.4
+sha256  ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238  openssh-10.4p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 8f46d886dc..2f3088defe 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.3
+OPENSSH_VERSION_MAJOR = 10.4
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
