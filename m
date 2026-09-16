Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351B7C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E627480AF5;
	Wed, 16 Sep 2026 19:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vovaCtvp3rJQ; Wed, 16 Sep 2026 19:10:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F2027808AF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585812;
	b=HDwlb70YtmcEXcPWtGS8zz9N8qdKdQb89E03xmiWBN0I27L/oxoM/jbQb9vrayYEUrfF
	 NEd5oq5bsFYs+AKg7AibW/y9RuduJFPd5nRzOVktkjm1PEbswUqiiEgnApVA3BOudaykm
	 +5tKvDTU5O+4UTYUHJhjkd45c+SHHaLDX9gN3Nia/OqmRK0D0d3Pnj/tNU7UV5ezOkzVr
	 pfi0w2eLmCBP3SmPxzMNy7q7IXs51/426fUcnqDNIOxufpHWDo1vZh+aKtTZSLBB37Uxk
	 GlSPasqboFv4pbj8vPrQ0hdqvav+paNECuoFXq3TialoBM9mmp4NsVPEIrflGGK5TVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t2K/wnBfLx3Ieo+RREKPMqKBmRjw0o6klW2909kc+kg=;
	b=BTiYzlCEiVvr9wTG5ACkHnAZHt9TcKTTKieLUhmfNvQaf/V8Zxjw5guhn4yPy+I9qItv
	 FwBey2wHgvAKkZNzSjnxrSVfI3wRnV0++aI6X7GYRihXjUQ7K8Is1Qns9OoMSO/kZ0YuG
	 2RTKUxXwM0qO9o/iD3TTqdnp1lWg3KheCRhXJIPtIwursCGqgvspN0MNQoXICujgYCKz8
	 MES759UQtthCW8K/uYgU1ZjQFu01tjJoiNyAfAYfGddkTTaimKI/mIFujnh+u5zPRqbLe
	 joJ3I/tH56pbPYqBc9dXrOxh1suTdKS18w5XT3c3i6dBnqg+qjDs3WjVa2eoZvqEjIQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585812;
	bh=t2K/wnBfLx3Ieo+RREKPMqKBmRjw0o6klW2909kc+kg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KxWw9OMrYyiEAJUTuMy7g4mfiJpSG8U8GhFsf1+72rztIzzDiZ4FmD3aqvMoX/UXU
	 bziQHSIfO3zxLL+v+WgAgJ4xsQ6+Hui+TZqy9H+3QquOoLkLqOFjvlly2FGdwgcv8N
	 r8l6HcUI/CsZhdoaSG7IDTlEhm1GTPPt1peJHMkzYMZw4EIVpLxENFSWTXBFgM9qcH
	 r7qevNL/oE5OKzzNrxhusmyrs3Qz2rxy2q0Sopnp44Oni1tYzB703Fed91guLgq0zq
	 68t/HT7LdkbsH3yUxlLU0/MrGyvjpkrC//O9i0G7hfYxxOKJhjn3eV3Zobr+MXBoUH
	 +J/1ZShs3t6FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2027808AF;
	Wed, 16 Sep 2026 19:10:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 435787AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28DA880A91
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2DG-qjnDoIr for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7D65F8085C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585809;
 b=QL1cGI/9PFVjzgDi8LtpyfODNcK6V7zSbqoXDvbECvZYHWO390w2fPJ02zbleAumr+Tb
 EZiaJ0vV8T5cTqzKprksF25pYvsTDVNzOUTyH+Tr+WusPMPZiLVHKoN/I2gI1vSUVGg+S
 dE5R/YHgTUOa01ljqGogunMHICKYTlcbqoQKrYIF69OngVH14Hf1XhvQKjTksRnZIDdGF
 Pxj86hRPyTR1cmgQbMmEGS0vm3fxTslV+q/Fs2rlGshjg70K9PjRvwXtL26vG/IYwH25m
 lFr13ttbfp56PuRUtNytDTHKtSfTO9hi9bN0yXKAr459jOouwlS4AchkxgYN5QP6CLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585809;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1t3VQ5rZ64gm7id+9V1LP3EhhHkZcllfM3rS+qQTpxg=;
 b=D9IwK9z2yGybtTT1cE0XmpfyxxODHPrNwdPDfr2iyEiyQ/ctflOCFwCXIPkK+2nzJ42Z
 yJAwDVgiezR6LHQox699HgM9aN5xnE8iI0caD+HU3HZMCW7JL4/ilYH8b5fe/kyaMEcNy
 wy8O9+NsvRFZPnmEY35pGmVrxheDqWa6zQINtQm/+3Eq+TUT2DlSwq8YX8evoztk9BOKk
 0rnNf4rlrZebR776UppdPKXpSKfW6l8J62d4X3d9eFNnvEDLZmJpqPZxh192ryGwSSsmr
 VI4Su6PE5gSgg4nVGhfkRcc4nAXheEOdaUECQFerWD4m4Styq4BuRy7n2igRP1usR2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D65F8085C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 121B196862; Wed, 16 Sep 2026 19:09:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:05:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69863b92c9cedbf7a8aa490ccb0596d3dce1bd53
X-Git-Newrev: 885055fe7805c617a551b15b5624c93043cf9293
X-Patchwork-Hint: ignore
Message-Id: <20260916190903.121B196862@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-libust: bump version to
 2.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/885055fe7805c617a551b15b5624c93043cf9293
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.lttng.org/?p=lttng-ust.git;a=blob_plain;f=ChangeLog;hb=c896a32e65fd23d30ec541f78e7cb5867ba531c1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-libust/lttng-libust.hash | 4 ++--
 package/lttng-libust/lttng-libust.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 946b22d40f..1f82e33b5b 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.14.0.tar.bz2.sha256
-sha256  82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763  lttng-ust-2.14.0.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.16.0.tar.bz2.sha256
+sha256  1e84e02fa1fc1261eb6cf3d14d64006506a29f7c605ac85de02180318c6aa38a  lttng-ust-2.16.0.tar.bz2
 
 # Hash for license files
 sha256  5a93d5831e1297ab10fe643e1a631e83be392896da14ee2951285a79012df69d  LICENSES/BSD-3-Clause.txt
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index fbd565271f..7ecb18748c 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.14.0
+LTTNG_LIBUST_VERSION = 2.16.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond), BSD-3-Clause (snprintf)
 LTTNG_LIBUST_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
