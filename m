Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBB8CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 14:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4300A60EA4;
	Fri, 29 May 2026 14:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qidSfT0s7jRJ; Fri, 29 May 2026 14:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 359FB6106E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780063252;
	bh=k7eG0EE1DqJCRJgukU/F/EHBlYRHqmSb3grgKoDuPKE=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fRW6AGV8UZM3FCNLpbg/bhcKCwmlcWqMyd7eTndiducTl7JF6lOvImAnaVfJR+lWg
	 v82uOZJNNzsURfKlcGN4CIMh8R+v1OTlqJElJ1YqhanXnvYSES2VLYYTPabRZbvt8q
	 IRmnQDFmTEMD3pCGPIPwEiyECApBtGJqFT6tWtPU4ukuMaWUFKv5GNoRO6OJkFCtxU
	 E1RCC3kVS37NnM/pQUtHWsA7x7ymUw1dzg6vwAjB54H+Bo6Uwguk0FR3o9OB0Wu0XX
	 jDvJdRRdiaPg8FqNJ3F32kr/XNgQfCMO0t9FYaNSSwwqIuwDUnDY5VpFEFnwY48EYJ
	 ZPvu8bFaA76/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 359FB6106E;
	Fri, 29 May 2026 14:00:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A19288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 150C26106E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RM845_rsMzCt for <buildroot@buildroot.org>;
 Fri, 29 May 2026 14:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 225C060EA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225C060EA4
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 225C060EA4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 14:00:48 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 2454A440DAA;
 Fri, 29 May 2026 16:59:56 +0300 (IDT)
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260529082924.57567-1-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Fri, 29 May 2026 10:29:24 +0200")
References: <20260518134727.358152-1-thomas.perale@mind.be>
 <20260529082924.57567-1-thomas.perale@mind.be>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Fri, 29 May 2026 17:00:44 +0300
Message-ID: <87a4til3hv.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1780063196;
 bh=A7C3CcrYncrV7dZXSuV6NF6Kh2QyTlbl62GH7ft37lU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fuoFhDX3MGAPxputTkwaawso1YTnZkbr1hMo91uUbceUUd5zdcyP9YMLJswHdo6/i
 9u9NVIv/NCkUNOj+l2hlzvzqcNWoz44wkZxbIxErNRQS6XxBK3/oPZFEofQsXXfcom
 ndHrEco+72kZJbz5AISBnkCxjy6038Askgm+Mfy+fIWN55nMbIvq135/yXal3B23xr
 t07M8D0HtevOqWWCwj7x21Q/+3dtJ02mFYGxw8vfv20gDe9It+zKB20aHvkE/kzVrJ
 KoFgNCLt2Qps8Ss2zeapro9RYx/7e5j8QxnaYK8JAhdEjjnJpaEuDlSzJbiD1KINp2
 Oq89cCcwYecJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=fuoFhDX3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Fri, May 29 2026, Thomas Perale via buildroot wrote:
