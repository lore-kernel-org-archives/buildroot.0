Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5102CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 798BC41FDF;
	Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3JSQQkbL_gP; Fri,  5 Jun 2026 12:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C91C641FC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663846;
	bh=/s9umecQqG31aQ0pSbl6omZqA39h08WUrrF/Nu7HrcE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q02REtHltSpM56dJWMPGFlk+smmJw2oAOYgnB8D5oYcw5t40xs9yUvlSjDrwJHcKQ
	 PQMb4j2+hnswRvLAMUmIBln5xQgTJznZXq0EgbdblW8Re5wMU0fDt2rSyTxa8xQxH+
	 kAv/mNOsI7uOLR01XbzYTa7nxEi4Qil6v4MT8QNKtfKGnpFko9TmtZz2N6B5hY6h3A
	 dnLBuzb4yvqOyI9OvmMk5iB1/8IM7Z1UDsnoeCS9S/zBFxJ5/tQy4kv0b0W5hdGIQo
	 CQY+D+O1qieRQqP1m2Ey/2mj7D+phHA8hluH9zzwjomQZw/it4Ahr77fVVo8IoVQY5
	 Dh97FM/ESVmpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C91C641FC2;
	Fri,  5 Jun 2026 12:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37C3A388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D6E64037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-tqELG7k3-q for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 084C94037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 084C94037E
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 084C94037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so15808855e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663839; x=1781268639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QPGXnZem3HNkUi8SsEp/JHsSqx12sPZ08vTjWWEAKlo=;
 b=fPpJpD2jJlnnmiqTlXXgxqp0hiZAsFPFbNmE+cvICltFnIQLI1s6ijubQDyS6fxDt3
 S9/tXGz63DT5LyvPcg4Cyq56liK2K30M7qDrm5VhEUc2BCnLvdwlDAC1uQx0GfRBCCYo
 B3/YWHKOzSP+gJzsfqMMflozbmT01YbRJJtdK0oW7AaaZ9RRqdfAh1gOAZget3ys4/62
 WQbmwt8EJfSp6v3VT9YESBhUuX+WTEEWksarwSaLnRxV1GLGAhfFQgBcORCoHvqFZZWs
 hwneBuot7Q1hqVSdn1xJZSQEfVMSw6KVXE66NSdN7qMu1TB70K0tGuwuQW4SmfqkD+CH
 kOyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DxhcKeCHbTH+Lqdg5zDXsefTm6B4s60XMzJzdD6GxrGXsSqvlxq77yQiKUxs6USo5wgEADqqx2e0=@buildroot.org
X-Gm-Message-State: AOJu0YwoX02n7tEG4tgglbEJjC7owYODe690F/azvLcMgzs3wnalvneQ
 RdDgE8b0k8ItbTonSXMRzO29CvtiIESXjJQfRelZQGPCgJe5EHvQUOTKLK3OLgsfclw=
X-Gm-Gg: Acq92OFfL3Za8uWJj2yXsi/bnbP1fdiPe9+SHqQzWFv7sWxiGrU3QGyr2itwRLoDh2G
 byPOM+VtsVx39XyY1mKtIL7tkdhXwV6Aq8ZGzpMkBAWg0Baa+yi9GS4k/1iZp7I5200lk5sMfqM
 Vhz7i+EHSxy5L+qkSjfmuP6VTxESxTClNfrhTpLJ3TrkESh8gZd3yRNdCVWWFibv06vDHMvdH7c
 CeJJ/wKBUOSUVlthapI8Fk8CVLMLkdefighi+Zt4etdWvewPAy/+Qhh7++0hMubNu/+4bm1c4UA
 MbF0/HmhxMjVen+i3ShurvXT8GQgaMNUmJsZ1UCccvPsW54RVl8a1yphPlBLqXjOu8t8RIeVI1c
 LzxQ4+UlIC4AHWR3tTG9/0VtKzRXWwPEoNzu4sx4BE4JppkOnZPRakix/3oVKkzvAkBd2siwi47
 nCElO4sCNPEBxBTNaBVzc3MdTvjQ==
