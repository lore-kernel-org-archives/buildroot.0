Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718ACC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 10:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197DB40DAA;
	Mon, 29 Jun 2026 10:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3x79Ut7mRa7I; Mon, 29 Jun 2026 10:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F6E140BE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782730478;
	bh=v1wFC9otdgjQap93KZJZd7ospkYAGnCsWDojdBjJTfE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FSovtAv1UfONmuLhCMvdmv/89gMVVNdWg1KSb6e7xNxSpBuMdR1q0ZROBbdNEUTvH
	 ccxv/oJsHzumcKoOoUF0Yp4GpSUWCwK7jPxkKdpfQBAk1+PfvktlaSc91bWFtONAbJ
	 DcZvqKgsxEHAs7UMkTlw5Tc+6BWENGQgaHvvt2RG8CL77drSa2H7l29TAbR2cYyHP+
	 h4al++1gM7FSV9kWechspXRj6mwDbeyj4efiu8QTslkSmamEzB+pk+VsgtOkQOIwEs
	 Jv3Q4QJKaQDeHFWmVcPmUshufz44+69F2PuCEbTFX6KpO1I3wJsFuqxTP91x6q//Uq
	 Cqj27IXlNVL7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F6E140BE4;
	Mon, 29 Jun 2026 10:54:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF1B0264
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C516840B8B
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boRdpPCblj4l for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 10:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4C2040BE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C2040BE4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4C2040BE4
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 10:54:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -523500166; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 10:54:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1we9dH-00000001yjS-0zyI;
 Mon, 29 Jun 2026 12:54:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>,  Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
In-Reply-To: <20260627113541.779625-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Sat, 27 Jun 2026 13:35:41 +0200")
References: <20260627113541.779625-1-fiona.klute@gmx.de>
Date: Mon, 29 Jun 2026 12:54:31 +0200
Message-ID: <8733y5vcpk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=pivHrMUQ3fMRPcPid/VJPVyD4/UKyinWX07m7b6PL6gUCzaTrN1BUzs3mUhzJ4FVWLtGHJ4jsOgibBbpkMRZj3+6HNUKUool0OMd69CF/80VrJMmDvOEGcw0uryYjLlymBtNGXxml+wBBpzir6Cjlq3QIfZeo+hR2CXoA6TsAuKgBDgigxXlUv9NS+Szw7o0ITdqa4mxK9+aDFNpXYrZMmp/RkFPKvoVJOqwPKesiPxYJpu+L+kusKdIG6EtoN5ipDyr2mKVyURrER+KnTHksAJCjZ1g11p3oMgeKWowq7TgUSC8qdnuVim2QJfUwXCTxDp/KX+5Nh5/1liDCUjA1g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Nw2Ie6Jx6eDadqEWp2hLMkWZW26iCYfyucf/XH4jQg8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=pivHrMUQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2/libglib2-bootstrap: do
 not install to target
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

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > Libglib2-bootstrap is only used as dependency to build
 > gobject-introspection and then libglib2 with GOI support. It should
 > not be installed to target, even if in practice libglib2 should
 > overwrite anything it has installed.

 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
