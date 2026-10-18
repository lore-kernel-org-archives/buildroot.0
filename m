Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E83CCF2CF
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1173460679;
	Sun, 18 Oct 2026 14:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yES3hEw-5O3; Sun, 18 Oct 2026 14:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0ACA860730
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333491;
	b=NT2GKi65J+Mxkmv1Im9G+RaqLN4wbel8OsXlmgpThsPL022wfdPsoB+SrJ8JTSgz4hoP
	 0/QoVfh3Kz9oUiA3ur4ifRBQ/F9Eue25/dVuWMZFTzUjcu03Je4m2/ci6rwfvtwpqfn+6
	 /BHQN25anqCzY9Y/pc8R/L97x8yZmMKF+LQbUGxFJdjN7l+/6aUbO6Zrpy+UpqZJBrA0L
	 4l+YLLbFSKo6PHyjb/9JB2vmOUF9C4Ovb4SJdzGGGYy4m+AYHSj0dcdJnVpTI+MUgBWna
	 WEByQb2aN8KZIb+0/qTcOl9DLj43mEK+TXXlD119Q80iXWf8nNsGoBHJMj75v7zHULA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333491;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6I7UCIX295XrfLX9MVfdCjcs+nxQFagEG+neMc7By/U=;
	b=CZJfW6xKaoYI8LbeOUcWw8ZN6Nv67wujnaNxIXuyDnyowoC3Sok54zTeMnCmKUIToTj8
	 rSTdlgWA8wrE50byeIzqtlEeAMyA8hdO+fUtwXvOX6I7X6+v8eQGY4PdpUAs5DlUygxV8
	 3toMGbQv8kqomYfPR5wMZRhp4t5dp16xBg5RDDDCkiuexpiVKlxLjbeDpXmmPAbXjZYqL
	 oqwcUHzKMTNdGt2bYomKvUXNKGY3M3a2qIH20JopaXSOPwzgyiSFshxBAAQi6XQ+LCVdY
	 cF65QGqWzcAkDxYtJGYJN3gFXr5U8xqfJNRcpxd1dav77+NO7WArd5h9CvpfDSedTtw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333491;
	bh=6I7UCIX295XrfLX9MVfdCjcs+nxQFagEG+neMc7By/U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=krXkbOownXTVd9t4o2VyZtDWJUFWMP/7q/FrS+cw7+VdID9ZIRMmmXPEzDGkHRA+b
	 2FGuRSA4CaFiOi+suU/RerzUFamFk7ClrpsJKMVQpHBkGHwqqE/SnjSNUKr1ouFxQf
	 k99jCw7wGKrtTDuh+51EKOeCfFjNCPMDsqs8oL/GjsrhMT4BE69lKvko4FXiYXI5be
	 4+0czUNjVrCzXrKv+jBRt/S+9XmYYczvgMOLeUtPzHCOVpujLQoVE6ygI1zU/ZvlUX
	 RMWGLUstiolfgvPRs9BN09AtAIH86Lj+VNnu9f6iAcPgHc7LkS2bkXHF5VwaSq46Gt
	 L92/IXYpotr3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ACA860730;
	Sun, 18 Oct 2026 14:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA439151A
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAB71401CF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esdqQPD8m98s for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 740F740204
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=TJzXPgahi3kp4WT5Our1xheHNwJVz8xALyynBKdZvTAxg3BkT2j2j+WmO8bUV0YPFipX
 LWWfyHFqs+Q4T/nTuvXOn9UeZi7TzFs4cDqpuvI3OAp3qEu1cFiPHNpN/t+eYqvLjytzB
 qNv5xJv5n5gBNwr5ybuL+RHI9ZiKg9Hup2EG5E5FeGazXrLbV/IPd0uZA6hfZ8eJ7hKWi
 soWBtov5o1Be5F0ObK1DObm4JCcciI75uDo8aEqjGNgmAbMGvA1X7Ob6kaztI/uo6MoJj
 jikUDSH7GLZtNfNPl3CknIrfo2Lii8XdjnaqWrWjmJw+Lz0OsRIJKxE9UBfzdwKizVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WlDxM4z9bl4Ijvv9Do9DoCKqV1BWvoxK/vhZ1JC00uM=;
 b=DEhrnlURy0czjFX83KfulsGmtKCxR4IDrhrxkaR8gVYxILkPCIgXs2RPzmSThy0jNS3u
 Ot8sGXrkI/ZRBcjlL+JMU8h4dSo0cprBEENigxVw6MX8cU0zXRAXA7SO68tG2KBAskRLg
 w7xfrvymjc1wacbEqXzhhqqIVtPYuTWgwqmoLOzip62W/v98P+K0tiWfoOU7wbLYGVlPE
 Emy88ANOUS3/eCqqmAw1L+L3iYt91MHLaZCvvjw5wyhKbTwZq/gR1gCBRNG6Xsae9s3En
 xFm17BJ8+weT3yol4FQYqUODebNnIRmmw9llYSZHABIadkxWAr2eEQQm7cNhk29XUqQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 740F740204
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6386B98283; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3cd96bd37e78547957ab957627cab0fd8ca446a
X-Git-Newrev: f8ec3d38b971e16aa2e15cd03a1adff26ea53d53
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.6386B98283@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tortoise-orm: bump to
 version 1.1.9
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8ec3d38b971e16aa2e15cd03a1adff26ea53d53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index a1652f92b0..141b050658 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  d31bc68389936220db65f389df34ee7b  tortoise_orm-1.1.8.tar.gz
-sha256  09e27be9db148824dacea470d01018ab571676f94aa5428a05bcaec44c413ec7  tortoise_orm-1.1.8.tar.gz
+md5  eba6c5e1097d36f4b03e00e38fec8e60  tortoise_orm-1.1.9.tar.gz
+sha256  0399e1aa9518620f8b9c455598ac06ab890332c03e335cfca4b73b48d4e6abaa  tortoise_orm-1.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 927d8fda97..678a2af8ee 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 1.1.8
+PYTHON_TORTOISE_ORM_VERSION = 1.1.9
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/10/8c/059f284ed7a08e9cf3a45973e2b9d013a8f242fbb1051a06c3d60c638920
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/b8/19/b26db2d0cc5599715e15409ee63af51b4d637faae21a98fe26d58354ac2b
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
