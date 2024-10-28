Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C09ED5B146
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 212C460A46;
	Mon, 28 Oct 2024 20:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0_pQYbmbx5S; Mon, 28 Oct 2024 20:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3416460AB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3416460AB1;
	Mon, 28 Oct 2024 20:25:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3814A112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18BDC4092A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 331m83Ow2m3a for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 890AA4094C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 890AA4094C
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 890AA4094C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:25:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 972241814B9; Mon, 28 Oct 2024 21:25:17 +0100 (CET)
In-Reply-To: <20241028211103.67456028@windsurf>
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
 <20241026162759.0100482f@windsurf>
 <CADvTj4poUTwYNeVK63EkZHKyYZ9BWAnVMNv9jOxcd-0guH+wAQ@mail.gmail.com>
 <20241028211103.67456028@windsurf>
Date: Mon, 28 Oct 2024 21:25:17 +0100
Cc: "James Hilliard" <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 "Marcus Folkesson" <marcus.folkesson@gmail.com>,
 "Kamel Bouhara" <kamel.bouhara@gmail.com>,
 "Marcin Niestroj" <m.niestroj@grinn-global.com>,
 "Asaf Kahlon" <asafka7@gmail.com>, "Julien Olivain" <ju.o@free.fr>,
 "Woodrow Douglass" <wdouglass@carnegierobotics.com>,
 "Christian Stewart" <christian@aperture.us>,
 "Robert Rose" <robertroyrose@gmail.com>,
 "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <510ee-671ff300-3-7df32680@245310681>
User-Agent: SOGoMail 5.11.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1730147119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fv/FwvzV63E0OlHO+mL3KImCZqzPYFQWKjuBTc+8zPI=;
 b=hEAHJry9g/lumGdT0V5CI8NK3whjeGNQMK2lh4SqRWwBBDgvCd6HWlBX+8RBhiFuFQXxq9
 FrxBkp4JGPFovcNnYowDLZ79BhAqGdOXpAAyrY3zCJoPyQeGpABNRP+NJNXwl0Izwg/qYg
 O3fWu1pqev4V7eK1LdExS+sd7bppzDI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=hEAHJry9
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v2_1/3=5D_package/=7Bpython-=7Dpr?=
 =?utf-8?q?otobuf=3A_bump_to_version_28=2E1?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Monday, October 28, 2024 21:11 CET, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello James,
> 
> On Sun, 27 Oct 2024 20:57:32 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
> 
> > > make[1]: *** [Makefile:1567: protoc-c/protoc_gen_c-c_bytes_field.o] Error 1
> > > make[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/host-protobuf-c-1.5.0'
> > > make: *** [package/pkg-generic.mk:289: /home/thomas/projets/buildroot/output/build/host-protobuf-c-1.5.0/.stamp_built] Error 2
> > >
> > > This is on a Fedora 39 system, gcc 13.x.
> > >
> > > Could you have a look? Also Michael Nosthoff reported a separate
> > > (weird) pkg-config issue.  
> > 
> > Yeah, there's a pending PR that appear to fix this:
> > https://github.com/protobuf-c/protobuf-c/pull/711
> 
> Which of the two issues is this fixing? I was reporting a build
> failure, and Michael Nosthoff was reporting a build hang in pkg-config.
> 
This should fix your issue. My issue is also fixed in the new series by bumping
pkgconf. I'll send feedback on this separately.

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
