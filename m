Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C89C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7655660B5B;
	Tue, 16 Aug 2022 20:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7655660B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbMZ3Y4gTMVR; Tue, 16 Aug 2022 20:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D4A60B3D;
	Tue, 16 Aug 2022 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D4A60B3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE7D51BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8A2782437
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A2782437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fvjye5JNdgLt for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:59:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A77823E2
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3A77823E2
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 20:59:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id gk3so21140188ejb.8
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 13:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=1M+FVKLfxf42JvhSllBVfnnprn86ZKrXD2tmoadNU/0=;
 b=cim9uA3XbsZhNFpp6QNFQph2Y46rdQmbKwHbX3P+SqgOBJpAR+amZ78oABTYi84Cvl
 oJSaOO7uqz7I3POktZKbgpG2apGmO+ZiVgvES3Npu2udwoTwT15tQACm+e6lxBEo3kJE
 zZzY8+figF9tgb1QRN/T5LaQXpmjHDrU8BfzCpqwnivGjO8764o8xUiqo43H75KYIJnZ
 PV2eDg25RdukxzjKR09vcxjEcxzIxRwzHDSzWYsqhZfMLd6UrexcRHyjeLDQRq7f9Yki
 HxU/Ibx/Fzweo2ISdbFpk/8RpY3kElUazrpG+8FCNI5zpKOc0odVmOslx+RcV/FAVTeP
 EajQ==
X-Gm-Message-State: ACgBeo1bDCPCfFCGESemp9xnp2kn6wHQgWGMnSayMhNt6uPwPDPdsn4H
 eozPd3AlxZ0mpvxavSkcqyb3NQ==
X-Google-Smtp-Source: AA6agR6rdnQyoYbDs8gGBCfyym3fTlDjViml6TqpDik8AvcBdqJWCCz4rJhges0Wvyx8cnBZdQaiww==
X-Received: by 2002:a17:907:dab:b0:731:58aa:77c9 with SMTP id
 go43-20020a1709070dab00b0073158aa77c9mr14564694ejc.743.1660683555069; 
 Tue, 16 Aug 2022 13:59:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a17090652da00b00732a5b3d09csm5779553ejn.89.2022.08.16.13.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 13:59:14 -0700 (PDT)
Message-ID: <adb7a893-dd11-6882-ca16-809e4ab9bf9d@mind.be>
Date: Tue, 16 Aug 2022 22:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: yann.morin@orange.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220816094829.377-1-guillaume.bressaix@gmail.com>
 <20220816120109.1a348d39@windsurf>
 <14985_1660644771_62FB6DA3_14985_149_1_20220816101249.GA2027648@tl-lnx-nyma7486>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <14985_1660644771_62FB6DA3_14985_149_1_20220816101249.GA2027648@tl-lnx-nyma7486>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=1M+FVKLfxf42JvhSllBVfnnprn86ZKrXD2tmoadNU/0=;
 b=NBKSjZFtUjpkxHzmNMyWWnSaezlv8ZDZQ3Us8x412g3tMOkb0+6W6Ye4enPDlGDrzr
 KuFK5iZP2JSBcSli4PcOnhH7eb651Wr0REFVn0EK6X+HjtBHrnp/bBHZHlA9QaJ/94Y5
 svp3WiFLD8NqbHchY6HQVQIIdVRPKxPmwU1F6m1PLkAj/hdLAWm1erUDa/zvTBYGOyja
 xIAAAtLICMGj9jacp89Dxh5qEZjcLdZ1jT4+WU7xLxe1XEICKH7lds5KJR42aQSKQalk
 Buh8bFVepNcIST9gP4uMwefIA9eLvxu2Cy8QLqIXFyA9/1+rMuyk6BPw46eEQ6fhmpmh
 kgYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NBKSjZFt
Subject: Re: [Buildroot] [RFC 1/1] package/pkg-meson.mk: handle possibly non
 existing compilers
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
Cc: buildroot@busybox.net, "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Yann Morin <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/08/2022 12:12, yann.morin@orange.com wrote:
> Thomas, Guillaume, All,
> 
> On 2022-08-16 12:01 +0200, Thomas Petazzoni via buildroot spake thusly:
>> On Tue, 16 Aug 2022 11:48:29 +0200
>> "Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:
>>> To avoid populating the cross-file with non existing compilers,
>>> we tie them to /bin/false
> [--SNIP--]
>> Now, the annoying question: should this be done in pkg-meson.mk, or
>> should we do it more globally, i.e define TARGET_CXX and TARGET_FC to
>> correct values only when C++ or Fortran are supported.
>>
>> Yann, what do you think? Did we ever try to have TARGET_CXX=/bin/false
>> and TARGET_FC=/bin/false when there is no C++/Fortran support?
> 
> I think my non-work identity would also remember commit bd39d11d2eaa
> (core/infra: fix build on toolchain without C++), and the mess it
> caused, which was fixed by commit 4cd1ab15886a (core: alternate solution
> to disable C++).
> 
> So, yes, we tried for CXX, and no, we do not want to do it again. For
> consistency, we should not try for other languages either, I believe.

  I think it's the other way round: /bin/false should work fine on sane build 
systems. It's just autotools that is special. And we have a special case for 
that (commit 4cd1ab15886a doesn't go away), so it will keep working.

  Well, assuming that cmake and others will behave correctly with CXX=/bin/false.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
