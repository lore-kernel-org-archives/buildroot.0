Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A998BCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EDDF60BD9;
	Fri, 16 Oct 2026 13:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1aqP5qs8efGo; Fri, 16 Oct 2026 13:10:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 59EC460FFE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156242;
	b=DVaAWEAaZSxNkfTYZ/gTpXzRVzmtr+l3FGpdtyl7tFcT/YR0Gaa5DlM4dF+jTAHwCXSk
	 5uSbREGr095Ig9blTlbGhihHJKdeXnWBHgzoMUzQMHGe+0oFiuwYvAGXJavU+541LFLKf
	 SBudCJ97fsXMOpHa4jyXyzepGe1Qjwy1chgjJc53VTr3Pm4YVbZ71h7T2FOL0EtdNBxhM
	 YxhsVVTvKVHdnad4zUCacNUzm+UtTdqwVbx3boB2Jf3QyWdfB+rzDKwe0LO3HxEOMbLrL
	 vYD9sVy5x04mOm6e4FFOKuP/8M9OUCqJUR1qb3ebYzRHQhpvTohZfCFKC6XzgpzNJ7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=yC6Pcl2r5FZphj8Ow0P2w8Jxx5qULD/0RZNRrzha9Zs=;
	b=rl3LPcqJk/ISiih3mFzzeIjUjj0h3fIV4A63P04qDPJzPz0vtXgr5U8adYtIT7afvkQT
	 l9YlvJkjwjFzD997yA1g5dKDWzBRaHKOGbo1XsPLGyG5W+a1r1F4Zq8WWQvkcSRu4Uu93
	 gWHgdbWM4Goy/YT2cv8JXEjTiSGTyALGrJ1wp+r2nRb6ENI70DCuGdkyG7JbI+tAodBZj
	 he/48V4KYYsG9MntNzs4U4u3DUD9IAGbKJQdoN2YaMCXlWBnMJ5+X02WqSHZvwCN+hgcI
	 Wg0MtrY10pfbDr4mHdLCY9ktY8Z/+51lIOMz5OHynr8x+f3EHFATBVqGMze7J+mCSFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156242;
	bh=yC6Pcl2r5FZphj8Ow0P2w8Jxx5qULD/0RZNRrzha9Zs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bOiGwvN9XB3N30iibyNt7rn9F8uMDrX8Ut53hP/84Z4e0kvy1EcsJItz/mxzHEEoN
	 vVpNyZumO3RAU9vOwmQzLe0YBzTVT81AS28mXvYmjYpE5wgo6A4Y28EkmLLVg4L2gp
	 Qw04Ye3BBCPy+dJSS1R9Gr7ve4oaiip9PEqVabbygb5EqNWTBIpY9IgahYLPgUO0lA
	 cihCyUNfPoq3BZDUHchnMHa11CzlMnpKcwT35rfrJoHnvUzp0o48oPGmY4KTJ/3OaY
	 TfHRDx3B7YaxI5H10QAgbrbx5suoVqm5eDvEvkBU30sS8n+g/+KhesskpyZd669baK
	 IWyHx8MP8lMRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59EC460FFE;
	Fri, 16 Oct 2026 13:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2614BF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18958814AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VC5IJL0hqC9U for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E56A814BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=TzhZnfwM4egasR5Oe+B2gmm4dh2hwIKnXxSAL+cxZ801Z+aEUD2Xr2TdQTs25XhjrYlW
 nkOpHghWZlclPMksSf5ZBXB9fb1Fw8Hmgw9a9CJJIUgzUsD7s/DblhMWsS3Ej49cea8BM
 X3gY0u1AmG9lGheQpCeR9QaSWGWM8SS3P1P6PtWnD78ZQra2Ot0dbR20e7NJEDyXpKriF
 f0n+PY9rPm7D5ldMG91rci48QTzS1YUB3wI3w+KQHpqXTaPkFHhNpSaR/KJwIZKh9glvL
 vNZ2NGL8EG80kKvsoEsBLW+MJEcVWoqLSUH5+co7lBIdsApGkzLLo9eIVY+5Tq8bRCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9WjgLkWf/GvQCNo33RCsdpGaqbpUGXz+5MlRRJMTnqQ=;
 b=QCccEHNRFjzyFgHovEQSw0te1Lsr2vKW5D1Cg+4DjSkVENMpl0RE7PpsDAbrPkR4OI/N
 USDAVVwJ2DTSrzZBGHPNr4o2MWVVgsIY+uxZcUjWKwxHM+wjA41OfJ34EeH1toty/ngbJ
 6Klry3NeX8w7w79Y3Nfl9Mx1+1j9oo5xNBZOXgcb7xxURSNQpCElsjP5RlGgkU3dN1GcS
 PT0Yy0K/jcqAYJ8oEZoVFjexufpvWuet+hWT1OmkPtWEwShmzGODc+BCO7j6DCr2xAHPz
 LD8yyWGHePLzOb9ZUwGi8Y7TKDsnPGmB9noYclEdiLisEQbeAl0nYTdEbHCVpeM8rvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E56A814BE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F708960D5; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 450eadcd0ebba7fc7d3daa81bfb3cd20b9df39d7
X-Git-Newrev: 4817c8adf2129b1f4c499c53a1612f610160c8ab
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.2F708960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/binutils: install
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3961962630918590956=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3961962630918590956==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4817c8adf2129b1f4c499c53a1612f610160c8ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 33cb29557b..b11b1abf6f 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -110,6 +110,7 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(TARGET_DIR) install
 endef
 endif
 

--===============3961962630918590956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3961962630918590956==--
