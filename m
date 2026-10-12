Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5DCCA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 18:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D418B605E3;
	Mon, 12 Oct 2026 18:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69N-Eu1P9guw; Mon, 12 Oct 2026 18:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A49D1605E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791830082;
	b=dytG8gjkTR1LI4OU5gFM6QYr1Kt9h1w4U7Bb0pMNfLDJcdgOdpARe1pOk3WekzuSIlT6
	 5TeWiQSfph2S0FZUqa3stkY2TnyQhdrgZ/WFeOYQ4MLxWhtgy1aIz2GhvwkOyfLvnt4rw
	 clLqFznWdgC0xE5qR3IEn2wk5ugPaomM0AyYlPSSKdq337FxmZ7i1GO46y2bZFqFS2iza
	 YQvuRvCKsBC/7Hh8AC78Ulu1XStAxUgBm7JItKwuXuU41pWMiC2aTilSOLWrIqdPV4o7B
	 Xhe3HhYXh0kmh+wREHU/G6td6LZiSQ57ZOGG85Gm4dIgQI8Fda9U2GkUaQBLwUABjvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791830082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=528bBtTcK6NDD0G1tsE5AJKR8f0L1i3cjU+p+QynnK4=;
	b=FOplny8V5AA2Fd+zupQKQpUk1/7zaGToUsxBuENJYopmIOnsgpe5qVQ3wukXbjGEel+B
	 RdUWI7ker0VCAsWQUWIB2Aha34IR546FgxCCqedNozomxrF9DP1Lj1ktO/LKwloTtf+4d
	 fWJ29HFQNM5RZinFbWKl95yuAT1iuAYyQWsZAQESPZ4kjVtYa4oklDYI4FDe+HjtyCi5C
	 ZNbCJctjyEW4z5jqaVZjdZy8uVz76ytu8dOXFRUx5XNlFblNMXC/QPI+mYgdTnp6CTGeC
	 bH3yDPhVegFZQk0tXGrX4HA2eDg0Z2RM2PsWTvoeK49jLcDUJPh1PoK1/uhPmkOs0lA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791830082;
	bh=528bBtTcK6NDD0G1tsE5AJKR8f0L1i3cjU+p+QynnK4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sIgXW2/2oT//pFY1dI5TzObN/zpXQOKPqiXWFi4aYZL+4hjHfmxHAGyFWRdw/0npf
	 2g7cYWEvW/t+Q6DJyA9PwYQ322EXupYDTdNWZcADDEwog5ADAcCBBRM5VJ8GfdbiaW
	 HN1nUafHRFkcKDqNbvhP8VxqvwrharNbzmAHO298XkQ2hxDhBNSNMM2Ox+T720Ae2F
	 QuJHfkaazc50F/AjYAOWnRP4ieoyQr+BrugkbXgiBeIlTeGNnZ8vtbxedKIoD1sl5T
	 OJjFbt/NiyNrXQ6AE0xhIFeCjgLX3o1Yzyplv2aJPWcy1qY413e7eG5qDnFJtT5Rd+
	 DkH/CsgqyZhCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A49D1605E5;
	Mon, 12 Oct 2026 18:34:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C75105
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 18:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9788680A6D
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 18:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWLG4obpxJXa for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 18:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4B19080A70
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791830080;
 b=PmI3QY9L1+g4wk56v7gHLqc037Q1Hm8ARhtM3fCm8fCyEiLXbHr6+xE8z9Qs9zTU4zKt
 pFki5OMkCdpA003bLorbO1mJSQZqk9HoxFluEvVbC5t1wK57Hu0Ims4SjpgmJJiErxSFN
 +n3ZS+88LITkSjo4025rSPW7r1hYXXZwFQ/ROdgRjbIUOTA4f2SLHthnT/++FbtkaIfNN
 m1wqQOMivlMaJcMmW3qaLQclrBxPeShebF/FC0G7VvwheqgZgiVeIvPyFvZu9KDlvDzi/
 YkhC2pwad4prjlOYQQasQQSp/5Irl+B73w6C/NfgeDXwn522WPP1v1aKbqCgtlMpnYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791830080;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=ApN1VfQbnU52qE9005HYtkS6LDWBd69jNDPIWbSECKw=;
 b=NBrFBR0X4UoNqB6A8ezLbBS5uvsG+xKQiMuzhKuTJmegp14RcNXbVd+B8y6kDb6BmRZC
 bJpIShUxns9RNpAzlnnsDHCYA6uOYMW67XAYMvzEUYgZXdycYHtMu8tSJMN+HNUa/VHL/
 4vLDHiGeStXtdZbdDrFDiWN6784tD2OlWAcvQdvVI34CpbF7DkAIfWibSKnt9OCXcQ6Jh
 4Zns5yHBWpp07XPQDOtKeEDoSzE0ClYv1y00Mbje34f2GHDUaO/xeJxxFc2DFZvjK7viV
 LEnK7P+3qq5tWr4rvvZZFEXaBikTWuuDL0hbjyUD6y5yljmzTOBEuBEVllZcTYj2T/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=d4+uuEzU; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B19080A70
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 18:34:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so18741185e9.0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 11:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791830077; x=1792434877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ApN1VfQbnU52qE9005HYtkS6LDWBd69jNDPIWbSECKw=;
 b=boEkUDXkOmsgzrCjA4Fpe/x1BcxO7CG5TBGHvORb+OLj24Y+LWchFnm4/MhTEY/UK9
 YXLtIJB/r8U8SMjuNae1s5iRRbR0sn8z9mcZLb8feQa0EX1PKDs+8t46EoRm3ACfF+/I
 yuy+ahxOfIj3OzPzDhpsDTLo+tuEsCsSdGFFUtWsD4eGYb987jwHb+RxhtXS4M3D8b5d
 JkgewABKMgNMS4mvIt1STeGjjhQ2wphOALdMgXT110+z1PIFyosbBAGyd3aNwWihdyCL
 8dF1aNijXafNUeVBKh/d8sbVyuXm95H5Vt5iw50kYc92lrQqKh9eWtjqLepXet8d7S/S
 sXww==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdPWF2RJNLycMUf2tmcSXC0oTU4BAh0y/QJdXRZejPe3dHtjZUirKUE0zhOMDKvbst2QbkhB7uxK0=@buildroot.org
