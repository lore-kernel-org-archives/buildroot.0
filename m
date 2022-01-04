Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58178C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C49740118;
	Tue,  4 Jan 2022 16:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fOMtR9HP4Bd; Tue,  4 Jan 2022 16:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E02C040447;
	Tue,  4 Jan 2022 16:52:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2561BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DF89408D0
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFNnPRZpTmQf for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:52:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 708F2408CE
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:52:29 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z29so150815649edl.7
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 08:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RXJuRiAJFvlevm7fiTpXF3OjvmGTEsS8SUkXPJlfuTw=;
 b=BZIQY8hzIyGdmN4RWz49QdZvKw+q400rZ80+ulLjLGAo3wRPpII3B0VdWxgRYSpMzU
 OW/sw/KEpBV++f7kHwjtH7yuoYjYmMgvBUGWuzJCrtBougNXU9BPPmoQgltGKl5FdIuW
 QNnncaU/DigSfQJlN0izwhLpAUH19V15CYtRJDJM9khQUvX0jMt6aqVJQ1jc2aiSAwz9
 YBu3C3tDAOcr0x+NsoJPK2vQt9EVoIOxBDg8RP6PfrUnxXnnr/LT1lQn/Em0Lz0xK7Ve
 GgB7FJ4TNTg6TTmfc45jSVS1I3RRgkhzOjJz8B4on7886Mr2J3XOqL8OwbSIEM4B8nEf
 z9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RXJuRiAJFvlevm7fiTpXF3OjvmGTEsS8SUkXPJlfuTw=;
 b=zLVp+3th5gRLum+qjhbG6dCn5l392ZBweaS4uxbgLRqN+GWNWFsa0uMdu8ZHuELfRn
 +ECuQmGcjEoFFVadEzqnsSuYrkeOIf8xYr17nxh6Z1QTbHQDCTm+hUPjutvuuiWntpnx
 wsWQuVwKKHWM0HtzZYuQZnGBS8W51zESLAFMMW+7X2Y74xARh/NZKnifuTspmvjbWsgI
 DtSB9GzcbAc7TC9BQxRq99oe0c9Id7T50yHj1muQBBP84lKcYpvEP54Blk+Tt0lOFJsQ
 9Whzi0W2rdvj2zGpdH8jVMLGVGtsqeEkhQ+JTmmTePEPMYB+08XZgzvMtCLSVGHvFh/z
 MtyA==
X-Gm-Message-State: AOAM531MsCsXpVdRC+jtPAVlZKyfvugIWpAi46ase32919ULLldREBx4
 fWJi5k7agI6sCkIp2c4DOWzYnA==
X-Google-Smtp-Source: ABdhPJynrUDvW+kroYRPt56BgUrchid+1F43GToFE+1TNo+M047+YB0FGMDUg9r1vlev4ErY3oO+wA==
X-Received: by 2002:a05:6402:50cf:: with SMTP id
 h15mr48319486edb.318.1641315147719; 
 Tue, 04 Jan 2022 08:52:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qk6sm466991ejc.127.2022.01.04.08.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 08:52:27 -0800 (PST)
Message-ID: <9b3f060d-9671-e475-40f7-dbf46e5d480c@mind.be>
Date: Tue, 4 Jan 2022 17:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101151218.1620080-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101151218.1620080-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: fix build
 with gcc 9
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
Cc: Philipp Richter <richterphilipp.pops@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 16:12, Fabrice Fontaine wrote:
> Drop -std=c++11 to avoid the following build failure with gcc 9 raised
> since bump to version 1.2.15 in commit
> 2cecfe94f889165f3a5169598ed7e0388941a6cd and
> https://github.com/arvidn/libtorrent/commit/b7e02cc700d884f87a18a3bc59f95a66a5cb0209:
> 
> configure: error: *** A compiler with support for C++14 language features is required.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/905a51bee38e85a48aa170c15494f2798aa6afea
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> index 914e0cbca3..cde010a4f7 100644
> --- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> +++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> @@ -16,7 +16,7 @@ LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
>   LIBTORRENT_RASTERBAR_CONF_OPTS = \
>   	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
>   	--disable-invariant-checks
> -LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11

  If this was needed before, it sounds like we might now need -std=c++14 (for 
GCC versions that default to an earlier standard, i.e. anything below 6 I think).

  Have you tested with GCC 4.9?

  Regards,
  Arnout

> +LIBTORRENT_RASTERBAR_CXXFLAGS = $(TARGET_CXXFLAGS)
>   
>   # Internal error, aborting at dwarf2cfi.c:2802 in connect_traces
>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
