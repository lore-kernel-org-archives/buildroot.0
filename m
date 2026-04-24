Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A3BFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E4284E65;
	Fri, 24 Apr 2026 16:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqJHcApQ1o-X; Fri, 24 Apr 2026 16:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAAE684E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048013;
	bh=OgOI9GrY2FTS/qoWWYbUgeQJZu5cRiKqrt6qQv67yjQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RvEhsw66kihzg0x94Wks/1q6MW8qvqvRu1nuiWzdukMQuBpGv9EeyqLm4X7CsWWjn
	 KhkPz68bmkKhOBdYjcNAu8eK8OH/48RJ7/za5zEhSo0NX6JfXmndavJmVpS4diuAb0
	 2l/1YgwJfaTqRipK+QmIHDb17AvJKdHG4XEhYhhJe2jEIbvf49fFlK52yCNOYu/pZB
	 argg/eG2EEj0Aav+x1E4eTWKEIvYXt8Sx5EfH3drZTR7UAkit8S6WarXxaE7gR9+Mp
	 /SAqnhlCbWhLbhJXxHsXg59WTr0xNBV5MA2yAAas7rLSUYcYRKRtLSzRtit2lZGil5
	 7/LcDY5wFPHUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAAE684E59;
	Fri, 24 Apr 2026 16:26:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0927C194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B26194295E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPwDB2njxRuJ for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DF6A42977
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DF6A42977
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DF6A42977
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so75012045e9.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048005; x=1777652805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UrPG26TrrpbFxKoOi5CZeVhoofGBxm9Rae0fh7r3si4=;
 b=eKBzZY9Yy2ufHgP+9ALnbbgVV3yCllJUNTTKuzmXFscjqDxgxZ/MaHSrYILDaC/e0H
 5WXz4CK0UsfJnoIQzA/FbpgQOomWkn15oxstnErxAeXBumpyZlg10WAjVotJOJEwrtNg
 pb5+x+39i+edsgvjCxzOBWo1o0dPIeSWHn9EKuyBsodor5BEGzr1RnLDe4TkgowsqwCw
 Wc1Kb1yz6f7DSLvplB/aV8uplmIfWp10ZA41lS4BjqwimsgR5wp8rMDwzD7SeNNKxZX4
 eg42rQz2/RflAI2skvhcvaP5psfwtP20KmNHw7uRjJh3HDVkTYhUSx5qf172JNKtTuQd
 4ugg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FbUWf0ghNgMk+y2hGEcMTq97earVkNE+OU16Vd+ayKuveYPxWOZiqpOf2MKrAUtk3YPjib76qfuA=@buildroot.org
X-Gm-Message-State: AOJu0Yyk+7wgfWyFngNd/FDxjWbLUHn9XMhSUboWWE0QoSP+rzE/qgPM
 Iae2MpxSpSeh1n91/XEuiAIJlPf0AYjpjrHec+MqaLb/Uofx7MFDBkmxhaP51xZ/Nuk=
X-Gm-Gg: AeBDiet7XNEcMm3JQV+yXXprUqdGxigZt1i2Im382kGFFApITscKtH6uHZT6zpXs2St
 m/NKFMYf8B3OOiUsTeJ6dzRnUSFN+xdCa+/w0Imu0kuq8ZisGSN7yx8lQvTGIB1Vb8LCtVjgs21
 n/BiJ/ifNAqAxQoFAQQV16xi6Urcav87f+Izz9Ims63XBtX5naAKULVWiLlFFmtq1FObWxwfmu3
 2Rs3sGQGNJkcmtVxUTdJq1Tm1EAJMNa8GFX1oaLLMICH8A5HUNPDVMLEaZ8RB9C2rOMvJBYd56f
 PR8O+dwMKLRQdq0GMjxUa/U2Psyh/W7gXm6vH9FBd0k0qJgjAayqQZsr4/xLcJUDgGlUqjAOuBt
 G/VU8icK8zSLA6ZpYWl0M4ByhIvEnIaNYQ7DhVFzuk3Qs84sQHQccHn/c+qiaJU/buAegkSsn25
 KHgc30rRXjmPqroaoU78ZXBb8cpA==
