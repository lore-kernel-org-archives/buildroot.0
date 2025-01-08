Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61390E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F2F80B34;
	Wed,  8 Jan 2025 20:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxhQGVqDsxVE; Wed,  8 Jan 2025 20:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A9B680AE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A9B680AE1;
	Wed,  8 Jan 2025 20:59:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9CAF1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A64DE404AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsHsu7zrV74P for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC5C240482
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC5C240482
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC5C240482
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 60AD61814B9; Wed,  8 Jan 2025 21:59:29 +0100 (CET)
In-Reply-To: <CAOiXNkAc2J9q8GkkweddmNQuBS-0L+RuGYvh4Ug94rOX8+C_GQ@mail.gmail.com>
References: <CAOiXNkBXaWBGL7D2FAbs+HQ-CQvF6Gt3Xw3s3Zr8T8Br5AvoBA@mail.gmail.com>
 <be38d9eb-4d8d-4da4-bc94-e4093a79c206@mind.be>
 <CAOiXNkDqh6Q=s4o8u0SapkcajBKE=Sdd-X312N61P6md2v2EVw@mail.gmail.com>
 <CAOiXNkAc2J9q8GkkweddmNQuBS-0L+RuGYvh4Ug94rOX8+C_GQ@mail.gmail.com>
Date: Wed, 08 Jan 2025 21:59:28 +0100
To: "Andrey Nechypurenko" <andreynech@gmail.com>
MIME-Version: 1.0
Message-ID: <609c8-677ee700-5-6f236100@144340327>
User-Agent: SOGoMail 5.11.2
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; t=1736369970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ao7Sb6Vmxgbbt/K+ginsrUQWYSFQ3GZOL71SYW5kpw=;
 b=Kwya8LqQtMfJy0ksCRL8Pvb116Dc1xm0CvtJ7isF1oMQgLEFLaqVZb9KzPwTPo/eDsdyhU
 ZOQZ07X0Iq0/kouF9+wsA2QgG2YkYCSRl8gVv+ciNL7cGpL2VBg4DUAnnnuPWYaSOZ9K4b
 Gpqfr++kFN/LJ+7NdHQo1l7IhMUCtOs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=Kwya8LqQ
Subject: Re: [Buildroot] 
 =?utf-8?q?Problem_compiling_grpc_package_with_BR_202?=
 =?utf-8?q?4=2E11?=
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
Cc: James Hillard <james.hilliard1@gmail.com>,
 Robert Rose <robertroyrose@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrey, Arnout,

On Wednesday, December 18, 2024 17:18 CET, Andrey Nechypurenko <andreynech@gmail.com> wrote:

> On Wed, 18 Dec 2024 at 13:09, Andrey Nechypurenko <andreynech@gmail.com> wrote:
> >

> >
> > -- Configuring incomplete, errors occurred!
> 
> This problem is caused by the fact that the protobuf package is built with
> autotools and not with cmake. Grpc package was looking for cmake files from
> protobuf and did not find them. I was able to solve this problem by changing
> protobuf package type from autotools to cmake (plus a couple of other minor
> changes). I think this step makes anyway sense, because it looks like the
> newer protobuf versions does not support autotools anymore and moved
> completely to cmake.
> 
> With your patch mentioned above and the following changes I was able to
> build the grpc package.
> 

I think what you probably didn't see and Arnout didn't point out explicitly: the linked grpc patch was part of a series 
https://patchwork.ozlabs.org/project/buildroot/list/?series=431795 which also included the version bump of
protobuf.

I'm not sure why the last patch revision wasn't picked up yet.
But indeed the currently applied state of "only bumping libabseil-cpp" breaks grpc in 2024.11 and master.

@Andrey: Could you maybe try to apply the whole patch series and see if everything looks good for you?
@James: Do you know if there is still something open for v5 of the patch series? I don't see any replies which would prevent a merge...

For the 2024.11 branch I would suggest to revert the version bump of libabseil-cpp which Thomas applied. As it alone brings no advantage
and breaks grpc (its only real dependant).

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
