Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADF8E8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793CB60C1F;
	Fri, 26 Dec 2025 12:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GCEmlEpuZCQ; Fri, 26 Dec 2025 12:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180EB60852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766753228;
	bh=KdU3Yb9aM6utJ+1x73XaIY8oPdPUc5HYXSmFDvWE6uI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ck/MdEzvQtTlKEAsevqRVWmPVn9aSkCkRIf4oSrGFcpj1h5ZeCEW8OFbEC4N1peMo
	 XE0XgxHFLEBGoyS9OEfU5guCmayY1ymFlDarynoA+2q/Bui+IVrCIeOKkTqD/efMoO
	 0JEwrQoCLd2eGo7hesYkbFGcKqqAtVATyYi1KV6jgjg4kLrIhBa2Fe4w26PC9OdAra
	 9fGl7j/RbhsiPxXXSS+RCavh8XAE9XSI33ICwtg6KAGbc0z1loEsjuboWlTbsKi/fm
	 u1xJSKB3vr4gQSVxxuVApVCgpjDRBQtIjP1E+VWTbC9I28r4XttTd38Yn63T/Jwckj
	 fVFC9V1vGo85w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180EB60852;
	Fri, 26 Dec 2025 12:47:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B0A9B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61B6A4081E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTaxpdpQwNyb for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E4FE40743
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4FE40743
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E4FE40743
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:47:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A6B9013F86E;
 Fri, 26 Dec 2025 13:47:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 13:47:02 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 13:47:02 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251225144213.166018-1-peter@korsgaard.com>
References: <20251225144213.166018-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <78e2ecd22580f2fcf203b2938a375720@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766753223;
 bh=3RND6x5vygo8hNi7gOSTNTkc/PLYydTPd+a1425/qzM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yu3RDo7wwQototMBOHoIGtbNFOAQR0VuFJui5LjGCd+fJiZSwp1kv5C6aT83cxoHq
 JuB9GCMmVcqMM5bsOvrRHgqHmvuYOL368IUP89C8+smnmi+3BiQam/c2wYDy+Ud/XR
 QVp/8xBOWKP8bG5B0HC/klbbz1FWE+4rvh2n0np3/FvUg8DfymtmluuSftDI7LL/Vp
 /yfmNcPZOOVxtffzwM2V50O23ji4bYku6nCAyKT8Mn2iivn9OjOr1nR55XRnb5QaTk
 4q+dlgOI6Dve4itJ1M0OFI6PsaFY8o7QznkDJcd0JGLywrC1NoRaQgdHK5plXDM9vf
 5IIxK+fKyvdtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yu3RDo7w
Subject: Re: [Buildroot] [PATCH] package/fscryptctl: bump version to 1.3.0
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

On 25/12/2025 15:42, Peter Korsgaard wrote:
> Adds support for hw-wrapped keys:
> https://github.com/google/fscryptctl/commit/e9ef4406303c25ec5246ed74adb55349e126a2b0
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
