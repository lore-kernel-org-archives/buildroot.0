Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ADFC4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 21:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 684B541723;
	Tue, 29 Nov 2022 21:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 684B541723
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HcQrLKeNqup; Tue, 29 Nov 2022 21:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD8641726;
	Tue, 29 Nov 2022 21:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD8641726
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 703951BF2BB
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AEA960C0C
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 21:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AEA960C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sj4M8Ieh2NvI for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 21:42:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5FEB60B9E
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5FEB60B9E
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 21:42:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso527547wmb.0
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 13:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vNCvyXh9X91rPwWBFs2HkGqtGIEU6F9ddkKfYTpCspk=;
 b=DIXfnSB4+tKdbQytny8nn6pvhAcATpjJIOUDVIJkdjtvwHb3/XHJkvho9dkaVytj8i
 YEfW8nAB0/n0rZIaKkhMYlJOeAkx6YNk7j3fc6yFN2j7iWmZ2oIjwfgmdagDe+iHtL9p
 XHL84GlRBfWsYsqz7JIgf8mvuJcH7HU+I1zg9nl+0fCx5GgXu1Daes8edXEgAByFITeB
 GAxt7WKlyQcT0O8sDbOknbyTbc9jY/Vbcdpll57IoLg8QZncTmAvvwHD1xPbq03fOpEl
 XVQiIDpqpqr/WBB9xJp1mSNVjV/PlqHgw8gmwtoEQeXhUEjQwjZn2G4524b1rLJTpU4M
 hzsQ==
X-Gm-Message-State: ANoB5pmwI2k3yHA7Hhx17faXwQ0deMhF3Dn1SymJQmjOskkBF9S5TV7i
 vzKJhQ5Y7krjv1m/3cLDhOky1g==
X-Google-Smtp-Source: AA0mqf6CJXuaXqhqKCEzszlzdeBm+HyuI6V6VEdp5tj4x/P5BjuvBY8nIRj27q1Y17qB53TSF8HWxA==
X-Received: by 2002:a05:600c:3495:b0:3cf:ae53:918f with SMTP id
 a21-20020a05600c349500b003cfae53918fmr31622958wmq.131.1669758158923; 
 Tue, 29 Nov 2022 13:42:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a12-20020adfe5cc000000b0022cc3e67fc5sm14335180wrn.65.2022.11.29.13.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 13:42:38 -0800 (PST)
Message-ID: <c29e48e0-d7e7-3f61-082a-b7b3fba976f4@mind.be>
Date: Tue, 29 Nov 2022 22:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vNCvyXh9X91rPwWBFs2HkGqtGIEU6F9ddkKfYTpCspk=;
 b=VC2tUpGTofIJofhbxVh0pLKjNPMaehRwyzWt8wwJWHFTVX42FZbBK6JuJ0TQblCdMi
 s+QHC/y18IuBgX7g1NAHnkSI6KqxX9c429wh4xJRpC0nrXk0LSSVnMG3PpwCqBQvXXeS
 47qTk4OR05SHOX7coJlzyXvaXS+I4ZSWVKrpEfoVw19pH9RL/kymw2422C8YhtC3wHmP
 EUkZjnCU603O1tmRnnaEKk6LEsj+tjL57iGIRW324Y0hxP9PDFVw/C+vzkdUhp8Dpedo
 XVcKRvqWqZU7ZxGTnOH7EfXKmRf5C8A3Cq3w7HsyZ7QIyCwLIRMs0w2KRSrMNwsFeWoP
 3lvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VC2tUpGT
Subject: Re: [Buildroot] [PATCH v2 1/8] package/flatbuffers: build position
 independent code
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/11/2022 18:58, James Hilliard wrote:
> The upcoming tensorflow-lite package requires flatbuffers to be
> built with position independent code.
> 
> Fixes:
> /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers11CharToUpperEc' which may bind externally can not be used when making a shared object; recompile with -fPIC

  This looks like something that would happen any time you try to link 
flatbuffers - so it should happen for kodi as well. In that case, the patch 
should be applied to master. Can you check if this is the case? You 
unfortunately can't rely on autobuilders, kodi has so many dependencies that it 
(almost?) never gets built. There were 91 configurations in 2022 that included 
kodi [1]; all of them failed, and I think all of them failed before reaching kodi...

  Regards,
  Arnout

[1] 
http://autobuild.buildroot.net/index.php?date%5Bfrom%5D=2022-01-01&symbols%5BBR2_PACKAGE_KODI%5D=y



> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/flatbuffers/flatbuffers.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
> index 9d286bf9e1..487d85ee1f 100644
> --- a/package/flatbuffers/flatbuffers.mk
> +++ b/package/flatbuffers/flatbuffers.mk
> @@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES = host-flatbuffers
>   
>   FLATBUFFERS_CONF_OPTS += \
>   	-DCMAKE_CXX_FLAGS="-std=c++11" \
> +	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
>   	-DFLATBUFFERS_BUILD_TESTS=OFF \
>   	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
