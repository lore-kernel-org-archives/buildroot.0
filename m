Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B478EC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8766D60D65;
	Fri,  4 Sep 2026 12:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVltyPojl8vr; Fri,  4 Sep 2026 12:18:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 86E5F60D4B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524309;
	b=OigfZYUtOmJPvvxp9zOS/uUTTvYUzETj46Wooc9LZ9uIoiLlYuS4ZRR9mw40UxwJZmPG
	 jG87UIqxTB+5IQU2/bpmzatrX2hO2qG2kGGQ3d5EQPOhPOA2xiy+eZTlKcjJeyUxmkqaO
	 Sng1g1Z9KrkC7R4aeKWpaJ+Bdp+oxItrKW+iht2jl0nWNt0ZsToVonlNH58XFEpfqpJLX
	 +d4z7i6WiWOVolrhtp8AYEpPmfv2GXcsD5UoZl7UaVUKLJAtvepcoOdQGijAUpkjAef65
	 0TFzOCEa15jnCmnobTatUfZl+5go06Y4zbwKn8LVGHyI2lsUWDvhhG0y0T729FyG8VQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524309;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eAaN5EdiHevc9E7U6GA7y9MRRHBwX8xSWv3gwgyAJz0=;
	b=mKZMBBx1hmxGc2Y+ZJjA6DJthbIbmhPZPEqVUpzPxpZgz1AcR80g92CKGe88DexT/LX3
	 JdRNJa/myFYc2Tr3EJTCUcCgH1UF61rCGZeL7djsUHJE6SIkdPh5g952JUnbfht3CIK0T
	 OjiDGBhStEIj97KCl/2l3vNNQkY2QVSB3osc3QmTyP6jLU/+Wbsznv8Aroz90+vvbbOSz
	 ModUPkjlcjGUr6VIRxPG0K7D4jJ++PVzHKZdJxdT7AMaoUGiIFveJH1YswojuHCwQT4s7
	 2wzTEnPuVzkWXxVReSAvdveCy3e2Tj43TqtJO+qEcyCwzkDWMcVwKoZjwyTJM1MAXoQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524309;
	bh=eAaN5EdiHevc9E7U6GA7y9MRRHBwX8xSWv3gwgyAJz0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MZWgdoL5BZhghR9oRCknpkdCxffR5i8AJas9asNkdmmO9BHH4Md8V54T4STATWZzg
	 9E9DAbHNpXVgUso+9W0w0JdKxYnwO6z4SLHW34YiWLNWOmBvfhGJ75bwe/9/O2a6ks
	 8nQFwdfjGShxNV9+owrYqYVsPSsJR0qaWyAfnRCbBJLC+0aGd4Nk7lq4GWj6Xdv9P+
	 bLqVmsm6ueeJJJOaabmphbC71mERt8ckXUCBH/DT1KeZRVJ5zu9QdDeeOOvf8i0/gF
	 ILsF13B7YoFTV76df+kYtMGciGy2hhgiCBq55X1HsFuLL352ZUCBiatOoB2pfmYlpo
	 eZ9WDEJKzlulw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E5F60D4B;
	Fri,  4 Sep 2026 12:18:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5B4A10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D7C060BCB
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQLCUNlyeAjH for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AAF160BDB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524304;
 b=iwwV5Uxa6Vy6kFLjCf90I3hcG/Rrb5osUUgzSRtWzZt/nc0Bl2wGDyURKvm1StxEdhpY
 BvtH/E0DBKkKPrLh6bM3QQALHeG4kGo2m8M955KY+4QbFi5VFtRDPKBRiiTL5ZkNl44V/
 CUVg2JS+CjjMDRkkLcbXYPyO41EcQJOAWvNkVxx3qvJsim/h6iTLb3xknDbZXrteg0ynA
 gYothqu53VM8lZwoTQmOgkDkZ+50674RL3VNfPgI9jCewkivLfistRQGq5f2arUcRqdql
 m7+22qUvgoE+/1uJN2vG47c+nvw0qiBjxz/p1qU1aeXzZzI/23cxdl6WYZNs/EKeTFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524304;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=rkpuUitofj8jWkLJwvfh/SvGc1QuWRPqWC3VbFTIMX4=;
 b=CKowYvnfQQAHx3KDfWImAla/8ut2hYhkTFqeTLaVkpolp3nmvRZZmjLiJvUr3FHhji32
 OX8juPBq/94WahegyU6/zGipQGPhiz8tICp6ATJ2FBbexoYdi4XO+ZWafq60TtcPEOaq0
 Lj3oSm0w+9eWSO8LKuub3Ic3CfqBBTjqdH5guTl5liiLOo6oVfWD7nh1S9MFA0JyC0kzT
 EQ3l181/dg5JAFaBtLcDNg/3xeA+MLPqMtM39roybWAiOKqQ8Obzfvi4lyeNV2LxUhs2C
 t9x3jvBGvnANhCDMXypcUjp0atsKJs6hgTk/i3Ek71mYjaxMv6Y4hFtZ7C7fPb0b7Xw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SyqjYwyR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AAF160BDB
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-482f9309813so851125f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524302; x=1789129102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rkpuUitofj8jWkLJwvfh/SvGc1QuWRPqWC3VbFTIMX4=;
 b=huhdJ10bv5/n05hvcrbyE623wP/QoTBB3/y6k64UgsUnYn64q0mW+Sp+/XaC00X1kV
 MPYORGeHz79FDOxqUXE/S1z7Gl9ujoJ3loLKJDBrJzV+5eslobNvroGiOSegGS9A7I6f
 gNqZKGx5GbmOmK0GtH2NP2ZE6kX2l/1XadglRs0QMGu7HyOyob/KUMs6oa7YdxDDt5a9
 k9z3rcbJCDj/k18v2M0qdz1e/BaIK2sqLvJbqfXhRM7KsXEp+1pQlbB8u32K0UCDvvlF
 kJz6jsjbiZZcYmgB+YLWlrjGNYbpPFh14S03dJi+wcuqx8BRMpyIIstTWypcffCgae53
 q7DA==
