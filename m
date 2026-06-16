Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA009CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 17:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D8C742AB9;
	Tue, 16 Jun 2026 17:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G20-KIJzUJbB; Tue, 16 Jun 2026 17:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0C842A0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781629468;
	bh=Gr+HNXzWAFDp6uFRClDrVuoPJjgxPDWxpMlg9VRTatU=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fslBNVFsWWBulp2eEIvUlb0q9D4QhLLQVsbVIMX1f0GpibVur4m2X9yoDd+2bvjhH
	 3ViaE7gdMt9g6Md5fZLZeXLVPUgsCY14ZGtWtdLCRn5THkEVHLPa7KNkvwwZ2p2IJ9
	 zi8wSGnVQ09nNEHjEnqW4niqrFVidTOIfZnZxZCL/JwtDVHuIaaS2sYv7fF/ov9geI
	 eMxbcww/broILWc9R1RXRms2iQ7y0lPcEqjh14uGysUmkhIcYntA5TAoP24bFSNxP8
	 qjpMYea+s3xRHNG896lxDbIZY050OlhnHBO+2iCgrs57Ez1UdBmRk+brkrnlhgVrO/
	 LQDkqP3L1bH/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0C842A0C;
	Tue, 16 Jun 2026 17:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E56742F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D75D240235
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOOMMS5r9nV3 for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 17:04:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1230; helo=mail-dl1-x1230.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1036140226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1036140226
Received: from mail-dl1-x1230.google.com (mail-dl1-x1230.google.com
 [IPv6:2607:f8b0:4864:20::1230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1036140226
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 17:04:25 +0000 (UTC)
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-13807d2f898so5243549c88.0
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 10:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781629465; x=1782234265;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DAq6stbGznZdgMQ/vZ6UzIhFZg9mbhbKGvYe5QY+5WI=;
 b=FRAwO2i/Wj/7rRdvO+O0gArGOAF7Tz2iE8XyQIg18o97aW8ImBi0MW2455R4c0X+C6
 wSf6TyxcUS/6cOBg6MoEAuvV78F/PwUzMQ3Bh0Qk6KvSAPa/VwSTppgThgP+Mgio3tec
 zG+PPoLkMGxHcD7Twi7ZpEW4I47XO+fzYu4wbhrrwy5fa1Yii+qwQUMFjpmM84rzEGne
 YalVhM5n3V6mQY22W5z/J2NLCmY3LVN1JJbKw005EzQMFBkTVI17scewCXBBEAJpcIKK
 9U74D5i4SwsIDNKBh+So+Yr1W7aAN2RTV3Q74b65ZDlIshYT9Ic7KG2J8ugtBwERDbxi
 FjVg==
X-Gm-Message-State: AOJu0YyoQZ/jxyYSqLBioVI52Lsieb4TVF/lk6WqcQPFYUHOFD0pLNRv
 RSRWvcqtxDtWIJgqONmLuusFTgQqvsIu14p9Z/95K9b80MhDB/IizTl7uxkwiyRP
X-Gm-Gg: Acq92OGWDLcQ8hU5p7ZPyHs0M3T84MmoxTMxf6WfTEp+BZm91Qs1OPH4MCzAbgS4Ds0
 Clu/Ewsyyh3AfkaBk1uZ4CGWBhOyUGaZLI3ADk7cG2omcW6Doj8/mvBEWle5/DPvo0NyXMf3BQK
 XBy5dlgQlSMcf+isjpYzclGRb4ANcL2oRWpk05puaMQYXvcaEWlpN0BiAucANlFsWjm+gWBl9+y
 ZF6AJSMKKaHNpakuhglgJsV5NPQeuwS42SUk1eAM/BKdlXsViwrpK1SJ1juns1eeNIdWqvSabnu
 +DE6R9VBbld7tzfrqMOarvzN1uMRnF4zV0PbSrqTsrDk6kpzln1uTiq1pK0Y42+OnyFdcd4YT2R
 YuL7A03MrKmPV/05t09Ty7kU/boMzMhjGcz7I52YY/PNR3puYEkDLj96G1t6MUfS/LGEml3XtRe
 7/ehbUOZdf0qGlkhCGbMOrg72GXEs4vIZaTPYfl8K86r9ZNBmG0hA=
X-Received: by 2002:a05:7023:b16:b0:138:2c88:b3d6 with SMTP id
 a92af1059eb24-1384bb69a3emr8251733c88.18.1781629464941; 
 Tue, 16 Jun 2026 10:04:24 -0700 (PDT)
Received: from [10.0.0.218] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1384b97bf09sm14409884c88.14.2026.06.16.10.04.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 10:04:24 -0700 (PDT)
Message-ID: <4d0c25b9-6b7d-4104-9b7d-aec6dcf55f73@gmail.com>
Date: Tue, 16 Jun 2026 11:04:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781629465; x=1782234265; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAq6stbGznZdgMQ/vZ6UzIhFZg9mbhbKGvYe5QY+5WI=;
 b=cEtcvrzYxv2qoJbIJol9WHAHqawtB6wLwg5rSzhJXjiqN2gHV5MLR/ONONzu8WKHx8
 HhMhbPV+V8OgwTcsMg378YwQGH/pOkWEqTDJr24eYtj47PxFJa/Qs4LS89MN7P1MI1W+
 p5hHEYRX41vDjFNqVZUlmn2Bf0dxorxbMRno8wzHEwZ2+SV6A6HJPxDwqH1RxOVHikXE
 XSdhUq1mn5LLNyX+XQI/vGx9lD/3UupdjxbDEsMTHqREGE2ji62vwq9bptdn+hDBXVAi
 tus5sSxyAIikK3esOhApasFvr+Poz0qJyk+p3pfIPCRLHC8VeXNBSeOHiOAo2iPxb89s
 IbeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cEtcvrzY
Subject: [Buildroot] Busybox concerns
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Someone just pointed me to this issue on the busybox github mirror that 
alleges that control of busybox may be compromised. Wondering what your 
guys' thoughts are and whether you have any other insights. I'm not sure 
what to make of it all.

https://github.com/vda-linux/busybox_mirror/issues/12

thanks!
Lance Fredrickson
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
