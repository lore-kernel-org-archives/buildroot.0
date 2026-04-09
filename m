Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77428F364B6
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A48CB41016;
	Thu,  9 Apr 2026 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74PD0D1PizMV; Thu,  9 Apr 2026 20:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A83B40CBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775767334;
	bh=b3Ju6ByMR2uaPWLL7Ps2XckxCee4BN2kHtcdNi8I41w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F8+PHmzaT+DmyKHu0A2LbfyLfe4d4po53dEZAv3kiuwmXV+Muxjo01iBisF96q7T1
	 yvW059xm+fAw17MRS1UpMlf/9hXeYpRrpbR0S2yFFov7Qtx/T/U1yhKzo6k5TQVx4G
	 cs0i7qUZ2pxZX1KFhLV7BXXfmcig4lwdap6PMfKGWFuLylizSbiFwDo86RSZhqmksy
	 oeoawf7YBSn3hxTNkdcwUc4EdlXShayn2mAzPEV+EahBCMMAY/dwzVhBYiL9BokdSp
	 9D9staXYwYG4ZZd2JhGgQnsnIpmOCXgBb3UGOXVk0L4ibVm1bMIyJe2GjDqwTqSyFA
	 NEdNUZpLhlvVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A83B40CBF;
	Thu,  9 Apr 2026 20:42:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85592237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 774D5404C3
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsvDKG4d_Ahg for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:42:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71D02404C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D02404C2
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71D02404C2
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:42:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488c21c636dso7913525e9.2
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 13:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775767330; x=1776372130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PxYqsQNIoDDnLCQp7wTPsS/kNKNZK5UvUGStECTCUEo=;
 b=TNGwxXEDMYMEoUhNb0gPj7YGeFm5qtiLe0qA5SZZuhPAtUdIfdHprNKAo8sqtWh/eH
 IJw/Nq7iXNUUHMagE3Dq7gjsQ6pbaKbrGqlykZya5uU3OY/vD1FcZ82BsD18OncIZvjI
 DIgZiPuZ+EGKfHq6aSL4D91BtJ01Dkwh9dAF4roISqKkw4Ic47dcRiBLrOD7mI1Hm0pi
 uQlQhqeUzASjRCTgsNLp2tLbOFWqrett5Bqr/WvEhJxMJ320n+VvJQ3A5QTgNKpLykpl
 hjT74/wSwwMle3xfspQXhA/4I/DzOpcIYDnm6WfAHjZdnGNiaTaaoDJF0dokLXIfceoG
 VLPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXd39s1iJZRb68b+XcReruM7+5Hu3kxOPIAvguXArb0U3Fmjug7IjNuiMrFdONr7Up7t6T5kuSTMU=@buildroot.org
X-Gm-Message-State: AOJu0Yw/9rR4Ich5lrqQn5aSpQ56cEBHFLjWH8Huxs+QxNvDmQxaqMNG
 lZLwY9W1O0me5skrO+IsjLRj9HjPOuafF3JySpBLc7xHZBKf+PUYM4Ma1+h2yLmano/YKuACuiM
 kYaSCjig=
X-Gm-Gg: AeBDiesliF7ehSu1fqSxOwINdBxjux/aNaIxRppSfkhEdAh0IBBl5ZWtpRrh/OAMCMo
 5ogHEa1AsX5plm9h5EiR4m6PGuYL0zR/Rxd/w61N6YXRpMHJVzE1UxW+5RRjKaqMc+Zv7NELYEo
 N22tR/aQ3xxX9tBIh48krpkS1krw7MQrdmvzLv6U3+ru+CEfrpMsm9fZ4LRD7cl+VcN9/XJ+An0
 +IPFMN8bULIp6DMRyu3V06r70aKwx1UOcT6QQGVfNax/e1auK4FvoJDRuewQ6FHbQ8nBDonx6gr
 5V+UnASGo7K8kjqtcF4fFH7Yfntfr3aMB/4eDCKw9EANOfmBJU33vppOYcLCYSy6UQQpsA2G4Ju
 /uQQuJu2ey3d6sMksIph4cEsFsdwiVUVNV1QFW6rxBhJAyQIk8x2060rJOKRaRwbrOmwDy3w3p7
 jxPi+PBA+OD8CPAu7n
