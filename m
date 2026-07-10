Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753D3C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8D2811EC;
	Fri, 10 Jul 2026 13:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YneSzECErIBp; Fri, 10 Jul 2026 13:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1AFC811DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691538;
	bh=O40cSm2y7VSvQlh8Jp9zwaEk22zCYKXiBLeyHMHy26I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gw7a4sLH0XxGkTFKw1h6XmHefX/gDG7lBZHslU+Ca23OjMjk8gBgvJ/LcW7VHRGxM
	 dv/lHQEAE+5lINpZO3lz7LetMZR6UB7UyULAxVed7F1OHSAwn95vFpqW14vlqgK/pC
	 zevO9SUA/PLj5LdkW1p9GBFXidAt0l7vCUbAT8yh0EFR4aZv4KHvbGKHgIc8gTJopU
	 hf2MXqb2+tU4CoVKxiJNAgYgy2nBMVcfQ6Xon2gCHSw0tUfbtb9Cqp1QyUTOjzEYmZ
	 mqkoJlmqdY2na1shvcC9loeIRagzkphUlWy2gVdAxAUkv4JVDN8xRkugkdzxuwR6Ig
	 zRPQVhraQP0YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1AFC811DC;
	Fri, 10 Jul 2026 13:52:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F2EF2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D6E4811DF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfk1whgKWt36 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7DB9811CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7DB9811CD
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7DB9811CD
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-493ece78b0cso7532165e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691531; x=1784296331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N6oMcDPMfkUPOc3ZK8RDJgVi4MssRXuqcqqsTR8d5Xc=;
 b=AyzZe8ntgI5qIwmI0BJcVThKDfahbImae0rbGQrDSRnnZMEIWYFQgvmmvDMj9zGK8+
 nnM8U2NFa7Qg7pTfs472d33TtUzzR5nCvrudlrBdTuZF7gwy3Lsu5GlE2fBo0uOgl1kp
 JofM8QmBHllQPHw+DqTa7NDaXmufsbdzz+R0igmvQgAgyQ+9S4GkAng32+EmXt0Y4Yek
 AWyPMZvK90YANk0Vr7nOuObMkF0letkWqhNQJdIA3zMB7Bh1AeJisnnxWH9LzFxtugzl
 wiE2CP55Em/faZAfJNXRUP8GxWUzZp8P1MtcsPUdHBwwuaRfrGj9HkFHWf8YY4VWinfO
 OWYg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp8/bRfv/l2bmTeTzN5ip0Vpe3IFuCUH+u0S+Q8nI9OBlkzzVDb5v0Ap7bF+emk8WYx04EOpVW0Q0A=@buildroot.org
X-Gm-Message-State: AOJu0YzZ2u6WvIlwsk6DpfOpkVJBqOGW/ktS1TOEY5IGbPsNBSPriSaB
 MLI+AN9Y8So+LA+mdpnXLhmgFaC1tAOg1PYVISR+231rJSMmJjnErcoB17UCF59CObA=
X-Gm-Gg: AfdE7ck21k8iTTbNgbbKyODm+CrLWafVZtlb3zrtYJXzTMFT5jWfssvBaJkzVnGAS7w
 W76EKumO1GQ7l9s5t04JgZV8IWDLk4be9hhGhUsC/Z42pQDsI+uBkBW20MCsW2EH+QsPm1RZPIS
 6oHhn6GbHNest+FiqPeSGqBjFwLGH9q7ox7GQSpk3UAkB6YcyeDk54hUHxrJ9b5q89FmZAmPLXD
 JV2AQe37J6QM1CSiWrN0Xak82ziEspSZGIh3oyx9OO33cvtFI1i4B32eQkKBcJbC4X+OjeQCdJN
 esLf+ffXbaMhb5nfXphlzH74Iet0t+HzhGBnAPEMvbw3GLxT1UfRHlwHhdDAd79vyW3yxbl85Wb
 DCR8Qa2HRI0v1Ktmj+3h7mUy1eco9PWiLKpXQ/+KuBtn3oSgrnAUWC+xzaq+AcHdAeDBN5IDyXv
 LW4w7fLVGlk3abCi9J
X-Received: by 2002:a05:600c:46c9:b0:493:f750:f7fc with SMTP id
 5b1f17b1804b1-493f750f87cmr6956785e9.35.1783691530713; 
 Fri, 10 Jul 2026 06:52:10 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb70a372sm138717115e9.7.2026.07.10.06.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:10 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:09 +0200
