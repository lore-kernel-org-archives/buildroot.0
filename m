Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3428C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 06:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3224B40E5B;
	Thu,  2 Jul 2026 06:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKjCEmiPdofQ; Thu,  2 Jul 2026 06:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D49D40E01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782973914;
	bh=3YnNb9YBGPcdmPYC/5NBOkIENU0vOzkWhvArdM9mcRs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hFuiVDFJG1LSRMQ/CtEPjte1h/FN9wdksaybbTm85iXC0DuT0D+9t9DAoboZMp5U9
	 YufRA18KcDEYboUpFieosxdd1ZXqBBYL7kipB2nr5ttjc9Nm4vh2bJpDTcSuugM151
	 R+nruaMajBPn5jzCnI/BBaRkaQr9tF66iwroLw2ygIqrYgTWEDkqrci/JTsWNkhcwA
	 3TcFZ6qV4o1KWnumgYaipNzzWshJyzvPAQt+3i4BiANZO/kBiqEFbWNudC7mPoKjGm
	 iZCxkGeqXp49PJaFRoal+aaUQ6cagkyYjTkn51HAMXihFykTwHOAzBgqc76A30X3F/
	 BoUfG0PTMQllA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D49D40E01;
	Thu,  2 Jul 2026 06:31:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F5FC316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 054A260B11
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NESAVXBYRIOm for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 06:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2293960AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2293960AC4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2293960AC4
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:31:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1997524093; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 06:31:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wfAxe-00000003MN7-21R7;
 Thu, 02 Jul 2026 08:31:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joel Stanley via buildroot <buildroot@buildroot.org>
Cc: Joel Stanley <jms@oss.tenstorrent.com>,  Alistair Francis
 <alistair@alistair23.me>
In-Reply-To: <20260630030441.1520601-1-jms@oss.tenstorrent.com> (Joel Stanley
 via buildroot's message of "Tue, 30 Jun 2026 12:34:41 +0930")
References: <20260630030441.1520601-1-jms@oss.tenstorrent.com>
Date: Thu, 02 Jul 2026 08:31:46 +0200
Message-ID: <8733y1q4vh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WJGUOMc+Bwk42a8jwBIGd1D+cE5oS7p7YvJAR5erhkaX0WMhUBquDI6YqUHmd7vys/APNo7RXd8WnaUhGjBTvDWZMd7jfW6AcL+pcP35+CIJ86eb8xrA6R63hZI2+wiCR1LowfAwFDTFfk5T70stDfzJ5UouyaHP19jPzGg78Qq8eJO02Tpr3K/qW5ZQP2JhXTV1mRnm/ggOO9SMbgjNVqlNHvU54neT/A31CYnLfa/U6zCuRjYjTLSlBcT/cBWklJNJ0MKPc3sLI3JztUaOXWoqFGmgbdFhKwhbQU5CUJAjfHXGwkEublIcM5oJMrNFcBYkt+Q3GRNaW+fs4C+jgg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=go6DAhEnugeSvOGJM+FDNwB9DzPERSKH2msHZe8BCcI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=WJGUOMc+
Subject: Re: [Buildroot] [PATCH] boot/opensbi: Bump to v1.8.1
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

>>>>> "Joel" == Joel Stanley via buildroot <buildroot@buildroot.org> writes:

 > v1.8 release notes:
 >   https://github.com/riscv-software-src/opensbi/releases/tag/v1.8
 >   https://github.com/riscv-software-src/opensbi/releases/tag/v1.8.1

 > Signed-off-by: Joel Stanley <jms@oss.tenstorrent.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