X-Gm-Message-State: AFq9FYJuLhBzxUdjrEgnrTtCPtx3wiLw+EaF++79LsfegcLzgh0CY/wx
 dZEm28Nt7PLCrwzefzJVkjAOtzKQCKMC3GbaYNYuZPE58l/GiG42PMy3BDvogysg5Ng=
X-Gm-Gg: AYBFou0ptzUPoZhZDXtEkkf2/trBI3WCEgOquvLvAoP5qae2hODnEDcZDs5+Q+Gm5px
 C8lXpgsGLq8/cdg4AaBBiB6QdPxCtzktwn/9rGUjv6qy76+K7Uo04DWh2+VXCUj+i9OmOgkS2f5
 Kk8Pi7OyxqKrbE4UNAACEkDo3535OmKeGiA+jaVwmjBtyfKumXUhi1hNxHQ2BMjHFmhFIIskTlT
 N7FhvuLj/BKh6JRvdvcLy7UTVdaABCdSceyULshyQ9neVoxME6rCSAizk3xT1DEfI/2EablXKju
 Eteu6hlavpiUPGkPTLEqmSuE0oetGpVQ9cyf4qhXcVGrhdOXVpKK7Io/FhLY7G82IEsvmU7meAO
 xJl4LjEP4oi38hKwmGjgUtr3occYmfLjKRPbuVTsxy3p2vqgp9e+Q5FasNmQQHFxLu2ci1TrHqh
 QNlvGaSt3xLQOCSSCclrD886zqmHKXpNG5RFat2BPlAgkHq0AfA5ORHoFkAHZcBOc=
X-Received: by 2002:a05:600c:8b65:b0:49e:6683:d23c with SMTP id
 5b1f17b1804b1-4a18e3ef1bdmr182575665e9.0.1791830077317; 
 Mon, 12 Oct 2026 11:34:37 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaa608sm843612f8f.18.2026.10.12.11.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 11:34:37 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Mon, 12 Oct 2026 20:34:36 +0200
Message-ID: <20261012183436.83398-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <baaef26b-36cb-4c0f-8b90-32fca12548f5@gmx.de>
References: <baaef26b-36cb-4c0f-8b90-32fca12548f5@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
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

Hi,

