Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03D3CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B580E6115B;
	Fri, 16 Oct 2026 13:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 6RcKXtM92pBe; Fri, 16 Oct 2026 13:11:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 52D42611A2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156319;
	b=jWnzkot2LxyMW9avsEQX83vr5w+6oawyCFCziWIHi3neyVQYjR0c0lh+wVhH/G4cw4B2
	 CeTbEnOFq5HYjlYJqD+mNQyNbAMNIMYFFXkxvDDsJE7M13zaDJtOOIC4qfdR8Yy3OvX+9
	 K5Xel8RwJLWY/O5WyiE12uS0fRMUx0G1RmwvStWuazAf+eNPxuKU0kldu7zBXeCsgEu15
	 6UxMtoYw0GgCo3Mbd2HxWxx/bov4cSraaqHAtceeR2VJ0sVyLxjbt2MejV8dpUgXKoHBP
	 oWs/XEmuaf0MBl8Do4n7l1SBGVryRkS0pQ5oJkTrX5GmOI/0XfjivZ2Ez/sOHy4bfxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156319;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=H5rGTXwKTksRMsVhf1+AS9iCeNyBRk9Szcui7h3AW5k=;
	b=kxO3e0J4HZK29lIfzl0o6SRmV6Oo5cyMZBpPTjLTCkZ1XjKEGpkRpncNky0s/AVjOuXI
	 zJ/nO4e9I4HM9nchBjmYoQBLeOL5w6TQ85IdG+ZnbtXYwXYOVYJ4tMvPk/ArJ3/aatUFz
	 DGfzZEyGZhdlSh0nuvuHJ/4+2UuMxCL9/zYFyMlIANDBJguwiTt0x2ph+Jv8wYpHg3o5N
	 ojLxxkuuNmnZ1nRvP7D9BDk/EDfWxalMFivVSaI7WsgcTm4xt7cZy1M9BLkLGcJZb94qC
	 jXZNZkKMX8GOX3cLPogE4TlcyWJLwF1gwNPcgLEf0tGAHEf5CThdZU/lDjGQlRXvP4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156319;
	bh=H5rGTXwKTksRMsVhf1+AS9iCeNyBRk9Szcui7h3AW5k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dT2zxKTp17djwBEFZ0cwq2BtAdeSCK13JlJ1kv+aVszHdeGzD4eH0BLTp+Kwm3H+O
	 g1KhDXlT3SgVDOfOAlxhUYEdIweB7iLf28ueZf2zCBQY6N2kXg6nkR2JqwkrAgKC2P
	 rSEyBbVYbflF+hARrxoyPlGJAZYaGBCPC00omVeGYRqV70bphxQLSiZoHqO8bFTtyC
	 ZodA18kTPFN0elm58TFUf48Zben01jaOzIT/fBnCbZSzdL4Z5SY8ANY8DemxLTNKFG
	 VDK7rL5OAZ/B1lofzicyBmzXuQZy2bGPSXmapi+Z78xfSJOp11bdjdj9wLT0i5jaFs
	 r3UMxI/XloCCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D42611A2;
	Fri, 16 Oct 2026 13:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72FE0F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714D840042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxW1wG8MUN4u for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D0B644016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=e/V/SfFNWOlOnvhhTejjcYy5rpvcHYriKHkvKO1SSX7xFQEOwNBfrw69ntiQzP6n6QER
 NXvNnmrZnW2YpUsMeRUg0IVDHMHfEk0V/2nOjw27XVpjDlDPtMlHi1onyO5OHrw8hBQJG
 hxMixDy1iR1DUbOnin2TnoeufbT5A9TQzt5Aaqh4ovmwLOT5jDqLAJCEUg87UasjHLN/l
 LbchpWAUE8hahvWGIuMRDtkAR36mP5fhCS3nlfAuoaqnJRHQMcF75ugi3b6rUtPjz4yO9
 SUccI5TR9jWILq3G5QVjKFH3XISmb1ahGdeLUOuWBnA4SpMx8HDKl4C5OOqHjQkjHvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tzodUGwVtsDJx/fyK/ZbYK4r8vRxyfcosnKhqye8VQw=;
 b=XRSzXd9s+XdR27YGPNrYgu6Ef18Jg41Oxez5dvKDAZfKBlZ8jPVkrvcMPoRUJIt9tOqP
 q/kljhjpwyLWXy56Tfq+FkpPFwr4xycdCjOV+iuRqU9uwIAwoQsn2BmO9E1S1+GyKoHck
 JfNIS+WHbYwXS+gYL+2Fj7CD2rKUCoPfm2G9p9OILy8GBoSkPyHHQZULcHsVPJrOKm91K
 l6j1e4rt6gnkBqT4KZ0GdL+n/0Qvahibmq3iDHW1ItWAlNr5ls4plVE6SulB+TudaJTfe
 rKmVa0CBPnBa6nFKUyy4waA9COF3EY8PfdGZ7yl3tuUuByH0R/DPZlgzsT9wXdCOIyg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0B644016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C009395BD8; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:54:46 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0829afb150497b97fa2fdbf55fb8781e4bddcb6c
X-Git-Newrev: 8b5a8f2cc62d6505b7b2fbef3ec009a790c82754
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.C009395BD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/binutils: install
 libsframe to target
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
Content-Type: multipart/mixed; boundary="===============3125734666169219197=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3125734666169219197==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b5a8f2cc62d6505b7b2fbef3ec009a790c82754
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Starting from v2.40, binutils provides libsframe, a library for
manipulating the SFRAME debug format. Buildroot installs libsframe
to the target image only if BR2_PACKAGE_BINUTILS_TARGET option is
enabled. However other dynamic libraries from binutils are linked
against libsframe, including libbfd and libopcodes. Any binary
linked dynamically against libbfd, e.g. perf, will need libsframe
as well. So libsframe should always be installed the target together
with other binutils libraries such as libbfd and libopcodes.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 213e01ae9cdff5937d7022d53212aa9c9dd720e1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 3ee47793c5..fa57e3c5da 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -126,6 +126,7 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(TARGET_DIR) install
 endef
 endif
 

--===============3125734666169219197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3125734666169219197==--
