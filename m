Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A72C982E6
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 06:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AED8280D35;
	Mon, 21 Sep 2026 06:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hyzan8dt8Aqp; Mon, 21 Sep 2026 06:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7E2DD80D1E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789971496;
	b=EDepS5V3L095GbG+LxLPNxaxZORAke2Nv1pzBRsHP6CKv1U5Yh65WpbLwh1YcEM6ylxx
	 UBrlFTCDw5ECyrxE4DxbFXWHrxdMIZIrbcNSBInYh1+64qWV++X1L3IbnuwdTYBCaeIlZ
	 AGN5vuKosNloEl41LwROuPo4mUHlb7ffZInxEfJUME452Aot7AlwvXlKFeNW0aReAG14d
	 TJYprQpGGxwqngHXPMj3Glb/Znk/cpvDmh21q+Gxt8kqOazBecNT8BPAF9yTjL1vVvZzg
	 FByaIAyQOAn35Ad7zz+rTXA96hiMYKADzWvyfxl8xhdUcjTWHWin7HcI5VuQOuGM2Eg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789971496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ODPMveRsE+OdVboOY52ugLW6Pe3VMLMeL51gkqqR390=;
	b=azDoQuuP+VX2BHBO2g4IbE/mNjDzQMCskv/JEHByaZlk6kJILPQkrU31fvWD1WpeaX4D
	 b80o+lHPiI6c+edPNq1Xlo4KObC4Qz1figDHDPNvDVf+LIk71KAVolXNfH8nqNq1C2z+s
	 k2OSUhChm8z+sxIHx8wgwbYLRxvkR+5M2Keib5QWYNCeTr+sSoVP1hoAgpOtNBRvRslN9
	 dtGzpIG3d94YUqCEZbOqQ4Wtlk1ArlSS7F/CjL3A3duPH9mi2GzN2btgmkEkq57aANe1B
	 mqkQTJ7w7m9Zh6/g+UdxWMF8E0KUALTpLkq9KMvjynbij++jlmkEunEJ5hCBzVjts3A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789971496;
	bh=ODPMveRsE+OdVboOY52ugLW6Pe3VMLMeL51gkqqR390=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DeaXbGAVJ6l7qmwuU4fKXrgLKU+e2awFakmBZPqwyU4hYMCsE9+vQsv3LeLZPsiV0
	 5TbIeZGsIOAXll9wFRNUKNk5CT+nqRR8NMvAV4DFWP95CGWSfFK241rN3JNRIKlPA8
	 W2MMmGZNrl3OESnABMcAAly9HKL27jgUL0EmMTUcUR5+Ebh79RZ46bO9F5bocpZjji
	 QkP2zxQthzGks7Q0aF5O9dNtI3oPEMhc3UpEJwZaNLjtABMlIQiFCrzsbn8pKpxLcM
	 sgB6nGWGnwPCjN3RS2kbahFN1ym6lgiVQToogx/yg9v/ms+SZg7PA8Rn7H530M+ubT
	 u8X6U3rxJlE+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E2DD80D1E;
	Mon, 21 Sep 2026 06:18:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DC7A392
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DDAF40D70
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6E9af7bGrah for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 06:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B258B40DA3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.12.210.121
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789971494;
 b=I8kBEY28xFpF2Dyu+RRDeIqw+3MpNd6Qw2xXH8WavofsKBfI7zW2y/V6EgKWn5IFSEMn
 QdqBGk/y8TOUK7LudvF8bZJ0BhQFtc0gwm0a9tits6lmLhLWdYmKt5LVTnHhXw9+jfABv
 qaFmuB3eCmYr/7j3xbIhPyrbeGELFI3AoAOo5PYgs+q7BH8o1FCLAWqXqLLsbJoGbwwCT
 m59k9xKouxPw02byqUWK4k0i7UPuU47eqrTZDeLNCs+FqZw2tc6b5vBtAyotcY4K1tHtw
 l+D4uHc9ec+IVsN9vjo45thpIiZbJFxg3gg+Ff58iUrH2PUa8XVybIRp0IJzHNPQEjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789971494;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding;
 bh=Mx/BK96yaL3PhUUSImGvb+dSYfl16ckfTwwfk4HLxc8=;
 b=hU7M9IEjSVzmdCIdk4mTpa2/OwG84/C4KYc7JWxcD/9GmlC37BNhPt9L+ranW4P/yq/9
 5v0g5xg2waqHBFp4eWDOJ4o7AryrOCCe9OmuCJVMncLB/bD+v2AJFyRa78rUyyiRbjZpZ
 oQGdHdBi2ADyG8N0pDPxsaTpuaIjDDzGa5iWe29O+p78bl/C3wdRqOxHL/e8lbiym8x2R
 ayyLZ8SjeEJ0ej5WDbqE/K5f3eqwFwvpF6wVzwy0c8fOdrzxQ1Gk5/cT6tCqY8EHsq2Sy
 Itt5yFVXbJ+9zlz/vZVpuspDnByTeQ6sjnsclx1CIAY0CeBRxyGmRwBnt8srY7+CtUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=l0XQxUnV; 
 arc=none smtp.remote-ip=80.12.210.121
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=l0XQxUnV
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B258B40DA3
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789971494; x=1821507494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mx/BK96yaL3PhUUSImGvb+dSYfl16ckfTwwfk4HLxc8=;
 b=l0XQxUnV8HLDlrnZLCzN5rUbmttH3Kurz6VDEzj2v3jF4GfxwV1ocgnj
 +BrKzKqhOsIR1D4dQzPYKusaiONfo4ACc18yN4Zfeq69zZx0/cH8KL1oC
 b3g7focKeHHqwMX0NgN4wp19uYUt5uM6R/ik1SA+lYPD6ZeLQQOB/j+7Q
 9WDOORZnuCqfKZwQujxp1gsGseoKJFumSdgk6eSKDDtCRXSjYVfdFCZUd
 BOIWaZVR8elhsSGkh1azUgH6oApbZ4yBFtFLg+VQQWRsq23zJdvlAhNgj
 X2VP6WXdcDZt9Q1mm7XPmhhsAyDIz1TqzEOMlFydVbXGb38E7Lw/QX4p4 Q==;
