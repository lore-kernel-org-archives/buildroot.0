Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD99BCA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A32B80F02;
	Tue, 29 Sep 2026 18:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjidjDWqDg26; Tue, 29 Sep 2026 18:41:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B021F81061
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707281;
	b=Er1O4CHRCa4Ic6FMuHO3k90i2qBX3s/0SlylcBXtDrnFRBdS+nKH9PZHOB8H5CQXAbJa
	 5aCvlTTJGLnljKJoz9cf0GNc79skXgkZjzehWAviSMRJZIi59TZGQwxXJxTIEuwjO9inu
	 URwOppLmIt/0eqEJ2XrH6fE/UMNpWDoS4Wfe8nIhGv3czF0YOtgPwcHBhUrU9Gbdyhguk
	 /XzAIDzX1WKNiF/7lQZAXDvoXh6PLs1IZ8ea92PaaQhGmzdLreUjH/1FG9V5n2dSEV+p4
	 JmlJO0qNEhNuveez+yb6GW2g2X0oM1ZpYiDCoUlRBKp0n02kh7Xpyn64xsTp45tsw3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xiXy3gyj+ejpB+UM4fJlgjYg4bUPE5BAF/AcN9eJFbQ=;
	b=aMLBgidazVNMWFgTlmVPYmJ1ZAWAZdOAfCqqlIzcw/r0EZBTghXQ1U/YPTmCQc6snbTd
	 6yDdbLb1qg4+7LKEcgrVb8HZClhJ8VDaYJM5Na6wulMqnJLxkvbHnphqNkIA9enLTm/C4
	 gXX0pUgVz3cu+u7c0oTg8eqOG0qxXbZF+sjR/vPjnKO/i9+eYbRhW3Z9DouXJVPJhQExi
	 z6Z4jIzmXFK8BdgJRqZ7HRP8BM4XCqJ7j3D9IWPz9Iu+/JIDnBbsBh3IfIsq3LeO6djbS
	 mHGaOOT0RqEfUK9UP1pgToQ4sO2W6euZJzLu+ue94FIGcSi/K0oelofqXiuEnrNugjw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707281;
	bh=xiXy3gyj+ejpB+UM4fJlgjYg4bUPE5BAF/AcN9eJFbQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bGG1u9JV+WEzBVwqiVvAX0Vmu+sjmg9+EtUqmRitYkwUCqnldZ/aCfyMWBbmL9E8J
	 Fek2cTQtzyrArGUrnCi3fzcYKoDWGnl+tO3pdsdXa7oONtz+BHzE2KmnQthZys+riY
	 jk+VW8JWqUVkSA5W1foMmv7NlFjAhW0tsH4BlRMNbXzc7IK3uiAzY7bF9xj3+vtLfV
	 TD7dPuKsDfXUWUWyA5ozl5GHcSLCZz1vtV+uJ3Dl4VJZZ3kaDYvDD22rPdrvBAFdMa
	 g1kr09qLsQF89dEKOU8eHF94qGBx+fnMUxE1I2iKkhztXGlSzQAm8jILwJLR6tsNA8
	 pEHXuZ2w6xC9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B021F81061;
	Tue, 29 Sep 2026 18:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB76214C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1D414032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcDyOnp02uNc for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:41:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E01B7400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707280;
 b=s9Uxg/kCONpbxuqslWGXVs3ZNvdVS7FsQyhWZlw8fmBHDkn9lUpprvjoZCO/OLx06oL6
 9sTSM4jcuwvLCBdGmrslY/o9MMvePbE7W6Q4/GBowKOAVQH+PbEE54XQybdX+JX509pyP
 bcc98rtCtNCcHNAEQKJlGKOOR6jtkqIbUnYkP0hCKuMljC/atXIjBKvNg8pIWQYu3vji1
 u/ajHq9XQ5SJxYn9+5PIkpou0Sx+kwuX4jn7TtViM2h+Eo7ybm5T2rFCz3dbgk2JHsLck
 FbVxoaf4A5vJRLxbNTptqPzhSqGefxLj+5axTtH6EFxL9R4UDHJ3Vlg+7ZBeXjCsAnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707280;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zfPLvTA5gdZW47ktjNG1njRAyG4kqF8faPHQKL8Uf6c=;
 b=Ie0xTIrl2U+HwLevfTwjriBGLjLIUVMXtZu9q0qaKmyhfoDnya4EQKRMAT076k5smLhX
 ezfC8dL6N9hC8l44J50K/FzuwsxT8WhcvBdXjkAlTIyU7kaTrAOnaEby+ZZCkXTnxscmq
 7wpLOvy3WsciGM3Qg1wUfKtbKk8nHkAlfCUoxBtN9tUeG0u3gZnBs87TSh/byOb0NQR0c
 2AU9z5p39gr628kycDStV4QU45wkl7QqfbQ2a6yBU1yFaO2y5kB9FhE63/hZfqr1ikOc6
 J82cA5n1HHDlQs34eNmFjwewHgB+ZJMiklHrhr/k+EYn8TgdyTcglMr7MDzAusWg82w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gugaJEhF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gugaJEhF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E01B7400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707025;
 bh=zfPLvTA5gdZW47ktjNG1njRAyG4kqF8faPHQKL8Uf6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gugaJEhFFdqS9Xyid5YsPghtP9+HSPat3L9N/XLb3U7I26fx7cTq9Z+oCI6IjePIz
 dk4fMKvtzM8tIzM7RXXRkPyOyEkVVipNTSg79gEU6eACT4lb74qxutIi6B9sBjGPGI
 Q0RHAfdzfgQywObsP408S/FXCxdYlIVR4VYFDZbHnfHuXszb3JSbXoAQ68gtrOHvo4
 G2zqnzENRlnziRhkxZG0p0+0mdt4tuCayC/r0IbU/3K6HyHFRjbSAVTafYVkU0l/Qt
 RfSRNNiFcNNLw1t9/KG60WlxkRJ1jWjpkw82XlnU0jsP2F7X1XxF61OFvsn9YUoWzG
 7DQt+TEv3asyg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 kuNy01X77GhYqto+Wp18c2WtdYtGRkOztMDft+GP/ivTYnjw85fmP2ZYIU70EyQGoqjkaC3YxMt
 GwZiVqTauDyMiBlwa0FQMRHJwW9KrrhR3ejcSV2m0yP0CzjD2Agzf9HDHQX6VZ3TpbXUC14kdRi
 cOm2JuMeIiadeskvscFuXDKCpjm6FoK124l/q6v3a3VfYOZ3kVWHp9AmgeRvhtgJmJgP3o/SJ3p
 oDt6c4h+sPPLpn9YyvSRVXie8Kj/elhAtM97fQwt9+Gl/o/gNaxNEKvsHFbsP5OkKj6oqvCyxsy
 l6uMxRtxZV9w6f0kcHlgIQYYSfJr/ghUUsOZ4BLiaW8xOlophrTcY/Pf6rQxYJoQ0AvvKRinZqS
 TPHoh9EriZM6SlbLdMj3IWPZuCVToI5Qqr5C39Ak0SOMecv0kcObwLWOHMftU9PnYnaXgrAwHxF
 Zkfmmx2dvbzkWmTiL6QVBtjw7xb1qsHMrWcRz0rLN45ndOVBwpPeIU3WuvssKAxU/a9mCdpIbsk
 y+PhSTbQKKTjdbSVnJY5z5E0cI/y1NeRIXxd6CgctgvkmdLgb8v1CAf6pCjZwqNw2EliMKGd4NK
 tzqTpDwYWrRf8oGLEeo2mlbGtkdiIwcCXcuLI3y4BRaFVqbzMcoRtPtP6jbI77+Qgdtug+b2nJT
 O8aBh5N5pEg0TG6Q9HaQ=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A783A4C51CF;
 Tue, 29 Sep 2026 20:37:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgf-000000006Jn-0X1c;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:15 +0200
Message-ID: <20260929183607.1849293-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 16/66] package/boost: log needs serialization
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
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e88f497f6a..5ab351d8e4 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -243,6 +243,7 @@ config BR2_PACKAGE_BOOST_LOG
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Logging library.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