X-Forwarded-Encrypted: i=1;
 AKwUvByBN/vdERF2xb3u1+bQvZxIvw2NlCI/XxRU+PM8QuXlvFTz48VGki2V/w4DpO4LEk1vnrSlsR5cDSA=@buildroot.org
X-Gm-Message-State: AFuF++nAUa/in0PVorYukrIN8p0VBwN4mFPEdYrwaCoNkBxg6ahAk2w4
 vYqpw+fQW4YxIOpI2WfNhbID9jTNcID8lOSOLYQaB6cp6YlU8Kvo7Uiw1RUsLzzcLartuy1LXUt
 rAWM3
X-Gm-Gg: AYBFou1R6lyPp7NlI/VzzqZbrFhpTNIMI8SUif4eae7RREZHtdXy5ovPydRXkUVR88l
 OkIS76WLr8yEBRl4/KFAED0/duaGNor5Q5Fb1DcYYxhO0Z1akfLoTCgJYox7PDF5jwLFHrhCajF
 J/XHJbntIWuBnqxzdUhdV7zRglb/VonIE5NHTUB23oA2orMeFaes8L25CAWeJu/8SBIApu/QPqg
 FtMdznLiMxE5l3BcLCgjb9ap3y6nwZp1Ie85GIr6MFgYNQY1eVsonaSmYl4ANZZBKgFjSuB+7UC
 ssitU9JYf+Urcm21XgCfEQGuDH7Wmj5edCYWzN1jDKS7+XJjTyaMQgNOG0r4dZN6z302ivVysnA
 RbIMSq4e7cpbUyognQTdlXfv5V9loMycJEHpvTphyyXt4niFrd6htUzTMaUaNJ7bAIuY19IF4Xa
 i1zRStq1luCyNhTfzde7AR9/cNJm2CT5j56FcpxiNAPsGHaPOoPhpb5A==
