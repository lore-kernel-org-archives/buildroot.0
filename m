Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C40EECAAD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 21:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C7AD405B1;
	Sat, 27 Aug 2022 21:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C7AD405B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2jHqing0D6v; Sat, 27 Aug 2022 21:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF58B4038E;
	Sat, 27 Aug 2022 21:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF58B4038E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01B7E1BF479
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0F374038E
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0F374038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZyDsrBxsNGr for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 21:12:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D8EF400CC
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D8EF400CC
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 21:12:57 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t5so5905572edc.11
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 14:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=vU2i1JSg33J1NUiZeCXfCE7BLQZKbnNBzXZKpetQS3g=;
 b=kf1vyupoUzPBYzKoLH/XFZR0FgmotpAHuK8g3GA3Rbs1X3HPI0ZIGr/SNkB/jYpFff
 fVtmlzyTS1nyrC9Y2/2JT+ojcVtwDJ2ppIx4s8VXal5NDZ0iZfwbAaDZTyDBnwF6/MMg
 c/nf1W4FA39ZTgBaxbBRtMF6dwt4MWNuM5xja/F2pV//b656u2aBaGVwrUyG7vEtTGrK
 RthzvYC4hQ8SuVXz0renYmz1ctD8t0/dweeMPkBmb0kQBJhiZPatlk3YRSIF87ww2Tpi
 fHwMjGgp9HKFfnyXNyO8VjMDooUuQPGFtgLXDFIOq4s1983/mk8pmL8HILXivwDGIOX6
 TDsw==
X-Gm-Message-State: ACgBeo3/3+uz48z6/2SxM0frgpoanPDBt91BVBgqXnw9CwIzxh62Xfiu
 +ulf0a+LE8DCoqihWgBpiTbjww==
X-Google-Smtp-Source: AA6agR56LKWpUcFnMHozyZFlsDzHprS2Fbbjc4aAudjPtYf+fdo11tKTIsWg20C8o3s6HzDpDglckg==
X-Received: by 2002:a05:6402:22d0:b0:447:9c9a:f6b9 with SMTP id
 dm16-20020a05640222d000b004479c9af6b9mr11541133edb.296.1661634775399; 
 Sat, 27 Aug 2022 14:12:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 kx19-20020a170907775300b00734bfab4d59sm2484895ejc.170.2022.08.27.14.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 14:12:54 -0700 (PDT)
Message-ID: <4f84f9c6-bf90-a5dc-1cce-bedb09ad06fe@mind.be>
Date: Sat, 27 Aug 2022 23:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-2-jesseevg@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220826135503.20612-2-jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=vU2i1JSg33J1NUiZeCXfCE7BLQZKbnNBzXZKpetQS3g=;
 b=Kv4nEnAYFzX/iIrKerJMsJS6GTvsNqQHZlvpKSq1tlYtRlrwq/7naRwa387BwzIKx4
 1PU+VqZNwf1T4UdSX+7FJ1xES5FdZ7YUwhB12dGwMpGAD0794SlXtUd6Mu3LzO4rqAR3
 aYKm4vtJcDa5qq8JkWUSJsEUfD5VXYKeTO8AlUoEROS+5TMxgwQvx8DCnS9LCcyXKVDz
 o1JmOpaKK8X8PiH6hC07ELpKEx7m8dw4QDneYrNDaHyzsK7Ksgg0Yuym6nMsFqfwsNZ3
 Ii7vk8Udw61vWFyPImX1ttpUbYZ+3j5I3G2PIn9BWQ7xO+3ZpDz581l+WryF0y/SXXzB
 hBPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kv4nEnAY
Subject: Re: [Buildroot] [PATCH v4 01/29] package/qt6/qt6base: Add qt6base
 hash file
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/08/2022 15:54, Jesse Van Gavere wrote:
> Hash file with just the qt6base tarball hash
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt6/qt6base/qt6base.hash | 2 ++
>   1 file changed, 2 insertions(+)
>   create mode 100644 package/qt6/qt6base/qt6base.hash
> 
> diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
> new file mode 100644
> index 0000000000..31ed2494af
> --- /dev/null
> +++ b/package/qt6/qt6base/qt6base.hash
> @@ -0,0 +1,2 @@
> +# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
> +sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
