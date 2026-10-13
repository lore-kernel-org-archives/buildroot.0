Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A55DCC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C86D780D5B;
	Tue, 13 Oct 2026 09:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9-AinrFTXf8; Tue, 13 Oct 2026 09:43:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B71CB80C8A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884599;
	b=UabBLhohbdKNNbpPZf5qLIo9/C3HhS/6d3d8+5xco+51QaVsJK0SRPRnargnglwP9/c9
	 cQpsyIHOfiVY8ywSI05SUjlPzzwNlqbQnNvht9nyZb8pUftRgUagarpSUtV2rL6YqpHbh
	 Z7PQugR+Dt6UV8QejZhadR3lUhaGza6GlDL1VPXecxZx9h4Qi7Os/MoOpWyRh6tJntiFA
	 k4B2ClRpjOcVznCtlnSbjWkkE0utBbHPk9u77IVaku7kAOUq1plaH+KBFM3iL4IaIjuNo
	 N/TfJqiAPkI+2+uWMtPW1lebjGlQ53w/cEu9v61izHWTZJc9vbe+lBHULoRxUFFFZTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=p6HfUmrhhIyrx4FM8oQcCjRNyzRaIj4fd400/y2ZIq4=;
	b=dky+cXvnLOPO0BjfO9LCg8a6v+xK0Sxv9+/QszZVTkDIpM8EAS9KSMw522kF3wKwSvoL
	 tiPdvXBgDYfFCZeRUWXkD5/k+cDusLGk9ovmXrQWb73NS8FK9MGKiCeAR6BVLkz4xcaWh
	 360KqHhx9ct/3rVFrKo77LNWxsQA4/AdknIf7jK6Iaoa332KqXwAQbN2vh3CJU9D9JV7z
	 QAX0LGJhtQqxfGMwm0tag/xSqsILQgCBix1JnxW2Z1k4jExMmW+mFg/80fIlw6Jl50ocL
	 gf+6YE3qllsktnWikJzdpdH92+UbdgDJlmqdGI7cAGSFLH7xwzc3JFLCvP7jljzvdSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NEEvlFws;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884599;
	bh=p6HfUmrhhIyrx4FM8oQcCjRNyzRaIj4fd400/y2ZIq4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qc7MeOu1icS0GzUBdNnPoHX4Rd6bGeXhKur0WFdruGu5XnuZ49ThY2x4d+7EBG3qH
	 KDjNxteXX5BRoBiN+gn3XWnXv4RRpp5hNB2P0q6mwcDB1j/VM1ff67FiWqg5xwNSwQ
	 bV8pkoUUtUNMHUpNS48lttxM5Cf+i87OZO9/UXU5hstFiAIJmIOCmhAEg6Z4nUZSZn
	 WeQOxSoFdWViy0s1TfOK+xlOcBWiUcOc10RlvIiWbMxlom9qouRgd5F7vIpjX1DoA2
	 faH9YHS64nmg/NpKSv3lxlpnvPuKF+KNV8fvXG0+1+Lu20rQqwSqCbmqJshQNWbHzY
	 CioCYHaPphOYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71CB80C8A;
	Tue, 13 Oct 2026 09:43:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5515B75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B45880CA4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8o8J2flAVXTR for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2221180B97
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884585;
 b=RGstrpVw79DYRsbHT+pgxRJLXUehi0dM0dUbgg+LvPinS/bx3+GlFlBifTgds7nPv3kb
 yuvVETT+/mDanNEC/dW5QYuTI/A2OZ6eto6FA4csWIP25lqYNUFLHSgSQmN6JLI+K8MuE
 DbKs+hJhNRPXyzzoB0CyegNMcUfrNao4gNoL1yFEN/Tix9dXUVoGZuljmkNbgr9xRlvix
 RQOxXLdb88kekiufGEmSQXgozxkhKzaU481fbgQzKOsH7UIwq9MHcyBWBcuu0xlFYbsEt
 2Zf8CTSKJroBQFX9VQL7+qH6tECDaQwiTF7djOInSUr/vLn16RQJcIA435/yhI+rhjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884585;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=o5CDlo8O0/uPpeLwXQBI7c2jesQtWpfrxeX8EByQGww=;
 b=ke1evLJR93PMC+lsNQ2FrlOPRVnykIqciSWpFBN9ncBeP5W30uBN+nIuouEc96XZfTlF
 /X+fDy4VKJaKjjnfQh5GfR00gDzBbEOGISsblNgbMxPVJb8Bw6Uvf5ofv3AfJ6Omyrvpk
 lXtATczHauw+dVfBLlrOVk1oEqaVVk4qBxS9OLtY9E6GQ6yPuNrX60O2UT5ivWeb/ayYr
 ZbC6iFNskjnDr7HwN4lFu41qLq3mnG9+W/nRHq4opr8flieQK2i+Rhk06Z4TP21KHana4
 aEE5gXqTDiPvcrRwCWmwnVpLBnjD5R7jmz0fD+dLkg/0TPXsjHsLcjT0m3qjd/9jX7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NEEvlFws; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NEEvlFws
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2221180B97
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so23640455e9.0
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884583; x=1792489383; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o5CDlo8O0/uPpeLwXQBI7c2jesQtWpfrxeX8EByQGww=;
 b=NEEvlFwsCbMvF0UMUtFVs4MNVsJ8IksX/7jIIwwD9dF6k+ozQP+ntK5BFWzhxTxzyn
 iy/qE7Zdey/m6qHzuzj6y9+yPOEQq4qNTCfm4Fn7jZYoVsdhTxNb9B/lX1YfLCMQwxxm
 BlbU5R1/AJ9GdnmkrACCWRJaB2nOs/nRfydiwocLw6B/NGfTZQZo82ZbkO4zE70j68wa
 Fotl2YZmNSvWk1QbRb2tpfsKRGKXewZjKEzeVMM+z3u1TLM/cJ4jVgMAx/CPTRdkqWR6
 rvgEkMJYrVrguhBzfXHuBZVGcnFcYwAtHITr5GY8qZfPdhkFe0VmOhX40Cp2c3RyeQw4
 wt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884583; x=1792489383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=o5CDlo8O0/uPpeLwXQBI7c2jesQtWpfrxeX8EByQGww=;
 b=Ixu2lLwE37SablZB2H6IDaElaGvfXWIKvpg1e1+PQV1Sloim8k9qMssuTWaw8Vzr2e
 WyMHaiBBjI/1kDuqZlnnJox5bW62JMQJlIffNL65ue4F+hu2VnPlWiaN8u/TPSm9Zf7A
 CWyUL2V6fvlRUYrA4CDVXOUlv56Vtza/wgc3KyXAW2qwNbQ5sSmtqMJQ8p5bd0SMksSM
 BxFn7XwC2pMzvERkeSBIuhohGWLbJERRhZDYOSHQ2PXsJ4sB2M6ko8VBjRHlc6BeXIRE
 QgAxfaPcvNKLZrksc5AB+TFhn5u3e+weXjJYrIu+PvUp/bvjqD35f4SFBjytFP0xolJd
 Bzbg==