X-Received: by 2002:a05:600c:348d:b0:48a:674d:e756 with SMTP id
 5b1f17b1804b1-48a677401c7mr26657625e9.20.1777048005349; 
 Fri, 24 Apr 2026 09:26:45 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48919f54572sm159603575e9.26.2026.04.24.09.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:44 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:44 +0200
Message-ID: <20260424162644.161179-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421143310.2795827-1-titouan.christophe@mind.be>
References: <20260421143310.2795827-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048005; x=1777652805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UrPG26TrrpbFxKoOi5CZeVhoofGBxm9Rae0fh7r3si4=;
 b=Et9+y4vX5qizF8SOXsa/kBlDMYlcWPmojSL4VvRObIHZ3bQEtG/sjGZ8eYBI7QkzNo
 N5LTEATNRxUQe0XMXWXYfACbk+lYEmm7BwOb3vc5026b9Ogpo2r1QuiUSNKKU7qGojhz
 uYgyAImX7WoW9sOWxGM+1ARfTi+QacDR5JjjnSrkDEvdcNYG06z60QnWI4BSBTMhb676
 v3JrnuPpEAfoBk8ESEP9t8Sl5Zp41xZXJOUreytbOm50+o+AI9WoME5tw9RnQDO1+w1G
 eOD+P3I7WIBGCLDVPy/oCn4F9hqF2W0eLlTY9FiOd9NxwRoUAD3ngimf70a4qcRjr87O
 nwlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Et9+y4vX
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/strongswan: add patch
 for CVE-2026-25075
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
> This fixes the following vulnerability:
> - CVE-2026-25075:
>     strongSwan versions 4.5.0 prior to 6.0.5 contain an integer underflow
>     vulnerability in the EAP-TTLS AVP parser that allows unauthenticated
>     remote attackers to cause a denial of service by sending crafted AVP
>     data with invalid length fields during IKEv2 authentication. Attackers
>     can exploit the failure to validate AVP length fields before
>     subtraction to trigger excessive memory allocation or NULL pointer
>     dereference, crashing the charon IKE daemon.
>     https://www.cve.org/CVERecord?id=CVE-2026-25075
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  .../strongswan/0002-fix-cve-2026-25075.patch  | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/strongswan/0002-fix-cve-2026-25075.patch
> 
> diff --git a/package/strongswan/0002-fix-cve-2026-25075.patch b/package/strongswan/0002-fix-cve-2026-25075.patch
> new file mode 100644
> index 0000000000..82e07fba3f
> --- /dev/null
> +++ b/package/strongswan/0002-fix-cve-2026-25075.patch
> @@ -0,0 +1,48 @@
> +From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001
> +From: Tobias Brunner <tobias@strongswan.org>
> +Date: Thu, 5 Mar 2026 12:43:12 +0100
> +Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field is invalid
> +
> +The length field in the AVP header includes the 8 bytes of the header
> +itself.  Not checking for that and later subtracting it causes an
> +integer underflow that usually triggers a crash when accessing a
> +NULL pointer that resulted from the failing chunk_alloc() call because
> +of the high value.
> +
> +The attempted allocations for invalid lengths (0-7) are 0xfffffff8,
> +0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't result
> +in a buffer overflow even if the allocation succeeds.
> +
> +Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
> +CVE: CVE-2026-25075
> +Upstream: https://download.strongswan.org/security/CVE-2026-25075/
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> +index 06389f7ca73e..2983bd021ded 100644
> +--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> ++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> +@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
> + 		chunk_free(&this->input);
> + 		this->inpos = 0;
> + 
> +-		if (!success)
> ++		if (!success || avp_len < AVP_HEADER_LEN)
> + 		{
> + 			DBG1(DBG_IKE, "received invalid AVP header");
> + 			return FAILED;
> +@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
> + 			return FAILED;
> + 		}
> + 		this->process_header = FALSE;
> +-		this->data_len = avp_len - 8;
> ++		this->data_len = avp_len - AVP_HEADER_LEN;
> + 		this->input = chunk_alloc(this->data_len + (4 - avp_len) % 4);
> + 	}
> + 
> +-- 
> +2.43.0
> +
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