X-CSE-ConnectionGUID: HPKrTWK7SIqQNhoFLvccUw==
X-CSE-MsgGUID: 8wEJs3VWR/qtaDwkpPPq7w==
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Sep 2026 08:18:10 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 08:18:10 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Mon, 21 Sep 2026 08:18:08 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 21 Sep 2026 08:18:08 +0200
X-CSE-ConnectionGUID: HGbp7oogTzOAEtf/J6EioQ==
X-CSE-MsgGUID: OJWUG4wATWao6y1zBNTUmQ==
X-IronPort-AV: E=Sophos;i="6.27,114,1787004000"; d="scan'208";a="470331185"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 21 Sep 2026 08:18:04 +0200
Message-ID: <289dd79ceb57c9bd50c1ac717940c6de4506362b.1789971481.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789971481.git.yann.morin@orange.com>
References: <cover.1789971481.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 2/3] package/docker-credential-gcr: bump version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index 1269e239ad..fe022e4391 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7dcb5b75650a49e181afdbd735d09f3289cb62d5b30cb6e3f681e64cf804cbf9  docker-credential-gcr-v2.1.32-git4-go2.tar.gz
+sha256  4f624eeab2923fc135b8d69211036b6fb04f3d62290cac63260d07d3f2f9eecf  docker-credential-gcr-v2.2.1-git4-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
index 7419a47d4a..95c7af83a4 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.mk
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CREDENTIAL_GCR_VERSION = v2.1.32
+DOCKER_CREDENTIAL_GCR_VERSION = v2.2.1
 DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
 DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
 
-- 
2.43.0

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
