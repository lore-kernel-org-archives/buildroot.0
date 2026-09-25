Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8E1C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E287781349;
	Fri, 25 Sep 2026 14:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQhpOnCtp3Fz; Fri, 25 Sep 2026 14:44:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F61E811AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347488;
	b=LrnQldqbetEqBHxhX64Lc4BAnyb3dLHrZsjEe8ezLV3TXmUOttmBfF21hQzwIcUuwF4J
	 LP6tONy2hVPuqPXld0taos80wK47khzWaL4x17hIvhA20QODxKdPTYhT7ux9jIU+1BfUt
	 HBPjMIvRiRaeaAZv31SLHfQm2MxYaOUZqspCy/4L0mYtcSSmtEPC6PHxJ0HgNPyb8UFro
	 KT2i4dy4iiDPhvJPzKhDuaoRpU44j2Ty6ZJJNv8t6hP7vv0FEMl4fhNEndtbcUsTPXUce
	 ritL7vl7Q6fpzjFPfv1ndDFkcjVJfkrSJdxCUQ8QQKV12a86jw20RxotXuN3V6G3prg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZHgOfH3eoCse/DTWpDmVMPYpYnbKcJC4TFkeWWNRTps=;
	b=O9SURuX+TE2uHR27bFdY0NC6+8pLWGJKuroHlrunoLa57hDRr7PLno54/Gk5eW0IK8dC
	 kaJMk7xPRU3mpJ/1BFKQ0iDcSPlf/b99FegfKayrR7DEkDHypAJErexQQbL4DG7BaFL24
	 veQoTcTd+TJmvsco6LNCtn2BQQ+BWqCyd/2BUaH8f9RjXLHvqU0co8GYpOIZ1a/xeyUkK
	 DipAhRWOjIUhsoZgcCjbJ6M1QEHUvE4vcY86prhxTCqQpRPvE276XUhPAeS63eJaxkVk7
	 eV0E+8p43glRDKbls+CRc6DwtXDYniohqehjsfq3zY7Z1ZNQLyNKMt8tae6/O8JeOwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347488;
	bh=ZHgOfH3eoCse/DTWpDmVMPYpYnbKcJC4TFkeWWNRTps=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xeypn1t+8KbVYtovqE8UakZDnRSq9v9vVNCHYlMvKKplXVm3Zk6bT84eqBdNIs8ZY
	 JzifSiLeaBNCPyZVIZrT5oIlh7rAayE/VdepjTNeN8dkQNc+415nY+BBFcS2HmvDLN
	 9xeLc0AMC9Anbj/Fm47HAx36mmryLzwHC9NCVfzqefeVLgIchoKrsmtLjIV7ZU/o5W
	 BXxkgcDojVUF7fRgQ/AZrlQOgEZ6/xOvrLCFjV/zhHnV380grHbLtvuM9GMEpHcPQy
	 wQ8UmooD8TSPMSAFOrbXMLXEX7vF9yy9ceGHcU0a1cWpyxGPZD1Fv7AQKP8q9MiWpN
	 6uVCJ9NotYUVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F61E811AE;
	Fri, 25 Sep 2026 14:44:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1C1D332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3D80407FC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13-VhpWb9YnM for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 009B240790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347485;
 b=OOEJ8SY78YdHr/gGqiT1x2cyn7sEj1BMyBwNPFPqaG+ScPugMHU3ZvZwnkolXJNfjQPk
 S1ZBZsgHtKxZREKSHOeWps2lKMXE1J5ln/DCjoJ2nVmHbToIYqMYNSlakQCYJB/I80buf
 sHaLFm4s2rhGw4huS3iaBXZfNDfNey2eQy+9GRawjLcNblXi7mVi3P8WAQ5heSnxuoTR5
 WyyLIeWT3QvtpZ5MDOpl6lgugHMHfrfOt02Z9e4ltApslAn490DSx0kxcErp5MD6a4bgo
 1bdE/60T4JKvHAhCt/Rj0gFV2KaeE25VdAp4rJLc9ppwlBAP07Pd8XP37+B3MlFlVkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347485;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=9qMCmy9P1aowuuhdlV/JXUdM/x2CM+Zp1ua3XaDWZVA=;
 b=CR00XmWBryeQkwsEHbMfBB+HfFXvuL3lTK5efRygXO9rVCSDa9ucc0tQPgxk4HGFbeMt
 Hnslhg+R2f3tLhwVGlwzN1fTsCI8jg7/Uv6PdrJzpsfl6QJr21VH7pf8hfgfhitODQa/W
 Kc+SnPdO6X4hj96IIgQtrg7PdqnqapqfnxtSmVb8t/XM7ZwlmAeydEzFT/yN6s3ZtPRVz
 721QTO3QYbDEQLwFEijse/krMFBARFiVzahjL0qvRmxUrmOppmwG+4Q6/1Ovp07LkVOvq
 5m8gGSlIJ/KejkjirojlvZ2OkuNuT4zh2Rv2mbK3npuQO3LH06ihv8k0smDSRlGaiAw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K5nhDKBY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 009B240790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48586861639so430678f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347483; x=1790952283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9qMCmy9P1aowuuhdlV/JXUdM/x2CM+Zp1ua3XaDWZVA=;
 b=YsiNmXU8Ac2LDsmHjTdnYjJpMgt2dA1A1cDs8/hshNVdF7RMRrecIf+vWffHzo4y1Z
 qG1jpa65ZdDY4jXYuU7dOPUmbsfzpOlaE5heZaKtEvthTympybNMA7UZqkcO6KSHR1pk
 Bc5tVt8KDkTAQcpbq9IA1xkykDCf4HZ9/o/wcZtNsYqWaL/zQjTvL4IAWhGkUgWCEZEx
 TvgBdTs3pYgxua1QrL510qIAzGOVZAqBj/f3Kx5BLMfKWXZKlVJYepaFlJseND8vGl+W
 Mp1vHI3MOdisnWD518yq4CUSqiFB40UF/oz9VSnJGL+CHoibPjXpxeRq8Cls4bGHUqN6
 nzMA==
