Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB681C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9529681FB2;
	Wed,  4 Jun 2025 18:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K3se7MwzzXv; Wed,  4 Jun 2025 18:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D13AF81FD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D13AF81FD6;
	Wed,  4 Jun 2025 18:57:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D35B1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 537C8608D1
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iev7slBfrVne for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AB006080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB006080E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AB006080E
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:57:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 405321C00EF; Wed,  4 Jun 2025 20:57:53 +0200 (CEST)
Message-ID: <83d30ce1-9a00-4ecc-8ff7-906ae968be70@rnout.be>
Date: Wed, 4 Jun 2025 20:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Nickl <stefan.nickl@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <CACXRmJjfEMb4zGfoWxbDLsV4aw7a3cp+PiJXRuE9kdfKYUmOcQ@mail.gmail.com>
 <f20a8e9711025d8cebb71b8b0d93ece783e9be50.camel@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <f20a8e9711025d8cebb71b8b0d93ece783e9be50.camel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749063473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iwgvXyb1m/gcxbtG14Mv1mVEfma10TCIvy/LosDVKMw=;
 b=Gd0Vruj9gM1m6UNl38cTAYxsEIMLMAATsQZZFzlL9INxxpw7fs/7eC6kGjA+HkE0TImdpT
 vIEewA3Dh/4Tab0I71v08KJoBz8wn5DxkMo/oRb5kb5V6O+NReIPdI8w1GCvA6V9KKaARx
 XWrDofQ9h3UfbSU4n4mLBu4pexaQWLeVCkzqKz4CqyVwTc7HhHD90nmw2g0nKttR9spWIF
 1k6kqI3/Uk2b1f+o0PIkwoWfYrXzVcg2uKLtfl5zzvU7WOlhWTHRPHHbGPPmh4ARzXlCAC
 62//IlE/VzSOhcwJnaLAdN7LAShch4yO9HMSfjuYODNgkzWP9XdA3X6NPr+mjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Gd0Vruj9
Subject: Re: [Buildroot] [PATCH 1/1] Add gh site method for GitHub cli
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 31/05/2025 19:05, Stefan Nickl wrote:
> On Sat, 2025-05-31 at 09:45 +0200, Thomas Devoogdt wrote:
>>>> The main advantage is that it also works for private GitHub
>>>> repositories after logging in with "gh auth login".
>>
>> If you have to call "gh auth login" on your server, why don't you
>> call "gh auth setup-git". This command will register a helper script
>> to your global git configuration, doing exactly what you want. Namely
>> adding the relevant headers to your git https calls.
>>
>> https://cli.github.com/manual/gh_auth_setup-git
> 
> Thanks for the advice, but what I really want is a canonical archive
> download (and I think the corollaries to that with github have been
> sufficiently discussed before) instead of git clone.

  ... Except that github themselves claim that the archive should not be 
considered canonical. In practice they have made sure that it doesn't changed up 
to now, because when they changed it some time ago there was huge pushback 
against it. But there's no guarantee they won't do it again.

  Because of that, we actually want to move away from the github helper and 
instead use git downloads.

  Regards,
  Arnout

> Regular "FOO_SITE = $(call github...)", no expensive local clone
> operation, no br1/git4/git5 files etc.
> 
> Cheers, Stefan
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
