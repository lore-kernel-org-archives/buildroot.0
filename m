Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CCECD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2025B82784;
	Fri,  5 Jun 2026 12:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlPfPo778zcj; Fri,  5 Jun 2026 12:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A7D82771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663796;
	bh=OKg+4j2kavJyZpxDPIboM/kbr7j6wt/oaQkwgGu3kgU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BSUdVHDk5LaeRXqGISbwfD5dcDc9e+oVevNLVG9PrDVrbkv0+h0u4MMHcIzQQAB0W
	 opDkdeJV8ZTiFZZjAZLkNorV8My6hwOViRew+p+SRrhBB9dXTT676bzyni7RpSYmmY
	 Oo/i6Pa+nJRRSfQOZtCDWEqDaoefGFfKszAbsbRkATPQ2GbAFHP4LDh90+2KEovgqt
	 Z/BD4OIP3rlMNuQ47sF9dAr1TF0ChhKU8rN9hfILpDyVQ7UvN24ftKCKJGw8qb5qvu
	 2UkQPx9QGcaEA6mbgZxl0vDavMP39r17qY146iMMryzdR7+CmZeioKVOw/TQAEAiER
	 Z7DIhhXCqYOBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A7D82771;
	Fri,  5 Jun 2026 12:49:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2088AF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 880C382741
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-PGnpaZC_36 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D1E482733
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D1E482733
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D1E482733
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:51 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso15192735e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663789; x=1781268589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XLijVRsq/9JubAFzZ5GM4r3g6VpJhpXRygimAOavO68=;
 b=rGk8bUffHqmqHfbO/uj7e0aqN3ZxKqhz6t3tJ6WiifsWRoYmtt6SWAtDosbbcU3pqh
 5Mx+23aLzQk1gVcbuRUkafRz2hHRKMWyveUs/OH4TustaNBHn3WSmP5DjsTQogClZjr6
 8tJfPfuEf8OPgBHmqnU3ezIcd49b5bEDSugcSQvQX5t6M0n+To9XJObf4jHMILVSdUwQ
 Uw/io+HFd7NJqHIW97d4tSrMJHNksxfzddLkyBSwczkLRitSfcsVDyCCYpYBNnEvkYTG
 O+mX6L7f1wsu4SDdSrpqgwkoc4xdsw/7MKybT+LXtb4Dagim9ykYrOaYpxY49v2MVaY+
 n3Cw==
X-Gm-Message-State: AOJu0YzUfbLdOxGtt0x4lArT51Qvwzj//ou/v6XzPCTt4t5+3XTX9JZ8
 rRE2R9aI5HItx6DbBOKsk2yoUgf8oD87MUgpktKvec91qr0ywj2tT1V04sM+Ftc94XM7M8KWJmZ
 7+ViG
X-Gm-Gg: Acq92OG5PxmUy8SHoRMMsdvYfupzocXih58aE/cICzG+KScI42co3DxdR/pXr6h2irS
 057Uw50e4SFbdCLcPFf002nRRPNtOsDL+u2BK+c+8Mdo0fD4hQEJmvQLgz9jlE7zoSJa31FCRAU
 o4tStl7O9MOO55VjKuSwgpJ643li74GGQi/Mnb0M+WrM7Lnj3N7jSlylez/vnNlmSEw5OcUBxgC
 2FRGZXKi+I5FW66Jx7a8AYy6fcrql5MAv+9P5zkUI4uI1P7cqAqNZepPoCXiCQErKYRt+YuVyc9
 T6UV8moO02NbuNHsYeYw1cQmXspjwTlCgBB7tfCWJacgmx2nyHq6OcyB+0k3p7a4LlQ0nh+pxQu
 2Dpv2hjL/mTBhUezLsuH343aJToZeo4Mae6Sy8TkyYl3moosSn4W/5MEV2tEqHU5ecYG2YxIgVV
 rB9qdfxBgTf3HsHo7JZ8fdRMmQvQ==
X-Received: by 2002:a05:600c:4e43:b0:490:b9c3:6c69 with SMTP id
 5b1f17b1804b1-490c2622cf7mr53841515e9.30.1780663789257; 
 Fri, 05 Jun 2026 05:49:49 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c1149sm133645625e9.4.2026.06.05.05.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:48 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:48 +0200
Message-ID: <20260605124948.271891-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260204131841.282589-4-thomas.perale@mind.be>
References: <20260204131841.282589-4-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663789; x=1781268589; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLijVRsq/9JubAFzZ5GM4r3g6VpJhpXRygimAOavO68=;
 b=Kr3TalKl+B0fwzFxA90lbsG4aeDPyAU5QL32xOWC7AcAPy9G9hjN+wbNimQ2ztWVvX
 tXOQlHOZ9RGK+VdiJl0DvxpPurWuCqYwu9hTT883gMJmvcmJJuZLAPo77lwpJG8j4qpd
 ipFCwa/4zzEmT5hcm/WNZT1cawmoZS2WJn/r2cXeFnRD1ynv0tTIZsUwtvIfcbCTsUwM
 hQ5ocEjIM+Zd1OSbPux58M6a7WEtDc/NXgspkzm1PjbNyL83p25ayQZMUW3dBsW4ukdY
 dr+Bo7J+OUKKLfQ5kCuSNSf9HfcDz49tejjYgWXhuOMrY/kIa5z0s27eJU1Vw4ZAVfQ0
 j3Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kr3TalKl