X-Gm-Message-State: AFq9FYLz0CmtO/a8xfY9IBBpGJHlq+/KOnDB5NnMQt/qyHjMN2lJw6eo
 U1ls0xUfMqDZNpP0WhKTCVtZFyCMMQRIch13SlJUXjwQ8wRp0orQ+HbvBiAPdQ==
X-Gm-Gg: AYBFou0vW4PUiXg3bV9PSr/yH4JjfLAEiX+jDrltmmwmvxgGW1SjWIzZfZpBawfsPYO
 HYLWWS87rTwCd21B75Th7WvGU/AdVTZU1kBGwVKZNAViiImMlxwobvihzyFiMwut0sI3Qq0Mnqs
 ScqlxLenYy+WPUcP7eU+mJF3ALranKGNiFR1p0IUeWVazFpbgBY/fIr57bA9w4mz9+Gxu/zeW95
 5swg1XfLa0lja0w0OhXy4kfCyLwDOh7GZ4uJBFbTVv3JsvOlKhtnu5t9qB/e+mfYsNORBd6Wm0s
 jOd5Us8KzkUthoD9VXkFKKywoOTs4y+pcyIJpZ+bNYHIsLUOt2lliQ9eFLSIV048aMhVMW95O1a
 fhyvHc9q/Eqrjkip6qcTTCegRVdMDh/fSIWxM/+8FbtQTqsvY8bTbYVch0SA1rV/WOw2Q7kEqZI
 aEkh0bHZQhPKoKLSYII1naZGtF360c6a6tZ38tQfD9O/Rg2SKT1Nf9wcx7/wZEEVHL1mjizFuRw
 MstadM8ugW5VOvVIlXMa6BvpHlfarrw2fPNDtNS
X-Received: by 2002:a05:600c:810a:b0:4a0:2391:6533 with SMTP id
 5b1f17b1804b1-4a18e4a954bmr209817445e9.21.1791884582426; 
 Tue, 13 Oct 2026 02:43:02 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:02 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:47 +0200
Message-ID: <20261013094252.96761-9-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/14] package/perl-module-build-tiny: bump to
 version 0.053
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

diff LICENSE:
see https://metacpan.org/release/LEONT/Module-Build-Tiny-0.053/diff/LEONT/Module-Build-Tiny-0.052#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-module-build-tiny/perl-module-build-tiny.hash | 6 +++---
 package/perl-module-build-tiny/perl-module-build-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 9f173d3f1..cf97f34a5 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  91e56a426d82dbf33761984e26ed8acb  Module-Build-Tiny-0.052.tar.gz
-sha256  bd10452c9f24d4b4fe594126e3ad231bab6cebf16acda40a4e8dc784907eb87f  Module-Build-Tiny-0.052.tar.gz
+md5  606d1f830f0475b6de53b82aa3e5d36a  Module-Build-Tiny-0.053.tar.gz
+sha256  3726d622da6f655e88fdf89e4fd597709c44970b47de65082003e8d86b5e193a  Module-Build-Tiny-0.053.tar.gz
 
 # computed by scancpan
-sha256  1ce3282467869416f29b0c5f7773d1b80181fb9e08bef64e3829e8c53e19b64e  LICENSE
+sha256  1ecf8014e44c8dbf80b40dfa4bcca946f681301d01805983913d19e10cd25532  LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index cbb2dfc54..27f95328e 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_TINY_VERSION = 0.052
+PERL_MODULE_BUILD_TINY_VERSION = 0.053
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
