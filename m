Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0F5E7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 22:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CCD3605AE;
	Mon,  9 Dec 2024 22:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3flSM_zj7VW3; Mon,  9 Dec 2024 22:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51738605B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51738605B0;
	Mon,  9 Dec 2024 22:52:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A17E6F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37B7F605B0
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoR2sR8iBFOu for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 22:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 43E7A605AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43E7A605AE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43E7A605AE
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:52:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1CBCB19F58A;
 Mon,  9 Dec 2024 23:52:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43610])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Dec 2024 23:52:45 +0100
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 23:52:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20241207201936.103809-1-giulio.benetti@benettiengineering.com>
References: <20241207201936.103809-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <24da891859b2444d6044c3bb22c18a40@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733784768;
 bh=D5Fo/2c9mvG1Rg19AES2GmnZXMkgCT8R3y0sDExc79Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DOC675LeN8OXZjeq0uG0Rq5833iiYFR0qO1JMthY8aw/LfDUu3zmpvvoEXYS8Au63
 jnlOylbByhkBPb6c+CYFrjtRvKpfz5f2qBNCPS5umdq8DzLOmuyFLSKoUbIdpLzzvf
 k6uUc9mkiVtCEytlt0LYhYciPr8dNYV+Gqsknk8d8JhYDCra618QplS7+pARgAocti
 buw/jrljsm0ihtY7FOEMK9MbbbqdAeFXnCjDv6RE6AWnyp062vVC0Ek4rNJ9viziUH
 YVlNxvNINE5JSCt+kvpBC40XCNVmIoO7wrYvsRY8eEL5eUl8jtyFIL0BrFAhjzAHOE
 0KCErr3EYEibw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DOC675Le
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2024-12-03
 version
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On 07/12/2024 21:19, Giulio Benetti wrote:
> This version allows to build with Linux 6.13.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

I fixed a check-package error.

> ---
>  package/rtl8192eu/rtl8192eu.hash | 2 +-
>  package/rtl8192eu/rtl8192eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8192eu/rtl8192eu.hash 
> b/package/rtl8192eu/rtl8192eu.hash
> index a8b7cb9358..3e70d36d57 100644
> --- a/package/rtl8192eu/rtl8192eu.hash
> +++ b/package/rtl8192eu/rtl8192eu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  
> 8da0f54bd9ae094b5f61fe3c4dd207b2df62b4286970e2828f7c5ce1146447fb  
> rtl8192eu-56f672a8b9572c743148f2e60068fd341d52d5a3.tar.gz
> +sha256  
> dbd565edc8d52a1429d8551795fb4da3ca44cf27867466010e0e6d00c86aef5c  
> rtl8192eu-6755ce9c15bbcb5dcffbca7f6f08e661ccdaacdb.tar.gz
> \ No newline at end of file

The command:

     utils/docker-run make check-package

reports here:

     package/rtl8192eu/rtl8192eu.hash:2: missing newline at end of file

I fixed it before applying.

> diff --git a/package/rtl8192eu/rtl8192eu.mk 
> b/package/rtl8192eu/rtl8192eu.mk
> index 0f00d301a8..9cd88060ce 100644
> --- a/package/rtl8192eu/rtl8192eu.mk
> +++ b/package/rtl8192eu/rtl8192eu.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -RTL8192EU_VERSION = 56f672a8b9572c743148f2e60068fd341d52d5a3
> +RTL8192EU_VERSION = 6755ce9c15bbcb5dcffbca7f6f08e661ccdaacdb
>  RTL8192EU_SITE = $(call 
> github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
>  RTL8192EU_LICENSE = GPL-2.0
> 
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
