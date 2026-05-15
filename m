Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF7ECD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BBF384545;
	Fri, 15 May 2026 17:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2x6JzjuwBfP; Fri, 15 May 2026 17:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AD048458B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867125;
	bh=ej6gcJu3GJPUw4KWoCpd/VaZiKqeg9i2GR+V6hcuH2s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HT3RAOi+R+kQfgJKczYGJxT3w5rxyFH9dxSQHQRJc1r0V1aGrNhcphRObxnX8cHk4
	 4IWOYSM4SP/INckDlebLlDxLEkdAUg1rfK718g67HzbFXS6EuVnjy73R5zPy+fOvtZ
	 MUPmkPQi0v+LoFqTuzqctT3iZMcU3LwFi1wzBAmrRr6+ywFyP/tPlaGd9CiLaMO4Wm
	 xKE8hTQ3TlrIjAwgyYVUK9JBYgbZoPBm0UOzZ1kHRfKdUAY0/qd5XWDORWRRWahJ7r
	 8LaoLktwbhmZmZuOmbF+CVeOWAOFWY4pPNGO1pDb/zd8cwrnv5kGReps8zn+zvkikv
	 p/cCEGy4QQQCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD048458B;
	Fri, 15 May 2026 17:45:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 287EA23F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8703616A0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ForfuSND_j6X for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A982B61697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A982B61697
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E87C8863D5; Fri, 15 May 2026 17:44:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:19:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4452bdb483efbf9bc623d27a1954ddaa67463680
X-Git-Newrev: 9b0561e2e102c1e16ad348f3f197f75133fa6cad
X-Patchwork-Hint: ignore
Message-Id: <20260515174448.E87C8863D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openssh/S50sshd:
 immediately return if sending stop fails
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b0561e2e102c1e16ad348f3f197f75133fa6cad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

If sending the stop signal fails but the PID file exists the following
shutdown wait turns into an endless loop. Avoid that and return the
error immediately.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 34f4732f1a9b6d79bd78d2efa951837cda296097)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openssh/S50sshd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index a5ff385acc..7d862db14c 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -36,6 +36,7 @@ stop() {
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
 	# sshd deletes its PID file on exit, wait for it to be gone
 	while [ -f "$PIDFILE" ]; do
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
