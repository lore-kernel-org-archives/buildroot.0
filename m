Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287E0CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CE4612BE;
	Fri, 16 Oct 2026 13:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBaDMB3hJmfU; Fri, 16 Oct 2026 13:12:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D7229612A6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156377;
	b=mtn5eCYXcmX3unomvw43k5vR2uGdxJBesmoq/OZ4W8eN63Hk2xYf7Irmk7nyYYX3BGu7
	 Gd8s7jcl6nDfZotg+UA7D7RPuVKtbEgpJqmpB+CdQleYcavnWwxe3QmoUY3CRI/dktkyd
	 pRBwJuZ+vAwuh8yZaAKhwg2cb3k6QTMyDICiPm8Z/111Fn8K0/Xx+h9esE/F7FgV5sfnE
	 3vaiApXkLFYF4cyl9InCAPgrEsyOt2s77Oikhy98rCQB0GxDnP5uYDFNCHvyPfUB+dhaY
	 BbCq1LcrMzTpQJCiYSUtTfD4kv2ML8u9GTIMUvJRn8fEH7nl1syf39HiGhkou3oHQtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156377;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UFY7j4ENNyKtf1p5Ql5lWqut8a2eo33BO4o7rlDzMBw=;
	b=FwF3dVaCoUTM4GPzp5t5g+MZoohaHzZg2I7NAszyCWHEUqw6NP4bpBXFX8h6DIJ6t2uZ
	 g09LgHcKjh/xSJViU1OMz/xCwavRusR+Jm9eKNap3ZIVVKkTCqP12OZUULc2mWxdD13JN
	 5khV//SaNGnB6zLWjZlqGYBbV5Unh8sc8BiB5xiyhPj+Yv93rdjywBhL9jApupKznT2RI
	 hy3i2KerssSP4zce4Bh6Vt8FPptZaOk9GXEhx59P1cqCFCpP75ELBOE+gcNjVuV2h7VMf
	 aRNMW7iiJj2pvw8Kd0JriT3EVnkriPhtkfPq1PpwPcYAZMDEhq9lMzmBy153aJdQ/ng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156377;
	bh=UFY7j4ENNyKtf1p5Ql5lWqut8a2eo33BO4o7rlDzMBw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PPTme1p8n0hQqjoXdFC0oFGueQgMQOmbuH2pwcSuq/2V4Up5JkdeBFpGeUJeB4qwP
	 52oFHVdps5DRyIqsjTe7/4Gpfb8bm0AiyHsIOgzj9EelKzd1iM9tSRseDOuwhUvGIp
	 9upxj96Bq9bS4zJOpr62UeyeYdtXE87ZtT/ayQ4ewM3st6ykP18egtjZL6DWauYcTD
	 3pAM+IXnAIRVhzuKVZkHqn/rFOq4jt298tTGD5YmQloUcgK8HUHvIA/rDTP8rtwrXK
	 qh9oAJ47q6WTAwUsDmwI0wTLs+39nSsQ7sUJ4vU2ISmO+LznI3yzN+MK0vRzbPve01
	 jASX9DyLy8mFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7229612A6;
	Fri, 16 Oct 2026 13:12:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BBA2105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9985960AC3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrRPZkOf0jBu for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7201D60EFC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=JlkSs810yaOMAZ5hsOxAEARcFTbFereLRNQaSfoTOPn960/QnkmDeuS1otIXAaXQ0WH5
 wVNbD+6g3vkmDR76YY2pjfaTsHzBO0ykutMai6lwVruXMjfsvOfnYlFICTwfoI2kvnftt
 t57ySbDzsmRmTr+lDo6Ij6Zz6IGntoDPiJduTllby11WE5W+B/MKKiZJ4Fkaxif/TxrGy
 yW3e1WZpvdbBDP8lDCzsdfVNKthOjiZaIGyJK2WSu0KPLTPrz9cE1iS9keCEI+c89Jn6r
 6jvi5g7WkSgAQkh2ZjcePl5WG3cg5B+Ee2XfEm0XjgdrxnRqPxgOk93T02RJDvRnzwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IIWCx+cjXicMCexlVJcaFUoJU1ZXjVk7SNLNd8yvVc8=;
 b=pmo8qzdpTp0H+lE2i3yn2la8MRCf9uhBXDTMlksIxvCur4NEErJeuqfCtPvHCzVjhaWY
 VJQvZGjYfwAalAAXRuS2nelyF1c8dejApZYM7zcFbOkiAQKCJ0GvejIytvPvLkmdp0fLK
 kaPDzz2xcfQFOGuS4+VGyvOhGxbr20tq8JFrNg06tatN/enWGe2K1vvH11FJWlj5mwW+J
 r+1A7GplHRTOel3rKPmW2ggU4Lel6j2EityqWnqa8YNyzlT+k2WV4vLF/AUJwc5NOxIma
 a52oY9B+dGM54soFHkGbTUwBbxauDOSN46Fi0izdS3H+0pUQmESuZp3PreaZq9L6O1A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7201D60EFC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 606C8960DA; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:35:36 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: fde871cb3ad199a297f7b274388c514e28d5d97a
X-Git-Newrev: 48a296c33c46e5448c120789a7bc8f8de4b028d9
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.606C8960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/nano: add CPE
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
Content-Type: multipart/mixed; boundary="===============1985342605943622572=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1985342605943622572==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48a296c33c46e5448c120789a7bc8f8de4b028d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:gnu:nano:9.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2026-6843

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a07499c8f1cb41a021def4752bac0429bc879da2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/nano/nano.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a3e019d5e5..16ed5d7137 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -12,6 +12,8 @@ NANO_LICENSE = GPL-3.0+
 NANO_LICENSE_FILES = COPYING
 NANO_DEPENDENCIES = ncurses
 
+NANO_CPE_ID_VENDOR = gnu
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else

--===============1985342605943622572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1985342605943622572==--
