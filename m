Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835FFCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49EB84122F;
	Sat,  3 Oct 2026 10:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8gOY56kED5A; Sat,  3 Oct 2026 10:08:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 505654122D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022084;
	b=KMf2JdVP9NabUxWe4H5EU3T/sh3QT36zGYefECT7iv9h+3sK7ANf54mWyja2bLgSPquQ
	 gRdJ7gSWi5gHomMN88DoAkmHGABo5B7nxkWH+qc1wm1uM1uS70dya6a29VV4SGXfDbNvF
	 OEPEhv48daACQlbQB1nm3fGMJx1olkKg/gaEVQEjmdOFeIMW+Vu13dAf6dxuXE7+bwHo1
	 J+AnO/IZPuTSVMvLjCdtIQ8ZqHWF9itzBpFDfeH+5qXdu8glHijzy/r7WFTiNX3kBrt9H
	 tJEBkW/CX0bZqNCvAzovqYT20LF7O46kpKbQ/m2oSOeoR6wDjkhbfdBAZ2M1sazzX4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022084;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x/U/lCUJQjCSqs+uA+uurryhnLUZXKpxUNasoHpjQWA=;
	b=RfMF/u9ys798G/PyxrUwKgvl9MY0zmSsYN7KqbHKocssdI5An59U4tq3phRpoEngaqUn
	 opfjsxj5UPOF1NY/MOtfG7aOq4xwxiY2mjfsC91SbTtZ0YBMKR/kxS4/xPBJkXFDHuAYk
	 2DgTSjjs1sODmU3DKzd9wNTcDE9yrfP6xZVDHrfyQQdB8WWiKwIIHn8MQB3DtZIgVq9pN
	 8Z+rmA4KXnSdZ9YP+AtT3vpL1puV7hJnzj5S/jkuUHFieWwaPHCwIH0uKHPCL+sRbZtn4
	 Oy+m1tEAioMHU3eKWR9t3vEtqxjzNiv5Fepg5fOlNH+Djm1kjRnHsbtZ9WRin+72SHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022084;
	bh=x/U/lCUJQjCSqs+uA+uurryhnLUZXKpxUNasoHpjQWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s1mpsE+/fPRngHjXFHhsaOYqiPCR7dwPHRyyjCrO8dYugrTYpJ2mYTtJsRQD6FuqI
	 RJcwT3Ij8iytNefWk7ViC+prTx1A3h8OTt2ba6SIZnM1T7OdivjkvpllHHcZrZ3uQT
	 YUtSIIRpVAwpBE2HWpiIu1mNRqCG3YU9XuQyhh43brbXbubmqvnhoVEsgQUKBkQAzi
	 S4WmzddTJt+VaA0CPJ2UYAjvoYMccIQ7BnqB02UPLk7Je4F2xzcyNYRQJABmjv7zG7
	 kGEayhLQakPzBNUe1a3gYww7wcNwpCtPStSmK8QqiE81ufVRHlXLCGXi+5kATC2WX1
	 49X62CxDSQpPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 505654122D;
	Sat,  3 Oct 2026 10:08:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F6BA335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F6FA60E87
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cguUxhxC3PRT for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6BF0460E91
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=MSTOP+hIvKuD6BSuZ6iszh/i5OGhj69hx6qEQbnN7Yt6Fhl25ASxVN4JmWDNu5LrWWAx
 0DZCgen0uiiLjesCPD3l8diISNTg9D04cYfcmWVjsDGXVe1hWJ24pzWHGX21dJ3pXkaEK
 qubD3BGU/crFHcltxcovJsi8jswwsGVoCMiUrfzfQMb7Ii/qkR5v3swFww5Lq+ecpclSf
 pZtvo+KHG3YaREGCdVShNKuyD4NzuhRuP7/m36Gq3Pyjf6JLEf1O2NgmWFj/cAURL3elm
 Q94UUSoBTcxJ62NhCRG7tGcdwwiaJim6zX5KNYJFbi8pI0ntoUijyUg/pskyUsVy1lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rWFZ20tlCdaLz6kBHJ8tSESQx4g+eUAyXpuGJDjivF0=;
 b=DfiS48mqTYS880VTnKC0sxYZX7mv5S+9lXV5VJ3anNBYYNdOzZ+irA0rPhRtKIdhcXm0
 TWptk4TuPak1jrevsmsZyia8nEGk2FO88xnXEirQe6W8TngZlo+5Kw8+BqTyNUwoNRWXC
 7debWaggcC0o+oPIG+R7sJJcSAo7Iuwmdi78DbwMumhOnq3Lw9LF+8ynNAUkdLtpC0/sE
 k7fdZj3AFk3tJlWeWdoCihCNDSfVzCCAqRdqdeOPLpE0E0FgdD8IX8IeTPHXGkNw/wHac
 5x9zM23ZTg2eX2gtE/+mqPQP0sRQxIg7KGoan0mkkMdFpBZ9nRIeB7+dwNyFpGBU5tw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BF0460E91
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C933788762; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93faa571dca6d169d36a0f89cf55908fde55f79a
X-Git-Newrev: 528d1585c9ffb7461c19e6ffa1114881b9977d6b
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.C933788762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setproctitle: bump to
 version 1.3.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/528d1585c9ffb7461c19e6ffa1114881b9977d6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setproctitle/python-setproctitle.hash | 4 ++--
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 3520520df8..86278f6527 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  422cd04321b1aa0f4b56d51d10ae5bb8  setproctitle-1.3.7.tar.gz
-sha256  bc2bc917691c1537d5b9bca1468437176809c7e11e5694ca79a9ca12345dcb9e  setproctitle-1.3.7.tar.gz
+md5  a8f283c8da30571cc58d235dd4474ef2  setproctitle-1.3.8.tar.gz
+sha256  cafe209d064a6efb88cb45a03e97981ff8832802b2b5d009dde0197a3b7b41c8  setproctitle-1.3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  4bb8a954b08857aaecf1da3ecd722ab810d3899f2ab386052bbe27f5ff24a02a  LICENSE
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 7821eb5225..b33a76c464 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.3.7
+PYTHON_SETPROCTITLE_VERSION = 1.3.8
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/8d/48/49393a96a2eef1ab418b17475fb92b8fcfad83d099e678751b05472e69de
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/49/b0/6b8a516c5a9e9630bd5293db78314ac012f690305fe93beadea388626efb
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = LICENSE
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
