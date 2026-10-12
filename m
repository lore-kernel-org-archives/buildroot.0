Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1068BCA9ED5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD241606EF;
	Mon, 12 Oct 2026 06:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRTYiJQWCQcd; Mon, 12 Oct 2026 06:25:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C12886062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786358;
	b=X97shaXu3Oaq6Gz58DNO/LvxjX/X3FVM+G0lELJ3nfVbvOEvYKNbIM64pmc2YD6gGv02
	 5d9ZccYzzIUK1E0PLRBwaUNgQAWCPxPgRUBx8cfZ/JpIXJUwcEgR1ohiavhhfDIUqy3Lq
	 b/1L1uvPB74Vw9C6o6gPzoOy99uoAQ+XvC1hIIjZOrdAPrru222C7YGG8SvyVQeaeLJ01
	 RYYk2Z1lq4t759iB7e/QQbfODHw7mXObe1JDfpYq+plD8FEiHAKale9bJNMZKOpwofCRP
	 Vz9Ht2JJe66X2frWKYblcPw35siE28ClTC0jQHNjOEBwWC4W0f6EniqSgAStptxwByQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786358;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Sz4iDeuEb2/d0El9u4EscPTel5800vpy0DaM2ww/1+A=;
	b=NBV/Upo7w/JYFxErIgbAIc7sDpotAXPJe9dJOkzAUAuRmrpmMFJBum/OVooqPN2bV41G
	 pnrTg8BheVHj9mg3G4EY/bxXtjMQoLUmU7w6uabnogfU3sMkMQLjyLtjHMYqIbOu3ciY7
	 7TA1QKofaLIUjeslR0RHF0gaRNlTYIOfX2lPuEfBK/v8qnEVWV6wN1jcINdfUIdN02j9a
	 eKZUQWHT3WvBTtjxny2ONCBT5tmarPpiBLIAD1pwRKe4U03tW2bAIzKw16H8MBQE6j2wp
	 8ZqbeFDx6ZGph5wSoNM/7/2NOnO2PtPytCAIu44HqoCbqzly7DhREZC+t5z8aVMW0Dg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786358;
	bh=Sz4iDeuEb2/d0El9u4EscPTel5800vpy0DaM2ww/1+A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNmiOLTdY69EaAqQMTmu6A225HrFwZPqcUxMli/o0o6JtvpEr9zYR2iwb3duYREUf
	 elcJ8Zdf1JiD4gSC3xCFG1iFmRaVR4P9uCJZ6mj/ZSlvaZHl/AQyB8+bkc0vCQMWY4
	 Qcphd0WAucLkTp5eGcP6Un6mKFGOJVPsPd+SDkZBZHAD2iuCz5EDWevReJxt2GfYsM
	 BXNYlHxDSpZm7QVjkHaNWjuVmTLzsiM0mMZAmGjQJ2kFOJi1k1MKm1NuCqwXapxysz
	 khz2fhJ3h8FRafBuEed7zxuhebZpxWaZEsbxILked3XEtBCS5uXfSb3tc+XawAK4D/
	 vnvoFYt0NCe6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12886062D;
	Mon, 12 Oct 2026 06:25:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 660B79CF
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63FFF80CF8
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Shvv4PWkPzxs for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 51DF780CF0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786349;
 b=M7djLHjyTVQw86jEdH8lbkovxuEdEHWyV5n5bzcNlPlaxVNgAyCNgC9RNRJIMfaWnloV
 8+1+9/413flwRLqZnZ4w4Mlcbz1jQR/HK468EUbGuCXr6fX8A90f6+qZTxntE9t8Lfkgd
 0iQBVcr24kYLcjBlMSqY2JIISJmCJrD4lFH941bRDhUGtHPS4t+AbbPdjU3Kdl8BTKWbp
 jBarOg4424mZ9OKYHzHSFoueSdLfEK6KxSyk2pj2aB4vy0NKPK9uysX4Nk0Y7Ktuz/VoC
 mJM/9FQyP+u7f/XENFOu7YkrmElI28/d+ek2lDCU8zu9c8ZkVjp/W2OxZPxHaS86gqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786349;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=KoOl0WWL1BbmaElngxr2kK5fPl9xDgBDREeRwP4DpKw=;
 b=npClmW96vaP5RV6u04SdK6YXQdwgVgveGiIq50ToejUWgjS/3Gzd9FCrrCq3ZStqSNUD
 Caz2GO2EAhUWjDevEx53MIl15HpEzlTnBFfWvPDQSWz5EUXKu1Jwn6sPaz4MrHAtgakXx
 AHysm5UlC0bgw8ZpAPYtwdwsENwUU4N5eZJ8u8du2fl27EmB0ZJ38nIVkfk1MTMXmMv4a
 66P1mUy4Fkp1Vxnnd3sR/uHmWCDJOxxGLIxrG/yH0NjDT8NKsilJSoOSHJkRQ31lfzgr+
 AKqOC6eX5KsUk9y+kW6/mKNFbHf0dCWE9MdlJjpiAFEvuLtly6QJJt44sIHT8AcqL3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=A6GGpyqp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=A6GGpyqp
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51DF780CF0
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso19260225e9.0
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786347; x=1792391147; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KoOl0WWL1BbmaElngxr2kK5fPl9xDgBDREeRwP4DpKw=;
 b=A6GGpyqp2vc9XXKznpCjFSwUMpxTz8DjIb+g8LKNwoGks3O7ch9IQV5VHhGMufo8Pc
 iZRioxKtS3r5B/4ArJwKPk9R6FbLBL+o5iDvW0oaxm61B9cq/Hms3R8pjqpsaZqoR3dp
 rMMAVhhveY+kPIfjTemPX8oSuNybscTJxL7mX6r+BSrtx+jbDEWzVs9wX2Zc+Ubg/G0j
 ao53pecj4p+WZUw2VdsNF1qQZQ3TwZkM0eANRmF5OmjW3rPOeniV6+laJAcUC/LKvbr2
 wmJ8Py0BXGW/rv1o4VM/QcgnBHgIBnDkPumnY5f8V+kh0S8qZ1JZvEJVh8IkgxN50yrd
 35iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786347; x=1792391147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KoOl0WWL1BbmaElngxr2kK5fPl9xDgBDREeRwP4DpKw=;
 b=OfQY9Q/N7OpOK+TCYjo0lOZgQelRkd8yxHn9N/nTvwuwwBQsrZcbbCbPChhyXr5CQM
 tARw4vwFocQWjw+UIBcMNun0S2m5yPRe7mogRNIdRQYB/asUvt3L1Bs7yqSOzx3dC71r
 ah4mQwK3As20nr3w5UAKddESk5I0yKMUCkyXlm8lIntYT41zZ746nxpD5ZUphXvMukXr
 lrbvkgJBieFu7TkERUbPlUXq5IO0qwOo9LZJpMpuUXeVcVsYUaxWHM3pfBjhsivBlRCy
 1Csn6MTglHo+xDScZW849BWVbeuRQm0iHdkuLV7AunlMjSLgPnZPPlav6d9RNaMhE7e4
 1w9Q==
