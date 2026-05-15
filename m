Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F200CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF4084671;
	Fri, 15 May 2026 17:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ND9h-3y32a5; Fri, 15 May 2026 17:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A38E84651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867212;
	bh=xAIF5sVaPWWXzKTS/+CUXYzV0mB/NPLYZTrGcj+5edc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UhNiQ+g+lMaq2GTeh+z+dPuOwu/JP65rOtyMEbmBZqHAG6u1r47vuCvjp0VrUSUkP
	 onoEs6UCgj9g6b7avIx9r3/pvauj/uz+O94wZ5i80kEy0EVcaTzy1CNps8g3A6OCOF
	 7cBZ3Ff1jDKW+n7acsLKKrhZignL88g4QssBszn1qZAY1hYem57zySfGdL6iYA6QR9
	 XnOkzfW52Thq+pKDZYNG6mYGvYMMrQQWkuTnVAyK/ZSb2gEqgYaV1xh5SjvZY5WEfZ
	 TVqgAgBTt9MJA4JnrA2NKjdV9KVzKaYD0s3Zf/4v33bZBDau84KW9mTVT/i+Fo8+Gh
	 sLbgeAHUasFpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A38E84651;
	Fri, 15 May 2026 17:46:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4FF445B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6A1840FA4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGaOI1WtiyBZ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BD2F4027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BD2F4027F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BD2F4027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso26257f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867200; x=1779472000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ybN/BVm2Cijhu67lQWFEmy69XPZF8YaUG5ZUXRJtDC4=;
 b=VIrQvmaHCQp7DGDPIUBu55L0n9sf2e75JR+7MRP5NjPhAwYX0BSAJD5avFbSAnYETQ
 Dad1GX/+CQUWyh9leFr/EJnXFv2bZKALTkBE5jmRGdr2COhCpvk9nVEcDwg+XzBKuU3y
 bzC1SL469UC7q+dW61nJIS/4s77biX0YcHY1P6+tHBaA5/gsh7UpJSCRthsNIpps2cJW
 X7C3Wsqaypa+/4oT53Jz4hns/Al+UTOtQ384E1PX7hkdYNs3OyAa/3c6vrfDvOpBKlf4
 FRX9rPX6Wgog1Zyuw2quvK0Wb6f3Ir/fGXgRM3r6p2Ai97rfDhTzA0ivd5vYttZx4YV4
 iB/A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rg+XO0xkJd8fFxavWgx5GnWWFGswdeYQ5EGvNiMHsNMdN3kiFyFx7KLY8MIe6vj5nwXNKyZIIoxI=@buildroot.org
X-Gm-Message-State: AOJu0YzLjLJmCYAF1u+eTHSvBmvZZEccuZjzSJ4EhLu/ck8Hz/07t0oT
 SgQZ+qqH3NisaPPlUWVUb7pHSca2cmj0/o3KuCis45zt3lrDZ+uwn+BiRNJkjUdi88uQo2hIcvT
 nI7N3
X-Gm-Gg: Acq92OEeykcgeAREzdpDq4YO7W3fyeHehQJa1xK4mhmtCaC6HEhKElX20YWfzNuqxkQ
 av56PYFelJDlDeHdVM/PfRF6EW/RaZN7C5BEkQjR+nDP7U1OmCcfJtyjZnvALyMrcBkW45odriZ
 ph54cuSQFXE6rltTB2zhb+S4YxxnLCzRohxAd0/16Onc56MTlnIlUtub6vAeUt4d7oKz1k/0bKD
 7rXnK9/kqwC+95iSGQ1Ch3zHkJ4w+CBqbfJ52rE/4rmLKROxpvQs+34S52/7C/lJenWPdvOOtYH
 lJrSDh8nKwf+/vBVjguq3w1uYbyyJrksx19zMMQsWjzUVV1uNYV5QozN58FyFox0UTDRiVst1UD
 5Kayfb87DH2WApXz9xryONsikAcfPqUwpimhkiwwJrw8rsAEDpArO2kCgR0VU2j8t0oEgrh1fsd
 SB0abKU0gsW7KxaPLBpkYUHrCYIQw9fo35lERbNy10MaHK
