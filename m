Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F5ECA9ECA
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F7540562;
	Sun, 11 Oct 2026 19:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTEH5c_E14GF; Sun, 11 Oct 2026 19:30:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A8FB940567
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791747009;
	b=nAW6Tp/HVyeWQ4WsHomWDqF6wO3SgM6GnDmzRiaZbAcWlcVjkKE7ihzvRmZUTC+88AZN
	 aRHmuqbFzXKsjEEyW9J4ETsB7w8BxDICC86kVCpjt3tgGfVzHSnaatbZM5dOUMP5IKaCV
	 fQCsNQk6xH5DAbRFaimvsslVBYgaPZf7mfzz/qXyepSU+mHCsFcneF1/mnE6LFBVM6HEw
	 d5htfFEfher6AKC2dDW2lEqB1cFeVB5YqKz0Gmf2/mcxPsSQLrh7nsqjJWrtBQ4WAX2v+
	 t9wy3KVFyzmrOSfWTofcKCDsRLs4YturdwJWHbL3cNy61yDfusjee8pNJkjkx9EfMQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791747009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=ZXyxVe9VMrm9k9vI7jYV2uBhi5jwoOgqZN3kNAVcTrA=;
	b=jlGTFke3m8RWYToeiVCnTUJUWPiebT+DCECw1m+CPCd8vwGhYfL6Pge8uo4/rcbsFN1E
	 Pc56i/B0nBMqxJMadzkWZcaM04izLBXny2GyY9zf26zgcMycv8IofGHPMq24abVMlkeyy
	 VSCpXztQ9NLFYYYuX7tbKLiWDwJDaoqKh/ph7MA4a/lwMvfTrCxED7HmTEEMt1gOn0MgZ
	 FbtP9kfmEWJ06uxIpp4gaplpxLELTjxMRIgalpuq9fE3Nv4PgenLDNaHcKggyXGqeOO5i
	 JdI4we5jbMhZ/4t4yluGcUGmyVKsnLNHr5mWR8Rb6qYcIZoiLqg9KSLcZ17MkwNE9/Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791747009;
	bh=ZXyxVe9VMrm9k9vI7jYV2uBhi5jwoOgqZN3kNAVcTrA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gCg3Z1sQ4hQ0gX35d/1nBf8NKlZCFEWKBlfpKZDhPBVNIQ7OgYm29sjLjaxfYlPiy
	 XJo4tAHa2+u71w7xvCQgt84n4Q4xLHW2cvnbHJ2WSxZ4+lBwvqf6Oa+lbetOAgZj/j
	 l+CN8/UlwRUm/nBVd7QifP1Yc4nFbBwUvVAGMQj859RKqyirQPns+Dc7Cg2bNlkPx+
	 FtCgwQrprK6n++Z/Aukw1eBZy5BdFUUmVPj9cA6YeosIQHhbzuoKAHW3kx4GjHojWR
	 cv/klYP1kvaXk80XQSSH10nM/vNbQzp8GL1ic4Xc50o62NaFZgHvVHWaQj1Am1fdCr
	 qXlr4af1pCnhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8FB940567;
	Sun, 11 Oct 2026 19:30:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C98EE2E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF2F280CA6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-KtIwTwTnrF for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:30:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BB20880CA4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791747007;
 b=nuMtiASV2SlkOsUVmq286Job32+MCCzZGUEe2FxsuvPJYR5kgqGzyDTVxmYPdjaVczJQ
 1o2jI9HJX0aBN2af+D/3qd2fdNEAYF2wh6a61Im2DujjXEdmTHpgX9R6StP4Y3ejdbasa
 /SOjotgyvzwXtz49QUo7WPK8DVNnWq/N0yX1gIKmBJOMvhPn9r61ZLR3oWpTllRlUFu6J
 eDGns5A+MB0p2jR/y7R7vCbG0HrKuDh2iml8lIsNOYRRLkO4xjACQnDHQHgDWZRIPsvSI
 FHGELIrAkx5kPwW33icLofoCv+ukPzs5A9S1MklVbskouJhM0/YPApaZXJsIftE8R0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791747007;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=UVqZJvg6w+yy8g+7ler6l5mJBpJy70TYrmDl75vGslo=;
 b=cRp5PSumpjB5M9qk+OlO8+pQEjn/vrSsjyAOvxDOi/dsEdh8VirkKhJtVdedTZFpKzIE
 3Qo3hTNJZidEM5YjHmw+5D/8exr/LVbZ8mgsFsdPz13EIl4Lytc9IKGEVOeH5Sr71UWBb
 KTaLJov0K3aF0WNV4+4xyd8QrKF7Fi5wibaP0K5LUhkot0n8Xbtypff3rO9SEEVt14CSb
 2QOAwDNySdi1Y4dj0XHws+46VI5hH48xW0xCns/vdWI3YBpx4YimisYGJ3XKzHPI6NAUS
 jvnNHaUEdNYrLHUwQmbSqXvr0y3p7JgkDyPD8QRG9vR4RppAYyC7FWk5xQT0MRUUpbg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=bykEt7GV; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB20880CA4
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:30:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63463B97A154; Sun, 11 Oct 2026 21:30:00 +0200 (CEST)
Message-ID: <e6aa6ef2-a36f-41a0-9183-50e6bf836f68@rnout.be>
Date: Sun, 11 Oct 2026 21:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>,
 Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, git@jdknight.me, thomas.perale@mind.be
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
 <877bjo425e.fsf@tarshish>
