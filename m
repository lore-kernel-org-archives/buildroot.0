Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B126FD9E0E
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0026E60819;
	Thu, 26 Feb 2026 20:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sijsH8n7ErXa; Thu, 26 Feb 2026 20:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8D146080C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138846;
	bh=mIGWLAw6NmnOCcpNQX4ivfndn5tbOaGuepHqLcfc5Ec=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lkTZ+qz7SwoKnIiihvADSORr5Bb8i6oXwPapBIB4gG702C7F6cGMN56soTnp86kq5
	 CgiFUzuKL6jvtxtJ4YSNk3OJmqQ84fLfEJtZ33AvDmyY/2YvxI0os5kfWtaeNEZdCQ
	 DtUV8N+H4S1wL0GgZgbbm7E/4eAGnePnt5P4LsUYnMj41q+LoZ0D5K/B6adJLsV/h9
	 jy8vwcNc4ZXlId6XwcuxR1EieCW4eSZlp1V1mprPTmQ0eQjYD41kkVeHr9gWbDgE6+
	 JsdUq2BBwf5hgh0yGJgK18/oCgXBitTJ5C0jQs820ZB3zR463NOIa4xvCy4DA1wIrh
	 kJ66w5qY5t4GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D146080C;
	Thu, 26 Feb 2026 20:47:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C67871F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC4DD40261
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2pXbWvmfrwE for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7F5E40122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F5E40122
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7F5E40122
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso23072745e9.0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138833; x=1772743633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ebl2LQC81WLa5yWpg0QraW9igx9BweSGePxyK97M0PQ=;
 b=EZ5u1XRQOEGzqPrb4nZ7uMlv/d8Y2b/1ZrEFEmWzrOjk8LYY7nXBFa11RC/JGeayKM
 GxZ+URgUYN1so6VrIEjDSRGpj6dfvRHmCa4HbAh9s0UrC51sPkGZlY81LMerfRq6Hswy
 eu2yDbwxX+IDn6EmeB3CtgboDT9pnEb1wUgewTZfCMO0FxvplM/YJYWcaPnHkxEcvhSS
 S6JUnmEE13nKTZPmfks/JkJjc1BlyA6K+VlJ0E7/JJ/7cCiMuRi0qYXX0g1uE2c0Kq7Y
 SxRGMrsVEtSpBnavm+5VNqFDeExUptfOa7b284xD0EUH3ZHJF0gs2CBOoVLILo8WxDWS
 QU5Q==
X-Gm-Message-State: AOJu0YwTzFZ0O4Tv3LSpZgJB3KaL1TUdy/TBOwNyOk00jDmbXTSqmgAQ
 SzA6HPegg6mpsnYgrllzpJedPuZbFw6inMm9/7WEu8XFRH22u/b28A1ee4LeQ5HDxqepGhvLgG+
 oRpeB
X-Gm-Gg: ATEYQzzg5IbY24KQmIPVYTHIvTKucxCo0ovKhLAnWT31lYFyGaFGgmpZQ/hgBZ8ZLeg
 4pleYRKV4eENUfyeeGZM8lWllhYH281VE9sB7T6q7oif9A7HUWq0SnuXTyYkSzkcdw5KUlDZX2f
 N4CRQLVjRfNEGw8fiwfXPd45NDqemjYXCXRcOam7TCVtEe012SH0irXxcpdPsV3rpw1TlZi0ApB
 ZG4W5WgJ4GdctApqzuVROF5yu6Uj4e5wlUggoUYuJGESLW71M4ByZA/sGQ3iwNh1gkBlnflSdYI
 Pf6YHWAFp6nVVXZrmvTGwq5SsQnltB3AdPdlq1yNP0yROoZwClJxsNfMZdAynwXBwKnJXLdpOvH
 Rd8nUZrciA16IJcOY2mOsCt5sxgRG50l63IxWL4/P8JJXX73k1O0fQmDg+E5ybjRTIhCAs6Edor
 J4GZMGZu+61XZasng=
X-Received: by 2002:a05:600c:a010:b0:480:4a90:1afd with SMTP id
 5b1f17b1804b1-483c98dc373mr7274325e9.0.1772138833504; 
 Thu, 26 Feb 2026 12:47:13 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm269389665e9.0.2026.02.26.12.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:13 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:12 +0100
Message-ID: <20260226204712.254105-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260222102635.117276-1-thomas.perale@mind.be>
References: <20260222102635.117276-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138833; x=1772743633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ebl2LQC81WLa5yWpg0QraW9igx9BweSGePxyK97M0PQ=;
 b=JKgCw20tNfypjIOfVUydg9a3OCTHFnPrEunFqw+lnpIzw/Xj+qAi7sWp4s+rPHMYxD
 JHcf8CnmdN2MabwHfXP3h4aKLVcHmv9qKVMjbxLRFwjFt0xCUseUgQuSCo9TMQkqlFOX
 ImEtQ6kvixss/M93QyC/qS2DCKa6PltpzrrXNXtrG/RhsPOPXAXwFvpQAApl98/BFbuI
 G5LsiTxl1UQn/sHvlDj8y/z3acSpo6u+tUb8tmWqN4Dow371Ru42fpPTBgSbovxkROaf
 4jTO3NyIsrfAUFSfQNAWXtV3KwDS20SYQHiHeYWtdvvwf1Mkw/g8V+L2vCLdKonon11j
 KQ8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JKgCw20t
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/postgresql: security bump to v17.8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> For more information about the release, see:
>   - https://www.postgresql.org/docs/17/release-17-8.html
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-2003:
>     Improper validation of type "oidvector" in PostgreSQL allows a
>     database user to disclose a few bytes of server memory.  We have not
>     ruled out viability of attacks that arrange for presence of
>     confidential information in disclosed bytes, but they seem unlikely.
>     Versions before PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are
>     affected.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-2003
> 
> - CVE-2026-2004:
>     Missing validation of type of input in PostgreSQL intarray extension
>     selectivity estimator function allows an object creator to execute
>     arbitrary code as the operating system user running the database.
>     Versions before PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are
>     affected.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-2004
> 
> - CVE-2026-2005:
>     Heap buffer overflow in PostgreSQL pgcrypto allows a ciphertext
>     provider to execute arbitrary code as the operating system user
>     running the database.  Versions before PostgreSQL 18.2, 17.8, 16.12,
>     15.16, and 14.21 are affected.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-2005
> 
> - CVE-2026-2006:
>     Missing validation of multibyte character length in PostgreSQL text
>     manipulation allows a database user to issue crafted queries that
>     achieve a buffer overrun.  That suffices to execute arbitrary code as
>     the operating system user running the database.  Versions before
>     PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are affected.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-2006
> 
> COPYRIGHT year updated in [1].
> 
> [1] https://github.com/postgres/postgres/commit/625e4495bf58733f1dac24e363b12e6f95d7e92d
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/postgresql/postgresql.hash | 6 +++---
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index efa1b5e751..b7a2397f8f 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v17.7/postgresql-17.7.tar.bz2.sha256
> -sha256  ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5  postgresql-17.7.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v17.8/postgresql-17.8.tar.bz2.sha256
> +sha256  a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0  postgresql-17.8.tar.bz2
>  # License file, Locally calculated
> -sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
> +sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 13abce8330..9856d6423b 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 17.7
> +POSTGRESQL_VERSION = 17.8
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
