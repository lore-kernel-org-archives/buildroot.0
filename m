Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1709EC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86B0A60B88;
	Mon,  1 Aug 2022 18:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B0A60B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OrLQkEb-c9DK; Mon,  1 Aug 2022 18:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAAB560AFF;
	Mon,  1 Aug 2022 18:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAAB560AFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 099881BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E592060AFF
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E592060AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaPowIXRt0nZ for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:16:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8FFE60AC4
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8FFE60AC4
 for <buildroot@uclibc.org>; Mon,  1 Aug 2022 18:16:28 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id f22so3833387edc.7
 for <buildroot@uclibc.org>; Mon, 01 Aug 2022 11:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hrCKTkUKdJpMjPXGGlQWYWsqN3k3njB/vQqqaMqNpM4=;
 b=4TRx+vdZquN+fOsQ9is54dTOQolroDRIo7ciiLOxS0vyRKI2DzuhuR++cR1ok44YFK
 d7QMh2Csln1B4SbmYxjYtw1LImFA9UD4yP+lnifdZ2+RcZJfwrqoUHl9zvSuaaFTUMw9
 f2wDNmt3j2qcYpeLEgDgbuwF1U7hnCV1ZjYkzRix88/eAMlc4jlf8Kk21y6ykpWhievy
 RKSK5mscBgGIzUIjpOcr8eSwtdTeIKQoKCfMySh3dxAurVY70WnKZIs7pq0tKCdkW2T4
 v8HAmhCPcfIgKPFWS7VI3KLNmKD28E/ns0nX4dyaVLp/Pdi3yRKPKSAzvC+JddX2T/rg
 5VJg==
X-Gm-Message-State: AJIora+TobnmQ0KCGBIbbMJJvIVblARdl7Wv+3rD4GmvUKO8om80Cv3t
 DGf3W0v9XAAJ5UPF/0OLLiKDaPnfvK1rCw==
X-Google-Smtp-Source: AGRyM1tvS/mAn78lUKKbx6MX4Ixdah34YObhgTij/UmRg9uTyK9JsSreXpFxEKfgunh/2JH/PIPmnQ==
X-Received: by 2002:a05:6402:26ce:b0:43c:e187:881e with SMTP id
 x14-20020a05640226ce00b0043ce187881emr17153456edd.408.1659377787151; 
 Mon, 01 Aug 2022 11:16:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v10-20020aa7d9ca000000b0043d742104efsm3289843eds.19.2022.08.01.11.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:16:26 -0700 (PDT)
Message-ID: <6b20e25f-e562-d4aa-3da5-1000ab3f43bf@mind.be>
Date: Mon, 1 Aug 2022 20:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@uclibc.org
References: <20220731111240.12145-1-bernd.kuhls@t-online.de>
 <31fb8cf8-02e4-8bc6-a7b9-c6f9cd0845bc__49535.9333044448$1659376652$gmane$org@mind.be>
 <pan$5b6cb$bb19d38$901acf5f$10cb6fe3@ID-313208.user.individual.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <pan$5b6cb$bb19d38$901acf5f$10cb6fe3@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hrCKTkUKdJpMjPXGGlQWYWsqN3k3njB/vQqqaMqNpM4=;
 b=F6GzvQ/d40VxR/lFQDTV8vy9CSfWoVtjhvsSef+yRe4yHRA1QaCO4TaFcSq8Ydfiuc
 AGES1gvsxLE8h9GeB1ER2BiLRG/GP+sfvZnp9cnhGKBZdEWSWhE6S4DK7BY0AnrDSCwe
 jaWzZGexiIEAwOTSG5c/7JpPAQnTRkgs8TJFLSvx+3sOwZGzC9atRUdmZvBy9RTI14Yr
 HKm3uMaH43Ihq1XK0pWAucdVQkLd9dYsrhE1yaAE6ZZTsOXcyJBxvEwulYyIiYcoWv4H
 zl/jMCQWzuN2NvuKkTGAviHCmAMR2lyN0SAm+EYZTE7CBAWckoHblPWHGGE71BWpt40u
 fHQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F6GzvQ/d
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: ignore various CVEs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/08/2022 20:05, Bernd Kuhls wrote:
> Hi Arnout,
> 
> Am Mon, 1 Aug 2022 19:56:53 +0200 schrieb Arnout Vandecappelle:
> 
>>> +# fixed in version 2.2.5
>>> +APACHE_IGNORE_CVES += CVE-2007-4465 CVE-2008-2168
> 
>>    Then why do we need to exclude it? Is there something wrong with the
> CVE's CPE
>> information? Or with our own CPE information? Or with our cpedb script?
> 
> my understanding of the CVE/CPE stuff is rather limited but I guess these
> CPEs show up for us because the database entry does not contain any
> version number:
> 
> cpe:2.3:a:apache:http_server:-:*:*:*:*:*:*:*
> 
> What about ignoring such version-less entries in buildroot?
> 
> Thomas suggested to get the NIST database fixed:
> https://lists.buildroot.org/pipermail/buildroot/2022-August/648210.html
> 
> but these entries can show up again and again... And providing proof that
> a disputed entry from 2007 should be removed from their database is
> beyond my capabilities...

  The disputed entry is OK(ish). It's the ones where the version information in 
NVD is wrong that we don't want the exception.

  Regards,
  Arnout

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
