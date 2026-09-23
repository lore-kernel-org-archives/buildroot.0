Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A084C98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4277B8122D;
	Thu, 24 Sep 2026 18:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8HOacmZAOjC; Thu, 24 Sep 2026 18:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 534188121E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276217;
	b=oI7zIHFwbCGIiWrP2g82/0QyP4Jk+etHQ98c5V+jk4RBZLcPPZKSadQ3dbF8csz5DbKN
	 Mp9xa6hBYzrb9PenLFHwefgTRCRS3fGb+Y+1MVk+uau0RHwJ8wyqgMAKCqN52PK26Iw1X
	 P2jbMi77HqT3eiVQG9bYPeErT8qL8YDSXJiekj/h+r50rGnL5ZqiUSQ9SFuVE1U4dPXNf
	 9t2xlnrzkFShZWBQn909qnP8w3OAWIj4NGveW/HEbr3NuEjcB3MgXLR4ktFNIcX6HBOVP
	 wHUxWr43DF70DGzg56Y1DPOfRWpHXoEhEuzRzLPUiAJlk+cGS32bi8gMKwMdvSh0/RA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8hAk8hP9nPA+Yf7nfK0BjlMZU08E4MAK7pJJVMZR7OM=;
	b=JfB1lLsNOCbredwb/iSnDxuq+DD7bbhGVqimHn8d/JwCvf1Zz7USpUqxsR2Tfzae2igi
	 +MPB3EfLUWH6pT6Ch4mT4R3vd4VuzqiY0dIXuTy6rPWS1doBsK3LkBrBO/YEAYNcxiYDd
	 Do9vAQXasFmerqb9xYW16HiXTsLv3VkbpmV1Lfy/ox5Y3JC/xvxxWGeuA5gXy6n+et/CV
	 u1sYa1DLkIsqp15jtbcqewsPZT/VrJcjFHC+Zq4JOEQhQNopPzeToDL5dJObwOoVnhVsB
	 QXBuE4kiJH8vXvHseAKg/vWVDicOQyESjEL4PaHcAVDXDSFZMa3ybM92cmvPLQhfGeQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276217;
	bh=8hAk8hP9nPA+Yf7nfK0BjlMZU08E4MAK7pJJVMZR7OM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sFYMll1RAshaK2UGsB2kTjiSPKpINXFtHGlvCcNLaRSs3tTGiBs/H5mHXJN+5VazC
	 OazoXmp6h89dM9L0p95Ohuq/LkEl91IsSMC7QMBR1vwzAKMWkdz0zXl1dKydxK2y/P
	 a6ib1ATsP2g1DKzZ0HuAkEPXhAQYAzqTBOTF2cb/SQN17fVXay0S8tiK5qr1Ku+jT8
	 GEfbA5Bh2JxSZL5DPrKUlrwcvNWHfGskKbD7IfY2h6nYwe2B44EgmeWv2e7zEevlKv
	 2EhGT+iXNHzuBzuqxj5QZDhXOxINo8P55dIocNmt45Rk2gHkJxpDkiVV8OP+ulqFCy
	 HNJI6IgcZGcjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 534188121E;
	Thu, 24 Sep 2026 18:56:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 028A4328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0084740AD4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZOnk55XH2SF for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9841840AC0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=mMnmi6stQTjqd9LwFUv+x3sw1VVIfmzTfspcMT2hfLGbs5k4yIiPoVUPDPfO1Sv+az1h
 yRe5PS+UanLRfM9a6QbzYX3ZaCBJ+RaxXMajsd8mG1xMDF6lfu6k7Zqp3Dq+4i/B7URzz
 0ggCHJCykkBQLoFpsjybX6jv/06V6Ujx6Zl2gFHL4fRUFCHBwzXxsVP/11EXk4D4HRdHv
 p8JB92OgDE7UmtF9ZcjgIya6VBHCrCm5JHViVqErmPwIWJ86QqWseXdCwq+4xv33GqLJA
 tMGPN8lAg+AwKjF8xfPRXOY4mKg8hhON82tNGJM8sU4TbXEjcDEsEHsmWGO17HclFzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NLlRTOadhpCPmXHmxdQUaag+B/TE7uke+Ng6I+q0W0s=;
 b=EU5YuKOFSCvWEbqeERkczFxBxy1p4NW9GswKoDUdVMvkgQ7fMKYfXaFEDndCiMq/5tPb
 kyn1mCqwPDuNyTv8qhxWUJjNJQ7o8xMqtVuxCbFMb1IV+Cbqiwnep+l2q1sn3GRL05xeh
 jfV66jHxR3ANEctYEPw8K/2/P2O0iQUBe1g77z8Il2mUEmtMgLk4gADtYCddNYjEnhly3
 Gqc3Bfpqr2BHyETbwaYlKnh6pC7sY+z+12uqLIb+/iwPLesINi/43YIzHJ12ZB/A2ljo/
 9pjeVtaXxuabV3U7KGrvV6RfAYFF+iu2DBdldc4IoW0UUvldrQujWj9/OxKtEcpbTKA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9841840AC0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C94698383; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:51:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 11ebe0ad2e55f07093d2514bf4bc5cc9dc596377
X-Git-Newrev: a09e6149f0c6e74de5d352c562a7cadec5cef4b5
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.3C94698383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/strongswan: fix
 BR2_PACKAGE_STRONGSWAN_BOTAN dependencies
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
Content-Type: multipart/mixed; boundary="===============8945407537898334943=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8945407537898334943==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a09e6149f0c6e74de5d352c562a7cadec5cef4b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_STRONGSWAN_BOTAN selects BR2_PACKAGE_BOTAN, but since
commit 10a70b1af67cf79986c2e401f7a54aa850ea82d6, botan needs gcc 11,
which was not propagated to strongswan's botan option. This commit
fixes this issue.

Fixes: 10a70b1af67cf79986c2e401f7a54aa850ea82d6 ("package/botan: needs gcc >= 11")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b56072c12692172edbae9ca62c395c6e94d21c0f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/strongswan/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 22caa2a573..e8b4ff109d 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -35,12 +35,12 @@ config BR2_PACKAGE_STRONGSWAN_BOTAN
 	bool "botan"
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # botan
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # botan
 	select BR2_PACKAGE_BOTAN
 
-comment "botan backend needs a toolchain w/ C++, gcc >= 10"
+comment "botan backend needs a toolchain w/ C++, gcc >= 11"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 
 config BR2_PACKAGE_STRONGSWAN_OPENSSL

--===============8945407537898334943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8945407537898334943==--
