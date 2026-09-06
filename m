Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE049C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 16:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3238D80BD4;
	Sun,  6 Sep 2026 16:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fgz3qzEc7co1; Sun,  6 Sep 2026 16:31:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 62D0080BD6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788712268;
	b=gTBlRqkOHcMvrpl6meACf+f/fZT2ivEo67QtYZNRQswQVPqQ8QTZZolf8xyvnxYZikCQ
	 542wUx1DC0uig5M53NOnNJHIMVeLbAc7RLsNMpLINkQJzoF5ltA2sofEBTRY8ODC/FsWb
	 HT8eCNZZWUQImejdLDLthOSwd2PI7dm/HTWtH+z6PZ3fVH8VLqxedkMBn1U3ipuKVwHV0
	 vn5qJP51QtjPmsrKiR0Wft1xOe0vBunWFsRkNFxpqa9ep+94j+2U2sN21tSgdrR9SXxtT
	 6DRihbudOJCv2MOPM3U0WzMlhfuK0hpZ20F9sSFOW0g4gl8nfuEZn1O9F6qzeZNT/4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788712268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4vCwLrmXKEeoHkSQWOGztyogg9NIJsLAK0ArqeZhiMw=;
	b=Z5TRgiDdCVtsxNWKRXlHY4pMJUiT8YsvDjE387pZpe+tUFc46eLiSaWuIuy7Sh5Ix+GH
	 OW4MlOU+4occ2VO9jrzCUF+4+HuQaNq8Hjiz6sFdhgfg/CKgwviHwVGJbndPN5cnLrvHC
	 6+qvbhiuLkb4utACZTu8qTcdp8Kkfpk1AptF7YSV481AIJNMJ3dAvd/UFsDSLbJ2D2xZt
	 N4w9LOoXYEdUM0F/wlvf7/yV0uvJIn4juucsDQ7O1iXYkMM/yOYqnuxGX717MLGSfw5Ib
	 RXRWuLstLZtaxHmjtZFpzl/mm+H7Ed59qzHCYME3JHGFtgE6vPLWMaZ0qvlOmJEvU0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jUFD5uZ0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788712268;
	bh=4vCwLrmXKEeoHkSQWOGztyogg9NIJsLAK0ArqeZhiMw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VTonYpQiHCegFLfABUjJxgU+rb4wKtnGEzXovBZUKZfv1adPYNoCyWbXte+xJ7pOW
	 soZPQR+R0r4CXGW7dUc4kuWAYcr8rUUTRzp7cp2kUt4ARyJWt+DQCf9Lt27KpUH7bD
	 KCbEuWJnNCQMGv8ygM5izzN05Tfc8FQd7pgLy7Ag3RTI2JXAZDzyP78O6j0EKp8Cff
	 Nh68Sf1xnUDFg6c+C2Lvjm682g4RAQHgMqBnR0mgFL9DViUClsPFEc644KWbLOT85o
	 09vlcXqUlFupKv+ybdk1yb0Iq5JTw6XKFb9AVqNqGabmS2qFcn03XQgnRDQDnCVDgm
	 WS2XTTG3nKhGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D0080BD6;
	Sun,  6 Sep 2026 16:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0329CF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3A0380BDB
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxNjTpnGdqM6 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 16:31:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1CD1480BD6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788712266;
 b=CGBTpqKupvjVsr7IRJXQT/Y0/BeZek38ImH2lcMDFIj3Qlkq7vmw33F1xzWZTXdgXBfe
 yYD5mhxNDXjSKMu3JqPcZ84wjOi7BjWSkm+CXUctXa3DTITeCkPw8WRv6hGvIyYerluN6
 b6VfRYVKkd/73lIJOgiekQR22XY39J5Y6fxPbk7dOnswfQmRvdLFgQD6bdjAEVQD9GsjO
 jqSOOGn+ItTTj0mq4doGUoO6wUMM3xt+RJXjlA2Os46MI0ECRVcbqqUMn42c9czF8mxHM
 PjZHhnQH8UiuwmapZrXBetgDnq0vKt9FMHktWdoBTdFb+IiSDxfAV2mYLr0Cm0VOm7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788712266;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=FSWwtmZ79cVzkK9ximEm0Q/i8QFNDTCwWjvO8g70FzA=;
 b=fLL87Ag1E+UqRycL9pW5hBDCjc7T4Nk6geDwRHXLPgB5U2rgv6RVieJT9aAJhnwTjIew
 9hmcGVE+UCavmIygw4DL8sxYVa3VBOgZSCXP8+OTfgYRklRy+oOu5UikJbpTa18uRFy5J
 fPfA+gSdNVDYTk/oL4hZoxi/B73A1Doen7qo/UCahJ5ZRiP8qPDN87gbmh84O57EOZGPr
 8mdSifX1XJ1umnRxFuQFYtjXkpXOBjQCec/TdnXFGGjmHGzwO4y/Z7AQ2G//sfyaWNnM/
 mDOiBhhBYsUjxFVOH/0mc1FZRvRxEGj11+jNdldJ+Ua0PvPxaXtbcigb2uGsHFnhs9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jUFD5uZ0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jUFD5uZ0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CD1480BD6
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 16:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788712261;
 bh=FSWwtmZ79cVzkK9ximEm0Q/i8QFNDTCwWjvO8g70FzA=;
 h=From:To:Cc:Subject:Date:From;
 b=jUFD5uZ0Vnu7lT81VAE0ZK05dMVrmM6lTRIH1erdckDlSkUO0dOGu8T6MH+6UU4kn
 olVp3K3ZVSpSqccEp3jHa3VkZdiFLjLpQQbBGTqIGpm2C9cC0bu+psQFqlasz0qzlL
 0Q/zkESK3eq2UK5mYT8wq93C86KDs3ehYQ8/sF1DTBy818AbhSyoI0zfDny4JYHM/6
 zosPevoc0EYfD71224E/TZTtc/W54eZlgYMXoGGsmGH60S0Xb5KzGTJbfR5n3KVRtV
 1j4CO8Kd/t6YAyOdAKjImwdX+kslmOlUezuGRbjRM4Lm80r/R0aNj8JOPyTV6lhxH1
 c4IOHdP5ltEkQ==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E896A4C037C;
 Sun,  6 Sep 2026 18:31:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41174)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3Fll-000000000Dh-1Smo;
 Sun, 06 Sep 2026 16:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Stefan Ott <stefan@ott.net>
Date: Sun,  6 Sep 2026 18:31:01 +0200
Message-ID: <20260906163101.3704115-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.26.0
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

https://nlnetlabs.nl/projects/unbound/download/#unbound-1-26-0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/738f5949efb0428b2619b49cc293d3ae34a1590b

tests.package.test_unbound:
https://gitlab.com/bkuhls/buildroot/-/commits/06e8929035e94389065ac2652e0e61dadd0eee7b

 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 85724ca243..a6bab2218a 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.26.0.tar.gz.asc
 # with key: 231018690C4D903EF419146AA144323DEAACDF45
-sha256  0d92275c703d5f5f8baba3dab22117dd8c29b495588a5c229768ed6581566600  unbound-1.25.2.tar.gz
+sha256  77458a7156e275c0b7b17fabcb357cb12445d95cfcb26fb9bb7d5ecba45e0b63  unbound-1.26.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 46fca5e2d2..a3a1baaa94 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.25.2
+UNBOUND_VERSION = 1.26.0
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
