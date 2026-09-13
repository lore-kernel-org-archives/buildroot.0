Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27308C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D2BD80E47;
	Sun, 13 Sep 2026 09:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lLVE1CrsBSb; Sun, 13 Sep 2026 09:26:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 96F2580E52
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789291570;
	b=YkuLKtr16p8aFjZsXpWut1dhIpFqKjS6BRNLJUGuL9N4ci2TwdltfzLgH5+fgH2S/5QT
	 Zl/9X/NBrywUpzKFMLnhu+45hP/bkh5/aHVSAG9qeEIKlkiIz7szoSsoLgwgTugtABaxO
	 Y3Z3c/wBBeUqsei5KtjQC8lQsvS/rrpGeIlr3kFSLyxHoGuxbDsfiRDoDQItvU8KTk96A
	 01KEmuzYLQ3aC9bFmL+jhFXKkZ2ERepOBiaZh+YEh5mhE5948zy6FzorPPQ+TK8e97Du1
	 +Vm/22Q7HVyOpAmbm/Ttk5Q65s7x+vYdejh+8OoWJyr/hbewdEH6WkTbT3haiFRyvuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789291570;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LEg+eZCdpXuSzqsSpNCxDUwDT5kgj2/DyYTkEe8RJc8=;
	b=qa6BGXO1dCPS5Q3e7g0FkR4fRQbi5WQW8hrHK/bwJ3qAV5zz9Wq/xeTSoc9jQBDhFGda
	 FYR+LHRAqseb7VpOx8F9AjqXPVguv2Neg+5MjQZon8LfEjOJWBAIbhV5KGUdDyOVnCZeT
	 et9nwH2ajYM3LJTA7XhN9Y2VmmGPAKekYVxsGYg2tLhvV378HHeKAcIoBk2TWJ2E6ruMo
	 cDi1Mhn1quAkSp1X/L89+rqK53tg4IbQe3TBBP+5r7XIsex1f7VXxp2i+Nz3MwUsQNwJU
	 zXJhK48k4TkThvhDC1qqg7TJb3bqTOz0NU1cAkftvipXs8EWWRzNQ08MCxHOKwIUe0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789291570;
	bh=LEg+eZCdpXuSzqsSpNCxDUwDT5kgj2/DyYTkEe8RJc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sZdi1XC6btDryDvkrclUzFSSEHoppfdg/hbydkr+vBT6qR3aKjM4n9ywo0pZmsGb9
	 mH6dDLk/cHe/Qs4jvSYQAu6xRjrrOjOIrZcrmYaSCYThn40FpOsycVdIt5X4QFy0eW
	 LMfiwZZcVLDRHocN/qvFswXAaE27UFZg/FQHShsB5wvcBJkcUnh9lz0ImKLoQ/s6XA
	 AIgk8BSr8josJkUK52+eEavR8XOeyvEomgic1o4KEIlJRFxrZ4uk0AlE6GLC9uJu+w
	 d17o92/F0Ax5LvZWBpRUqk862cE/9ptaJDCnZdVW25HSa3zdMVg5qVzw9dux5L9N73
	 Afg3eLYF/7dYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96F2580E52;
	Sun, 13 Sep 2026 09:26:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F6CF224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 905FB60614
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVls7q7xyCZj for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:26:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 993E1605F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789291568;
 b=jZ2leML99ohxemVQo3X5NE5qAnGTSZJfRgQYos9D3XW9sw8/Occ/M1u8PLpTb9SU88y4
 WSYfjx+6RladRBtZ7m6jrqNL5HyTM6C+pgAruYhNhiXOXawhQTZgsyHU+up+zovPLSmk8
 6V0cHHbxtpr+mVByGnvyPpThMkBbYgheomqv/hJPYyZJ+gBBXb5UwQPrjLp5oNSwQim00
 5AGzl1W6Z0WPhfsYLKh5oz6g2GdWfdngs2lGL+WKA8RIsD1ROrW29/18lsYFit/015lWf
 jJRL2PV/wyO2xy0OlnRioN+7b9hcNrbEpbNfg3RGkMGB2xF2fxwaebSNN799ThdYesA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789291568;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VVtqsVc8iYxC3+UbXvg62uF/10H5PwclGDx4l3ceQ3c=;
 b=FA+mwdKiQ5hQ3aDhmnO3ZxqvZ9Q1bmrNxSa5SLOigJCMci34vhhbQeBQ+gMljsQ2lteS
 GAQsGeEH2CJB1nBtBIodNPTQZ0yUrl9d/EFJdM2roffq+JHnK3DLHSb7c5aY/fzq4pRgu
 T6LeRRJzlsEd690aiT7uME9WR2gzH+v+E9BliEzbrIH9r7c/xQYGcVUMxGaEEnPlILay/
 VSZarJ4PwaKalw90WTrsTHV1MgSXkBbgfxecGdHpEclo24uaHn7sG0MUGsiGes/OwLjVt
 JNDqb0eY/B2viOfreL3Wdw3vcRxCrRnIo5Wg1wR+i3LQgKevJtiwauHJqo7HlPQlZyg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 993E1605F7
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC3B595B38; Sun, 13 Sep 2026 09:25:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 11:25:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 876023bc5af11c70583ebe136f87f2fcb971d6d1
X-Git-Newrev: 2f5620dbac2976973fb260fd78f9d76f0dc6fe66
X-Patchwork-Hint: ignore
Message-Id: <20260913092503.CC3B595B38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptsetup: bump version to 2.8.8
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f5620dbac2976973fb260fd78f9d76f0dc6fe66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.8/docs/v2.8.8-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index c6ce35a52b..a0ef7aea9b 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da  cryptsetup-2.8.7.tar.xz
+sha256  3acfa685f2dd7fcc832e0b77bc7093aa7da554a51ce8dafbb4138eaa854eee35  cryptsetup-2.8.8.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 28b9927e4a..643a2b3f59 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
