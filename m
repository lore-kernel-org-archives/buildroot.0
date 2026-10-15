Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1EECC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1ED66142A;
	Fri, 16 Oct 2026 13:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tE0QB4SEpDQ6; Fri, 16 Oct 2026 13:14:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B72AB6143B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156447;
	b=G4KqfWfjQqBDyhQDNwPlyRXsZmnJH2ty8Rr62BZUgIQkT2Bxzj6YXnoVwhcCTFzDNBdX
	 j2l25YAmeNCie9V4JOPJbRO0KkJukx/XURbJOM2wkhnA5dO+70ypWJ4BcJ4dyEQEkkQep
	 XllrusF1ms93xttv428vE963W75bGC8/y+bkoZxfOs29ch8u1UVwu5qjIWCxMJg0ja9NU
	 zOCOtgds8gkvreFlaCkvStZ/zdDAsQ5xXXWUKZZwar3teH3zZ4hfT/SnBdj7n1N+7jlOR
	 jEue0eKhmdNTT6Bb3Sd7iVXg0blQ67vsLYlRA9HzypLcEYJPDMucEQlmEL9tTF0TblQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156447;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2fNx/e78YbnNM8Qv7h8aj6+brLtbh2FgRHF/+510g1E=;
	b=Dk1ONaWFwVCZuqxygMgOKWdJ4i5foslJoS2bA94VNCrPEqrUJSwJf8o9lJstuII2KZx7
	 rrHJJLUfRdCY6z3CsuU5UgI5Bc1U15d6fxfOcImXu6ARIfpJkyaZAfp1gl/PTeLpFmHZG
	 liOMD27X60H6fH7T3jpch75GTAC01GC/lZSPSNojs23xgcfaFs+KcbOUJw45DhepcASRG
	 7x3zlh4Y0yEiTosVUjMCwjUdeopwdrIFKBoybE33JFoC1PrKx0FWiR0caa9EtxLZlagFj
	 Xp0SPzXNKkzNVbyujEGk1vj7xR+MJtvNB6WkenqCbjBUH5M7oOumk3h0ykS2AowQMZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156447;
	bh=2fNx/e78YbnNM8Qv7h8aj6+brLtbh2FgRHF/+510g1E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gjm8vX+mdVYFj0sQrdolWcsUnPPjxsFqOHb8EMBuXyE6hpNYIGQtjTchOEWWjuiUH
	 /NwZ+nKwEza7KgIw3GY3KGcrl8OsekR10GtDa8khfO/DUpxHFl/yfeyxS7PI/o20SF
	 7gdWOPQbbH2BKzZtMa14ojoxQP/nIbp/pKpM7lm5Zc6HkQjqAO9v5aI+COs+OV2WYC
	 mIZt7j9AqlF2K5EDb6wgnKWRSkwLzWKfRTsygFXNDvkAMUrlqzISSRLL+U00sFWcA9
	 Lw4Uq/VYi23Ue48O2/axKNuOvxxrsZdVsCvYEYRS2CjIfGdsdbiUEaak3b8CNgx+CD
	 aNZGtWt1Zvw4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72AB6143B;
	Fri, 16 Oct 2026 13:14:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BEE8769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08A6D60F22
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Kk2caTBDcRw for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A448160F61
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=T9ahZbvEg0mfykacFtXdsheud72jBN/042s92d80V8dLceAld6S0lpT+Y49Quh0b/SQ1
 jEanrWBlGnXmEk+K2eFY8HfRH7VGRH4HZJeWma5brO0RVbKwXVXF7wZ8TFXYql1VVHbZO
 cKYj4Mop8DxhtNC6BJdi0xCn0F3ifEHuRpsFMKg5AmYUUedjBqLI3FsV2E1FFTb0XDUro
 6BculOP8bnGtiHzsbpyLrYG3KY/x5D14PlVCaY6rmgK4mcPR2QmSxd/bxZASoFqdIhbVP
 FSP8VZ4hUeS/fm1xJzm0Fmvgs1cnux1pjBy8RGzcEFMlvl3Ehn2CUWqeMG53bfWDeBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2BjuBAPL19+rG4hqt8i8SSODqit4o6PW53JoVfaUmr4=;
 b=P7csaTHOiO0QSlmLNB8NB3Wn9I84lHL5MeQ027e24CwLnzmV47I7GCTJ1Htlprl1EWwt
 bKDVtyNRnKWu0uD6oYU+0S0yXms+YhNHZ2oB9Ylmw9U9fOWOEjXfYlq7jZLlW8nwwZehz
 fGtMFjgmMUNiup2bZK/GUYQ0Zvh7s2XVlrxoaOpgCkdcfVDNg1gv3kIu7Q43LhOBxCEw0
 B439lZ6eZ52gc0hDIEHLRfWPvlLaPBqFypVdugwMHbnJBGXkR6bMUIIOaNqFzAgOEb7VP
 i5Mj/SqN5/a3amN7z9bkvh4YtwpSBpLI3ACpAkwbFDZ+LqBnYHZd1PKYKnxVPSlrOhQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A448160F61
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93493960DD; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:52 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 03dd7f4a8f9d92ce94d4c1bb620a3b54338d0376
X-Git-Newrev: ede00e3bb21c734c7955dc5d4612164d8cc4a776
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.93493960DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 docs/manual/contribute.adoc: mention mailing list subscription requirement
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
Content-Type: multipart/mixed; boundary="===============0655957113651890413=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0655957113651890413==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ede00e3bb21c734c7955dc5d4612164d8cc4a776
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The mail address used to contribute via buildroot mailing list
is required to be subscribed to the mailing list. Otherwise,
messages sent to the mailing list will be automatically rejected,
as server only accepts email from mailing list subscribers.

This behavior is not explicitly stated in the documentation
for contributors (aside from recommendation to subscribe
as the first thing for contributor to do). This may lead to an
unpleasant surprise to developers, who prefer reading mailing
lists using archives.

Add mention of mailing list subscription requirement to 'Preparing
a patch series' section of contribution manual.

Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
(cherry picked from commit f350991abf13bce2a0d21a69b08f0e7a6a579b1d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 docs/manual/contribute.adoc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index f82eb14303..6ac75fb66a 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -380,6 +380,9 @@ $ git send-email origin/master
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
 
+The mail account used has to be subscribed to the mailing list,
+otherwise your message will be automatically rejected.
+
 If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.

--===============0655957113651890413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0655957113651890413==--
