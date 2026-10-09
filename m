Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9862CCA9EBB
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 21:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C54781327;
	Fri,  9 Oct 2026 21:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qrrwas0AYiIi; Fri,  9 Oct 2026 21:13:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2DFFA81488
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791580422;
	b=h+Z2TVvdSf9CTtid0qwje0lADMJC82z1GR/827yeMic+asv+lW/Oa1UynpW+sSukWQ6X
	 4bei9lyc5e5apXVrVhbhjgDHKittUwXNlm7dobRxvCH9uYI1+NZfXAl5sq4kgR0trVJTf
	 SdmffLGVZowX8AHi9V9a14iuCQ+piK3AKgPd4yDYgbV23LM0xUORSRe8Xo2V+yrdWkL8p
	 tJyJUZbSy9biMiLILVgEOwSrpfJLSHQUpcPgmWUIdYDxg0U1WFznpb67maoMYmDOCE8jL
	 JSWxqdtOWo0T+zj9PkphtB0BauswcKaPzJ9FjMYBBS2L65ec7N/LxLCMlZDmF574jwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791580422;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bw8JHP+ArEmVA9NHpZYAi/Pj9BDsH10jLi7vvHeBiI0=;
	b=r6hIDpD+Jz56SJ37jTPzVMpfHNh52A+dgvvUnR3nTppq6bsV8V6Ya1Ir1EFfKVa39RN9
	 QO/azmcqzQaAxBpjbDTb4by/dnuqJsq8hCA9hXyekzM5bp8cgmVrXBgbwnYJmeupY998b
	 u8MKTbJITypAVIIEoJYODrQmpl2n+NUHYydBfLE8JVhvVUDaCgpuTzL738hAvYah8CB4M
	 B0a9g+LPiQx7Yu9pweYpEGLDQG8ETt9k4PiZmAQhaWUtmu9DH1nETs5e1Hgq8vF5Fq1Bj
	 v7kdez4FnQ7bFuVjYj+UHUxblfKY8WNvr5TXNJdXMeQkBm5j7I8POxtFsPSwag39rvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791580422;
	bh=bw8JHP+ArEmVA9NHpZYAi/Pj9BDsH10jLi7vvHeBiI0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ipZ9aJtcvsXjpTr86kcgjXQxlMzgAoBwpFxONQi7QWdd3PYemZM3IKQZIN9xvMZyN
	 jZryxihXP/v9X816t0eMzRmCou9WMg1KP3ZTrC7zv768ydmAiNVQzxr/pDeImwef/c
	 RchxofOWa13gT6MCa7x8n6RjH/LAFt+dWMusyJ21fauV5UheVtRrA/LwphdV6UX3/P
	 mqhqtg6S4WoL8GvWo5QbI9lvNihP0PWFOlMDmKcfW8k9Pwqs4rDz6z+TVJmV+lvwQ1
	 /11+LSyCioWdqNc7EW/fLEJf1MaiHVmTS7iIbd+0d9Nvaq81iiwNkdKbhTO2uGOugb
	 mBxX1mw6ol5/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DFFA81488;
	Fri,  9 Oct 2026 21:13:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE1D275
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9413A40934
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dq8IFYrBLePL for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 21:13:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DA64D40931
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791580419;
 b=KlSjh92PMWPz55IEnVLBtVJ8AJU+M0c/qi5m6b63te3hdEolbYyqHPhUv6QiPqspGLYw
 dWYmtrJBljSaluXb/AltTbtKOToocy+ew95+oklgqylVLntDahVfxKFGyYUFHuRzf285I
 MQ6WW+kGpAXo3NDjfsfl1AiZLXmg4dFS+b5PZwJZxKPJYZe3YVg8e2xDMIQYIpT/tHLOr
 9lvfDiSLTBRgIQQhSlBLDXqgXiWPkx3xrmElSUGw/fvqM0X/q5Ha1sP53SpCJww1rWgXm
 gQkwW741PY8qTZooIK4BMtuaz0JbUZwz93+5ygKaozymKfgFoxmy2LzRs+JgAlCh2Zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791580419;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KGnU7b0GOlym8koP9iiR1OFLo5Bf72fSoGRMuM2boIc=;
 b=te0duyGRa3NJ/pUpXM66Cwpu/4cJbyL9Qn8EB8hl/k9qpew6Ev2RW1aZGCu8QpffKQur
 1e7f+clWkvuN1MoRUZZaQYeyRtpKWyooKfm0mCx76rdsE6kAbd9aSgd1q7NdcPoEyV8Bv
 yblB8nODnID6fEN07QEtoJtlngdQHhsoBslrpPFEWDrnEctN82u7JafkLSDUOGvEVcf1S
 CsiHa2Rrcd0HtwAR+pwxSHKfupsQo/PknpU/mjWAlsP6Pz7k0VNHCGI36Ad5vBnPO7f2s
 w/jKSHsaANnd5rdUuOd4N0M9B0S11JbpaU23f2BWlcW1opRXCoC7thOZZh8Ic9Cpbxw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA64D40931
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 21:13:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E20988E263; Fri,  9 Oct 2026 21:12:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 22:25:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e34594a75228ce545098c82746d717b970f9395e
X-Git-Newrev: 161391871082c9d363d7a4ff25d68b8f6fda9807
X-Patchwork-Hint: ignore
Message-Id: <20261009211221.E20988E263@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Joachim Wiberg for
 firewalld
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/161391871082c9d363d7a4ff25d68b8f6fda9807
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ac338dc8..c703e50b14 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1668,6 +1668,7 @@ F:	configs/qemu_loongarch64_virt_efi_defconfig
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/firewalld/
 F:	package/inadyn/
 F:	package/libconfuse/
 F:	package/libite/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
