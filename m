Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14696EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E6A84564;
	Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RrVy9cWhZgfg; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA2F846AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011426;
	bh=c921KyS+qhffBPJMOMFjayXPXGNjwl+4Zo6FKoX3a4E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rJ89nVR4P40SsRamF+J8fNzmomdLaSlyo59x6NEZPjB5YG8g48N8jMam3xMbq8oIG
	 mUdmEUfoo0PKwNL0JILjCCR3YC0wjnR9juNY/7kUjqoIZQAEDyJ6URkIfO6BFGlTlM
	 YTOF/ywIJdrJMDbsUYQPskuQOlRkIVfPSLPI4eFMW6JyUnNmh0xmLTq3KVICdFmz75
	 1pjSuhgnrYZuoyc0rHCP8UoKYLSKygc72YzvIb+1RxFAJYmojwV+higAd90mUPn04D
	 4ETfISrrJlkm7RychIN+f1/oebAUr0TVha1EUxGtK2SWOs8iYA60ZwhRTh0IS7tFn9
	 KzLglGbOwYuqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA2F846AB;
	Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36F9069
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A5D6412A7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rUrCQP16e1U for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59AD841280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59AD841280
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59AD841280
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso10656535e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011384; x=1771616184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uCtoShqj3Ggus1XCBDiBGwjIfSilRK14NoFQXoaleQU=;
 b=oaRnc7hsBSSL5Hs0DCXbsoze83RhfFCvIK1uj5ekpzi3zWllfwpHDCgqbokq7SpTLK
 BHJnVDqGxJIGrPKLVo6NB/PA6bUmL2Sk8rQWZKA2OSj++BzSQ99ycIjx+CvDS5tEsC5i
 HhBLI73iTXAtlHfP1IhRpV+rqwRZt+AflEqAf3dcYJ+i1y4gYXnbP8f8Vsf9aD2xB6/i
 nwKefq9E3+1iW8dc4NFXzWM+LiwkhcwvUfQ5mxYM+Y4PnhxOUqpCWNPh6t+/JlGpuKIz
 FBqrdQrk0zBWYx1iafSndnMZWCMApwoKGC8vykpC9iLv1UsaS300DNQmw1prFQPicyHU
 D6Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtHwG7TEm5WUmVcEsDr92gSBMnZ1lrY0GkYqsLgQjqe1zZ9vIBw7uBT8lAKT4P0ct0Oh5k+zeZY88=@buildroot.org
X-Gm-Message-State: AOJu0YwEMEEgaCw0dfr/GrlmCALqipqa9UmiXX9F0g49bi101sghnQ7m
 HtbCz2d/CIWOLhGOYcV5uMfU789WcMAzw7p6rNBgqgZrq1l0bcUQRo79q2/IF0YFIgnr1C8yuzU
 8xDse
X-Gm-Gg: AZuq6aKdyCB+v8c5tTfQuL+PkKbvEKF6Sxsf6zgK95ZKHSr/yZ5R4ZJptu0I2gh8SEo
 +hnpt5Fw8I8YaPK9tqs5bBv7Jeso+3H3z+QZqklUpVX/5VHyi5fepguTiw8ZnhBToEzFnymZLAI
 IqM2mXTxc9q6mtO5w4di8gM8VAsyqT5Pw0L6/T4ulCY1J6ykSQ7l9uPzxrYCfc731ajLD/4wxNG
 2Y3XiTcghUyCQqAlvaGanCNUS4lSuAszQxa5W6CYkjyWU7pQ33vnhLAc9KUatE4T7uzoX74mDN3
 At0HPoA2dmneos6FIjOjKu6OgWQQRKTFdQl8/XXxdHqGM9yzVjliMOGKNFRzxOJ9j0PfvEruROO
 2ByT9ZI0lf+efDGgGCgpAQ5/dzlkaDKITvUqlsV5RqUKfFzNGkQKKpt6oj/oElU4BGviyzGnv4W
 1+nnpEIxRWQNRazbM=
X-Received: by 2002:a05:600c:6095:b0:483:129e:b573 with SMTP id
 5b1f17b1804b1-48379bfe605mr6706135e9.18.1771011383757; 
 Fri, 13 Feb 2026 11:36:23 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836cd7af87sm119174135e9.1.2026.02.13.11.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:23 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:22 +0100
Message-ID: <20260213193623.37330-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251013210940.511743-1-bernd@kuhls.net>
References: <20251013210940.511743-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011384; x=1771616184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCtoShqj3Ggus1XCBDiBGwjIfSilRK14NoFQXoaleQU=;
 b=HQNNspC/TQp+WAvPM7B5zPUp6H61xw+iINYbmWPj45CxAHGirBsfiyxqAXSNS1PDNi
 glyldu4qeAewtuHRifIdnMLMJjJPHctEHcCSA3X+VDOUvF9i4B3vhCHkw7wM0i/5bLuA
 SL59yEmN4RaEeNOMqI26pBsgikIy3//npDkgr9OIzkwoLdX40og0R9Miz2GENgjlKnuy
 k2FfXPO9S8fE6DEh07ITnjVhmwz/yBIFKEsxjQpb+1KWp0AogrZsOoNQTf33l//z+ERY
 DMuZpXh1JuYKa3V+wqRvV+qkEkcgjNO6SmTKNjR+OJMQFg+B8gI5zbVLZyDJf3AQW1Sg
 jVJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HQNNspC/
Subject: Re: [Buildroot] [PATCH 1/3] package/xmlstarlet: Fix build with
 libxml2-2.14+
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  ...0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
> 
> diff --git a/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch b/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
> new file mode 100644
> index 0000000000..dd7472301e
> --- /dev/null
> +++ b/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
> @@ -0,0 +1,49 @@
> +From 6b3ca3549abb998947088bdf264d65a0a86684cd Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sun, 12 Oct 2025 18:38:54 +0200
> +Subject: [PATCH] xml_pyx: remove ATTRIBUTE_UNUSED
> +
> +This define was removed in libxml2 2.14.0:
> +https://gitlab.gnome.org/GNOME/libxml2/-/commit/208f27f9641a59863ce1f7d4992df77f7eb0ea9d
> +
> +Upstream: https://sourceforge.net/p/xmlstar/patches/23/
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/xml_pyx.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/xml_pyx.c b/src/xml_pyx.c
> +index ab295f1..8adc028 100644
> +--- a/src/xml_pyx.c
> ++++ b/src/xml_pyx.c
> +@@ -200,7 +200,7 @@ pyxExternalEntityReferenceHandler(void* userData,
> + }
> + 
> + static void
> +-pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
> ++pyxExternalSubsetHandler(void *ctx, const xmlChar *name,
> +                          const xmlChar *ExternalID, const xmlChar *SystemID)
> + {
> +     fprintf(stdout, "D %s PUBLIC", name); /* TODO: re-check */
> +@@ -215,7 +215,7 @@ pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
> + }
> + 
> + static void
> +-pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
> ++pyxCommentHandler(void *ctx, const xmlChar *value)
> + {
> +     fprintf(stdout,"C");
> +     SanitizeData(value, xmlStrlen(value));
> +@@ -223,7 +223,7 @@ pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
> + }
> + 
> + static void
> +-pyxCdataBlockHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value, int len)
> ++pyxCdataBlockHandler(void *ctx, const xmlChar *value, int len)
> + {
> +     fprintf(stdout,"[");
> +     SanitizeData(value, len);
> +-- 
> +2.47.3
> +
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
