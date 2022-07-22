Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB5C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 17:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 004CF423B6;
	Fri, 22 Jul 2022 17:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 004CF423B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omW-1sQnVxVi; Fri, 22 Jul 2022 17:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EBDD423AF;
	Fri, 22 Jul 2022 17:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EBDD423AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7587E1BF316
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 17:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FABC84974
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 17:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FABC84974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZPa7v3t0JLC for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 17:24:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF75D84970
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF75D84970
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 17:24:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id n185so3179136wmn.4
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 10:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X9O2kPCXF0a/OxFaidVU6Dh6WqgL9XkP+WStcvBAjt0=;
 b=YXDpcuuGA6CnUcDCGpZoLYI3uNSrlhIlzi0uv6pA2lSu/oOGMpCR7ZeaVJx2MeA2Kw
 6QN0KGuccfHUUV3aefUM/1OydAFT91G7pZKYC7EHqajbikwGPqv739bq3PbnfVIHJAp8
 cExl8rP3+2brK+qkOP8iNkIek7WoNgh3iqt9Lc1OU5YcrhGEMOsBZi9cur8f3vRK5tzy
 yS5GXh/548ZzVSTjI1F5eomVkbm6g2wA+aQFS8da9jYNklVQElBX0ltkcFRsxHAmusFR
 UJxsQZEtmVsGbzdGrJbfUzG71E2CN2Zf2HlRSiDtFMgBe+ZW/X978Z+sER+SN0liZOnc
 CO7Q==
X-Gm-Message-State: AJIora+pEK2IcQEB+vA0NOeGuwp/gjOnYUPWzs+AFL1SbRd6zhmWMRGl
 no2DogBYLQwftuK1wMPuFA7i3w==
X-Google-Smtp-Source: AGRyM1uLuCmNef7ymEpXxf3GrGJr18BdK2YnqaoA2iWGsb4pe5nqWAbyhqYun9RJtsidO698bWzfkQ==
X-Received: by 2002:a05:600c:b5a:b0:3a3:186f:a564 with SMTP id
 k26-20020a05600c0b5a00b003a3186fa564mr13545170wmr.71.1658510651813; 
 Fri, 22 Jul 2022 10:24:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a056000170700b0021d221daccfsm4886377wrc.78.2022.07.22.10.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 10:24:11 -0700 (PDT)
