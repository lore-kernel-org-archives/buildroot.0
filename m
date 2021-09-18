Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A8DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 06:55:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E5361251
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 06:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3E5361251
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F22840E8;
	Sat, 18 Sep 2021 06:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ayL4qAyS_yi6; Sat, 18 Sep 2021 06:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A874C83FAB;
	Sat, 18 Sep 2021 06:55:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7E181BF957
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 06:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3792425F2
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 06:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FR3WmLVI0gDQ for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 06:55:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D63D425EC
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 06:55:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3399F5FEF7;
 Sat, 18 Sep 2021 08:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631948145;
 bh=OVCBKrE+sfOTMGEU9cCEwyybUakVnwZzST3k0CVPjrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gPkv7C9WAcSokCN8xJMbrUY8JULWUAJUc658mWDjS0FwC72rajY3tuq1HXniI35az
 ltLBr/HvRiE83A7xEbH2Hyc8VXtgS6jWquWa5wRbFavyJoLiXlyFL1aAw7wYfgLtom
 tw4fnNs9D08w0PCvCCtVUG4L3dQfKkk4prTI+Dv6YLQj5wOhSPnAjhHAr8gbbmf6+w
 qiYoZbp0PjgaLZy4ec5cCf6hRhepgGQ9oo+0F5e41J4OrYR+ev6qzjYey/0PUbh5sF
 8ObPS4wi10VsJQ/gBXwbzX3ab0aiC3ZVtAxM+Dm7uPNU7pVft8/1iIq+ab8lddQMbw
 AyABAbByeIbkA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 08:55:38 +0200
Date: Sat, 18 Sep 2021 08:55:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210918065538.GC1053080@scaer>
References: <20210915194819.841337-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915194819.841337-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: fix CVE-2021-37750
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-15 21:48 +0200, Fabrice Fontaine spake thusly:
> The Key Distribution Center (KDC) in MIT Kerberos 5 (aka krb5) before
> 1.18.5 and 1.19.x before 1.19.3 has a NULL pointer dereference in
> kdc/do_tgs_req.c via a FAST inner body that lacks a server field.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-deref-on-TGS-inner-body-null-server.patch | 47 +++++++++++++++++++
>  package/libkrb5/libkrb5.mk                    |  3 ++
>  2 files changed, 50 insertions(+)
>  create mode 100644 package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
> 
> diff --git a/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch b/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
> new file mode 100644
> index 0000000000..ec6f623380
> --- /dev/null
> +++ b/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
> @@ -0,0 +1,47 @@
> +From d775c95af7606a51bf79547a94fa52ddd1cb7f49 Mon Sep 17 00:00:00 2001
> +From: Greg Hudson <ghudson@mit.edu>
> +Date: Tue, 3 Aug 2021 01:15:27 -0400
> +Subject: [PATCH] Fix KDC null deref on TGS inner body null server
> +
> +After the KDC decodes a FAST inner body, it does not check for a null
> +server.  Prior to commit 39548a5b17bbda9eeb63625a201cfd19b9de1c5b this
> +would typically result in an error from krb5_unparse_name(), but with
> +the addition of get_local_tgt() it results in a null dereference.  Add
> +a null check.
> +
> +Reported by Joseph Sutton of Catalyst.
> +
> +CVE-2021-37750:
> +
> +In MIT krb5 releases 1.14 and later, an authenticated attacker can
> +cause a null dereference in the KDC by sending a FAST TGS request with
> +no server field.
> +
> +ticket: 9008 (new)
> +tags: pullup
> +target_version: 1.19-next
> +target_version: 1.18-next
> +
> +[Retrieved from:
> +https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/kdc/do_tgs_req.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
> +index 582e497cc9..32dc65fa8e 100644
> +--- a/src/kdc/do_tgs_req.c
> ++++ b/src/kdc/do_tgs_req.c
> +@@ -204,6 +204,11 @@ process_tgs_req(krb5_kdc_req *request, krb5_data *pkt,
> +         status = "FIND_FAST";
> +         goto cleanup;
> +     }
> ++    if (sprinc == NULL) {
> ++        status = "NULL_SERVER";
> ++        errcode = KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN;
> ++        goto cleanup;
> ++    }
> + 
> +     errcode = get_local_tgt(kdc_context, &sprinc->realm, header_server,
> +                             &local_tgt, &local_tgt_storage, &local_tgt_key);
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index 89f219d913..d41e7559a5 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -16,6 +16,9 @@ LIBKRB5_CPE_ID_PRODUCT = kerberos_5
>  LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
>  LIBKRB5_INSTALL_STAGING = YES
>  
> +# 0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
> +LIBKRB5_IGNORE_CVES += CVE-2021-37750
> +
>  # The configure script uses AC_TRY_RUN tests to check for those values,
>  # which doesn't work in a cross-compilation scenario. Therefore,
>  # we feed the configure script with the correct answer for those tests
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
