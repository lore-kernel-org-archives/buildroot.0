Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84C1CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FB75607FF;
	Tue, 29 Sep 2026 18:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFXW4te1_tYJ; Tue, 29 Sep 2026 18:39:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B1AD1607F2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707194;
	b=ftaLjqpYLhiUW+R3Azg8lkDzHY08HnqqZSJy5twcZUt7o8ITC+Y75PS0rtmiLlK5+YqC
	 pDtRKdwdJ276X2Ad9ZXR37MvWA3bM7oZTHXRa5ymInZDxWmQtgpeg1klnzgKORd6r5ij4
	 mf9y9W9bH8K5LuP7Scihq347D73Ek+aquUqxC5jQuAKtESvJXV9EdoewfSXm/I7S2ovxv
	 QYiHDY8qHHztolu9qWkaMlWcbZDDIFHEdD4GGSjJgPuND3IvJnZzr6JC9uJT0dBEkS7hK
	 vzVjfgR5Gj2O8UHfby53xu/3QC32PRH61D5nPGIg3+nwuMwJzreZn96r64/tYvr2OWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yorcWxe0VeIbXhplaRDImKm7MQANuqGUmnFXPH+0i7k=;
	b=srtDKmEGk4pF25E/HqykWYlkMA3Zq3+AJAe+rkozrHNVcj1Q21eRCaU8nGLVGskmcAoU
	 jCnr3nAAVzyWCNp+8i8K2OW4nrAAgr77BRt/iu+y4vOrxw4X0oK9tLJV/2Lc58bQmKzmk
	 y225EBUxWulZNCa1dkCl/d7MlUjb5eukDTZ2b+WmQX7LA18Q9bOSi70+wCjTq+Ql26/+S
	 0oAoPvIstmDN//8pTbxolcuDjLJjrnE9MVVCf6O4gxOVjFwW9tMrZLdBXSgM8zkLZvEt3
	 UuI8ZddRf5MfV/f2xk0DsN76Jrt22u3oUXlSmEw6Pw8TpCR9bVwzcsaWY9PwEZlECcQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707194;
	bh=yorcWxe0VeIbXhplaRDImKm7MQANuqGUmnFXPH+0i7k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Jf6w98Te0TONiMxh9gTrfh2VHcu1gwHwnJHoUgnBv0bpHVgoxb5dpf240gjEIGVa0
	 q69nTXnyTkOz9JMcSgKMvGk7udUjLVAV78q9H3BvGCplqgB8FCp4hTMNfaS6BDHkb0
	 85XOoJbdznrnO1BAxfxvwtcWJ8k/r74AmoUw0BbzyfqeEM4BK8K0/rLFwTpYL6xK3M
	 n4eXfZ7VkE2Sa4NukcwIbcqkrbNQH8PWEs+sLi85nRIQcK/0l55a1k2V4nVIZ9jVFM
	 pxsJxGexh83TCdj/E0yXQ+t9FC+gbJf0e/YTya+p+I6QRMN/MOUm2grQVZuKqjfJPS
	 5/mMeXtgphgaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1AD1607F2;
	Tue, 29 Sep 2026 18:39:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1454C3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0637480FFB
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3JmnM8cVCyI for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:39:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4FB9B80FF9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707192;
 b=W0EhtrHkGKABg0gE8JlHYYtQIsxLgHKI+JpEYNKmRrgMhYcePKKOCno/bnvyR4BgkV3U
 4U2AJ7i/ZjkEryb7SKvSwhfEbTtJsx5zgyMBV/lFK0AXsg/znM4uJHgG7S0imM+8EFO60
 yc6p5se3KQLmlDVauQdSvTg3ffL5+EY3AZ8rXjQwdu90kgHs0qTJAlZAYF/dFc6WEK0Vu
 6mmuWAwIMwbqK5sQvxlVQqGDQQY/ZwLx9OhSURq69PiUGSPZJ0T1RIfk6siQPDRUSx9Qd
 OTcYHhVU6qCK2EuaQAIdmOtKwWamJhKrFVagNfZnQ6hz0gmanojOrOzplv4tlfGlnlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707192;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=pANSTr29EYYd744Wp7kyEopD2ODgvOEEhVfPIkd+Toc=;
 b=sdykf65BOL8IPk4x3zpjoSFbjaPhUbtMW3/YrYkAVcAS41GLSsfsK3szlzbyDokoSWp3
 gIddsm40Lq5GN/lDSqAAUMPAZzLw0PXnXl40MiEmJfNnhNwfSj59WuX1ShHCsszepEguQ
 yeV2XS9WBba99V10pt7/aZJdWAWwVNpvr/gqYM+mDmdRblRKhenWYdLuvH9D07fip4eBo
 u1EaS8NqM6ClZf0vIwQ3l4DNfVXdc55n5q8Ky4UExO6Ie5Xs+Sn+srO0K0HBbAQTUw3cG
 jpZ9FMFODCN5eQ/0379nhHtD534nLoI8OfIjI6164Dx7RWkX63RQWYt2kJFS6cG96fQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=M87aU5Yz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=M87aU5Yz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FB9B80FF9
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707023;
 bh=pANSTr29EYYd744Wp7kyEopD2ODgvOEEhVfPIkd+Toc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=M87aU5Yz/Bs3WP+Bi2id+KkJZUwi8cGnBt+edRSk7xonpz1T8tAyDDQPqVJnLYIeE
 s/5FncLAf2FcK4rG1I1kiA/sYe7k/V0azILHc7lPClqTQUCVXMyEP8BOaqOaWHbxIm
 q5JQm18FhAeQh405BsEoohqVm6xX/RRW0SKiz6i/jfB5LevOnIsCtv5eOjFJSozpio
 5SoXWDcjqo9zPyWZeHiv852ykjV0F45rTe0GXPcBDftfDgPPvMDNEV+T2H/Q6OU1+y
 PvDo1zotV3b1iw/T7rS0jSgiMKhz2vMbAclukjeQJtA/s4FYs6b1YmN/bVHK9eaMLC
 hx8NKSnCkWNEg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 STzcE4kqc3ZZDMwGGUlv81QJ54nesQiG1D1NBAd44zIMOjz7zNZRGH4nhPR0elQ6Nd/VRYdQq9n
 Bz1b/BbQpvmqCGTvJJKM4h8dEpmRP70hLENdnVt+2+W8EDA3+OQ/8owwz6qHZSrcRaD67YGCsAA
 Pzw/7OiO20DgpJhs1uDYGmZycstDeBRa538yriV3d0cMJMyyX6LaD4xe1NG2JIj5r2fOU5oLpYr
 Tlry9N1IcPpECJJHINrLaAyySChiR4nghded50W/4jyI211EancWiK8Nt3FERbeQmBxJpRFz77S
 0eZX/52TKUMVv46QS7LqtCAj0lvbIfytAktNnMeuWP1O/4L+5T6FhWESJJ/CxnTR/uiSf++rLvU
 a5n3H4NkfD/JgfHL69UMKkgmucCmGmHHqOwp3kxkAIKqmkdndZQ+l5DN34cpNbPP52eE7Ydx6Gp
 qJNWsQ9dMlaF731FlYtDF4u5u7CCNcuxLfkZ598q7Zh4pDuiSyp2f+vO1oLjcNbYWscfmb+rEiK
 Jx/s5c6rxS7zHcwZYA9CeTxcFnwNDmJjJKDXqg5VWsJ0OjeM1IjmDs38vJrmEl+b1OO1ZX5Uf7N
 R6oW0dcNYvmK+MZR77k4PFPTjTSTfC67mqbqK9t43a33xvzXmJvOvpz7sA9KE+AYsPLhh3vAOF7
 UbxEr2PrOj36BQzNYEOY=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73488A4C5194;
 Tue, 29 Sep 2026 20:37:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcge-000000006Jn-3Aoa;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:09 +0200
Message-ID: <20260929183607.1849293-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 10/66] package/boost: thread needs more
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 406a5b4d6c..70e99aef11 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -370,13 +370,18 @@ config BR2_PACKAGE_BOOST_TEST
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
+	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Portable C++ multi-threading. C++11, C++14.
 
 comment "boost-thread needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_TIMER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
