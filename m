Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1595FC5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E7440E17;
	Fri, 14 Aug 2026 14:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNPDlrdJFWlV; Fri, 14 Aug 2026 14:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADD1440E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716547;
	bh=3PwcWwFA2UI8tE+kjO0VawAnPZ4yOb2GBepOI17cIrY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o//kNqwRxg+LiJs0dItSeaMoBatb7JBjVx1NCIqxEm6/bceAfZ4TMKx/xfZ6Ic7xt
	 frex97z7Q9wV5mXgivC1kXUxGtCg1jwNPYHdAL9h5tJbk8bFSp69TWH6xS9W0c6eVY
	 qTWggG5eyAo28F4EZc7wa+gqP/55OwmLKkbCigzUnwq0O1mIP//yI5GveTYqwsr4G3
	 egJKpBQJpQYQD2XJTb59WHDy7QLGM/TbKaAmQ/jHE4opFPHh2dYGEcRAM5h21iCgoL
	 fGFKHoHQuu+SWM/jEAJRAwNq1kvwGCR11lFE4xJ6XXaDVy/nl7M+c/gjzrumvG2JDM
	 k81tLUqxtYEYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD1440E0B;
	Fri, 14 Aug 2026 14:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0AD823F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEB434011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfE1bVav8-U9 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBE0B400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBE0B400A4
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBE0B400A4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:09:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47fecbbafdaso338180f8f.0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716544; x=1787321344;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z2uQ/CpsaMT3+c4Iy09pdEf+k6cwGhMYhl5hiRWV0Yo=;
 b=Ut5M2PVx+fNwDx2gVUE9HVxCJbmeOFEA1WnkQZIO4gaBRU1VClfJpSLTPRjwsS9ugn
 5gelpcnbkEUD+z40TUA29qwtq8XnfCI8HkjCHB1vU0rVK8FiZa8HKiEBlfAYY8rgkEM3
 SaJV5+IstDk3dlqeYvlORUOpSlWhqCVAeM2YFgRVJPDcit+2NDz/0xWUvXZezjeU04Ym
 YzVCBs3eQrFuHorUU4xITXZa1Mi5DJT39N7o6G2ru5GaKo7HN3baJn8BKzLu8YvhEvpf
 OGuL6qS5XLCKdCL0Tte0TWwQpUOgcXPOH+BsysW3cMasioNJJ0SaJQUVTdatil9Knzb1
 66DA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1XtcThNBSyw9ujDOrMuLn2W4imxXF4zDL+pTtsrm26EnnLNnTNPpKygGKTii9EHwq+rSL0qDmbfg=@buildroot.org
X-Gm-Message-State: AOJu0YzYRiSlSwop7Q9NPRWM/2UnQavLgOCcBxFi7pq3gWjrFIsa5F33
 IyKsJTOVFsL9GQoknWfRC3iKIls4qEjIV077f5ti1AqxX9y2e0PbDmuCBS9NoRfBM5o=
X-Gm-Gg: AR+sD12nGQcsTcVYVZ3uXZYIiA/Me0PKYIWo0LCE9VODYpyh5u+Tu+D9FQ3eXZ8oJ8E
 4hchvfGdOsj7yxYmCONqL4oZDQcHIUeDMJWAeDRLXOe1KNyN5EHe8zutiXOEIU++c+HsacDdGxh
 3lM4obV1X0AVdw83o1dvJ3fGBk4wSFLwdM6LV+uF+6o/qIpn5jxqqKKMV6Qxq1/Tlev40IDOlvF
 KFD63Pbqn1ktkcFwb4OCsYtYbjqXOEA0ukGLbueybIi7h9WrSOUT740Qx3CfG4138MWUiQNFfLj
 Rgr0O68mXKEjY2wMHWBzUf15Zk+4JZ/FB80PIKAlvo8Mktq1nIZSabLzDsFVQoTLCoqknTuWW2W
 YUCnSWbBZxSvgfGRfJEDYX6C/OwIQOx5KjmSNvWmVMSPLtoErUejhjAeNWeDAWBKjN05skS6A48
 CerFzUaAmaWbY9xZoSulDQJ61F0hazK7mCjeUEIyvQZTmfSDJj6ukljt9CL4vZhACpILLp+++/X
 +2Z7UYgQmmqq3C7qJj5UrR55X9VMXYcyDsLXuO8IIxQimhS
X-Received: by 2002:a05:6000:46db:b0:47f:7759:89df with SMTP id
 ffacd0b85a97d-4816071004bmr7078564f8f.3.1786716543851; 
 Fri, 14 Aug 2026 07:09:03 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f1ffffdsm8050943f8f.2.2026.08.14.07.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:09:03 -0700 (PDT)
Message-ID: <3eec468d-d98a-4f40-a918-b52cc7c01e39@mind.be>
Date: Fri, 14 Aug 2026 16:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260804130356.1101294-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260804130356.1101294-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/librsvg: update project URL
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

On 4/08/26 15:03, Fiona Klute via buildroot wrote:
> wiki.gnome.org has a big deprecation warning saying "All information
> on this site is out of date and should not be used." Point at the
> librsvg project on gitlab.gnome.org instead.
>
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
