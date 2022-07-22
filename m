Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0C4C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 22:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B029660F45;
	Fri, 22 Jul 2022 22:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B029660F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFAOrOA2uGvn; Fri, 22 Jul 2022 22:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9877260F41;
	Fri, 22 Jul 2022 22:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9877260F41
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23B411BF228
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 22:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B67140002
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 22:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B67140002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAG3szo9JEoH for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 22:03:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1667340414
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1667340414
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 22:03:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 r9-20020a1c4409000000b003a34ac64bdfso1126wma.1
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 15:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NxxBcnYedfYgrUsS2LxfTbyN7KTHtMkLxiygnykWpsw=;
 b=Nbk8s8iUPHTlrCl/k0xEdwnmrxfTtE/bQgGVVNC7A4O0Pm0gxC82BliNXC//gcSLn3
 UoH6A+Dy5byR/wg0L0oahfUnnHh5P/Ob4cAJEqKdUjRKry6PK5Msg2sUURCUHBMMelxI
 OV9Q5HLJKiL1VNRvaDqR54zCvVYl0xx/pFaoHstzxyH+fsoX9BYzkgr3OK3iqmI0kOXO
 NAXCfIAODfE1JlmBMMawfMBFWDfXIqjden6aFGurM99s+t3vWhGFm4j9JzvlAojIy+gT
 dPQ7fAAXSuNN2AI0OxdFE6Q+e3kfRoYNwopAZGztVU+4c3P1LtWlLZ1GJz/XUNjTz+o9
 ANkA==
X-Gm-Message-State: AJIora8MXhuMnnrH6G75y65B29P0UfDKv00TZhSQoxY9pHt2tWmnHuxZ
 cEQMiz+49H8cSaptQzRhNHhbCg==
X-Google-Smtp-Source: AGRyM1smEk+JOoUomTRQzjoFl23B+02mEgKx3zOmc+L677MnsBCEohh3485tuBMKYbOtlnV0Fl1Oww==
X-Received: by 2002:a05:600c:1f16:b0:3a3:214c:a85e with SMTP id
 bd22-20020a05600c1f1600b003a3214ca85emr1069544wmb.95.1658527399060; 
 Fri, 22 Jul 2022 15:03:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 m39-20020a05600c3b2700b003a2e1883a27sm13120570wms.18.2022.07.22.15.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 15:03:18 -0700 (PDT)
Message-ID: <65b22e0d-1a50-54e9-3ad2-92e3d804ebbb@mind.be>
Date: Sat, 23 Jul 2022 00:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220720125707.1899437-1-festevam@gmail.com>
 <20220720183856.742c4a09@windsurf>
 <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
 <20220720222430.7eb519f6@windsurf>
 <7202d505-f0fa-9fba-b21b-8dc8cb44b01b@mind.be>
 <20220722231518.1536cd2f@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722231518.1536cd2f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NxxBcnYedfYgrUsS2LxfTbyN7KTHtMkLxiygnykWpsw=;
 b=eCfna2lU/WxLpOxLgCoZJPuAethD86uxaNz+OmeLUlEdM2/JOEsAtLJksXIKqaRin7
 RsoMKZVzCAEJ1/ZKCAhkHg5xjWghDaN3b8gQxpj4BnG+Ty1AwQqKaiuL3jy6vvdTAuhf
 aAvEg8kzHckl2+lpHYR3vjBlIVAzDtCEqnBDz9YN28DOwVlJgZavmzqV9uhQPVY3keHk
 0yy3RJZR9a1aAr+5vyvEaojmn+Ug+GYroJM475ronrakR5p26BcE0NDWwyk299kcLacA
 /EHYKq8yTxZSiIkv5v44aJ4vEShYRgJGvmL16hlT/wqQiXJwsb9p/TjeIh+pmQEPNeVl
 azgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eCfna2lU
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: "Barisani, Andrea" <andrea.barisani@withsecure.com>,
 Fabio Estevam <festevam@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 23:15, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 22 Jul 2022 23:04:57 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>    AFAICS, CGO_ENABLED is only set in HOST_GO_MAKE_ENV, which is only used in the
>> host-go build commands. So it's not really possible to set it per package.
>> However, apparently it is possible to override it:
> 
> I see this:
> 
> HOST_GO_COMMON_ENV = \
>          GO111MODULE=on \
>          GOFLAGS=-mod=vendor \
>          GOROOT="$(HOST_GO_ROOT)" \
>          GOPATH="$(HOST_GO_GOPATH)" \
>          GOPROXY=off \
>          PATH=$(BR_PATH) \
>          GOBIN= \
>          CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
> 
> HOST_GO_TARGET_ENV = \
>          $(HOST_GO_COMMON_ENV) \
>          GOOS="linux" \
>          GOARCH=$(GO_GOARCH) \
>          GOCACHE="$(HOST_GO_TARGET_CACHE)" \
>          CC="$(TARGET_CC)" \
>          CXX="$(TARGET_CXX)" \
>          CGO_CFLAGS="$(TARGET_CFLAGS)" \
>          CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
>          CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
>          GOTOOLDIR="$(HOST_GO_TOOLDIR)"
> 
> so HOST_GO_TARGET_ENV has CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
> 
> and then HOST_GO_TARGET_ENV gets used in:
> 
> # Build package for target
> define $(2)_BUILD_CMDS
>          $$(foreach d,$$($(2)_BUILD_TARGETS),\
>                  cd $$(@D); \
>                  $$(HOST_GO_TARGET_ENV) \
>                          $$($(2)_GO_ENV) \
>                          $$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
>                          -o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
>                          $$($(2)_GOMOD)/$$(d)
>          )
> endef
> 
> Am I looking wrong?

  No, I'm looking wrong, of course. I didn't see the one in HOST_GO_COMMON_ENV 
because it comes before the definition of HOST_GO_CGO_ENABLED :-(

  So indeed, the question if we should have a per-package option to enable cgo 
is relevant.

  I'd actually expect that the package itself would specify whether it needs cgo 
or not. Can we test a build of a package that actually uses cgo to verify if we 
really need to set it in HOST_GO_COMMON_ENV?


  Regardless, we *will* need to set the 'osusergo netgo' tags for all cgo-using 
packages when they do use cgo - so either we still need a per-package "enable 
cgo" option, or we should just always add those tags if cgo is enabled and we're 
doing static linking.

  Is there any reason why this problem is only observed for the crucible package?

  Regards,
  Arnout



> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
