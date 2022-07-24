Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B5AC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D46E342452;
	Sun, 24 Jul 2022 10:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D46E342452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOmfKKz8Kluc; Sun, 24 Jul 2022 10:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5568541735;
	Sun, 24 Jul 2022 10:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5568541735
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F9311BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7469E60FBF
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7469E60FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XMIoY7V5FT8 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:40:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABF2607F9
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ABF2607F9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:40:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u5so12149420wrm.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+Q8c/rZdiZrqZtJ9ug+gcfVLFCV/8KCQM5G4zbaAtUg=;
 b=ae49bRaCrTSquHrff/QNdKte+FsuFDJ59E0HYvLvyxO8bPBQxwovBEqj9IxhzLSRaX
 Z/dWbyCBREPZjEgTkiO3SRT/Rgs+b/1fkFuJ3JElbtE/TQLbGRWIHb4oP9Erz7mSsd81
 C4/i04nC7sHrqW/IGWKjbzApucTGNun2VpJBetouz3mIQqcjSJx6K5zs7v0y3W/fhSFI
 NPGqZ0NcsiPduL2exhqb+jfAKdbsA3lJgx3yhz/3eDKc+RGu9spV5AzgLZJctkWdEw+b
 /IhfLDaeQF3IrwpNJO8ZxAbhLnHwuUxIg8M6bCOmMaor2S7XXtz82SOMgvuF590nedaP
 7d0g==
X-Gm-Message-State: AJIora8nDJbjJpXAhjmlOmzXyszk5To4ZTcOYhkCoWxZ7OpvKNDEHl82
 4b5Hc5nLRJ5/tsdPALLic7XE9jcewsjGRQ==
X-Google-Smtp-Source: AGRyM1vwZPDML0WGQbfZI4dzMV3XnZtlodj6ybnOS9KBVZtYk6PYij5O+Ln8kaSvIJPryjCxla4KbQ==
X-Received: by 2002:a5d:6dab:0:b0:21d:9fc8:3029 with SMTP id
 u11-20020a5d6dab000000b0021d9fc83029mr5025453wrs.172.1658659236227; 
 Sun, 24 Jul 2022 03:40:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm10287919wmr.42.2022.07.24.03.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 03:40:35 -0700 (PDT)
Message-ID: <1ae9b631-767d-246a-84b6-36aca07f9dc1@mind.be>
Date: Sun, 24 Jul 2022 12:40:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, Julien Olivain <ju.o@free.fr>
References: <4d-62dd1c80-3-19436700@106240584>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4d-62dd1c80-3-19436700@106240584>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+Q8c/rZdiZrqZtJ9ug+gcfVLFCV/8KCQM5G4zbaAtUg=;
 b=GPaf9CQW+57MX4lRlSbL9ETqgOX/TuhXwRZaG/LIHGDmD1iq/FmUrKPcSskSJvlCJr
 LGp1x4E02Wbz1mZX1HOLdzSgUM6PdP3PvMFNuWYTJHJnQMduT3YKiBCn6doQBN6qvNcK
 mBEOkLzAUtpB821r2UtNr/dN0RL2ejOXaMHG3d+MfigCAvl4RJwcnmO6/MZCkG9BUZIi
 O2gLtsscsh/yg1Eko4slcyPh/cHgUp34Ib0nXQjRf41Bk1t6apfHcptkGN9yWO5QnzFH
 p+vzQw2pfKrZlFkVUd/lQTHl+hFN4BbqNG3b/ltuC6Us76QM3Ub/nXa+u77FAPJ9iaT0
 o4DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GPaf9CQW
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 21.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 12:17, Michael Nosthoff wrote:
> Hi Arnoud,
> hi Julien,
> 
> (julien, i added you as the ola maintainer as this patch might break it)
> 
> On Saturday, July 23, 2022 00:33 CEST, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>
>>
>> On 21/07/2022 12:47, Michael Nosthoff via buildroot wrote:
>>> protobuf changed its versioning scheme [1]. The Release version is now only
>>> the Minor.Patch version of the language specific version.
>>>
>>> C++ stays on version 3, but python got bumped to 4. So the handling in the .mk
>>> files changed to reflect that.
>>
>>    I think that the crazy stuff that was done upstream warrants a bit more
>> consideration on our side...
>>
>>    They are basically trying to encode two separate things in the version number:
>>
>> - the version of protobuf itself (i.e. the protocol definition) - this is 21.3;
>>
>> - the version of the language-specific API - this is 3 for all languages, except
>> for python where it was bumped to 4 because it has breaking changes in the 21.0
>> release.
>>
>>    First remark: due to this breaking change, I expect that an update of ola (our
>> only in-tree consumer of python-protobuf) may be needed as well.
> 
> The "breaking changes" according to
> https://developers.google.com/protocol-buffers/docs/news/2022-05-06#python-updates
> don't actually sound "too breaking" to me.
> 
> I tried compiling ola with the bumped version. But it is beyond my knowledge how to test this.
> @Julien could you check if this version bump of python-protobuf affects ola?

  A runtime test for ola would be nice!

> 
>>
>>    The version of the language-specific API is basically just there to to
>> indicate breaking changes. In the context of Buildroot, I think it's the protoc
>> version which is more relevant.
>>
>>    Then there's release-monitoring. For protobuf, it says 21.3. For
>> python-protobuf, we have a mapping to the same protobuf package [1].
>>
> I'm not quite sure what you mean here. should we got with
> PYTHON_PROTOBUF_VERSION = 4.x.x or do the same as with the cpp version and
> just add -4. to the SOURCE?

  Yes, that's what I meant, prepend the 4. in the SOURCE definition.

> Where do I see the release-monitoring mapping?

  The URL that I referred to before:
[snip]
>> [1] https://release-monitoring.org/project/3715/


  Regards,
  Arnout

>>
>>> -PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
>>> +PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION_MINOR)
>>>    PROTOBUF_LICENSE = BSD-3-Clause
>>>    PROTOBUF_LICENSE_FILES = LICENSE
>>>    PROTOBUF_CPE_ID_VENDOR = google
>>> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
>>> index ddfa48b491..06ec32c5b5 100644
>>> --- a/package/python-protobuf/python-protobuf.hash
>>> +++ b/package/python-protobuf/python-protobuf.hash
>>> @@ -1,3 +1,3 @@
>>>    # Locally calculated
>>> -sha256  d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8  protobuf-python-3.20.1.tar.gz
>>> +sha256  ab5cda843c1fa2a34c5cdd30b65ae8bd148d8063e7f1b2bfe7daf23e763b0ff2  protobuf-python-4.21.3.tar.gz
>>>    sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
>>> diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
>>> index b91ba49339..8c21779faf 100644
>>> --- a/package/python-protobuf/python-protobuf.mk
>>> +++ b/package/python-protobuf/python-protobuf.mk
>>> @@ -4,7 +4,8 @@
>>>    #
>>>    ################################################################################
>>>    
>>> -PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
>>> +PYTHON_PROTOBUF_VERSION_MAJOR = 4
>>> +PYTHON_PROTOBUF_VERSION = $(PYTHON_PROTOBUF_VERSION_MAJOR).$(PROTOBUF_VERSION_MINOR)
>>>    PYTHON_PROTOBUF_SOURCE = protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
>>>    PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
>>>    PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
