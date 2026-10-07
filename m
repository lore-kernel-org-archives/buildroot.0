Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCAFCA6002
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 16:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 607CB4061A;
	Wed,  7 Oct 2026 16:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCoyUD3yhq4T; Wed,  7 Oct 2026 16:23:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C6CC40635
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791390189;
	b=C4wnUIXb4JNAWwT2PemeAY9ro14NiuK4N65vyqRR3VKtncWB/Cauf5KzEkYQmWSMEYHA
	 PKPZuJXZxmVmJUwEr1Zkc6VC3fvm8rxH/Vvl5h4Sz226U61Guemn56cqNRRcntB1wYO+c
	 9rGFgBgtKZK1yCah+p4pCPieGHipU5AS2a3IG40ki/ReNPi/rjQKfQKPwGneTo5g0GBh1
	 iQ8Bu9rYUcK7ktN5FKtCYt192emDWypTwCg2OC3ueG5JU3BehQZ9nq0d2InDEvFTbKPVT
	 P2LzG69Azi1VHFtcEHp2sLAvmNK40Jzhm8570yd12zjHroNfQbv0iP+1bObdoZ8XpUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791390189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=VOCE5zPjoBU0FeF8IIMrd6OIpPANFGv146mlHEL74nA=;
	b=hFUycrOIq+frzvviampwB/0/N+4409u3J8gMt2gzi03QwyNLrN6cr8qgUNR0PzAdo7KF
	 XdhgIt7usMzyrgdqLAkMnHF6DWa9L1dkIb682nA5KeNyFVh7UHEqkS5lsle/43HClg1RW
	 tDfGUS3JRTYWMCUOo2RijrKbYAR2+1zKP29fMOqBzDZEze1W0gD6l1Mc0qAfgwOs+gkVq
	 41yiIYSZJo5yuK6OspUx8xZ3EjxKqcMnr6PtPKEgAgrcCfEWwQDpxfIUF+rHt07zdfbN8
	 P+iOLlPpgOqzoP05Bfxu4sxvYJuRBagBUVdZ0JgZzcayhwvmm559vZJEeNpm33kUfiw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791390189;
	bh=VOCE5zPjoBU0FeF8IIMrd6OIpPANFGv146mlHEL74nA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fl4IoU+fsPKDVLaxQPC0t2+ilNyKFXnK6Mq0Ox5kOl6l4fLXHE6eAiQ0kRwnfLA4g
	 bAGABV50ZWkv9iTQkGl8uz0ItHlxDRbO0uS5f4HdNHmmON4ikDqigzFyI+gTvUG25c
	 H3hlaktq5by2yprB1dhxYtOY7gUAwS61T1yhKEWq7EimzAMP3H6j1Hlo9zBb93TXNC
	 36kDwhGi+qzzLSR+D2MCKZ1v5VWYCvQoZLpPsoXdwY7+6IjPP3BmRD+XSZtY97Q2Yv
	 KUsKFEEV7O7lxX7j+Rx1Rb72IWVl2fMRLFes1Nbr0IzI+iqq8hqCCUjhtFHTQrFCWM
	 rV4OLTvdXWTHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C6CC40635;
	Wed,  7 Oct 2026 16:23:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 541A82B2
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4578A606A6
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsFbqNg8it0y for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 15:36:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 76B9C6064C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791387376;
 b=aUAHdsBInKxVOFKf2X793wvt1eKC3zPbBg3ZNBlCCqK9Vrd4nEuD9YGvm7OjzTSsGxIq
 GV+/FyvH8QgAZWjMojEZTH+sCkNBTIZZnRzEMPnGXFQ2E0/8GYQVokMB0edmaD7MhkdGR
 CSdcWKDmrwZmf/1q7yFQ4h7nww9nai1Bk58VbSKiWw1QdVwSr0aVqonNbZs94Ae/+UJsy
 QeQyliriDOOIEjN2XsOlAmrrWoJl9rAMwfAqRtua2nirH56qoLX7HeD+Hag0TT7zd90wx
 DtqzOWmvOoph7gGDqztBIDjMLJKI3GvoHsehW8rHZsebOEjL56w5npD+toHEnv3mmnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791387376;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uo2Uil7bNt3Xl5UIFpHGgclxTqfARNQw6ebTBRJpbTQ=;
 b=jp6yBAu1CzIsXLplWXTuKlDQv0PSAns2DCI+pGoFCFF27fvlnoQfP+wUOCfs6lxv/ro6
 4QMVzdTwKXk3C3j/P5Opb/wtREd8/nrI9hv8sfTWp53QuQIWvpV91mEUDpb1UaoJ5ajqb
 2JDlFPugtrOODe8S5mcnATF8/Xwz3SVXnhJDJjYeB3STPDwiaUog9nlm9f/u2a5pssh7b
 /X9OYkMNoR5WeEob3FRsFVNNojmrsj5qa1jIsCpqJwAgcxU1b4yGnxO071F/eIgJL/yFS
 3sxLoNlEUSCB74/yId4KEonLSZcwNUUOcI2WcqIpk9P5ng+497iYp+pLq1tK3KfX2YQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B9C6064C
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 15:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B19E18DB2E; Wed,  7 Oct 2026 15:34:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Oct 2026 17:34:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 721e51f58a5477c5eccc9d2a41c6c7ee5e5529e3
X-Git-Newrev: 95455bb9ccb44e4aa80325376bb91891bd1e4e72
X-Patchwork-Hint: ignore
Message-Id: <20261007153459.B19E18DB2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.43.108
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95455bb9ccb44e4aa80325376bb91891bd1e4e72
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index fe438a9e80..59b04e5f07 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  9e7a3210cc146e77aec1c7cd6652ee94  botocore-1.43.103.tar.gz
-sha256  8c7f220e09f3b7ec99c59c716aa66cf6f5b2b57fd8731544054f3778aa744c6a  botocore-1.43.103.tar.gz
+md5  74f03a0859f14c28ca78a6694f74afe9  botocore-1.43.108.tar.gz
+sha256  ee4f75cf3bdbb0da7912e089950e8112f692016539d939312c771499958e6cfd  botocore-1.43.108.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 0226e1c2b6..264ea1aab8 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.103
+PYTHON_BOTOCORE_VERSION = 1.43.108
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/3c/83/acbee6f2e3b1f02de935fef0c48a387511bf979149dc6b44466aaafba6a5
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/61/16/6b4477f433da2c11193802f538330ce080076c2f38d817ad437ed3cd1465
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
