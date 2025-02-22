Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DCBC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 17:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1929405C3;
	Sat, 22 Feb 2025 17:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4neD3YgvFCkK; Sat, 22 Feb 2025 17:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B7A9406AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7A9406AE;
	Sat, 22 Feb 2025 17:40:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C1916B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DB69606BF
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVQNyl1Xeoeq for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 17:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF612606B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF612606B3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF612606B3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:40:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4397dff185fso27426885e9.2
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 09:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740246011; x=1740850811;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38QG7DrW6JsMB2JdX4lbObyuewt4Z8cflM3eB/vJ5g0=;
 b=saRKMDob7W+UU5IAAUJ+YHleyF5aStGkVRBjnOjufyzoOeii/aV8HXfPOPdQxcrv9J
 /RhS5vgpg0Fx96Kq/UDLR1v7uCRdBFzpmNMYgMFmTk7eeFH79fHKAfUxLVmIOx+u5VjT
 dLSqOyT3++JNy2PxKvTE6lDy3GY8oO5j3UQ7Nwo5nXNNwNNog4sCfqMqNsO6X+dAdg1C
 dkHnLPmFn4W41ww4dJqd07BZWeYjSrYSBZhXAFD5hY8lJ8SwmGT6WxyYWBQrJzq8E7DV
 f4eSHqvlE2qrX/0IoyYcVwWzV9PbQ4e+921KFsV2p7EMgUYz/Mh4h9QiiNTuEeUFpuzh
 Ak1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB4LPhki+Xxin+Xm1to0RKAD/100VwdBYiyPU+9RGqlbXJrsB4VM4LCOoLhNnstqFmH5mpobrOEcA=@buildroot.org
X-Gm-Message-State: AOJu0YxW/sQ/MQLFhqmOoHAzY+XhB9TUsO+bILxxVW6Sua4tPaTkRNNe
 DtF7OQP0ymVd4EJsEVC8VB6K0O340WBWljSj3gpV7/N6bQTLlLXCeRJVFl++2a4=
X-Gm-Gg: ASbGncv2kn6pTTOJ6r7IC2VcJp8kEj5qd0roagxjTYnyivEC7Jh9uDVbhknRYOWSktG
 pAmhgwXvyqp28qISnO3cMTckJ6GeJT8J3xSQHPQVYBRndXwr4603XYbLlnvCTEQWVsYrQkKXowF
 gCzeh0o0ZKIUbZ5P/Ek6myCGq65OjTxS9NhfIIlb7tLbv9bBl1AV2jJKAzAS6YF9ql5XLPaJp6B
 bI/muvtLqGepVZqM70ZinUpUiv5mRxPhvrzHqJXRTa+QSRg843sKN4vGzlBcS7UAgPVGiuFNrME
 /Oj/QHin7DG56fbA16WtOUTn3dN0N3tSBIsHzN3ZnH/f2JJdrpjayvoUOJxLnGaPoMG6oAUx5HJ
 LNIv6X/4RRnIhElodv408bKEo2JH593RWhaVCLTOORtXcNuUEkp5c9utS
X-Google-Smtp-Source: AGHT+IFXgyyw+W0gkrOvJ/1Vh/O1gDeWS6veDaZaPeHZ1Jrw4ilpeXVZkapIuV9F2gpFmuz/DEroOA==
X-Received: by 2002:a05:600c:1e0c:b0:439:88bb:d002 with SMTP id
 5b1f17b1804b1-43a9dece3c4mr7029255e9.23.1740246010458; 
 Sat, 22 Feb 2025 09:40:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030bdb4sm53720625e9.27.2025.02.22.09.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Feb 2025 09:40:09 -0800 (PST)
Message-ID: <7b1f278b-9e9a-4bdc-ba0e-532809936aa0@mind.be>
Date: Sat, 22 Feb 2025 18:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matthias Swiggers <matthias.swiggers@mind.be>,
 Vincent Jardin <vjardin@free.fr>
