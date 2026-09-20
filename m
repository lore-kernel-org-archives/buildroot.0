Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4853FC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0679580F35;
	Sun, 20 Sep 2026 13:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTITPjvtkmNs; Sun, 20 Sep 2026 13:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 09E3380F2B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789911909;
	b=ddPvT4vfiEdeXzvCQrbFahLArboYlxvcMrFIFGCLRtrsYkJLXr9gs31Kdi+kfQU5iXYr
	 io5QsjagM5SJD+a21F5TUaupUa2zrtmQE3IunDLG3zoN0zH2fy1cDRn9ZxsE3SwbvFfPR
	 F6fWguk0+R8iUz8jUO6KVIIldjEVAkOEGZEZ8txWlWtp89ivn1mxxD5fJ4Gb6+ujgmiiz
	 MQc/+YvDJat5fFset1NK21Fet/2J4mqJurO4Mrjf99/bUBkbJxAlgCPeichV2PH7wj588
	 owvAjoxoGI6J/RPRc4ECrvttapmHv8xFc4TJrnBblb9DNe6zDw8iFWnsJNeJJIegMxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789911909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ic2LVYHyZOPYlkNr2XOJy0EC/GzIcTQDDgRhBozKrJM=;
	b=jUwBtKpqC1xs0tmiy8yL4uiAJNXIqRw9BnY+43VS7ZUT0PuBV2EVgFaPRCNQ9QYM0YFX
	 BPf4WpqoK2whtcvZPVAXkCGBrq2A+pR9NmWW8f8mOQs2VWwgrx3jmCLHkTd/p7WR5P2c0
	 rXVoytnrKsEZQK2okOm8c9mJqR9OrSaZi/Az894rzfsUzYOY+Q4ipxezESVttBEZyLyvy
	 FUi+dJc9zasK1Z2zHC197lbSpnshETeR6LMtDiiEH7N2LyiRr1mgVfWmsOougr7poX3VB
	 q8He3TIDzsX1vWt86MFw4+OubzULlEiAKBPMxRFyTGeh+g9/ebHcS6xctfsXKPdiINw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789911909;
	bh=Ic2LVYHyZOPYlkNr2XOJy0EC/GzIcTQDDgRhBozKrJM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gzguFA7RSBLOHvkNEAsKKceXPz71PZHghIps2SKGeEBO5u8TazL7zq78KB8ewoY5j
	 6wf5IwSOuaofrdrZ4ro4bH/WWw8ezcw1uhAN5d/ORWaE3c8bZTUB3Hu73xOd5ruPiy
	 QyVaFslszIw1+4OCzo8CqUSGe15B9Mt4RDjoe08GtA1u28faKAo3Wp6lDQNB+ozPat
	 lscFpbYI/OzpbSABSFkUWDQDh1K5uVMcCypVs3b1J1V7msvEhjbTLMOUXoXGjtBIw/
	 FPuqHGWCEggxa8sGCeuYKqw+l2Kt46pQch1ZG6x8Ayo7gRz+NSuS6+pqqiUxxsgf6u
	 oYxc62O0pfKNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E3380F2B;
	Sun, 20 Sep 2026 13:45:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BC9D224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80DA180F2B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgCThRFgYdvP for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:45:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D0EF880F01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789911906;
 b=jsDNmXQf1BTS6/4T/dc/WeR1NP/Zu4xtcvtOSNR0mbIjEoNVsY82GAd5tLG7Yy4WpiN0
 sl/1VdNlZfptjcpLyZcIxqGQPRHaH5Jy2To91Nbp3pOfTK8UNZXUC7y3VoVzOKdXLPdQ0
 i+Q6Jn34dlsjEAt7dI1eXFfnbbMJcrNonJO7qOxfOf8RPHeeWJZ1q5MNzVofJZlpIyZ8O
 mwER2GVjxoPT3/jSFfmo96OJmNIS0Vv2CM2aFcEu2OjXzJ1xmeD8qMg40qYtOmriLVbbT
 hQjN4/PGssZLf44L/Svg9VcHV4GRq/H6ivjLDyAvHhPX3xOKWhybLcvdNc7mpLzSi+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789911906;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=38bXoNPW0EtpRlY2nQpq380rHLw3N01FvaA9UYvawY4=;
 b=f+dh97M/+NrpziN/YncJ9kF0y0wLevzGn2MDIwzMAq8orV3QGcouMJJBl3ivVRXrYIu1
 Mjq69oaL4foN1kEB1Ss2wisTVpQX/FSxFgZE26mXyvVxGxCD67zBXnh1GcxXH2MKwSCul
 8eDz2OdoXMCLTv0YZyAjA4qYIw9PWOzzZCAxwPqy8swgIbOafLzUFlH+A+tSEGx/RsDnE
 8EhH0EOOHkO9yKUNsfGJ64wGVyfN7agzQP2pwFuhW+Sgi/Q7vtS2RAwoOB53+y8e7eZfc
 63FmAq/2dqQl1wvz+tHo7BA522ySy3YPEP8bPw3ntlHArM3pS03rpFNaELfPQP5daHw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0EF880F01
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:45:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BF628BE96; Sun, 20 Sep 2026 13:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 15:44:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4463009364fa27d2f4a7675677e44fde550b0ec1
X-Git-Newrev: 15ccf339c999e79222e031e9b265d9aeac1b5252
X-Patchwork-Hint: ignore
Message-Id: <20260920134358.7BF628BE96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: fix build on ARM Thumb-1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15ccf339c999e79222e031e9b265d9aeac1b5252
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

stunnel's configure unconditionally probes -fstack-clash-protection
using AX_APPEND_COMPILE_FLAGS. The probe compiles a trivial conftest.c,
which succeeds, so the flag ends up in CFLAGS. However, on ARM Thumb-1
gcc implements stack clash protection through -fstack-check=specific,
which it refuses for any real function body, so every source file fails
to build:

  stunnel.c:1003:1: sorry, unimplemented: '-fstack-check=specific' for Thumb-1

Force the corresponding autoconf cache variable to "no" on Thumb-1, in
the same way cmocka already works around this gcc limitation, and
consistently with the existing -fstack-protector-strong override.

Fixes:
https://autobuild.buildroot.org/results/3d691184ba83ba4d881632f2b2bb4da5aa50f491/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stunnel/stunnel.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index a8eb652bff..473fc81900 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -17,6 +17,11 @@ STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
 STUNNEL_CPE_ID_VENDOR = stunnel
 STUNNEL_SELINUX_MODULES = stunnel
 
+# gcc for ARM Thumb1 doesn't implement -fstack-clash-protection
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+STUNNEL_CONF_ENV += ax_cv_check_cflags___fstack_clash_protection=no
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 STUNNEL_DEPENDENCIES += systemd
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
