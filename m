Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BD9D74ED3
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 14:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DA8060603;
	Fri, 23 Jan 2026 14:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcC8upVY0jvp; Fri, 23 Jan 2026 14:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94E6B606A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769177657;
	bh=MyQWHXKfJWXv/w9XyCIko868ZuiOrvyC5cX6wmmpgSM=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RG69J26++g5fTuXj7LebNwTa5LpAgwmRYx/j94T8UDTt8GteWLqQJ3+WSAflWq6ob
	 yHOal7PwHUu3myVqfbmuf1UArNfUdg65HxIOo92tGBppZz/4A08KzmIduvbJo52P1o
	 DABo8eqaC8moRVi/emR3gg3wuslNQ8JZHilBLE1WOVqKf+7nY0mrxd9QkQRZ0u8V3V
	 6xkNUqpJ6QPW3HRkxr3DczXW7lASFPOPueWaZ3n9Zv6KBOUPdpZ8Ipgp8ElNx9MvEK
	 UquAOJn6kZRFW+LQzaUWqdhpcqSdY5dVRwJYpUmEwl7TUiBhVQVkXtJGErmgjVmkmu
	 xkmP4M5ZqJvcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E6B606A9;
	Fri, 23 Jan 2026 14:14:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0384358
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD3CD40AE0
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7b71s6z0yzAa for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 14:14:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F8BD40ADF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F8BD40ADF
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F8BD40ADF
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:14:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 469C231E0BA7; Fri, 23 Jan 2026 15:14:13 +0100 (CET)
Date: Fri, 23 Jan 2026 15:14:13 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aXOCNds-riqW41To@waldemar-brodkorb.de>
References: <aXOBz2JS9ziiRenK@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXOBz2JS9ziiRenK@waldemar-brodkorb.de>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1769177653; bh=I1Ceq3vvnFVCWBUAztSrjgJOJF+sM/AqOwo7waoaECg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=MdbTDeQUQ5kKFLbpAyOJZUKhLb0ITCAruY+UEGpjYuDKIGAPJ9NBLfWcgvSIya1Sz
 RKChhPRyLVGKqVd3TxuwhVNimt3FbCWP8jkO9zUx29Q9C0lRC16x6SQuyGG+ZjHK0G
 JP7kNF/lt92qOiA+kh/AAnVIyDeT+ifgFjGaDP9uMmcUVp6hdGqWURXmvNYIkb95YR
 1oDvl32SVa5P+uVlKX83x43hS/z+mmIzU1wE+nEof/zaQhTAStTMQiEvHMu2mwEWaj
 0y1cKx0RJMzXjqYzx0G8qM5isjJFb0u03h8PGkh5tGhzV2P8A4yRS2Bkdc9LH87OU2
 DLlqNUIfzAgdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=MdbTDeQU
Subject: Re: [Buildroot] [PATCH 2/2 v2] package/strongswan: update to 6.0.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

sorry I messed it up. Please ignore.

Waldemar Brodkorb wrote,

> See here for Changes:
> https://github.com/strongswan/strongswan/releases/tag/6.0.4
> 
> Enable minimal required kernel config options.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>   - remove patch 0001 and CVE ignore
> ---
>  ...001-eap_mschapv2_failure_request_len.patch | 46 -------------------
>  1 file changed, 46 deletions(-)
>  delete mode 100644 package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> 
> diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> deleted file mode 100644
> index 8442cc7816..0000000000
> --- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From dda24815d148b91209ebf2d27e3a7acefe9b6435 Mon Sep 17 00:00:00 2001
> -From: Tobias Brunner <tobias@strongswan.org>
> -Date: Thu, 9 Oct 2025 11:33:45 +0200
> -Subject: [PATCH] eap-mschapv2: Fix length check for Failure Request packets on
> - the client
> -
> -For message lengths between 6 and 8, subtracting HEADER_LEN (9) causes
> -`message_len` to become negative, which is then used in calls to malloc()
> -and memcpy() that both take size_t arguments, causing an integer
> -underflow.
> -
> -For 6 and 7, the huge size requested from malloc() will fail (it exceeds
> -PTRDIFF_MAX) and the returned NULL pointer will cause a segmentation
> -fault in memcpy().
> -
> -However, for 8, the allocation is 0, which succeeds.  But then the -1
> -passed to memcpy() causes a heap-based buffer overflow (and possibly a
> -segmentation fault when attempting to read/write that much data).
> -Fortunately, if compiled with -D_FORTIFY_SOURCE=3 (the default on e.g.
> -Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
> -overflow and causes the daemon to get aborted immediately instead.
> -
> -Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
> -Fixes: CVE-2025-62291
> -Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ----
> - src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
> -index 21cc95a6a360..35faad2e0bb5 100644
> ---- a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
> -+++ b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
> -@@ -974,7 +974,7 @@ static status_t process_peer_failure(private_eap_mschapv2_t *this,
> - 	data = in->get_data(in);
> - 	eap = (eap_mschapv2_header_t*)data.ptr;
> - 
> --	if (data.len < 3) /* we want at least an error code: E=e */
> -+	if (data.len < HEADER_LEN + 3) /* we want at least an error code: E=e */
> - 	{
> - 		DBG1(DBG_IKE, "received invalid EAP-MS-CHAPv2 message: too short");
> - 		return FAILED;
> --- 
> -2.43.0
> -
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
