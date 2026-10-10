Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086B2CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0768608CB;
	Sat, 10 Oct 2026 07:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4SvnVE7gO7l; Sat, 10 Oct 2026 07:57:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A043E60649
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791619048;
	b=R2r8+yFBKX/q3CMoxByGpg1H7FaZVLB5qA4lMOBS+ARFW1kwR1/4vtZk9Ea3gO4JTitB
	 2SJ9aknsrecxBVPlC37K1DW3+tKq/dmmcaphEdyPaK/TA0bOJXIw1opMkmYNpyLxtkRfp
	 s2XiLhRsuycd+iZjTAX3Rbo9sWuQ6xN1Tct0/6hstvQ2OofRFk6IkUr5x3qKsEz/3ytzf
	 Ies8ZxlnX9zr6ZytpYCyVepTekE2xmhDdBTsKTnKtGgMNNbql2doQ405w7tAu2O9z21e6
	 gWQBm8lKCtHuJrDHiEZATNXiu2PS7F+FngS307G2MXAb27veL6HY8ijrDCU+iu2+Few==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791619048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/EEr8vlu5EBGXujkkKcY45bxRkG5jvrljQ1dwPy6GDA=;
	b=NdWm3bKiXRqMt5FREH17ho5so3qVX9tOhJHSSDAShsssrs7Yx4U78716F8mpq3hUR97s
	 +/yZiGo2t80ZL39yFq0lrZmFs8CmoRO9GbCbQ85zx3jn7lReTd8n4NiFnZRU0XSwassZv
	 0h9K61m7nVhb8tNSGvGNWJYH0+T/l+XLaJytP5K9HtJXXyCu+hPUhqT+VGchLI2pZevcl
	 C1qhrBPzDRh/7EnBfLR/FYs9PgOctnF9KJVjw8FFhi71R07PMB7BQzTr3Z/a1ej9iD1to
	 P3nnfc6sPcGjAccK3CVQZfOkLpRIX9BlReLsZsJlz/BexfWNfebZApeZnK5vIW9eZIg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791619048;
	bh=/EEr8vlu5EBGXujkkKcY45bxRkG5jvrljQ1dwPy6GDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VQtPUVOt13x/BehPHKjLIsVhVPuqlcpTVUuhWRbRpDZ2iNhLKQzIgc0c+Okj0Xay5
	 Z1xNBNxhWlvmy8qBPMxyRp7MHGWwgMSWdO1ZtpbzNkG9w4DPrroFBMjVWbYqZwa1Hn
	 fBLjUUxOOHo0YCZ5fPTselRDHd4hOUIM+ispmRAoqlabS/W9ChyNSKz6IgWhrmbI3X
	 hYJhdZATTqKN4bcEPLO1OrWotbPBbFAx5tH04ylCeiavBLJPv3o/4xsAry9jaX3cUL
	 Qay045zg5PHn0Y5qa2tJ16zD1qvUn0r+zvbI0HqLDsvCM5qWIl+5QNK6TwT3mNH87i
	 PhY1t2ByqG8VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A043E60649;
	Sat, 10 Oct 2026 07:57:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20959111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0728A400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZDRJ_AZi5Sc for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:57:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 54D734006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791619046;
 b=dDZqhLPCOYuAx6ZJ1+GkWYqhnYPK1Aiqg1iF8UN476wZTgStqJv6nYo8a1fSncDOXLJC
 VETg3AF2HiVL8aQ0akCzwSgpMd4D+Q3k3ISDaTj9uts5sRbaFwrPttAr8pHz8W3OKOmqM
 dNbILZtEm8zq+EKZpVExHThXrEzr4wYATvDk0IKBpAfV3Ux9gW2M2+VucMShQx1CQeKpI
 idIjfoVsb7PAzlo4Pk1CF2Csvj9siVcFervsMcgHaNxLRbpcuPB1zRgqcTouROoJSzU76
 GTsY2+8ulgBYEomGFTHbYFssjz4hKhm6v7F/f9ZWOrrtXoyNeJr167yJSZEOhwN1jVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791619046;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ug1xQaPOnrKUlAxyubM04huS7vInaQej5E0Dj0uDJN4=;
 b=NF/mwkw6xut3arADYsd+tJSH98G95kR/yjzbr95HnQzr6OfhV+oM2DlEd8DctkyB2Vi1
 L00NjGaAehbU8GRTxfdbrpgbDSnHji71pa9o2gUFTgo2CT9ONZkRk4/knN1kO/5XX6b4I
 MYmSKCq4y+CvWcGeXIzHCfgNiydKvwTQLAifFkgHZxIgTYKfDf6CN5yJkKimmmi+w7+Ed
 JkOnTwOx/6HqmXEX1136i/pb40ukgOuIeR9eDscyklLyurAnGpXdoQej9bK6M9+5eDrIW
 rXjAi6itYRLiHkTmYN31bkhdxw//yKVcpxJFuGvWR48qiY110VxwjYT36at8rjJvgIg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54D734006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:57:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6A2D8ED9A; Sat, 10 Oct 2026 07:56:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:56:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f1faa2095853a05a877b1246b60b899029e5197
X-Git-Newrev: 197dedbd0af29e3a407d082cd5b9cbc7fb79cacd
X-Patchwork-Hint: ignore
Message-Id: <20261010075606.B6A2D8ED9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-socketio: bump to version
 5.17.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/197dedbd0af29e3a407d082cd5b9cbc7fb79cacd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-socketio/python-socketio.hash | 4 ++--
 package/python-socketio/python-socketio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index 11c6557077..4d08c01e50 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5  2020f7a9aa9fc74786ff2bdc8b48a68f  python_socketio-5.16.0.tar.gz
-sha256  f79403c7f1ba8b84460aa8fe4c671414c8145b21a501b46b676f3740286356fd  python_socketio-5.16.0.tar.gz
+md5  dc6b5c68686cf88a4919e83fc0896719  python_socketio-5.17.0.tar.gz
+sha256  c3bbfc4937dcfea7c4d1b182afa94d4a30335d153987e8f2078b344beacf95a0  python_socketio-5.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index 2c6b581c1e..a3a47e43d5 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 5.16.0
+PYTHON_SOCKETIO_VERSION = 5.17.0
 PYTHON_SOCKETIO_SOURCE = python_socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b8/55/5d8af5884283b58e4405580bcd84af1d898c457173c708736e065f10ca4a
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/b9/04/8647675c93b5e74a3daa41a2a03930bac0cbdcfcf307900f0441ae6550ba
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