X-Received: by 2002:a05:600c:3f0a:b0:488:afb5:6a21 with SMTP id
 5b1f17b1804b1-488d68764b0mr3360235e9.15.1775767329935; 
 Thu, 09 Apr 2026 13:42:09 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d67b46ffsm2962525e9.6.2026.04.09.13.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 13:42:09 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Apr 2026 22:42:08 +0200
Message-ID: <20260409204208.302842-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
References: <de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775767330; x=1776372130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PxYqsQNIoDDnLCQp7wTPsS/kNKNZK5UvUGStECTCUEo=;
 b=GZ0+bOAH7VPEF5ICsMhnX1mb+HFVISN7sYVHtqgUh5LAw4zTu2kpVVsOEfsjYSakK+
 Vkq6Zu0g9/NDETKSDL+YQlj73SnMMZxFuj8Oa3zeHPBe5Rqh2eZ3rnc/RuRKKWJP0RQq
 nA0a5kkXUkupf71vVS1vSF+M5yCMQGfCxTYNVOED+ZjU2R8/qAj4dXbkmM4C/J9GKaeH
 j0rfLW5uPwCcXNTe1u3XzOfo0+n422Vf4953GffS5WgCynkMrgKk46U5zM2oaFUe8k96
 9QJx6I/0KHeeSuf93Wd679iRS3yw06xHhRXX3eudty+Xf9AAovqq/lA0j0SfpaVJSFOC
 jgIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GZ0+bOAH
Subject: Re: [Buildroot] [PATCH v5 6/8] utils/generate-cyclonedx: mark host
 packages as external
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

In reply of:
> Hi Thomas,
> 
> On 3/11/26 3:04 PM, Thomas Perale via buildroot wrote:
> > Mark Buildroot's host packages as 'external' with the 'isExternal'
> > property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
> > property like the following [3].
> > >> An external component is one that is not part of an assembly, but is
> >> expected to be provided by the environment, regardless of the
> >> component's .scope. This setting can be useful for distinguishing which
> >> components are bundled with the product and which can be relied upon to
> >> be present in the deployment environment.
> > > This fits the usage of 'host' packages : a package provided by the
> > environment and not bundled with the target.
> > 
> That's not my understanding. None of the examples provided in the GitHub issue match a requirement on host executables (in the context of cross-compilation).

Couldn't find any example that would suit the Buildroot case as well.

> They all are related to runtime dependencies (dynamic linking, interpreters, hardware-limitation (which SoC/CPU can this run on)) you need to use with the binary(ies) associated with that SBOM.
> What Buildroot generates is likely self-sufficient?

As you said, I think this property was mostly added to support dynamicly linked libraries. 

> A Buildroot SDK is kinda different, but then the host packages wouldn't be external anyway since they would be part of the SDK and thus "internal".

If you need to create an SBOM of the Buildroot SDK itself indeed that would be
a completely different "point of view" for the software and would require a
different logic. 

Is it something you are trying to create ?

> Do you have a different reading of the spec on this? (We just started to look at CycloneDX generated by Buildroot so I wouldn't trust my own gut-feeling on that :) ).

As you said, I don't think they have taken into account the use-cases for
build-systems. It's mostly an interpretation of the spec that made me add this
property.

I saw other implementation use the `scope: excluded` property but imo it make
less sense.

According to this discussion: https://github.com/CycloneDX/specification/discussions/712

For `isExternal` they mention: 

> This setting can be useful for distinguishing which components are bundled
> with the product and which can be relied upon to be present in the deployment
> environment

If the firmware you generate with Buildroot is the "bundled product" and the
build-system the "deployment environment" I found this property to suit well
our use-case.

For the `scope` property they mention:

> "excluded" - Components that are excluded provide the ability to document
> component usage for test and other non-runtime purposes. Excluded components
> are not reachable within a call graph at runtime.

The "other non-runtime purposes" part could also suits the "host" package
definition I guess ?

It's all interpretation so it's good that we have these discussions :-)

PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
