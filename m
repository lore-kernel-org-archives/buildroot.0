Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E405CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E068A40B78;
	Fri,  2 Oct 2026 19:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XosfRusPLBLm; Fri,  2 Oct 2026 19:36:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9DDF840DC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969818;
	b=AjxYtdv8lpAlxhJGXATUyf5mTssW0vpx1381XZlAEKCxTlt8w7s59iGWHVwLDWRZYDPf
	 8kkTNzFCFqtRw1Bx7yFa6dPsQsO6CInmQA+wZvfV+V7FqUhVIXQjrZr42FPkyMYDWxM9D
	 iPkGpEPnPBjtgboIZHCUUo10QHaNfGCn0577uty2mNS+KLaEOvGR+mOvIKJfHbicfiNZQ
	 1D0xQJuIw1Aw35xuYrhKOes2j5YYP8g4VaPy7pLlzgI+KxjIQDXem9IclFljWrFghfLay
	 FBgzHYXGtfpqXxhP7kEiTHxNpPiNFhuE0IF7CX1j5IAy/z3vUD+3BFujDd2KpW3DVGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969818;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qeHxKx/6wG5ZGkxP0m8M9+nMmUJW2oSFiWLY1VuIRsw=;
	b=HUo6T1rtkiy92coJU7YQnrURtvq57/P+xO0ZXsn1ydlqYUhxr2bT+ZYuJTw+eZB0h3Ls
	 Q+RnsuiGDBiFqNZqet6dpKCBjd4AaupXWf9Y7EJdh9pBb1FcYsnPFgrBUvxupD51gh4yI
	 cnV6jPtIw8Es2Y8PN9OX+t/p1/WtvSw7/0D7gV/eWggXOYSPdRIsnJZlM8wJJCFScRWJw
	 mGq7gZCoHqNc/8stnG0RvPM/Cd7xxCQW+um0P732sZ+b+U+ZKWVGo6K5R0yZRGdWm2DeE
	 rpQoL+kUwdA55XMm9XjN5nx294EzxxqcnLyJ/+6RtGBv4tePpKJjJGviwvb5JLfwfgg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969818;
	bh=qeHxKx/6wG5ZGkxP0m8M9+nMmUJW2oSFiWLY1VuIRsw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=omtvKwvVysp9EuF7l6TTcw6L+b0DITpDPB1gknepALT+UkwgUVcyB5MUvZxbD3B/T
	 hW6xyON/xKOeuhnG8+xeoK4CYVbH8x9IpX2mnA2A4F6uUEkkE1JE4lC5/FCRXJZMp9
	 io2qIv0pvRgwMgNjofy1m83c2JxizwNqr6cKN5qUANvBlwSCEmBtocPCRQzdnVdioE
	 MOxDh+siZjUAfY7/DFG8zYikU6+mnXT3g3j38rXS7tsPLt3M9odVu//URuoWp0rWSR
	 HmfGTO8eneP2n8CytUaOm+qEIGi+wIjqla037OEvJloNr2oPgMYR0qOk7T6Ypnk7Xz
	 LjNyoHne7GZtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DDF840DC6;
	Fri,  2 Oct 2026 19:36:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A01CF1D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85F9C60D6B
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewxwPUK_BPHD for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:36:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2378460659
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969815;
 b=tY1ls8HUypnwgwVM559cy7KVj7XSkM+JiLj625BVbM+hYt1M+EjKYElEuNy9FJr2PpY3
 5OUlANeqC4x38oDWHxIe9ICPk2TZj6xzTF5P/2gEn18J+7I5JFt2czibDSPTvmd2LI23N
 m1pXqkK8PURjdQXAScmu3V4U8xXbxqzsXOOPiiMXrA0mYN0bU8mdLXbKVq0H1RWDeEyjd
 bygI1nn0XZ8Tsv87iNj5j5/OvrHF1udz42DW4THWNTZ0lNzmAxvE7fxFUch3FlonC8hB1
 CilbWocnjxZGZai0QGFgPPHC5Fy6YijEfdoXSV0XUVbUFg2qm6xVuSRFBSpjYw/04/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969815;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=FbRbQKpG5adHVKejLwV5GYkYOwTjVtz4GqkvAsZ+Ims=;
 b=Il+0RX1WooUDx5RtTf9YR5dcCJfz8++VlKbKaiGs284Xyx8gu+y0vNtH/n06+gGA5dFj
 1DO4owg1Gks2ASbvb65gGFE+LpTUYuE0LroChiD9dhZAS9WjffO2Z9Lk0wBTLXkKmp2Yp
 hKhh+Lk3A6iu+FfywEjBIqH0CWDuQFTEtD4tRh9EiJdPtv1bGBzWQXewuWmJ9gb6LDoAN
 drlj/qCv+/HHBPrW35nFpyLAfADudbgh5xxmxJDpfGxkI+bSztz/nh1aQQ8t7n4ahJik2
 4y/3PRpE6LH6MBULsejK3TqlmsTA56m2uNo1eeX7j4ADVvLoG7lckWWuHTKjLhdXoig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1TTJZC4s; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2378460659
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E128F1A10EC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AFFC8603DC;
 Fri,  2 Oct 2026 19:36:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D662C103281E6; 
 Fri,  2 Oct 2026 21:36:50 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:36:50 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Message-ID: <asAHzLhRG86FNMcG@windsurf>
References: <20261002151226.867507-1-fiona.klute@gmx.de>
 <20261002151226.867507-3-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002151226.867507-3-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/lvm2: set unconditional
 dependency with "=", not "+="
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

On Fri, Oct 02, 2026 at 05:12:25PM +0200, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> This is a simple style fix.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

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
