Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A48CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC2861528;
	Fri, 29 May 2026 08:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkcy8f-XtJGw; Fri, 29 May 2026 08:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70256152F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043374;
	bh=Ce7XL7gw6lKCJU2yccCIZ3kczrm7RtAtiHfLkYVU81I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KfLj1M7gb7Cr3PIlQ83+Z81qBY8Q0+2Y9BjxhEyPFEhbPPjreIG4mjt90VE183WZD
	 Of7gPK2H1pu2R31b7p6QDrolCj9JC7fD6dnN6uIMyf1PquCfU86jlGxP/lvp7PMCdW
	 DcTF+JSJ99v2Rx6fQT/bY8T2j+LwFmtD9DHMXPCky5rbw8ju3jfcXDUV9tW28LQfeV
	 o7a4/TrxHfEvvaFoxjKKn8OYdCtoIZcaC5PbZlkyGqCWC7PcekTkwwtC1MLxHJ6X/9
	 C8g5x4W6462AkNmM71FkGfPzkWHpEjJYdWbG4W+kEW8/xirD60tsTqIEP5xxYbNOkH
	 IQwLfOCaUQ+BA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A70256152F;
	Fri, 29 May 2026 08:29:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 623CB288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42E9542262
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUW1nrB3eBpG for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12EAB42251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12EAB42251
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12EAB42251
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:26 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45eedc94d37so612745f8f.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043365; x=1780648165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2+GiMUonozgnHHNPoOuMQwalGSqsg6nBdOdf0fnaMmc=;
 b=sYVRdtnmTIOurxWuM/+Oqvwypl09SZlKybZJyyjQ0rQZ+uqwqcJYfNiYji079oOq9t
 jw15b4+REOQLwbIYF0KJ/N6i/Lnu6BsVd74IeR5jhrrdYUsWfJUQgGZTc/zdIN4quHa8
 ikFjlz8R1j9xPmxpnKVz7ENZYxhu24tr/0D9DRotUrcJs3WJOIYzg3WfxywWnGwmytHp
 y895M0eoahS4X7xlGESt0sXdAArOGbostb1QvFbz2jx0IrrX6uKsuhO0sr0VqIvQnwik
 EsbAsPRSI58GOUfiENlF5ISENVSUZQ1NaJe374hKq4qfWasvI6iQDU7MGI80HBIN2hnW
 g+kw==
X-Gm-Message-State: AOJu0YzrrWqCJnpnwBVWnQjXD6Fmys96awMc0eY7rh+iaGF3eMA7xVGd
 WkgcMZFSH83yZesZqkXQneNROD7/OyItC0KVX2DKU2fWzSg28S9sustNE4A1c+80FyIZcueX+Qw
 QYF2N
X-Gm-Gg: Acq92OGR9AZy1XZ8RoSxb/S6lXFqNSTk35PvrH5lemPay2AQjBmaCjSOFQUpjI1LXBq
 BQUeKQFVzL7kKeRfRKzCdyWd0xDqJ3LITr+BROFYBDpIloD+pBEYF5cFlPq90gELWo7GxnO0N4B
 9G3w06k31IUERnKgH59gcd+lRGmEwK6nGPi34QSO5gECEW0XFg5IDepcoZZR4dmVqkoNpzNAK+o
 hPXmwd5GRRt/FiyZGTPRNQgE1dP7hypuy3c8k31Ke2C/0cUHi5Vi16m/2GTEtEugOvV7FZuy2NH
 ZyRM7qiJXLEdqwi3D5AebSM6JMkP/ZOPgkQKQ8QngtY6dkKVKM7WPo3qGSNT46t2qZswj1eRJwY
 XIIskjYdWBgE9zp91H+o2q0IyIaLxEAd1z8gfxZQLdfJAHSOKqtLYSpsP7OcnPgKy59zl6MPVRA
 qrkKbIA6bdo98uLyptqUsfhIqgfVtN9uoRyN6OmbX0jV1I6vdQipoPd3SiBg==
X-Received: by 2002:a05:6000:1a44:b0:44b:cd2f:a3c8 with SMTP id
 ffacd0b85a97d-45ef142783emr2714587f8f.4.1780043364924; 
 Fri, 29 May 2026 01:29:24 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cd87sm1719120f8f.24.2026.05.29.01.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:24 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:24 +0200
