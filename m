Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B3DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E235560697;
	Sat, 10 Oct 2026 15:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZw1ilsR_jjg; Sat, 10 Oct 2026 15:18:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1289C6064D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645538;
	b=FBFrTPADDcqy35qMQH1XiWdPuYKTEiHqE3lMgrro7y6jt9D6b0b6mNLkrNSbdo0KQvuh
	 B77tD4JWMggX6FRipZib4nY2BU115Mo59zqSsh1+IbL6LErHj5wWMEcDtGhiYHK5yjrjQ
	 A4n64IeuEu3D5sBhbSJPn2cscFzYlICy5dQah4q/4q/YspS2j9HofkXV+aAtGQzkpULAe
	 1xBGjYRYVB6B6yN4Bu65FsZG9+CpqaNtWXrvde/oYOoF50hmLkFxkSd2BRPLxvX+jwQZg
	 mZ/yRGLGELg/jFliWCgH+yAv9y7jjpiQd37l+0y272eViFoyHnZXpl7mxsn8CCFDkHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645538;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yhm5Ul9dr9vnEF9+XzwckCoFJFdjlGLIQpp2SMTowSU=;
	b=Qa54W4A/6NxAlJQ0ifBWK8250ZaoDo2SYg4jQsYhZtV91OklgvzJhtxzEVaPemaSqGJy
	 w8q2+sbqSmWuwSaYC+h7lS53xLUbVKteChERL6LbXtYPszeEh5XrSLsgjYLbfYDsehzQm
	 ztubx6YLJX8OOJuwV7U/5zracGeKWrAYGyswPsN9vyFurMpjy9Q8Et4/y3wEVzz1T83Uk
	 VY0Rbs5YovokGXkdYHAZypXnq6JmXvhekrpGjVz6sUsqfWPy3H5PNvTgHjveSfhiOZ+0N
	 el4aThPTfS3Ly3XVTEJrk1sVSV+nht93TZOkdWnMrIdj49fY8/kF0BtqQSHl0O0CwNQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645538;
	bh=yhm5Ul9dr9vnEF9+XzwckCoFJFdjlGLIQpp2SMTowSU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WssDrYP5Dlu2VxfJyEGi8ThnABw9aKb8wcLu1zu4p2fc5A75atIXkxs/xPL8v9luj
	 gZudfPVER6uMg8ggCUSMOdPAXzFNJZY9tNVuHl6jLHbp0znrM1YQmVlQ0P3aYmWkjN
	 HDgc+aaA/dZr9/uTSlZUbD+COIWldloR2e647Tm1NTwLo0CkES5NAdzoI4OmOQZP7w
	 YcCGeMdr1SAtBTv5RJeDc1vMz9TxB8hcFY0mTIB+BOBIZ4p+TreSPo6NJTNQ/Q8XaF
	 8f00BkX1ab/Zg8UmeR/YYnL2X/8NdxSacgVY23wXnxMxa954Dtf3UkRaak+6OEwhn/
	 XG9wRkTdfnxgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1289C6064D;
	Sat, 10 Oct 2026 15:18:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA69DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1C1940079
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DZJzBrDi0xf for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1519540004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=OWb8IaUdh72b8IEcTiyATLCGbyNCcscPN06aWg/YYhK8J19yLcenKKtDKT4/YjdvImMA
 MCpNGmp5ggaIGzEtWj4B3Xql/hQF6xUxFFgkU6YnXA6j2XSOJ53dWR+DxY9PO2CNqgDj0
 Ux2RxR4+8CjGHRUrxyb6qyKcJVg2zhWi8xCHPfMampi2+UkabTOZfOghEkbtz5j0XILLR
 F2HqQ+dbarRdeauzHa80EjRCa/XT1OLuxnby+YIhtJVVAKkQd1W2xyL/aIkJyU9jEctSP
 hi2ob7zBL+exF2arkL69ZsAvYx2Q63ztk6IgAvDM4BoGU6IXoSRc88nTce+O2jOipOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bRbR9wu0hNox46LdnwLjJli5uc5GXZ4ci5eLEq7M6Og=;
 b=h6V/E/jDzftwcZPZXrWTGOhAjqXVoYRJqgzFkbjCytvitH2AyrZLR9PUTMlk+22wt/r/
 sK9wfGrzXpxnVyPU1yK62oitjCBBv2M6V96mZfE/klnQdr/JZT4IfU/NAvfyF4pdXJEgI
 kT2oPQJcshobSyOrdp3YOARYwc2a8aut0R0k/jvYI4IK/argR1AI7EYKAjnUldN/7blBm
 PqnHYrjKnbBu4GpZ129LCpqtf0yG2JruwmM0kI/5K2FvS3TrMnlILz55oBP2TmYwvwuT2
 bakFlAVnzQxahlNN1xmrkuiNrqjmjk886qAFqpIZQzhaXzfAhef7FMkYb+guNYh8z3w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1519540004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9D5D92241; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a07499c8f1cb41a021def4752bac0429bc879da2
X-Git-Newrev: ee8a99137dfda8f7ab88ffb6586e3feaf152de4d
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.C9D5D92241@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/patchelf: add CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee8a99137dfda8f7ab88ffb6586e3feaf152de4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:patchelf_project:patchelf:0.13:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2022-44940

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/patchelf/patchelf.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index c583b228a3..911db48e18 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -10,5 +10,6 @@ PATCHELF_SITE = \
 PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
 PATCHELF_LICENSE = GPL-3.0+
 PATCHELF_LICENSE_FILES = COPYING
+PATCHELF_CPE_ID_VALID = YES
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
