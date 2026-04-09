Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C3F364B7
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226F380A7A;
	Thu,  9 Apr 2026 20:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5EB6-ukrhgQV; Thu,  9 Apr 2026 20:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 476CB80A8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775766300;
	bh=DvRWw+0kh5FNrAaGdfHS4/i2P9SIUyOJfARLUvBHmAg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VQqUEnASEoIZlgEahCRLlrt7wW/GlE07Rk0IR8RLTFfCiA9yEgQT3WZNlWo9Lx5w/
	 w+GQZr+hvA9E99I9pS1TryuSqZfghjzZGfNh1K6Z54pd/L21E3OZyUUzPK/+CcPyYJ
	 aIFvuJuLgotC5uwPFh3HYdRP10CWV13oje/1Q4BiP/eL/hkJVfHTRbxiLnzRlcITe0
	 AR8WYp98R/BjckkjjIWHaP+Isr9PvEvxKSs6gdJmLovwOEUpqOVt46KhTzR9tqOfxj
	 1keFM3thXn/nxJkCINlLPCwfYS3KyeZoO19rUPsfYOvjA05B0p4svt8XJ45z6zAI1E
	 caNMWOKZao/Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 476CB80A8B;
	Thu,  9 Apr 2026 20:25:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8FA4237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF773401B0
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Smn5gNTQTjaq for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 910B2400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 910B2400FE
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 910B2400FE
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:24:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so825986f8f.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 13:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775766293; x=1776371093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ABbTh+MiTWkUn1nW6j78yln9tGvwCUN5ZkN6jJK+z58=;
 b=X83urAFGca+TnRxRt+ZAjeS3BB7J29zUYs246IEeS6qA/PB+ihM996iK+xSONj1ZI9
 dr5HSfE2Jd7jkcCQyU5FxLCrdNHlLBI8HPyTGEhcX6BNemeCsr52nLFMQ5Qv8oLT0+9D
 90/iAvxQCH46TBNYLuwTvff101AAHwa8ShXDWiESZqAvgtkXhGjBan+k82AkZpP/zOFA
 5Pg/Tx/ivSCfyXYPTijiDFOt2pmgo7V6ti3Weu4PNMCPkaN9fiCt+aJNY5k5k8yA4rQ/
 50lY7n/N0zbd41E+mbgkqa+JHIo1KHI5cuX0hAOMuppe9CkWQF/ZFhpXKBSpGODoRYyb
 oNYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx7sDviePIk2qOqthvHrXe2+XvHh5GgdJ+kKuEV203csbNsad58mrQEANc6AslHXWGHSrrW/jMUrk=@buildroot.org
X-Gm-Message-State: AOJu0Ywev0Qc9NiQyFiEJNfyLKuo4PqaKfHslEKpEjeY5UTtAcSR5DUv
 LxRiZ+eAwln0IcsL8Jb5Ejtp1kxWR1s3J+vb55DwIHel5hk6eQZk4snFd/Tr9uGlfwA=
X-Gm-Gg: AeBDietZcOGwB+skO8rAAiPsBZw/GU50jeMBzYbu9bOSfFuTfaP+H6Rdv5tCW6ldwGf
 Of2bY43pirLMOGlTeyL9hT7uBxEite9Lwyt8euSkF9JERYjagDWh4c/sZTiQIB0ObtM18QXvYW4
 tJ7Q8172vteeK7xce39mdYSoTp1hLfbdPIH7DPFqmYGLscx96ufEB/UZFQ2hnrOMooPbCychCLW
 vLlRA4+AsCzJJLoJQFSdExGrHY6cO3L3UYrT4aM4mlzijCMxyp2wVVI0lQwQZUIcv3EXMP/d7N8
 2TlobtzRYTRLs7Asosnea4rhoC96y6bUc12UkgxyqdbgnElmB2bPDZSMwxgHlfuauX+xf5O0xgH
 N43B1mGEwd+8zFyw35XDHSz+jiCvCzoVB9ow2BogrlXdpdUZ9Y3s5KIu5dkfpI0haPK4YNq4Hk+
 63oxOJLJ8/o4u1PDNO
X-Received: by 2002:a05:6000:186e:b0:43b:8f38:3b88 with SMTP id
 ffacd0b85a97d-43d642a989bmr632247f8f.25.1775766293023; 
 Thu, 09 Apr 2026 13:24:53 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50044sm1393632f8f.25.2026.04.09.13.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 13:24:52 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Apr 2026 22:24:52 +0200
Message-ID: <20260409202452.299708-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <8a81626c-cac7-40c9-adb1-56d8ef8b4067@cherry.de>
References: <8a81626c-cac7-40c9-adb1-56d8ef8b4067@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775766293; x=1776371093; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ABbTh+MiTWkUn1nW6j78yln9tGvwCUN5ZkN6jJK+z58=;
 b=ASSag459/R6oYADEkiWkLTAjnVycx9sO8iFdXzYT/n9d50z3ODHyQRhdEcAtXCG7e8
 Eidzf6qbF3tO5uMbBOEyS6jlbzixmeXlvthfpiflbf6dVwkucJTyZ5jV01mg9yAVlSAX
 19xrcS4JGsLqoXVq7Yq0cDf1ecJQhuf9xCODI2qNT1OXLtD4LgMoOsGD9lMmXSjIMkVB
 LxhW/YcGQNzvFl769AaJzNOV+Je/5SWWSLD1z95NEfK5RblxyuY3zEoWJ8gWYg//oWzB
 mk2B3bu4zLgXtn3/6WFyp4ueSSuLSPMLRPVWWVNDUq6hya/hSgaObRsAi6fZl4G+2UKs
 CW7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ASSag459
Subject: Re: [Buildroot] [PATCH v5 7/8] utils/generate-cyclonedx: add 'id'
 property to resolves
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

Thanks for taking the time looking at this series. Really helpful to discuss
the new features.

> Are you aware of tools that were broken before this? Would be nice for the commit log :)

None that I'm aware, I just found it odd that the `id` property wasn't used
when adding support for it over security.buildroot.org and gave it a second
look.

> My opinion is this isn't v1.7-specific but rather a "fix" or "improvement" that we don't necessarily need to have in this series. What do you think of having this as a separate patch (or at the beginning of the series so the series can be applied partially easily?).?

Sure, good idea.

> Honestly strange we have id and name for seemingly the same thing. The introducing commit was 2512eb835a46 ("#21 - Added support for patches and unit tests for JSON schema") for both and https://github.com/CycloneDX/specification/issues/21 doesn't shine a light of why for either. The only hint is https://github.com/CycloneDX/specification/issues/21#issuecomment-625104801 where
> 
> ```
>             <issue type="[ defect | enhancement | security ]" ref="7bc2d01f-a0e8-4ae2-a274-7bd188f89926">
>                 <id>18</id>
>                 <name>LDAP Injection</name>
>                 <description>blah blah</description>
>                 <source>NPM Advisories</source>
>                 <url>https://www.npmjs.com/advisories/18</url>
>             </issue>
> ```
> 
> With ID being the number assigned by npm (though you'll note that the link is a redirect to a CVE in the GitHub Advisory Database) and name the title of the CVE.
> 
> The example in the same comment for CVE on NVD sets id and name to the CVE full number, so I guess this checks out with what's implemented in this patch, so

I think you could also interpret it outside of the scope security
vulnerabilities. If a pedigree resolve something like a JIRA ticket for
instance. The `id` is the ID of the ticket on JIRA while the name is the title
probably ? That is how I interpret it at least.

PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