In reply of:
> Hi Thomas!
> 
> Am 12.10.26 um 17:41 schrieb Thomas Perale:
> > I'm thinking again about potential solutions since the issue we brought
> > upstream remained silent :-( [1]
> 
> Yeah, I checked that too before sending this series. :-(
> 
> > Do you have a slack account to give it another try there maybe ? (I don't have
> > one sorry)
> 
> No, I don't. I guess we could poke that discussion again?
> 
> > I think the actual proper solution to this is the following. Given an external
> > named "br-external" that has the package "foo" and a "buildroot" config that
> > has the "busybox" package enabled:
> > > ```json
> > {
> >    "bomFormat": "CycloneDX",
> >    "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
> >    "specVersion": "1.6",
> >    "metadata": {
> >      "component": {
> >        "bom-ref": "project-name",
> >        "type": "firmware",
> >        "name": "project-name",
> >        "version": "project-version",
> >        "components: [
> >         {
> >           "bom-ref": "buildroot",
> >           "name": "buildroot",
> >           "version": "2026.08-891-ge17cfc9b3b",
> >           "type": "firmware"
> >         }, {
> >           "bom-ref": "buildroot:br-external",
> >           "name": "br-external",
> >           "version": "...",
> >           "type": "firmware"
> >         }
> >        ]
> >      },
> >    },
> 
> Moving the Buildroot repository/version info from metadata.component to an element of metadata.component.components makes sense, if we want to leave metadata.component fields for people to provide info about whatever they are building using Buildroot. Then we'd need to provide some way to supply that info. But in any case I think that's independent of external tree info. :-)
> 

Yes we can discuss that part later. Because I have multiple option I need to
lay down to think which one makes more sense.

> >    "components": [
> >      {
> >        "type": "library",
> >        "bom-ref": "busybox",
> >        "name": "busybox",
> >        "version": "1.37.0",
> >        ...
> >      },
> >      {
> >        "type": "library",
> >        "bom-ref": "br-external:foo",
> >        "name": "foo",
> >        "version": "...",
> >        ...
> >      },
> >    ],
> >    "dependencies": [
> >      {
> >        "ref": "buildroot",
> >        "dependsOn": [
> >          "busybox"
> >          "buildroot:br-external",
> >        ]
> >      },
> >      {
> >        "ref": "buildroot:br-external",
> >        "dependsOn": [
> >          "br-external:foo"
> >        ]
> >      }
> >    ]
> > }
> > ```
> > > The metadata section declare the project and its core component (buildroot +
> > externals), as its already the case with your patch. And then the dependencies
> > express what are stored in which externals, as its already the case for buildroot.
> > > I actually think that solution makes a lot of sense, even though it's not
> > obvious by just looking at a component to understand where it comes from.
> > But as we discussed previously nothing seems to fit that requirement in the
> > component definition yet...
> > > Again I wish I could give you a definite answer on how to handle this,
> > what do you think about this solution ?

> I think dependencies are the wrong approach. I guess you can see an external
> tree as a dependency of the overall build, but recording packages provided by
> an external tree as its dependencies doesn't make sense: the external tree
> *provides* the packages, it does not require them. It's about origin of
> components (packages), not dependency between components. If I define a new
> package in my external tree and it later gets merged into Buildroot package
> dependencies don't change, only the origin of that package.

I understand your point but the same logic apply for the 'buildroot' meta-component
it also provides a number of packages but in the current implementation all packages
Buildroot provides are registered as dependencies.
How I understand it is: "to have a full buildroot build the entire list of packages
listed as dependency is first required".

I used DependencyTrack to kinda validate this behaviour. They have a tree style viz
of your project. To have it work properly with all the packages available under it 
you need to add this dependsOn to all the packages similarly to what I described in
my previous email:

https://pic.infini.fr/IkWJ9c5X/M9EqMt6b.png

I think this is the kind of view we would want to achieve to show the hierarchy
of the project with externals ?

> I'm also wary of encoding that origin information in bom-ref, as your
> proposal does for packages. Bom-ref is supposed to be an opaque identifier.
> Nothing against making it human-readable instead of a UUID or other random
> string, but we should not use it to encode information that should be
> machine-readable.

Yes here I just used as a way to improve the readability but I don't think
using an uuid changes the logic of the proposal.

> Where we're in agreement is that CycloneDX doesn't really have any suitable
> fields. That is why I used a property (where we can define our own), and
> suggested in my cover letter to register a CycloneDX namespace for Buildroot
> (which implies publishing property definitions). It's not as nice as an
> upstream field for "package repository" or similar, but that doesn't exist,
> and with a registered namespace it'd be well-defined, documented, and
> findable from CycloneDX documentation (and it'd let us clean up the current
> BR_TYPE).
>
> Best regards,
> Fiona

Best regards,
Perale Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
