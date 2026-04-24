Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C30DFED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D639184C90;
	Fri, 24 Apr 2026 16:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqNue3PJ-RmV; Fri, 24 Apr 2026 16:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBF3584C91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048522;
	bh=BCyfhLulatkq1GBNY6uf61f+ZbT+z/30XRmxtk84g+w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eZFxe5o5LrqvqvkWEWpPFhfsubs5Xfifsc+XVjqP2xGYNzwox6K3L9Yo+hmyeAkTJ
	 8cuw5x4Wccvs7KWVrF9g0Z7cVFMATIfe6sTNBhEa/dt/BVVx9toocZrJJTo8F8SsJ8
	 Gur92CVhQvdM41boiCrDXy8ElfYed/oUdrx4N/wyO0aN5qrjOQ8dpkEPpnpFz3yKMi
	 kbd+h2XJvt0M3WuZfwOfx3KxNuYVhaNVk1mEmKwbHkHrRoB4kKfkAC7d0cYA+5QFip
	 Hn+lN+tCmKRhi0+Ob8IF9xISSyVwQQLHRgInTo/kZNzsPSMZb0guCSqmiQqI3dnHEw
	 GAUoUHowpYg2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF3584C91;
	Fri, 24 Apr 2026 16:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C257231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DF7B84C91
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0A_AVUFGatep for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3332984C90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3332984C90
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3332984C90
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:35:19 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43cfbd17589so6489990f8f.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048518; x=1777653318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O1lNOCQMSMOZ2dIc7N8dBiJHsdTCuirmY17ifdjckwI=;
 b=eLhNavwn4zP88aptbGuVozI8ldx5wALPzQuuMp9QvGB+w61ljZOjIplcyeRVDuBl7d
 g0bZEURXCTLAqvBb7hq1/rjMAYzKJa0SF3DjpAC/jMAzbwLsWOMyduFlDKh/cQIhd/tV
 Lr0XQiUedQ7W0oX3R7vjCOyhddztjKKo2vKxCqPb2EeIceuUKPZfxEfrpbX6uFDA9Ure
 mhO7UI2Uc581iNA+y0MLwuTD0f6k56xtdpJNsypl/z3oxzHHyzldsgNNTCsfHAoWHLux
 KrUOJvIF0g9wq+6JOh61Ni4l8biB3fjN31tnJEviSerzH4xu8pYyataEjYrNvIp/DfRh
 IQ7Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Im8Iao6znyPq6GP7bTfgM7WfKCu+pGDF0HRNv5MZOcmd1TSYCJccSd9nl4AbNlP2vCOQaWOvtyr0=@buildroot.org
X-Gm-Message-State: AOJu0Yyz8p7O0eDkp52zMSFFWqKudqzMv7MvBlywkITZk4QT6ObrP8M/
 0N3HJn0BlTiPojkK6fwHC10+RoZhAr+ouoKi3zen2AmMjm8TVZMPzMIfTf5hQ8bpUnY=
X-Gm-Gg: AeBDieth2tLdWT1tMq6EQ9ARFwTPR9Gb20ilODlzm24VZXvGBzwkW0AEONYHOIZszu6
 SO4NepHvcY5zeL4wwpfoLFocgzPyceIRarBZzQZDifT2oQZawuKh83nIqX1Z/uidxGYg9xbsiaQ
 qK4BywUhWu7WBZvC8IxGcCjEQnixb6tF5ggsFjH+0its3nuVzDinB2J+3J0Gz5MPd4XOugu6RSd
 sDTF294Ei18abibdMbsW7XvFRGYEG5opL5UpANMvgiuZkZQN5mRv/MmAJ23p9XP5RDfFVTIZYS6
 1hg/DSN5rTaGrnRS4kJH2KCgt91tEEkywlqAkWDxZF8qDfi4Cn82b5vHKQKNiQ2PW8+LO9uwIWY
 aCmc2e5VNv6kLSZaOiOhf5DVTlC3WlbjMYMzwBvQzZuRMP5deBImSLRRg3Gj/gAhEZakJczXUWL
 +4iwAdXuEMkEb6JPeBdcbGZwLPDg==
X-Received: by 2002:a5d:5d13:0:b0:43f:e990:2f5d with SMTP id
 ffacd0b85a97d-43fe9902f8dmr44656614f8f.35.1777048517967; 
 Fri, 24 Apr 2026 09:35:17 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a174sm66988968f8f.18.2026.04.24.09.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:35:17 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2026 18:35:16 +0200
