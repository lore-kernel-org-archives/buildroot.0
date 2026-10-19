Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2993CCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E8760760;
	Mon, 19 Oct 2026 08:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLLJVwUTJiTQ; Mon, 19 Oct 2026 08:37:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB8CF6072D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399062;
	b=qok8hykM6NUarUUtc10yl6lwn6Q7kXZ3cb3rma8qh9pfwDtJftW7bRKZm1ADb/oHnh2t
	 2rzd3b5aLquwW7wWM3lqw0+xQwetVNVH2y8S6sGtusPdouChFUi4mf0lxZGGM6jJ0RccE
	 R87fYrvY7PbnLivh2F2+EBn1RB0ndMC4cDNzWpD2IOSN3uLfexvraOE+pcQdm+DZKuIHM
	 xTVmWab9pJsJOBWTo3zDAASxYp2GoxrAtQyWH45gyFZu++SxvBiPv309Be5PqxSZfEmyy
	 +yLDIIjPOCuMwT8AZHQxYZnjPvQ4WArtlhdz6ugGThGYWVDlDZeR0YnGuhmTZkQZIGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399062;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qyLCEEYY0is7IhkFfk0sD4nXuJgp647q2VPm6SjPaz4=;
	b=Kj23dLnZInnkPaOOm4qQ0JHLTtqJZGoKFy8plG8qRQtx9JtvpGSBImLslavLh1Lo0aes
	 8jZJNGoireDSYeFQGlFdRq04TNhtI5H7LS4Dz2BAbkt+tAlPg5lNABPcKXKse4Z39eMH9
	 N4bfLpMsd4ctchy7cxCUB2Ap23k8MhMCgfLVfAj5/2GB5D2qLSbus8wAn0ydr9XogTUo3
	 ECWeECPZLiWU5xA2bVGwIN+/IwqpwNK8CxnS96x3hCAOUfhsqviLGa2xFh4zygEXSUrWm
	 uS4f88p8quRKMLe/ngqSQJj/xXdJgoKOh+SKsEZCy0wTbNS35xm4gVF0u8yEPJLFltw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399061;
	bh=qyLCEEYY0is7IhkFfk0sD4nXuJgp647q2VPm6SjPaz4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QKzAbAATOSuq8PMAAoA1CMWxrlnOBQNADKKeCB89rF29KUTz9DPQoqxl86GLvC09N
	 +49qnGN2SoezXJAYMo79+Nbhyx1pJntKc0Ya6UugUMT9kVjUCJ+02rKLtgpAjaiNYE
	 7iAHAOFItrEo6KsbdFIBzJ1jexyrHXuLXKfY5mIYe+BUT6JGMfJjm2p1QhzmyJ0MeR
	 NI1M/ulsbmTTiyXdIZqSerDcd/N3DLRbMcCoGSDKAQT+SQGU1UjjktytAP+kiTIUsn
	 h4u9TL8uDAA26Wt0BDUV8venljSACccoQm1sHSb+UElPwSqohR3bw6c64712pbPrhp
	 MR1XpTcqgYF6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB8CF6072D;
	Mon, 19 Oct 2026 08:37:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C429DDCF
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A98DA60612
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvVj6x2ermlx for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E9C7A6072D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399052;
 b=BKl3X5SMwYkN1CcW7HS8dIYl0YZ8GPVwqlHH36EM8p/8g6jIIrtOxICbMfFr03MfyI+j
 rl4YXVLHDDHN7K/RbwKMJGA5g3FqQZLCjWEUYBPu9CZn/R+HO2QErsmxOHsPl1C4+JPus
 B9FhFticYzQKKEGbdhdj7abjYpGzmaLISq0a8sF2YQBuZfdOXc66n2oOP8ZX4S+iyagIf
 1byEutcYSXXvQEHiANtUTC5M9Rj7EX3SiETbe+E3SXOyW3OVlpMoVZaBed6G9ILFcRqln
 63WhUU7Z8JaQ55D3w8WkeHwM1ldMvgd8DJNXLK8E0fGfYJ/Bor9J+He1OefeRf7s/fg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399052;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eWkmGjdwZvipGwYCf/NMc2WnKilGCR6LENw5QgP9af8=;
 b=mp+xBD3fbb7vavRYPdh/kFragy+cQ/JP97Mi/oD8riafCy342I4fB2swJPdOfKTpZxGO
 JSxlcINN43vWRUlCwB8iK6+bu5EZGmXzGvZ9oZZoF11IcQbpQOw5Zp0UewbDIFRZtWULq
 GgtH1EAEo/aR7D0Ff/0+S6/2r45X5KK36kZJqpP2B+PX63PjUYmOmQVVeEwT/jRmwaMd9
 wPnc+F9zdI8egn3o1QfEszMXHeZlNOVKLis5/sY/+fVflm0iZjxqDSenirmf6D1Zg9MS+
 68/Gj5syiF6iiiKWO7BR/xUFcz544MCeg+AX/HkKyA7VeSnDA+XCu9jXShNzgqjBieg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9C7A6072D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DA55984AC; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:29:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b8779b40573a5df82249a781649d1a0e32ef899
X-Git-Newrev: 23730639b96ce91562202476c79f536661cd3cf4
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.5DA55984AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 4.2.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23730639b96ce91562202476c79f536661cd3cf4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d4d1d652ca..63921db286 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  888c3cddadef907007cfc425640cddf5  filelock-4.2.0.tar.gz
-sha256  7a60906c75227cf04d0c273afadc8219400f11aeb13cc69591d4f6cdc6c8036e  filelock-4.2.0.tar.gz
+md5  151e8b4a847a4098be9b1827c58de4be  filelock-4.2.2.tar.gz
+sha256  b29ff2ae9140bb17b3bc77c648dc4f010d9ac0955eccabff4f2b01dde859f787  filelock-4.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 7c9494f8c3..8a7b59d93c 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.2.0
+PYTHON_FILELOCK_VERSION = 4.2.2
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/f4/a9/1af41b37c3279712b22cdc63aac78a52432202b6fe1f9666a2a3d2831fb4
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d4/08/d8f81287742010e38daf3632380c8d80ede7b4df2716f8ca3d0a2b087d44
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
