Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EF9E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC4D80F2F;
	Sun, 28 Dec 2025 22:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNParfEODr3X; Sun, 28 Dec 2025 22:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EECB80D30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766962017;
	bh=KVGD9XOgSKPLw2GmnQf2+EBosZ8cy08yc1R1+oMy5gk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ftPPsnWf4trmlOoGh94PvbU88+eIENuUbSQFMrcrKL6kuNgWstzVhFk4sT9y0OknJ
	 mDAGQ6KKlZohl7fk5MCIAZjfTIDYxFBYtontf631GDH8bqElWAGRyY8lj5jxKCCzcz
	 RnB+siOvkixQUdsZWtT6eozZxGQIgMe5rp+lOMwRNkovDdG20TUhfuAPEauB9eZuW9
	 YCSZkRgM55FcFLUgcP7XSERGrzBouvj5P8pkGjdttauR2rL9+42eXrXoNT2e3sqU8Y
	 COZMi0MMwLNuWMRa55QydLdDFjP/Dm+ujBj2fThvUNRYzWktiK73Oel8y2lJmaMD7H
	 psEVf3zg0+NOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EECB80D30;
	Sun, 28 Dec 2025 22:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71E6CB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 579A060A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfkeK8BrBgZu for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21042608FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21042608FA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21042608FA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:46:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2561813F86A;
 Sun, 28 Dec 2025 23:46:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Dec 2025 23:46:51 +0100
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 23:46:51 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251228210649.3057011-1-thomas.petazzoni@bootlin.com>
References: <20251228210649.3057011-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <52a2d1c9306c1ac37a81bc525da245d8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766962012;
 bh=zYMrlVoGN0s+6C8GJ8aaWZEnzqUsc8+0dNH5Ta7AH5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nb7BVy+SCFA+pZBpRGZ4TQeAPKnpGraGWMuF/tdwLDA2jHe9VHia2bT0PvqGRGC6A
 w3qD9TjdJciGPVscNTeiFFabAOsA3Ng51i+YTzXON3IjiGVktFepXHFDPHHrOyHgjS
 LZ9SmusZU6vpFjTNiO1ws+gFByhT591G16U1NUtjTRDhi+jw67GfYb7RyzQ+qpmPAf
 VQKFcas2D4pb3puvVXWhX3YhA1EK300vuPoUG4w0XkFyiWCueCVSBDlkGpFL9nDRK1
 onFHjfB9UmK8hysp5nBTm7A4PwCwqtCT9gKjQw12cl5yBfELkV5fRXQRwHwCDCWpke
 H3A4c8U2cXWhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nb7BVy+S
Subject: Re: [Buildroot] [PATCH] package/soapy-sdr: add patch to fix CMake
 >= 4 compatibility
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

On 28/12/2025 22:06, Thomas Petazzoni via buildroot wrote:
> Fixes:
> 
> CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
>   Compatibility with CMake < 3.5 has been removed from CMake.
> 
>   Update the VERSION argument <min> value.  Or, use the <min>...<max> 
> syntax
>   to tell CMake that the project requires at least <min> but has been 
> updated
>   to work with policies introduced by <max> or earlier.
> 
>   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/074098fef4f8a5e89a4f04efbdd1f545f4616772/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