> In reply of:
>> For more information about the release, see:
>>   - https://www.postgresql.org/docs/17/release-17-9.html
>>   - https://www.postgresql.org/docs/17/release-17-10.html
>> 
>> Fixes the following vulnerabilities:
>> 
>> - CVE-2026-6479:
>> 
>>  Prevent unbounded recursion while processing startup packets
>>  A malicious client could crash the connected backend by alternating
>>  rejected SSL and GSS encryption requests indefinitely.
>> 
>> - CVE-2026-6473
>> 
>>  Fix assorted integer overflows in memory-allocation calculations
>>  Various places were incautious about the possibility of integer overflow
>>  in calculations of how much memory to allocate. Overflow would lead to
>>  allocating a too-small buffer which the caller would then write past the
>>  end of. This would at least trigger server crashes, and probably could
>>  be exploited for arbitrary code execution. In many but by no means all
>>  cases, the hazard exists only in 32-bit builds.
>> 
>> - CVE-2026-6476
>>  Properly quote subscription names in pg_createsubscriber
>> 
>>  The given subscription name was inserted into SQL commands without
>>  quoting, so that SQL injection could be achieved in the (perhaps
>>  unlikely) case that the subscription name comes from an untrusted
>>  source.
>> 
>> - CVE-2026-6638
>> 
>>  Properly quote object names in logical replication origin checks
>>  ALTER SUBSCRIPTION ... REFRESH PUBLICATION interpolated schema and
>>  relation names into SQL commands without quoting them, allowing
>>  execution of arbitrary SQL on the publisher.
>> 
>> - CVE-2026-6473
>> 
>>  Reject over-length options in ts_headline()
>>  The StartSel, StopSel and FragmentDelimiter strings must not exceed 32Kb
>>  in length, but this was not checked for. An over-length value would
>>  typically crash the server.
>> 
>> - CVE-2026-6474
>> 
>>  Guard against malicious time zone names in timeofday() and pg_strftime()
>>  A crafted time zone setting could pass % sequences to snprintf(),
>>  potentially causing crashes or disclosure of server memory. Another path
>>  to similar results was to overflow the limited-size output buffer used
>>  by pg_strftime().
>> 
>> - CVE-2026-6472
>> 
>>  When creating a multirange type, ensure the user has CREATE privilege on
>>  the schema specified for the multirange type.
>> 
>>  The multirange type can be put into a different schema than its parent
>>  range type, but we neglected to apply the required privilege check when
>>  doing so.
>> 
>> - CVE-2026-6478
>> 
>>  Use timing-safe string comparisons in authentication code.
>> 
>>  Use timingsafe_bcmp() instead of memcpy() or strcmp() when checking
>>  passwords, hashes, etc. It is not known whether the data dependency of
>>  those functions is usefully exploitable in any of these places, but in
>>  the interests of safety, replace them.
>> 
>> - CVE-2026-6477
>> 
>>  Mark PQfn() as unsafe, and avoid using it within libpq
>> 
>>  For a non-integral result type, PQfn() is not passed the size of the
>>  output buffer, so it cannot check that the data returned by the server
>>  will fit. A malicious server could therefore overwrite client memory.
>>  This is unfixable without an API change, so mark the function as
>>  deprecated. Internally to libpq, use a variant version that can apply
>>  the missing check.
>> 
>> - CVE-2026-6475
>> 
>>  Prevent path traversal in pg_basebackup and pg_rewind
>> 
>>  These applications failed to validate output file paths read from their
>>  input, so that a malicious source could overwrite any file writable by
>>  these applications. Constrain where data can be written by rejecting
>>  paths that are absolute or contain parent-directory references.
>> 
>> - CVE-2026-6473
>> 
>>  Guard against field overflow within contrib/intarray's query_int type
>>  and contrib/ltree's ltxtquery type.
>> 
>>  Parsing of these query structures did not check for overflow of 16-bit
>>  fields, so that construction of an invalid query tree was possible.
>>  This can crash the server when executing the query.
>> 
>> - CVE-2026-6473
>> 
>>  Guard against overly long values of contrib/ltree's lquery type.
>> 
>>  Values with more than 64K items caused internal overflows, potentially
>>  resulting in stack smashes or wrong answers.
>> 
>> - CVE-2026-6637
>> 
>>  Prevent SQL injection and buffer overruns in contrib/spi.
>> 
>>  check_foreign_key() was insufficiently careful about quoting key
>>  values, and also used fixed-length buffers for constructing queries.
>>  While this module is only meant as example code, it still shouldn't
>>  contain such dangerous errors.
>> 
>> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>
> Applied to 2025.02.x. Thanks

Not in 2025.02.x as of commit d2eda853cac ("{linux, linux-headers}: bump
6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series").

baruch

>
>> ---
>>  package/postgresql/postgresql.hash | 4 ++--
>>  package/postgresql/postgresql.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
>> index b7a2397f8f..48bbbd2443 100644
>> --- a/package/postgresql/postgresql.hash
>> +++ b/package/postgresql/postgresql.hash
>> @@ -1,4 +1,4 @@
>> -# From https://ftp.postgresql.org/pub/source/v17.8/postgresql-17.8.tar.bz2.sha256
>> -sha256  a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0  postgresql-17.8.tar.bz2
>> +# From https://ftp.postgresql.org/pub/source/v17.10/postgresql-17.10.tar.bz2.sha256
>> +sha256  078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90  postgresql-17.10.tar.bz2
>>  # License file, Locally calculated
>>  sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
>> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
>> index 9856d6423b..6f6f36702f 100644
>> --- a/package/postgresql/postgresql.mk
>> +++ b/package/postgresql/postgresql.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>  
>> -POSTGRESQL_VERSION = 17.8
>> +POSTGRESQL_VERSION = 17.10
>>  POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
>>  POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
>>  POSTGRESQL_LICENSE = PostgreSQL
>> -- 
>> 2.54.0
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