X-Received: by 2002:a05:6000:4812:b0:485:8c16:5ee6 with SMTP id
 ffacd0b85a97d-4858c16606amr2944048f8f.32.1788524301750; 
 Fri, 04 Sep 2026 05:18:21 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883acd33sm5920028f8f.18.2026.09.04.05.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:21 -0700 (PDT)
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:21 +0200
Message-ID: <20260904121821.404992-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e74945f5-b386-78e7-722b-38add0d4dda1@crashcourse.ca>
References: <e74945f5-b386-78e7-722b-38add0d4dda1@crashcourse.ca>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/manual: post-image.sh/post-build.sh
 should use '-', not '_'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Even though it's only documentation, the form of the names of the
> post-image.sh and post-build.sh scripts should be consistent with the
> names of those scripts used in the code base, using hyphen, not
> underscore.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> 
>   I can see the chaos that is rootfs_overlay vs rootfs-overlay. Not
> going near that.
> 
> diff --git a/docs/manual/customize-directory-structure.adoc b/docs/manual/customize-directory-structure.adoc
> index b4b5d50e1a..aab225811b 100644
> --- a/docs/manual/customize-directory-structure.adoc
> +++ b/docs/manual/customize-directory-structure.adoc
> @@ -23,8 +23,8 @@ to you.
>  |           +-- linux.config
>  |           +-- busybox.config
>  |           +-- <other configuration files>
> -|           +-- post_build.sh
> -|           +-- post_image.sh
> +|           +-- post-build.sh
> +|           +-- post-image.sh
>  |           +-- rootfs_overlay/
>  |           |   +-- etc/
>  |           |   +-- <some files>
> @@ -84,7 +84,7 @@ layers 'common' and 'fooboard' is:
>  +-- board/
>      +-- <company>/
>          +-- common/
> -        |   +-- post_build.sh
> +        |   +-- post-build.sh
>          |   +-- rootfs_overlay/
>          |   |   +-- ...
>          |   +-- patches/
> @@ -94,7 +94,7 @@ layers 'common' and 'fooboard' is:
>              +-- linux.config
>              +-- busybox.config
>              +-- <other configuration files>
> -            +-- post_build.sh
> +            +-- post-build.sh
>              +-- rootfs_overlay/
>              |   +-- ...
>              +-- patches/
> diff --git a/docs/manual/customize-quick-guide.adoc b/docs/manual/customize-quick-guide.adoc
> index 315027c590..360cbe9622 100644
> --- a/docs/manual/customize-quick-guide.adoc
> +++ b/docs/manual/customize-quick-guide.adoc
> @@ -35,9 +35,9 @@ your project can be skipped.
>     Set +BR2_ROOTFS_OVERLAY+
>     to +board/<manufacturer>/<boardname>/rootfs-overlay+.
>  . Create a post-build script
> -   +board/<manufacturer>/<boardname>/post_build.sh+. Set
> +   +board/<manufacturer>/<boardname>/post-build.sh+. Set
>     +BR2_ROOTFS_POST_BUILD_SCRIPT+ to
> -   +board/<manufacturer>/<boardname>/post_build.sh+
> +   +board/<manufacturer>/<boardname>/post-build.sh+
>  . If additional setuid permissions have to be set or device nodes have
>     to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
>     and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
> diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
> index 4d03d04617..b7fe5813f7 100644
> --- a/docs/manual/customize-rootfs.adoc
> +++ b/docs/manual/customize-rootfs.adoc
> @@ -52,7 +52,7 @@ Using post-build scripts, you can remove or modify any file in your
>    post-build cleanup scripts.
>  +
>  As shown in xref:customize-dir-structure[], the recommended path for
> -  this script is +board/<company>/<boardname>/post_build.sh+.
> +  this script is +board/<company>/<boardname>/post-build.sh+.
>  +
>  The post-build scripts are run with the main Buildroot tree as current
>    working directory. The path to the target filesystem is passed as the
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
