Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F48C433FE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:26:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E44D60F12
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E44D60F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26FEB40111;
	Wed,  6 Oct 2021 19:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yhrozYxKyF7; Wed,  6 Oct 2021 19:26:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 287DE40243;
	Wed,  6 Oct 2021 19:26:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5530D1BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 456B4840FD
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncKBgRq0f1wH for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:26:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A3F8840FA
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:26:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p11so13890434edy.10
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mqmqOYhISIwlTn/xPKZpP53535bfvSbdhiIBoyLt4DM=;
 b=FWFUnJ4EWqtM/3Vl71OOkntfjJVsjppxpIlChsga08auXeLTZuLEPUlBQ18xYC5e2S
 NQDOlOtgH7v/JhOT81IUASW8sGkQYwwZv2sL0YOlR69QPHp2VY7qyT/v23ml6y6mDhSv
 R3ujit781kvOUyN5wiyfdUx07jvs/tzS4a68QZGGA4Z9EkiDHDneaMAM5DLjlLdRFkj/
 nZxxewXL8dpYMKcYLpO5TSjYmL7TFjEBkp6ze6sob80z8a1e7Wiyq9JH/9Vc7hmDHCxq
 AN0d1tQUT4zkTKnGxB3JI/GEbpFIxIRwPmufHh7pv8rE4f8Wyow5UZSng8GPmNnhofPQ
 U7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mqmqOYhISIwlTn/xPKZpP53535bfvSbdhiIBoyLt4DM=;
 b=zjIelQUzw2STfEndXxs02WZYVvksauzCTouDiTlajYaTPy8pd1+CA91z6USj5nF/Qj
 4RU6ek/LAmdANYFqnU3uliE+cOLDOpqPTLN1c/Ns8x+veRgcN36CG+IAmKh7gC7kWWcG
 1Tiuo6wOZruCmkRmlD7FdQdCIbTVu1W8h0iVPtEAqkj2TIwLw1bw+lO4nLIJ/6BCYTHL
 rZo14tjWDZNJnyqF/rqxd3PZwJzCCktCSaNBSQVdvEM/QQONVrK+ZSakHOkkuQxjQKHd
 GXnZhk5Lske9YkTfZ8DhSadwG3O8e9c/J+8IAxolij3YYPBAr7hGUsmvNa9sVSxssVPe
 cZPA==
X-Gm-Message-State: AOAM533tcODIL3iv9xFt9sxqOrwq28XMcQ7tmgTO62xe3wtNrMgodiHy
 aO/CyIbYld9pOJp1wHTablQsBQ==
X-Google-Smtp-Source: ABdhPJxIHBN8z2yJIsuyaFECYF7CzTF/zHRFHmzSO6R84A56Oalmd4bskW10pnxRq5LExbNAxtKEnw==
X-Received: by 2002:a17:906:f747:: with SMTP id
 jp7mr34701ejb.530.1633548402364; 
 Wed, 06 Oct 2021 12:26:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p6sm5670298edi.18.2021.10.06.12.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:26:42 -0700 (PDT)
Message-ID: <a0236058-4a1e-1ce6-31db-d5b5b2999cca@mind.be>
Date: Wed, 6 Oct 2021 21:26:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210924150933.1618347-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210924150933.1618347-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/php-gnupg: fix build with gcc
 4.8
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2021 17:09, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since bump of
> php-gnupg to version 1.5.0 in commit
> 20ecd9c94222ef20b7804084acefb472b8e5deaf and
> https://github.com/bukka/phpc/commit/8b5b1e718fbb2ba57102d1e9d844938038df310c:
> 
> .libs/gnupg_keylistiterator.o: In function `_phpc_res_close':
> gnupg_keylistiterator.c:(.text+0x2d4): multiple definition of `_phpc_res_close'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d79/d79bc1b0f98d68eb8a7fe7d86af5ddcc75e42507/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...0001-Remove-inlining-_phpc_res_close.patch | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
> 
> diff --git a/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
> new file mode 100644
> index 0000000000..9b94cb7e4f
> --- /dev/null
> +++ b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
> @@ -0,0 +1,33 @@
> +From 887b0899d7e7423baec691255c2d8b56bb348ecd Mon Sep 17 00:00:00 2001
> +From: Jakub Zelenka <bukka@php.net>
> +Date: Sun, 14 Mar 2021 18:52:21 +0000
> +Subject: [PATCH] Remove inlining _phpc_res_close
> +
> +[Retrieved from:
> +https://github.com/bukka/phpc/commit/887b0899d7e7423baec691255c2d8b56bb348ecd]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + phpc.h | 8 --------
> + 1 file changed, 8 deletions(-)
> +
> +diff --git a/phpc/phpc.h b/phpc/phpc.h
> +index dc5887e..9206105 100644
> +--- a/phpc/phpc.h
> ++++ b/phpc/phpc.h
> +@@ -945,16 +945,8 @@ typedef zend_resource * phpc_res_value_t;
> + 	zend_fetch_resource2(Z_RES_P(_pz_res), _res_type_name, _res_type_1, _res_type_2)
> + #define PHPC_RES_DELETE(_pz_res) \
> + 	zend_list_delete(Z_RES_P(_pz_res))
> +-#if PHP_MAJOR_VERSION < 8
> + #define PHPC_RES_CLOSE(_pz_res) \
> + 	zend_list_close(Z_RES_P(_pz_res))
> +-#else
> +-inline int _phpc_res_close(zval *zres) {
> +-	zend_list_close(Z_RES_P(zres));
> +-	return SUCCESS;
> +-}
> +-#define PHPC_RES_CLOSE _phpc_res_close
> +-#endif
> +
> + /* resource to zval */
> + #define PHPC_RES_PZVAL(_res, _pzv) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
