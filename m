Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A638CCA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6357E60623;
	Sat, 10 Oct 2026 09:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXZcc9uunjs0; Sat, 10 Oct 2026 09:21:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0338C6064F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624100;
	b=EjdJgXplGh5B2bfI168X9tA9O9huiX2HYjTqd/7z/cosirjDBhQCryeizxRjLx62QaTN
	 Q0GGHSVtDlJD5SG7aLNfnS6LUHoZ0bCg5dd4CL+zUNdHauwhFiuBRpICDz5OoEjQVUVEi
	 G9RQ4Uh2B4io/0PXC9EFkXUcmkmTMqWehlU8/CHJ9H8D7Euhm6e/BObfSNLLY4Io/DL2j
	 ekcXtpido3eHcl8/ew4LmAPLRwgMzeADC1dhoqr4WYGWcpN9eh/Tv1C7BD2VEwA2uZmnT
	 NSHg4hEYXXkShZ6fRFwo0RTKa3vPW1sKR+wO9KUcr6nm/PijnjA0ozOcAwE7+3ViScg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624100;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Wt2BoqhEkvIcs8glzTOXEkmioKPqM8a0hD4RwZMFNXM=;
	b=d4qsNhWrSEr4R8fueu87fL8iiWy6lXEb+XTmRVHoIZlMNu3egmvpIRMn3GLNDNZkeBM9
	 inmkSRFpMkVu0Cvb2+IWyNYDkMLRF5vGBKY+jzA1cTUU+qQo3XIIe/nbGGKyha53rtBm6
	 6R1xlLz8+FEbUkJaAuqVbpJ6WAwoUsL2b+ckSc0LXyoLn8utapTQlwdlI16Y6RcMOIsU7
	 45HqaZVx54R5FXhjXSnd3OXq3NsUQEw/CsVUEWIQIQ9FtD8sJIOdDAYT6uRaRlDVn2IgH
	 7uaXXSW7ynevyqYC5bgHrSMP2/MF+JC2Xu3KoksDp9Z83ijWutsgwntPoufGNlTmI+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624100;
	bh=Wt2BoqhEkvIcs8glzTOXEkmioKPqM8a0hD4RwZMFNXM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TmcGgqqh9kfMo65CfngC7UlFtN3KDdgOgZ+CotQ0tu7X912eGIoEwr4FslQyB//bv
	 OMLrCY2Ju3M/kZ8yg3KhYHP4n6kvn/Se8gmuvjlbNv8HQz5T/fCKk06VKmUxRsshuO
	 AIzQ6BfbJ6oSLvzoqn5eI+K4hrmRE+o6HY4VbrAZaldMadTji6eHV8aOhdXc8rgnx8
	 24MnosyEd0wCfy3cBEMx30ZGxCVP7q2F+cE0idEX8TyOQTX6Fq+LCdK8nyY3eBBJi5
	 a6f0AsqzvpJVXMAECsRjix8xRuujdTStqOjOK/Fh07u09eJpNS3HOlF2h4OmTNVJEf
	 InAP/tw4bBpNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0338C6064F;
	Sat, 10 Oct 2026 09:21:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91AE1A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C0F6066D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFLR-YGJmUFU for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 62E0A60656
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=En/1zQs0lkc6fKgtLK2sCDFsrrNQXJ+VicL347R1JfApLzuk5cOd/0apdOIh7fXgO/1B
 iRDI4ziJz5XdneIIHgWcqMHna0cKeFFltvZqHahk1DBB1fu5GUpaPULZO3E0v5he5fxrC
 0vhMVZ8ffJdZLwqlTuRbzKqxue4/sW+5HKcDHKik0wpcDMi+rWPMbtrUq4IQv1BjrKnBK
 VmoahU/DNBiKKvxNqw1WTEUYi5fUeE2Jr9c31RayZKNUrnHCn92X06f9geAb2eP+3bcit
 /QdE/FanWJRAsnsLxDCkpx104yNgaWzwjjDZnT82ao1e1U6UvZrSITjhr38o5cESiCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xGj2e3aLEj/LJNbPIpMGnyWXQnY0hqcZqpUbfPnsSi0=;
 b=l+c1Syoj1SbqzVZyYHuymLsiIwV4KmZUQenFnWS64RCjp5LgVajZUGxtqmnM3JpSlIu8
 KMMI0mAPllGKJJWB/1pFVyJqPE2c9FWphnpWEg4SHtPB0yxZQv4EXQaKlJx3czaXa2AKI
 zxKCtUr8XG4+qG1OAKNBO40yGmkQB9EIpjMuBBWCNdCQTK6kuWDQ5HTurYBVOXmEyQXui
 nTnOdY6u+l58D0zqY2mUkPZ/FryrTNktE8QoL+dwsNvepVjQeWsIIsFtNWe2sY9dTfiUJ
 MuUw8MuPLOYlwgEWR5Txnc9T8Wgkv2BxJ73KZdD7pLylb+nm3jflG9QlJWgX4EoeiDQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62E0A60656
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CCEE8F0B1; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:48:28 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9800b5d3b46560c3b6f52b3a790776d415fe4149
X-Git-Newrev: c16ecc649448bbb273cc48f415d44b167ef3b199
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.4CCEE8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/{glibc,
 localedef}: security bump version to 2.44-55-gc90398e00
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
Content-Type: multipart/mixed; boundary="===============0490803027300043058=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0490803027300043058==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c16ecc649448bbb273cc48f415d44b167ef3b199
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes CVE-2026-89092:
https://gitlab.com/gnutools/glibc/-/commit/c90398e00571476711792baacb6d92bd2a7b6891

Also fix typo in comment.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c71fccc7a9ed80ab38c56d54b788bfe92090df35)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 7 +++++--
 package/localedef/localedef.mk | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index b32fdada8d..439fe1f140 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  d55ac4dbe32f36310d7a4b9a38d3796666fe323581825cc530f2000a2209947a  glibc-2.44-48-g1f5026241027260e9280039698bca031484c82ad-git4.tar.gz
+sha256  2ba6ee9ed5177a792fcce4da13225800f0cb3a2413a459e7864b8843eb5cb790  glibc-2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 6e306c7f2c..a838ac1a81 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+GLIBC_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -40,9 +40,12 @@ GLIBC_IGNORE_CVES += CVE-2026-80489
 # Fixed by 2.44-39-g0b4e41fc51e6aba6216a908961b49b0622b47fa0
 GLIBC_IGNORE_CVES += CVE-2026-18374
 
-# Fixes by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+# Fixed by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
 GLIBC_IGNORE_CVES += CVE-2026-8674
 
+# Fixed by 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+GLIBC_IGNORE_CVES += CVE-2026-89092
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index f20a05aead..e4bfce1a3a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+LOCALEDEF_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git

--===============0490803027300043058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0490803027300043058==--