X-Gm-Message-State: AFq9FYK0aFFeBE/+Zi428D7XkFBnV3lWiA6f/PWSx2ZVjssBYdRnkZYx
 V8izH4a38YpKYHdLS0fEwAaezS5CMUC2biZh3m9S8mm0y7VUIUf/0zFKWgMtdA==
X-Gm-Gg: AYBFou0p/aEMq8HcYaBBFhyV8SonvzzTGH/26G5jGSc11r2gldPzEyMTVd0OZoMF1HB
 /ZIJ1FtE5EQaOZSQlvQq4lecS6l5TcbpWU7F1K0d5r5asJtWr2/OTI/k6imPnTnG7t/Jekt51IF
 Dzx8d3qgNSiATUeHcnzIy/uha+yxKFSolXCnVxmnBq5OCa+jfeS5JbkAdKX9HWJOzH5lGv2kWTS
 h3BJw8oLVkIWs/TtgDL3qfI0ekUZyOe7mpUC4E4w51ed2HAljcs5KdDsWpwI2jOJt8da2ElqhrX
 12jU3iQcPu/BSACPwaAk5Pf0Pm8ad1G1GQwdBh2Brqkd3De8fr4EHqyoBE4J34q2q+H8v8XalSR
 6DqYcVo63n+TePf9Kdcp1k3CYZZkeJXovq1kup6qInc5p4XqbRgc5WKOmX8V+IPPHfYBKZI3irh
 YMFmhLwSXTmzLKeYsCso00NMD2Mf9nSpY+Eb6hPPbxYSKqYOV7bTsK51T2w6kSNQppD0wyDrRuc
 zNXg7tmkxji6mAyP9sHabZGwu7BKl+A1rT0GuDS4ZkF9qF5voI=
X-Received: by 2002:a05:600c:46ca:b0:4a1:7a1e:6910 with SMTP id
 5b1f17b1804b1-4a18e48363amr163365085e9.4.1791786346810; 
 Sun, 11 Oct 2026 23:25:46 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:46 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:31 +0200
Message-ID: <20261012062536.78874-6-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/10] package/perl-mojolicious: bump to version
 9.49
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index cb40c9487..b58573b39 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  2ef7c909c3650a570737a11ee04a14a9  Mojolicious-9.42.tar.gz
-sha256  2328b51da0371e416a85372b9acd04433f5213e997cbfae4ec84d4c63ee36c8a  Mojolicious-9.42.tar.gz
+md5  cfd3b41597f228c945f6b25215410cc2  Mojolicious-9.49.tar.gz
+sha256  281933d4f9b821f669a3e93a466daaad5596443ea2cb167fa7c019752bce6d66  Mojolicious-9.49.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 6da8d2f4f..a96af20c4 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.42
+PERL_MOJOLICIOUS_VERSION = 9.49
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
