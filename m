Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110D7FED3CE
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCCCF847A1;
	Fri, 24 Apr 2026 13:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwBECS8zcSK0; Fri, 24 Apr 2026 13:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCD998479D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037776;
	bh=0vuDwUhScSw605X1S8kKwhUlIZL9PiIPLyXBkrnxfeI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U3SEW62l2qvmbcFtpNlX5Hoo8XZYEXPB+Ksuvv0mJnS8vVsVciKV8C+vRXY+wvo+j
	 3UtcbJZJW2AUpJ9i/4GQsna3wIKMmA6RWd2D/82NB5ZKiq2mG7Yl6HsMeu/J4yjXjp
	 plO/kj+DMw+QhKtEyRtXeemtdntfj46Ef1Cc1K693eJ7I8Q0B540rrh5mIhhrD48M+
	 rNJvR9v+5pucFGrpg0gZ2oZ+Rhqu+rZNaiFTb84l+NgcQukoKRwTXh+SbGeTc5yMYO
	 p8otKEv47NOzyTfjW+rFyahnoTwP16YIM1/pkXVn1JKe5BLTnLCr/puHTPliEbdjEm
	 iftoqQybeqm0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD998479D;
	Fri, 24 Apr 2026 13:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21B18206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 142B9400BA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKEKzKJLWbaO for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5A2B422F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5A2B422F6
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5A2B422F6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 67FB55834FD
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2B1B3EC29;
 Fri, 24 Apr 2026 13:23:40 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:22 +0200
Message-Id: <20260424132326.825570-8-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEEt8xWTbxUAIzemJKA8xn97uK0OmYhEzymikAmIHE2crOc3EMMnXizTmfOkvSZJM5CPXR22J3RuVsFpu7Z9ftUsEn0wrKRlBmMxruyxVnkIYxo9No+nTTpur9bIhJx/c5gCbj0nY1ZsZIk1suwp35sRWPNZd9Cy4m4CHq9+Tr+l9hli7WXRVstaBJFum43Se5s3MwXTBBWA/6hfkzqwl5pr5nz0hwvXxiveGxB7YkYaL5iKXKcYgy/AQzM48YVZ+UQGMdNCHe6rjhHYU5Vb1JbDKYpiIz/zwaaB0HsRiffk4YtrXQ02nsCdkJXrS66IsSqWUBI1XsqVzWL2PDwFeUcTPPO+fyXoJEH4mKzD5FcvwzIt8yukDvoiiBqM6ngvx48eqgMrEhtBWZhrsQrKpaXRfBUPqJVvKl6Km46NIj9v1acY5mTyvAcFL0u6X5/1vZz2y+llYgYZiexJe926c8+3TXa0uSPy3dtE2Zt4tRo+um38bPlWp6+dF7y0jf6gFtagL6lQRhUr/dyLpyLq9vmS2wYswcsQZyi3bOxQ3nkYyIfAIl23JjEdEqT7zlBYnIZ0ME0P48Unq4kWIqTBxvijUiyPldADT21wq2FmmRzNgOudbWSQrJLakXN1UdVcbUlaQiNvp8R83+/JuUI9j40nGNFsQjxgyoTawVvL+VCfg
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3h/us5pxLPTtlFH2ER0ee7RHW2z9cO9AvhpadJxo8I=;
 b=OQuRlDpSXRuZdLi0pdD9rVLxlkQgWdpdErTDonKojWwYYezP8Z0KC0A2TvfrSGv6k2bV4E
 PqcT+phHVxA3MDJjpYnOG1/75lUOOKuGx/pVNDGLJL6/lPIgy1Hew//iZlRnoFe3zDAjcI
 CjL5HNX0eJtCJfMFB5nZaZEmxm0K7t7du6OOYD4CrYQN8hG1WlpVxhRKidVs5YbvIB1LSA
 WDSQBfqVk8/BcE5phqP19MMpR3AcUdZzkSE7sXgqhg3HChGCi4uWZK52+Wdqs/k3IGKk4N
 +9rwdFYAv1yBJdlSnILp8CeYG7xPZIEPDYEuUk40nCKvQIfVmBHh3/HPPAinCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=OQuRlDpS
Subject: [Buildroot] [PATCH 07/11] package/dropbear: disable ML-KEM768 on
 m68k
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ML-KEM768 post-quantum key exchange code (in the vendored header
src/libcrux_mlkem768_sha3.h) triggers a GCC internal compiler error
(ICE) in cselib_record_set during the postreload CSE pass on m68k.
Reproduced on m68k-buildroot-linux-uclibc (cf5441x, -O2) with both
GCC 14.3.0 (the current Buildroot default for m68k) and GCC 15.2.0.

The failing pass backtrace is:
  reload_cse_regs_1
  -> pass_postreload_cse::execute
     -> cselib_process_insn
        -> cselib_record_sets
           -> cselib_record_set  (cselib.cc:2869 on gcc 15)

Disable ML-KEM768 via localoptions.h on m68k until the GCC bug is
resolved. Standard key exchange algorithms remain available.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/dropbear/dropbear.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e4e42cf994..52bc15e346 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -62,6 +62,13 @@ endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
 endif
 
+ifeq ($(BR2_m68k),y)
+define DROPBEAR_DISABLE_MLKEM
+	echo '#define DROPBEAR_MLKEM768 0'               >> $(@D)/localoptions.h
+endef
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_MLKEM
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
 define DROPBEAR_ENABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_3DES 1'                  >> $(@D)/localoptions.h
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
