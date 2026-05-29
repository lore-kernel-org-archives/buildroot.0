Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13853CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 06:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41C7261122;
	Fri, 29 May 2026 06:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZ0q50YjTwyI; Fri, 29 May 2026 06:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EBB961115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780037879;
	bh=38nVyU1fwWAQjOjvHdw0nTW4lxvV4RRXCVO+LiUhtQs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I5Gp9wA2q3sKx42x/TFhdhJEhStqBRsExciu0yZ7hvmXQ/RgJpLLY5xruKVBXUzR8
	 VQehg1pTfah8Cj1a9Bu3DDdvrczRCcY8AlU5GSpb055t70wqhEtAaShmH9Cfxc/CUu
	 pj4MHRGrlaivCSY5MwqATRJy2X9k/nvlsw90WgHxfnY3KfXBuM70GkKSzTNL8sFS82
	 JGftBKo0J6k/UEU6dLqrXWSF7JdxjKmvVskHltWjig/nrhvrUmR7qnCefVITWcQooT
	 Gpxy3dCet0HX2Bn3y8Jx/dRwY5aMXYsgby9jOLZ39Q/zycGK6JMXkAfTbmxGQ5yD3F
	 uXSC6To5KIg+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EBB961115;
	Fri, 29 May 2026 06:57:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5033CD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 06:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3145041EB4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 06:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIBDsYYyv3sk for <buildroot@buildroot.org>;
 Fri, 29 May 2026 06:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 180D441EAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 180D441EAB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 180D441EAB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 06:57:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CF5F3B97C549; Fri, 29 May 2026 08:57:52 +0200 (CEST)
Message-ID: <743ede88-3b01-47f2-8cde-4cf89fd25fb1@rnout.be>
Date: Fri, 29 May 2026 08:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Ernberg <john.ernberg@actia.se>
References: <20260527204125.4054645-1-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260527204125.4054645-1-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780037873; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=J4AyVanoxi9TlJADaaHPC7JHtbNHfv60E9/Xmz9A3o8=;
 b=oq6bXkMRZHmPv6jb36erzqGtSz7tWizUW09r4yJi42jnxrfcYkU7ZpezZlho9VRlUWru63
 R51dRAOxOJYw1o0VtnwPhkehPy7pYk78h3jCe18TZg7FnBz1Z1+MpRzawJCgjTzbYYIZma
 4L0SfNkrnZivQCpD+s/WC3gjmUCzR+0lqOzCZBD+PdDZZsmtFe4BYaf1Z9l0rifnCkQZd5
 yiEy+u0TUokBbN2z+4VwTlJyk5HnzSmF8zk7gVvuOwVwuo3Y/jvssTKmsfxSA1YyiR5e2R
 dhR/OgneoUS00XpJ6dLIaCpkZy1OAlWiIPAHXQnHWSW5CFFpHny5ejiAAppqnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=oq6bXkMR
Subject: Re: [Buildroot] [PATCH v2] package/pkg-generic: Add
 /usr/share/info/dir to $(2)_DROP_FILES_OR_DIRS
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



On 27/05/2026 22:41, John Ernberg wrote:
> This is the file the original commit d8898380984f ("package/pkg-generic.mk:
> Remove Info documents dir entry") wanted to deleted.
> 
> However, there are enough packages that install to /share rather than
> /usr/share, that the path currently listed is still needed.
> 
> Signed-off-by: John Ernberg <j@j-ernberg.se>

  Applied to master (it's a fix, really, even though the issue already existed 
for 5 years), thanks.

  I did try to make the commit message a bit clearer.

  Regards,
  Arnout

> 
> ---
> 
> v2:
>   - Append to the existing mechanism rather than inventing a new one (Arnout)
> 
> v1: https://lore.kernel.org/buildroot/20260510193826.2846038-7-j@j-ernberg.se/
> 
> ---
> 
> Packages installing to /share are broken as that has never been a valid
> path since the FHS was first published [1].
> 
> Would it make sense to add a specialized check to test-pkg to warn (or
> error?) if packages create incorrect paths such as /share?
> 
> [1]: http://www.ibiblio.org/pub/Linux/docs/fsstnd/old/fsstnd-1.0/
> ---
>   package/pkg-generic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index dd440e4062..83f3506913 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -863,7 +863,7 @@ endif
>   endif
>   
>   # Globally remove following conflicting and useless files
> -$(2)_DROP_FILES_OR_DIRS += /share/info/dir
> +$(2)_DROP_FILES_OR_DIRS += /share/info/dir /usr/share/info/dir
>   
>   ifeq ($$($(2)_TYPE),host)
>   $(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