X-Received: by 2002:a05:600c:3b04:b0:490:af63:2cb1 with SMTP id
 5b1f17b1804b1-490c2cdd2bemr39225725e9.7.1780663839058; 
 Fri, 05 Jun 2026 05:50:39 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2cbb4cbsm35244925e9.0.2026.06.05.05.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:38 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:37 +0200
Message-ID: <20260605125037.273991-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524153436.919328-1-bernd@kuhls.net>
References: <20260524153436.919328-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663839; x=1781268639; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPGXnZem3HNkUi8SsEp/JHsSqx12sPZ08vTjWWEAKlo=;
 b=QnkcM8nyu1fCnfP5usPGrIkuLvE4ck1x5W+wokarnsL+0lZ0ePVrz4AsgIbNE4nYwZ
 fr2Mz4c7HdxuvKz1LQBGLH+WOxZFyrOZIanL8xCp1e2gAcr//vxBqSdyZYSvMLdT1a/f
 MOlClYIoR7ITTVODRQT7y/yshQSShJ3LEhoK1ImtGpibPTlPbmZlmZ87qAeUOLGL7cjg
 AbFsfs4jfmK1jA/x3DRtg6X1oq/zs1wXdVYwFrTmEuxpqeVfI29A15l0u+mUBVddL6EF
 DZlGkniH+M1dEfZ9diOTV/e82Hpu5ayb4MGet3fjzJYgjTM9Ea6FIyW7UN9AhGfEtyFR
 3WBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QnkcM8ny
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 disable qsv support
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
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/64ed6075b782578d57edd09b3463071d6e5a4342
> added support for the Intel Quick Sync Video Encoder with version 1.22.0
> that was added to buildroot with commit
> 895840edd2784492d9b7066330b43842b703343b.
> 
> On unsupported platform the build is broken:
> 
> In file included from ../sys/qsv/libmfx/api/vpl/mfxdispatcher.h:10,
>                  from ../sys/qsv/libmfx/dispatcher/vpl/mfx_dispatcher_vpl_log.h:24,
>                  from ../sys/qsv/libmfx/dispatcher/vpl/mfx_dispatcher_vpl_log.cpp:7:
> ../sys/qsv/libmfx/api/vpl/mfxdefs.h:75:6: error: #error Unknown packing
>    75 |     #error Unknown packing
> 
> caused by
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/1.24.13/subprojects/gst-plugins-bad/sys/qsv/libmfx/api/vpl/mfxdefs.h?ref_type=tags#L75
> 
> For now we disable qsv support to fix build errors on
> 
> arc: https://autobuild.buildroot.net/results/2d5/2d5666324db2fca7ab0419e28481829edca949b3/
> m68k: https://autobuild.buildroot.net/results/53b/53ba2e9d09c25fe85e96b6e1fc9adbfcf5a637b2/
> microblazeel: https://autobuild.buildroot.net/results/bc2/bc2b2324f385d2cafdae71ac19804f27f7a7414b/
> or1k: https://autobuild.buildroot.net/results/17e/17e3dac016a08da8db58d735d0f2d3acc259f81f/
> sparc: https://autobuild.buildroot.net/results/f07/f07995804faa0be38bbba462c52be86c6c69822b/
> 
> Fixes:
> https://autobuild.buildroot.net/results/bc2/bc2b2324f385d2cafdae71ac19804f27f7a7414b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index c6fb669e13..ac554749c9 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -39,6 +39,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
>  	-Davtp=disabled \
>  	-Dopensles=disabled \
>  	-Dmsdk=disabled \
> +	-Dqsv=disabled \
>  	-Dvoamrwbenc=disabled \
>  	-Dbs2b=disabled \
>  	-Dchromaprint=disabled \
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