Message-ID: <3c40fb50-739d-878c-5dfc-18a7ee8b5edd@mind.be>
Date: Fri, 22 Jul 2022 19:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220720171756.307458-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220720171756.307458-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X9O2kPCXF0a/OxFaidVU6Dh6WqgL9XkP+WStcvBAjt0=;
 b=XxoLv38wVf4iCx1aDcaeewzb/94fJe+VZwECgHiqedMjpggnsQEgLEY4Hm4pf/SmMt
 tOnqB4v07Agc4OueDmgHmypTRv/EWwxJErwdu9Dj8MlhAliP/xjj7m0yCDkbL9nwqQdB
 TySiEOKxeGXK9K/KnZFiisIB376Ojw2RfE12mGLAhQ6exHiIgvc8ArVeJjyb+mJnibvt
 XdQpvy0t8+U5ZbtuI9EkoLkI9P7cuiijMLIIepUj1V5A55NtdpkiexeTb7kwGXZ2/G4I
 JawZA7JChxFApRlnoG6JgIbjEokOhLm8vTV7/X018Dmken92yxCl9mEUmebHAr3A3x2B
 YGEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XxoLv38w
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build with gcc < 7
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/07/2022 19:17, Bernd Kuhls wrote:
> Fixes various build errors
> 
> In file included from ../src/hb-kern.hh:32:0,
>                   from ../src/hb-ot-shape-fallback.cc:32:
> ../src/hb-ot-layout-gpos-table.hh:50:117: error: specialization of 'template<class context_t> static typename context_t::return_t OT::Layout::GPOS_impl::PosLookup::dispatch_recurse_func(context_t*, unsigned int)' in different namespace [-fpermissive]
> 
> introduced by bumping harfbuzz to 4.4.1 in
> 03022329e02332c22f44e0e0a9b17d8454ba26ae
> 
> The build error was not yet caught by the autobuilders but can be
> reproduced using this defconfig:
> http://autobuild.buildroot.org/results/3fe7526b685368007ae0f66e15ef2b27d30d5063/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0004-GPOS-Fix-build-on-GCC-7.patch        | 97 +++++++++++++++++++
>   1 file changed, 97 insertions(+)
>   create mode 100644 package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
> 
> diff --git a/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch b/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
> new file mode 100644
> index 0000000000..ead6fc024f
> --- /dev/null
> +++ b/package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch
> @@ -0,0 +1,97 @@
> +From 3238cb744bb570a75326ab4438968c59069e9af2 Mon Sep 17 00:00:00 2001
> +From: Kleis Auke Wolthuizen <github@kleisauke.nl>
> +Date: Wed, 6 Jul 2022 13:18:14 +0200
> +Subject: [PATCH] [GPOS] Fix build on GCC < 7
> +
> +[Retrieved (and backported) from:
> +https://github.com/harfbuzz/harfbuzz/commit/3238cb744bb570a75326ab4438968c59069e9af2]
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + src/OT/Layout/GPOS/GPOS.hh     | 17 ++++++++++-------
> + src/hb-ot-layout-gpos-table.hh |  6 ++++--
> + 2 files changed, 14 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/OT/Layout/GPOS/GPOS.hh b/src/OT/Layout/GPOS/GPOS.hh
> +index 7fb97d7568..23b0b090a2 100644
> +--- a/src/OT/Layout/GPOS.hh
> ++++ b/src/OT/Layout/GPOS.hh
> +@@ -7,6 +7,9 @@
> + #include "GPOS/PosLookup.hh"
> +
> + namespace OT {
> ++
> ++using Layout::GPOS_impl::PosLookup;
> ++
> + namespace Layout {
> +
> + static void
> +@@ -25,10 +28,10 @@ struct GPOS : GSUBGPOS
> + {
> +   static constexpr hb_tag_t tableTag = HB_OT_TAG_GPOS;
> +
> +-  using Lookup = GPOS_impl::PosLookup;
> ++  using Lookup = PosLookup;
> +
> +-  const GPOS_impl::PosLookup& get_lookup (unsigned int i) const
> +-  { return static_cast<const GPOS_impl::PosLookup &> (GSUBGPOS::get_lookup (i)); }
> ++  const PosLookup& get_lookup (unsigned int i) const
> ++  { return static_cast<const PosLookup &> (GSUBGPOS::get_lookup (i)); }
> +
> +   static inline void position_start (hb_font_t *font, hb_buffer_t *buffer);
> +   static inline void position_finish_advances (hb_font_t *font, hb_buffer_t *buffer);
> +@@ -37,11 +40,11 @@ struct GPOS : GSUBGPOS
> +   bool subset (hb_subset_context_t *c) const
> +   {
> +     hb_subset_layout_context_t l (c, tableTag, c->plan->gpos_lookups, c->plan->gpos_langsys, c->plan->gpos_features);
> +-    return GSUBGPOS::subset<GPOS_impl::PosLookup> (&l);
> ++    return GSUBGPOS::subset<PosLookup> (&l);
> +   }
> +
> +   bool sanitize (hb_sanitize_context_t *c) const
> +-  { return GSUBGPOS::sanitize<GPOS_impl::PosLookup> (c); }
> ++  { return GSUBGPOS::sanitize<PosLookup> (c); }
> +
> +   HB_INTERNAL bool is_blocklisted (hb_blob_t *blob,
> +                                    hb_face_t *face) const;
> +@@ -51,7 +54,7 @@ struct GPOS : GSUBGPOS
> +     for (unsigned i = 0; i < GSUBGPOS::get_lookup_count (); i++)
> +     {
> +       if (!c->gpos_lookups->has (i)) continue;
> +-      const GPOS_impl::PosLookup &l = get_lookup (i);
> ++      const PosLookup &l = get_lookup (i);
> +       l.dispatch (c);
> +     }
> +   }
> +@@ -59,7 +62,7 @@ struct GPOS : GSUBGPOS
> +   void closure_lookups (hb_face_t      *face,
> +                         const hb_set_t *glyphs,
> +                         hb_set_t       *lookup_indexes /* IN/OUT */) const
> +-  { GSUBGPOS::closure_lookups<GPOS_impl::PosLookup> (face, glyphs, lookup_indexes); }
> ++  { GSUBGPOS::closure_lookups<PosLookup> (face, glyphs, lookup_indexes); }
> +
> +   typedef GSUBGPOS::accelerator_t<GPOS> accelerator_t;
> + };
> +diff --git a/src/hb-ot-layout-gpos-table.hh b/src/hb-ot-layout-gpos-table.hh
> +index f5059cfa83..8fe987fc50 100644
> +--- a/src/hb-ot-layout-gpos-table.hh
> ++++ b/src/hb-ot-layout-gpos-table.hh
> +@@ -32,8 +32,8 @@
> + #include "OT/Layout/GPOS.hh"
> +
> + namespace OT {
> +-
> +-using Layout::GPOS_impl::PosLookup;
> ++namespace Layout {
> ++namespace GPOS_impl {
> +
> + // TODO(garretrieger): Move into new layout directory.
> + /* Out-of-class implementation for methods recursing */
> +@@ -68,6 +68,8 @@ inline bool PosLookup::dispatch_recurse_func<hb_ot_apply_context_t> (hb_ot_apply
> + }
> + #endif
> +
> ++} /* namespace GPOS_impl */
> ++} /* namespace Layout */
> + } /* namespace OT */
> +
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
