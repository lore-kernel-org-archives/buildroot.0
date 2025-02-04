Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE0CC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD16341458;
	Tue,  4 Feb 2025 17:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjW7P5J5VKHM; Tue,  4 Feb 2025 17:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF87E41457
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF87E41457;
	Tue,  4 Feb 2025 17:41:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F33F12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DA9C41459
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nnR_WEsNHI3 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AC9141457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AC9141457
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AC9141457
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:41:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso40774345e9.2
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 09:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738690901; x=1739295701;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p7bMrJ7wvoDzha9RJ/Vsyfx7nqftqBUDf8VB3XUb4mM=;
 b=bIhxbD1wzus6IfHwuJNC3VH97nHd2tam/0iLzaTlpYClH81EkqkxKqkV7peDz7+hxs
 oT4WTUdima36tC2+l/CKfuRU4QxCkCVfNaKXuL8OqAqiNA2OF7ZMUhnmTl8bVSlP+OBq
 3C54F/YYWTu1eH0W3kFlo8alTq1l0EUTFNM/xs/OFSsd8iJfnf6Mce8V2UIMBiwvMOhb
 Ecw4q8RJnnaZrtPy9QPC13pd4fe/fByX/zUKjJvsbbRLMXtfKafoxmYlochvWfhAOggR
 UoljKSsTML6KOfI49FQRyoRRon8Fp/r6mIOp833meoVdQTHTALJ9l1pc3IUg9hw98B3c
 4pyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWEG5wG/c4420YLZwFMneKystdsH83uNQP1pD7UWdKFi+ommjXvQKsKUX4x9b5fjjF4upQbrNHEDk=@buildroot.org
X-Gm-Message-State: AOJu0Yy7Ne7dntFe30vRjj82HDkCfCuZRXVUxFoq2ZiIDyoSS2MbtWgB
 fPu0cOW+GlQIduq157ymoBM/iB6o3QGHa+YRHSkUOQY8zw7GyabMDrFGLKuln8s=
X-Gm-Gg: ASbGncvMvZtIP8O+u1NjOSiGmEQpzmeJGiqPHTvZ6EJBfVpt+Y8/0gGPR+IuRXWQWnf
 klN3/ONTqO0QiaNIB4cvIuALPi8Rehlmt+18GkTtdCy1qAKdlVNGJAFa4Fwxv7xmjPonmi6y1E1
 9xTw90iEg9+Q1L2WTqa9Iqs8mbVuHTAZwrri940zU1b8G9huwwui+s0QUQSrfirvwAby3hic1jx
 oLBSBpp2OsdZU4qcbjLaNFJL/s+UD0ZEUpok2oXu065SuJ3cvwoeagzUpUhDilRb6LR6DVEsisH
 stMWioBDVrJwnSnT5S6wHPbHuTu3sxlVHX4DSO0H0bj1aZI=
X-Google-Smtp-Source: AGHT+IHezdvJiPDVUWDVFpFFO4KdF0P+UCfKngy0Rn3xVsPF/sowCphlCZYXC9009tIcsgxNG7fo2A==
X-Received: by 2002:a05:600c:3c9f:b0:434:eb73:b0c0 with SMTP id
 5b1f17b1804b1-438dc3af760mr265910585e9.5.1738690900855; 
 Tue, 04 Feb 2025 09:41:40 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e5d4csm195100495e9.19.2025.02.04.09.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:41:40 -0800 (PST)
Message-ID: <2060ac98-2ba5-4e6f-8082-9cf0a4aaa3bd@mind.be>
Date: Tue, 4 Feb 2025 18:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
References: <20241106204938.4040083-1-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20241106204938.4040083-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738690901; x=1739295701; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p7bMrJ7wvoDzha9RJ/Vsyfx7nqftqBUDf8VB3XUb4mM=;
 b=aBRGb/nPmHxBnqOvHEm76sL8UzsYf767G2OFMAbVMRjCGnw3o+JBzBsBybuigZ5WbP
 Z7WpoztlsvResO2uiWt3iQfYWC9kbTCtpfQedV4DjsVDB9Wg49xCkgatA/Xob81r5KIg
 au3nXY9yV/2TUk7s1HmqzO4HfRGPiDnlq7hEuxt9+Ssdk8tP8mvNXfcE3hbQH+U8wAbc
 622dH1Ynsk+w5XWhb182sXUTxAf5dDq0dTXOACIDJbTKElEg7gcUEU6+hRtMhdZHmwR6
 ExAfAbk6ZZeF4mHJT3iu+aIp870aOjdRg9Qaa7OLoUorx55hdqe6R3hSJ3izPtrf6joJ
 to2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aBRGb/nP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiomqtt: use poetry
 setup type
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/11/2024 21:49, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Aiomqtt uses Poetry, though host-python-poetry-core was pulled in only
> as an indirect dependency of host-python-poetry-dynamic-versioning so
> far.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aiomqtt/python-aiomqtt.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
> index 291547f11f..80cecea9e8 100644
> --- a/package/python-aiomqtt/python-aiomqtt.mk
> +++ b/package/python-aiomqtt/python-aiomqtt.mk
> @@ -7,7 +7,7 @@
>   PYTHON_AIOMQTT_VERSION = 2.3.0
>   PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
>   PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/db/c9/168e78bd35b21d9bdbb26178db33a8f265e4a69bb4193e72434e7cb3d1cd
> -PYTHON_AIOMQTT_SETUP_TYPE = pep517
> +PYTHON_AIOMQTT_SETUP_TYPE = poetry
>   PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
>   PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
>   PYTHON_AIOMQTT_DEPENDENCIES = host-python-poetry-dynamic-versioning

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
