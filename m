Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB53C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 22:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723E440777;
	Thu,  7 Aug 2025 22:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWD1U7oaxn2Q; Thu,  7 Aug 2025 22:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A792640773
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A792640773;
	Thu,  7 Aug 2025 22:25:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 091D531
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E36A0607EE
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SLWj62bGpaK for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 22:25:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E05FB607E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E05FB607E9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E05FB607E9
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:25:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 57E55780371;
 Fri,  8 Aug 2025 00:25:51 +0200 (CEST)
Received: from ip099.116-187-66.sogetel.net ([66.187.116.99:55162])
 via ip099.116-187-66.sogetel.net ([66.187.116.99]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Aug 2025 00:25:51 +0200
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 00:25:51 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250805075624.2851092-1-peter@korsgaard.com>
References: <20250805075624.2851092-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <72833b36206429069085f416ffc0bdab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754605554;
 bh=bm27t+0M3Vb0Z3muSlw+j4wJ90hA1bb1UTWg0+i3cLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=niLTdW0X53M14HBhiUhKRz6hZrv5HyOqMHMKBHsAnJ4Y76vTpO0sIbma0660QwKwG
 3JqYHfiTVAMut60QoX8z9/SPBPBH2o5xH3UelCwxNEYY+a9+dQLBSgZB+5gqhLyrs7
 mfTkVBkDNMXyTR+nA4jK9eoR5GEBb7f42E1L+K8lOIVJVqujY0kYdyNVJq1kWZAwiC
 oxzgHdGS8fweyek3Ks8zf4feQgCIv9ZyXtPBNhNdTArKZ8bkl4YYuPbrWDziFxDPcJ
 6WGDBRgaY+BwZoRQVqSDOKdsc3eTbZuXLNlctI2qvE4dX45z1Ln0mAfr43qQoNFqvf
 LPoltQqBWf/Lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=niLTdW0X
Subject: Re: [Buildroot] [PATCH] package/python3: add upstream post-3.13.5
 security fix for CVE-2025-8194
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDUvMDgvMjAyNSAwOTo1NiwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+IEZpeGVzIHRoZSBm
b2xsb3dpbmcgdnVsbmVyYWJpbGl0eToKPiAKPiBDVkUtMjAyNS04MTk0OiBUaGVyZSBpcyBhIGRl
ZmVjdCBpbiB0aGUgQ1B5dGhvbiDigJx0YXJmaWxl4oCdIG1vZHVsZSAKPiBhZmZlY3RpbmcKPiB0
aGUg4oCcVGFyRmlsZeKAnSBleHRyYWN0aW9uIGFuZCBlbnRyeSBlbnVtZXJhdGlvbiBBUElzLiAg
VGhlIHRhciAKPiBpbXBsZW1lbnRhdGlvbgo+IHdvdWxkIHByb2Nlc3MgdGFyIGFyY2hpdmVzIHdp
dGggbmVnYXRpdmUgb2Zmc2V0cyB3aXRob3V0IGVycm9yLCAKPiByZXN1bHRpbmcgaW4KPiBhbiBp
bmZpbml0ZSBsb29wIGFuZCBkZWFkbG9jayBkdXJpbmcgdGhlIHBhcnNpbmcgb2YgbWFsaWNpb3Vz
bHkgY3JhZnRlZCAKPiB0YXIKPiBhcmNoaXZlcy4KPiAKPiBodHRwczovL252ZC5uaXN0Lmdvdi92
dWxuL2RldGFpbC9DVkUtMjAyNS04MTk0Cj4gaHR0cHM6Ly93d3cub3BlbndhbGwuY29tL2xpc3Rz
L29zcy1zZWN1cml0eS8yMDI1LzA3LzI4LzEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3Jz
Z2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