Message-ID: <20260529082924.57567-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518134727.358152-1-thomas.perale@mind.be>
References: <20260518134727.358152-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043365; x=1780648165; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2+GiMUonozgnHHNPoOuMQwalGSqsg6nBdOdf0fnaMmc=;
 b=C4obhl7eeLfmZdLVD4VeYRXd3pahXUkz//yf9Vf2fKv8vDyhIlpflWwxqodWAvXU3a
 Dq8Qfu0Vwca2kPMrvdCnHH1U7z1QO2TtQJhKzwUohYcUKO4BAwLxmTgYMYwnGqmgFYrv
 O68lmW9Wtn0XBskXM7caG/k1KNzepq+a7xjrvJl/M489GfNFYzFYTmwb+gvTN36M1l5N
 /cAh3WgSTGzkQJ8TS8w0cYg7oALK5Qzl/Wen81MwwHzt7Im5yEY71elnwKdyTl2Scm3F
 WM3zmWOeiYBZ6Ka7yohxCb6FN6sKvOOpXiU/I50Pfkin2xldmPKa3xTvSzUjDDj5rUVx
 9ULw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C4obhl7e
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/postgresql: security bump
 to v17.10
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
>   - https://www.postgresql.org/docs/17/release-17-9.html
>   - https://www.postgresql.org/docs/17/release-17-10.html
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-6479:
> 
>  Prevent unbounded recursion while processing startup packets
>  A malicious client could crash the connected backend by alternating
>  rejected SSL and GSS encryption requests indefinitely.
> 
> - CVE-2026-6473
> 
>  Fix assorted integer overflows in memory-allocation calculations
>  Various places were incautious about the possibility of integer overflow
>  in calculations of how much memory to allocate. Overflow would lead to
>  allocating a too-small buffer which the caller would then write past the
>  end of. This would at least trigger server crashes, and probably could
>  be exploited for arbitrary code execution. In many but by no means all
>  cases, the hazard exists only in 32-bit builds.
> 
> - CVE-2026-6476
>  Properly quote subscription names in pg_createsubscriber
> 
>  The given subscription name was inserted into SQL commands without
>  quoting, so that SQL injection could be achieved in the (perhaps
>  unlikely) case that the subscription name comes from an untrusted
>  source.
> 
> - CVE-2026-6638
> 
>  Properly quote object names in logical replication origin checks
>  ALTER SUBSCRIPTION ... REFRESH PUBLICATION interpolated schema and
>  relation names into SQL commands without quoting them, allowing
>  execution of arbitrary SQL on the publisher.
> 
> - CVE-2026-6473
> 
>  Reject over-length options in ts_headline()
>  The StartSel, StopSel and FragmentDelimiter strings must not exceed 32Kb
>  in length, but this was not checked for. An over-length value would
>  typically crash the server.
> 
> - CVE-2026-6474
> 
>  Guard against malicious time zone names in timeofday() and pg_strftime()
>  A crafted time zone setting could pass % sequences to snprintf(),
>  potentially causing crashes or disclosure of server memory. Another path
>  to similar results was to overflow the limited-size output buffer used
>  by pg_strftime().
> 
> - CVE-2026-6472
> 
>  When creating a multirange type, ensure the user has CREATE privilege on
>  the schema specified for the multirange type.
> 
>  The multirange type can be put into a different schema than its parent
>  range type, but we neglected to apply the required privilege check when
>  doing so.
> 
> - CVE-2026-6478
> 
>  Use timing-safe string comparisons in authentication code.
> 
>  Use timingsafe_bcmp() instead of memcpy() or strcmp() when checking
>  passwords, hashes, etc. It is not known whether the data dependency of
>  those functions is usefully exploitable in any of these places, but in
>  the interests of safety, replace them.
> 
> - CVE-2026-6477
> 
>  Mark PQfn() as unsafe, and avoid using it within libpq
> 
>  For a non-integral result type, PQfn() is not passed the size of the
>  output buffer, so it cannot check that the data returned by the server
>  will fit. A malicious server could therefore overwrite client memory.
>  This is unfixable without an API change, so mark the function as
>  deprecated. Internally to libpq, use a variant version that can apply
>  the missing check.
> 
> - CVE-2026-6475
> 
>  Prevent path traversal in pg_basebackup and pg_rewind
> 
>  These applications failed to validate output file paths read from their
>  input, so that a malicious source could overwrite any file writable by
>  these applications. Constrain where data can be written by rejecting
>  paths that are absolute or contain parent-directory references.
> 
> - CVE-2026-6473
> 
>  Guard against field overflow within contrib/intarray's query_int type
>  and contrib/ltree's ltxtquery type.
> 
>  Parsing of these query structures did not check for overflow of 16-bit
>  fields, so that construction of an invalid query tree was possible.
>  This can crash the server when executing the query.
> 
> - CVE-2026-6473
> 
>  Guard against overly long values of contrib/ltree's lquery type.
> 
>  Values with more than 64K items caused internal overflows, potentially
>  resulting in stack smashes or wrong answers.
> 
> - CVE-2026-6637
> 
>  Prevent SQL injection and buffer overruns in contrib/spi.
> 
>  check_foreign_key() was insufficiently careful about quoting key
>  values, and also used fixed-length buffers for constructing queries.
>  While this module is only meant as example code, it still shouldn't
>  contain such dangerous errors.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index b7a2397f8f..48bbbd2443 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.postgresql.org/pub/source/v17.8/postgresql-17.8.tar.bz2.sha256
> -sha256  a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0  postgresql-17.8.tar.bz2
> +# From https://ftp.postgresql.org/pub/source/v17.10/postgresql-17.10.tar.bz2.sha256
> +sha256  078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90  postgresql-17.10.tar.bz2
>  # License file, Locally calculated
>  sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index 9856d6423b..6f6f36702f 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -POSTGRESQL_VERSION = 17.8
> +POSTGRESQL_VERSION = 17.10
>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>  POSTGRESQL_LICENSE = PostgreSQL
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