Subject: Re: [Buildroot] [PATCH 4/4] package/libmad: add patch for
 CVE-2017-837{2, 3, 4}
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
> The commit [1] introduced fixes for the following CVEs:
> 
> - CVE-2017-8372: The mad_layer_III function in layer3.c in Underbit MAD
>   libmad 0.15.1b, if NDEBUG is omitted, allows remote attackers to cause
>   a denial of service (assertion failure and application exit) via a
>   crafted audio file.
> - CVE-2017-8373: The mad_layer_III function in layer3.c in Underbit MAD
>   libmad 0.15.1b allows remote attackers to cause a denial of service
>   (heap-based buffer overflow and application crash) or possibly have
>   unspecified other impact via a crafted audio file.
> - CVE-2017-8374: The mad_bit_skip function in bit.c in Underbit MAD
>   libmad 0.15.1b allows remote attackers to cause a denial of service
>   (heap-based buffer over-read and application crash) via a crafted
>   audio file.
> 
> In commit [2], the patches ended up not being applied anymore because
> the APPLY_PATCHES step was called before the patch content exists.
> 
> This commit import the fixes in Buildroot.
> 
> [1] 858df3643f package/libmad: switch to debian to fix CVEs
> [2] b21184a877 package/libmad: update the patches to be applied with fuzz 0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libmad/0004-md_size.patch      |  63 ++
>  package/libmad/0005-length-check.patch | 821 +++++++++++++++++++++++++
>  package/libmad/libmad.mk               |   6 +
>  3 files changed, 890 insertions(+)
>  create mode 100644 package/libmad/0004-md_size.patch
>  create mode 100644 package/libmad/0005-length-check.patch
> 
> diff --git a/package/libmad/0004-md_size.patch b/package/libmad/0004-md_size.patch
> new file mode 100644
> index 0000000000..b2b3b99df2
> --- /dev/null
> +++ b/package/libmad/0004-md_size.patch
> @@ -0,0 +1,63 @@
> +From: Kurt Roeckx <kurt@roeckx.be>
> +Date: Sun, 28 Jan 2018 15:44:08 +0100
> +Subject: Check the size of the main data
> +
> +The main data to decode a frame can come from the current frame and part of the
> +previous frame, the so called bit reservoir. si.main_data_begin is the part of
> +the previous frame we need for this frame. frame_space is the amount of main
> +data that can be in this frame, and next_md_begin is the part of this frame that
> +is going to be used for the next frame.
> +
> +The maximum amount of data from a previous frame that the format allows is 511
> +bytes. The maximum frame size for the defined bitrates is at MPEG 2.5 layer 2
> +at 320 kbit/s and 8 kHz sample rate which gives 72 * (320000 / 8000) + 1 = 2881.
> +So those defines are not large enough:
> + # define MAD_BUFFER_GUARD      8
> + # define MAD_BUFFER_MDLEN      (511 + 2048 + MAD_BUFFER_GUARD)
> +
> +There is also support for a "free" bitrate which allows you to create any frame
> +size, which can be larger than the buffer.
> +
> +Changing the defines is not an option since it's part of the ABI, so we check
> +that the main data fits in the bufer.
> +
> +The previous frame data is stored in *stream->main_data and contains
> +stream->md_len bytes. If stream->md_len is larger than the data we
> +need from the previous frame (si.main_data_begin) it still wouldn't fit
> +in the buffer, so just keep the data that we need.
> +
> +CVE: CVE-2017-8372
> +CVE: CVE-2017-8373
> +Upstream: http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.diff.gz
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +
> +Index: libmad-0.15.1b/layer3.c
> +===================================================================
> +--- libmad-0.15.1b.orig/layer3.c
> ++++ libmad-0.15.1b/layer3.c
> +@@ -2608,6 +2608,11 @@ int mad_layer_III(struct mad_stream *str
> +     next_md_begin = 0;
> +
> +   md_len = si.main_data_begin + frame_space - next_md_begin;
> ++  if (md_len + MAD_BUFFER_GUARD > MAD_BUFFER_MDLEN) {
> ++    stream->error = MAD_ERROR_LOSTSYNC;
> ++    stream->sync = 0;
> ++    return -1;
> ++  }
> +
> +   frame_used = 0;
> +
> +@@ -2625,8 +2630,11 @@ int mad_layer_III(struct mad_stream *str
> +       }
> +     }
> +     else {
> +-      mad_bit_init(&ptr,
> +-		   *stream->main_data + stream->md_len - si.main_data_begin);
> ++      memmove(stream->main_data,
> ++	*stream->main_data + stream->md_len - si.main_data_begin,
> ++	si.main_data_begin);
> ++      stream->md_len = si.main_data_begin;
> ++      mad_bit_init(&ptr, *stream->main_data);
> +
> +       if (md_len > si.main_data_begin) {
> + 	assert(stream->md_len + md_len -
> diff --git a/package/libmad/0005-length-check.patch b/package/libmad/0005-length-check.patch
> new file mode 100644
> index 0000000000..5c56849da7
> --- /dev/null
> +++ b/package/libmad/0005-length-check.patch
> @@ -0,0 +1,821 @@
> +From: Kurt Roeckx <kurt@roeckx.be>
> +Date: Sun, 28 Jan 2018 19:26:36 +0100
> +Subject: Check the size before reading with mad_bit_read
> +
> +There are various cases where it attemps to read past the end of the buffer
> +using mad_bit_read(). Most functions didn't even know the size of the buffer
> +they were reading from.
> +
> +CVE: CVE-2017-8374
> +Upstream: http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.diff.gz
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +
> +Index: libmad-0.15.1b/bit.c
> +===================================================================
> +--- libmad-0.15.1b.orig/bit.c
> ++++ libmad-0.15.1b/bit.c
> +@@ -138,6 +138,9 @@ unsigned long mad_bit_read(struct mad_bi
> + {
> +   register unsigned long value;
> + 
> ++  if (len == 0)
> ++    return 0;
> ++
> +   if (bitptr->left == CHAR_BIT)
> +     bitptr->cache = *bitptr->byte;
> + 
> +Index: libmad-0.15.1b/frame.c
> +===================================================================
> +--- libmad-0.15.1b.orig/frame.c
> ++++ libmad-0.15.1b/frame.c
> +@@ -120,11 +120,18 @@ static
> + int decode_header(struct mad_header *header, struct mad_stream *stream)
> + {
> +   unsigned int index;
> ++  struct mad_bitptr bufend_ptr;
> + 
> +   header->flags        = 0;
> +   header->private_bits = 0;
> + 
> ++  mad_bit_init(&bufend_ptr, stream->bufend);
> ++
> +   /* header() */
> ++  if (mad_bit_length(&stream->ptr, &bufend_ptr) < 32) {
> ++    stream->error = MAD_ERROR_BUFLEN;
> ++    return -1;
> ++  }
> + 
> +   /* syncword */
> +   mad_bit_skip(&stream->ptr, 11);
> +@@ -225,8 +232,13 @@ int decode_header(struct mad_header *hea
> +   /* error_check() */
> + 
> +   /* crc_check */
> +-  if (header->flags & MAD_FLAG_PROTECTION)
> ++  if (header->flags & MAD_FLAG_PROTECTION) {
> ++    if (mad_bit_length(&stream->ptr, &bufend_ptr) < 16) {
> ++      stream->error = MAD_ERROR_BUFLEN;
> ++      return -1;
> ++    }
> +     header->crc_target = mad_bit_read(&stream->ptr, 16);
> ++  }
> + 
> +   return 0;
> + }
> +@@ -338,7 +350,7 @@ int mad_header_decode(struct mad_header
> +       stream->error = MAD_ERROR_BUFLEN;
> +       goto fail;
> +     }
> +-    else if (!(ptr[0] == 0xff && (ptr[1] & 0xe0) == 0xe0)) {
> ++    else if ((end - ptr >= 2) && !(ptr[0] == 0xff && (ptr[1] & 0xe0) == 0xe0)) {
> +       /* mark point where frame sync word was expected */
> +       stream->this_frame = ptr;
> +       stream->next_frame = ptr + 1;
> +@@ -361,6 +373,8 @@ int mad_header_decode(struct mad_header
> +     ptr = mad_bit_nextbyte(&stream->ptr);
> +   }
> + 
> ++  stream->error = MAD_ERROR_NONE;
> ++
> +   /* begin processing */
> +   stream->this_frame = ptr;
> +   stream->next_frame = ptr + 1;  /* possibly bogus sync word */
> +@@ -413,7 +427,7 @@ int mad_header_decode(struct mad_header
> +     /* check that a valid frame header follows this frame */
> + 
> +     ptr = stream->next_frame;
> +-    if (!(ptr[0] == 0xff && (ptr[1] & 0xe0) == 0xe0)) {
> ++    if ((end - ptr >= 2) && !(ptr[0] == 0xff && (ptr[1] & 0xe0) == 0xe0)) {
> +       ptr = stream->next_frame = stream->this_frame + 1;
> +       goto sync;
> +     }
> +Index: libmad-0.15.1b/layer12.c
> +===================================================================
> +--- libmad-0.15.1b.orig/layer12.c
> ++++ libmad-0.15.1b/layer12.c
> +@@ -72,10 +72,18 @@ mad_fixed_t const linear_table[14] = {
> +  * DESCRIPTION:	decode one requantized Layer I sample from a bitstream
> +  */
> + static
> +-mad_fixed_t I_sample(struct mad_bitptr *ptr, unsigned int nb)
> ++mad_fixed_t I_sample(struct mad_bitptr *ptr, unsigned int nb, struct mad_stream *stream)
> + {
> +   mad_fixed_t sample;
> ++  struct mad_bitptr frameend_ptr;
> + 
> ++  mad_bit_init(&frameend_ptr, stream->next_frame);
> ++
> ++  if (mad_bit_length(ptr, &frameend_ptr) < nb) {
> ++    stream->error = MAD_ERROR_LOSTSYNC;
> ++    stream->sync = 0;
> ++    return 0;
> ++  }
> +   sample = mad_bit_read(ptr, nb);
> + 
> +   /* invert most significant bit, extend sign, then scale to fixed format */
> +@@ -106,6 +114,10 @@ int mad_layer_I(struct mad_stream *strea
> +   struct mad_header *header = &frame->header;
> +   unsigned int nch, bound, ch, s, sb, nb;
> +   unsigned char allocation[2][32], scalefactor[2][32];
> ++  struct mad_bitptr bufend_ptr, frameend_ptr;
> ++
> ++  mad_bit_init(&bufend_ptr, stream->bufend);
> ++  mad_bit_init(&frameend_ptr, stream->next_frame);
> + 
> +   nch = MAD_NCHANNELS(header);
> + 
> +@@ -118,6 +130,11 @@ int mad_layer_I(struct mad_stream *strea
> +   /* check CRC word */
> + 
> +   if (header->flags & MAD_FLAG_PROTECTION) {
> ++    if (mad_bit_length(&stream->ptr, &bufend_ptr)
> ++		< 4 * (bound * nch + (32 - bound))) {
> ++      stream->error = MAD_ERROR_BADCRC;
> ++      return -1;
> ++    }
> +     header->crc_check =
> +       mad_bit_crc(stream->ptr, 4 * (bound * nch + (32 - bound)),
> + 		  header->crc_check);
> +@@ -133,6 +150,11 @@ int mad_layer_I(struct mad_stream *strea
> + 
> +   for (sb = 0; sb < bound; ++sb) {
> +     for (ch = 0; ch < nch; ++ch) {
> ++      if (mad_bit_length(&stream->ptr, &frameend_ptr) < 4) {
> ++	stream->error = MAD_ERROR_LOSTSYNC;
> ++	stream->sync = 0;
> ++	return -1;
> ++      }
> +       nb = mad_bit_read(&stream->ptr, 4);
> + 
> +       if (nb == 15) {
> +@@ -145,6 +167,11 @@ int mad_layer_I(struct mad_stream *strea
> +   }
> + 
> +   for (sb = bound; sb < 32; ++sb) {
> ++    if (mad_bit_length(&stream->ptr, &frameend_ptr) < 4) {
> ++      stream->error = MAD_ERROR_LOSTSYNC;
> ++      stream->sync = 0;
> ++      return -1;
> ++    }
> +     nb = mad_bit_read(&stream->ptr, 4);
> + 
> +     if (nb == 15) {
> +@@ -161,6 +188,11 @@ int mad_layer_I(struct mad_stream *strea
> +   for (sb = 0; sb < 32; ++sb) {
> +     for (ch = 0; ch < nch; ++ch) {
> +       if (allocation[ch][sb]) {
> ++        if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
> ++	  stream->error = MAD_ERROR_LOSTSYNC;
> ++	  stream->sync = 0;
> ++	  return -1;
> ++	}
> + 	scalefactor[ch][sb] = mad_bit_read(&stream->ptr, 6);
> + 
> + # if defined(OPT_STRICT)
> +@@ -185,8 +217,10 @@ int mad_layer_I(struct mad_stream *strea
> +       for (ch = 0; ch < nch; ++ch) {
> + 	nb = allocation[ch][sb];
> + 	frame->sbsample[ch][s][sb] = nb ?
> +-	  mad_f_mul(I_sample(&stream->ptr, nb),
> ++	  mad_f_mul(I_sample(&stream->ptr, nb, stream),
> + 		    sf_table[scalefactor[ch][sb]]) : 0;
> ++	if (stream->error != 0)
> ++	  return -1;
> +       }
> +     }
> + 
> +@@ -194,7 +228,14 @@ int mad_layer_I(struct mad_stream *strea
> +       if ((nb = allocation[0][sb])) {
> + 	mad_fixed_t sample;
> + 
> +-	sample = I_sample(&stream->ptr, nb);
> ++	if (mad_bit_length(&stream->ptr, &frameend_ptr) < nb) {
> ++	  stream->error = MAD_ERROR_LOSTSYNC;
> ++	  stream->sync = 0;
> ++          return -1;
> ++	}
> ++	sample = I_sample(&stream->ptr, nb, stream);
> ++        if (stream->error != 0)
> ++	  return -1;
> + 
> + 	for (ch = 0; ch < nch; ++ch) {
> + 	  frame->sbsample[ch][s][sb] =
> +@@ -280,13 +321,21 @@ struct quantclass {
> + static
> + void II_samples(struct mad_bitptr *ptr,
> + 		struct quantclass const *quantclass,
> +-		mad_fixed_t output[3])
> ++		mad_fixed_t output[3], struct mad_stream *stream)
> + {
> +   unsigned int nb, s, sample[3];
> ++  struct mad_bitptr frameend_ptr;
> ++
> ++  mad_bit_init(&frameend_ptr, stream->next_frame);
> + 
> +   if ((nb = quantclass->group)) {
> +     unsigned int c, nlevels;
> + 
> ++    if (mad_bit_length(ptr, &frameend_ptr) < quantclass->bits) {
> ++      stream->error = MAD_ERROR_LOSTSYNC;
> ++      stream->sync = 0;
> ++      return;
> ++    }
> +     /* degrouping */
> +     c = mad_bit_read(ptr, quantclass->bits);
> +     nlevels = quantclass->nlevels;
> +@@ -299,8 +348,14 @@ void II_samples(struct mad_bitptr *ptr,
> +   else {
> +     nb = quantclass->bits;
> + 
> +-    for (s = 0; s < 3; ++s)
> ++    for (s = 0; s < 3; ++s) {
> ++      if (mad_bit_length(ptr, &frameend_ptr) < nb) {
> ++	stream->error = MAD_ERROR_LOSTSYNC;
> ++	stream->sync = 0;
> ++	return;
> ++      }
> +       sample[s] = mad_bit_read(ptr, nb);
> ++    }
> +   }
> + 
> +   for (s = 0; s < 3; ++s) {
> +@@ -336,6 +391,9 @@ int mad_layer_II(struct mad_stream *stre
> +   unsigned char const *offsets;
> +   unsigned char allocation[2][32], scfsi[2][32], scalefactor[2][32][3];
> +   mad_fixed_t samples[3];
> ++  struct mad_bitptr frameend_ptr;
> ++
> ++  mad_bit_init(&frameend_ptr, stream->next_frame);
> + 
> +   nch = MAD_NCHANNELS(header);
> + 
> +@@ -402,13 +460,24 @@ int mad_layer_II(struct mad_stream *stre
> +   for (sb = 0; sb < bound; ++sb) {
> +     nbal = bitalloc_table[offsets[sb]].nbal;
> + 
> +-    for (ch = 0; ch < nch; ++ch)
> ++    for (ch = 0; ch < nch; ++ch) {
> ++      if (mad_bit_length(&stream->ptr, &frameend_ptr) < nbal) {
> ++	stream->error = MAD_ERROR_LOSTSYNC;
> ++	stream->sync = 0;
> ++	return -1;
> ++      }
> +       allocation[ch][sb] = mad_bit_read(&stream->ptr, nbal);
> ++    }
> +   }
> + 
> +   for (sb = bound; sb < sblimit; ++sb) {
> +     nbal = bitalloc_table[offsets[sb]].nbal;
> + 
> ++    if (mad_bit_length(&stream->ptr, &frameend_ptr) < nbal) {
> ++      stream->error = MAD_ERROR_LOSTSYNC;
> ++      stream->sync = 0;
> ++      return -1;
> ++    }
> +     allocation[0][sb] =
> +     allocation[1][sb] = mad_bit_read(&stream->ptr, nbal);
> +   }
> +@@ -417,8 +486,14 @@ int mad_layer_II(struct mad_stream *stre
> + 
> +   for (sb = 0; sb < sblimit; ++sb) {
> +     for (ch = 0; ch < nch; ++ch) {
> +-      if (allocation[ch][sb])
> ++      if (allocation[ch][sb]) {
> ++	if (mad_bit_length(&stream->ptr, &frameend_ptr) < 2) {
> ++	  stream->error = MAD_ERROR_LOSTSYNC;
> ++	  stream->sync = 0;
> ++	  return -1;
> ++	}
> + 	scfsi[ch][sb] = mad_bit_read(&stream->ptr, 2);
> ++      }
> +     }
> +   }
> + 
> +@@ -441,6 +516,11 @@ int mad_layer_II(struct mad_stream *stre
> +   for (sb = 0; sb < sblimit; ++sb) {
> +     for (ch = 0; ch < nch; ++ch) {
> +       if (allocation[ch][sb]) {
> ++	if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
> ++	  stream->error = MAD_ERROR_LOSTSYNC;
> ++	  stream->sync = 0;
> ++	  return -1;
> ++	}
> + 	scalefactor[ch][sb][0] = mad_bit_read(&stream->ptr, 6);
> + 
> + 	switch (scfsi[ch][sb]) {
> +@@ -451,11 +531,21 @@ int mad_layer_II(struct mad_stream *stre
> + 	  break;
> + 
> + 	case 0:
> ++	  if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
> ++	    stream->error = MAD_ERROR_LOSTSYNC;
> ++	    stream->sync = 0;
> ++	    return -1;
> ++	  }
> + 	  scalefactor[ch][sb][1] = mad_bit_read(&stream->ptr, 6);
> + 	  /* fall through */
> + 
> + 	case 1:
> + 	case 3:
> ++	  if (mad_bit_length(&stream->ptr, &frameend_ptr) < 6) {
> ++	    stream->error = MAD_ERROR_LOSTSYNC;
> ++	    stream->sync = 0;
> ++	    return -1;
> ++	  }
> + 	  scalefactor[ch][sb][2] = mad_bit_read(&stream->ptr, 6);
> + 	}
> + 
> +@@ -487,7 +577,9 @@ int mad_layer_II(struct mad_stream *stre
> + 	if ((index = allocation[ch][sb])) {
> + 	  index = offset_table[bitalloc_table[offsets[sb]].offset][index - 1];
> + 
> +-	  II_samples(&stream->ptr, &qc_table[index], samples);
> ++	  II_samples(&stream->ptr, &qc_table[index], samples, stream);
> ++	  if (stream->error != 0)
> ++            return -1;
> + 
> + 	  for (s = 0; s < 3; ++s) {
> + 	    frame->sbsample[ch][3 * gr + s][sb] =
> +@@ -505,7 +597,9 @@ int mad_layer_II(struct mad_stream *stre
> +       if ((index = allocation[0][sb])) {
> + 	index = offset_table[bitalloc_table[offsets[sb]].offset][index - 1];
> + 
> +-	II_samples(&stream->ptr, &qc_table[index], samples);
> ++	II_samples(&stream->ptr, &qc_table[index], samples, stream);
> ++	if (stream->error != 0)
> ++          return -1;
> + 
> + 	for (ch = 0; ch < nch; ++ch) {
> + 	  for (s = 0; s < 3; ++s) {
> +Index: libmad-0.15.1b/layer3.c
> +===================================================================
> +--- libmad-0.15.1b.orig/layer3.c
> ++++ libmad-0.15.1b/layer3.c
> +@@ -598,7 +598,8 @@ enum mad_error III_sideinfo(struct mad_b
> + static
> + unsigned int III_scalefactors_lsf(struct mad_bitptr *ptr,
> + 				  struct channel *channel,
> +-				  struct channel *gr1ch, int mode_extension)
> ++				  struct channel *gr1ch, int mode_extension,
> ++				  unsigned int bits_left, unsigned int *part2_length)
> + {
> +   struct mad_bitptr start;
> +   unsigned int scalefac_compress, index, slen[4], part, n, i;
> +@@ -644,8 +645,12 @@ unsigned int III_scalefactors_lsf(struct
> + 
> +     n = 0;
> +     for (part = 0; part < 4; ++part) {
> +-      for (i = 0; i < nsfb[part]; ++i)
> ++      for (i = 0; i < nsfb[part]; ++i) {
> ++	if (bits_left < slen[part])
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[n++] = mad_bit_read(ptr, slen[part]);
> ++	bits_left -= slen[part];
> ++      }
> +     }
> + 
> +     while (n < 39)
> +@@ -690,7 +695,10 @@ unsigned int III_scalefactors_lsf(struct
> +       max = (1 << slen[part]) - 1;
> + 
> +       for (i = 0; i < nsfb[part]; ++i) {
> ++	if (bits_left < slen[part])
> ++	  return MAD_ERROR_BADSCFSI;
> + 	is_pos = mad_bit_read(ptr, slen[part]);
> ++	bits_left -= slen[part];
> + 
> + 	channel->scalefac[n] = is_pos;
> + 	gr1ch->scalefac[n++] = (is_pos == max);
> +@@ -703,7 +711,8 @@ unsigned int III_scalefactors_lsf(struct
> +     }
> +   }
> + 
> +-  return mad_bit_length(&start, ptr);
> ++  *part2_length = mad_bit_length(&start, ptr);
> ++  return MAD_ERROR_NONE;
> + }
> + 
> + /*
> +@@ -712,7 +721,8 @@ unsigned int III_scalefactors_lsf(struct
> +  */
> + static
> + unsigned int III_scalefactors(struct mad_bitptr *ptr, struct channel *channel,
> +-			      struct channel const *gr0ch, unsigned int scfsi)
> ++			      struct channel const *gr0ch, unsigned int scfsi,
> ++			      unsigned int bits_left, unsigned int *part2_length)
> + {
> +   struct mad_bitptr start;
> +   unsigned int slen1, slen2, sfbi;
> +@@ -728,12 +738,20 @@ unsigned int III_scalefactors(struct mad
> +     sfbi = 0;
> + 
> +     nsfb = (channel->flags & mixed_block_flag) ? 8 + 3 * 3 : 6 * 3;
> +-    while (nsfb--)
> ++    while (nsfb--) {
> ++      if (bits_left < slen1)
> ++	return MAD_ERROR_BADSCFSI;
> +       channel->scalefac[sfbi++] = mad_bit_read(ptr, slen1);
> ++      bits_left -= slen1;
> ++    }
> + 
> +     nsfb = 6 * 3;
> +-    while (nsfb--)
> ++    while (nsfb--) {
> ++      if (bits_left < slen2)
> ++	return MAD_ERROR_BADSCFSI;
> +       channel->scalefac[sfbi++] = mad_bit_read(ptr, slen2);
> ++      bits_left -= slen2;
> ++    }
> + 
> +     nsfb = 1 * 3;
> +     while (nsfb--)
> +@@ -745,8 +763,12 @@ unsigned int III_scalefactors(struct mad
> + 	channel->scalefac[sfbi] = gr0ch->scalefac[sfbi];
> +     }
> +     else {
> +-      for (sfbi = 0; sfbi < 6; ++sfbi)
> ++      for (sfbi = 0; sfbi < 6; ++sfbi) {
> ++	if (bits_left < slen1)
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[sfbi] = mad_bit_read(ptr, slen1);
> ++	bits_left -= slen1;
> ++      }
> +     }
> + 
> +     if (scfsi & 0x4) {
> +@@ -754,8 +776,12 @@ unsigned int III_scalefactors(struct mad
> + 	channel->scalefac[sfbi] = gr0ch->scalefac[sfbi];
> +     }
> +     else {
> +-      for (sfbi = 6; sfbi < 11; ++sfbi)
> ++      for (sfbi = 6; sfbi < 11; ++sfbi) {
> ++	if (bits_left < slen1)
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[sfbi] = mad_bit_read(ptr, slen1);
> ++	bits_left -= slen1;
> ++      }
> +     }
> + 
> +     if (scfsi & 0x2) {
> +@@ -763,8 +789,12 @@ unsigned int III_scalefactors(struct mad
> + 	channel->scalefac[sfbi] = gr0ch->scalefac[sfbi];
> +     }
> +     else {
> +-      for (sfbi = 11; sfbi < 16; ++sfbi)
> ++      for (sfbi = 11; sfbi < 16; ++sfbi) {
> ++	if (bits_left < slen2)
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[sfbi] = mad_bit_read(ptr, slen2);
> ++	bits_left -= slen2;
> ++      }
> +     }
> + 
> +     if (scfsi & 0x1) {
> +@@ -772,14 +802,19 @@ unsigned int III_scalefactors(struct mad
> + 	channel->scalefac[sfbi] = gr0ch->scalefac[sfbi];
> +     }
> +     else {
> +-      for (sfbi = 16; sfbi < 21; ++sfbi)
> ++      for (sfbi = 16; sfbi < 21; ++sfbi) {
> ++	if (bits_left < slen2)
> ++	  return MAD_ERROR_BADSCFSI;
> + 	channel->scalefac[sfbi] = mad_bit_read(ptr, slen2);
> ++	bits_left -= slen2;
> ++      }
> +     }
> + 
> +     channel->scalefac[21] = 0;
> +   }
> + 
> +-  return mad_bit_length(&start, ptr);
> ++  *part2_length = mad_bit_length(&start, ptr);
> ++  return MAD_ERROR_NONE;
> + }
> + 
> + /*
> +@@ -933,19 +968,17 @@ static
> + enum mad_error III_huffdecode(struct mad_bitptr *ptr, mad_fixed_t xr[576],
> + 			      struct channel *channel,
> + 			      unsigned char const *sfbwidth,
> +-			      unsigned int part2_length)
> ++			      signed int part3_length)
> + {
> +   signed int exponents[39], exp;
> +   signed int const *expptr;
> +   struct mad_bitptr peek;
> +-  signed int bits_left, cachesz;
> ++  signed int bits_left, cachesz, fakebits;
> +   register mad_fixed_t *xrptr;
> +   mad_fixed_t const *sfbound;
> +   register unsigned long bitcache;
> + 
> +-  bits_left = (signed) channel->part2_3_length - (signed) part2_length;
> +-  if (bits_left < 0)
> +-    return MAD_ERROR_BADPART3LEN;
> ++  bits_left = part3_length;
> + 
> +   III_exponents(channel, sfbwidth, exponents);
> + 
> +@@ -956,8 +989,12 @@ enum mad_error III_huffdecode(struct mad
> +   cachesz  = mad_bit_bitsleft(&peek);
> +   cachesz += ((32 - 1 - 24) + (24 - cachesz)) & ~7;
> + 
> ++  if (bits_left < cachesz) {
> ++    cachesz = bits_left;
> ++  }
> +   bitcache   = mad_bit_read(&peek, cachesz);
> +   bits_left -= cachesz;
> ++  fakebits = 0;
> + 
> +   xrptr = &xr[0];
> + 
> +@@ -986,7 +1023,7 @@ enum mad_error III_huffdecode(struct mad
> + 
> +     big_values = channel->big_values;
> + 
> +-    while (big_values-- && cachesz + bits_left > 0) {
> ++    while (big_values-- && cachesz + bits_left - fakebits > 0) {
> +       union huffpair const *pair;
> +       unsigned int clumpsz, value;
> +       register mad_fixed_t requantized;
> +@@ -1023,10 +1060,19 @@ enum mad_error III_huffdecode(struct mad
> + 	unsigned int bits;
> + 
> + 	bits       = ((32 - 1 - 21) + (21 - cachesz)) & ~7;
> ++	if (bits_left < bits) {
> ++	  bits = bits_left;
> ++	}
> + 	bitcache   = (bitcache << bits) | mad_bit_read(&peek, bits);
> + 	cachesz   += bits;
> + 	bits_left -= bits;
> +       }
> ++      if (cachesz < 21) {
> ++	unsigned int bits = 21 - cachesz;
> ++	bitcache <<= bits;
> ++	cachesz += bits;
> ++	fakebits += bits;
> ++      }
> + 
> +       /* hcod (0..19) */
> + 
> +@@ -1041,6 +1087,8 @@ enum mad_error III_huffdecode(struct mad
> +       }
> + 
> +       cachesz -= pair->value.hlen;
> ++      if (cachesz < fakebits)
> ++	return MAD_ERROR_BADHUFFDATA;
> + 
> +       if (linbits) {
> + 	/* x (0..14) */
> +@@ -1054,10 +1102,15 @@ enum mad_error III_huffdecode(struct mad
> + 
> + 	case 15:
> + 	  if (cachesz < linbits + 2) {
> +-	    bitcache   = (bitcache << 16) | mad_bit_read(&peek, 16);
> +-	    cachesz   += 16;
> +-	    bits_left -= 16;
> ++	    unsigned int bits = 16;
> ++	    if (bits_left < 16)
> ++	      bits = bits_left;
> ++	    bitcache   = (bitcache << bits) | mad_bit_read(&peek, bits);
> ++	    cachesz   += bits;
> ++	    bits_left -= bits;
> + 	  }
> ++	  if (cachesz - fakebits < linbits)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 
> + 	  value += MASK(bitcache, cachesz, linbits);
> + 	  cachesz -= linbits;
> +@@ -1074,6 +1127,8 @@ enum mad_error III_huffdecode(struct mad
> + 	  }
> + 
> + 	x_final:
> ++	  if (cachesz - fakebits < 1)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 	  xrptr[0] = MASK1BIT(bitcache, cachesz--) ?
> + 	    -requantized : requantized;
> + 	}
> +@@ -1089,10 +1144,15 @@ enum mad_error III_huffdecode(struct mad
> + 
> + 	case 15:
> + 	  if (cachesz < linbits + 1) {
> +-	    bitcache   = (bitcache << 16) | mad_bit_read(&peek, 16);
> +-	    cachesz   += 16;
> +-	    bits_left -= 16;
> ++	    unsigned int bits = 16;
> ++	    if (bits_left < 16)
> ++	      bits = bits_left;
> ++	    bitcache   = (bitcache << bits) | mad_bit_read(&peek, bits);
> ++	    cachesz   += bits;
> ++	    bits_left -= bits;
> + 	  }
> ++	  if (cachesz - fakebits < linbits)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 
> + 	  value += MASK(bitcache, cachesz, linbits);
> + 	  cachesz -= linbits;
> +@@ -1109,6 +1169,8 @@ enum mad_error III_huffdecode(struct mad
> + 	  }
> + 
> + 	y_final:
> ++	  if (cachesz - fakebits < 1)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 	  xrptr[1] = MASK1BIT(bitcache, cachesz--) ?
> + 	    -requantized : requantized;
> + 	}
> +@@ -1128,6 +1190,8 @@ enum mad_error III_huffdecode(struct mad
> + 	    requantized = reqcache[value] = III_requantize(value, exp);
> + 	  }
> + 
> ++	  if (cachesz - fakebits < 1)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 	  xrptr[0] = MASK1BIT(bitcache, cachesz--) ?
> + 	    -requantized : requantized;
> + 	}
> +@@ -1146,6 +1210,8 @@ enum mad_error III_huffdecode(struct mad
> + 	    requantized = reqcache[value] = III_requantize(value, exp);
> + 	  }
> + 
> ++	  if (cachesz - fakebits < 1)
> ++	    return MAD_ERROR_BADHUFFDATA;
> + 	  xrptr[1] = MASK1BIT(bitcache, cachesz--) ?
> + 	    -requantized : requantized;
> + 	}
> +@@ -1155,9 +1221,6 @@ enum mad_error III_huffdecode(struct mad
> +     }
> +   }
> + 
> +-  if (cachesz + bits_left < 0)
> +-    return MAD_ERROR_BADHUFFDATA;  /* big_values overrun */
> +-
> +   /* count1 */
> +   {
> +     union huffquad const *table;
> +@@ -1167,15 +1230,24 @@ enum mad_error III_huffdecode(struct mad
> + 
> +     requantized = III_requantize(1, exp);
> + 
> +-    while (cachesz + bits_left > 0 && xrptr <= &xr[572]) {
> ++    while (cachesz + bits_left - fakebits > 0 && xrptr <= &xr[572]) {
> +       union huffquad const *quad;
> + 
> +       /* hcod (1..6) */
> + 
> +       if (cachesz < 10) {
> +-	bitcache   = (bitcache << 16) | mad_bit_read(&peek, 16);
> +-	cachesz   += 16;
> +-	bits_left -= 16;
> ++	unsigned int bits = 16;
> ++	if (bits_left < 16)
> ++	  bits = bits_left;
> ++	bitcache   = (bitcache << bits) | mad_bit_read(&peek, bits);
> ++	cachesz   += bits;
> ++	bits_left -= bits;
> ++      }
> ++      if (cachesz < 10) {
> ++	unsigned int bits = 10 - cachesz;
> ++	bitcache <<= bits;
> ++	cachesz += bits;
> ++	fakebits += bits;
> +       }
> + 
> +       quad = &table[MASK(bitcache, cachesz, 4)];
> +@@ -1188,6 +1260,11 @@ enum mad_error III_huffdecode(struct mad
> + 		      MASK(bitcache, cachesz, quad->ptr.bits)];
> +       }
> + 
> ++      if (cachesz - fakebits < quad->value.hlen + quad->value.v
> ++        + quad->value.w + quad->value.x + quad->value.y)
> ++	/* We don't have enough bits to read one more entry, consider them
> ++	 * stuffing bits. */
> ++	break;
> +       cachesz -= quad->value.hlen;
> + 
> +       if (xrptr == sfbound) {
> +@@ -1236,22 +1313,8 @@ enum mad_error III_huffdecode(struct mad
> + 
> +       xrptr += 2;
> +     }
> +-
> +-    if (cachesz + bits_left < 0) {
> +-# if 0 && defined(DEBUG)
> +-      fprintf(stderr, "huffman count1 overrun (%d bits)\n",
> +-	      -(cachesz + bits_left));
> +-# endif
> +-
> +-      /* technically the bitstream is misformatted, but apparently
> +-	 some encoders are just a bit sloppy with stuffing bits */
> +-
> +-      xrptr -= 4;
> +-    }
> +   }
> + 
> +-  assert(-bits_left <= MAD_BUFFER_GUARD * CHAR_BIT);
> +-
> + # if 0 && defined(DEBUG)
> +   if (bits_left < 0)
> +     fprintf(stderr, "read %d bits too many\n", -bits_left);
> +@@ -2348,10 +2411,11 @@ void III_freqinver(mad_fixed_t sample[18
> +  */
> + static
> + enum mad_error III_decode(struct mad_bitptr *ptr, struct mad_frame *frame,
> +-			  struct sideinfo *si, unsigned int nch)
> ++			  struct sideinfo *si, unsigned int nch, unsigned int md_len)
> + {
> +   struct mad_header *header = &frame->header;
> +   unsigned int sfreqi, ngr, gr;
> ++  int bits_left = md_len * CHAR_BIT;
> + 
> +   {
> +     unsigned int sfreq;
> +@@ -2383,6 +2447,7 @@ enum mad_error III_decode(struct mad_bit
> +     for (ch = 0; ch < nch; ++ch) {
> +       struct channel *channel = &granule->ch[ch];
> +       unsigned int part2_length;
> ++      unsigned int part3_length;
> + 
> +       sfbwidth[ch] = sfbwidth_table[sfreqi].l;
> +       if (channel->block_type == 2) {
> +@@ -2391,18 +2456,30 @@ enum mad_error III_decode(struct mad_bit
> +       }
> + 
> +       if (header->flags & MAD_FLAG_LSF_EXT) {
> +-	part2_length = III_scalefactors_lsf(ptr, channel,
> ++	error = III_scalefactors_lsf(ptr, channel,
> + 					    ch == 0 ? 0 : &si->gr[1].ch[1],
> +-					    header->mode_extension);
> ++					    header->mode_extension, bits_left, &part2_length);
> +       }
> +       else {
> +-	part2_length = III_scalefactors(ptr, channel, &si->gr[0].ch[ch],
> +-					gr == 0 ? 0 : si->scfsi[ch]);
> ++	error = III_scalefactors(ptr, channel, &si->gr[0].ch[ch],
> ++					gr == 0 ? 0 : si->scfsi[ch], bits_left, &part2_length);
> +       }
> ++      if (error)
> ++        return error;
> ++
> ++      bits_left -= part2_length;
> + 
> +-      error = III_huffdecode(ptr, xr[ch], channel, sfbwidth[ch], part2_length);
> ++      if (part2_length > channel->part2_3_length)
> ++        return MAD_ERROR_BADPART3LEN;
> ++
> ++      part3_length = channel->part2_3_length - part2_length;
> ++      if (part3_length > bits_left)
> ++        return MAD_ERROR_BADPART3LEN;
> ++
> ++      error = III_huffdecode(ptr, xr[ch], channel, sfbwidth[ch], part3_length);
> +       if (error)
> + 	return error;
> ++      bits_left -= part3_length;
> +     }
> + 
> +     /* joint stereo processing */
> +@@ -2519,11 +2596,13 @@ int mad_layer_III(struct mad_stream *str
> +   unsigned int nch, priv_bitlen, next_md_begin = 0;
> +   unsigned int si_len, data_bitlen, md_len;
> +   unsigned int frame_space, frame_used, frame_free;
> +-  struct mad_bitptr ptr;
> ++  struct mad_bitptr ptr, bufend_ptr;
> +   struct sideinfo si;
> +   enum mad_error error;
> +   int result = 0;
> + 
> ++  mad_bit_init(&bufend_ptr, stream->bufend);
> ++
> +   /* allocate Layer III dynamic structures */
> + 
> +   if (stream->main_data == 0) {
> +@@ -2587,14 +2666,15 @@ int mad_layer_III(struct mad_stream *str
> +     unsigned long header;
> + 
> +     mad_bit_init(&peek, stream->next_frame);
> ++    if (mad_bit_length(&peek, &bufend_ptr) >= 57) {
> ++      header = mad_bit_read(&peek, 32);
> ++      if ((header & 0xffe60000L) /* syncword | layer */ == 0xffe20000L) {
> ++        if (!(header & 0x00010000L))  /* protection_bit */
> ++	  mad_bit_skip(&peek, 16);  /* crc_check */
> + 
> +-    header = mad_bit_read(&peek, 32);
> +-    if ((header & 0xffe60000L) /* syncword | layer */ == 0xffe20000L) {
> +-      if (!(header & 0x00010000L))  /* protection_bit */
> +-	mad_bit_skip(&peek, 16);  /* crc_check */
> +-
> +-      next_md_begin =
> +-	mad_bit_read(&peek, (header & 0x00080000L) /* ID */ ? 9 : 8);
> ++        next_md_begin =
> ++	  mad_bit_read(&peek, (header & 0x00080000L) /* ID */ ? 9 : 8);
> ++      }
> +     }
> + 
> +     mad_bit_finish(&peek);
> +@@ -2653,7 +2733,7 @@ int mad_layer_III(struct mad_stream *str
> +   /* decode main_data */
> + 
> +   if (result == 0) {
> +-    error = III_decode(&ptr, frame, &si, nch);
> ++    error = III_decode(&ptr, frame, &si, nch, md_len);
> +     if (error) {
> +       stream->error = error;
> +       result = -1;
> diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
> index 611f13eb67..d69adcc1d5 100644
> --- a/package/libmad/libmad.mk
> +++ b/package/libmad/libmad.mk
> @@ -12,6 +12,12 @@ LIBMAD_INSTALL_STAGING = YES
>  LIBMAD_LICENSE = GPL-2.0+
>  LIBMAD_LICENSE_FILES = COPYING
>  
> +# 0004-md_size.patch
> +LIBMAD_IGNORE_CVES += CVE-2017-8372 CVE-2017-8373
> +
> +# 0005-length-check.patch
> +LIBMAD_IGNORE_CVES += CVE-2017-8374
> +
>  # Force autoreconf to be able to use a more recent libtool script, that
>  # is able to properly behave in the face of a missing C++ compiler.
>  LIBMAD_AUTORECONF = YES
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
