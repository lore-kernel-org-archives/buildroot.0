Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA11CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8562440D7E;
	Thu,  1 Oct 2026 14:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpC5stWE72mf; Thu,  1 Oct 2026 14:23:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EC82740AAD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864600;
	b=jQ9udL/9pFpdT4vBH8s0CHNOQFmVD+mq1rXsiTeyfHz2PJ0qFeRUi8t8x/99e7gY4XTE
	 +SM/wqt88zfr6TxjcIC2SiYAh/3duzmjglwAV4iFeTBGHVpVi8HLme+kdfcoxkOEM+Lgv
	 1D1bWUQBBerIfrH6373l3j79KIuC7DgQkIOFcc6uj7cA5kJZSeJf4+tTmT7qlHK/1PtYS
	 0VpnV4In6f73a9W+06W0LZfFLcn/S6aPMUWP7dlgwrHXRDZ1/71DnBK/C7Wb+OD2tnXq2
	 iVJ2f8fJgOyT1oz7uXnFqM1a3DPCT2KZSNM7gYQGgWwxHx0OIMGtDKRwsc3A2cXSP8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864600;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IyXnnt4rQEfx+U8e7DrrKMTEiAe9r5iFWbnDB1vsC6M=;
	b=MuqZD2xYfZHoMzIjf59kCA5uqIiYwaXLZGrfWa3nCW+JVhCkA04wyP6esM2Y3D5b+Oqn
	 w9DQoii9oNKXM6EzmSeZsMtWa0OPIcqFko0A2wCKVQMuGWIjG0ytaUu5Ld5KhSewv1a85
	 XpBVmmo2hCLC4fd4IOhpXE24IGysc0p/XUtg96Z6IsVRElFzRYPBRh06u63vmeqUDYoPC
	 /rgTrYQh13H7ZBe3sD1LLGBedo8PM1KASYrTWzis4KnRQ9L1hmPxgmkg6EeEfdwDDzKe0
	 gUe8lALhurIqCbTflJoZp+sm9n5fLX8z7KEZwcNKisSDUwgNd09cGDGz0lj/AvaRVvw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864600;
	bh=IyXnnt4rQEfx+U8e7DrrKMTEiAe9r5iFWbnDB1vsC6M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nn/BebFgz5NpxtooJSo4xTUnHjkmpcsSTzXrbWmjq2Nfqv3T9+FPgkV+f0JiqCNpF
	 PLQmWvmTabv/7YG+snEh1tDUpDPWAQYkXFi9nxyAOMxFumQ0nhLcFXZkl/Rjdh6BGU
	 UBVfaycraZ2X2kdLQX8EENLLUyT5LUe7VOzvRualbdoK5qqShCZrkNYJk6+9gYSxxo
	 BCOJySxnHdT0fWAnuek14+rS4cnDTZGgED23uEc12k17qCZl6bTER5nlrDEX8kPOQs
	 B6npmfen1T5NJ5VBMAloPyMLU6dBZakl0Rp/y74wisDnhZRpMFPNuH0PyozNk7BBdB
	 FVAGi4yXH1b9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC82740AAD;
	Thu,  1 Oct 2026 14:23:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94B2932A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 910E240512
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jddknxt2DPHo for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E0BCC40528
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864562;
 b=hTMji8C2ujJED8Fhg+NyL0FbvjM5wV3CQEZpYOsolLXh0fC7vmrHD/bcNsuGoP+UTbVA
 ldqm0IUsxiI1oItM7ED7XuyFaLcLpZ1GOpBo5UlopGFjrZiofVzfmWF5LVLXJSyrzzFr0
 k6530x9M0gtloKBoen0RKkUP8sX5y5dX8YKQ7xogSQ+vZgUAGCznaLn9JqdJ4aWsLIp0n
 5wiLG/E1pZurbIND6/IlfUUcQ0sma7N7f9h+qgktdFsfLeXsDC5qIwfjO4rDrqd8i4vgz
 W7cNp4TEcy2WaoxKBCimiAOAMISaLhYJfhK6/iokqypfA4IlyTvJoYbcwb+/r8M35cQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864562;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DVodmLvUvprOjVtchU+/aYCJIdNw0KemYvfiILcg6xw=;
 b=YlQAdDpFrQqgwEx26QvFYV5jsBeI4UZNDgfGyTttUE8l3dqLCbyF6p4nXoGJlkmMSOXK
 XBlKu6kt7QrPKlgtxNyK+4OGNC9Xgf7W/9ROoRu/2bmWnmspa95fkzKLKdQVQf99zfhGe
 LvFHQcktkYt0f3ul2LLhII4BxNRQKvhu7m2esMED1tlSloQcsHyd4hkKUmCMYgBEw4+oH
 5ZRFPg/9e++9JJkUnaNo242Wccw4b9g/9ye3BA9vhjKwaRnznY07vtEUmAX3cFiZ4T5rW
 zxs2rcA1v1UFT0MH56eh/xdm5jQ8NkYGi2+zXdyPmr+E2CloWkXMHNhpT88b/3Z7QSg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0BCC40528
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 271F49843B; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:07:17 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3f0be30e3cae01cbd4bec36658d77f9b44e20975
X-Git-Newrev: 0dd1e48c4d1674d2d078e480b23515f4eb9a77b6
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.271F49843B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] DEVELOPERS: remove Koen
 Martens from capnproto and linuxconsoletools
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0364866594215344364=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0364866594215344364==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0dd1e48c4d1674d2d078e480b23515f4eb9a77b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

I have left the field of software engineering and will no longer
contribute.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 81060d467fed41280001ad1c31d002a712b2a134)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 932cf47da7..ca2f7df2b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2128,10 +2128,6 @@ F:	package/rockchip-rkbin/
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
 
-N:	Koen Martens <gmc@sonologic.nl>
-F:	package/capnproto/
-F:	package/linuxconsoletools/
-
 N:	Kory Maincent <kory.maincent@bootlin.com>
 F:	board/octavo/osd32mp1-brk/
 F:	board/octavo/osd32mp1-red/

--===============0364866594215344364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0364866594215344364==--
