Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80403C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D10E40D3B;
	Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-LluoxyeiyP; Fri, 10 Jul 2026 13:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B9C640CC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691527;
	bh=KSzy2YOEwSlKk6WQexZFzyViZGX54PHJ6DXnY3L5XXs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dh6VcxXaSufEaEDWH2psuVIWRZvpKD4PEeNm0Rwaj3AAa9QoAHnshKcwBRy9v0DGu
	 ct011VXq8ZZ3IDiaAwZReNWndrFD53lzvLJuun7jBk1VnXhHvMiVLd/ysIBf0ZvahH
	 BeS7XcQ7sbE34oyg5iUXM8KFx1JZD5Mmv2yKLdSwy2idOUbRjFU7PtaFGOq3wlMo3/
	 t8IrSihQ+SHuHPRO6BsVOFuydyvkowe63KUrEeGtaS1GoKa5cYZrmB5ceFC7hfIFER
	 4R+rOsdr07747RQgalxN3PeWKWXFwDpnxdy2+cMbXrL4bT8Jev7BZxgvJnRaxXaqKS
	 0Sz3dinr1u16g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B9C640CC4;
	Fri, 10 Jul 2026 13:52:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78955A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DCA5606F2
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZOopfbNDXKt for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E6D1606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6D1606B4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E6D1606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso8930165e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691523; x=1784296323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ep4EOWoujPtD4r8kGFz3IC1Ml1LDzXfL0Ay3F26mURc=;
 b=bsbjv7ipQj6NH/sPUX4OPXS6/9qeh61mAqmL63lKDAsTIfO9570wHAHwTt+26wUzkq
 LphUGNTnMwi2QYK1jpFAV+Xn5C/xIYQhAqfA9O6V1t5JSeR5by9TY2g/nuEgNsasBFf7
 l7P0QwJP76B0PllufB7JsOBJkFkHuSK+WOzW6fT2XF7+793IdlGwe1j2cnDfC93AhlAe
 NsKCQgFGNrzqpnS9KpiR1hd+Zb0U4HH0lfJL7IwptBTYSU/V20cVgL59FHr7+A6GUT7y
 n3MO3zBo2BVPGGK1OH8hqDdCB5xNjFhVpL0NuF3QH+iGN4iWLA4Ssq8CJ3NhL1vWXf6O
 85uw==
X-Gm-Message-State: AOJu0YxCrka5esWBzQbvNSYQbj8Mz2CBbt4r1FFM9k/QhXFoTuPvHCTG
 7wOpOkXhr5tyMaEGqoLiD9r/yyaDx3Tf+mIh+Rk4ELsjlYiJv0JHBK1KiqWyFRjUrzo=
X-Gm-Gg: AfdE7cnhQRHqryJ7I/ArGPXhpAtWVrDdelf11NJofMHxmtLsnGImRqHZOZ3AMgxMBbj
 6a+7vK9NUBpcWMe05T4sGvFiUEk4PtRYXRlPgBa6F0G7Wz4nxYuEngDuTBUA2zbLxWbQBuPzEwC
 pH/7J0rDkq7fftHei6YwbXd2yPrlO/qehPVoXp6AlvSmX2bQfYbzHnW8WFHxN1p/XeNXQVSpYB4
 mbmQcQ4zodEtA8n0Q4FMunZZ78HyxcziWLNzvmRUUmWEUYjZjOO6VCm6kSU7o/MoiMJkUyGlg49
 eMdU9TY22MSccdNzzti/Q9gO1Wq3YQKEqhxR80NWV8f+uJutolS86Za5Zh7SdrJvyZUW9zTsv6T
 zZtwAByXFGc6Zg1JMz+zOcnsrRLilQ3EN0P3i1OHTV9Ys+D9qHpllMALi92j1LMVCeo5znrG+Ef
 /kt5m/sw==
X-Received: by 2002:a05:600c:4514:b0:493:c8c6:4989 with SMTP id
 5b1f17b1804b1-493e6898afemr114181535e9.6.1783691523213; 
 Fri, 10 Jul 2026 06:52:03 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df6d9sm155165805e9.7.2026.07.10.06.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:02 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:02 +0200
