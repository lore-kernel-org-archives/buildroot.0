Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5813CD6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A206071C;
	Thu, 22 Jan 2026 19:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MImvPQ_klc3z; Thu, 22 Jan 2026 19:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3F060720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110525;
	bh=sCuneNzqaLG7vGH91PnWzX5U8y7J3d3hOfQQJsBVECQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sIlbsvf3sOtVPjEySOgk/TMBku35LZ2bUwE4J6R+7onv6Xqw0yoJp6hC9Yg4vHdnD
	 5ZJM3YazylSvDUgyXdsKROJRAB/ta5J0ikbWwYNI3XfDDCoqwUMHfx+NolUL2V8LWV
	 E2C5GWFqtO6n8PbczTl6jXLpQo3X0R2gwhvdUBHnTVHyhVhRvvqSPNe7rARObmJrAI
	 X/n5hMeWBF7712fQ2nhiSsfDh7HKCzk5MtXFbav64cLvlZVYNO4OI5fqFw4djxZzh+
	 7BEU7qXUvFP+qwn6Nc7A6yjv4EKLVs1mpQCKzcvz6qxwu0IuIknG9nDhyfXvcI+Qb1
	 jMhAZGB7wYDAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3F060720;
	Thu, 22 Jan 2026 19:35:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81355122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6751460720
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDzWhSxFedN5 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88F726071C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88F726071C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88F726071C
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B832EB00592;
 Thu, 22 Jan 2026 20:35:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:35:18 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:35:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260118163823.2922833-1-bernd@kuhls.net>
References: <20260118163823.2922833-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <b859995c00b13add3f48b0207fadafd8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769110520;
 bh=bU7QW9sRtfVMfKG7yzbbIS0P4F8LwY68wNMosu7RuRo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NttZDSl02vPbOtWiUTSBPrw545uLQibTDHvaOBc64NKk/sacDG81rTGZVKbV65XVN
 46+jait+DNcDVakhWxM8A7pkNb0z+65h5SBz/ghZ33XjlzVSiOVIEGBmZBA7Kw0nf8
 px98HbzP9d+DxUAxFiqUWeNiDRYWJbFthg7kUqQkX8+TJxqzcdb4hVtC7829nJQDk0
 +1rZlLIKLDulMSemfmUgepojY9AT1nAblm7cPPdKJlHIkj2afIT8/hRi3tOfAeKYdP
 loFZ6jpvPN1YzMJI2ZvRyg087UFlo9s0TmcopUBk/gVMlVzkQFy6AdhU66R2nj9Ywo
 rp016aZS1WZ/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NttZDSl0
Subject: Re: [Buildroot] [PATCH 1/2] package/libcdio-paranoia: fix build
 with gcc >= 15.x
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

On 18/01/2026 17:38, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/dbd/dbdb4f386a417f7467b66036e661e77d04b82431/
> https://autobuild.buildroot.net/results/042/042185a8d32765a52986cc0060d3d296a24c662b/
> https://autobuild.buildroot.net/results/fc5/fc5be5e78852f6f66cd631f12a02ac10eb846e97/
> 
> The build error can be reproduced by this gcc 15-based defconfig:
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
> BR2_PACKAGE_LIBCDIO_PARANOIA=y
> 
> while this gcc 14-based defconfig builds without errors:
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
> BR2_PACKAGE_LIBCDIO_PARANOIA=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
