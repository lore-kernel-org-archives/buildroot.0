Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0410DCA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C405541308;
	Sat,  3 Oct 2026 12:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NW-4waWeFLf; Sat,  3 Oct 2026 12:53:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A7E9413BB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032021;
	b=Rl38FVF7WXkbzoAzJq+9iHpAzjNMCBk49PDmS1Go+jb2nx9yWMyUVMFnIPp0vaEKgkCk
	 IchhvKlgTNjPg+lj9oE6n4kYUiZhBF91gxr9H9p5cMxkDuZa7lpoRCHNnKxJV4O5xmz7k
	 +OLi42az2wJEYY4qPWP1ED7BEq3ND9o6Me/azChC+8oXN4TfSdDpIh4dTWKOIF4meQcvp
	 lswbN6kSGMfOpax1Iq/rh+0MQzZ9w77VGHJ843FuM+knQeDkKB7tYME7pD6X+jVQMFQmE
	 /rLyZX1XuFHSI9EVszBYcAPUINCjxKQ+cBnekCuqtuxYT/g9qEUAeHc34sOTc6AJx3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032021;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0gWCXZEeWjBwuGbXYb1ERo1ZdQnXe1+YVkcFM08SG7k=;
	b=j+06ItbPFUtGUhczRtFGCRxhtG01xTeWfAWlElwz1dAaY2f+gE/VQsB0cSrPrxE5A2vY
	 AHOFXO8/3vD8wY2XdDOKSbxFx9emhChSqyh2tQguP7Y/TeewDpmXB5Uidp4nPyQID99Kf
	 fxfDRm3GwHOI1jLzx9DDGfCco8tOLBZv/DvVbGOx4xXQPgGU71b7NVBEzCPbrRM9EWrne
	 g8J8OrzZ3QdzU7dX+W9rRKq1SdTnnq8HIVQ9exeY3IeCpdtcZzK1K3GulOyP5xulhj1PI
	 60bn+Qkp59cNC2js5RU2PriZLlbIdBQtAiCCgrL9Sa9hTuWx2ppsJcNn99dkpZPiUKw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032021;
	bh=0gWCXZEeWjBwuGbXYb1ERo1ZdQnXe1+YVkcFM08SG7k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KEp9BGXVUgSnLqpzZij8xwRZ9gu6Gr285ZYd5BoBO8pbzXhCPmM/QAN+AcySpZ5+3
	 u51+li9fe9AUfWBhEZbhoynUJkbxpusPRHAL329j53p0TTA6VDMJTEg5zpfctqL9Iu
	 AG+T9TtlQBmoifBhEoyw3XDiCgUF9+reH6GeFnP2357D/kKyQVoi9hwX94rFYubCn0
	 O/WkHY1LchuJyb3Y8qBPTMKFUBwnLYz/rBXPgFd/XGRwuM4ZvJCjSSDv7pLJD5vjp9
	 Iz+9ji63ZizbcVM4KeOrL2hMbE8bfxt34iikyVa9C2f1tfQd7sE7AKGgIu4Ax5ViNN
	 2rGooAqn7X2jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A7E9413BB;
	Sat,  3 Oct 2026 12:53:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB81D335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D250B413C9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tffMcCy1DI8z for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:53:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 02A4441308
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032019;
 b=I8Ppjmg6tPtcE6cW0oRL8HXqFctVbWEN74ULafZs6WJdKQeEC6YTrlkjQtwTQIwdb5uM
 OlbWhnWeujL6bsbTnpIt9/ozFpnqhCs7ETC/jxLc3WmFYfD9uMiY9ulsGi3XEkGdiF+Fu
 LbFQyPMZgeTNgUBKxyFOiT3jhSQ5wp2o34YcWrIdINeKhePtBtVBjb9hucm05GgTsW7so
 aCb9cnFF9fgZaI0aVWPf/MdKDRJQ60+1cBI0yPKBM0IzPu/8AWAY6NC5d4qvnpfu1nNZb
 pQ+YpqFqJ56UwJac7dBBSMAYEN7DE4lR6XqNpAQaK6R9miwK3zpMCJT1MTUzMSaa6Rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032019;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=yigtwn3ie0YdqUGEFd+h6xkDXeyJOGeehN4bsEkO5qk=;
 b=B84gBaUOKN5tmQXasIy0zAjU1LWEn6LI6w85CvSxYN+CThn4xnEOIRy4a464QKMkBjwA
 7V6ZpHo+7Z/TqKnn4Msokiuoe3/cIKnVTX9cFMd8ajYUPK/mAFaVQyxK/gywQjPXuqg0g
 n6FegCB140AFs+Cnc3s3vnNJuNBRbs2LqTaFHKBImx6uvoWr7P3Q4K+YahzKEb3T+iWNy
 RvLaB9pf1po9EuUN35pUcayRJ7aDTfSFOWNBqQN0F55lWyF433u5N4tlsz+DzUgEY9AoC
 4m1j9fuKviIS/0pvrTmeVYobUV/bIm+ryVptqzU8xfSlrVEfUrtiEy8MRhbXi622Rig==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="jpf5q/VR"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02A4441308
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:53:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BBC8A1A10FC;
 Sat,  3 Oct 2026 12:53:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8FB73604FF;
 Sat,  3 Oct 2026 12:53:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01DB810328318; 
 Sat,  3 Oct 2026 14:53:35 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:53:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD6zCFQSLle-PWe@windsurf>
References: <20261003084453.545653-26-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-26-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setproctitle: bump to
 version 1.3.8
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

On Sat, Oct 03, 2026 at 02:44:11AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
