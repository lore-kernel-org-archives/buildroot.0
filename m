Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AE2C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FA5460A48;
	Fri,  7 Aug 2026 11:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbBT5JP72W1w; Fri,  7 Aug 2026 11:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E74860A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786101139;
	bh=Nv7zECdWVNC0bw3+HEW9vxodgVsFL3pjkpCz/2anc1w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AoxnKGz34864on5TQ0pMqW+7DOWzcZo4J7MawScT8B7Hb0bZrO1PYiiH9dOQ17IBW
	 kiSZbP8Egv6d+AdtNjiAoZmlOZYsQWnRPmaZK11fSEahYk5Tg3cNGkfJfc03uv3WPD
	 +BRZ46CN35kQc8ByB3LKIdnugU1zWQidv+KUkCHQL4wdzObaXfXXpb0K7gkT5mSRZs
	 DARDTm2yi9NKl/xfK+cgMfPGnwsnSgT0l3akTMkB0LHY3VMMYSNGbq45IOEb0thYIQ
	 WX69XnNhq5koe5igSCX1ZhJENp0SHVkv5TCZ8hil8tJI7p4eqm4CcnV0t30PUmOE5z
	 E4xAwS8gFBv7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E74860A41;
	Fri,  7 Aug 2026 11:12:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A25218
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F44C60A3A
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6yKrS-5p3iS for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:12:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A305F60909
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A305F60909
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A305F60909
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:12:15 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so2743045f8f.0
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786101134; x=1786705934;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FZ9ev+4vLCKgGstkOegbk2HNwN3Qe4CTD4V5R4hNWfE=;
 b=rMeTzdFP/PVHFwNEFsYDW1Neh5sGjlwLRXYzG3bqxhHXCqGEflebOuSY8DUKk5zBjH
 kARbsaakQ8c7deieHlHWdM8NUtO2fNpxrDcjyc+OEVO5DdUvyi/rQi3h37Xf8gYPWmC0
 NGv+EioVeg0mFgtKX6KBXo3O1GAHfZE6cep7x65W4OyaHpP+Cua+vzLbp2HPXoT4Q0x9
 2QyCj1g2L3apjQzX1cCj8vc6O90Z25ZMHk76D9an7nJTrsu1J7FcrqufbPiFg0LERjFH
 /H/LWBtqPrDRx0gIZ1zo6A6MF0thP+8eAwum99FKc2V67AiQYN0HBQqFnZ8AUz4vJvd0
 DQvA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqQ4TqRjpRNyt0UFOPzHapIBvTwwxp2JvKE82vcOJf/E/6y2rxNvQZ91LQ3QSkj03yV0Tds028tBv0=@buildroot.org
X-Gm-Message-State: AOJu0YyTIqAH/X0IRWRr4RYddmzhHDD/UqGnT5e7/PQUKZGSnFhQGCoV
 xAwdiVyQ8IS4GFEpHSHAyIxPbyO/faOBTkHugOFObNdGHowg9v8lao/szHymDQqstkBKloTQdv2
 hR47A
X-Gm-Gg: AR+sD121nza+hq1wG7Wjjqe+8YWuoqy9SUlC0MCIR/Ic4cuYPK2fbu7i4ZCeWF94b7n
 Crs4pC9UGgN+YJ3w+dXcd21L2qOPi9hvnjVh4qXXZdR7P+GYDDORrwIaZCOUCrp48UpiykWkKoz
 05hBePQ/sG88zf8Oee64AnBzuJb7a3cQTa9uYles/VZPV46nkaNC1sa2Yq1FLbFMDXh5mzaB9U7
 Mblg8V5z8E+n9DkIcFXD+mxFM/YR3Wi0wVvjUlkkuO/TZlLEPbdUNrBdFi8NxVC8sSBbRrMAib7
 SLpLjzNlPDyZIatsLQQ7bKbVsWEjF3SaIaInMl/SCRjcslIp2nWGX2Qwa9mzs5d1atc3juuJUZ0
 /I8K/Mu/YNR3MxQ6tJprKBYwZ4sCm44+o5bvbARqNkrIRsNRpgqtUPGtyqJpCEMSNmShJiWmFtn
 X/NMzW4aFbTmkCDJlcS4deOMtZWH5x3SB+ipAzbXQHdiv+2XS+AdutiySgz0rt+l0v6lY8tvrBS
 k+hk8L3MHzHxYC+rBHqL6xZQlhycgloSOZT/C0DTGkyyyCWlg==
X-Received: by 2002:a05:6000:4029:b0:47f:4fa9:ae42 with SMTP id
 ffacd0b85a97d-47fec5151d7mr34917918f8f.11.1786101133602; 
 Fri, 07 Aug 2026 04:12:13 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021fd392sm4736077f8f.31.2026.08.07.04.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:12:13 -0700 (PDT)
Message-ID: <a9f1deba-024b-4249-a74f-364a7c797c3c@mind.be>
Date: Fri, 7 Aug 2026 13:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
References: <20260711112039.2805693-1-yegorslists@googlemail.com>
Content-Language: en-US
In-Reply-To: <20260711112039.2805693-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786101134; x=1786705934; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FZ9ev+4vLCKgGstkOegbk2HNwN3Qe4CTD4V5R4hNWfE=;
 b=Tuy2spibK0Zgcoe6w+xwulwrfQOteGFxDwJAJw2Sxn+FjsxuGasta3DSJrLhQ9Zp8s
 NyldG5/N1YrRNY2Ovj4Dqi/u7xCObRCmwcFocrf8t1a1r7vKkQAY4rElq25CgyKQEPGC
 9QXD+VklKoMbgDnfYmurQHWyXU5RAkrzLVAa2GslcRS93tEqU9lnissCt3Txz65Z89qt
 RacDJ6qoTTgK/lOi5RiMp9061mYPpSGAJHJbPx7TNG4ZP/mE69GacRExwOuRTpokCdE6
 I+J9eU3AP/pkgurBlLsP6zSOrKGGu9JHurcZDNFWyAorAjah4HzNdGO7PFMlW1LeVdz5
 kVpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Tuy2spib
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: bump to version 1.0.6
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/07/26 13:20, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Changelog since 1.0.5:
>
> Fix various minor issues, like theoretical
> integer overflows for extreme inputs or NULL
> dereferences if the application passes NULL
> where it should not.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
