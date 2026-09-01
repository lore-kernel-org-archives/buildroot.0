Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2CC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87A6606E5;
	Tue,  1 Sep 2026 14:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9ldnkpY694h; Tue,  1 Sep 2026 14:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788271869;
	bh=1kTq/G0dNr213q2ZIe1ct/3/tbbxxI4AW6CrckZNCRc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKcPOkMiXXu9dCMP+iYBcHuAew7y13c0Uz4ldAZRGmrLvsjfK1/20PWqmLgyW67fV
	 O5HN0II6cR+uhtpvnvrdZ/Q5jN4A65XXJgq5R/tkAKhadlzjmCdLea2xbGc5/TMy8m
	 bLkun6Y6bhu8cj77DVTEh4SDPUA8jzDBgqZKSpIR/OMnBYfs5QaGTd5xJBZzHt7vnq
	 nj6AWMviFv3rUkwjIyb/UKPJEAl+dw/y8t88pfKGx/C3fOj4XB6Io3HHSgCQIfTm43
	 m67P194kBmxcOnjcJVNwvKftUk3D3U3/x1CSGZUxazAOp3X+L5D+3LuNfCl3soozgA
	 7eKCRgLtgXoww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44582606BE;
	Tue,  1 Sep 2026 14:11:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 701492FD
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567A140189
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B27-ZRLCuPTj for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 14:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=W1XciI2H
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5D6A40079
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=W1XciI2HMDHalqdcAq5XkLPccOi/691w/2DmmUFYuJz2QORWqdN39LWmdg9ddzWy/vq/AgJcy4UAySAWGkXZmp6Cu9SKYD++UDOC0XEz879Oj7jy+0bVUlFAT+BNlI4z76Ll2aQXtR4S1UTY8Slk/wOkz9nGqXcBDhHJbCF6Wmp9BwVEEuAxQimemFXT98AWnuyMdSCn7CEeK9Gzc2ke0dbrSZXCcInRLGs8ynfFjFKdMzwxjawM7Nssvz5sftrpf9PjHyDsM9BYpQDxpfJ2vJoYS+sxIwtICqaqY1tu0eau4iZyL3yfteDP5Acy0DWLmLbjLjujN8FVzQB63ray+w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=lPJCfxLT4AvDEs8RK18Z2FmqkvFT7TRfOH2GgTrSvko=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -231854114; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 14:11:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x1PCW-00000003URg-0vQT;
 Tue, 01 Sep 2026 16:11:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Vincent Jardin
 <vjardin@free.fr>
In-Reply-To: <20260828221147.2883191-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 29 Aug 2026 00:11:44
 +0200")
References: <20260828221147.2883191-1-thomas.petazzoni@bootlin.com>
 <20260828221147.2883191-2-thomas.petazzoni@bootlin.com>
Date: Tue, 01 Sep 2026 16:11:00 +0200
Message-ID: <8733vt3vuz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/dpdk: make the libvirt
 dependency explicit
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > examples/vm_power_manager/meson.build in DPDK detects the presence of
 > libvirt:

 > opt_dep = cc.find_library('virt', required : false)

 > and then builds some examples or not depending on the availability of
 > libvirt. Let's make this optional dependency explicit in dpdk.mk, even
 > if there's no explicit enable/disable option for it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
