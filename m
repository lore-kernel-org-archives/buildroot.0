Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64156CA9EC7
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3763760697;
	Sat, 10 Oct 2026 15:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNhb-sEq9yTB; Sat, 10 Oct 2026 15:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 466856064D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645548;
	b=CRW6a5EL3ZxyIMB3smWkAZSbMiNxzrldgzST8pa7Ir5miW5pypfjlpCWfuTpEi+yhTOV
	 li3JlJFvpEfOgkohfNUHDSYR/aTT2R5kt9tDzWEg/Vk1iSD+Qdihgz9H+cR5mIHBudPkO
	 nc0CJkBMsHAg+tJ5HM3mVnruXT9ckY5OQ7NDSNBIsOB/JrfvQG3w6LgJbDObfHirD3KcW
	 5iwCByCuOsXB1MQY6P2B0mzzLzNf1qRnqeyRsgU/vKIwltyrY1ORfTBeGnbwrU3+7XKCo
	 fLj0Rxdi5uHAuT+Hlej5qXztYSur62TU3livBX6Qk6hIeb17IwsGzM2bE7wAzDbRz9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645548;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=V906r//2qwxZVOrtexkduE3eJXVyRWE4PZu1MzhnJkE=;
	b=nEbG7Cl+OQuX6uZ2qBleJOL3cV+fyNBcrO08kvPPDX4hfM+GzkFLCqC64/CvtQN/eZLA
	 2wz/OkkAlC575wUDgKk9FCtoJObyA1Wejd/G5UQ5GeqqGwI5rVktcl3GtgGOG4SbMxFBx
	 EvA7jqoLV61OPMyr9P0Kf3H1HRBkwABB/O3fvqGjkfG7KJ241hLK+rSQt8iJ4yZAb1Pmn
	 wijB3OMisTk47Jl+CkAAY9jK2gXP4EnA7q6ir3E6n8LDtHhx99bga3z3fRUpyUhKCLZt9
	 5doO5EgbwmZ8m3x1Z4SCcrcmiVHn9Ndqgdb5vtzmAyZH9FKP1bY2AH74M8iwKAZOBqQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645548;
	bh=V906r//2qwxZVOrtexkduE3eJXVyRWE4PZu1MzhnJkE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TUiWJ7GsgfmknOjGKzuVpdzKV/bicoBjnNtHCKpQMUBKcBlNueh1bENww8+BQvFVh
	 k/6wxp7/0S7u2cqGUDDNE7niFx4fcg0ERmQi+VJiyTQKfIARc+K1j3c0X5cwMAc0ir
	 ZNXtDWFEU/7ANdcDYwT8syvM7VAaLHo0jDy7+IcD2CQmII+PD8e3KlcRHHE08QLSIM
	 mkT4Antc7bno9k841Ac9FA9IRz3K4C1hiiULRx6SK9t5aXbEkSH9+rHhHR2o4we6Cl
	 SSnvqN8XQDU9pdHwov+jkMYFCLfsGtufiUOi/oeT7CUvJs/WM0KsEgqHQA1g0CWYwI
	 dgIlYuaZPRD/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466856064D;
	Sat, 10 Oct 2026 15:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 212E7356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 132FD6064D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuBq2mS_byRD for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2CBA3605DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=D+Q3j3y1cFIjFH5MWhHK40tkMVcuD0aV7GBPvZiInvThKvOCcpihCEny74HR0C5+htTt
 gMXcSwHF5ulnvSecpHbUPjQIsTnLiAli7oL2rVhh/pFQ71J3+N/t0VMK6lZKPEGYCWZmw
 1r+a/AkU3CootsRuGwfi2Q95lMOWWLq8a1pgF/3Krh8WO8WbmQvCGUm9r89UHOIZwJvlE
 a2IjBb3G9FdlyVkZynFDLitf6vfABMxJy/ocPoO05PLIjw68THFhayfcxmg5m84x8/D5I
 JBKAFrJZV9VrsPMtzqwl/Umf2YjE0LL6+CpLlvkI0nruaNrHirw80n2iABDz2AjTYvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fC7uEffHdplaNXvTARql8Zy2X+UlYgqeSjRuVpipDwE=;
 b=UXFzKpvGY2E+c+4qyQmfCuYO0cr9qZmhM7I9qN8iv5WUjknqzYQBW42MrtQ3KPr5K/nH
 ifalyJFzsebJDqGPMY03n/sCsZK94GtIn1MLCiiLln8gpGezBB6KW0mtGL6m0j2h1ybMB
 DDoeF64GmB0J91OeZjZVqE8uslVWC7N3s6Ls3o0Uvlbb/gk100xRWOk6wxDyZ9YNsH35A
 H2iYi9/dyaIzqZpGXqRZcsVX3PBdznNZMfDgcf5fEmKMIyhM1v+VzYmnat/g6D+IkQJZg
 gYX4vcpN+ChMB4vBbr+8w1OSGIxGY2vMdd+Sk+WVj2XdSC9zyO51dZkDhLcnKNZjR8w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CBA3605DB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1F8D9222D; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d335ea39f8630b75c1563ea0a2e676616e25bdb
X-Git-Newrev: 763dcabf6d09605da81515562162ce7c595e85fd
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.E1F8D9222D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/seatd: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/763dcabf6d09605da81515562162ce7c595e85fd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:seatd_project:seatd:0.9.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2021-41387

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/seatd/seatd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 69be691cf6..c317d50016 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -10,6 +10,7 @@ SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
 SEATD_LICENSE_FILES = LICENSE
 SEATD_INSTALL_STAGING = YES
+SEATD_CPE_ID_VALID = YES
 
 SEATD_CONF_OPTS += \
 	-Dman-pages=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
