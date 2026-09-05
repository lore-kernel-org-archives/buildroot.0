Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D64C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 13:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61C7C810FF;
	Sat,  5 Sep 2026 13:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAghIcb6Tk6H; Sat,  5 Sep 2026 13:50:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B911A81067
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788616253;
	b=IEec4rx1EqbskJQd0mScniCodMFdD1toxDh+Nl83a/DXfaCFDzO2Q3YrkUnv1jye2okF
	 C5PldACsI6m6Rv+WAwBL8ScJVJgq3AA2HHq/ZaOA3UXgAYB3sqnqoRek5FnRgUy5Ah7nU
	 Tc27xX4XFQQt4y0qUsSRFMlbeFnOfYjPitD52W5oA80Fj7Ktlbk15UWbJbuljNhQsMBY6
	 HILhrVGPzQRTErtTCptRDG3yUuXDe0ryH7ABdFDTRAc33CQQEBicEcxljqQm9DuUGNSfJ
	 xQZFPI1COiCLgft29Vs5HIiHdcGSI+TNekxSpr4xwAtcWw9IDBXlKVfzZxTYo+kt8gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788616253;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hajwb7P4Yl7UB+CktfVd+u2+bjk9jFOOMdXmRBO4/68=;
	b=Tw5rPEs1WaH8Xyfgbaq1fwRL2LqidU9OQxDVtYdfrU8lJ4/CBNnU4HpN+M/EXeo9108p
	 lol7uynN4Lbu2iAzooVR2wrd8cxZ6Mq3qkj85mp2MtJqYt46D63EOyfyqbpLJjzB0ZaJw
	 bvv54CcldRFdQ1qmkf4a2otwEN0Yl7fKxvOuwpObPrT9oS0gc6JO6CWWcaFyuSwKy0WqL
	 R27dQzNUnetrHqnztUMLAQdf/mPdBUsVE0GxCbdcwjl6Zewi14xCJrFu/aFrsKl6nPqbc
	 mEdy1Ud2WqBFHyayHD8tj43ecY2uvxhjY7FgQ8uYyaY3ccdp3vmYAJOgG2TPMI6MlsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788616253;
	bh=Hajwb7P4Yl7UB+CktfVd+u2+bjk9jFOOMdXmRBO4/68=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XO5bmcIaaKPsrjoYNZGU11BwXDXsqggQh5hLXbbsekfCjwOA4hAXc7XCK8HL79pPE
	 nzCGUS4HMZ2FIeJsjWjM3joPIBYZSXHQVBsvUjwxDjv2GEV59ytovrXVmUGgDu6iDL
	 rQVBPBPAVOd1FKCFx5YjQo4y+jIJGsRuJi1XS8H4T7KnGPgdVjhjSV3C7Be4hUG4l+
	 EvOnX4y3lmBGYh7OujYiE/4Pwjgfd6jgAOPQ2kUt31v6L10cTF2IP9sk2+wZrVHlaR
	 0d6UC/TYe8mcMWqc+0snLgVk5PngUr7IAD+THK2hK2EXCBiEPnE0CobR8w2TVUuZQ9
	 l7A47KJkBhxnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B911A81067;
	Sat,  5 Sep 2026 13:50:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA0349D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 012A260604
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAqkgqSVayW2 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 13:50:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B8E18605F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788616250;
 b=OV6pdC3PbTdSFMSncn4vZ8P3S27CMOtdnOA0HRRODxk3xEBjcysu5i3TBD4Yuan7mavG
 ZNIfa4wZauSxeA6zApMmhV4pRjQBEF7T04mOEF7zLa+YoOfUkJ5I0hw9LMEBYm8U0DyTm
 l53ub+U3DfixFa5yl7BitAL6oZbfhwbD5J9rVOlzSKNy46KiB6bx1FfXjkjjo63aIwwRQ
 +b4KJdMBgSO/j5tbdILea1rhJzU/LVStZXiqU/jbMnIqI6XsTFtZRDPEaqndPWtmImWgi
 JnCbWHxv5YEpD43xrA7N1kA3ia8FMSYYddM4jbTMeBFIyry5OaqSo6JBjuctNlJwnyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788616250;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=sLBRz+ReMjJAJ/1YYEpAIEwPxDxoHKtqIScOsEb3zjQ=;
 b=d8oOG6QpPWVpgZ+yadqJQm2Fqt+V4Dk60f0iENTmpHh5/t2ZZX0wRqaQx6Jc4+9yLlQx
 tyakfDpOW2NfS20ANn0+PY43BPsum0tTn259UHtDnc+eDWTTT2Dg4za471cWC4KxD7vlC
 C1L0M+m/8mNuRShftIdI02Hiq9M7fis6l/51I2QBAa80WNKUsNK4+8DNs/4/NKmdZDFTz
 3TUnLaljql3hRD7AU9Ar88lNr9ZJNAbEodWsByj6DzyyYTTSQaB6fkfCkqTPr6B3QGgRw
 lYcCJVitis48E0xhVb7hBiLhZE+yw+1WTeDltaH7vpZ3vOqVyegMzCdp1ZKNea0bvRA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=I8V+VZgQ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8E18605F8
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BBC251A1901;
 Sat,  5 Sep 2026 13:50:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8B4DE60233;
 Sat,  5 Sep 2026 13:50:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3956B11C783E9; 
 Sat,  5 Sep 2026 15:50:46 +0200 (CEST)
Date: Sat, 5 Sep 2026 15:50:45 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Stephan Hoffmann <sho@relinux.de>
Message-ID: <apweLYDLLO2ClkN0@windsurf>
References: <20260904112311.582007-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260904112311.582007-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/gtest: bump to version 1.18.0
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

On Fri, Sep 04, 2026 at 01:23:09PM +0200, Michael Nosthoff via buildroot wrote:
> changelog:
> https://github.com/google/googletest/releases/tag/v1.18.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

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
