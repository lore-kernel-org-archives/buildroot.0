Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEEAC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18CD240B16;
	Thu, 24 Sep 2026 18:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GEU-BMnuCcu; Thu, 24 Sep 2026 18:58:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0640340B1C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276300;
	b=nwgaKX4lFywOE7QRVTRziauWjKmiF4ZQbJAT3b0V1VLRmVaQL8IHaVS+6OEUFdF3f4by
	 nY42Zq9dizlMLIT/HjspptDzmOb9qdNdQN/YXMqQHQCmGTmCu3XqJRRXmlssRwR+YV8/L
	 5eHYsfV8kCgTj0HeE8FdCujT4BSRvJjInpCRh202ryDAIS8NqqfMSBDWF6FgrvZVN9Lcs
	 BlJztvEL10LCkki7cHXuzSaExYAMQMAyrkJWKy/pulNAeb2KACRq+lvKqmEQna8aJCLub
	 BrjJls8+lHtnogttHZxIPlsSUKD9B3EhKBmt2B1UIX4zgjjHDTqrs0pDR3UamrhBfaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wIoCRMFFttPOOUDcimOXjiw2k8aBtLtLz0AAZRXOTP8=;
	b=tHx9uo25XrgaMOwo2iFjpjunbNznFrc+Hlq4iCq1e7gKnyDVhkXqXYDD7s8pusJ74e61
	 imAOpuHis6zaFPVFXYX+INVjYGKDaoCSldEwUlzhLXwbaokhOcNF8Qq6sJWo9bWik0zE8
	 OhXAaZ1dyWdUCMrGOY7QfElMswyEd4D/LKTlL0iTIQx+3X43A7qV+5p/WzIcRpIgtWaNR
	 i6XM1OY8r5rdYqJJtliN2BLrtcSXnvEUFDTr7y5J/0Tfg4znUbDHbiASOoH4quJDqMJHF
	 CExuCdbPLhY9IpbeqJ8VbbwYEHRtsVVUvOqunKFU8NeWItNfV6tnFent1PLj6r98gLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276300;
	bh=wIoCRMFFttPOOUDcimOXjiw2k8aBtLtLz0AAZRXOTP8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gasPzBzLH+qWYWZR2QZKGTSjLvacGmGZrlV6r1q6uEd6RJMpNAryyx02qsNiggfdd
	 0PoPVI1zELYqInGpNulSEulfOezK/GFY3TNjeIDQMsv/Daia2OPdW1bbUNX8WIbE6K
	 HMQB4xU80uyBuLmJ/D6v5qn8r9uWo/7skxVMrrxBS+TpZG6qmMz1d6JwIFpf1x4D7S
	 8xkam3pTf1Lq21VaxPhGpBjkFNQ2qCaF74t6FnECMppfNPOEphEsxshN6jc+DbSVGo
	 nsIPa4reQCD4jFoGNIMV1u609evclkEJYpR5VmFUvbFmV3/MURnJ6zDLEbCMJPIwoN
	 /HXTGNGF3xedA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0640340B1C;
	Thu, 24 Sep 2026 18:58:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CDF9392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22AC40AD4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFdg6Pflt3d0 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AEF9940AB1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=pc4QG4WBcUN5wjsFm29GwHnkKtuWMwuPkoUZfc78sXIn9Rwgy3VhHjdAai8E253soc6+
 uTf93pXO+IK7weRh2uJryzzHRIHR/hztTLwgTcg5pAJqFv67f9W9pHtBvM2C00kQftOgr
 NOxcC8QBE3I6vQhsx4/9R3Kexq5bE8v0ghizqEw4YlRD4FC++mNJ/tz1kRFfhXd7nHIGp
 XxQhjV2GLfgBjmoAo5WAvBhXPbiM9pYXlrJgyistPt91+pN92K/jIhRRibL8jDmM5ZhNN
 rXPrkwKzt8qgh/ejLIhND96VmW+N1nnI2Vb2m17zBRsCV7S/F6A9JLId0/VneKbypdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Bst/T3Ltv0z98fXecFVFxo4SVoGs5CsGSfcktQU2kNg=;
 b=mXNHfAX2WSJytWkeVNzQ9wnvPA5fMDefrWsGJIvoA2ZrqfLHPfPk/1Qh5PG2DHCSSyc3
 69tqXHHkaGB54oihJXt72aYtz3EHdwt2Ig8vejMQXy5kvB9jMTbo1cYY8qg4wfkgcIW/9
 YxvV46uYsD3r87EWIJ90vqjcCay2j2q7D8ssUdtc4/CqRalZAfkgVOhBJEeesc/nAJ6CY
 Rm3PeVi7igDcuxl0noBW5k18Ui0T13ZG5TiULE4KXeruXhimxRBgsOOWjFGa3l35cfb7J
 5RCc9uyrmPO0xOCSJ4w/aWboW6Ss6lpSve+dQaNbMZpdKdo6ndAwQgJ8eSdSjoy9REg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEF9940AB1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52911982D9; Thu, 24 Sep 2026 18:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:38:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 21e709049a237b0e67283058ea948ccc61f9d45f
X-Git-Newrev: 67163f7e1d96208ce884e1359e95e8071794b181
X-Patchwork-Hint: ignore
Message-Id: <20260924185535.52911982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/stunnel: fix
 build on ARM Thumb-1
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
Content-Type: multipart/mixed; boundary="===============6152615890636967504=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6152615890636967504==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67163f7e1d96208ce884e1359e95e8071794b181
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 15ccf339c999e79222e031e9b265d9aeac1b5252)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/stunnel/stunnel.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 1421b706b7..e59b52a9a7 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -18,6 +18,11 @@ STUNNEL_LICENSE_FILES = COPYING.md COPYRIGHT.md
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

--===============6152615890636967504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6152615890636967504==--
