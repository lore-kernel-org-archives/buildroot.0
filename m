Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFEAC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 18:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97C5F408C5;
	Mon, 15 Jul 2024 18:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dpr5xNQuz7QF; Mon, 15 Jul 2024 18:00:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98B1C40580
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98B1C40580;
	Mon, 15 Jul 2024 18:00:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD8F21BF408
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 18:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6D5B40580
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 18:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_-cvQfNE2Q9 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 18:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B02140373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B02140373
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B02140373
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 18:00:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-427b4c621b9so5468955e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 11:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721066441; x=1721671241;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OG9F7VmmNnVnjQAEl1H6PwL5ewaKBlvkfbTkqYph+wc=;
 b=VNpL/6znkGhu7nwKhQ2gIktq6zRfcKzAmZoBVzR9wkM3wPAQl9p84Y2lFffQoy5UFB
 U/RxCsidQpw4mzptBhvYFxLSEfCuJJYbU9CXzOGpAMPET2P5j7cVUWZrain0YYkUNAMh
 d2TD8YRg4CAtAMxAphnOGaPMfxz8olV+YjJrFch0oRHI5IcczAxgqQPeYmpjFRyKdMDv
 3n5G96djBahe1kATTMSRhVPj9HiL5L1Zr6cvDr80vNfpZ6rJ1zEGTq5lcEuUswCXnvOy
 UbvL210PC0hX3gvuExOg093RHjHgH8bWqHGb98xj+sgg+g3tuuP1T6hxpJqH57hDbn6v
 1S9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8xUF2FkE3WrR3hW2IdhX1m2k71lWwsn3nvsbE1FsrQykNaOwlR4b91oUzZ3CGpP/QrJya3B1pUUn+CWVXcfe5em8XYXfg6Q==
X-Gm-Message-State: AOJu0YxlKC/Hj42BvxoKSNnrqHapHtnoB4tDTnQ692N+q46p7ewAzRyp
 43Anu6EYDP8L+QUrMPohORf9SvtQydzRW2/c0MqHy+EzJRH32MppLPlrDdDzsno=
X-Google-Smtp-Source: AGHT+IGKqcyO0STCPkKFDBKLUyS2OWEoHpEJDCSAyIWS/46iIUW7XzYjE19DlzYr+kVXf4zHSrri5g==
X-Received: by 2002:a05:600c:3503:b0:426:5f8f:51a4 with SMTP id
 5b1f17b1804b1-427b889778emr2764625e9.12.1721066441280; 
 Mon, 15 Jul 2024 11:00:41 -0700 (PDT)