X-Received: by 2002:a05:6000:24c9:b0:43c:ffee:ee94 with SMTP id
 ffacd0b85a97d-45e5c5a0198mr7520652f8f.11.1778867200444; 
 Fri, 15 May 2026 10:46:40 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767cb9sm15799020f8f.2.2026.05.15.10.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:40 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:39 +0200
Message-ID: <20260515174639.530364-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504160924.14432-1-peter@korsgaard.com>
References: <20260504160924.14432-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867200; x=1779472000; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybN/BVm2Cijhu67lQWFEmy69XPZF8YaUG5ZUXRJtDC4=;
 b=Z/Lie238YzQ2n6d4Yrd+mwI82mzon/ej5nGSyw/u97HPFstr/1E8EfWpr7AIkuqbgD
 HgOF6KYILNVho+bgp29P9Rw7q1erQD5lKDdNNxjF4BpooEr0Q4iFxDRyTn4IDg+o0Xv5
 tqepMVQjLt3y4B/IRbOt0gLh9crEjXTHnZfWWRLEH4Q3VhzGulrJ7zkOMCaYPJQvHViS
 YYtq6yOJSDzSJU3QMA0KXL4maAWpTra/7IyPzgqTR7aquYIhPbT5vI2APCO6LL9wMBSG
 UjymAWBMSvtXuI0aH++prD/FSOfRyoZ9E7e5L7YA3HUZEWrqa/M4LPpWDOM5+9cZlm2/
 T0ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z/Lie238
