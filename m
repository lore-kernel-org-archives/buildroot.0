Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879FDCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE8160F0B;
	Fri, 16 Oct 2026 13:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UB_KWpodlR2e; Fri, 16 Oct 2026 13:10:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D826660F10
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156197;
	b=Y1jDKXqe1dGEJ3k4dIphAqC+n+bzEFVf61fJxWaku+BilQ/3ihAdqlCtjOVd5ihUlTwh
	 6Q5CyaNdPK/JV6GdKYhM2RTkFCEGGlC2J8SQonuCmviNUYDXl2VKtpmCMtJjzkukV98dW
	 hwBCk4BQsc/N41Q7UmqmA2L0y3oi/si/M986XFXY+nFYabobkv/56Ns6uRwtlpHVVBFSV
	 Vy6qXCys97Gct/RkPh26zuCHXBzKvpOj8we4KqRASjHId2r3aVwf9imObhMwQJpVidkyC
	 CeK6J5IxmgZCddhpvYhUovABXARlqi0llb/ZMU9uQLNKjzUxWN7d5UajuHJ05degEhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zPkz+kPl9hQ/q+51gJFuhxRksBj3cW6cvZIEjH0WNe0=;
	b=fF+nnqAi7hmchxNXhunEr2pH6cCsXmQiud2mMva49KPmrjevM9fuQVT5MxR32MMagU3H
	 kG40m7Vtxw5W9P4AK93AgEoI7NrjCB0vWv0bcnLyss6jrpyYAOv4iaxboK+gZRzFk2aFL
	 i5F4r66/DLTXVu6Jvt9TytYPfN75NjyOmoL+sFoRPTlS5nA+c1AIbcX/BrB8uTvj4GcMZ
	 ymOKmP+HGGr+2xDLPJ6SyWCchZYMX97a9j4jZh5uRVKCY7pJXM9hnhNCXEvfEmvbDJFy8
	 aoQFwzQp7J5cLO34RMR+dZcJ2xjFfh6C+A96jg/unufjOeAtzjD2RgSEOn6t8Lm14cw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156197;
	bh=zPkz+kPl9hQ/q+51gJFuhxRksBj3cW6cvZIEjH0WNe0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KvwEJGyHmc5dkaF6ayRRczPjCZl7z97SonuOAiHHD286UZkPIZEh5ynRgS9QYV5JC
	 JhHbTyPUeLBvZXaz7S9YxELnwhW/MC1cf8aQ48DG7NwPICdrFVyWLBl37YPtUixD7I
	 ItVxD13EddlUal8K3Ria3vyaZgg1YZ6VG80Rb8Frj72oSmz2ysFX3cQnyTQOnlm58B
	 cQMbXaZClmrbOWhhLC2OljKQVzVlypRGAqko10POukrMpE8f0EwXK2L5m9MSKi4ELI
	 hWGSaBNlKn/dXp/wdIy9PL4FReikjggoKRyUcokVorZcexh6f3xSuqJdKhJ8JkgcOw
	 YaP/ynPAo+f7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D826660F10;
	Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8D231F6C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7CEB80772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKuz6v76qIHV for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 01331814F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=QE2rAclN9gPu4lNjaooBi4clHHa4xtNONLRk4uconS4n9ctGuhpkHTAywlKc7ZB5AyQs
 Vt8Q1JOJXs0DKJXwDDzZGbsMfAG522xjs3YDL77nKk+jsXSaBhgchgz3MPELl9FiVjVTL
 Bt/tE+hZp4OsOixG9/RNZf/wV5ui5TxmGZsmSKbaKthZjyWXJylxW0KmYxv4IhaxvGRRB
 fgMl8OziigQaFZp2hnQfCkrb+0G8gH91MgXRT2n96CvaxOC6g3KO4eJmhPm+A5an5eMxI
 dF5sOsgfSO1cvlj34hEr8IBBPKBlQzOwId0sTb4T5hw5zHZvDcJrSUQmcDSdgj6d+4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uLzJXHdeVsBcZR3E1YRDf2ioV9POPWCAi6iqlYHQBvo=;
 b=g6i84bQDMfXEaK37i4JHLJdAKOqZDrzNgtrywxlemGLW7TRgQBN2gzuvXnRisGVnqMwH
 1Z61xCZ0h6DioVYu3JOXOh9v0CpTktgWarqiiq33kmjWzFkHtN+nJ3fjwmZRpmKetUY4E
 VceKnbeiKMvQvGPRojrc8zv6M5dgl48uqBIOotEsklIydVZtTykXESmAfPdZY70UsExgr
 zjQr0c4NH18/afzwjq5kg7Tj2Yro91nkIkf7/B5hN0zPrXbGw1XAuGRyaPG8v8IwlQBwy
 1rg8ASsLAnDNDar+Miyw2QwjdBTE/nqW3mzaP1me0ZlRfNeeEwyXHxpld8qHhqpLo1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01331814F1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5A6C960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ecad010b3602dddc7aef582ada9350e058dbd99a
X-Git-Newrev: 053d80d4887ca20fdba3f87d24358495eda8bb16
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.E5A6C960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt6/qt6svg: add
 CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2864823894322075283=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2864823894322075283==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/053d80d4887ca20fdba3f87d24358495eda8bb16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The resulting CPE ID is:

cpe:2.3:a:qt:qtsvg:6.11.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2021-45930

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 6d335ea39f8630b75c1563ea0a2e676616e25bdb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qt6/qt6svg/qt6svg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 08570c7f9c..db0b11735a 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -12,6 +12,9 @@ QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 QT6SVG_CMAKE_BACKEND = ninja
 
+QT6SVG_CPE_ID_VENDOR = qt
+QT6SVG_CPE_ID_PRODUCT = qtsvg
+
 QT6SVG_LICENSE = \
 	GPL-2.0+ or LGPL-3.0, \
 	GPL-3.0 with exception (tools), \

--===============2864823894322075283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2864823894322075283==--
