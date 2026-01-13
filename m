Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E389D29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AB6841AF;
	Tue, 13 Jan 2026 19:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0Mg0phL0Wjl; Tue, 13 Jan 2026 19:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E421841D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333578;
	bh=QfH87qVVqLs8CLqBPh5/ukFdgKoUEj02fp4GWmVB90c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CogXO19Q47D0UPc3ZevUiZ4znUzdZlRDciZBJ41QmJi4G/Qj9L6PEnnbgtGwNbm8U
	 sYKh1dXLmOujSuHPVW+lSnEVloIeVqiUcbdIjqCyUrIs/PuQuMYHe/Xbw7ApC9Y3cw
	 Q8OpJvLl8K0jnGDiELnZAOspeWKSIcDQgSKqomZyrUvxYmWq4XCQcqpg2uPOnt1REf
	 9fMZuV37vGXAcBpF+A7l+Gi06ifLHNkE9il8oy0kb61epBgHX+6CESVZH1s7NpPOPB
	 C1TEXRqHrtBprTvPfqKroIlTWwzj2c3sRaZJkOVhWREaI0v13iPNgd9+vr1A+ttySV
	 0vjiq4BPwV3Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E421841D2;
	Tue, 13 Jan 2026 19:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A521C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B9F0841DB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdSoI6j17hxq for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F572841AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F572841AF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F572841AF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A49AAB97A886; Tue, 13 Jan 2026 20:46:13 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:10 +0100
Message-ID: <20260113194610.98360-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216095531.1381197-1-thomas.petazzoni@bootlin.com>
References: <20251216095531.1381197-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333573; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=xwY/BM0DwpS3LbguqFcRPO+Gcqh6xaHWHZM2wL+gJGo=;
 b=aMlSvN0lEwg6xTojPkwkLvBNkqzH7v0G3PIkpyd5oJ5mCOm3DHlNGoQE2WkQy1wIUkC86h
 gFERQXxL1LWw1Jk+U7n/mKXE4FxiizDzwuyu1ubF66NEc+8NX5zCzJdtcdB4WBBz+l3CkS
 NLKSIwXRn5Je8+9Cb0EE0IQhRxS/nYO6F2wBlXJ4sCCE6g6PvKR6FX7/IfZNSn6GbHNk1e
 NBy+xR1mQqD4YBftiZOZZot5nTGnvedMSIUmgyT53blgwwXXiHCgrN0GbVA5y7prQREJzU
 gQKtEfL1IJq5fmfwv8W7OppvL4jwpOBLjmZV93J7UnXdlVhEFVgrSyfrfYkqZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aMlSvN0l
Subject: Re: [Buildroot] [PATCH] package/zxing-cpp: drop support for Python
 bindings
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since the bump of zxing-cpp to version 2.3.0 in Buildroot commit
> fb032bd34acf57f86f62bd474cbabd4e1e750e67 ("package/zxing-cpp: bump to
> version 2.3.0"), the build of the Python bindings has been broken. We
> tried to figure things out, but couldn't, and nobody bothered fixing
> this since February 2025, so let's drop support for the Python
> bindings for the time being.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/93ffa69b9f92f142c65169f9c3a7c7ad0e733551/
> 
> Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/zxing-cpp/zxing-cpp.mk | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
> index 515daf590f..8c44e8ea9a 100644
> --- a/package/zxing-cpp/zxing-cpp.mk
> +++ b/package/zxing-cpp/zxing-cpp.mk
> @@ -14,17 +14,8 @@ ZXING_CPP_DEPENDENCIES = host-pkgconf stb
>  ZXING_CPP_CONF_OPTS = \
>  	-DBUILD_BLACKBOX_TESTS=OFF \
>  	-DBUILD_UNIT_TESTS=OFF \
> -	-DBUILD_DEPENDENCIES=LOCAL
> -
> -ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
> -ZXING_CPP_DEPENDENCIES += python3 python-pybind
> -ZXING_CPP_CONF_OPTS += \
> -	-DBUILD_PYTHON_MODULE=ON \
> -	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
> -	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
> -else
> -ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
> -endif
> +	-DBUILD_DEPENDENCIES=LOCAL \
> +	-DBUILD_PYTHON_MODULE=OFF
>  
>  ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS),y)
>  ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
