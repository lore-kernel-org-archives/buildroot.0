Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691F8C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A7780980;
	Sat,  5 Sep 2026 08:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAwyAvDfU8sd; Sat,  5 Sep 2026 08:12:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 47E39808D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595968;
	b=iq1+YQfCr4zFm518k+6SinIYWRuegaxaruDG0GATMoemoM8dGfK63t57rvjcyA+9rG3+
	 o/oCEwCVLtuLDevLX6N9gR7Pf/OkIEa85hA+wqiQgTKcW3MJ7anLrUJ8EVWqPRfVAx6+x
	 7ig9meFmChrS19SiPfZm3Ar8+g8jnIK3YEdpZyOGVwDsnrxknx35scoLV38mNnEQWdbKb
	 98FgeVASTDVMf7De4VRYt2PiH1ExB6g2z1rMGDRYPjj2s/CpsLI3pGwE5vIze/c5gSron
	 9fcZmQynllCZd5BeOhiElWPIk9UXnv5pfCxArlmk5OCChFnbJXuuZeKPezwf1i+dpWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=t5hCM/fCtpK5a12My7s+/Gz1yrrvLYuEpSBwbzIhRxo=;
	b=U3GGHqqOTcQmtOVEewFCvBGFhtHepo9r6Q8br2YNUDhUMMol7rnOCOU/o5wFi3PoevUx
	 Qhpx97CknaX/EmkG2xB6stoLouFfC7OgxXd2NlL8RimZ0QlxIYrcnB/cGY9EKu5MoOtkJ
	 Z63vWJx3sfVFwkVuWJvNOsoZE1MkcVGHA2zQoKz0VcCrQZPPk23SBLSVx/XVf7KRYNx9C
	 CUvvdXfo8+4o8gr8GtRLx3pR5SZS/PpVOo1CkuA5cWM49RVclwRP8BZOzXQWrkdhHgT6p
	 BaWpHLouK2BEXpxcwtQdiNzhmOXokra0qtTudHWTR+//B1PSUnRMkN1o/iGqblXHBug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hJwLxM+t;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595968;
	bh=t5hCM/fCtpK5a12My7s+/Gz1yrrvLYuEpSBwbzIhRxo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dz+fzbX/IjcqMw8+o7zi3YOVRMDKtxUGiV3XPWWW1fUyXTI4RN0EOOjirht6sn88v
	 BRkuEWMQ+WdgTTN5GUgI56nnY6+LRObIbqNwCWVxJt/hnMp6xTLS9ugbyQicZ0hWW4
	 zhDbcRuh3P9guBln8p5NFqY3BxGxag9IwDQAyDoGacIghL47u38er7aE7TmB3tUsyU
	 gzlHl9POqyH6D1FLtvpzKps2Dsawyx92CZbMwvg9jRsLZCdQpj79NipJvyhuvpQhEs
	 zhRjF8iqc0H7RlhT8fqGRB/wcLAZEFFQxCHIJtuMQpix6qdZ4ojTXb0V3gIF1xsfzq
	 FxVTsU9ohsF9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E39808D1;
	Sat,  5 Sep 2026 08:12:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 199AD970
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB4458118A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmyAXdEuoZX3 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8156B81183
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595955;
 b=Cyn/AwphKQEuMU/twUz/BnnqTvHGI4D2G1g3yKPdqa9eDcRJotL8HNHK4FxVxLgp3MAP
 6sPJvIqqdDAOd5XCYKYCA6IPn2MKAEvrFF7yl9s2U922cww8/klHC3ilt+dyvOmYjyZ+R
 LGGBFL9JN33HZJ29GwLZz+d4LdVgtNduozvUh2mefSTg/QbCRfc472vngr4AoFqH81G6I
 BH5WR5KzVaK9jfj9/ykQtMKeUIHsR0b0l6+jf5I79uOgMS5eql0BLWGKQ8I3EFW2E2QLE
 XIRuptjsuxml5728ZlcWPtXMfw0PcX+zB0aSea2X2T3/7KRVpKhYeyZ0/sJqK3I1oiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595955;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Et4l6I/e3SxVukQtAkkNJiDMURH00mkXwlKLFdgwQTc=;
 b=CrzqviEqvdSkEi1J6GdQKSbMkQamSbKw7WxLpauYEaBh2y90IUlKbYvN466RQMGmOsdR
 FKfFRgtumJvBF1JOeUfAaVlx0xEfKDCFKSWFbwOTDQxjKvsVxW4qPUCDL0VejuE3NlgTk
 PwjzeHIkZDyjPqCX0ch3IsyoJ91uxHMo8YfGP3l2ZhFe+7VKKfRXwa2YY7TGAYwjDPkBB
 595Xr437vVKWoMFkkhRBqlW/uyzhsr5k6gE2Xm9hbGZ1U8019KKQX2CPUCTjt9YxvA0CO
 iJZH/2CWsfbr8DrHD1A9/D8EbHvGodIvkEsmutDwanlpvGigS50KBRdY1zAHUno0MYA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hJwLxM+t; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hJwLxM+t
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8156B81183
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48436216a98so1193221f8f.0
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595952; x=1789200752; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Et4l6I/e3SxVukQtAkkNJiDMURH00mkXwlKLFdgwQTc=;
 b=hJwLxM+tmjeDXGHXq0Fg3iM42Jqx8l5q2y5WvPbpqkBDAyCaiDZkqzOreOe2AmZ+QO
 HUywFa9sI551cwJnwAufgYD2kZkFVorRSIOAyHf9KHYf4j0xDupWZeVF9P/7pB4SfccL
 MvqlRlPAMSA9DOwDPsmB76JTzhJmGACgscYHfnjxDCe2R3EuL/MFkAqi6YgauuSgFR8r
 PF/HD4h7YEUP71q36125QnfmRWpeC01u5hylLplSElBIXLXwReh+yTH87auOEep6HuoQ
 XPgy3QzSlB22KnN8Tih7x4zQIU+BBmKeZLIeM6bNiohGAkUEVoPKNL2JsJWWhpIp8D5e
 mE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595952; x=1789200752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Et4l6I/e3SxVukQtAkkNJiDMURH00mkXwlKLFdgwQTc=;
 b=qUuOfBrPXYX1D50BAFnXYUxt8UFc/5F04WBG2yZMTlEMQdXPWy9nJZSckwrM2K0kzD
 gf+j0BnQtmFdc0sx4yRE+wkaZ0/zzCfb/NvqM2tEWJaegGeoUHhRVtxI22qjPcOGZVPj
 EuE1A3iMpqLlXmBoz7VReBXBMcT449PR83qAWauijjAtgCjH+MOAbLx4iM2H0ylmGsmH
 9CcZ0CifVsU/g6/0ucTdaqHzEb0EM8+IPHyQCNvi+9NiOhOG8wx4U2GPLZ8xQcHInyrI
 s+ljqet7SIUO5yUU+vgMJToPcE7bnDAaZ7+c3/DZiNY93T29t1gthOoyyOYrAS+p2LUP
 AkSg==
