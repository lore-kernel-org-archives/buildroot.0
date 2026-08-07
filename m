Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6580FC5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33A6380D8F;
	Fri,  7 Aug 2026 11:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ju8A2W4U20y; Fri,  7 Aug 2026 11:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C07E80DA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103739;
	bh=DNjqUspAKKHBRsJgZzb6KVlOm2D/F5X4RCnJ+YT+MM4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ph49WSIvfS7yx3+kaI/i6Sf4xNxa8eEIRjzitULW00G7JrQxMV9JUWQFlaplPaODl
	 oPGmqIFdSfgB3Ez1chJqGtuQCqSwlTD6IGjKExHF8ayCBLe2RiV/BRKSgTaY4IwjsX
	 kkDLUq5EN1v4BVj7XmtOm1F5aA7Kp7O+NXeOMVH9aCVRoB0J/Hrf1V1cTEvSBCz2+u
	 dtGg/QVmICjz5eTdaCcl5E/JbUQdg8UgHMVs8rPdRLe62bY84ekBHjp+l+/z9LVhiu
	 BOHW65nlsDGkw5MC31QwqZK7cHrGk6OzXDvKYKXryJtkCg5xcV1F/EwmSckvP9P6H5
	 b2BMgYycF582g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C07E80DA5;
	Fri,  7 Aug 2026 11:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8030B10E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71C0F40A6F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeliPXyy1QA9 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8110040A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8110040A6E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8110040A6E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:55:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so27007735e9.1
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103734; x=1786708534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hsaoRu1xHgHPyoRwqyH8VPIQ3p8l2Y+pDS+unCm6yr0=;
 b=AXkDMp/KJgUc65Q4Cl0u/vMdGPaadondvjxC3ajQTt1olGxgTQZugPlr48JSJmCfVX
 KFkLzIO/xXk3130ckWkg8uj2Wf1NTFk/OwnWXwGLq2axouetZDZe/iASJDhWlwqzsfdg
 J2Z+0Sh2g277TBDp+/JD7sm/KGNeUm1y5h7l1Xx/sWncmYv5rRWTIFQgj2vhjOimmt9e
 1lLS/FgmBaCx9mVBqE+9l1Pgg2ObWGeKgICa6IcC5p51VQZhN4MDqAAiAxBQ8lLMNDpR
 tjRBRdlDmNIbGHQQ/gqhV68I4v89Oa4m4m/JiFfm2mhQBKrI2PkvVieU2YDz+5vW41q4
 7Haw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpEBeuMz0d6m82tJrk5uTASPouC9tO/2t0cMcVZinhlxG6zDUobGPbytIN8wjJK6wY1FeSBjNs2sF4=@buildroot.org
X-Gm-Message-State: AOJu0Yx4TfkvJiuX/MrcTEOkSXgUvZZ1fF3035cpf+J7eMgmCETno+Cp
 1Ah1wKIjZhIxOBDqKHxk6+4u9sCuLE6MTKMzMH0yb5WmcuRgwaydH+FDvSxXuvu61hw=
X-Gm-Gg: AR+sD105tsMid46SZrlC7smMIcZSQ7awzGbgb4yjfJz/5s+J2wttYKjoO4D8Lz325F8
 yfZxelQZR4DgpcdsfjW+HABMFAongrA3J9miNPm4prgFuGloYAbi3QET4BIZ18xi8ET08H3vAH2
 Ycj02VGeP9CoCncRrqSKOBrsaEH2WG0LaouANFnBni4vDQBkXQpfPsYSvyALF20/lqCZCRERIwt
 iXj7O6w9VjLjV/5e1UgZ5OCfLN7Df3Jl9suGOjYF4YwCXC1DuVkaqIV5b9xfnE0NYP3inZPVUvI
 HG23TwJd5W96afg9hKdAKx5yKf2w/Ex9N/fVZP+hUZQfevOdIa9SQ8cp1Tt/M/+8iGj6hW3rl3z
 GQq4HkYcjZ8lyNVdZEJuLJwmGPoKl78rn3PO3uzxbAnzbUX4iPKaYd+Q7wLVyW6bcE/BI0x+WUB
 69+VDykOUcFdEspBNAMMuF420C9sao1NmS/VAAk0TZxozlsprlsyJPHw==
X-Received: by 2002:a05:600d:8492:b0:494:6baa:ccef with SMTP id
 5b1f17b1804b1-4994e7baa73mr214370085e9.11.1786103734418; 
 Fri, 07 Aug 2026 04:55:34 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4800220a6d9sm5733772f8f.34.2026.08.07.04.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 04:55:34 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Date: Fri,  7 Aug 2026 13:55:33 +0200
Message-ID: <20260807115533.97671-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <anWV0uzil1jp4BNN@windsurf>
References: <anWV0uzil1jp4BNN@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103734; x=1786708534; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hsaoRu1xHgHPyoRwqyH8VPIQ3p8l2Y+pDS+unCm6yr0=;
 b=MWwPypE97SiGOnq+OmJZYeUDVVyOYvzybgnp8brmnOQZ+FHuMoZ8IZ8tW5hU+f/GE7
 xxUQbVuI9ZCeTsWC7NjPE+P1rlcJpk0lXgGUcsKoys5+asQ/ObWjg8smDQfvcS7R7PzD
 yBX5382CUyRQni3dW8ZUNsbgnU5I8hpGWfqsIOR4zkhb1nA9oZv9tAEzYNgHdvJFRoTr
 NU+ApU5zv7fcWop9xkejMd+7tnCfb2awhE+kDZ95RPzgCMGvkCu2PgfCHs+epBiEm1Le
 vq8v3liPXjX8aiw/lAdNaytmeo8vQALEh1gl8yR8uejFtsnEDec1Fe2XNCqYgz8YSAMC
 UypA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MWwPypE9
Subject: Re: [Buildroot] [PATCH 2/2] package/sass: new package
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

Hi Thomas, Alexis,

> I am not super clear on what sass exactly does/is. But some time ago,
> we dropped all JS libraries from Buildroot:
> 
>   https://lore.kernel.org/buildroot/20250829103340.158873-1-thomas.perale@mind.be/
> 
> But sass doesn't seem to be one of those static JS libraries I guess
> because it installs some executable host tool?

If I remember correctly node-sass is build using node-gyp so I can make sense
to have it in Buildroot because the node-sass version is closely related to the
node version present in Buildroot.

The question is how do you plan to use 'node-sass' once you have the executable.
Correct me if I'm wrong but I guess the goal here is to use it in another
Buildroot package that represent a "webapp" and you run 'node-sass'
in the build step of that package and then place the generate css in the
correct location ?

The correct way handle this (and minification) would probably be to use a
dedicated JavaScript bundler and configure it to use node-sass and setup
minification. This would probably yield smaller bundles and help handle
versioning correctly for your webapp.
This was also the thinking in dropping the JS libraries from Buildroot.

If you have a `package.json` for the webapp with the node-sass dependency. Can
you `npm install` the webapp dependencies using the buildroot 'npm'
host-package without errors ? If that's the case I would say that it is
probably a better solution.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
