Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566C0C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F47F60DE6;
	Fri, 25 Sep 2026 14:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVASPcrnXLs9; Fri, 25 Sep 2026 14:46:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 30D3360DE7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347610;
	b=Q8ZLMqsLYB0k3Eku/uI2k0Vqv8yYNlryGr4tr8nfG8zjnxciyGiB5qps+7GYHaNj5Vln
	 F9AK6uYU8s2BgUehbAZaoLs5mGT7O843BeiGWtMXJXZ+b4EdGJqHNh5ETRBTYaf/pex8M
	 fl4OeIKoSg+WcKgjKVdZ52yHu/EnHsjWWp7ok5EF6a/yFDSs85bN3Pm9Ci14cU0gLWFwR
	 aSWC8adiaB444J1KR/bJD/hGZC99Y1G6X4FozjNRzOS9byrdyAF3jOFYBNima6IwKqwY5
	 QE5RQDS3wurbu1uB0bDEUwgButHnruIPjVZwbu9nXEWXn/OJHLYMaH2encHyod5Z5ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vRQpcBPEropfYswpSjzkcIafgLCeRw1jfLZE2Nu19jc=;
	b=GfpWw/OiwCZAPDG0NX02m7QkLqeWRgm/JEzgnz/kReJtrXsNFTmtUPqAyhF3rPtylREv
	 9UeSTJZgaGYA9OwpuelJHhrQDwA/JcHIlSikU3CPA+2OCyL6XVkk/YFdifIzjAu5t3SZv
	 bEL8HnVIs3zUvKJsfGE6PJV8cypnljekgWabj+AxWjUGzaSo+JsfnJHzMcObF7EMkRG9B
	 kVG7oQHvopwZwxXn5UsPYoeUNSIezCBqZfCvyBWWGTPpP2M9ZGEBgPRJiMXsAIOrM5OHX
	 Eh0z8kBS0CjJxF3LgB2P5EyfEmnTMH5vCIPggSDlSlGEZ5D7I0e848aDfG/8AgLVUvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347610;
	bh=vRQpcBPEropfYswpSjzkcIafgLCeRw1jfLZE2Nu19jc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DMLyo5hKDrbv3PoMv1GFVJK6HBfKKayZq/DzRu1YH0TBWPrNfNqlZ2qzW+hh+HPsV
	 y8HofGPcjyREkVaxAxwF4gMGwdBOLmdqliPyF/inb7yeEDs+/HVt5m04L/L7QkGQOS
	 IxGM8b9cff0t+ZgJvQVxYkkxmI7n6axAa2T3KCtDyDQruS9JNlLsxBRQHyvNIUqFXS
	 1MUMKpjWemVyBydHXUF9asWiKXBPxbpPFIwRjNlSpwl0DPZw5nFEJ3ZucUXDxhU6xR
	 RXXrvJRXC9evpnFCMy7LXnZC3E61m5kj/Gqhbwxc7DxDzATdxr9gflcs4qw59VnY44
	 R3vpDpUJHo7ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D3360DE7;
	Fri, 25 Sep 2026 14:46:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 330E7334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 249F140181
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1V3ElQKfUfR for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0EE0E4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347606;
 b=rOrDFdg+G1NTKa5sGvD+LAAElPB3QCvYIVoaOTG7JaGuAoVCCm2ar3TZDqaqtp6mEBWD
 Ug28Oczdjg8VTZN8ocXtpdYzlDtM0DDIRsDD+hjaho2mBBERXzVnzAdgDlOA44MgPgk6G
 FhGuFKVE8T1cjKwm3+pFn5ofuIpkM6Bqit59CUhn61PFg21K6tR7mMczeq5QuQ/0/MGXj
 f6jrfgp1mrzcfoO81Nt6UBeke1mXZHmlDQA4yEG+loq/UnFt2IdJDty/xmpCNHNiMcH/W
 EGdYISG3XlmtIYMAvNS20w1JYefbKEN1VHUx+fNTMID6tGjLcAXkbd7bGQ4YqHwz8Ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347606;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=TYDhjlPES6o/f4q1IPFFmnhi2k0S1c/46vYKYj1eGpA=;
 b=gMUOXR1TuaUfwFMMOHt0pcJL29OxkEDLT9l2+7R7lULcBZ9roiVoZKw0XEsyYuRqjB4v
 DQYYKh12zPLkt8RKcwzKvmhFjtckTXoX1KQkwP8pbpSS2TpXEDrsdGnmsILrxfbSEKEO5
 F8GuacLTEshCQBJj1/cCyTaPwxkKuN/pk2N70/gHaWZcBeDf1CsrXv/RCH3rDeMfoYuSz
 vEQLbHRNHTg8FTFqzjZ9G9mToug05Rr98MhXiVCMoTMqqWJaKaY2ZblmcZv4MqcKehT5r
 pZLO1MZCqpvGUzDGm/+G/TG+N9kN7OnT2/YcrmKA2ctspoKIHE5EkUn/oq0vXUzfCDQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZS4U70MR; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EE0E4016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:46 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so7590145e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347604; x=1790952404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TYDhjlPES6o/f4q1IPFFmnhi2k0S1c/46vYKYj1eGpA=;
 b=f/ZkKkLfquQBKfn3AgvVX7rpHc5iyNfDAmwyvKy0o0ybuOU3nEQsbtMZilUZAO0fI+
 8cp0E8EP1pznBBFes9Nqk3KFIiFU85ulhX1sgKwvzWieojgRGXYkOaScRN+8i0SRL5Hc
 bdJ3bd+TTs5A6qsPXXsmlq1AyquhTf+iY+eHwtCHM/MO/DYc7qo0JX881MVZzByyu8DU
 t19C7a/XYHNI/Z7X+FJCSB3UIw3K9/x1j5/0bJOs8JTG0nwQfFb6BXEHXN1nYdwk+wgW
 ceJY2QoDL7a+oEe8cV02/4cBNjYoF6T1DAqVmfsJPXY78m/2ycbjHkXbTuRCmWfd8Piq
 RbhA==
