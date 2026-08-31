Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C403C61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581CC80A6D;
	Mon, 31 Aug 2026 20:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QGmxUkIKHaq; Mon, 31 Aug 2026 20:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788208824;
	bh=Tij6/n/7Izc3Yc4wA7lQoh4bPCjzcMIEgwuuHoLTkxo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pp5UBUtzMUhNKTBsPLW4D5e13YMjXkAXTZ2QGxmT1K3wUhds+MXYPaYl+F1ZfBwND
	 PLmHAEQLBEhQHL7Q62FLlWmDcJES8inOO5TynIDX123P0aXLILlLeufcMnRnQOPYSz
	 HErqE7Qi1YAehWxEpB61mEFnZo1GElx3RazRZX8+4f6qna0Fdg/gYWKe+M9Hk+Wrtf
	 dIm07INDGFl65M60aUfmvKZrhTRYvUikOD2pQzic8uKa/7gIBGSculeh4WY052BxWd
	 P0xVsv1YaXRl9QVbRbS1PoaZyib5Ab+4OnnQp9is2WPLFkZerejO2+bfjhM14lZHXW
	 eEemPrQWjviHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CFDC80A58;
	Mon, 31 Aug 2026 20:40:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5AC534D
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC032400AB
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNdY4QV43nMN for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 20:40:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=jnboeYh6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A515540056
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:40:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=jnboeYh6hr+a8MT3fcgagilPdhTE3fuXuvm6su93D7CT5AAT+HrZheKqXBQXlM5tLN5/6HyGPxK3L5VomYY9DXtRvq0xahKi37mQ8LZyhPgKg18grb0PGj7VqMa6EALHoG7B1QO+0824LzXUewCLHZW1zT8lLzcJxryrRfgPMSSAEI/1MZo6t33pAZsOQazENTug/UdHxpnIe2HMJnHgvir++XqpHzNnxeay4puQ4rQ6mTxrR2BO4K2A5KSCx67C+OcSabAYh95PNljFGgTSAoyEPkKlO8qEBokXnSKQW60n8Qpv7dsQvDxQxMudx+TE8KD+DnPlO8SLjmw/P6oUdg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ZhpSDJDDNi67w1XpBKCKzO8uoLK4vr8QmnJcnNNBlFM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1802204628; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 20:40:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x18nh-00000002Rz9-1Nc6;
 Mon, 31 Aug 2026 22:40:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Francois Perrad
 <francois.perrad.86@gmail.com>
In-Reply-To: <20260831194910.260600-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 31 Aug 2026 21:49:10 +0200")
References: <20260831194910.260600-1-ju.o@free.fr>
Date: Mon, 31 Aug 2026 22:40:17 +0200
Message-ID: <87mru2gh1q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/perl: apply perl-cross patch
 only on target perl
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > Buildroot commit [1] (package/perl: fix build issue with musl)
 > introduced a patch that is meant to be applied on top of perl-cross,
 > which is extracted on top of perl only in the target variant.

 > Since the patch was introduced as a normal package patch, the Buildroot
 > infra is trying to always apply it, even for the host package variant.
 > Since perl-cross is not extracted for the host variant, some patched
 > files are missing. In that case, the host-perl is failing with error:

 >>>> host-perl 5.42.3 Patching
 >     Applying 0001-configure-keep-_GNU_SOURCE-in-build-flags.patch using patch:
 >     can't find file to patch at input line 46

 > This commit fixes the issue by moving the package patch in a dedicated
 > "perl-cross" subdirectory, to make sure it will no longer be applied by
 > the infra. We apply the patch only for the target package variant using
 > a _POST_PATCH_HOOKS hook.

 > Fixes:
 > - [1]
 > - https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948610 (TestPerlXMLLibXML)
 > - ...and few other tests requiring host-perl

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/d950fff290b1318fd72c7f09fedbd1b87b96155f

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
