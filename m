Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79875C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:01:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401BE61166
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 21:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 401BE61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BA3C40193;
	Tue, 14 Sep 2021 21:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THn9-ASru_6v; Tue, 14 Sep 2021 21:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BF664014A;
	Tue, 14 Sep 2021 21:01:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69FCB1BF39A
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A093402B2
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 21:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo01c69SZGhb for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 21:00:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58CD9402A1
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631653238;
 bh=Jz3hvj82PgPyLdAqwCsnETRhO2ZrISm/+Vg070IPGqg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IqCDNQaI/ThZJG3aKhvcJ5VImq/Q2OXk9tgJyZ1AyeId1uHGeb4QKdD1YlIdjB74d
 qmyCYHU5jDs7rpXlumEBt28E03dSq7bQG5+tF0ojGsJrsa1AdQnmbtggNFzrKXgrUk
 dM8cJ7xywT0w+q0Pe2lgJKHsHOfryApWoD+GvdLg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MKKYx-1mCHYv2r6N-00LjDs; Tue, 14 Sep 2021 23:00:38 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 23:00:36 +0200
Message-Id: <20210914210036.29189-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914210036.29189-1-ps.report@gmx.net>
References: <20210914210036.29189-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nF6yOwpFA9ak4H7K8E3r/WSUUnbrFAHTnmVv/2DQppLgWTVNdfI
 h7diQ1nYcZS3bAtQJ9o5lHaMEUnHgd3TLwW0NtTcYH1fZ87zqxFV2i1OUA4gWVIAq0f+FMz
 v6idIMUqg6OlzVUFRXVwuPl4XQ6Yk9pI3gXGroCFAUOUlPAsIvKMCb8LIF/ukZ2wIiGLUJF
 sVrQsO2T0o/HhRHpKxrDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ae1zw0PAQb8=:SZ6F2sFVLprwOERIMmCAF/
 JiBAI357nLJZe/21Tv9D37CUEqoNNj8d8xn7gQcTKsdcYJjMUyAw6BqxzRAvd531QKpSrhKav
 yHyP8fSgoCEnMjhqAsm/H0LubZUBhAPbLLQNsmXOxbk95b3QFfs0fuWd5YTI4nboUKunaUxAZ
 cC5wwD79r52GOZdGhBHwqajW+mjviVNxSqj9XErwiOGPv85khfuCa/zunU1BFNpEjpeZ9j3QF
 BRluS+Sm9OTHoEZDMaIuD4gen/Yynb73pGK+yt+4Z1FzUCi+XjcM4UNHWGsfButpppdFpcFbV
 p6IkjtGwOEZT5Iuvb2VDb7vdQprIawqBYib179b+inWbi0N4iXPKC9HBx0xyVFVgQELGyEW7H
 FhOQISeBsj7HgLt6OLhB+fmeAvpEWsc8qvuIl46gELTBWWyU1EpQN6ad339AFlEuWmgs2iB+C
 b+F2wDbXOBzn5SJUTgLLr69cOsAT8nuYTTKZTkYDdpfJco14CE5WXhGY3eiUlR6XwQ8ZS+m0E
 fATyPQFtlEiVfY5CeMEqXn0vHwGey8aOWNrMkNwUnVldNo4jd2QFFbRIDLTbf+RUrwB84UyH2
 J9r/yPOG123uCjHFEFZECI6Bcuz3aCgBrchVKA7PsagKoBqp2ewNSn+PxuaCZKK7zdrIACBdZ
 t676lPgeDKTrvdH42ftVSEJIGOQky+p4kBOWJpVvqboe08ZhnO+qUyfKwZirX7aXkR4C50HeQ
 akpry20u1ceN1zqn+jGxKdgU+gb+xFWbnt8YBw3IQXNJOqCFX9Mg/+rPrALGdC7oShVngMh8c
 vqHNxFQiJbkPaeirm5xLAJXx3sIq0kbsSCu9VFEiquc4+YKuCXOcaCY/sbw5CBAjP+NNu1BJm
 bLUrL+9kq1/YpQnC90irpWr7r6FrIXs6dMAoIGoQX/G8TeHKDUG7FHJlKUCGyQfEHv2/IQcp/
 8eWs5d1ZcWfYy2vuWF4f1RBVXZR3cUmaUHqUuLe4oe043LBJUp2vg9rV8a9SUnbiWM4HgSufA
 FbhXKCeJzV3sYrF82rPQJmJGZKDeLo144dv5oTId1/UjxUwDUOCsCRdakTvMzL3RQxRL1aSgG
 pBImwr7dgZxstE=
Subject: [Buildroot] [PATCH v1 3/3] package/iwd: bump version to 1.17
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Changelog (since 1.14, from [1]):

  ver 1.17:
    Fix issue with sending additional and vendor IEs.
    Fix issue with IE ordering for 802.11-2020 support.
    Fix issue with frequency update on channel switch events.
    Fix issue with drivers and handling of IF_OPER_UP setting.

  ver 1.16:
    Fix issue with writing provisioning files with a passphrase.
    Add support for Authenticator & Supplicant RSN Extension elements.
    Add support for handling Transition Disable info.
    Add support for SAE Hash-to-Element feature.

  ver 1.15:
    Add support for FT-over-DS procedure with multiple BSS.
    Add support for estimation of VHT RX data rate.
    Add support for exporting Daemon information.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 9decf459f9..9bd8f9c252 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  21be6ad59ba666ba1e50e01889d647472b9b2f96f4941123db036fd33c257f0b  iwd-1.14.tar.xz
+sha256  6f946f823b0dc3205e4e72becf8ad1915448d194f5b10d8003e4c8c5a18e4ef7  iwd-1.17.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 171c96edcf..9737f2c626 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.14
+IWD_VERSION = 1.17
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