X-Gm-Message-State: AFuF++lYh8QIJIkx5nFvBVERigBOipVDfzJlhWN5Tc7cVqiUgkaRWyhe
 TE3Iz5fSWeh+rMzQ8kavZTJozgqIeas+u8gtk5SLVSK50Wp+ySdq5T1Y86AGtKgo7SFwbF69LEH
 QQ6I+AWziyQ==
X-Gm-Gg: AYBFou1otfwiOU02HLYul8j1bgoMC0nKBEr7yHqy7cXrlXFm0PFLbgnUTWs2rngdc1A
 rF+SU6t514Fse0nnIWZE5OPfNn1oUOC8W5+YWwUkiOqHsyrmuGKlh1xBhJVl47JaSw9BZ985gTB
 4P91REAddXHw8mLIe/tzTIQS3ATujqQWov8EXPXd50lwrYxb0YeekM8sdI8dux6RwcQ0/hi9Vrj
 lxTM19dUwkzyUkPGHzr/6QU/p0u1YXoQq1W+pnIe2xfH9txbHmb3S9x/fQ9v4MU24KOvUYna4aU
 5vXtT3ZbyZUM9AWpNjO3Kyd+a2sgBrxBBYCvmims2BtWQwKVwWblkSzKdhfQ1QBRclEm7ggM/gZ
 POEdgYTpHn7y+futT2ATH0wyc+aAwmI3YGwrG8Qk32DRK+ItYaSjfFjIuPeop6T015vRJ4Szqq3
 YF2dtaxzX8RomhTE1TOsCpg3rdoE2o0cY+EJupHLTWCyGMORPAE2jrIUqbN5KOFWlkMJfj7Bi5/
 XnZ2FCVy6XneZyJgxsdHw4tcis=
X-Received: by 2002:a05:600c:37c6:b0:49e:81db:4926 with SMTP id
 5b1f17b1804b1-49fe66ca0d1mr105193695e9.5.1790347604116; 
 Fri, 25 Sep 2026 07:46:44 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4c8dsm174908795e9.3.2026.09.25.07.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:43 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:41 +0200
Message-ID: <20260925144643.4099911-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917113720.1297345-2-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libabseil-cpp: disable for
 the MIPS n32 ABI
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> absl::base_internal::DirectMmap() only implements mmap() via mmap2 for
> the o32 ABI on MIPS:
> 
>     #if ... (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) || ...
> 
> With the n32 ABI, the "remaining 64-bit architectures" fallback is
> selected instead, which fails to build because long is 32-bit there:
> 
>     absl/base/internal/direct_mmap.h: In function 'void* absl::lts_20260107::base_internal::DirectMmap(void*, size_t, int, int, int, off_t)':
>     absl/base/internal/direct_mmap.h:130:39: error: static assertion failed: Platform is not 64-bit
>       130 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
>           |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
>     absl/base/internal/direct_mmap.h:130:39: note: the comparison reduces to '(4 == 8)'
> 
> direct_mmap.h is included by absl/base/internal/low_level_alloc.cc and
> absl/base/internal/poison.cc, which are always built, so the failure is
> unconditional. Upstream abseil has no support for the n32 ABI, so
> disable the package for that ABI.
> 
> Since n32 is the default ABI for BR2_mips64/BR2_mips64el, this affects
> every mips64 build that does not explicitly select n64. The o32
> (BR2_MIPS_OABI32) and n64 (BR2_MIPS_NABI64) ABIs are unaffected, and all
> in-tree mips64 defconfigs use n64.
> 
> For the LTS maintainers: the ABI list in direct_mmap.h is identical in
> abseil 20200225 (the version in tree when the arch dependencies were
> introduced) and in the current 20260817.0, so the failure has existed
> ever since mips64 was allowed. It is still reproduced on all maintained
> branches, e.g.:
> 
>     2026.02.x https://autobuild.buildroot.net/results/5818407a73cfd3371cd1f726a24df6ceb9afa42d/
>     2025.02.x https://autobuild.buildroot.net/results/5065bda3b91bdbee53559dd97af8ab5a63a1e112/
> 
> so a backport is needed there.
> 
> Fixes: ae0557403a3a4cbf5354f0ab1784a08623382e5e ("package/libabseil-cpp: add BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS")
> Fixes:
> https://autobuild.buildroot.net/results/f375584f3721d61238b9e43d9926e037802f6141/
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/libabseil-cpp/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
> index d13bf6e663..feb4963042 100644
> --- a/package/libabseil-cpp/Config.in
> +++ b/package/libabseil-cpp/Config.in
> @@ -14,6 +14,10 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	default y if BR2_sparc || BR2_sparc64
>  	default y if BR2_x86_64
>  	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
> +	# absl/base/internal/direct_mmap.h only implements DirectMmap()
> +	# with mmap2 for the o32 ABI on MIPS, and its 64-bit fallback
> +	# fails to build with the n32 ABI, where long is 32-bit
> +	depends on !BR2_MIPS_NABI32
>  
>  config BR2_PACKAGE_LIBABSEIL_CPP
>  	bool "libabseil-cpp"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
