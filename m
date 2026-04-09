Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFCEF364B8
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1143E81E7A;
	Thu,  9 Apr 2026 20:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLsZ3EYaygBN; Thu,  9 Apr 2026 20:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2EA81E4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775766447;
	bh=/zeEO2pDPwwmIR3LOOVtwOXtX8QJOmmX0RqMc6L4uVU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CGbDYI+6PbflpCdY8rNlvjFtcd9mArn2hemsMzqw1JfMz0Mtnntyn6nAvcwkUpfNo
	 d1bc4fNag9gxT9z6Uv/B05bNoerGMe/PKZiMENoTf8MVkQlBTLL0aRztWCKurDrnDP
	 aXKLV2ZgU4pI3vQC0A8eTmJdZ1m+yWeB/ac8Bvse/ql0j1CR3BmOLGUcMpsxe7Hm+b
	 2HXHGGnLL6yly3N0WJyPEPp9tz1A5eh/SoMtrpuICtf1dmOmAdb3zum8EQzP/FD5tV
	 ZVsKa7fF6nqkTMRnrQDR+0Ou7b59DikK1k/ermAfdi1x4P+MGtgiZ6koRsozdAsqNi
	 baZp+g1oeh/0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2EA81E4F;
	Thu,  9 Apr 2026 20:27:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12DD0237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01C1B401B0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7Zk5iSbrouF for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 301BA400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 301BA400FE
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 301BA400FE
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:27:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43d03db7f87so821851f8f.3
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 13:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775766444; x=1776371244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FRB4CIbSK+xAEvMvHBbfE3Vd28uzaIo9mzjSmpO6Sow=;
 b=m/CMyPfqm2lXfcX0z/F9R+3qn7w3jypCDKL6bGLCuuVKcr3/G1hMRM7RKsbsyC4p0i
 NjZZIGTVS/XFOm1U9SAG0OUMQcU54ArMk6u1L600w32VAwxAeTsw9IlSQ+hkf49BJPXr
 SdxYizQoXrh28NiokxDArWtD08viKNL9yOjzr/+FjnQQBwwvT75Y/r4iZGDw60UbRx+p
 jMV3OKlC3L37guKMleLycnoVGtA4KklSTwhi8yEcCoL+9wkEy2HBo8msn/gt/qMjVzol
 v6PmDFZP3nhlXoHgaLGYPsrZb4oq7L+XAeBRBjmMmjIzOYfLBFMa0ehpaXv4k2DreLId
 tyYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIHOj8CxJejKlAtxNOSCEoBoqILClL9qk9b09Gm3fYcE33xR6nHeDRP7oRg9ZlJfdO6Ur3E3kktsA=@buildroot.org
X-Gm-Message-State: AOJu0YymflnmXkUMem0aGB+Bs7taKgwgJZyA21TQyvsYNbC8oebVpaT6
 T1nQsuDjmb5IrIUTg+yK7Fm/awvoHYDk607VsphZqJsmj2ZA9qo/X9E3Cd3orEmO11rUMvtMqvy
 hlq/+mZg=
X-Gm-Gg: AeBDiet7KI5+Mt/VH9YBftE0Em6/ED9YxANSql+LtUpUbs8EkvI8VifxebmhEgU+u6o
 XcCYBZMo8rJ0OaqyYBHAL7FHZRw1lVLrnRC7jdXVJUdbH2qS2hRIGCwO50PJH1M8/zK0B+PedUl
 YbFY/vPnogUZySfj8ufnneafOhmbN+gzzKTm2sZqV7y8ox66GusDLutjNkWzsEEhUP8oVU/rR+M
 hk/dF9C1xbEItT/wlJgiTEOKXXyfo2J6t0gquZdK/ay6e9wB3NP6lcgMOr2wvSIt3Dz42icjMdn
 1KsrIv3ZQBzzrrGQ4CShajGuvSRTMnMgotvp0jHf8iWz/pXtFPtwaCAfiHQC3n/cPT6EL4M9DKO
 ITpPTA7GOiYolikrEP95BYcGwcI2fgJQm7e9lC12u3F+ZoSjEDhfTTqrMyQ0wlkeTuwJ0c0eJWi
 hAUTqObT9/9P2fAaaa
X-Received: by 2002:a05:6000:2309:b0:43c:f49f:9b7d with SMTP id
 ffacd0b85a97d-43d64270f00mr641705f8f.17.1775766444114; 
 Thu, 09 Apr 2026 13:27:24 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50200sm1470597f8f.29.2026.04.09.13.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 13:27:23 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Apr 2026 22:27:23 +0200
Message-ID: <20260409202723.300317-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <af55c098-2733-49fa-8d98-ffeb8072de94@cherry.de>
References: <af55c098-2733-49fa-8d98-ffeb8072de94@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775766444; x=1776371244; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FRB4CIbSK+xAEvMvHBbfE3Vd28uzaIo9mzjSmpO6Sow=;
 b=exR7OQUknBpp6EKKgoRMZ9/3Y8qc+Rprm9IGKYL13qZvdxPhZFR94FdqOvRxD5IwNr
 LPHstj+hhebABpaJSZj8x6yIlUellGSJgYbSxgsjwHVIU/2PcBncMcgjdHO28Qsya7GH
 qqDi6azpdQYjzA5YIbQqk37sL/CTK8VEFaP/t0Coyj3vxqi3jtZUwkUs68MHrVbrEEoj
 1T7L57rWIhEHAfKacWzOIehQxzZjv0+SUjHIm4wh+0f92GvNDqqgOQoT+e7dD6SLQIZS
 FXVBEM7G3KR2wio3xTnfnGbHp87DnmW848hRUJWTSIXJIXIGQTA2gVmeeYPITv8wBmHa
 q/ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=exR7OQUk
Subject: Re: [Buildroot] [PATCH v5 1/8] utils/generate-cyclonedx: use tuple
 for version
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

Hi Quentin,

> How about generating the version with
> 
> '.'.join(str(x) for x in CYCLONEDX_VERSION)
> ? This way, we support when there are patch versions as well (1.6.1 exists after all).
> 
> Maybe a class for the version would be best, then we can convert to (__init__) and from (__str__) the class to a string and compare two versions against each other (using tuples or list for example; __eq__/__lt__).
> 
> Now I'm wondering whether the SPDX schema version needs to be in sync with the BOM schema? Because while there exists a 1.6.1 SPDX schema which differs from 1.6 SPDX schema, see commit 5f3ee8066491 ("Updating SPDX license list to 3.24.0."), the BOM schema too is different but it's kept under the same name of bom-1.6.schema.json (and the $id is the same).
> 
> Also, are we validating that our SBOM generated by this script is actually CycloneDX version X.Y compatible? Should we download the bom-1.6.schema.json and validate it with e.g. jsonschema?

It's true that 1.6.1 exists ... Good catch, i will rework this part and take into account your comments.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