Message-ID: <20260424163516.172885-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422125721.3193186-1-peter@korsgaard.com>
References: <20260422125721.3193186-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048518; x=1777653318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1lNOCQMSMOZ2dIc7N8dBiJHsdTCuirmY17ifdjckwI=;
 b=YEPJeZlyuMxLM1CmHd4gqZuVJV5FBRAV7R0R11jUPFN1jSqYsTrIKx/1FYHsR8emBl
 TjmaGXl5TYizl+ryk3XmT8JkBspEU7Nw7e/i007B0OSGs8+EQrovPrB3bO2XeeJSZ9x6
 MTopm+Zj0kefM82pHbDyvXrone/Ex+7dQzMtGk++sBDzm2ntaEuLisjKVwjpnxrJRBCG
 TuH4uCBWm6tOAZepMW43JDTS3WyI/OB4vv3C2oO1wNPXEOBxFjaikl6kT/b/ocdkngN5
 D0zLfdsbI8hqpFut3IgtydJ0gqDzIzCeuUqGXlaqvJ0lgnrHLJRPy47fPEaverI5Sc+f
 W0cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YEPJeZly
Subject: Re: [Buildroot] [PATCH-2025.02.x] package/python3: security bump to
 version 3.12.13
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

Hi Peter,

I applied this one https://lore.kernel.org/r/<20260417091800.2374733-1-titouan.christophe@mind.be>
and then saw you submission.

I planned to merge the security description but forgot before syncing.

Best regards,
PERALE Thomas

In reply of:
> Fixes a number of security issues:
> 
> Email and header-related:
> 
> gh-144125: email.generator.BytesGenerator now refuses to serialize headers
> that are unsafely folded or delimited (see
> email.policy.Policy.verify_generated_headers); addressing CVE-2024-6923.
> 
> gh-143935: Fixed comment folding in modern email policies to prevent header
> injection when very long non-foldable comment text is wrapped.
> 
> gh-136063: email.message now ensures linear complexity for legacy HTTP
> parameter parsing.
> 
> HTTP, cookies, and URL parsing-related:
> 
> gh-143916: wsgiref.headers.Headers now rejects C0 control characters in
> fields, values, and parameters.
> 
> gh-143919: http.cookies.Morsel now rejects control characters in fields and
> values.
> 
> gh-143925: data: URL media types now reject control characters.
> 
> XML-related:
> 
> gh-144363: Upgraded bundled libexpat to 2.7.4 to fix CVE-2026-24515 and
> CVE-2026-25210.
> 
> gh-90949: Added Expat allocation-tracker APIs to xml.parsers.expat parser
> objects to limit memory amplification from malicious XML input; includes
> mitigation for CVE-2025-59375.
> 
> gh-142145: Removed quadratic behavior in xml.dom.minidom node ID cache
> clearing.
> 
> Denial-of-service hardening:
> 
> gh-119342: Fixed a potential memory denial of service in plistlib.
> 
> gh-119451: Fixed a potential memory denial of service in http.client.
> 
> gh-119452: Fixed a potential memory denial of service in http.server (CGI
> server on Windows).
> 
> gh-136065: Fixed quadratic complexity in os.path.expandvars().
> 
> HTML parsing-related:
> 
> gh-137836: Hardened html.parser.HTMLParser with support for additional
> RAWTEXT/PLAINTEXT elements (plaintext, xmp, iframe, noembed, noframes,
> optional noscript), improving robust handling of hostile markup.
> 
> SSL memory-safety fixes:
> 
> gh-144833: Fixed a use-after-free in ssl when SSL_new() fails.
> 
> For details, see the announcement:
> https://www.python.org/downloads/release/python-31213/
> 
> Upstream now provides a sha256 hash, so use that instead of md5.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

> ---
>  package/python3/python3.hash | 5 ++---
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index ed0d879f11..6964789262 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,4 @@
> -# From https://www.python.org/downloads/release/python-31211/
> -md5  04feb01316c7bb1b448001adbc63dd23  Python-3.12.12.tar.xz
> +# From https://www.python.org/downloads/release/python-31213/
> +sha256  c08bc65a81971c1dd5783182826503369466c7e67374d1646519adf05207b684  Python-3.12.13.tar.xz
>  # Locally computed
> -sha256  fb85a13414b028c49ba18bbd523c2d055a30b56b18b92ce454ea2c51edc656c4  Python-3.12.12.tar.xz
>  sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 4ace4d8573..60ab5b0cbc 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.12
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).12
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).13
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
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
