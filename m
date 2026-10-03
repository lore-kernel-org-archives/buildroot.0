Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3F9CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF8C8174A;
	Sat,  3 Oct 2026 14:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlYe_4viZprm; Sat,  3 Oct 2026 14:08:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B61728174F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036512;
	b=NZqnuvJlNkVJZpyPiX/4Tjgbw0jMsUz0xALgXhdcPkxiHM1yDwTKuP2CdVbesZpB4KXI
	 KaDunhQDzT9SQdmdXcuAIRVfxdvJQJ1SUPvhp1QSZvHc30Q2Nkm7FAxFnjNQxE4TjqwAm
	 TOMhdU3qubcyNwvxaRc+OfFx9lK99Ez62z+CLd/z4H8N9IQCkzj9+DN6izLscXLxeNXbe
	 hbAC5FJrtTp6mxv9BLj4e6Bs0S1VKLYsNFnNRfYvwbPNxYqQwF7ECpf0IcVVK2PlGE0MD
	 F7DF5mh036n0tGDL2y41NLpcYYJKwYqihOcwki+mJuUQ9FKUCFn+EHJPo1Cxt1eDzZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036512;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0tyXJG+0UWDYUP7szadx7r9qEgHqaZGuOnCt8mOFTgg=;
	b=azwjsgd4ON/+78tP10z5VRwZgZl5wbzAfpOaxMagVpLxULpGkAcXPTTLCmTqSXdsSRDt
	 MWsN6zbnPqmsoDJAOiiqIt6A+xjEQZ4xEjN0puD6DPv8dPVvM5z4/NYDTUk5T+xweXVCx
	 hdE91l5B7lXdfbVuEgYGZmW4ywjKHPlKRNfjhSFU19sDTJQdFp9RgMQBic/JSDX77G34J
	 4H7bdn/PLPSIKA50Ormgfk94FMP0yDC8KRBRvbS/5ws++OZah1XFz/b6O2VUBvXrb8tMD
	 /Y61H0CXaxXfDkdQ5U+zbqNs3h0ZDzdssJyN80kbRpw0gvYgUZJY65VZ5/sy7QenUqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036512;
	bh=0tyXJG+0UWDYUP7szadx7r9qEgHqaZGuOnCt8mOFTgg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fui5cjPFt3d2eyD+QPTwasfTYRm4CFMgXNaKSQxq+qmpnoeIMg6+AbbQ4+qxi63QA
	 G7JtTh1qBHe7kSyyfDDJzBYWvzx0SqjQtV/wvjnGip424/SBQbJObtnrrxKDX2zUQP
	 NyxxuSjDefmHICah1h7SPTk7QwMuMtbKhBech5uL7dXkCSiccUjgG8FcTq5iCLKn/o
	 MqUMeruuT6ccos4ku2JaarThSGcXM6HvVwyp+/r5MDyd1wPKD1+u1V8lKKvULFdu5v
	 d/q77g523j1ai7CVQFOii78CfWuHVdME/cII2Tztco0ACRb1/6GX27G/xf9c43L3SZ
	 i6CN71/ljMptQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61728174F;
	Sat,  3 Oct 2026 14:08:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44A2A1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42ABB40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nK9w_XuauORy for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:08:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6E8FF40063
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036482;
 b=dru4QrRm5Vl6XbyLUlDZ+b5ZskkMD4xyEDcizwx9uR9m4IQwdLS61YoY0PYvBY+0yVFZ
 q6qLMQ+8XPLfMvBh+CKT6cY7j2DMeC758enuiddqylvfrKAIR6z8csnndlqlaO2D87lwS
 8jLkrxdpVqLSuBkQ44zEma5DEIMRHH2mGY6BRsoOk/BAe4O+GG1RDXaSAVyRX+x9swUfM
 ZFlV6B1J1VNZ7AJOJIO5lLIAQe6vZHx+KhZ5JRtqglcL+AzoFC2rQJxQURo0Px7LfTx/b
 bf5Fdh5XYRdWATQY37kIYQJkEt8XIKR1hDEFE69NKCG48IvNhyNfqTbz+fY8BakycZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036482;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rl/GUYfpK+V1bDUVL62acvACBuOOYYrZncYI0xidsDk=;
 b=CNR6mgP6z33bD+NJDoggYPxxKugEd75qiYzzWMB6eL2MGfTjMMvnwYReyYuhEwL3eyTv
 ykUX1JXSGNP64t44v1drPWm/9s/jV9zvnSj9z/DqyNpoXn0qJsh3ikEtFOY724BnDJzfM
 ZL4UOUAwefQYsfa/sJCBiPk4H1F1P7eScR6/uDIi+avbk/1DmtBxh1yCzTnXuOqNPA3NZ
 oNDSiVEWrWwL2aPDRFBoVZEGPuYQJ5/0xQM5vIr79+VzRjtkRcF54KKdjd1Ra7aSzkvYb
 FIkQJl3srUKhSnb7pBPCUijKDp5cTtUpxqCO2XXTAdsSSZhG8SHjVpros4JrenuHK+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E8FF40063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA3BD8A518; Sat,  3 Oct 2026 14:06:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:02:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5a5aa1853e211881f28fc75527cdbcaff1df5c1
X-Git-Newrev: 9c76a48cab84b04c5124fbb042fde194d54ac790
X-Patchwork-Hint: ignore
Message-Id: <20261003140647.AA3BD8A518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lsdbus: bump to version 0.9.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c76a48cab84b04c5124fbb042fde194d54ac790
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-lsdbus/lua-lsdbus.hash | 2 +-
 package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
index d6f30c0529..430d2c0d51 100644
--- a/package/lua-lsdbus/lua-lsdbus.hash
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fce5db789b18663c5c48010eaa0b3411f63a7f0b3c70c761535c0d5e3f9f5e11  lua-lsdbus-3704232a634d1c866275b9a138b860421fd1c8ac.tar.gz
+sha256  8315e02c6bdf92bf02c3ed600d12b0eb24cca20c56207a67698e18ee3c51e3f5  lua-lsdbus-0.9.0.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
index d398af029f..9c58ee9301 100644
--- a/package/lua-lsdbus/lua-lsdbus.mk
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LSDBUS_VERSION = 3704232a634d1c866275b9a138b860421fd1c8ac
+LUA_LSDBUS_VERSION = 0.9.0
 LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
 LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
 LUA_LSDBUS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
