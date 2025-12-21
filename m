Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38943E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 15:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F189840517;
	Sun, 21 Dec 2025 15:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9D87FJk3ln9i; Sun, 21 Dec 2025 15:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28CA940624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766332599;
	bh=fIYUTU9dETA0DcuH5TJiDu/PrJS5p5nKdWCQNJCf2fw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jx6aD9Fqs14RVTs0nh6PMu00ZLw1CeWx9OWDb7H+9GxtP49k93lwh+A4lv2WXeYkg
	 2zEGM8dBRLkVVGSKwAxjTueO99flYGfm8aaf3odF2zJyd6zc0APl1iN/CA9RIbY2RU
	 5kJA3Mn9/RiVD6Dv/pNrjnaWBomJmm0A5LVDrXtr2yMVP069XGW6ubgjMuZSDzdpwX
	 a575+bRBkGxD5XfNhR/3ggVlItT26tYUra1H2AoG6eR7VV17J0Kv2ixZMsFi8LwwmH
	 xN+c7eSz90MfO9aQebFKs2L5TU3MSdm38TPdZC0BgdBffRkHnPN5S8JtlzAhSq8zwJ
	 7fQF8qcV5O01Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28CA940624;
	Sun, 21 Dec 2025 15:56:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB5F6195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9985340462
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3ehaRVPSa36 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 15:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE76240092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE76240092
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE76240092
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:56:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1EFA019F5BE;
 Sun, 21 Dec 2025 16:56:33 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 16:56:33 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 16:56:33 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215231137.2465811-1-troglobit@gmail.com>
References: <20251215231137.2465811-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <888d662840f763c56b850ea3154c3f43@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766332594;
 bh=WE398ELN3nm9wFPXbof1+5lIoDxnhT4CNQx+/FEud2k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pRLAIH2lczLdILGjol3xsn64zOah8Byr0vrpxI3lxTskSkIJZa7q7iEMvaeYR10ai
 3ZlJz62oyKIR+lHMHbRug+MAG6T05TbCPOI8Avt6Dbyp58VmjjJeLV2eBZTj6POI6t
 31fSIk+cJfbBW20jAdLHPRN1EQjUU60dKz5o4fhpI/L1pxN+Wsu0uFZ2x4bCpPL/O5
 q3Xe9GSYyMF3ls/9taHAp+Y8rCu1iu87CuvLRmUCAjZHIyjEOPRVLPB6vrbBx589bx
 yPMMZmYz3xC3DW6erypsjOIcGoKrVUgGSFXRPE7bH17FpRkFqdQyaGtN6G/qskUqZN
 +ZuK5003D/TCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pRLAIH2l
Subject: Re: [Buildroot] [PATCH 1/1] package/watchdogd: bump to version 4.1
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

On 16/12/2025 00:11, Joachim Wiberg wrote:
> Changes:
>  - Add watchdogctl list-clients command to display currently subscribed
>    clients to the process supervisor. Outputs to stdout in either table
>    format (default) with colored headers, or JSON format with -j/--json
>  - New global -j, --json option for machine-readable output, currently
>    supported by list-clients and status commands
>  - New API: wdog_clients() returns array of wdog_client_t structs for
>    programmatic access to subscribed clients. See API documentation at
>    https://codedocs.xyz/troglobit/watchdogd/wdog_8h.html
>  - Enhance watchdogctl status command to display formatted output by
>    default, with device information, capabilities, and reset history in
>    a human-readable table format. Use -j/--json for JSON output
> 
> Fixes:
>  - Generic scripts running more than 1 second would fail with false
>    "critical error" reports and cause unwanted system reboots due
>    to uninitialized exit status variable
>  - watchdogctl reload with tempmon crashes watchdogd
>  - Issue causing unwanted reboot when watchdogctl reload was called
>    while a generic monitor script was running
>  - Fix memory leak in generic monitor with optional script path, would
>    be triggered on watchdogctl reload
> 
> The first of the fixes means we can now drop the backported patch.
> Also, the test mode has been dropped from public use, hence it being
> removed as well in this commit.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
