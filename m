Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4124C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E75A80F87;
	Fri, 12 Jul 2024 19:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AREit_3Vdoql; Fri, 12 Jul 2024 19:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C06881053
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C06881053;
	Fri, 12 Jul 2024 19:44:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5AB1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B15760648
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPDsaXJlPMGZ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:44:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CE3F605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE3F605AD
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CE3F605AD
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:44:19 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso15978095e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720813457; x=1721418257;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNoV0u6Gde6JSV6sJHmghNOOLjhYf3koTL5b2OuFiww=;
 b=gGK4eCyKeo/LCJDlM8vuveGbzaiVmB+bOa8+8sSd8895kRiwW78/TyU+j8IbtgCvJe
 SP5beKOd1sUTwZdvpUWyyArSVZaUE5KuLZOdj9f0jBHB2qNxBpKjbq5u4VNlu9INxV+B
 5r0HkgOZTC6qXS++t1e/UqTHfAfztJl1WdRlur17gkCzwYxJeL3gNRsiAShjKlV8ppth
 9LaKV5YmEA5EQWU1eNbpgOpmFyzPKh4/l5gnvzAxrNARkWozVll2lKUyhUWXnYuKS1gV
 AE675s79GJfs74z547Vcib6z9GD7JevqCi3eH408WGwkkpQFcRvzl6/Cxeulw2302Qg1
 EYZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm30/qYLpLrlVnKhTwR3jsHGxh0IKN/KCbPEf9yObrCkggmnONEzbCZks1dSj74zN37b2ZQWraWguYoBBduBkhrab9/mWPEw==
X-Gm-Message-State: AOJu0YxeXCHvY++N+G0IqYv7rDOg9sFHNl9mLX5YygFC4upu0i6wDpRW
 ST50L8GLqZuHS5SxtDjkwYbHTPXUmOYMdkOMawLJjyGLvsmCx8MBDwZlP56pHx9swlam80E5ur2
 nzWc=
X-Google-Smtp-Source: AGHT+IEkPEyxqGVKlIn5dkHG939dWxUAmzPoGGEnifiwe6Gqx2Na5U6IJZjmhp+MPd1bCfwR6OpVTw==
X-Received: by 2002:a05:600c:1715:b0:426:6000:565a with SMTP id
 5b1f17b1804b1-426707db79amr88481115e9.16.1720813457297; 
 Fri, 12 Jul 2024 12:44:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa05eesm10802414f8f.84.2024.07.12.12.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:44:16 -0700 (PDT)
Message-ID: <fc53aba5-aca9-4fd6-96f1-906708e59b4c@mind.be>
Date: Fri, 12 Jul 2024 21:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZNkWXvyVT1DnVHG0@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <ZNkWXvyVT1DnVHG0@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720813457; x=1721418257; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KNoV0u6Gde6JSV6sJHmghNOOLjhYf3koTL5b2OuFiww=;
 b=Gy3xUmyO5ZjSqbHOMblDY0WZBos4RKj9kzbVEER+rIHomQ5755a0hYZsxF841zjOzN
 dgn5YMxMqKlCUk2fPmX20xyyhBu4u0AqCigK9jk081p6O2r+y4Y+uoTfkWgO6nW7ME07
 fXm3Vi8E0aji7/wwjH2nrcV2Fda6FiIJgd8fzMLtZ3y1bGEfTWbGpekDk21F5gU7I59n
 M5f9eB0G2h1LMJpuhkxErLOd2+tWKwTmEhUWZAL4rCmMnV6TB4lu6aDl7GiTZDthnoGO
 AtS3AOCbS4oAQw0JCU+z6a7VYRT+hqyN7HiWiiWMjx1nIeVPxZxhfmbKWWMjh+IbAauN
 EObA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gy3xUmyO
Subject: Re: [Buildroot] [PATCH] package/ntpsec: fix compile issue for some
 toolchains
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/08/2023 19:43, Waldemar Brodkorb wrote:
> Ntpsec unconditionally uses PIE to compile code.
> This breaks compilation for at least microblaze-uclibc and
> m68k-uclibc toolchains.

  Also, in Buildroot we anyway have BR2_PIC_PIE to handle this appropriately 
according to toolchain capabilities.

> 
> It would be better to add a configure option to allow to disable pie support,
> but this is something for an waf expert.
> 
> When accepted, should be backported to older releases of Buildroot.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/77f/77f4e4065874d022a2ae98d82508242f551e224c
>   - http://autobuild.buildroot.net/results/e45/e45b65f2aa323df075d54ff43b0401b5ac7c6eb5
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ntpsec/0003-disable-PIE-support.patch | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 package/ntpsec/0003-disable-PIE-support.patch
> 
> diff --git a/package/ntpsec/0003-disable-PIE-support.patch b/package/ntpsec/0003-disable-PIE-support.patch
> new file mode 100644
> index 0000000000..64eb559de0
> --- /dev/null
> +++ b/package/ntpsec/0003-disable-PIE-support.patch
> @@ -0,0 +1,26 @@
> +From 712675fbd2a736df817fecd7bfb39055946ef85b Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Sun, 13 Aug 2023 13:48:03 +0200
> +Subject: [PATCH] disable PIE support
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: N/A Not upstreamable
> +---
> + wscript | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/wscript b/wscript
> +index 292e3a45b..105c7eac2 100644
> +--- a/wscript
> ++++ b/wscript
> +@@ -299,7 +299,6 @@ def configure(ctx):
> +
> +     cc_test_flags = [
> +         ('PIC', '-fPIC'),
> +-        ('PIE', '-pie -fPIE'),
> +         # this quiets most of macOS warnings on -fpie
> +         ('unused', '-Qunused-arguments'),
> +         # This is a useless warning on any architecture with a barrel
> +--
> +2.39.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
