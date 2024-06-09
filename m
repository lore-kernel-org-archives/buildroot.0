Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4E9C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 05:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEAB8812D2;
	Sun,  9 Jun 2024 05:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzth9D8w8Wmy; Sun,  9 Jun 2024 05:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD21D812D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD21D812D9;
	Sun,  9 Jun 2024 05:47:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF581BF3F9
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 05:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED4B1406E9
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 05:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WrAj7pAtBoe for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 05:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62960406E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62960406E3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62960406E3
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 05:47:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5B03713F880;
 Sun,  9 Jun 2024 07:47:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jun 2024 07:47:13 +0200
Date: Sun, 9 Jun 2024 07:47:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <ZmVB4bzpE22opuyS@landeda>
References: <20240609032509.8939-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240609032509.8939-1-vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717912038;
 bh=n/8VBUcqJXXDLxBk0XJV2ccZL7xUf71M5PVFPs2+1uI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wxcf3772OntttdH5uC7e5sg+24klQzm0kWP7pNcQXRL1FkCYicDX8cAHNAo4aeX7G
 NcC5ZR2l8hs3RD6pu8xvhIYcKdYBNtaz3o+vpoHBomnudDs5/7DYXupuAVxALNK3ri
 tjNAQCs8lhFwagztD6qEAFMhZ3HEt3XSy+3gbrGN6bZ0F9lWJ43MKdyNlZzfYd5iCc
 D/boHnn/qs1c+6PYOjAvBjwcHWdLAHLcyas/ekMEiLI/ii0QerHU4EFUKDLw2riKSj
 NDEkWOwq/l7K/FWoUjvp0vTimZu/8vswsp20p/ZYRrVgXihi/z1FLM84HPcdnhJ43h
 4S48gc2lCvkEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Wxcf3772
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix config directory
 pattern
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2024-06-08 22:25 -0500, Vincent Fazio spake thusly:
> If a platform triplet is not detected during the configure stage,

Could you share a defconfig that exhibits the issue, please?

Regards,
Yann E. MORIN.

> the
> config directory (LIBPL) defaults to `config-$LDVERSION`.
> 
> In this scenario, the `PYTHON3_REMOVE_USELESS_FILES` hook would fail due
> to `find` incorrectly expecting a second dash and then the triplet.
> 
> Now, we glob anything after the version which will match in both cases.
> 
> Fixes: 54d48c8cad ("package/python3: miscellaneous fixups")
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  package/python3/python3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index a0b9ed4437..a82bc47a57 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -204,7 +204,7 @@ PYTHON3_CONF_OPTS += \
>  define PYTHON3_REMOVE_USELESS_FILES
>  	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
>  	rm -f $(TARGET_DIR)/usr/bin/python3-config
> -	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)-*/ \
> +	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)*/ \
>  		-type f -not -name Makefile -exec rm -rf {} \;
>  	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/ -type d \
>  		-name __pycache__ -exec rm -rf {} \;
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
