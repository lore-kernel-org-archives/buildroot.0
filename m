Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF4AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 19:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB7760E4B;
	Mon, 27 Jun 2022 19:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB7760E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6L2v1jKYe37R; Mon, 27 Jun 2022 19:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F67C607C7;
	Mon, 27 Jun 2022 19:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F67C607C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 000871BF358
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 19:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9212417B9
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 19:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9212417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nuTlJ_7sYJ4w for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 19:56:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF5D410AF
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FF5D410AF
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 19:56:30 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id g26so21357359ejb.5
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 12:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KPKciAnirYjnNxTglZ//tAFc3IY3UoX3ix3I+uc1mKA=;
 b=Q9Z8HkIIZN9FRaK/h64U13Joww1xW138eZ0wq7hSchoR2T5IvBtBcH6MxPXAX+KRc4
 Ut26euxBqz5gp1+jvEGeoSIBdjhM6EBPJ0qWABk1JFvnamWhFBaaIiiuY+fisdhgg8HF
 sB+VHrPXCi6mbuSLvXRVfmmO8UGTtBu3AlPeUcI2CZkwLokBAS9TBzq0iz7hlTL6gyCC
 eEy7SXpJyjeqXINq4PC1XGVFofZMBFJYR0HJKs3UbQyGfaIsBrL118qc2j99d6qbjnk1
 KrqMyIdYO9vjsQgRrc/z60bTL6Z/fr1koeazS/tn5nzsqvmRxFbF38p80Y8hufa5oscb
 O6IA==
X-Gm-Message-State: AJIora/1izPnVu8RVF44UdxONjOoXZsOoEAG8wHLXEK+i61NKpOcan1P
 WjnK3NmRCm/xNyW4zGh11n0/Oa1KIz2STQ==
X-Google-Smtp-Source: AGRyM1sG+A+Cg4UczsJEyoUCPe5S2j1EX6p0rGtUxgEro5tWT/97/lmIRN+oOdb4fAhfRWka0qMn6g==
X-Received: by 2002:a17:906:604f:b0:718:e9e8:9d2a with SMTP id
 p15-20020a170906604f00b00718e9e89d2amr13975206ejj.315.1656359789027; 
 Mon, 27 Jun 2022 12:56:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h26-20020aa7c61a000000b00435cfa7c6f5sm7950192edq.46.2022.06.27.12.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 12:56:28 -0700 (PDT)
Message-ID: <cf5bc691-d405-c34c-34d5-d85b86469117@mind.be>
Date: Mon, 27 Jun 2022 21:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@paral.in>
References: <CA+h8R2rjW4aTmTObDpKyrdMX1e=CqGzyeGHSg5sB-eeonz3LTg@mail.gmail.com>
 <20220626012022.48814280@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220626012022.48814280@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KPKciAnirYjnNxTglZ//tAFc3IY3UoX3ix3I+uc1mKA=;
 b=IZiqHxs3m5NETcenhRSHErYPZCYBRj1X7opbrbnk2xqyannm2rTSpw6vuTGIIkaqEQ
 V6q7XR2U4+uJuAX7YQ1AVkNj8+KIE9Lh02TYKKoQGQwAiTnxfZTqR/ePWZkEbhyeZGds
 hj2ghNIZWp8t6Rw3QNto9qlKbf62bZ9EFtbcnJhgH2Yl/94K4Q0DYcHGriVvqcqhNwQT
 ed3FK9O+tbOEouDv8Kj9YWgZFALTIXjL9Bn2qoaNQpWTFr8fni9Zl9G7Ux7CC8ixaP17
 f/67N0HsV5Rtm4AjMAmN3JSJqIxVfQpl42Rneqp2WlVVGwPLeIflAzAeWeMHLBZXtY77
 RwzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IZiqHxs3
Subject: Re: [Buildroot] go: patching dependency versions w/ go modules?
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/06/2022 01:20, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Sat, 25 Jun 2022 15:37:36 -0700
> Christian Stewart <christian@paral.in> wrote:
> 
>> There's a particular issue I've run into with the Go implementation
>> while trying to fix the gocryptfs package.
>>
>> Currently the process is:
>>
>>   1. Download the package source code.
>>   2. Run "go mod vendor" and re-bundle into a .tar.gz.
>>   3. Hash the resulting .tar.gz
>>   4. Extract it to the build/ tree
>>   5. Apply any patches
>>   6. Run the build.
>>
>> The problem with this is, if we try to patch the versions of any
>> dependencies, for example by editing go.mod and go.sum, this is after
>> the download step at #2.
>>
>> So currently it is not possible to change the version of dependencies
>> with a patch.
> 
> Correct.
> 
>> Is there any clean way to fix this?
> 
> No, not with the current infrastructure indeed.
> 
>> The only thing I can think of is to add a new variable which contains
>> a list of "go mod edit" commands to run just before "go mod vendor" in
>> the download & extract step.
>>
>> go mod edit -replace
>> github.com/jacobsa/crypto=github.com/piggynl/jacobsa-crypto@xorblock-generic
> 
> I don't really have a good idea here, but whatever solution we come up
> with should not be Go-specific, as it should also work for the Cargo
> use-case (and possibly other similar situations in the future).

  I vaguely remember something like this was discussed by some people and the 
idea we came up with was to add some kind of pre-post-process step that would be 
called before the {cargo,go}-post-process. Well, it would actually have to be 
called from within the post-process script, because the script itself is 
responsible for detecting if the tarball was already post-processed or not (and 
any patches should only be applied to the raw tarball, not the post-processed one).

  Come to think of it, because any patching anyway needs to be done in the 
post-process script itself, it's not so crazy to make the patching specific for 
the post-processor as well. We just need to add yet another argument to 
dl-wrapper that propagates down to the post-processor - similar to the arguments 
after -- that are passed down to the backend. With that, you could do e.g.

GOCRYPTFS_DOWNLOAD_POST_PROCESS_ARGS = \
	-m '-replace 
github.com/jacobsa/crypto=github.com/piggynl/jacobsa-crypto@xorblock-generic'

  Quoting is going to be complicated though...

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