X-Gm-Message-State: AFuF++miioV2PZslM8QhzVpcbYKz3kAYNvPAM8m35EeLodbCpt3An4XE
 KC10ncPmvbT7+k8RKHqGwm9+nvD2IgRfv5dDFMe8ACxQtqmDU9okgWas9Y2jz09RtqGXaVAN85T
 m5tNNEQ8HMQ==
X-Gm-Gg: AYBFou0m5UpuwMArCcKGvHSsC6tYZwmjUGXD+4hALDfRp7EZFc2BfFhxmd9W2aG6Gsq
 2VnoFPufFM/H61I0avlWxm9cbm2/Li37ubQox6Nhgtfil9gH1nXru+Y/SuHVxS3Tq264cxkU+ee
 IXebyByRmGrgMk0o6O/E4nvf24o6j7coBsGAfbFA/CRbn5IkM0k0pgYnkriQXPB/69T31yGsl1K
 aSBPNESH7bF+tIGrUkXcLuLt9+0bbzsleqqlGPgTksTe9h2744nq5qvgUx0y1zi1M0dZFIsEUFk
 86D5rhsjAOLJDKA3B4i5bhRuQ2sYfOqrPynPIjbfm1S/3bVxlau3RQs3hXJkbZ8ZqXFPEsOv0qW
 X133+14THBykBZFHc62OVcAAkC4KhQQL1WkrEN5r706KofAfXUShL1l4rbbjWWPSku1jZRJCXqR
 swBeb6lS4xOnAOFEyc4MIV/I+LH+DQkXQCWh1hf+WLG4LpygVTjT+uR1FYmW7ZewChUq9H18+2S
 5VFM45J9nXDzj99zPS3Xv1WgZm0AXdXh8ksQsHgeyDIqZUtlGE3
X-Received: by 2002:a05:6000:4384:b0:488:7ace:9c5c with SMTP id
 ffacd0b85a97d-4887acea016mr4503250f8f.23.1790347482703; 
 Fri, 25 Sep 2026 07:44:42 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a3625ccsm7967257f8f.22.2026.09.25.07.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:42 -0700 (PDT)
To: buildroot@buildroot.org,
	Michael Nosthoff <buildroot@heine.tech>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:39 +0200
Message-ID: <20260925144441.4096576-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914142449.618072-2-buildroot@heine.tech>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: fix kernel headers
 dependency due to seccomp select
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> In commit
> 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
> version 2.5.3"), the kernel headers dependency of seccomp was bumped
> from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
> reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.
> 
> This commit fixes this inconsistency.
> 
> Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> 
> This is a 1:1 copy of ef92929504e842a1798128988eeb4d959a1a8931 which was
> done for webkitgtk (even though it only had "webkit" in the title) but
> forgot that there is also wpewebkit.
> 
> ---
>  package/wpewebkit/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index c4ee5a27f7..03e9eaf59e 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -73,7 +73,7 @@ if BR2_PACKAGE_WPEWEBKIT
>  config BR2_PACKAGE_WPEWEBKIT_SANDBOX
>  	bool "sandboxing support"
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
>  	select BR2_PACKAGE_BUBBLEWRAP # runtime
>  	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
>  	select BR2_PACKAGE_LIBSECCOMP
> @@ -81,9 +81,9 @@ config BR2_PACKAGE_WPEWEBKIT_SANDBOX
>  	  Enable sandboxing of the processes used for network operation,
>  	  disk asccess, and Web content rendering.
>  
> -comment "sandboxing supports needs a toolchain w/ headers >= 3.12"
> +comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
>  
>  config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
>  	bool "multimedia support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