Received: from [10.10.1.22] ([89.207.175.13]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7489sm130016805e9.44.2024.07.15.11.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 11:00:40 -0700 (PDT)
Message-ID: <733138c8-5fd9-43c9-a7f3-0953622ea7c9@mind.be>
Date: Mon, 15 Jul 2024 20:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, carrier.nicolas0@gmail.com
References: <20230117110440.3405234-1-carrier.nicolas0@gmail.com>
 <20230129153145.GE2632@scaer>
Content-Language: en-GB
In-Reply-To: <20230129153145.GE2632@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721066441; x=1721671241; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OG9F7VmmNnVnjQAEl1H6PwL5ewaKBlvkfbTkqYph+wc=;
 b=XX0Qk9pz3/4RMFRhayS7nKkObajUZbaBPq4zUE7O0YhDyhb+PkPUPc+8MAG7E6+ioH
 Ia14yAEVO5SeA+8HL/3why/Dm60P6XYwBiM5fZsChlh3dqdEAWPZdxPsn/M+6iF0hIlO
 6uzRhKDDSFw8V4vgjg19rbrJnSLWRsGOy9s27+dkvZ0Iqif7B94kse76D1IvvZx1y71p
 cUT51qL4ZB7p8rO6UlGNv6cXFf1Y720pF8CqLa5xfVl8F1AXj70CchzD07LeDk5oVt9E
 1hKWQ4zF0n8Q0K6ablVBVGxZAbYTbh5f6MIaRbClDTlpY1pWJaN0nuRcbiZfjaTNZpP8
 /pCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XX0Qk9pz
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: local and
 override support in legal-info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Yann,

On 29/01/2023 16:31, Yann E. MORIN wrote:
> Nicolas, All,
> 
> Sorry for replying much later than I promised I would do...
> 
> On 2023-01-17 12:04 +0100, carrier.nicolas0@gmail.com spake thusly:
>> From: Nicolas Carrier <carrier.nicolas0@gmail.com>
>>
>> Sources of packages which are using the 'local' _METHOD_SITE or
>> which declare an _OVERRIDE_SRC_DIR are not archived when generating
>> the legal-info target.
> 
> That packages with an override-srcdir are not saved, is indeed
> on-purpose.

  No it's not. It was just a side effect of it being difficult to save it, 
because there is no tarball to copy.

> An override-srcdir is meant as a way to develop on a
> package, rather than use its official download location.

  That is indeed what it was originally meant for, but in practice it does get 
used as an official download location. It works well, in situations where 
there's no real alternative, so it's something we really should support officially.


> During development, such packages are most often stored in a local
> directory that is not tracked by the VCS (git, svn, etc...) and so
> are not reproducible, and thus such a build can't be meaningful as
> a production build,

  True, it's about as reproducible as specifying a branch or something like that 
as the VCS revision. Which is something that people do, unfortunately.


> and thus we should not be able to produce a
> legal-info content in such a case, quite the opposite in fact: we do
> want to actually log that override packages are being used and that
> they were not saved.

  We pretty much log that fact because the version is "custom". It's not as 
strong an indication as having the warning, but it's pretty much the same.


> Some people do use that as a safeguard when generating the legal-info

  The warning was never meant to be such a safeguard - I would say it is meant 
as even less of that than that override srcdir was meant as a development tool.

> and passing it for publication, to ensure that there are actually no
> use of an override-srcdir package and that all the build is actually
> reproducible without local hacks. Changing the behaviour as you suggest
> would break for those users.
> 
> Now, I do understand that you are (ab)using override-srcdir to use
> locally modified versions of packages that Buildroot would otherwise
> fetch from their remote locations.
> 
> In that case, I would advise that you carry the necessary changes on
> your Buildroot tree, that change such packages from whatever site and
> site method Buildroot uses, to a path as the site, and "local" as the

  Uh, well, that's exactly what this patch adds support for... local is 
implemented as an alias for override srcdir, remember?

> site method. Yes, this means you need to patch Buildroot, and probably
> carry that forever, but that is a very minor change [0].
> 
> As for getting in compliance for such local sources, my first comment
> would be to point to the statement that the Buildroot developers made
> a while back, and that was committed to the manual:
> 
>      https://buildroot.org/downloads/manual/manual.html#legal-info-buildroot
> 
>      Nevertheless, the general view of the Buildroot developers is that
>      you should release the Buildroot source code along with the source
>      code of other packages when releasing a product that contains
>      GPL-licensed software. This is because the GNU GPL defines the
>      "complete source code" for an executable work as "all the source
>      code for all modules it contains, plus any associated interface
>      definition files, plus the scripts used to control compilation
>      and installation of the executable". Buildroot is part of the
>      _scripts used to control compilation and installation of the
>      executable_, and as such it is considered part of the material
>      that must be redistributed.
> 
> Indeed, Buildroot contains the recipes that are used to configure,
> build, and then install the packages, and in some cases, even hack
> into the packages sources (with sed, awk...), and so Buildroot falls
> under the _scripts used to control compilation and installation of
> the executable_, and providing just the tarball and the patches would
> not be enough for those packages.
> 
> Also, just providing the Buildroot source tree would not be enough
> either, as you'd need to also provide the .config (or defconfig) that
> was used to define the build, as that contains options that will
> ultimately have an impact on the artifacts (like the -mcpu setting, or
> the -O level...), and thus should also be considered as part of the
> aforementioned scripts.

  But the Buildroot source and the (def)config would be enough, right? There's 
no need to provide the post-scripts or the rootfs overlay or any of the other 
cruft that you put in a BR2_EXTERNAL....


> With that in mind, if you have packages that are "local" (either by
> their _SITE_METHOD or by being _OVERRIDE_SRCDIR), then you hopefully
> have them as part of the same VCS tree (or sub-tree, submodule...)

  There's no reason at all to have them in the _same_ VCS tree, as long as you 
have something that manages consistency between them (e.g. repo manifest).

> as your Buildroot tree, in which case you should just need to provide
> the checkout of that tree that was used to do the build, and be in
> compliance for those packages.

  ... But you still need to do that manually, while with this patch, Buildroot 
can do it for you.

  Of course you can say that Buildroot doesn't _need_ to do it for you, but then 
you can claim that for everything that Buildroot does for you.

  With this, the Buildroot tree is pretty much the only thing left that is 
missing for a complete corresponding code delivery I think.

  Regards,
  Arnout

> 
> If you need to be able to separate FLOSS packages from proprietary ones,
> then Buildroot already helps you in that respect, by allowing you to use
> more than one br2-external trees at once, for example one with your
> FLOSS packages, and one with your proprietary sources; just exclude from
> the BR2_EXTERNAL variable, the br2-external tree(s) with your proprietary
> stuff, when you prepare your legal-info, and exclude them from the
> tarball you generate. If you have no proprietary source, then the point
> is moot; you can redistribute everything (but can still use more than
> one br2-external for other reasons, of course!).
> 
> Bottom line: 1. I am opposed to making it possible to generate local
> archives from override-srcdir, and 2. I am not in favour of making it
> possible for local packages either.
> 
>> This is problematic since those packages are the most likely to
>> require being published, because it's highly probable that their
>> sources have been modified.
> 
> This is totally irrelevant: whether the sources are changed or not does
> not drive whether a package sources should be published. Believing so
> would be a gross misconception on how licenses such as the GPL work.
> Indeed, the GPL requires that the C&CS be published for any covered
> work; it does not condition that publication to it having been locally
> modified, or not, from wherever you got it from.
> 
> [0] The alternative is of course that you push your changes to the
> corresponding upstreams, and carry those patches in a global-patch-dir;
> for those that are not upstreamable, you'd have to carry them for ever
> as well. And I see how it could be cumbersom for the kernel, which is
> the reason why we already have a wide range of solution for how to get
> the kernel source trees (arbitrary tarball URL, git, mercurial, or svn
> trees...).
> 
> Regards,
> Yann E. MORIN.
> 
>> This patch generates a tar.gz archive on the fly, containing the
>> result of the rsync of the package's source directory, using the
>> same arguments as during the preparation of a build.
>> Note that is not possible to archive the builddir, since it may
>> contain artifacts of previous compilations.
>>
>> It is not possible to consider rsync as a "normal" download method
>> either (which would have solved the initial problem), because if we
>> do that:
>>   * the DL dir's content would be altered improperly
>>   * the rsync + tar gz overhead would be paid on compilation and is
>>     significant, for example, for a linux kernel
>>   * a hash file would be necessary, which would be a burden to
>>     maintain, for sources frequently modified
>>
>> Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
>> ---
>>   package/pkg-generic.mk | 23 ++++++++++++++++-------
>>   1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 2f8ba39edf..a8760f40d4 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -660,6 +660,12 @@ $$(error $(1) has local site method, but `$(2)_SITE` is not defined)
>>   endif
>>   endif
>>   
>> +# for legal-info sources archival
>> +ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>> +$(2)_OVERRIDE_RSYNC_DIR = $$($(2)_BUILDDIR)/$$($(2)_BASENAME_RAW)
>> +$(2)_OVERRIDE_RSYNC_ARCHIVE = $$($(2)_OVERRIDE_RSYNC_DIR).tar.gz
>> +endif
>> +
>>   ifndef $(2)_LICENSE
>>    ifdef $(3)_LICENSE
>>     $(2)_LICENSE = $$($(3)_LICENSE)
>> @@ -1146,13 +1152,16 @@ else
>>   endif # license files
>>   
>>   ifeq ($$($(2)_REDISTRIBUTE),YES)
>> -ifeq ($$($(2)_SITE_METHOD),local)
>> -# Packages without a tarball: don't save and warn
>> -	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
>> -
>> -else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>> -	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),override)
>> -
>> +ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>> +# Packages without a tarball: create one on the fly
>> +	@echo "Package is of type local or override, archive sources"
>> +	$$(Q)rm -rf $$($(2)_OVERRIDE_RSYNC_DIR) $$($(2)_OVERRIDE_RSYNC_ARCHIVE)
>> +	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) $(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ $$($(2)_OVERRIDE_RSYNC_DIR)/
>> +	$$(Q)tar -zcf $$($(2)_OVERRIDE_RSYNC_ARCHIVE) -C $$($(2)_OVERRIDE_RSYNC_DIR) $$$$(ls -A $$($(2)_OVERRIDE_RSYNC_DIR)/)
>> +	$$(Q)rm -rf $$($(2)_OVERRIDE_RSYNC_DIR)
>> +	$$(Q)support/scripts/hardlink-or-copy \
>> +			$$($(2)_OVERRIDE_RSYNC_ARCHIVE) \
>> +			$$($(2)_REDIST_SOURCES_DIR)$$(sep)
>>   else
>>   # Other packages
>>   
>> -- 
>> 2.30.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