Content-Language: en-GB, fr-BE
In-Reply-To: <877bjo425e.fsf@tarshish>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] configs: update defconfigs with custom
 versions to BR2_LINUX_KERNEL_LATEST_X_Y
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



On 11/10/2026 18:45, Baruch Siach via buildroot wrote:
> Hi Titouan,
> 
> On Sat, Oct 10 2026, Titouan Christophe via buildroot wrote:
>> Update all defconfigs that are using a custom Linux version based on a
>> longterm supported Linux version so they use the newly introduced symbols.
> 
> This is a significant policy change for Buildroot. The configs/
> directory is meant to carry configurations that are "known to work",
> according to adding-board-support section in Buildroot manual
> (docs/manual/adding-board-support.adoc).
> 
> Automatic update of the kernel component without actual hardware test
> risks introducing regressions that make the system unbootable.
> 
> For this reason adding-board-support section also says:
> 
>> Always use fixed versions or commit hashes for the different
>> components, not the "latest" version.
> 
> If we intend to change this policy I think we should discuss the
> motivation on the list. In case such discussion did take place, this
> comment should reference that discussion. In any case, the manual should
> also update to reflect the current policy.
  It was discussed orally during the developer meeting, but you're right that 
it's something that should be discussed in public as well. Consider this the 
start of that discussion :-)

  There are several reasons that we thought this was acceptable.

  The current situation is that defconfigs contain a known-broken kernel 
(because every stable update has bugfixes). Also the assumed testing is 
typically very minimal, i.e. it is tested that the board boots. It's possible 
that e.g. networking is broken and the contributor doesn't notice.

  Similarly, we do already update the toolchain and busybox without testing if 
it still boots. Of course, you can argue that that doesn't mean we should be 
making it even worse.

  The other thing is that we can kind of trust the kernel stable process to 
avoid breaking things - or at least, that breakage is going to get fixed 
relatively quickly.

  We also have to face the fact that most boards are rarely updated. It's not 
super easy to update the board's kernel because you also have to update the hash 
file. And because of this we have different hash files all over the place. So 
users are facing a very old kernel. Not exactly the best out-of-the-box 
experience either.
On the other hand, in the current situation at least the user gets some info 
about which kernel version is supposed to work, and it's relatively easy to 
switch to one of the stable kernel versions. This proposed change takes away 
that information.

  Another benefit we saw is that at some point a stable series goes EOL, so the 
corresponding option is removed from linux/Config.in. We can use that occasion 
to also remove stale defconfigs that still use that very old kernel. But of 
course, it's easy enough to do that without this option as well.


  Now that I've written all of this down, I'm not so sure if this is a good idea 
after all. The arguments in favour are fairly thin, especially since it's rather 
easy for a user to switch to one of the stable kernels.

  I do think we should at least do this for the qemu family - but those do get 
tested of course.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