X-Gm-Message-State: AFuF++kz448QUVMtUbmKfmZThwhKljLo9OMMmjILDbGhutwu/4Jebrya
 BRI3HPpS9jm7Acr8KKbMXipRpeLMuLfneVH8eVS1MclnOIYmHgrwCOJ2TmrUJQ==
X-Gm-Gg: AYBFou0oqS7mvnGZflZJWv49kH18I5lLKEOy7eD98GL3iGiRAHD9ze3VaeUvwXlO03o
 zwU6KM2twuxjzU5Eqz1UH67ee0ozh2d0ndHy+gRNOtyDqrMiorP+/3Mfl1vTQcfEmuwENCgpe4r
 OF0PxxtS3b6l7fppvgZb/183Jl0GulB5Ef/gPnJDQj4P664FkfaRdn9FyPd3c0SgMcp3X5Jr5Nz
 EDAEbt0AmhqdC4d3SVofVfLiiHjSqmbTjvMp9InafLMZF2yYCp9wGjMqSe2ftz02vupmSAcS9xJ
 z0yBKjT1ZsP3gEYu/Z7ROeVjtKJbGsAwQXlmCjClsZOiYL2PRW473kAYBNPsvgd3Ht174C5mPLP
 sJOmCqZC0I9ubL+zQADZmOLhB9IVr8mdButQyvWYW2Mltdxpa2/uJszesWMYhg3PvieZszAn24k
 AR3+OiNVNbvFrCCGWld+F4yY7dS2IXCXZxkXH0cUk8woQVqbMkBPjnVqV6Gi3HkwEXPo2tvbb/p
 xbr85ZH0SaO2Q06MudV2/Ak8FwdZA==
X-Received: by 2002:a5d:6f11:0:b0:485:8c17:976d with SMTP id
 ffacd0b85a97d-4858c179a24mr8866786f8f.47.1788595952179; 
 Sat, 05 Sep 2026 01:12:32 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:31 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:20 +0200
Message-ID: <20260904185921.587878-12-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 12/12] package/luasql-sqlite3: bump to version
 2.8.0
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

update homepage, Kepler Project is gone

diff doc/us/license.html: update copyright years and homepage

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luasql-sqlite3/Config.in           | 2 +-
 package/luasql-sqlite3/luasql-sqlite3.hash | 4 ++--
 package/luasql-sqlite3/luasql-sqlite3.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index 3a1fc6ba6..221820f79 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUASQL_SQLITE3
 	help
 	  LuaSQL is a simple interface from Lua to a DBMS.
 
-	  http://keplerproject.github.io/luasql/
+	  https://lunarmodules.github.io/luasql/
diff --git a/package/luasql-sqlite3/luasql-sqlite3.hash b/package/luasql-sqlite3/luasql-sqlite3.hash
index f8c737655..08baa8673 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.hash
+++ b/package/luasql-sqlite3/luasql-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  502faabc5e06c1d7c1ddb9a0550eb19220020c86b9f1e26a2cc2001e1343b35d  luasql-sqlite3-2.4.0-1.src.rock
-sha256  c8bb3a3947379addb89412e578d0aae95ca37dc6e48a17e128f40e512d10b025  luasql/doc/us/license.html
+sha256  803da6e49ee6e7bc3e6701d8b7453c3eb6b0b4d842ca61414c2da742cba47691  luasql-sqlite3-2.8.0-1.src.rock
+sha256  065bcbcb6cb43e4875e2ba47c91e0f9e477c754e4bfbb5e557125a1967a4ad7a  luasql/doc/us/license.html
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
index 69fc956c9..8b1c6de13 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.mk
+++ b/package/luasql-sqlite3/luasql-sqlite3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASQL_SQLITE3_VERSION = 2.4.0-1
+LUASQL_SQLITE3_VERSION = 2.8.0-1
 LUASQL_SQLITE3_SUBDIR = luasql
 LUASQL_SQLITE3_LICENSE = MIT
 LUASQL_SQLITE3_LICENSE_FILES = $(LUASQL_SQLITE3_SUBDIR)/doc/us/license.html
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
