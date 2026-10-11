Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86071CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509E960617;
	Sun, 11 Oct 2026 13:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_Tp02uNR3vJ; Sun, 11 Oct 2026 13:04:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7404860611
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723845;
	b=hNeUhKV0Po7sQoDIDh3hcNyCebe9EaV3iyjOhTCKBy7wBLl6A0bVOYGuBUldWlOLF8FJ
	 vpL29hq5SEyJYMzXi7kZVqahMS+bOO/SKuNEN6rYZlTGcRtw7D7tyynrvb+i4AXGSVynj
	 MxTuNmDh/4dyAwvWvW1iGBwZvZhf3Z5vqBq19ci6ZjcM9sdQZ0L9IbEkHL1F7gT3qxyAK
	 ppxIqApftT47HI7oqQ9Oe2r7qIpCfW1G39sSD0zEPWQZ4+oSPC9mVwxiloYKliYXIhXN0
	 j6gRo0lCMEbOxzZEqqQeRrnVIhK5ae8yUJr1Qhj62cJCA+UNo8vCIwrhowt8luy9Tpw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723845;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8zWAJoyBdwFqiotJ/1IX5Gc8Z1Z7vKiz+K/3eboXSnc=;
	b=g3lwqT4AhO1MTMh5U8tYg8QY0/6DebKh2WAX8uOaehqfVb2rAyvCRdtEhqexsvB+7dXy
	 eggoUlBUAo/m2Zfn6aUyn7Z1nROqXYwAaThKZbrGq9NJ1w7LKfEUC3jge+kvZ5vRQRSTu
	 knvKL85TJwTzZzoCmqv78e/xoRXONUnkHQBjLfO5WGl0B40L9G2rZwBEHD1fwuYUhMw8J
	 kLLPHLm0M2TGhbOaUjHPjR7LoiGHdn1Uy9Hotam3vC/K5kwwMDnbOd0ypE8pnkKjPI5rE
	 x0ZC3KiKr/C5Bb6cJBfd5qnWjod0vByLP7eVfzrDWchZQMczf9MVIUP65YD/Ek6h9UQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723845;
	bh=8zWAJoyBdwFqiotJ/1IX5Gc8Z1Z7vKiz+K/3eboXSnc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lp/q5PFjL6qyAjXTMw9Upwphks4aFhBUGPgAeQmTqEtXMTjJm7gfvnqHGNpNL9XV0
	 NGvlkBJusnukWSrnSZeDyEd8qgFWmpUzW6xfa/MeFfgDxM37tpT7R1y4pfWZ8WF5Py
	 /Gim1xVjk9z2NkQNkKj/7OVLiIAoD6tTcotNEL0VGk1pZRXrSLoobUOEHboLAirbMo
	 3eDPES8kyUSfa3nNH/xHF/5Ij8OHhFOkSk2dDO0v6s+bGINXxnIr7KefLZ+AjCMTV3
	 K57nQcPAjYEzPVM71juQwmkv81/yUdN2pBonl+yvC1qibtDYDmq3U0f3ctnEIjGXJ0
	 djS53bg5o+mZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7404860611;
	Sun, 11 Oct 2026 13:04:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AFCD111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0175440071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9sDpHb3-GSB for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:04:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5225B4002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723843;
 b=JJD8CgmtsZCnb4ChnjYWvDnlPVkFqfXXHmxkY8EEoypDFNIfnKl0n9rxGFjyOiFZVZL/
 Ic7TZfAGOUYEnZdKzkSh+8zlrNua0vGuHDoEGu5jIXpNMM0HrAFxgCgTq5WoF05Wuthow
 vHHo0P9UcresaoVnsWPKnJjeswnkb1jaJAICcmLjjPTPeZSZgI0SE0qEPRM8rHe3PABrt
 BYYFUDpwKrstrZ6KUBnmeB4n4wv1cUhlVjX6PEghMS2Aw2/EdSe4hiDu3ydzMEl7Iwdxl
 ko1OeOvFojTPJDPrrSKtEE9N7ZtHqTAPxAnIJBWjdIlALMmDXPheNDS2/VP5nE20Grg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723843;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=8lFftwLN5jFP0aUqyv5knJnQhOjQSXU4NRdRhCftBZ8=;
 b=MufamPHBZtZmPVINUq29Je5T/yy+dbj6dDuXMX0UEIZWDiALTmW/HHvIuBqVmbmL0n8+
 d4Va/JuJlC2ex56dHMmrj3pr8zXiO0rgjNZ7LBDI1dsVNRJG/3H0NWK9bHFdDW2R8Nb2O
 JMEUYdJvqytIUZbGEyqG/uRszyzHQgywbt0fOeugElUVIlZkI2iFXzyJ3efJJzOvqaXpI
 VI6yeBjH2HgJToI6TH6nEyQ+5b++lNMn4gCNBquySNZuAQYoR6Doyyj6iecRKz8a5qnsb
 7Ccb9En4rPRvQ+jnkg98fhDkE2CUp/Q+xuSkcahYX3/RXA6MU7lcbLzrcb1piCrJdcw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oXfgzWOc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=oXfgzWOc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5225B4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=8lFftwLN5jFP0aUqyv5knJnQhOjQSXU4NRdRhCftBZ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=oXfgzWOcDPKiCJe987AfdBpwzZEKegbss7ASHmLXGRyRkxjnxlZY+P3iVFZ3Fm6xR
 nw2etBepwJgoZZZ/Tk+4Rz1elGZ3WQBMOX3a7goSUWpDlB5W/JAGLp3iFT0FTieKRx
 qXEdd1Nv4sGYuxl/sk/HCnJSH0z997Sl8ll8P7toI3cbMw7UWaPDvwEbH3rhvIYGNB
 QQ8iN5IbkfmTVPtO/J9Tkix6l63nyOIdAb4v0bMqh3nUP9c1ijw7drlKxtdRjd1uHs
 a/6gDdkFNBjNoIfsIcpiBHGUuSwMRJMvLSnMI5Ch+ohng46pkDing7tckePA/KFcoL
 Eha6a/7/G4Rnw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 WoXVcNBmj2bs9C4ZRWfLtxb11NHbPwW/kvrYfyg0MZcmhdzm8zzOIVFlrQhp/tTWVzCiZnxiwXD
 VY6ffRY6ZfrHUndWcFohlGGLBV4bQJkkLKYaDpsXrxgRg8X81upmW4oCJ7GwYKZVlzTzPolFNhk
 j1pb19pl61BckUDw76Pz41mT50ehbDd6MA9MLnx+jYGiq28zM81SCQtFYkX2ZQbW+VnsY/fnTWz
 pOta30YWQAoYSNdUKgbWwGazIY4pbYTFPHqaJc71JgjAeQn7fKVBV9uFyQpWQUT8R5/WkiQTRcj
 IfKGlgFtDfBthx3oMcclgV+mN07YbH+nzd0X65ePJePYyHdLFIpDuHe+XSfb9eOl23qQgzCiZX1
 THTQY/d74hK8yU/9t+ORJKMT8XQvWLniyuqTAHG2Ku91Uzc5l1YvVSMajblS89Qjei0rjX3fh3p
 GxxIZgJisCfAdapCD1KUDFQBb7OGaovCAjrWETEc78J8h3dVQGANrZYxL/Gx3F1oBiabHsh9iYU
 /l9hBDTJQQmx73m/wFYIjN5j9MGaQJlFFCzvjB8QRRruMxoXRQZrJXVGD0bXn/zNggWohGvp6Wj
 LTeM86acQVo/uIK9deB50nbwSpYJBdxqjCvKwj1WylLJWS4=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 907BFA4C5853;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-0g6a;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:14 +0200
Message-ID: <20261011130058.3443432-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 09/52] package/boost: thread needs more
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
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
