Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3B2CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06247615D4;
	Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsgDwZ191Lnb; Thu, 25 Sep 2025 20:17:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2D96153C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A2D96153C;
	Thu, 25 Sep 2025 20:17:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFD1512D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C66088439B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eFPDPuleDql for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1A0D84384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1A0D84384
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1A0D84384
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so1001334f8f.0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831419; x=1759436219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KdNiuEHImtpGU2k4WJ3HMPzBuMIoKUIlIN/a9+xkX0A=;
 b=CsV2a1cSLR2ePPW1Qkt3Z1CklRjekNNKSvCSl1QlawG7V6ZmNCIkw11apvkYDlGavS
 zCan2JOIWkYiiyOcZ/oxlyLIRVZ1z3xiVXS5jwDy6hJsfTZt6JCLKVspVFrSdNWoFz48
 NFLYocGxped7cACxvixhlu7WJPixkJrOHigRaSDvLJUK52i8NcFraYI3c8AWMPjqD6qV
 YBjiEMMarxNqsIbi8eWRbQ5NYZ57cwc+kkeVuxXrXpTK4wdGKKW48B3jik9lq2iyTxgx
 zjW6sLUT9/pYVRpPFyJxzxMp4e2zEWwLU+0igeIWm1Dcgmu959bZ/F1X2mxBKS8MxWpt
 rfkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVbaAptJN+/HMcLPsXg2tzS7RRtbNU7/T6YZ3cbi+DwN1s0BbCfCwOdAg04Rlvr28YVjHOLsyEPd0=@buildroot.org
X-Gm-Message-State: AOJu0YzB+jkyazU+maaRghzfgF8a2ojLzVbDqPBELnQ21YnomgFIhzx5
 o9iVmPWZdlxE5Cev5YwTNarW8/RcSLeNQ6+n2DIshEAKlP3v6K9x4mvEhinHlhgT0/G08BIlAuo
 5iVgybvY=
X-Gm-Gg: ASbGnctgEFXqzxjQX9BdYvo7CTb4SYavz/qsWOhkGBheDLCEPhwiGW33394smNvApMq
 G1kRFoaM8hV5UesCHj3C/jmsBd29SNMlZBJlw4njc/qDX1gYNWLCb/7jfhcm3Fr2SMLq7SbBh2t
 4bRMWD2HfXCTAN3q6h32i7+YpLursXrWhP0HcMwAyCQMNjQfOkUQoRpupYbWl6NZS5I/rxxeClh
 E1NKFzGncDM5nIIYC+kx+MZwWH2UPfYlIehMYrmnxJrfForAlw3Zpg5b4HaM2EW/vouCigCBOgM
 YLQEo+w9SraeNYeHRJ2lxJwJTYRafuliYuJVW8ymOg/ufmr6oO0krp/6uNQq5qhfYCB2FzaReWa
 9Kgf1/gXdmlvVzzMKjMMKyiFkxQ==
X-Google-Smtp-Source: AGHT+IEks0NMHEYX9+SYEbZpr37rUWK9w80LGtGcGhiFEaCe9aJkYe0JwmHaYw9hy2o/+IOO9WjoRw==
X-Received: by 2002:a05:6000:430d:b0:3ec:dd12:54d3 with SMTP id
 ffacd0b85a97d-40e4ece58bamr4738073f8f.35.1758831418728; 
 Thu, 25 Sep 2025 13:16:58 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602dc2sm4171476f8f.32.2025.09.25.13.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:58 -0700 (PDT)
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:58 +0200
Message-ID: <20250925201658.44178-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919072349.169149-1-fido_max@inbox.ru>
References: <20250919072349.169149-1-fido_max@inbox.ru>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831419; x=1759436219; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdNiuEHImtpGU2k4WJ3HMPzBuMIoKUIlIN/a9+xkX0A=;
 b=OAl6suUVKEdSV8bjZ/+EPNIqzgYO/znahER4Z7k+UP+w0OIE87LDzovU/T6yXNE4fN
 p7yC+hjSRPwSPX9jv3r2Qaj0SVFM1kBxu1e7qI6RVCEBcsgmp5ryCuPlqc0jZJR/CGef
 QHqN+4/1Y5//xrfbxKsnZZInYP7TXOB70RGAEklNQvC3tn7W8xLTKWFeoo0dUHCF5ZZX
 pDwyVIYR2EZoLT6dITIA6kkIFL0E3aqWG0+ZDLhGnhrfNc8cVoyW0LvvZ/2CH49ZESAR
 uzp3DFiNq1mPSNTmP3yzot5rOZufF3vJvpCFvty4pmW8Axo7HKie7U1o7fk1HVk9NdpO
 REAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OAl6suUV
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump to
 version 17.6
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
> Fixes the following security issue:
> 
> CVE-2025-8713: PostgreSQL optimizer statistics can expose sampled data
> within a view, partition, or child table
> 
> PostgreSQL optimizer statistics allow a user to read sampled data within
> a view that the user cannot access. Separately, statistics allow a user
> to read sampled data that a row security policy intended to hide.
> PostgreSQL maintains statistics for tables by sampling data available in
> columns; this data is consulted during the query planning process. Prior
> to this release, a user could craft a leaky operator that bypassed view
> access control lists (ACLs) and bypassed row security policies in
> partitioning or table inheritance hierarchies. Reachable statistics data
> notably included histograms and most- common-values lists. CVE-2017-7484
> and CVE-2019-10130 intended to close this class of vulnerability, but
> this gap remained. Versions before PostgreSQL 17.6, 16.10, 15.14, 14.19,
> and 13.22 are affected.
> 
> CVE-2025-8714: PostgreSQL pg_dump lets superuser of origin server execute
> arbitrary code in psql client
> 
> Untrusted data inclusion in pg_dump in PostgreSQL allows a malicious
> superuser of the origin server to inject arbitrary code for restore-time
> execution as the client operating system account running psql to restore
> the dump, via psql meta-commands. pg_dumpall is also affected. pg_restore
> is affected when used to generate a plain-format dump. This is similar to
> MySQL CVE-2024-21096. Versions before PostgreSQL 17.6, 16.10, 15.14,
> 14.19, and 13.22 are affected.
> 
> CVE-2025-8715: PostgreSQL pg_dump newline in object name executes
> arbitrary code in psql client and in restore target server
> 
> Improper neutralization of newlines in pg_dump in PostgreSQL allows a user
> of the origin server to inject arbitrary code for restore-time execution
> as the client operating system account running psql to restore the dump,
> via psql meta-commands inside a purpose-crafted object name. The same
> attacks can achieve SQL injection as a superuser of the restore target
> server. pg_dumpall, pg_restore, and pg_upgrade are also affected.
> Versions before PostgreSQL 17.6, 16.10, 15.14, 14.19, and 13.22 are affected.
> Versions before 11.20 are unaffected. CVE-2012-0868 had fixed this class
> of problem, but version 11.20 reintroduced it.
> 
> https://www.postgresql.org/about/news/postgresql-176-1610-1514-1419-1322-and-18-beta-3-released-3118/
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/postgresql/postgresql.hash | 6 +++---
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index f17d4ca3ce..3b5e773c65 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.bz2.sha256
> -sha256  fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8  postgresql-17.5.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v17.6/postgresql-17.6.tar.bz2.sha256
> +sha256  e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0  postgresql-17.6.tar.bz2
>  # License file, Locally calculated
> -sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
> +sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 671bd30347..31d0068328 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 17.5
> +POSTGRESQL_VERSION = 17.6
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
