Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9051BC77B7A
	for <buildroot@archiver.kernel.org>; Fri, 26 May 2023 19:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3D9442F58;
	Fri, 26 May 2023 19:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3D9442F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqUmnY9RG5ze; Fri, 26 May 2023 19:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1097942F63;
	Fri, 26 May 2023 19:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1097942F63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89F951BF97A
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 19:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F8F141FAD
 for <buildroot@lists.busybox.net>; Fri, 26 May 2023 19:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F8F141FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXz7atHEFQU5 for <buildroot@lists.busybox.net>;
 Fri, 26 May 2023 19:16:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88A041F91
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D88A041F91
 for <buildroot@buildroot.org>; Fri, 26 May 2023 19:16:13 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-96ff9c0a103so158117866b.0
 for <buildroot@buildroot.org>; Fri, 26 May 2023 12:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685128572; x=1687720572;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kajUAkceKIyjhIphSSFzB1x6F4hQHFNs8YtZiUGGd4s=;
 b=ByDkkqMzpvgLARh/c3Wff31YXFAFghsi5EHPbZSYa/01h7w0oIFG7ipIhTpHM0iH9c
 /tEUJdpZI9LANg6/tYRPkvs/XUFmUCBr51pH2ZVTrhcUS61of8qXEoRYelo8o+eht1VE
 6bu5Hq6zUwJqr1WKZNMS6H7GGNqtDy0phak3x7ViUzE5yhI9rXdczav7wVKVF805+bjA
 aBsfCqef/DPZuw4bm5aVaZIYlbUYxuLcGJbHFqSoe2c0Tn3jh+Uwl7Tl1KhKVwC0v9pK
 7h614Nrdlf/u7PHO8b5J41HMUkADYRXchria3W+hCxd/sSz18WolZZKmXFLe62N1VVGd
 07mw==
X-Gm-Message-State: AC+VfDzlf/tUGR8eO8TLrPUZwLS6rdYaS/aQp1RjzQtq9tUb4JfvQKfy
 sjbmqk9iuKnPNmukoIVg0YE=
X-Google-Smtp-Source: ACHHUZ6DbIrbk+/Eily/2kA7xNoLi74gIARVpr+QSMCuLEvKuGhSzi8H+/UaAFxa5tB09H0D0oc6zA==
X-Received: by 2002:a17:907:94c9:b0:968:db2f:383 with SMTP id
 dn9-20020a17090794c900b00968db2f0383mr3063797ejc.53.1685128571753; 
 Fri, 26 May 2023 12:16:11 -0700 (PDT)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170906248f00b0094f3d700868sm2454686ejb.80.2023.05.26.12.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 12:16:11 -0700 (PDT)
Message-ID: <eb8cf642-62ed-3f32-a32e-f7d28fd6998f@gmail.com>
Date: Fri, 26 May 2023 21:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230325175815.24876-1-raphael.pavlidis@gmail.com>
 <20230326141805.310d6e67@windsurf>
 <826757ff-529e-c01f-cf4e-63c109ff8e5c@gmail.com>
Content-Language: en-US
In-Reply-To: <826757ff-529e-c01f-cf4e-63c109ff8e5c@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685128572; x=1687720572;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kajUAkceKIyjhIphSSFzB1x6F4hQHFNs8YtZiUGGd4s=;
 b=o4/gS2y0GqCFavNOsOdoF6YhV0rJYjxJFu+enOiePK97h8s41yUTxBcbu4RiSiwkZk
 5p+czc72+VumnOyhnYTXVCfKimzQiih4Y5nvV4s9JogQBYrRQ9rc+Lo4MNPEAWi+NTYr
 wdrG907vcSBBm2GH4Tae2sNs/sjB41//914ob609FyhQ8zOqelBsFJHtZbS/iLTIA9Ay
 okfyiPSuFIbIBnz3BHL20sDa6Yev/QKKxt8F/070qhugAQB2MzXniMpvuT7ZJfHrPQEb
 CKgRDr4gPMekgFyxLbJJLwlxfm5jknZtoTcOJMApSJhbusmlfE9pMI/LQA40jdUrlXSp
 nvcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=o4/gS2y0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/shadow: only yescrypt build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

[SNIP]

> 
>>
>> Thanks for fixing this! Has this patch been submitted to the upstream
>> shadow project?
>>

It seems that shadow is hosted on GitHub. Currently, I do not have a 
GitHub account and do not want one. Feel free (and everybody else) to 
take the patch and make a PR.

[SNIP]

Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
