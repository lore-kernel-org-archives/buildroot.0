Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC90CA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 14:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 105A780DC5;
	Tue,  6 Oct 2026 14:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhiQVyXmBrOz; Tue,  6 Oct 2026 14:33:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 31D7C80DAE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791297213;
	b=CELKrWX/9vNJFU3D/jPVEaji9QQ5vrXWDjggbysZ6hXp4VCthUljFEkrkgW4NvuBkN5e
	 Vbo+J2OE8dpfIpDE3Vij3i7jXmP2d3NRXjbazfcDLoqfVC/sdAuyjTTPJBwvtEqEinRkc
	 ihsgaZyijgFSeCKo1yvBt7eOUAxM1xCdh0BGpOirfo+/n7dNiQ3rMTiPCD0j52PTLHw3W
	 oOdVlKIF3tUiqv9SgoPB+EzjufGCQnaaCRXZHvOaFhiYwkguvIgh40zvZpETRC/04agYo
	 FlwB4njSO2x77cnPet3CJarchXggHDby/dE5XSXT4kg9L/J+lzWpfhUkNUKon7pnhsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791297213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qXl/AnJ4Fuf7FVcw8LJg/8eXBcUXkmBWcfA2Q+C9Sh8=;
	b=rulg/88zlXZR3YeDPAejF4sm1RKqpdBbFYJhS8B+vvZ1Q2wcKoiS3z6lajgJMOz+gDSw
	 pjnpZnXL+pQDbvKO92WBshwgsCpdveYANgT2HOe/3R0+zsfvQGLTaeU8+78fq2hd42AVf
	 atJRhSdiLP83MUqxgAZ8VAxD0dCDdia69nUbFD+w37XZgtSNX7g9RNqrlvQfLhyOnWndA
	 0OX8GC/ls5GEnJEmIPhwd1lpVSUw+y+dFMDYKKyMVWWs0jh7xm3e3vAaNzN+/mllwX1y6
	 xvmX7b9U1aKcPzYwko3npyIzpkX2pWc1+ZpuZjBVCgisNi6f6dpxvlaTm4NRtvdbXdw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791297213;
	bh=qXl/AnJ4Fuf7FVcw8LJg/8eXBcUXkmBWcfA2Q+C9Sh8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q2you/h690L+I+xTd6vlFp5WiHy5hBen0sSqCBtH9SG1acU2Wj0NR951SqYW2Fe2Q
	 b208mDO+CkIsRi9qiRrB96qIwb3rbgKf8wQ9W5bGpax7jQvwj3xDSBIsyueUGsDV/A
	 MLj0OyyhYqiN+kMzF4d2BAN6hnc7PIN6Bbq9qtE7jW231kw6/Vx0MOCT/j1qU2ymG7
	 +0MkGc7uj2RAbyJZtP5oBwL5BadCZ22f3JNOMHSMeqJ8Y33elkUkObNnYQajX8uiR4
	 TTY+wYPLlcEq/VrA038vxy+bxegcjvsezaIzbzaT2+bqidgVRlcNQ5lU+hg6wpa22/
	 mT3Qp7JRdyxLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D7C80DAE;
	Tue,  6 Oct 2026 14:33:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 318B71D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EAF840296
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSVkr7xTnerW for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 14:30:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 54C2E4027A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791297043;
 b=o58GbGISP38Lik4L8xeSrZPKlLg12TgIIBtMoQPuVaAPPc+LjcX9pAMdBz52X/v9av6K
 05SmGebtaYQO+yirlU9/HzLL1EGVg07Ss6GvupV+kR58/2/ZKYAjvpcClR0rv2L62kZNq
 a7qBke3znrzCcp4A39N9rRmrciR6H4Tps2kPrAgP7g94Y9CVY35aZumsv2xsBsqaAq4XU
 FybJb30IsYwfCjFTTtsQBfIhgbc4r4eQBnmU3+w3lmAecyFyI0VEKQa5Gep4bLUMsH8Qz
 qqha98ncTOKBTDEbxbpyKD5Qza47pSgnJoeLx4IoUiBTbjfo7zOmndihsmFA5zMTXcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791297043;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=he4LZQNIO9IbzJiw/Mo0n/oV66BaWOTnVryG+1Y6c1Y=;
 b=hpP+vGDJINpO+udxEHPO7XizfZRMbF13GTaOYCOuQZkSPczW7fIZbII6cVelZJINhx4R
 S6Q5kNKqPbTQb3w+MVxZKnuYs6oxcv35Wmy0CfqelDVTnfWMTs/pK84K8je/ikp6WO18Q
 LnHQZqa7Ys/Py9NtNgywLgaXbQ0RaY3csw9rfeGQIPXE7xb7ba1QivLxOdBGUGF7065NI
 aC64NNde9SAm5h6MQ1/TD8/Mrh1Up4QhMHOSdKWUnxJjhyWVMQVgDXqPSJP293IU6IIfX
 mbtJ6i7aHfwHUwyxzDjNj8qukt6NixLaMs/M9GoHM6xGAa2ELMM7j72mY75PN7PEjRQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54C2E4027A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFE1F8D749; Tue,  6 Oct 2026 14:29:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:24:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40c2d541c03a1dcce448b3a9d7a0ca2c4bbf9527
X-Git-Newrev: 5df4e2d841df404014fafee0a62061c7cddac279
X-Patchwork-Hint: ignore
Message-Id: <20261006142926.EFE1F8D749@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.6.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5df4e2d841df404014fafee0a62061c7cddac279
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/p/fetchmail/mailman/message/59406635/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 0fc6eb55dc..3c41bbeccf 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59396310/
-sha256  fff279d7ffbf4d9449110f715c0deb5ff5a2b13b317914b6f2c810ea12a0b7e1  fetchmail-6.6.8.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59406635/
+sha256  3dfc47192e76099b5614f2b2a42198cb41fa05d7ca9b5073e08c051e9be81435  fetchmail-6.6.9.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 92cf3fa090..35f48944a2 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).8
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).9
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
