Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63272CC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C84406F9;
	Tue, 13 Oct 2026 17:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pr8pFEHJTLe0; Tue, 13 Oct 2026 17:56:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1822E40764
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914200;
	b=VwBhG1PsrMB0rvfQewfYL4FQvjDfi+lC4JZ95NEsH7cNT5PEF+dCHr2uFi80LARYr7jX
	 Wk0kmnQWzXYcyEQ4qQcG/JDcajB9nMgFKeF0VYeG9+M5PT33GWSkpNbdfCxGjHapqMltS
	 KrMsSGYnktWh3olZXbHvFhnspcSfDnWnRf3PddA0WQjcw+ZvP6BJX09mJq6SWEsD40VBo
	 y8/4+1Yq0a53O7Da07FdFC8vTbRORS7tFjGXC0c4Hdp80xyAzVPMu73FuS0PJ2ICraHua
	 7El/sQbEp7e5mc+c11TDdWbi91HG6wl6v0rt+RV93llcBI3lHcR+Qqz/Ftt+uvo8duA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9wVdRmUDOyGm8yXcBdqQKAzPlUB+WOYSxOoJg0TdpdA=;
	b=sHLkM4WUo29armnk1mW657cuQB8hsbniEf3Igt8C6DwTDuw4ewlu0D0hCAiwpzGYKpad
	 CHOc8meqAl2fte/Zvi0SVe57M0tpxRbKMWd3PTX3tWbb6qXt9BiQ8eTLcL72PStugOVio
	 0rIv5OLUSfkg/MPAZAfSFK3p2Cqt+oWco7hZcIPK5Z69+BbGuJju1mU21uOBTdnXKHdws
	 eDKGjhZKmg6KjmAjO9EE0RyqDsyBqWjEwNbJwpXlY2INDdDW5KHiQpOWAu9QVsiJ5Y3nm
	 HpC+ZmBwyRAcbSCW6omitiYSPbDSGr8o+tvPr5qN5nvuVdTMZc1zmB0rhZlrVMFaU3w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914200;
	bh=9wVdRmUDOyGm8yXcBdqQKAzPlUB+WOYSxOoJg0TdpdA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JM3WXmnb4Nx9yoJ5/Hs8E53fG5TRruOz20LV5yVz9gZDxmweTS6TIjnXsKRxeOIoT
	 ZcsxHY9Yv0qgYAxdYUrQeywt0DqdVCsp8jmgtFn8Y/uuNb86qVpdDzm/p8BhQ2R02h
	 KvNcAsZAZlwp1s5puKj3fQ3Ln2r2ltw6A5DNoeQmuKV63y2TXDk1g7i5lzfUd6CZGD
	 hyOtsh8ijEbn4FSny0W9LAVQIKJvUDkVoXtoajkHL+IVKWstPiRN681dpWGCefUUgR
	 icxgfQHpovz4mMzMZArYmZnPxUjPnpW05US+6ATYl/5rW5aCQud4kfxD/4GEuWs1+1
	 VUwxH81QW1i/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1822E40764;
	Tue, 13 Oct 2026 17:56:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6AEB2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D876960828
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCj95uKg8wY5 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B4AEA60839
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914196;
 b=onsd8XfhDfE+QMf/lVIsExjbhaiBVwGi5LwnlBPaenzJsHLYZCGVQPWZtfldnidbp4UH
 1HiOPXyjB47LHbNe3KkfzR9Ptk3mLvDTwg1m4fSm5qN+jHMVJoBoJUR2NlwGaSX7FOjNu
 DseBsUW48yl5oOpkhXODk0jqnEx9njm02GVUzAyS7mK2fW/QwjVQXLV2UZ6NzsrK5rkXh
 EFEnYMx/+I8hVuDnV4zk8BYC31vEMAN5cpDtyh3MbLd9o8yd7CVgyGjb2m5D5ZCoh4A0n
 yqTCiscWofcuz13oi4ScJSCn0h+sPhUOFHhbpv5fSsR8s5dmLoo10in/lRT/F9zL3kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914196;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=c44TMrI6wetIZ2Ry22+ykqdG92yW4kec2jvCFut2Lg0=;
 b=XHnhRujig1HEgwY55LqK6U9QdabgeNSUlPFhj2IoxjFWFq9fqF9g4ntVC9uwNYvwvxGw
 UIywpnA+q3JCBPkjrYeJRfArFW1LkmJu8++LqGkpSAtYCEvKi4fWNjlrONS9KenOzTqQP
 rV6InNK+ez7qkZlklrGDSxX2dDR9SwlksYP2NGZFdfJvHtkXyN5tAp+xFiZy652jtGIDg
 ujixpyWYbJFrmsKCAxSwJ67ltwOc5n6+Q3Fa5pn/srCYSwoRSh0Edf00lbHsk3/LtasA9
 KNXIR5y8qkvxP1ITP9FMmRbhpJCJ5O2NTyJ3FfZarRryeYo0LQ3ThrxESKMTdspZaKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pNJ+Kw7p; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4AEA60839
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 32ACCC653FD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8906E6075C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:33 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 0000F11D718C7; Tue, 13 Oct 2026 19:50:32 +0200 (CEST)
Date: Sat, 10 Oct 2026 08:54:55 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <asnhNTlwZayavOQw@windsurf>
References: <asieJnFzk1h4R5z6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <asieJnFzk1h4R5z6@waldemar-brodkorb.de>
X-TUID: svMz3IvgCRW6
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 0000F11D718C7
X-Spamd-Result: default: False [0.14 / 30.00]; BAYES_HAM(-1.26)[83.20%];
 DATE_IN_PAST(1.00)[83]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,openadk.org:email,bootlin.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH] package/quickjs: enable uClibc support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 09, 2026 at 09:56:22AM +0200, Waldemar Brodkorb wrote:
> The internal Buildroot toolchain does support FENV
> in uClibc since commit 4c5039b80ebbe42db35af189afcff7fb7d5cace6.
> Tested in Qemu system emulation for aarch64.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
