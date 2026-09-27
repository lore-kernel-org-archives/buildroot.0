Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DAFC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCA460687;
	Sun, 27 Sep 2026 10:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFh9bnVnl5M7; Sun, 27 Sep 2026 10:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C70F260644
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790503691;
	b=GBeeUfValujusZ1BCGYPxL0m/nF9ycu3M4IoxI8EQoz07b8rabkdxjPJyNypKNFqPvkv
	 GuNcN3xcTQbczgmsnwKNmk8dgouB53hbeFHWd8CScvgqPXfhoALan+dvTUfUFTor/YlCB
	 1+Hz9MY07/aP6sI30qGk3yRwlMpZT1X03WIhiebNbwIitryhXIaNsK1B3KPdC0e/CSTFn
	 JRouRbET4/pO+jpoU95rrX3oApfQbeEy3iZEG9TTh0MWyBrdtxRwgo1rwZMvqBvf3092R
	 12rcdt2JXsumkUscsW8G0gk9S6Citl9v4q5lmKmC7+z/oYtKP6t9FPGMQi7LUdu0Njw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790503691;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6kqfN4qDywSTmUCZ59doaRRrX4BDVeg9yWYvMZnGfII=;
	b=Fboi32MUSC8+tbhxR01slxm1FnJTygZcNxyRR8irWRAYuKlARkpJ20dQc4dpKEkqGpnS
	 EPKYL7+qHMvc4AXf9LJRXNI9Cds0haX2bMnLpsvAyLc0xFFwRBCrqO2feux/eyY3S81By
	 6gQJluhLZAsdrVnhp0EVnVpS23zo9pdOABW8w/zXzELUZRQzd+0HcqUTI6A45zmVP9O+A
	 iddAZFhUHD9DijoX1Y1pAJXTS2KafShAke1t8ZgJxoLqs29flcnxnZ2+W0+c60Tov/izW
	 ORQfLXEMfP8FPMcZi0yrvXKNfjgSCwjpUR4o3IVHiyWnFlFI9CmFld1Z7LTF3xV+mbw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790503691;
	bh=6kqfN4qDywSTmUCZ59doaRRrX4BDVeg9yWYvMZnGfII=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HszbSJXaIUpAK+e0x3Vu/62aF7V1wqjyLxqW7y03hHfpSJCNoWmyWR9JjaKyCGo57
	 klXQ+xuyYbhKBn6M4ONwxiuJIoyDUeENRaYdLidTJmUNmerBqCFnQe3vNxsHaaeQbO
	 bVBwRUiqC1ca80T9QKhy9dEvKN40/ofxWWRI1WL5sdDeFXU0tnHdVm+2mNqQZ7HRSq
	 lZXyClMlXM1elEhWFuEOAB3iZymWddNrbarWAvx/IUny/iLC1gtUsrhAreT5edU7Wb
	 8PDsmP9k/XK872/DfTil6KYVZkV/Bg3KASayXQGi5ipwIDsTXklmahjqhF+6oZSE9u
	 KSePz2Kra6FjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C70F260644;
	Sun, 27 Sep 2026 10:08:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF529422
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53A860633
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gK0Wv9Z8jZSA for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9E07C6062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790503687;
 b=LU3akN/Tjxc7+gbWlFCQKxOPoAj/rxcs9ImlrQ4mCTE0kMMpMCtDQ0WIKlhgf5h5QxEk
 wuuJtlwa31DQ6ahhCDZQcv2OZVks7F7ARXL//GBaUvhx3wh7qhbpkfCFFaKxPdTXclB/4
 SEJs6ZAv84fbo0FjRSrf6boBCY0570JXyWnnqB/s2WcAkgCawl9ZpncU+atyB84hOJ6Pz
 DQwkIA81zO/lVdJLrqkTmnhO0q4kIcCsUnZXN3xnKNJqA/+jpDUlR8mctVA2cij3WbzEL
 Ld8NSF5dNBHnRDYnQesE8K8eXJ1RkVcIKTPF23Qq4gJBwMWztTKt7rEe+HknQUi2wCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790503687;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=EqM5i2L8Y2EU1YrjWSF/PBTNCfzklTP6ZByAnvCgu7I=;
 b=mE4Ctv0uF5FugUwxhpcfHKblQ4SmAEc/wNLUQv0YI0wIon76SIehnm8DHYzdwUOpkjmT
 bzfthATOHPw7jJJeNCOvY4NNF0KygHazwJX5DitQDAKiw+cN03TGlatCOahO21WX2xIMI
 3yvc9wi6e/Dn8SMx0BwLADWJCyIeqAzW07j9ulwRbymkVe33w8BgGgWHvycfmdIJTWJ5I
 hsoAuDLS1qD4dFumeQeRotrfPAH1Kg+5noo3zPBnia7rhDi1D1KI7EVsS5c4bCi1NY2g/
 0JQR8JIG69HFPCtUAa6QZZYnezEU6FValNKujn6ekjvr2OLBYyh6ITfyyTfip+gaUpA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E07C6062D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:08:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC0C591045; Sun, 27 Sep 2026 10:06:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 10:58:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b19b1caaef34d2c2aa0e4ad35cbc2584531d0b0e
X-Git-Newrev: 94143f61e409b03e921503f476bc67f31e5745d0
X-Patchwork-Hint: ignore
Message-Id: <20260927100655.DC0C591045@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnftnl: bump version to 1.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94143f61e409b03e921503f476bc67f31e5745d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 1.3.2 (for details see [1])
- change sha256 URL to https
- update coreteam gpg key URL to newer key (used since libnftnl-1.2.9)

[1] https://git.netfilter.org/libnftnl/log/?h=libnftnl-1.3.2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnftnl/libnftnl.hash | 10 +++++-----
 package/libnftnl/libnftnl.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 1182d31fee..66b27fc221 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,9 +1,9 @@
-# From http://www.netfilter.org/projects/libnftnl/downloads.html
+# From https://www.netfilter.org/projects/libnftnl/downloads.html
 # Checked pgp signature:
-# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.0.tar.xz.sig
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.2.tar.xz.sig
 # with key:
-# https://www.netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
-# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.0.tar.xz.sha256sum
-sha256  0f4be47a8bb8b77a350ee58cbd4b5fae6260ad486a527706ab15cfe1dd55a3c4  libnftnl-1.3.0.tar.xz
+# https://www.netfilter.org/files/coreteam-gpg-key-0xD70D1A666ACF2B21.txt
+# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.3.2.tar.xz.sha256sum
+sha256  c97abc3409f8fa396b4462b2bb7f147a3a47a4ddc97cfa0b2f18890c9cfde8b0  libnftnl-1.3.2.tar.xz
 # Locally computed:
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 26f112c504..2ad05ea13d 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.3.0
+LIBNFTNL_VERSION = 1.3.2
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
 LIBNFTNL_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