Subject: Re: [Buildroot] [PATCH] package/haproxy: bump version to 6.2.27
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
> Bugfix release with large number of (security) fixes.
> 
> For 6.2.26:
> 
> - a severe issue was found in the compression library (slz) where
>     specially crafted patterns with tune.bufsize above 17408 or
>     tune.maxrewrite below 964 (both non-default) could cause output
>     buffer overflows due to the overhead exceeding the promised
>     worst-case growth bound of 5 bytes and reach up to 1/16 of the
>     input contents. Given that the compression output is hardly
>     controllable, and the canaries at the end of the pools will catch
>     this at release time, the risk of exploitation by a hostile server
>     is close to zero, however it will cause repeated crashes if such a
>     crafted file is present on a server and regularly downloaded. A
>     workaround consists in keeping tune.maxrewrite at least 1/16 of
>     tune.bufsize or just not changing them since the defaults are safe.
>     A CVE was requested two weeks ago for this one, I'll mention it when
>     it arrives.
> 
>   - HTTP/2 incomplete transfer detection was missing for HEADERS frames
>     carrying END_STREAM. When relayed to an HTTP/1.1 server that
>     responds before the end of the transfer, this can result in bytes
>     of the next request over the same connection to be ignored. Most of
>     the time it will cause the connection to be dropped due to an
>     unparsable request, but when combined with "http-reuse never", or
>     on totally idle servers, the client could expect the second request
>     to reuse the same connection and perform a content smuggling attack
>     that would allow to pass an unverified request to a server. For
>     those who can't upgrade, a temporary workaround is to disable
>     HTTP/2 by specifying "alpn http/1.1" on bind lines and adding
>     "disable-h2-upgrade" in HTTP frontends. A CVE will be requested for
>     this one.
> 
>   - HTTP/1.1 bodyless messages announcing a non-null Content-Length did
>     not force close mode on the backend, potentially causing
>     desynchronisation between HAProxy and the server in conjunction
>     with other bugs.
> 
>   - FCGI record length truncation with large bufsize (>=65544) could
>     enable request smuggling into PHP-FPM since the 16-bit
>     content_length field silently truncated to 65535 bytes.
> 
>   - an unvalidated SNI name_len field in ClientHello could cause OOB
>     heap reads of up to 65KB via XXH3, smp_dup(), and log-format leaks
>     on any TCP frontend using req.ssl_sni, possibly causing crashes when
>     used.
> 
>   - ECDSA JWT signatures with ES256/384/512 could cause a heap overflow
>     of ~14 bytes in the DER conversion before verification.
> 
>   - Lua's httpclient headers conversion accepted more than 101 headers
>     without bound checking, causing a stack buffer overflow reachable
>     from any Lua action/task/service.
> 
>   - peers dictionary cache updates accepted an unvalidated entry id as
>     array index, allowing OOB heap writes at attacker-controlled
>     offsets.
> 
>   - Lua had a use-after-free of HTTP reason strings managed by Lua's GC
>     between set_status() and start_response(), potentially leaking
>     adjacent information from memory.
> 
>   - the regsub sample function could leak ~9-50KB of stale heap data
>     when back-reference expansion overflowed the output buffer.
> 
>   - SPOE decode_varint() had no iteration cap, allowing pointer
>     arithmetic to wrap and dereference memory ~64KB before the
>     allocation, causing SIGSEGV or parser confusion.
> 
>   - in sample expressions, less common HTTP methods (PATCH etc.) are
>     represented by both an enum and a string. The string part was not
>     handled correctly in sample duplication functions, resulting in
>     their contents appearing empty when trying to fetch the method.
> 
>   - QPACK varint decoding is now also limited to 62-bit, and had a risk
>     of 1-byte OOB reads on truncated streams, which could cause
>     incorrect header decoding.
> 
>   - config: a few argument parsing errors in conditional expressions
>     used in ".if" could be misreported and even cause a crash during
>     the parsing. Also, a few keywords relying on warnif_misplaced_*
>     didn't check the return value and didn't count emitted warnings as
>     warnings.
> 
> For more details, see the announcement:
> https://www.mail-archive.com/haproxy@formilux.org/msg47016.html
> 
> For 6.2.27:
> 
> A major issue were fixed by this release. It was related to the scheme-based
> normalization. The presence of commas in Host header and authority was permitted
> and would be used to compare the values, which then would differ when read via
> hdr(host) which splits them on commas, and under certain circumstances, trigger
> crashes (at least it did in the OSS-Fuzz environment when injecting the values
> directly at the HTX layer). The issue was fixed.  Remains the case of the comma
> characters in authorities. Even though the spec permits commas in authorities
> (not in domain names), there is currently no use case for this and it causes an
> ambiguity with the historical use of hdr(host), so we preferred to just deny
> them. The change was performed on the 3.4-dev10 and postponed for the next 3.3
> release. It will probably be backported to lower versions too.
> 
> An issue in the FCGI multiplexer was fixed. The function responsible to emit
> FCGI_PARAM records was not handling cases of full buffer in a consistent
> way. The issue was quite limited, but the "http-send-name-header" option could
> be silently ignored. The issue was fixed by reworking this function.
> 
> The scheme-based normalization was fixed to properly handle case of OPTIONS
> requests. As stated in RFC9110#4.2.3, when the scheme-based normalization is
> performed, an empty path must be normalized to "/", except for OPTIONS request.
> 
> Finally, a memory leak on error path (tools) and other minor issues were also
> fixed.
> 
> For more details, see the announcement:
> https://www.mail-archive.com/haproxy@formilux.org/msg47059.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
> index 5c644356a6..6bb5dda804 100644
> --- a/package/haproxy/haproxy.hash
> +++ b/package/haproxy/haproxy.hash
> @@ -1,5 +1,5 @@
> -# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.25.tar.gz.sha256
> -sha256  d861cacbe2ed51ae8ad5fa9ee5165b4e5e2bccaa5b9e04324711761d7d946be9  haproxy-2.6.25.tar.gz
> +# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.27.tar.gz.sha256
> +sha256  ccdaf08e8653f9651992212b51af0b5513c2e2cf0cd822ca67c94cffe10386a6  haproxy-2.6.27.tar.gz
>  # Locally computed:
>  sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index a22c8b38ce..cf1484243c 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  HAPROXY_VERSION_MAJOR = 2.6
> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).25
> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).27
>  HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
>  HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
