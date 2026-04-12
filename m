Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE61E937F6
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBE9616E9;
	Sun, 12 Apr 2026 17:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jC__iy1z9iCo; Sun, 12 Apr 2026 17:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FAEF616D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776016687;
	bh=IAbV8jqOhfS7PGCCJXfkowRnKtui5dmmhbL8A+N0J48=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cRcuOPUfDKP7NsjaxvFanCL///cHBeanHakqU+l2f4rFr5spsCiIy69PctQHPH2EP
	 EmC1TEluYDd0ov39BaTUHO2hBnELIQ/3+eo6wc5ChAeYqEKVU+UT9fdLpkfVhq13ZS
	 P8His49OhcYnyw9i04gHB/xNa+aim3tmbJ/LsTovlDd38SgpgCrec71zaAF93Q7llT
	 lxFpAVxss4IuYaGyCfmWlILibugHoXiiyoYdBXa3aipFx95Rnr2sOel1vyWEEBBEyN
	 EZog8Y7JMo3DGipOmz/KJk2NfgtHzePBFDw/g0B0o8qwiIRegVT8ZvJxKcJIF3o6b8
	 a+5c8InsZSxSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FAEF616D4;
	Sun, 12 Apr 2026 17:58:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E814194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7476E616D4
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BY--XIfTtM3L for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1511160DDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1511160DDB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1511160DDB
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:58:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E17BD13F879;
 Sun, 12 Apr 2026 19:57:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 19:57:59 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 19:57:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260410051444.21302-1-bernd@kuhls.net>
References: <20260410051444.21302-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <a128705aa7010f4c52713b3b43fd01ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776016682;
 bh=hfnoDWy6D84e1X3n1TCyRaIIu6Rn/OifzHVBovB1z9w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i5NQIRTn8cbTxqEW0qHWr5TBsTP/mtdN6VrAChX3Erx08V7YCB6mh0SpyFeimSKdj
 +RPMS/Yz+h86Gg0N9FLYnpZlAMsKbry4LSQ4b0ccNcZ4OWmCWldPBivPgi5+iIkt86
 gbrZKppddbPY9d28XhMf0Q73YnW38EuR3+nWhuLIVpndcg1QtOplvyqXaUam75SjG9
 IkLXORg6TRJYjY+ztDaqQqFlVm+28cySpL9sqd8HNAg8SFtSns5LLk9DjnzHjb++iK
 mDwJgASWVpjxlc8yMYZa1uJY2mnq0WmBH5ZKoR6i7OGs+dYy8sXnZf33BAdvNP7lqG
 wXBfSNUz9Fm/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=i5NQIRTn
Subject: Re: [Buildroot] [PATCH 1/1] package/libjpeg: bump to version 10
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

On 10/04/2026 07:14, Bernd Kuhls wrote:
> https://jpegclub.org/reference/reference-sources/
> 
> Update hash of README (changes not related to license):
> https://github.com/libsdl-org/jpeg/commit/5eaedb78e0e78dbff07f71143eb21f9081e2cef7#diff-2b7814d3fca2e99e56c51b6ff2aa313ea6e9da6424804240aa8ad891fdfe0900
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
