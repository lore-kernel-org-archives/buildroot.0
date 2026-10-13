Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3EACC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D615406E1;
	Tue, 13 Oct 2026 20:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-vHpjT6Vmf1; Tue, 13 Oct 2026 20:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8D99A406B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924771;
	b=hipdMTlp7cZ630CDCYPQd6GMH+GmSelKcB8RPGfVoWyTBv9NNnGlYTE1EDPBT7wXYJdP
	 mVwHkn8QtYTnoUgOtqgMDNLwOF0TN7hn3nnT/lPIbXjFjyCC4N3h/pFW1sez4MiGl3pM9
	 LCp/fREPASMmWQISOTso2bd7B1xPsOGTDu1qZrd3RISWH2e7P+Pf9A81s7To21/RmJf2o
	 agRGgjacAwVPCJ3gWkzu90B2nU7fKr/xx+v5FUgqYlPIxAfaON8noPE+tWqhttICqWL9V
	 RykmbCsS/z1JgJL2o4neC70M3T+s2mhjE8M6SPcfJUE6ECdAGCqq+FVerYyKC986RhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5t524Osp3sz0rjBH1IPvuVulshc8OEhOZYvgMbG0PPA=;
	b=UA/0VdYPIMqOJOPnHFdvfUJgh74z6irNclJmBM7ruQ5+I5zwFOsouIs/FhBYrE7YSm9+
	 37K2qPDW8Zwirk5qQg1MUCm98xowRv3FRwo6xz9ZIITu93uZfrnlWLkpLbV1RhlA8TbD1
	 qF1s9WZlqVYJQgmW8EmXngt9SeP/1iFEY79QW0U5eiEOu6AhBlCy7QesIpjOlpbG9awQe
	 EvejntmFhkHQG2Zb5dC7O/MnI0BUAydx6T8SrSpkkETYQHhhwe9V/oIo+FpUOrJ6+5LYl
	 8SHRfS/fHwRI32w2FsBy9hvjEM32jZAwSyEwC5BASF+XBy/VcE5QM3OXcNJ5D4aZ3yg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924771;
	bh=5t524Osp3sz0rjBH1IPvuVulshc8OEhOZYvgMbG0PPA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CMsTqQiwDfsQltkBMXSA98ZxWbWX6VdMUcXUS3I4o2Hlq6Xefz52lnI07K5SPCyvI
	 KyEZFJCctQHucp+rdXiTRWqS1/yafzzf/5UnQRdzpEZ+pYPsI34HrQRGi2m398mium
	 gQps9vrQQ5A1IsrMFds69e7LN2suwAUOzrDzfCbf+2OhwElg0dig9nTQQ60sxGTmbK
	 9wLcYT9OUKDC6vhE998F8TYOWFm9sWfT/Mv8XUS9DGF2uUsJFhIRr5AGLz1LALNVEH
	 rOF6BMtv1MgN8eZ0C0UVslOxjV7rjF6ukYJVueD1ggeprPgv/UAvHaNuidKyyA8h9/
	 eCUF3pCfCk2CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D99A406B3;
	Tue, 13 Oct 2026 20:52:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF3C4788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D594840647
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERuWUuhMldDh for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 082394065F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=dolm6+pISy8uE3REufm6VIclZBu4rm4U+BWQKVte3+brZyaRlaf14TmT4bVRGzzzsIjY
 Ja7d4WsSqynThgzQ9BkjDvSzxNnZXD9lHXn5UCt4LQQRd3beKausjQ9l+jP7GWNEIq614
 o+/SYTyyWPN+kFJPNZnMbC2mz2mERKsDEMUlrm1Z/GXxJQCwn7VkTFkdRmThLE+qaUL1R
 SQWfgewUumdvvArkEr8WQb0MTLnXqsLoHRcheQgOTBtwf4RWebqveoTZk8C06/KNJgtey
 lkzQ/3WO8ZhnNMvCztzl5gqpCfQNVHawxKlSF0pw09MTlkns+C7w8xFbmucedcecAnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DMD3F6tPiZxaMbqKjlmW1pAMIeEp/sUTthakM9LOJvQ=;
 b=C32u+AZP+JrbGJpdFMX1hdWy5A5GySLqHm9hqDEMoV3b2DPqOIeYhM+t7sNt6OUyWSRH
 X9Qg+KLyi7CWpOYwqitkFceCQGsZURgqFxAO02rVpxPb/hlgxgBb6A0YEZH+SEYgyLIWe
 tssY33wyQ4lYIt//vQ8DCOuoPyK569t8Qwnfhzkd677ropyx63DNDLI5V3rStFa6ssPBQ
 cgvWmgzDdzdXgDEWoaRtgUcOq/kmj+mb5KbvkQcO7gyIaxq8tUAKZw8GjugzJvwtG5WT2
 n1YjqWERzhFAzeuEibh/nVBiJkYJpUODqWj7GfUeKM69eciF0rE0hiRBFdbcx5Prslg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 082394065F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4203D956D0; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba1434dfc3334eda2d858931dde2faf82b11dfe1
X-Git-Newrev: cd3948ae7aa4ef0f50108a287d2e7667c769b4a1
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.4203D956D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipy: bump to version 1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd3948ae7aa4ef0f50108a287d2e7667c769b4a1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipy/python-ipy.hash | 4 ++--
 package/python-ipy/python-ipy.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ipy/python-ipy.hash b/package/python-ipy/python-ipy.hash
index 3d8e1e8c71..b4f79d19bf 100644
--- a/package/python-ipy/python-ipy.hash
+++ b/package/python-ipy/python-ipy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipy/json
-md5  d6cf83e7f418ebbd23324ba1c658b907  IPy-1.01.tar.gz
-sha256  edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a  IPy-1.01.tar.gz
+md5  1977488587a7ca39ba3ab1299e869dcb  ipy-1.2.tar.gz
+sha256  c145e664e84642fac875a043fab1a0b50bd65297385dc438dbfe25f24e65ac61  ipy-1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index ec03adcb60..2bf1665963 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPY_VERSION = 1.01
-PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
-PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/64/a4/9c0d88d95666ff1571d7baec6c5e26abc08051801feb6e6ddf40f6027e22
+PYTHON_IPY_VERSION = 1.2
+PYTHON_IPY_SOURCE = ipy-$(PYTHON_IPY_VERSION).tar.gz
+PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/d1/49/de558c2c8581f5860b9696467fb893c7141501daf00ea14bb01fefd360e1
 PYTHON_IPY_LICENSE = BSD-3-Clause
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
