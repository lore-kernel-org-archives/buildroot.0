Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2C7CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F314340681;
	Sun, 11 Oct 2026 13:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wde5dTUzXuv9; Sun, 11 Oct 2026 13:05:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0890840675
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723933;
	b=MAtLyTPD66fMN3Af7FSAuB3gpFtwIKUasO3xzjQe6ySQzjKVpn0XmMcCQMngPdDkPAC9
	 dqxcVFJbZ9UqqBMwkTGg7EedPFzZ5o6a/su7eQfolYamMt3q9JmFupSna8YCJPA4cpst6
	 KpiCjPsp76vdX4m3Jmx1oFMxSW8Cnb40YoZ9an8/BGf3LtiMI853NS9vEAeREfaKfEvac
	 R5bLQ78gHXIflu9CiCbHq3aSaCoi1afljn2jZoeQcqxs7Gm7VpyFOM2ydWwZe30xZQV18
	 jqt4XiInhN7aSdENfwt7Jr8Ybw53cXBaleTwzbHzZErNq9Rb2ZAO/TtOaSfk8wQeEdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723933;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8PnJKba/zQUH9fqBm0HWY1JrE1pj3CC6K3rvwYLtSIU=;
	b=OnV/LqqPKnofPM1Lq4b2nk4H9UjWwPB/lHgPgeKC5N0fp/Mp71HKpEBroYkJWwWbMmVV
	 OEEkmoxVmUFp2/xU6kOpu8i9hfAqt/P60Sd8ZF4eor1gJDWWImDQP6E4r0td5YcsR86Bf
	 GA1ZypBkZJY1FyhYjQlJuVzwZGWWPEhPUBygTh7+DMiuphSxaWyF/zywgGk7BPTwNdcrB
	 p0Ms+qsHL9IRZcHdyG2r4AyyIBqnRKtdHGLoQDPvhzUzuQl2djgXDf7OQ5qtsXkclaMiS
	 gG0MUfa/TrvqahwMlCDdFM44Mfc2zSJZda7nU2tGAps61+jpmVi0Ahhz0K22PU0TXEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723933;
	bh=8PnJKba/zQUH9fqBm0HWY1JrE1pj3CC6K3rvwYLtSIU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TCL/L54FaCudrX/8cTL++6CU+tEsPt8cBRdOR2AwQlYCHNPXJs5Qn+2mMUbr1/28h
	 MssqmWluUyRtd1fzTtZAf8oTTU08l2rtPxRnk4qyFuJL3Q50PUI+9mrH/e+pfvG4hU
	 0jq/4jp/T3+Wtm4QkHMupPbyKejEdFtEahSg3sfGsVepaZEgF/EfP53R0JOAN75cZY
	 AxDZvWyo+K9LtrR/pYQBk+t4eCYGnOy3fptAgXyQ5b1x+MB5YcnTkI6iXG7sTautWH
	 7YH9VIFluOLIzVLWS0GTTDyo6GcuI/OJAVIDV3+N/hQbuNaiEf30Sxa/QmWnUnPUxb
	 VFTzg8Wrdcjmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0890840675;
	Sun, 11 Oct 2026 13:05:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A81E1D5E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99A0C4008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLGI5xIr2mjK for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:05:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 445814002B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723929;
 b=Q8z2A+fwVi7QLWI4Mqc6+7+D9A56BnqA+VllRi68Ye+s/JOVsx7rap3CkH5y8/KRUeGq
 ihMWzVow6eIfC9DFuy6vxshvyy5WtiFTtMP3fBZuFNi827toVYCbyr762f3yVQW8KsFdG
 +c7X3BFrSZuK6UM+Kpho8X/3y2sk6HCveLCgP1PbiIZIrD9vh1RSk7HSqPAWXHl8JYoXH
 drXyJRZKQAzcCfs1Kfex1eVIVdFVrAf68gyvQnBSp869aLFzWv4QOAsyWkt7g0Q05Tyhm
 9zhlV/ZHIFzgrupchkp82Z5L8bSJ3wTsuwX4rF3MCHWmmAGz8Ic6X9aQ2F/JbO6/+5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723929;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=PW5MgMdg4K8+VMdBtcpx3OmWtPZhHpcZUcUcABLoeus=;
 b=FM2KhuHEjZ8wX0x8JjPUvlwI8y48cpHlpwzC0mD52qIFjkkBvfs2gETAut6AE/fk/fAF
 uCQstN3OxS/CSetDHAnlqpR+WIUcbz3Los1KOJFyIwTTnPlsJ3Krwk4m6f6HQEn/qoJPU
 AxTvMLqIesVTQkINVPGjWjbdVsr4tB+PkUsor+cQuhdqDRRSEgu8mk5t+YRUHEqDkfZHm
 obwefbKS2SM9XhIsO4yaOp/i9aPJdIbsTAT6tHGAjpr2RhbVM6pUmOKVn8jl1Cls6/V40
 nYQ4yvKE0l+gw97cFMZKJF0RpT+UqN7Hai5OJwPXgO+/M0CxRAHg5LMls05UfEqP5zg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=A0DqHREW; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=A0DqHREW
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 445814002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:05:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=A0DqHREW37djTwFrbDoRRmZrKkc+Z2+0zeQujrvhYOwkoxMWUvE7Ebvji+fG8+HOMPG5gyCrmf5qE5AjWhzItINYT77mmhT5NoQR7P/p+bQgBRwK/UEA6qk/OxiuPAOfcVm1AmnylcNdMURKxtYwSHeuZvls02N1I+4ULpMxaHsHlOjuB6oG7QcU2h8nKAKjLBkuSN10LOxyfy8wE+jfDo7i7OOgPxUj5mfLjf0S8y3U5M8YGPbEYMpum7Px5+caJ8nIBMlKsfoUrHQ4UbFEs+jBX036XXbsdNUARcJvWMNyORzOSgltz3rhJ0LwOIIwm0tc9SCDnSqS8rCctCw9rQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=K7UjQFEjwmpLotbYZJSF+ldM6GjFnPCcjXR6wMsJxRU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1839567097; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 13:05:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFtEx-000000096fO-47G6;
 Sun, 11 Oct 2026 15:05:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org,  git@jdknight.me,
 thomas.petazzoni@bootlin.com,  arnout@rnout.be,  thomas.perale@mind.be,
 ju.o@free.fr
In-Reply-To: <20261010201508.963412-4-titouan.christophe@mind.be> (Titouan
 Christophe's message of "Sat, 10 Oct 2026 22:15:08 +0200")
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 15:05:23 +0200
Message-ID: <87wlrocrqk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] configs: update defconfigs with custom
 versions to BR2_LINUX_KERNEL_LATEST_X_Y
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

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@mind.be> writes:

 > Update all defconfigs that are using a custom Linux version based on a
 > longterm supported Linux version so they use the newly introduced symbols.

 > We already see from this diff that using that feature updates quite a bunch
 > of disparate kernel versions accross the tree.

s/accross/across/

 > This change was automated with the following Python script:

Thanks for including the script!

Please check that the defconfigs are still minimal, E.G. for
visionfive2_defconfig the BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
line gets dropped my make savedefconfig.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
