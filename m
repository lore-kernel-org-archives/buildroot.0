Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BA2C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 22:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AFB640A96;
	Fri, 22 Jul 2022 22:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AFB640A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5cSoKu-gEel; Fri, 22 Jul 2022 22:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A749E40A8D;
	Fri, 22 Jul 2022 22:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A749E40A8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 664F61BF5D7
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 22:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40457827B5
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 22:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40457827B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-Mq1AonbJ0c for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 22:33:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9E68826FF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9E68826FF
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 22:33:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h8so8285766wrw.1
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 15:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KukreoZKh6o/FhMOE9aHNxVIXhuA4jdTd3kN2aNTN2s=;
 b=MCOz02pwqy3oPvP0mUVmL/Qu/MR36985qF+Z1AR0rjsuPp+tIBIuRZHHGj6PP/cln1
 zXNEDZmtN5CPKB6DXFmBh4CMpLgKlS8k5GVBty5pQz5bJ/lv4T5rHvvUIZ6E/8vR4CVc
 mwS62wdl9H5Nthvge7nbj4gN2hWx7xNu5XkyZTqWcm/npiIuB8unFwvHGzDtqeBbR8Cr
 3lijDCSWIfCpbFq4ML3yGmn+XgfkejN2H/N8ZulxDfBFHgZzmIgaFmJwgwqnCQjlzVHZ
 AbFQq6gHLuQ8B+we8zFC2zaOyKPcRElcJY8kf7kBFYly2QOAogUn7p4UyjEED8BmRPyf
 CXEg==
X-Gm-Message-State: AJIora8xSB0RgdMROJ0fNq0ZHfgzcdacz6cSf6ANdmyC+sURjjFMcnz5
 jrAijPZ8d16stpyfllGwcvFCSA==
X-Google-Smtp-Source: AGRyM1tUbsnb8HmqVJdMR257twrm4Pcx1uhVK7uCdPnf+wZQRX1JymAxu/L2+XmjthRg/AVSdXwAOA==
X-Received: by 2002:a05:6000:1d86:b0:21d:6433:1455 with SMTP id
 bk6-20020a0560001d8600b0021d64331455mr1212780wrb.514.1658529229970; 
 Fri, 22 Jul 2022 15:33:49 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0021d69860b66sm6675180wrp.9.2022.07.22.15.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 15:33:49 -0700 (PDT)
Message-ID: <992ad3df-d4ea-9134-bcc4-2c0274ea3ee6@mind.be>
Date: Sat, 23 Jul 2022 00:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220721104733.3603090-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220721104733.3603090-1-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KukreoZKh6o/FhMOE9aHNxVIXhuA4jdTd3kN2aNTN2s=;
 b=A9JoPjQ6QAJxfra4GOoQK79ZtE6vcyjPcH8Bm8Rrlk9csne/x6Q7GtH4gfQQQhZJI+
 HWHbnZU7oZ+nDkaiPQahXp/0mRO4+0m3QHV9JdmGfMWcbQTH0n4u7JGnRy/TPWyb2hFr
 8sXpC4KVO6E++qu/UKlyrtVVNHTvXrWUEfImHRxdtoz/jelwuV6J8YqRBKMA+BAhY/H4
 Z3rzX9Scw07fiaf9ry1ILqdjTvEQ9b6aGY+D8ptZV/6lPTjTucTccnAiQUkU2zY53rdA
 4GHMWze6wZu8JN3GTf7HQMsMwVqc+NYdA44h8eBQdyZsmq705rDsYX16CA3PJGBWA+qo
 aidA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A9JoPjQ6
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/07/2022 12:47, Michael Nosthoff via buildroot wrote:
> protobuf changed its versioning scheme [1]. The Release version is now only
> the Minor.Patch version of the language specific version.
> 
> C++ stays on version 3, but python got bumped to 4. So the handling in the .mk
> files changed to reflect that.

  I think that the crazy stuff that was done upstream warrants a bit more 
consideration on our side...

  They are basically trying to encode two separate things in the version number:

- the version of protobuf itself (i.e. the protocol definition) - this is 21.3;

- the version of the language-specific API - this is 3 for all languages, except 
for python where it was bumped to 4 because it has breaking changes in the 21.0 
release.

  First remark: due to this breaking change, I expect that an update of ola (our 
only in-tree consumer of python-protobuf) may be needed as well.

  The version of the language-specific API is basically just there to to 
indicate breaking changes. In the context of Buildroot, I think it's the protoc 
version which is more relevant.

  Then there's release-monitoring. For protobuf, it says 21.3. For 
python-protobuf, we have a mapping to the same protobuf package [1].





> 
> [1] https://developers.google.com/protocol-buffers/docs/news/2022-05-06
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>   package/protobuf/protobuf.hash               | 2 +-
>   package/protobuf/protobuf.mk                 | 6 ++++--
>   package/python-protobuf/python-protobuf.hash | 2 +-
>   package/python-protobuf/python-protobuf.mk   | 3 ++-
>   4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index f37b2dee40..1006fd3d64 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9  protobuf-cpp-3.20.1.tar.gz
> +sha256  c98a4f17ed57e9e4dafc4a52e76ee012f9a6a13750488b20b4c370a3eb1561fc  protobuf-cpp-3.21.3.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index c4c33ba7da..5c08421bbc 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,9 +7,11 @@
>   # When bumping this package, make sure to also verify if the
>   # python-protobuf package still works and to update its hash,
>   # as they share the same version/site variables.
> -PROTOBUF_VERSION = 3.20.1

> +PROTOBUF_VERSION_MAJOR = 3
> +PROTOBUF_VERSION_MINOR = 21.3
> +PROTOBUF_VERSION = ${PROTOBUF_VERSION_MAJOR}.${PROTOBUF_VERSION_MINOR}

  So I think we should set PROTOBUF_VERSION = 21.3.


>   PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz

  And change this into
PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz

  Note that I don't think it's useful to create a separate variable for the 3. 
part. This is the only place where it is going to be used, and even if it would 
be the same for python-protobuf, it's better to have it explicit in each binding 
instead of in a shared variable.

  Regards,
  Arnout

[1] https://release-monitoring.org/project/3715/

> -PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
> +PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION_MINOR)
>   PROTOBUF_LICENSE = BSD-3-Clause
>   PROTOBUF_LICENSE_FILES = LICENSE
>   PROTOBUF_CPE_ID_VENDOR = google
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index ddfa48b491..06ec32c5b5 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  d3449b4df32ca155f8cd71051db916b2bf74cc925760e269c0acf09b48ec1cb8  protobuf-python-3.20.1.tar.gz
> +sha256  ab5cda843c1fa2a34c5cdd30b65ae8bd148d8063e7f1b2bfe7daf23e763b0ff2  protobuf-python-4.21.3.tar.gz
>   sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
> index b91ba49339..8c21779faf 100644
> --- a/package/python-protobuf/python-protobuf.mk
> +++ b/package/python-protobuf/python-protobuf.mk
> @@ -4,7 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
> +PYTHON_PROTOBUF_VERSION_MAJOR = 4
> +PYTHON_PROTOBUF_VERSION = $(PYTHON_PROTOBUF_VERSION_MAJOR).$(PROTOBUF_VERSION_MINOR)
>   PYTHON_PROTOBUF_SOURCE = protobuf-python-$(PYTHON_PROTOBUF_VERSION).tar.gz
>   PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
>   PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