Message-ID: <20260710135202.760062-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260630194200.250234-1-thomas.perale@mind.be>
References: <20260630194200.250234-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691523; x=1784296323; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ep4EOWoujPtD4r8kGFz3IC1Ml1LDzXfL0Ay3F26mURc=;
 b=TofHj34KR7QBK66CVG0jE7prFWS/AoPD4kZiFec4z1mEintz5raYlf13PPHe6rjZLU
 kXbU5KVYI7RPGDTobLGBD7iHeyLDrSwpHpnEGn1J59oq9NlHhlYxgjZLxgQeQauT/dj0
 D2B1w0+uqpg/ZgpEpYP2hzzqi9cKxTO6BvWWQbLoLfA1cjJznzZPGFezd4+FownSPS0K
 VuYzAcmBiDTmZC5yFzUhM/40g+J0OqZIroXHhUtZPQcB5Wn9KmKLSa35V+w/H3lDvKLV
 RDAL4r1R4l0c1dKdmr/8L73GotMys2b7rGhK3XxqDKGZjMqNtLSBKodRBMQCI2Odr88J
 DO4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TofHj34K
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libssh2: add upstream patch
 for CVE-2026-55199
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
> Fixes the following vulnerability:
> 
> - CVE-2026-55199:
>     libssh2 through 1.11.1, fixed in commit 1762685, contains a pre-
>     authentication denial of service vulnerability in the SSH_MSG_EXT_INFO
>     handler in src/packet.c that allows a malicious SSH server to cause a
>     client CPU exhaustion loop by sending a crafted extension count value.
>     A malicious server can set nr_extensions to 0xFFFFFFFF during key
>     exchange, causing the client to spin in a tight CPU loop for over 60
>     seconds because return values from _libssh2_get_string() are unchecked
>     and the session timeout does not apply to CPU-bound loops.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-55199
>   - https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  ...et-string-return-in-EXT-INFO-handler.patch | 43 +++++++++++++++++++
>  package/libssh2/libssh2.mk                    |  3 ++
>  2 files changed, 46 insertions(+)
>  create mode 100644 package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
> 
> diff --git a/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch b/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
> new file mode 100644
> index 0000000000..c7319a6b51
> --- /dev/null
> +++ b/package/libssh2/0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
> @@ -0,0 +1,43 @@
> +From 17626857d20b3c9a1addfa45979dadcee1cd84a4 Mon Sep 17 00:00:00 2001
> +From: TristanInSec <tristan.mtn@gmail.com>
> +Date: Wed, 15 Apr 2026 14:51:08 -0400
> +Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_INFO`
> + handler
> +
> +The `SSH_MSG_EXT_INFO` handler discards the return values from
> +`_libssh2_get_string()` when parsing extension name/value pairs. When
> +the buffer is exhausted before all claimed extensions are parsed,
> +the loop continues with no-op iterations until `nr_extensions` reaches
> +zero.
> +
> +The `nr_extensions >= 1024` cap limits the worst case, but the loop
> +should still break on parse failure for correctness and consistency
> +with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
> +`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
> +
> +Closes #1864
> +
> +CVE: CVE-2026-55199
> +Upstream: https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979dadcee1cd84a4
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/packet.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/packet.c b/src/packet.c
> +index ae86365d2a..8a7a0d2690 100644
> +--- a/src/packet.c
> ++++ b/src/packet.c
> +@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> + 
> +                     nr_extensions -= 1;
> + 
> +-                    _libssh2_get_string(&buf, &name, &name_len);
> +-                    _libssh2_get_string(&buf, &value, &value_len);
> ++                    if(_libssh2_get_string(&buf, &name, &name_len))
> ++                        break;
> ++                    if(_libssh2_get_string(&buf, &value, &value_len))
> ++                        break;
> + 
> +                     if(name && value) {
> +                         _libssh2_debug((session,
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 1843d25051..c85129a7cd 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -16,6 +16,9 @@ LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
>  # 0001-username-len-bound-checking.patch
>  LIBSSH2_IGNORE_CVES += CVE-2026-7598
>  
> +# 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
> +LIBSSH2_IGNORE_CVES += CVE-2026-55199
> +
>  ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
>  LIBSSH2_DEPENDENCIES += mbedtls
>  LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
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
