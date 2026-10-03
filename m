Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75415CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A038124F;
	Sat,  3 Oct 2026 12:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5MULAMnK0ox; Sat,  3 Oct 2026 12:35:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 668EF80F7A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030935;
	b=Vzx+n5ofQ1RO3KrrP8SHpfaWP03oH8a2lYhKn+SWhKfIPAEBacDON7nxNz9T7A1sqKhe
	 x71V1y5FeRu2SshODvZqx2Mg+cF5V7SpB4ZvjnVQhEoSVl0S4vNtNLmuZEDbbsjzOyyr9
	 C/0/jiyLRVXJoEzAuqou8xLGriiTVqjJRF/WM6m6Ay0vbEyEQ6SQSjJ9LVslanm+B56AM
	 7pv+97YKfUC6HrNBq7ghhExvj4eASkLU99oh9I5oohWPa/zAxxhFaYOMjnzUSFmvUQUe5
	 Xr0B75H8LJw20aQ00bmNw2mWp0rDOZ8re/t84tg6I2u3OzNNHRs0daXAfLquZwUDwAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030935;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bqc9auvHS5qeZ0lHlfaS4I4gMfYGhcjkr24lp22/5vw=;
	b=DNqst3R/3n8gvJ3gLoEVZIX7FY73OtiLPhkokGSRgjlxfALcn5GDdDHx4249JutUhUuZ
	 qDh8E/oO/Qb+9cKI87uqFHMsmcoLJ0rWamab+QQWQBmyMpZtWaPQPUAOkYe2jC02V6eQk
	 r2MVQ6RfMu8w3UgoPVzZEY9+s2JKWCgMV9BUo+RUKzi/wTrH5Lzwqo4o+iwxselhmi0oO
	 ajoLwFEZSP9bJfMZkpg+k5hc64T/LTTqEC0WsFbTN3Ny9tdAvWLbGxCBgGHxG9Pach9L6
	 175dOsuHDN2UEqE26g7DdDqLee9PE7oUNXXtjMhkPDJKXS4lYJZwAH6Y/lxI3z9M6JQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030935;
	bh=bqc9auvHS5qeZ0lHlfaS4I4gMfYGhcjkr24lp22/5vw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N+Nq46mL4fsCw5cVj658ykIZ1fkQqpKrntG4Mnn5LjmbU4B4VODQqMmoTnHK46qhT
	 M4oovBlES9LSpclFwCvyQaeZmhp2kgtkhnK57FRdETHGehloa+O0ZrRSXesmoTPyEn
	 MOizSA4jmddXbh3PNHcSpVtZhakXuw9JMaZFQwCzbZ/RUESqaX2rTJw5fS9lQCj6js
	 5cCs6CoNAInuiGSFyX3POLuUFGexIGrGVQo9JUt0uCnHYPYjS3IBj3mdU/as5W+VnP
	 ddnCGR3l/8CjZsM4e9+/XqM4n+G5SqBQ/i01itcx6oWAOwTzxdaYhmVoVltQgsTI3/
	 NjoH8Xocdm/lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 668EF80F7A;
	Sat,  3 Oct 2026 12:35:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E12872E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6FA981230
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3csXHP6B33Z7 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ED71E810C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030933;
 b=NqBE1bK8VBV30NNAKSHlNgHpaN+E3dzXHeI/qTDWKhfZ9d7ja+NLc/pG2Vz7dp+Ldzpi
 /bK2ESqiUFU8Dxc1FeKOxu9wJ+5UNv7hqV1xdWNLkX/o99thEEm1QBp6k/iMjecdeei2H
 Mb5Q+s+kZOBjcSVQlCYn9pz8bUNZ5uTck7Yw+ZRXia8csApVfocC6IIZn7fVXlx5OLYcF
 s7TbjB5AqAcVGIjEKq9KSZ1arCY/rclK4V6DX4Sy/UdsB7vOV3a1cAeIKk3WS1gRFvIZL
 1xdPQkpQP0MP8YWr3wixKzvWNxNomFjdaGc8UrjHuy5FPUFpkcSn6uAWwDYPqZ9L5Fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030933;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=0uQ1a9JSJRViVazMJLIdDrux/FSwHr8eu4byLk0IgZo=;
 b=NqZehoV55oSWHicIbB9Bd2UIZt/aw1qXU3LgOeFQ36YSdK5JBpAnvbs0BV45NodgG57Y
 j63ovfkW/dYFZW6clZOW8N8hIpGiJgtfpzAY2KBX5P5r+lWOl65S3YWDHaWh7ItJ2ccdL
 z4vWBkjipuquizwPxi4kLfK5BIeMLGbFH5W6fBxTWLRCF6k61jqoBJ0WJb56PVz6KqLya
 UWOo9htTDUSkwxdsj5JTdeHrzLlQz8EAEO9n7C+xY/Y2QSB/MVwHkiAls47Zw3n06/l/p
 fmZnd2SsRKoaLZDstFV9upFgdxIVqyISnAUz6HvHVi2Wdvq1/WpC2VEEuVsv7sORKYw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="W8d/7qH+"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED71E810C3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 115181A10FC;
 Sat,  3 Oct 2026 12:35:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DAE3C604FF;
 Sat,  3 Oct 2026 12:35:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 094A810328318; 
 Sat,  3 Oct 2026 14:35:29 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:35:29 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <asD2jRFm7ew2vl18@windsurf>
References: <20261003084453.545653-10-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-10-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version
 0.5.7
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

On Sat, Oct 03, 2026 at 02:43:55AM -0600, James Hilliard wrote:
> Skip the dependency check to ignore the upper version bound on
> setuptools.
> 
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
