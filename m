Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E67EDF160
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 13:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3955A61165;
	Fri, 13 Feb 2026 13:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2yL_BiqdYJe; Fri, 13 Feb 2026 13:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A817360790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770989184;
	bh=MBK9zpK98jSYNrAlt+iShQXaG5nkApd+HmjNa3UpLiE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XOg8k/1//4Rwk8aMfo06epmMJastTl/J0h0gcGGfrQ2wC9dyNq6slpQV139eZxJbj
	 97CS8rIRzwuvJ9Pfu2Yud7jBu30czDtuHp+J+qRVvWVQV2m3JSxKeO3IuaKW2s1ASH
	 BPqqO8kZCvobiqROs6l6m/jJn2pJ+TRiQvIHlYFSHzMtZr8VNDcgyZaVfa40wQ8+8x
	 fji0MofgRfKSjTqEv7A/p3gwNfLy4rCIDnclPdoNtnLX2TA54kf/Z0j2xQBMY09pdt
	 mMMv1Qri4TpnCPzuFuFpI480MTdYf2+wMdXKqzzzrroH5umyC4ajpJtZHMF9cdZk17
	 ETzWHPW7wJNSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A817360790;
	Fri, 13 Feb 2026 13:26:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 594E7255
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 13:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EBA660790
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 13:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gd834A3Pc01F for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 13:26:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 833A460736
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 833A460736
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 833A460736
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 13:26:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B1FAB13F89A;
 Fri, 13 Feb 2026 14:26:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Feb 2026 14:26:18 +0100
MIME-Version: 1.0
Date: Fri, 13 Feb 2026 14:26:18 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aY8S3RgTJeBfPtTw@waldemar-brodkorb.de>
References: <aY8S3RgTJeBfPtTw@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.13
Message-ID: <9ab717c8e2b69f505155f7863bda0f59@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770989180;
 bh=Qpajp6DUojZ1tJBO7vjP1h8r4Z9k2OLKbm5fyb+hEAQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dTpiRSDZHjJi7MoUUlxEIP6A0tcdtX3eEd6E1EYhQI+bZkhFiPh0VgJhgeSYgoTL+
 acsct7aGd6BV0thKd55QURsQYJqtqg37rG0GLxV0ZgqTZqAU1aOFETi+QuGh4gJRP4
 euIOviz7gMvoAJW+DG+jtlvKKLMagrfmrZb8kO25KLlJ03grN33wnVaGYkLLroaTab
 Sdj8m97OPf9BnBhPXUOQ0bXzscTFEtrWxnEpE//2wQqI092M1XnLX+lpGS/Ehc8Cn5
 eYSHm06I+gnNnwYLq69PYHFDsBaynB0xs2N2VMDWJtiErqasOmerwHKI6uRiu0i80F
 Jg3VcbnuSScew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dTpiRSDZ
Subject: Re: [Buildroot] [PATCH] package/gvfs: enable optional udisks support
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

On 13/02/2026 13:02, Waldemar Brodkorb wrote:
> Optional udisks support is useful for mounting USB sticks via
> pcmanfm.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
