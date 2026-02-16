Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C99E81A3B
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 959C260B25;
	Mon, 16 Feb 2026 15:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKnK4hb_zl2K; Mon, 16 Feb 2026 15:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FEB460B5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771256795;
	bh=qvnG8ZZ15gliHf4cpRWW2QwRZLoMcsJR/Z1/57NeaIk=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ECO++sAqUQY+eenfGI7ZDTMqFEl6VTfHxa5bz7MC81gyi5YPBAaB+O6ojEwl9yCtk
	 Tz/CgDAyWZWW4a2oUr6fai4zuH5YUpQ8easMQSumkDFnO6AR3neo4oNZr/P0cAjrFr
	 aYEU7XWIRJ5+xNRennx4rMiJrdD1pFsR93t/yHSMCO+YH8evcrieTMTjrV66muZ2t0
	 a6XotqJpMRn30xJH6M85kGhTrBQf2KzMIurzWJqJoXnMTIPjPUY4taI8CnMmlHwYOJ
	 CwwxaR2GKnyzG2C4S3QR5LkphqundapRO2bl7yHDn+Lx62dYzQNcyJn0OTvFHEVz4f
	 MU2pmkuR9jiew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FEB460B5A;
	Mon, 16 Feb 2026 15:46:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A37B1EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 15:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B58260B5A
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 15:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PLi7IYQEInu for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 15:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4209760B25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4209760B25
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4209760B25
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 15:46:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-436e8758b91so2733041f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 07:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771256791; x=1771861591;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=keGX9lcVqYF30pn6aujB7wOXWEyNpbnY5x9xdTPHcWM=;
 b=mEMx242i4quQagVK6sRXvmnBq107NyKwPVXn2ogSDNsNNC00UWvJ7ohBREJ/2OssBN
 bQSq5OXx4VQo08Piu/+hK3q+2TcT0vhj9J+45pNHVYqGjHiga9glKl48YcCvCqfXJrKA
 Du7m8KhbErmT+e3ITb3Gm84YbyxRdyVer30ohnCaee8Atl7LLqLMaYmqzEakob5qnQw9
 oc85uXXzMBgWllOLYs2TyT1gzRqnEcykCtFjuea1oCbSh9hz8UMgLECo6IKdi1jdnwen
 UELv9Yrvf4hdrZBnKIadQlHimBJz5VP1cOco2J3Ln/sO12LtmuiTRvOorcVLwYS9/3tx
 ug9A==
X-Gm-Message-State: AOJu0YzGWga8r29qKEVmEYh1CEzVYnP1kBy88bPk8tTj7XDICDeA51PO
 TvtTnAwQn7NJMhnX3pr+/5HkScCKOvxufrEv0F2Yw6uNfRRW0+co24q53F+Giw==
X-Gm-Gg: AZuq6aJKJLfDt3egquLkEVyGPgn/M+lPOMiyasTvipo3RVn/O0+qHUY65CdBhxtSCqO
 Cn65ZOo7z3qMaQCTAbzPIG+bI7+yQllCYSgB8uXeb1fq5Fq4mAPqUh2lUpiDC4g0XrZRpzUvlni
 KjVrDZ+Yia67cqdhcPTHDyD8hP/bcV3cwVyBa8smospdpAKXOWsrAsB88pW+VhrL3u4xEG/Cbkf
 tYXMJ6UQzsQ87lGpJjXh0dr239EIXXqg5cHekWdjGEHHLgGcXwLwTZQhAfKSSwLVjQXVzBvo8Vz
 TBw6HDPhXqtbr7t1rVJpxqTmSi+ofKbB/fYx59Yt2KPS4vr+gITO9XZGUVQ0477z7caAUCYLKwO
 J82pCysSHln/1vLrqAg4EjsJHkM7SM6mkSarVMc6swqnulpip+OvTdomZrQDwNcfnhdBrwdWfz6
 U35HZ9MalTQ3y/W0l2hQADp8GDrlaSYgGOyO0Pq6C42cPjYg==
X-Received: by 2002:a05:6000:3107:b0:431:a50:6e97 with SMTP id
 ffacd0b85a97d-4379db8ced2mr15006814f8f.34.1771256790858; 
 Mon, 16 Feb 2026 07:46:30 -0800 (PST)
Received: from ?IPV6:2a02:8070:2483:7e00::213f? ([2a02:8070:2483:7e00::213f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad112bsm28213325f8f.36.2026.02.16.07.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 07:46:30 -0800 (PST)
Message-ID: <b0bfd55e-de26-4520-b561-5685548e04c0@gmail.com>
Date: Mon, 16 Feb 2026 16:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
 <28f39cebabfac2467fcd43416b74193d@free.fr>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <28f39cebabfac2467fcd43416b74193d@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771256791; x=1771861591; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=keGX9lcVqYF30pn6aujB7wOXWEyNpbnY5x9xdTPHcWM=;
 b=FhLrzDFQAC6PIEOQtlA5MvbsxISwD4D8Xc3+pQwDZGjHkBVPfXHp6y9azBD+1Wz2Zw
 A91NLUKEMRqvVsa0BP56xqyTgF096J+15v0FWJoQN84alkF/wzI+vz3ZNSMlk/5w4YBt
 0px9INgSj9ItK3TvUIQgJHp5wK9rahF7oX974YffeYmnFucGWGOehBXYxRR25VCPjXmc
 BpZtCL0eF1HGDuxlDLuNmoceK1xql8fcFr+FKO9a8SfURPHP3HIKYp4gErmVHXnp/asz
 a00PTSwInWjswJgyr84cEo06d8XzSWhP1p3sn/VGnH6Fm8QXkeooqYuNNRsPzWiMEkLC
 j0jQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FhLrzDFQ
Subject: Re: [Buildroot] [PATCH v1 1/3] package/linux-pam: add security
 patch for CVE-2024-10963
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

Hi Julien,

Thanks for applying.


Best regards,

Raphael.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