References: <20250206180614.984105-1-thomas.perale@mind.be>
Content-Language: en-GB
In-Reply-To: <20250206180614.984105-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1740246011; x=1740850811; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=38QG7DrW6JsMB2JdX4lbObyuewt4Z8cflM3eB/vJ5g0=;
 b=J2mB5ZDZUrqwdbIvhw4b1lB3fo6lNa6l+Q03V5WIvHSK26zzX2KTmaFOZ6FJ8Y8n7v
 d6IdHRRsHOLY/qvcSD/vo0i3JoviMcUllvyOy5EW4Cf6z3PPndmbLoPXng19aEslOOoY
 XbLEc+tJm/7oBJoQwvRNVtsvjnI0/vMX8WH794ao614YdkuPaKy2w1qYdJUIW4/c/PIl
 DG5vxBZ/lRIbkMR0BsOukLQuf4wwxRtwAf/H9lgUnf5FIBH7kUdrNo6/K1+L3uYs4XBp
 rzUItgfpdgoAxAmybCxgcVHKCWLTj/CyOEwAfjrVf6pQ1g2dqNjQAezt1AnUM6MhNNkG
 AODA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J2mB5ZDZ
Subject: Re: [Buildroot] [v3,RFC,PATCH 0/2] Support CycloneDX SBOM
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Thomas,

On 06/02/2025 19:06, Thomas Perale wrote:
> This series is the sequel of a patch series sent in April 2024
> https://lore.kernel.org/buildroot/Zhb8vKs-ltd8ghUR@landeda/T/
> from which it was agreed to parse the content of the `show-info` JSON
> output with a python script instead of generating the SBOM from the makefile.
> 
> The DependencyTrack instance is still available at https://dependencytrack-lqgs7zhwmq-ew.a.run.app/
> for you to test CycloneDX and see the possibility.
> Login with username `buildroot` and password `buildroot`.
> 
> To generate a CycloneDX SBOM you can run the following command:
> 
> ```
> make show-info | utils/generate-cyclonedx.py | jq '.'
> ```
> 
> ## Changes from v2
> 
> * show-info: removed the absolute path for the patches. Similar to the
>    `staging_dir`, etc .. properties.
> * Python: bug fixes
> * Python: code retrieve the final of virtual package in the dependency without
>    adding the virtual package to it.
> * Python: In the vulnerabilities property is should be stated that it has been
>    excluded by buildroot
> * pkg-utils: Doesn't rely on `.applied_patches_list`, and instead returns a
>    consistant list of patches. For now we will ignore the corner cases that rely
>    on patching during the pre/post hooks.
> * pkg-utils: Use the `pkg-patches-dir` function during the `.stamp_patched` step
>    and the `<pkg>_HASH_FILE` variable in `pkg-generic.mk`.
>    * This change would need special attention. The logic of the
>      variable changed a bit, the previous implementation would only pick the
>      hash/patch file in the version subdirectory if present if a hash/patch file
>      also exist in the package directory it will also be applied.
>      I don't think there is a case where where an hash file is present in
>      the `<pkg>/<version/*.hash` directory as well as in `<pkg>/*.hash`
>      directory. For instance the 'lua', 'openjdk-bin' package has hash files
>      only in version sub-directory.

  I finally applied the series but with quite a few changes.

  First of all, I split the first patch into two commits: the first one just 
does the refactoring, and the second one adds the patches to show-info.

  While testing, I discovered that the behaviour of hash files and patches is 
actually quite different: patches use only the version directory if it exists, 
while hashes use both the version dir and the base dir. In-tree, the behaviour 
for hashes _is_ actually used like that. For patches it is not, but there may be 
externals that rely on it, so I didn't want to change that behaviour. Therefore, 
the patches and hashes are not fully refactored. Look at the code to see what I 
ended up with.

  There were a few more details as well:

      - don't fully factor with _HASH_FILES because version is treaded
        differently;
      - introduce pkg-patch-hash-dirs;
      - retain the RAWNAME comment, but move it to pkg-patch-hash-dirs;
      - use foreach instead of shell loop, and $(seq) instead of exit 1;

and on the generate-cyclonedx.py patch:

      - alphabetically order imports;
      - use endswith instead if 'in' to check suffix;
      - add usage to help text;
      - remove .py suffix.


  Regards,
  Arnout


> Thomas Perale (2):
>    package/pkg-utils.mk: add patches to show-info json
>    support/scripts/generate-cyclonedx.py: add script to generate
>      CycloneDX-style SBOM
> 
>   package/pkg-utils.mk        |  20 +++
>   utils/generate-cyclonedx.py | 307 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 327 insertions(+)
>   create mode 100755 utils/generate-cyclonedx.py
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
