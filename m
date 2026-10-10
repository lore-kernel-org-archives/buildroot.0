Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F73CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C73C9408AC;
	Sat, 10 Oct 2026 16:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcVyZfaaBRPZ; Sat, 10 Oct 2026 16:44:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF6F440882
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791650689;
	b=o0CbC4/YCpVI7JKfr/jezC1BSsrEanSaIIhpgpfh4ChDeKy1UBTek77QrCrWgvZXiOYT
	 PZNKj7J9GJrRgd+PMxgWQIIRepvCue/MLzjZvRLNI4Jia965QA7l7GATNfTdFKAd1FJi2
	 8944cBLBl8gszrlsskffydVdAOB2wZ2KRQHHRjwmekxhN3OL/y/gNUkdilPK3Y9p+dRd7
	 hwyDtjp177gKFu+2PTon8veGhR64LCZctbnU99P5YUYfuB2AI9J5kBPu3KtkT1i7De708
	 bcA5rNQlfbPPstG+3ck76H3L9nys2rQ5Dt4b7CPHh0n9JSaPqzm+79RzwpVSULe2NSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791650689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VIe4W2i5mgLVZ8ukyl3A1ivijsJ5GU+HyNYL4A9CxzA=;
	b=T04g/B0l69UPnzktOG8AY1t6i4NFSdsSda61vaF8tSXfRtbBzBAiFIPd4ToldsxAy3XL
	 NXDoZE5saYR7PlGWE77lW7rVX0Y8Jtqhjbzz4NR8rY/BX7+tm+tQiHUKJMhCRyPH54a9I
	 iW5uxT5vUBrNfcoWR7CKqSb6o8oUsDUgqZgNjfUIP6i1P0Z5VxxNeiH4hy/wzQ4LaHX2+
	 CNMqJCPYpQYOyGCdIvfYKdOSjTXYohef/R8GgBpqM7WeMkVO8HiUNoR1zrIDjShcnB7qJ
	 O0OhHhnMb+AVXx9eQAKD+7AeM26xB3vxeqw5GWSrSPJUGzFPMykpROpZrS+gEOXJDRQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791650689;
	bh=VIe4W2i5mgLVZ8ukyl3A1ivijsJ5GU+HyNYL4A9CxzA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vwnc4ltkDcQ0vFQSoCNMXbg8509JSCr2IG0DUODwvhqkb5HzueDf3KZ5Y5qaIiisc
	 YqR6+CVg2TU6KemS6pC6s0bJCPyFbUSZFTm9XZuObYPKhAqARJ1VCoZ5h3VKkgxqSn
	 YZcWK4AmOPxQjea/KdJoO/Re96uOb4hvg3t+itBqgbJenLkGJLq88z1zpqJ2p9mZye
	 tmcSm6hioe/23xuh/2/V8XApHARAxMSjWDpXG+jDTupVjgMUs8RJM3NZ4XtaxX4DOM
	 ClgHJDQlGDRik4udopxo/99RmBWJlVaV1v+8AdKzQj6iTEio2tDdO1FTssw5dvYJYH
	 S0wFFFkvEf+mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6F440882;
	Sat, 10 Oct 2026 16:44:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C780E156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6C5240882
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScTs8Vf_b1C1 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0C1C8407EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791650687;
 b=g1CEUF8bLm8RsslIQo2zfQW/TG+SM3sKObF4J0bxiD+I7zFBdCMs6rOWXrDomh+ffEqo
 ypWu1qWNHNa2/vqHP5uoG9/DZ4LFBYKtDkOhtB4VRDzMRtEJ1Rb8tw/jS5Fpl5gAEGp1B
 EvvhkuBzoh7lQ+Gvoc48RX9q06JzKF/sGwOuz4QipuS4+0d3NTaCkpRVsd6l8Dk9Isf5H
 5lmpdokMdDRqOOzLJV3zQbvvF6vaH6xcdd/oF1rd/RGf8QRT9ickLTjnQcgTVakH7BWPq
 2M3UkrPw6+oubG/iNrutA2Ab9ofZE4NW9pT2L1fa0xEQWv7F6Jb6UvllBC4iu2+xV0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791650687;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LPdL14yVoWEv+s2QLaMtFv2Tc9fR+VYULi9aaUScnhU=;
 b=DVrI3hVxY7/UlU1Di3xDyGfQLXp8Svv9cKJGJLz9PkGXalof3ePelhDZrdyCyZItK6oV
 awZYjhXhiQuz2q5tCZgMy/7ggJK9KPv2fpwPw5KspbOLOgl4L7O/0KEj3EnA+OtK+w+aZ
 rPzbdbv9ZVY5ymIlkPFb73Ec+EqEWX/HMJufHUe/2Xxfi5MaUqgRe5Xd6AYYZEOirJwDt
 +a6M2K7wdvPje0B4MFdcRkKv/NVIxlmlJkSPdSrRnHXXkWVBfASHUeJd8IknV2XvVq4yI
 JN7YrG7ttcFddIMkup6nGxDFZQkcY/Y18yYqt1FdFgCbAsFZ/80rTMGCDxXmJ8hcvcw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C1C8407EE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B679B92BB6; Sat, 10 Oct 2026 16:43:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:44:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8697b99a2ebe6f2f2c113b74c33f93eb9d849f21
X-Git-Newrev: 8caac27d69f54eac96cbb14687e9d54797de2354
X-Patchwork-Hint: ignore
Message-Id: <20261010164328.B679B92BB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/versal/post-image.sh: add custom
 hardware support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8caac27d69f54eac96cbb14687e9d54797de2354
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a versal evaluation board
to a versal custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 board/versal/post-image.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 3242e4384a..4a810ff15b 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -2,13 +2,9 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
