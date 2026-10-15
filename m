Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF58CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662856134E;
	Fri, 16 Oct 2026 13:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bUBW1_nM3t93; Fri, 16 Oct 2026 13:13:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B0BF61343
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156399;
	b=lS9Gdrntkb/OhgYemLlTQuykFhbgixMCcTvIWz/+CTtTYrhXqZYg/F4nRpPYkhGQjZhi
	 gGAZEe9o81h5mrv4kPAlD56ezAN/CekYXlpPys+qN8sX4pcC9hAGckIq4U+SYjY4QF52E
	 taCz6whZOmKj5QE/ckMOhWBJM67wKJErTw6KHas3R44tJYYu8J75Q+wOf24Jj1jcI2cG8
	 ZLTgde5EuWP5zMw4gTCNlQMtN6WIQ3vTQYR+u+mhWIKq+lMwXWLPBtTnKDdvA9Mpbcc+Y
	 PAMnglLIqDG1i+y+kys2mYaS78zIx21Up3aY/IKMhqwuBdXr1Dl+f0GmCCJnl2BXRWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156399;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=v93AbeObLprBX0UFbteV2eQzjbsdzl/v4/VJTGf0YT0=;
	b=K2yXNJw8/4bLwoeqEDk+qYTzH32tCaK2sYBgdWid6vp7DGH3n2/gnBUtcrM2mWbXgb3I
	 3zM+Mi7ILZlfuyX+ekUtoYq7AReNaMtYXUpCCWcrmV8Jgd86brmxFhYlXGZbTSA/2/Ok/
	 dp/ueRVlAAbMa5QKq0NUSc7SrgGScGutO8T0mocnHRy2x9zF3LBKGf1Rv2vGR6K8TvaFM
	 Qq27+W2GeK4S+rgU4F/0PUc0/yo8kPRP/ZNQy4axYgUpjyJyrRQuHrPR56YXfOZHGJAQG
	 26ePeq0osfvX+Wb+e/Im4/23pJ2ZMUcJ1zU8FfFtr0ZsznkIg04NGZp5WIihSigSl2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156399;
	bh=v93AbeObLprBX0UFbteV2eQzjbsdzl/v4/VJTGf0YT0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LP2zW1Pcfjb5ueGYMCRiOkeWwGRg+VAuGuHs7H0qhysxqHqO3X1tq/E0gmn4Tiqlf
	 4KC7VOTY5cW69gw8uZXI0KSFKZSmtgpvLgSpoX5LZbs27EUN/csnnrbRXydz07l20s
	 dJABmJysDQ/luhQ3WTPD0CA4nDSmYpFd7vGE8AGRuB238k+rCu60WgFVfOMf6NTUJw
	 lCyfvoQbwCEm9JsuJPNZ3fXleFjp7AxrgHXaKF1LbibIxBgMcyYDrWWu291rdqUq6p
	 UbDOWZIS8lqud1crF+UBy2xQuLluQKpoNsnlEwiOFoACfol5OSAsz3PIRgDqBid7Yk
	 p2Owz+rPHm/xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B0BF61343;
	Fri, 16 Oct 2026 13:13:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A140105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CAF660AC3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2SkYdtZGSHp for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BD3BE60EE4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=J4UK9mWwIJ+cFGOEQ2f48zWR1y4iRJ9uNUgCCV4YgbkhOmtvLOrlu2t7Vrv5letl5rJy
 X2pvaOH0Ik+LhvXwGSOvfZFmxGAtJtqpmJxaR5aXl78ppin6j7tbAGC/gIhaKze9Dv2fs
 DA2juCxEFfywoHBWCHQCZuGYEmdVzqnhKPvKxFFwpM/6kbyEqwBB1hzy+36Gt0Nrc8aHE
 TiCu90x8wiGf92fUnxPgDrWKGG+k+S5pAI77gxVxpiUO8pb6cWQtnWQSxbr0+tVezn4HO
 5kLcR5sQiGnQmsJsZ2osIrpAWfpQWZWGdb/hyZME5zsCIMH6zCn1CQacfe6r0fK9MTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pdFry4wETsAqizNgVKOfyKiKC0YfH4ObWb3Eznt9aqM=;
 b=etZ17vc0e8pcRWK8vNOcYbONwEt/ig3YgSYRw3PqTDNoB8S323f3rn7vhD98l5LnfYiG
 OrN9oQWJ3QRDzdIqi1U2vMSOngEoP1l6ECoVI18iI5kRtcwTbpqKhV1dlxH49fvDpqD5t
 cun5FAgle10BScQ6DMUbMVSIqU7WDCmLOmEkONIs03W6HziXH1I5y2VGYIbft1z0rtOP9
 I95kTV8lvxn0CCz9XNHKrKWtZwnnbK+wI+xDwcZ8X1tUZ9p9cqJ3PQichvi3GXTf2mqp1
 9hkJ/HH4MDYs7RWOudKQWuKvxCeDY4pxyi4++NwrRCxgpca1Fiuh/RoEDYmWamyz/pw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD3BE60EE4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAF23960D9; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:36:00 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: af0cac3258101204bc288e7bf52c4efb8fb1cb98
X-Git-Newrev: 0b981574068cdd6e77cd67ebf26a66556bd64cf1
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.AAF23960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/haveged: needs
 threads
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
Content-Type: multipart/mixed; boundary="===============3487769184335812461=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3487769184335812461==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b981574068cdd6e77cd67ebf26a66556bd64cf1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since the bump to version 1.9.15 in commit
2a28d25d0c61 ("package/haveged: bump to version 1.9.15"), haveged
unconditionally includes <semaphore.h> and uses named semaphores
(sem_open() and friends) to synchronize command instances. As a
result, the build fails with toolchains without threads support:

haveged.c:37:10: fatal error: semaphore.h: No such file or directory

Add a dependency on BR2_TOOLCHAIN_HAS_THREADS. Since threads are now
always available, unconditionally pass --enable-threads.

Fixes:
  https://autobuild.buildroot.org/results/814cb7b5537d8b7b2c23f3d90e37b2b41de7ee3f

Fixes: 2a28d25d0c61 ("package/haveged: bump to version 1.9.15")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cec5f7af80a564b8862aee71e3cf516b325e41f0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/haveged/Config.in  | 5 +++++
 package/haveged/haveged.mk | 7 +------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/haveged/Config.in b/package/haveged/Config.in
index 0e49a2db7c..8862792824 100644
--- a/package/haveged/Config.in
+++ b/package/haveged/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_HAVEGED
 	bool "haveged"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # semaphore.h
 	help
 	  The haveged project is an attempt to provide an easy-to-use,
 	  unpredictable random number generator based upon an adaptation
 	  of the HAVEGE algorithm.
 
 	  http://www.issihosts.com/haveged/
+
+comment "haveged needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index e22712f016..bf3209cfdc 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -18,18 +18,13 @@ HAVEGED_CONF_OPTS = \
 	--disable-nistest \
 	--disable-enttest \
 	--disable-olt \
+	--enable-threads \
 	--enable-tune
 
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HAVEGED_CONF_OPTS += --enable-clock_gettime
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HAVEGED_CONF_OPTS += --enable-threads
-else
-HAVEGED_CONF_OPTS += --disable-threads
-endif
-
 define HAVEGED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/haveged/S21haveged \
 		$(TARGET_DIR)/etc/init.d/S21haveged

--===============3487769184335812461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3487769184335812461==--
