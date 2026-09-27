Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D05C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D11140CA1;
	Sun, 27 Sep 2026 10:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaipWkxCe5CO; Sun, 27 Sep 2026 10:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7A57B40C87
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506605;
	b=aQ2mvCpk7ge+DHmfYKGb+V1UmIZmRoiLpraqjWFeiPVqgFKPUg4lH7veWayiiw1iQRnT
	 kvLL9LmdKks1GZsyCTPSZXUp+GMmgBCgd56kAwvyHCJGwrfUG+xZT/nBZw+5efRpUS9su
	 MzoT8/Ql6ONv+/9e1cvjgmTKbkzJMhVDR/8RMtrE7KWySE3PtqV2vAIkYkljjGDjyO3+y
	 1ohA10Jhzza5+7260+inFZsbj40PAXCsUZiAss91/lJfVbssWVXZnVI8RVMGoevzoot+c
	 3tL1s3Qv/9OiCg/nRvAaaIR59mvTrbYzIjB4/uModZVL1tqqRONNjNYoQkbqzadqdRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506605;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	b=Xtypj8BYkLS+nPCpUyRUjYvDfJs+ZV47NKQM0oh0QeLDdojKhc3+kmAbZ+D/VMwJYsAe
	 JKkovdYZrIK6igljMxq/tn+s4mYbw4R3c3+PKsMcVbFHGrY8tnlFrYjyY5JvBRBS1qpeF
	 SrPcrBxGuf2EEvhzBLnwzGg46QjqEv+Sw87Jr+3tuDKDtX9jv9gGdc5B8iWc7dbIPOphc
	 45FI9v8OJv7g8xSEg4AjiqFs+NmSFA1GUxlQ/1keHjXgaxfMZJqWgHZJ5q0yJNe4mpCqy
	 ZMpLKiYwZi0zsdYRDY1COzTb4m/rseRr6FbphElwk70gQ+Stal6nzR3m3qiKrXMAwSw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=QP9oU8VT;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506605;
	bh=z+AdxNtlsPj3RpuClS5bTZOoECb0K8xDh5ikjbTSidQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pQRyQeWxTZ2svCD2ZrNKaHXipwD+Ckj9q1MCd+QDJOOFQcthLp1A+w1nref2aFOiU
	 Fh22awcWisS+O9F4eP0TnrGGQ7P6zdN3nOGn7q4LN/rXxOwZyEo06/d2Cqrgg59Sv2
	 QR8NP8Jb6hmYoGX5y41tRjiXcV9eVe4xBAxK/w8e+39jRgJOuiTlLkH0U/GYfFcAHK
	 q1OtmlWpS7exuT2bI232zs6j0yZUk+gGKM3oHLM3VaDcXk0uE4KnosR7NNgdJbP4iE
	 9xWduhesq7QIbPxdxJEFpY/EqnxNbZC00ysWrieIr0uqBfHdRQnlO6ngjq3yvXE9Ez
	 qKI40Vh/q0D7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A57B40C87;
	Sun, 27 Sep 2026 10:56:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 897CCD1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F1DF40C87
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOlUDmFaTJq8 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7842D40BE8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506603;
 b=IWywvfa04krvILQl9it3oT59FT7lfgu3L1zEOXOGU8B87O6blT6tz/xTrwQjntHDsuEW
 jltQffF+Bf1kDSC0mai2tmx9Y0xLMcdfFV2AnW6kZZxIoAna3B/+0gENGwiw6BvOW9gSJ
 d7TfXQVBZeMaNxDDf1XtzLsgsC1rsnqCBK9SPalGLdewpz7egMCiWgsbyWMvneZT31vSS
 kMTZfMwkcSMvp3wplXBVMohteZ9lZxD1QHeJWTF39BU10EWGdxJbQaploN0GAOy2zWuVL
 0V4dCQ58dR37G7v5qI9GMZSubCD8txod9UB5Uypl+jhNtse/ZbUDv1iaSJ4jld/VE/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506603;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 b=X00gFgkzQ7Ou4UH+zhvISCr8tPtdI6eG5Eo2mtP/ZI+mBrBMuL/Q6UBEoMQDlyrDyEFa
 6SMk4AJTML/jndWQ/XFL6YvvP6qKBAY4hn7XxTFtxPhf0ZyJhear2dY6of5mtR8+DH89S
 ZV7C5Bofq3SzD3kH4ZI/MTSl5JSpydxeR9SDARQVhn1hCagGTZfoB5Z6RqGOX4avE08FI
 +HY8ycjhDmxuZ+BGWZ014uM6SMiYoxteLDhw1ou5AFXRLeXqxm5MbzfumqKRSvUlG5SRz
 zie9bUwxmaZkh0uE3FT1U9g9fpdVs1tSc8mPhrgGaT4sePr/ZQvjsXrpMLzogvU16VA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QP9oU8VT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QP9oU8VT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7842D40BE8
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505863;
 bh=t+wAoYYHyKtV+Eq97J1+gkp81w1F0wH1jS1vowMZLFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QP9oU8VTX/eDmBQsRDSTcTiU/4M0TNy5hPr0znJDZ+gECiOQ/Yn//qp5SotnLFj1c
 XFgc8YzdS7YSJ2YQRHoRG7xpgubIwdrqyG1qClX1Ww46F+EvAdoxMe1kSJz1ENM/vi
 ARLjg9Un8JEPsKgP5MDbVFZuYw+cX4nAzr8REsceUVqknuIyMxw/uGAw0lZKXVSaqd
 PNieIGW8uiQ6ticfDKhwyeY5EsxYpoGWnBXY/IcuqvOSze4ttFin/OicQz7b2pMJ7B
 4yshRzXCDGQFpyfJMcWbBiPNdE5xLKphNXySijqzxYGDHJigkutmWy/C1WDmb41Wvu
 UBndzTguhQw3g==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 nPJvmF01YVDEhgF1DN9l/79PwpY4Az6DHJgQAcgMDcNIlPdUCKPURA/DHNpTa38EriilMc/jVQX
 vLE5YrKgM3b8IDP4eyUrXD6/m872/4UguCK5BDnOURWUmKHb+ez8sbF5TFdfNPpSp61mXMaAiHr
 3L5OlgAhOErCDKMOtmoDpA1uEqjVpU0WHOEWniMhQD8jVDuZabnP1qlEe8YMP1h2f9stN1fgFFN
 rP+soXbMIXTkwFJJiUbmgvRCt7ncN2EAuKIeXJlWLgDsgDTyRmQoUfxff0R2sVhLeRSNZnUkEm1
 pc55h1ViTS2pyMcYqbuOIpqHVXGEGYJQtpUPS8oJeUeBQ52buoXvXexCcqArMPdcbsHuWEIi9jG
 fRgv5RRBsESaDxqreszgLZBdJPaOCshxto9NYJsbX4qy9vF5D1Du9foYc725ze0xEJ1s/0PwkAu
 XDsR7c1Dq7JesWt9WjRf1hVxg4bgWKqitUS31UHDx/Ly5xYymsK9flRdrokQSIEvWm7AnX9l/no
 ySc+CA4i2bLLDBnfANXP+nCqrXZ+Cne21BaJBNuSOu4qtXcFIWwQhb+GE1hFndrrG2gHX8Inm9S
 MWdEfMObgi4e0Uw/X7gmUEEyF048qJDY/rKpCoHrGeVxo8fd0L+OIBgsWKdaZhgXzRl/cqWtqRO
 6X5s4qmbb+wiCuGolnsl6
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01E4AA4C5073;
 Sun, 27 Sep 2026 12:44:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-3MgL;
 Sun, 27 Sep 2026 10:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:18 +0200
Message-ID: <20260927104301.1801638-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 40/82] package/ca-certificates: Replace
 c_rehash with openssl rehash
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
