Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC9CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E6A82884;
	Wed, 22 Oct 2025 16:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ET3mqywVj0Wv; Wed, 22 Oct 2025 16:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC21833DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AC21833DB;
	Wed, 22 Oct 2025 16:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69BB370A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B9ED6100C
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsJQC1Jw_fXm for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DAB060EF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DAB060EF1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DAB060EF1
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:51:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 226F2B97918D; Wed, 22 Oct 2025 18:51:19 +0200 (CEST)
Message-ID: <acb56075-5740-41a2-ac51-e313e829143d@rnout.be>
Date: Wed, 22 Oct 2025 18:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
References: <20251014111227.73245-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251014111227.73245-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ye2eExD1unwoWWm2UQNv/RKJY3sFRPMS5YWjAuWhQOo=;
 b=O83ssZwl2+4PlEhEN34qUdobIOXUnLSQoRvLXeqBHEyszGeP2+4xhAZj3wUmw4g1R+mDd6
 uacUCiCFsqEv/vMTNi5C8ys2lHE/u4/8V7xw0A8la6p64PG+Cb9QJkYq3EqMhJL39jhlnL
 Xv/lFiFF2rdfZQWgth1fhwYl/jJmkePnODPClMb166iOuTEC6qpt8fRXQa6Hy3oVSMklWo
 dqD3LjY/BUP6KToOgIikVph+VF23WXiaArGy7C2R8ov2N0sM8G/6kdBqD1c0gRJdwrnLRR
 n7IcZRN9pjsQTcdZkeR8iSP7buIdRSzva3XcysFPiuo501vKVH0SZKwX6YVyzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=O83ssZwl
Subject: Re: [Buildroot] [PATCH for 2025.08.x] package/redis: security bump
 to v8.0.4
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/10/2025 13:12, Titouan Christophe via buildroot wrote:
> See the release notes:
> https://github.com/redis/redis/blob/8.0.4/00-RELEASENOTES
> 
> This fixes the following vulnerabilities (in the Lua scripting engine):
> - CVE-2025-46817:
>      Redis is an open source, in-memory database that persists on disk.
>      Versions 8.2.1 and below allow an authenticated user to use a
>      specially crafted Lua script to cause an integer overflow and
>      potentially lead to remote code execution The problem exists in all
>      versions of Redis with Lua scripting. This issue is fixed in version
>      8.2.2.
>      https://www.cve.org/CVERecord?id=CVE-2025-46817
> 
> - CVE-2025-46818:
>      Redis is an open source, in-memory database that persists on disk.
>      Versions 8.2.1 and below allow an authenticated user to use a
>      specially crafted Lua script to manipulate different LUA objects and
>      potentially run their own code in the context of another user. The
>      problem exists in all versions of Redis with LUA scripting. This issue
>      is fixed in version 8.2.2. A workaround to mitigate the problem
>      without patching the redis-server executable is to prevent users from
>      executing LUA scripts. This can be done using ACL to block a script by
>      restricting both the EVAL and FUNCTION command families.
>      https://www.cve.org/CVERecord?id=CVE-2025-46818
> 
> - CVE-2025-46819:
>      Redis is an open source, in-memory database that persists on disk.
>      Versions 8.2.1 and below allow an authenticated user to use a
>      specially crafted LUA script to read out-of-bound data or crash the
>      server and subsequent denial of service. The problem exists in all
>      versions of Redis with Lua scripting. This issue is fixed in version
>      8.2.2. To workaround this issue without patching the redis-server
>      executable is to prevent users from executing Lua scripts. This can be
>      done using ACL to block a script by restricting both the EVAL and
>      FUNCTION command families.
>      https://www.cve.org/CVERecord?id=CVE-2025-46819
> 
> - CVE-2025-49844:
>      Redis is an open source, in-memory database that persists on disk.
>      Versions 8.2.1 and below allow an authenticated user to use a
>      specially crafted Lua script to manipulate the garbage collector,
>      trigger a use-after-free and potentially lead to remote code
>      execution. The problem exists in all versions of Redis with Lua
>      scripting. This issue is fixed in version 8.2.2. To workaround this
>      issue without patching the redis-server executable is to prevent users
>      from executing Lua scripts. This can be done using ACL to restrict
>      EVAL and EVALSHA commands.
>      https://www.cve.org/CVERecord?id=CVE-2025-49844
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/redis/redis.hash | 2 +-
>   package/redis/redis.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index c66223f2da..e9a495d633 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  33f37290b00b14e9a884dd4dcba335febd63ea16c51609d34fa41e031ad587df  redis-8.0.3.tar.gz
> +sha256  7e185265d455ea8deb6bb7e071352ea691ca4d7b5105fc172fa524af59917b89  redis-8.0.4.tar.gz
>   
>   # Locally calculated
>   sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 5ffb2a929f..b954190546 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -REDIS_VERSION = 8.0.3
> +REDIS_VERSION = 8.0.4
>   REDIS_SITE = http://download.redis.io/releases
>   REDIS_LICENSE = \
>   	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
