Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39306C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 21:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD5140135;
	Thu, 11 Jul 2024 21:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYr3Pwi1JWV3; Thu, 11 Jul 2024 21:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 782EB4026B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 782EB4026B;
	Thu, 11 Jul 2024 21:55:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66B3F1BF5F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53F3A4026B
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgieQxLGNVbv for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 21:55:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D874340135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D874340135
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D874340135
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 21:55:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-36796bbf687so695385f8f.0
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 14:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720734922; x=1721339722;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cmgGRaoimsxRmCMG4z6IZoIAJKxxQeyRDbhUR8ErxxA=;
 b=O+37VXiRkHZ95/sWvte27iVo8SIw2O3mJPkz+lH+ox98oQF6loIM3u/mjtTjG40G6h
 f2/aTbYSGlivWzWyuPo+kiCOE5e64Ikjcc4ZkRAEWC8Ac6IqIwKAjmQeodSkb6bw+2zC
 jKIExi7OCUVxN5PI5ohTu8B0tsVBRXiq9nicYpOQwmGdde8meKAk7ZrcEaQANEjTajnx
 ViWwExCNf/J2KgXWzEn0PRowIvafpSFdqlvoEZawfhmRnyZegSYjeyuHGPPDV8Ic7603
 zpNQVIVaISAgiAoBIAw0nLb2JEhwm+SLaqW4U55lIegtryYUk/+7pN8HgfshcD6W8MfB
 LW6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX607lHAAaO6CTF2/GoYHGMCAIh/niWGiIyed3+zVuJjFPkKYbI2+rRI4WRn+o2ax0B3z4qZOeyAhXx5MPCDLGyps841DUT6w==
X-Gm-Message-State: AOJu0YzzVOSQ8j6fgRoTroMJdrWsyIKEBlCuJXqF4D8M560GRkMhr0yL
 r3oRX3GZmAyyxsbYCcuxhIuAVHDQDFUSgRoQpgcEWx5D6eoZ3JvxndhM7qdfdPIvufr6BhvIFrk
 nHYI=
X-Google-Smtp-Source: AGHT+IFYTKSIEp80ekpmAcbsbVCwCWPwzkfnk+3daZeHw2cD6YpyKAReGnosqNJ1O4oiGwjy2MZwgg==
X-Received: by 2002:a5d:4b88:0:b0:35f:2366:12c5 with SMTP id
 ffacd0b85a97d-367cea67f1amr6539892f8f.23.1720734922120; 
 Thu, 11 Jul 2024 14:55:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa065bsm8692603f8f.72.2024.07.11.14.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 14:55:21 -0700 (PDT)
Message-ID: <0accd927-c205-47cc-acb6-39f77376e497@mind.be>
Date: Thu, 11 Jul 2024 23:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>, buildroot@buildroot.org
References: <20240603003706.87432-2-wilfred.mallawa@wdc.com>
Content-Language: en-GB
In-Reply-To: <20240603003706.87432-2-wilfred.mallawa@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720734922; x=1721339722; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cmgGRaoimsxRmCMG4z6IZoIAJKxxQeyRDbhUR8ErxxA=;
 b=UwlhaNYEn5AtHnY3oFdr1wrQbNzi2kWcIb/o/OyW0Iq447PMCx1FqitBGV9ncOB5IU
 Mn5SAwtC6lz8sXWs6brFxFLgOhx6P4eM4qT0ZD8Ms2MSl7n6O414Mee2gzZ5tYrkKVu6
 EaKQ0iOwcDvNdQYopKSAgAztsGeTX5lYZTFY6J7ltV1iTw0zsKqmFwqqVenjpzbn+1tP
 hQTdzd7TcgwcrfWnbfm3XgDVm74hc+5HpGV8bAdxhJcg0bbVMam4Jnx6dKeXznFXeLjH
 O2o27hDTQpK+Vp0W1+D4PGkYbImxhqiMpzrzibfXUKQHu1uBX5ArFVEEduvb50dCAtH7
 8wWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UwlhaNYE
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libspdm: bump version to
 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Alistair Francis <alistair@alistair23.me>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/06/2024 02:37, Wilfred Mallawa via buildroot wrote:
> `libspdm 3.3.0` now supports the SPDM event capability, however this
> patch disables support for EVENT_CAP as it is optional, and requires
> additional functionality implemented at link time.
> 
> Adds a pending upstream patch that fixes the incorrect parsing of
> certificates with `id-DMTF-hardware-identity OID` tags.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

[snip]
> diff --git a/package/libspdm/0001-library-spdm_responder-Fixup-set-cert-checks.patch b/package/libspdm/0001-library-spdm_responder-Fixup-set-cert-checks.patch
> new file mode 100644
> index 0000000000..1708568500
> --- /dev/null
> +++ b/package/libspdm/0001-library-spdm_responder-Fixup-set-cert-checks.patch
> @@ -0,0 +1,56 @@
> +From e41eea4f4119d1efb9a633092b32e6717a1c246c Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Thu, 23 May 2024 15:33:26 +1000
> +Subject: [PATCH] library/spdm_responder: Fixup set cert checks
> +
> +When we run checks against the certificate that the requester set we
> +have the following function calls
> + - libspdm_set_cert_verify_certchain()
> +  - libspdm_x509_set_cert_certificate_check()
> +  ...
> +   - libspdm_verify_leaf_cert_spdm_extension()
> +
> +At which point libspdm_verify_leaf_cert_spdm_extension() checks to make
> +sure the id-DMTF-hardware-identity OID is not set if it's an AliasCert
> +model.
> +
> +This ends up being incorrect though. If using an AliasCert the
> +SET_CERTIFICATE CertChain (table 93 - section 770) will "contain a partial
> +certificate chain from the root CA to the Device Certificate CA". This
> +means that the leaf certificate of that chain should set the the
> +id-DMTF-hardware-identity OID as it isn't an alias certificate.
> +
> +At this point the check in libspdm_verify_leaf_cert_spdm_extension() is
> +incorrect.
> +
> +The documentation of libspdm_x509_set_cert_certificate_check() states
> +that:
> +    is_requester_cert     Is the function verifying requester or responder cert.
> +
> +Although we are a responder, we are verifying a certificate set by the
> +requester, so change the is_requester_cert to true to avoid the
> +incorrect id-DMTF-hardware-identity OID check and match the
> +documentation.
> +
> +Upstream: https://github.com/DMTF/libspdm/pull/2708
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

  It seems that this patch was not accepted upstream and replaced with 
https://github.com/DMTF/libspdm/pull/2721
Could you update  with that?

  Regards,
  Arnout

> +---
> + library/spdm_responder_lib/libspdm_rsp_set_certificate.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/library/spdm_responder_lib/libspdm_rsp_set_certificate.c b/library/spdm_responder_lib/libspdm_rsp_set_certificate.c
> +index 8c2d36fca8..bed87d9e9a 100644
> +--- a/library/spdm_responder_lib/libspdm_rsp_set_certificate.c
> ++++ b/library/spdm_responder_lib/libspdm_rsp_set_certificate.c
> +@@ -42,7 +42,7 @@ static bool libspdm_set_cert_verify_certchain(const uint8_t *cert_chain, size_t
> +     /*verify leaf cert*/
> +     if (!libspdm_x509_set_cert_certificate_check(leaf_cert_buffer, leaf_cert_buffer_size,
> +                                                  base_asym_algo, base_hash_algo,
> +-                                                 false, is_device_cert_model)) {
> ++                                                 true, is_device_cert_model)) {
> +         return false;
> +     }
> +
> +--
> +2.45.1

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
