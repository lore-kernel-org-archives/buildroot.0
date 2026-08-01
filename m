Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52915C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 12:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1970D80816;
	Sat,  1 Aug 2026 12:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdKaD6dQl6yf; Sat,  1 Aug 2026 12:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A27DA80780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785588560;
	bh=fwRlF9xuBH64Vw1ewfK/2zbVUlD9gJWnRE5xtwUY83g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PzfLDDmxzamcdOZXUoP/GIAY1uIltdvpfe1F9vY6cEZGf62EubIAxFBdIBwfnmB1O
	 EypRsmH89YuV+D6l7rcgWKfLL9CklCgdCSadGGXEMynlPrrHcjEhvZ0dBNhrm4+nb7
	 OorG6fxPqEKFXpTPKlhsBCFoPTeHdEbKmJ/Tj0Q7u7wtEQ3W8pbSvma7V1H95ukk24
	 YnJ8+bsW9rUp8alvQ0C6xExutgpuaZedX+vo+nMZwMAlY/smB8aHX53hRFSgM6vYBK
	 ZUhqRD3CzYue089ZtYY7PGlV9lVwt/ruKd6RR6511RomGs/hmaE6GI97mskeHksb66
	 Sd8MAxQEbQI7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A27DA80780;
	Sat,  1 Aug 2026 12:49:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C6F82CE
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A45F6079D
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iv_g7QXXXdF2 for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 12:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41CEA60714
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41CEA60714
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41CEA60714
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:49:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BE00013F8AE;
 Sat,  1 Aug 2026 14:49:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 14:49:14 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 14:49:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260730183524.1145030-1-bernd@kuhls.net>
References: <20260730183524.1145030-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <f71c404342fb5d24ebfb6e709d5edb79@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785588555;
 bh=ksZItywtlqE65/HoqjZyOIKbx4V06xC11myW4UgC7zk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RPAklsl1CczfsGTR5cw4BhpwYWZgekBJj6tZQMfjKjywR9GElaXklAMFWP6cSkrVL
 yTm6M6ckoo4BVpxs4cEajyRaHfittUSWmsqieUxLS8VLTs2jxKFdt1Z8ItWX62gftC
 OP+jI3ko0OvcVMXs0Y2OtfzfuD1P9evvnfTAOzNhJUh/cfTI5WUbHJGXW5VhUcDFeX
 dCdnQgXpIJaXuBf2NfHe3HPAAtUlwISii+T9gVK9+L8r7DjT8N/tPicVuAk9cT81Ma
 xUSIvDHHxudthT8P+UoH10aWzAeQM0H04VHNfP1OD5esXCQwl0mTQriCr7wbNm2ByE
 bnFGlHK93UMsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RPAklsl1
Subject: Re: [Buildroot] [PATCH 1/2] package/php: remove CFLAGS for OPcache
 extension
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/07/2026 20:35, Bernd Kuhls wrote:
> Buildroot commit aedf131da66d2f2ebce64788deab07be17ce33eb bumped the
> package to 8.5.0 which made opcache a mandatory dependency but kept the
> CFLAGS added in 2015 with buildroot commit
> e05476491720f96fcbeb926b4599d111efb598a6.
> 
> As it turns out we need to remove the CFLAGS to fix the build with the
> bootlin-aarch64-glibc-old defconfig as detected by the Gitlab 
> pipelines:
> 
> ext/opcache/shared_alloc_posix.o: In function `create_segments':
> shared_alloc_posix.c:(.text+0xcc): undefined reference to `shm_open'
> shared_alloc_posix.c:(.text+0x11c): undefined reference to `shm_unlink'
> shared_alloc_posix.c:(.text+0x19c): undefined reference to `shm_unlink'
> shared_alloc_posix.c:(.text+0x1b8): undefined reference to `shm_unlink'
> 
> as they seem to disturb the detection of librt.
> 
> It is unclear which upstream commits added since 2015 fixed the 
> original
> problem so a backport to LTS branches is not advised.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
