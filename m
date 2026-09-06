Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71930C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FE1A605EA;
	Sun,  6 Sep 2026 10:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyHeRt79MfO1; Sun,  6 Sep 2026 10:55:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 56A08605EB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788692103;
	b=CT55P261+rXtO5Qnw5DKhf7+7NUrS/hsL2T6NzDiE6BXTdDrKgBbvwsYG5w3ROc5nv1P
	 pFyRbAg7aUMAtx/a90BQJ1oboXesyrCuanFyRNpBDWJvrg6VAXwEaRsaT/3AlHYdhuoqv
	 oHUeW7gfXyokAubsjcjBqBG5fzKaY1AbezRjbRa+HvE5adZ4t2jR/wmFejnHFwZu5fRgk
	 ZextGkJCBcNGVRotPPHFm5gksBrimvihS2UGZUOtpRS9k0kia5mdyQZhq7NfGtA2tJTfu
	 RoQEpbtarb09aMD6Ef3bvTm+ICPY0bErbeytbm7f1RIgHgIwBH03X60j1KG6F6ztqag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788692103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y32ceDizu2niAfTdiKV+WrlZPe72sdCYk0MBv3LXLfQ=;
	b=oLvd9v7WfRZy256sGMJXezgMZ+M7c4BnqfcD8TBWWia2Dmp2Wd39iQMkUn/lI3LR6MY1
	 EJTwv0z8AgXp2bgmbMatoZd11usLuf3XxiyhwdE7rBa3a8yO+WgTey4wNTndydNuamzQy
	 p0S+qEPz08PeXPNEA2n5APhlVw/Z+lHIvT7MrFeCRzl0l9lZ2BmI7SUFf8QPrVAozyPQu
	 bc1pmLsChxGLS1j/GS+DuMqphff/A0fdjG3cVL0jeaP+3JKngF4oSlX9oqMCwk+K6PFf9
	 Nv1zRHeQv26UTkyt7jvec2h/ECEfcd3IN5QUUCDxVSaHoG6WteggP8NGI2+9sSXNFpQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788692103;
	bh=Y32ceDizu2niAfTdiKV+WrlZPe72sdCYk0MBv3LXLfQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kg3fRYsZ9sXoMvbLHBImto5nVLeFJJ+9U9RuzvKIO+02f8xGfpGu1upt9xJQn+trh
	 62ofRn3QqLwdEb1Z2toy2hWT22xf5tB+O0PwUdZA/uDIw4tl1840mG/MpX7lu82DlA
	 Ti9AV7JDhHyjRY8JEUdRRn5s+9eCQovocGVLv0mSVWWtPBROFMJ6bcN4T2Tmm046ak
	 pQtf5XTjT7ErcCo4I1NdQ7wjcLXgB/TpSsOwaaBxdogo1FIv/vAwu5blEFtbB5EKRh
	 Vzs8NTHq+9IiXp/+ipQfDEfXCQUsTeePm4hBgLLHMz3+T3/O+BaQ+vKbmtk88jV/eZ
	 s5uaxQr1bt/CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56A08605EB;
	Sun,  6 Sep 2026 10:55:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCDBF72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C29FB80DC8
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dQxNauRYdvh for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:55:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 718F180DB9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788692100;
 b=ceCQM5PbCUpottV4TkRNxthWP3Ef+EDZfBuVbvWE9stLgA6pU5/a3FOh2XA53NbhGArT
 tGQRsNB2/zjyAxMUTckv1Z8e+aKRWmrCvpCBd1AvMPVYXVi+vGHZBcB0xbuxJAcsz5Irc
 11LG9UttiynG848xYFJLWWb7kqRZh6HXAvdVuHcssCSwFzCrDhFOIlWrLvn9bIhrPXfM4
 tvyoIdtUIHuJEprES2h4itm2OpR5eJ12NkKbhP4a9NBY6s5UkX4OLlULx9z/FUy3E2W0Z
 mlaavezM3Ibj8+4axg/ni7DjKuT4wfOGa9IP/78PaPcPU55Xvgvk76pF9/NtrhngQuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788692100;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CivvOyT03i+FE5xqzeB6mniJsyY5I53Ul8phdZuMCcU=;
 b=L4DQo7SRFP05rNJ9K7PZjoeZa8zRekiYVUMLY8QJsYmy4msAEB3I2CagxiiUml7M+8PO
 jJc30MXi8gMkV03cdcHOewI5rXhqHMumea2y/v/3PGtrUcx7JF4Xz+5yYmuF78d7NQ3SH
 ERW9XAPZlOsttoi6AHO8ZntjLwIFv4i1JJL4hgmSZvIgsp+rk4Q/50+/MwvvOx9Qrezd4
 xNgLuJw4dLegaWMTCVenuMvqrjTcFUceq55/p69pKsx1LJJVQsZYsghgVI5nKfdRI90jT
 eQ8I4qWzHH5cXyUZ4FLwuMKU5oTfOr2JobZjJvOO0I2ldfUd4yGUAqSDEK8anPwbDDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 718F180DB9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:55:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3FF7953A3; Sun,  6 Sep 2026 10:53:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 12:18:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e55cb3108531b9a983ecdd607114f644150bf9af
X-Git-Newrev: 0838e968cb9e78d7ca5d1641f39655bc03a2be00
X-Patchwork-Hint: ignore
Message-Id: <20260906105358.F3FF7953A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump version to 2.44-40-g30950ce64
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0838e968cb9e78d7ca5d1641f39655bc03a2be00
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-18374:
https://gitlab.com/gnutools/glibc/-/commit/0b4e41fc51e6aba6216a908961b49b0622b47fa0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 8d69de7b2a..f541a8d8f8 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  39f6808e31a02da42f774912c6754ea22d5f076c4e935b1e233f3602d4d772c0  glibc-2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3-git4.tar.gz
+sha256  440f4e6d5b787369c1af241de7ca0692731fff3a0c3d279a98e8827a6ccba5d1  glibc-2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f39e959c29..3cddf7c1e3 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3
+GLIBC_VERSION = 2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -37,6 +37,9 @@ GLIBC_IGNORE_CVES += CVE-2026-77117
 # Fixed by 2.44-31-gcb61572ea3f773e1e1978f6c412cc36a30acdb0c
 GLIBC_IGNORE_CVES += CVE-2026-80489
 
+# Fixed by 2.44-39-g0b4e41fc51e6aba6216a908961b49b0622b47fa0
+GLIBC_IGNORE_CVES += CVE-2026-18374
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 048891724d..6904e147d9 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3
+LOCALEDEF_VERSION = 2.44-40-g30950ce64dbc29db0aedf1d46b6b8eb70b360f0c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