Message-ID: <20260710135209.760388-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <akYJYnK3kBeCeV4B@waldemar-brodkorb.de>
References: <akYJYnK3kBeCeV4B@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691531; x=1784296331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N6oMcDPMfkUPOc3ZK8RDJgVi4MssRXuqcqqsTR8d5Xc=;
 b=PiuDNOnAFvTbfzY2ih1cUIBD5YcWK1/+D/E/jmKFcqcBimBozT1olR43OvA+qQ/v3O
 wX1STkaQbmc+CGtKGqSW2eCS23Y+w6XL7ndFcITXBiJ/7LEXKOUiuifNAOgRXNc8q2j0
 kSy9dDnBFgBH7gNNd2KodEDUfwKCGehC9ySLeGGRDdRAcN/6bVnLu+WMjKsGUaiEFvNl
 7cYG/YpLLsQJsb9JVE/opdj+X16lfY30quTnL71ynSoMKSAt6+MvFynHyJV1Q7dDuXUT
 oCk0PC2sTrZUMmeZVIizhJWk1Du0E/k6QWXPaXW1ckvXfK5K2Z8Df+piEorLltD3mxD/
 DbNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PiuDNOnA
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to 22.10.1
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
> See here for a complete Changelog:
> https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22-current.html
> 
> Security Fixes:
>     GHSA-3g56-cgrh-95p5: chan_unistim DIALPAGE digit handling can overflow phone_number and crash Asterisk
>     GHSA-3rhj-hhw7-m6fw: NULL Pointer Dereference in HTTP AMI Digest Authentication
>     GHSA-4pgv-j3mr-3rcp: Reflected XSS in Phone Provisioning HTTP Error Pages
>     GHSA-589g-qgf8-m6mx: Stack buffer overflow in MWI NOTIFY Message-Account parsing
>     GHSA-746q-794h-cc7f: Out-of-Bounds Read in Q.931 Information Element Parser (H.323 Addon)
>     GHSA-8jhw-m2hg-vp3h: Heap Buffer Overflow in OGG/Speex File Playback (format_ogg_speex)
>     GHSA-8jw3-ccr9-xrmf: Buffer over-read in Asterisk PJSIP MWI body parser
>     GHSA-g8q2-p36q-94f6: Heap-use-after-free in Asterisk PJSIP TCP/SDP handling when TCP connection closes during SDP processing
>     GHSA-h5hv-jmgj-92q2: CVE-2022-37325 fix is absent from current chan_ooh323 Q.931 party-number parser
>     GHSA-j2mm-57pq-jh94: Possible RED T.140 Generation Accumulation OOB Write
>     GHSA-mxgm-8c6f-5p8f: Stack buffer overflow in res_xmpp XMPP namespace prefix handling
>     GHSA-ph27-3m5q-mj5m: SQL Injection in cel_pgsql and cel_tds via CELGenUserEvent eventtype Field
>     GHSA-q9fr-m7g8-6ph5: Asterisk app_sms.c copies externally controlled SMS lengths into fixed in-struct buffers
>     GHSA-qf8j-jp7h-c5hx: Out-of-Bounds Write in Codec2 Decoder Due to Floor/Ceil Sample Count Mismatch
>     GHSA-r6c2-hwc2-j4mp: LDAP Filter Injection in res_config_ldap via SIP Username (Unauthenticated Information Disclosure)
>     GHSA-vfhr-r9x9-c687: Possible RED T.140 Heap Buffer Overflow
>     GHSA-vrfp-mg3q-3959: ARI setChannelVar bypasses live_dangerously and permits FILE() writes
>     GHSA-wcvv-g26m-wx5c: ARI REST-over-WebSocket read-only bypass allows arbitrary module path load and conditional RCE
>     GHSA-x348-j6c9-77f3: Stack Buffer Overflow in H.323 ooTrace() via Unbounded vsprintf into Fixed 2048-byte Buffer
>     GHSA-xgj6-2gc5-5x9c: ast_loggrabber executes python script in world writable directory(/tmp) leading to potential privilege escalation And RCE
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 8d620a0ee3..35aa1282e8 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  dd664a9600874d0b0c0e63a8fda2e08efc9f5fdc95781022fbf39ed9b15196f6  asterisk-22.9.0.tar.gz
> +sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
>  
>  # Locally computed
>  sha256  633c3dc34ffb21af8ac9ee160245c9c174379391e35cace1b6c9f516a260f683  pjproject-2.16.tar.bz2
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index b15a83f6f8..b6b40645ee 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASTERISK_VERSION = 22.9.0
> +ASTERISK_VERSION = 22.10.1
>  # Use the github mirror: it's an official mirror maintained by Digium, and
>  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
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
