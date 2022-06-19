Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17832C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EC1D408E8;
	Sun, 19 Jun 2022 15:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EC1D408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CCSWcO_d2888; Sun, 19 Jun 2022 15:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67086404C9;
	Sun, 19 Jun 2022 15:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67086404C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A30041BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AAB660C23
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AAB660C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yU9p83QaRMFk for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:20:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C42D60C15
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C42D60C15
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:20:25 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b8so11906328edj.11
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZoUTVmKn87SbxTBnNCyremQb3JSCikfE3BE0UGUljKs=;
 b=MXfpUx/M2HX0SPIArrZKhcJDQJd2/5PFp8NHZemy84Vhgm5wlMNaqauxJWLyNxr/Xa
 U61oYc0RIFJWfQO52ElhsckpjF4xvT+N5DoatTvFM82ZTmgAb1BeC/KlY0kR8PHZ40j0
 E9VW7zM6oRc3vnL01TYON3n+MEsu1BGA/mlC9ixn+J1IhnCRyJ8w2O4E4yCEwCQtAup5
 vVFSdSVWFLYDHH0ml6DJsCHnXl1Pobh2NevL5EIBPe0v9a17FsUdobJV1dRO4p6a8eQd
 LkKbIqHnDpY21lAEtKFMA2Yv+bjvNekMNnWBPTvNjllqfzOQbzy8r3vei7LDyk1TCKiF
 5sWQ==
X-Gm-Message-State: AJIora8RA8Z6HKDojDs5hBNSn6j3m93aDuRy4vUl+kx1CoQodL5+c4/i
 QjT0uroK25URUKjDTi1P+p93DhyHtUbJew==
X-Google-Smtp-Source: AGRyM1vHwqHbVYiH0TwwztiN1MxRJRaVE43jJH3BGMhCjb4FZZrXQnIYyaMYNn9m/2Nky4pXySgB9A==
X-Received: by 2002:a05:6402:2753:b0:431:9c8b:5635 with SMTP id
 z19-20020a056402275300b004319c8b5635mr24164596edd.152.1655652023380; 
 Sun, 19 Jun 2022 08:20:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906218a00b006fee98045cdsm4742429eju.10.2022.06.19.08.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:20:22 -0700 (PDT)
Message-ID: <8c13892c-a9ed-a016-7043-6794b87a884c@mind.be>
Date: Sun, 19 Jun 2022 17:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
 <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
 <CADvTj4qcYpo=UB2Qny7-0mXiqq9R0u6QMBgs+9hXm76SQxvEew@mail.gmail.com>
 <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <40fe53f9-cd74-a19f-e338-2aa4d35a9ec1@synopsys.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZoUTVmKn87SbxTBnNCyremQb3JSCikfE3BE0UGUljKs=;
 b=MSM9Z4u8PTmaBgL3oppYz5Ijm0dRPyhNRd4Rt8t9+Kgc45fyYkJHLiTS6XIM9K1WsO
 SIfqJNq0IrLsuhxxniYAuBauBEF2LPuvuSj3i4W8z6JVMuiTO+9LG8kd+QovNdt7JPMe
 RCz77FjWfR2/CN3wpe5Oqdoj4tNcL4zb+w+HvPB9/EFqsm0ef5MdFgxt6zEFBoqvQqIn
 DcCx9Axy4qP+6K8kNW4TLOTa+215nNRo8KvxyLkeL0I8uRDN6fM/jWl3VYlj7KKviuOD
 iFwhmbcEFsCLsCUCMCSJJyApLL/0vY3ECNO9qpjbxhDcSG2mibXTbggS3adj8C9f6YTm
 h09A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MSM9Z4u8
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/06/2022 10:11, Shahab Vahedi wrote:
> On 6/16/22 01:27, James Hilliard wrote:
>> On Wed, Jun 15, 2022 at 5:10 AM Shahab Vahedi via buildroot
>> <buildroot@buildroot.org> wrote:
>>>
>>> On 6/14/22 19:14, Arnout Vandecappelle wrote:
>>>>
>>>> On 14/06/2022 11:31, Shahab Vahedi wrote:
>>>>> Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
>>>>
>>>>   How do you build host-bpftool with clang in Buildroot context? HOSTCC is set to gcc in the Makefile... Do you supply an explicit HOSTCC= on the Buildroot command line? I'm not sure if we are really interested in carrying fixes for such exotic and not-really-supported situations...
>>>
>>> No, I don't do any sort of trickery to build bpftool on my end. The
>>> bootstrapping, if becomes available for your configuration, uses clang
>>> and only clang. I tried to explain this in v4 of the patch [1], the
>>> second paragraph of the commit message.
>>
>> I think clang/llvm support isn't going to work correctly yet since we only have
>> version 9.0.1, there's a series bumping to version 11.1.0 that should fix that:
>> https://patchwork.ozlabs.org/project/buildroot/list/?series=291585
>>
>> Minimum clang/llvm version for libbpf co-re is version 10:
>> https://github.com/libbpf/libbpf*bpf-co-re-compile-once--run-everywhere
> 
> You're right about the clang version, but it doesn't have anything to do
> with Buildroot's clang. The build process uses the clang that is installed
> on the host. For Debian bullseye, that is clang 11.
 >
> To emphasise, I am cross-building bpftool for my "arc-linux" target, and yet
> the bootstrap part of bpftool, uses the x86 clang of the Debian machine.


  Hm, that smells like we actually want to build host-clang (after updating it 
to 11.1.0 of course) so that we are sure a known version of clang is used. 
Possibly with a check-host-clang check to avoid building it if the installed 
clang is good enough.

  And we probably want a user-visible option to enable co-re then, because it's 
going to be expensive to build.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
