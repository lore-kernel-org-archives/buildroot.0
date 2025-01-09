Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF0E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 15:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E59D405E8;
	Thu,  9 Jan 2025 15:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9pceGER1oGH; Thu,  9 Jan 2025 15:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B8B14060E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8B14060E;
	Thu,  9 Jan 2025 15:07:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24422942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05B1180CA1
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koGm9rFQpjqY for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 15:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2B5B80C9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2B5B80C9B
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2B5B80C9B
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 15:07:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id D0F531814B9; Thu,  9 Jan 2025 16:07:51 +0100 (CET)
In-Reply-To: <609c8-677ee700-5-6f236100@144340327>
References: <CAOiXNkBXaWBGL7D2FAbs+HQ-CQvF6Gt3Xw3s3Zr8T8Br5AvoBA@mail.gmail.com>
 <be38d9eb-4d8d-4da4-bc94-e4093a79c206@mind.be>
 <CAOiXNkDqh6Q=s4o8u0SapkcajBKE=Sdd-X312N61P6md2v2EVw@mail.gmail.com>
 <CAOiXNkAc2J9q8GkkweddmNQuBS-0L+RuGYvh4Ug94rOX8+C_GQ@mail.gmail.com>
 <609c8-677ee700-5-6f236100@144340327>
Date: Thu, 09 Jan 2025 16:07:51 +0100
To: "Michael Nosthoff" <buildroot@heine.tech>
MIME-Version: 1.0
Message-ID: <66f08-677fe680-3-7be8a200@217949933>
User-Agent: SOGoMail 5.11.2
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; t=1736435272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxQuy8OnM6cw6fMgKou9IpYkNoR6TwksbSIsVoAeoVU=;
 b=dhbhDl3aRk7vKTxHSS9yeVh4lbjHZwhl3Pz4fA/eNoqueOytnGs47qJM8EjS/Phw1YEQZy
 S+EWTF9uYpHzTZsVkkfx8RCaRgcWyDuc7RE4Tw4TUORiVjpyKz4dNIluX8QgdNFdxzNHn1
 xHcEmd+veU105wDs1+pjPKZr6hH4GRU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=dhbhDl3a
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
Cc: Andrey Nechypurenko <andreynech@gmail.com>,
 James Hillard <james.hilliard1@gmail.com>,
 Robert Rose <robertroyrose@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Wednesday, January 08, 2025 21:59 CET, "Michael Nosthoff" <buildroot@heine.tech> wrote:

> Hi Andrey, Arnout,
> 
> On Wednesday, December 18, 2024 17:18 CET, Andrey Nechypurenko <andreynech@gmail.com> wrote:
> 
> > On Wed, 18 Dec 2024 at 13:09, Andrey Nechypurenko <andreynech@gmail.com> wrote:
> > >
> 
> > >
> > > -- Configuring incomplete, errors occurred!
> > 
> > This problem is caused by the fact that the protobuf package is built with
> > autotools and not with cmake. Grpc package was looking for cmake files from
> > protobuf and did not find them. I was able to solve this problem by changing
> > protobuf package type from autotools to cmake (plus a couple of other minor
> > changes). I think this step makes anyway sense, because it looks like the
> > newer protobuf versions does not support autotools anymore and moved
> > completely to cmake.
> > 
> > With your patch mentioned above and the following changes I was able to
> > build the grpc package.
> > 
> 
> I think what you probably didn't see and Arnout didn't point out explicitly: the linked grpc patch was part of a series 
> https://patchwork.ozlabs.org/project/buildroot/list/?series=431795 which also included the version bump of
> protobuf.
> 
> I'm not sure why the last patch revision wasn't picked up yet.
> But indeed the currently applied state of "only bumping libabseil-cpp" breaks grpc in 2024.11 and master.
> 
> @Andrey: Could you maybe try to apply the whole patch series and see if everything looks good for you?
> @James: Do you know if there is still something open for v5 of the patch series? I don't see any replies which would prevent a merge...
> 
> For the 2024.11 branch I would suggest to revert the version bump of libabseil-cpp which Thomas applied. As it alone brings no advantage
> and breaks grpc (its only real dependant).
>

I created an issue for better visibility: https://gitlab.com/buildroot.org/buildroot/-/issues/83

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
