Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B46C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93CD960BF6;
	Tue, 14 Dec 2021 20:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDcOU0NK2WT5; Tue, 14 Dec 2021 20:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB33860BF4;
	Tue, 14 Dec 2021 20:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3742B1BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B61813F4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ka2yUXuRDWXZ for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 369218133C
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:08 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t5so66836104edd.0
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=HuKyUVvL5UfGKdnzz+BPmbVzCopt2KIoeOgibXXBtf0=;
 b=TrK1nVs1AFWKtatPtyPVcgIyGQO1IZZ2oLuVKOfIriMj3jyjKwR1VSWCHWz+ihNmYR
 jQWmYIXotZHkp9alwjcS0Wvw9NnEAr7SpIZtcd0OJbqd2NrTH2qqKb8g+Xg71uLWHl8o
 /XHbL4wLPLhwBNYtT3H40UqwsJlr+kkLKbPurjysJoK0LU7Fiq278BAB8FUidGFO5CsX
 JdPMUrP+YSk84+Tchy2WQ5it8o1NzGWKIg9iI4hZ5r76Bn8yJk0Spy/5sOLKwN13R5ud
 GIJau1RON1hJ9pgliKu9SnIx/M2KXNL4vfDWr9X+H28bCsPnhCfcZLeeECtef9/GF3KQ
 77Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HuKyUVvL5UfGKdnzz+BPmbVzCopt2KIoeOgibXXBtf0=;
 b=8I9n6qj0wZbmlKb/CW7EKW9Uas40yl/ttydpJ590OaW/NV9xmI7uH+IGzjJUyHRhgD
 EORBDjl7EewQ6zyb9erDUqX8voYfp223+6GzRggNlCmrsZQRSvJkckhCh7lahDbpGqLn
 OQFcubo48ApZEmZphXXTjQBt4/xnrR/a4xPQZJEJeW1eaKzBAhwGLxnjL+ht9T8c6ufq
 OTrSTLIViMV7g2/n3JCm6/B6y4lFnELUiBJjAIZ24w4P6vIXqf3rDMx5Cfb+sCesA7u/
 MQ0x3TAJFFUFCfIO0Rbhta72kunlx8lxsW383wf13HX8Q2MZyXTQiNkoMjMJC/sWSzQh
 rd8Q==
X-Gm-Message-State: AOAM533I+WbWIrIAXtVyNcADu72s/PKnfJDur5j+oVV6c9FA8ltr6On0
 EaJoO/cHTPSeuFbpVFgpRYP+qYj1QYEXVw==
X-Google-Smtp-Source: ABdhPJwaT1VMIBos27IBEGwENjtSb4TuFNCaVpKuJ4E7VhVxdnFlruK/Ruu2/SFkm3iGFoAguZ7X/w==
X-Received: by 2002:a17:907:2cd7:: with SMTP id
 hg23mr8072253ejc.724.1639512606434; 
 Tue, 14 Dec 2021 12:10:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d1sm231216ejo.176.2021.12.14.12.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:10:06 -0800 (PST)
Message-ID: <c09a95c5-0383-ad61-35d5-4a25d1664ec1@mind.be>
Date: Tue, 14 Dec 2021 21:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <YbiPBtumWqf2+41V@waldemar-brodkorb.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <YbiPBtumWqf2+41V@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/ruby: security update to 3.0.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/12/2021 13:33, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ruby/ruby.hash | 4 ++--
>   package/ruby/ruby.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index e3510cc97e..1208461cd0 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,5 @@
> -# https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/
> -sha512  0f702e2d8ca1342a9d4284dbdd234a3588e057b92566353aa7c21835cf09a3932864b2acf459a976960a1704e9befa562155d36b98b7cda8bd99526e10a374c4  ruby-3.0.2.tar.xz
> +# https://www.ruby-lang.org/en/news/2021/11/24/ruby-3-0-3-released/
> +sha512  bb9ea426278d5a7ac46595296f03b82d43df8b7db41045cdf85611e05e26c703c53f700494cd7cf5d4c27fa953bdc5c144317d7720812db0a6e3b6f4bc4d2e00  ruby-3.0.3.tar.xz
>   # License files, Locally calculated
>   sha256  274f8d7983052448e7fd691c81043465c92ee6fb7bd8ab3f20a7997862f2778e  LEGAL
>   sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index b02744f0e5..7966450fd1 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   RUBY_VERSION_MAJOR = 3.0
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
>   RUBY_VERSION_EXT = 3.0.0
>   RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
>   RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
