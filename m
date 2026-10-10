Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C35CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C6860845;
	Tue, 13 Oct 2026 17:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AovVvg67wc7E; Tue, 13 Oct 2026 17:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 27F9B6083A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914203;
	b=FGJQpjvz6ANh+hqR3lT/e3THkoHQUzyLd4JQcMIMUwoe8waSIz8XTQBbofB9oncftGUr
	 /GKqz3f1pfa4XyNu++BLSEMSJiGBGrkAWBTlJ7r/ktZYA1fBJ9ms6am+VHBZorxUWY8kJ
	 HwRy0QZQy+kDwa3vYbX+MGA3OFbCTirVKvOrNq+9cqMf7uoiF/lQUz+rAgPhLXNmDu5Fy
	 5mGGYq2SJAYOTih3TdRUfAGOWaz9UPfv9S3bmZOr93s7cmOq98CKeG/PdVhW1i0MtsIkk
	 shdCnnS/D5epfQci2IvL/fCGUgVzYCLO2LAeCkONvNzTt5nPBBFWfLBgv/jmygOO0EQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GBAItsna9wRqekswsW920qvy9IVEnJVBkwCxvAp1Jd4=;
	b=SIgV5xljlpUfZMeaekRkzryo+w2QLi0jpPw6ELtA8VVmZyjtulF5rKPsYu3td+IsQFB9
	 bW478O6KfMhysmQqqNJui6dZVlkJDrOcx5wuICtYq5AoUbLowBzXmveS1unlIeYVut+xR
	 3xRl3s6CeGwtTchlrSAsuedALEvrB2u0H6+SeHI79IGum1iI6BP7Hd23etwfsNsyUxDrj
	 2R5Z18g81Zn27r+sENnJQjBxibsYM0fJETHYp/t4xOKsP7aUlJGSUQ0DWWE6FkGvLaeLh
	 o+lmhZ6uq6ZGyy12ZGyI/l7iikmOdc6rV59AbKzXpuWDFRghHPwk2l796mlE0B0KkFw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914203;
	bh=GBAItsna9wRqekswsW920qvy9IVEnJVBkwCxvAp1Jd4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l/d0w2ledDWS1U4LePlvqTVEQcj2QKD4SXjtb+7/z4NSsRuHDTqTGLAxRtt8a6gXO
	 yBkKvBDg9EeZRlj7S4mUXCFrva5KWbn8NYIWDSw0h1w71Nm9VIXWhYImxqzBobFYyB
	 9gVldhetNeqIrlha9PVL1p4M8/QtZKC8q3f+ls8yQKrdppnjvPyMK7YpUdboFqM6cE
	 4x1HOsEpQznF8DOZy17mw1ce2tWKeA4FHDSVk/vQ7XhQK9KKkRz/PwXKT1LZv0++yD
	 F8BWNiGsKt2QXiKrldxLtSl/XlZ2df5mPtJbJTJN03q/TEY9sJuG2ySRv7zNQsc5Bb
	 liVdSzycMX0VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F9B6083A;
	Tue, 13 Oct 2026 17:56:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B3C362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3698A402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynLbrqiSXorn for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3C33B4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914200;
 b=a0H178C+Zqo6V3r/0Zly6z9MusUWl8LA7JxT8CepT7MHyraftAeftu/4fyqeSUJaPkxV
 eT33TN+PJobi+SJ4el1a9l2/SBECVd/ZiStKzxt0O8W8cehHg4Ds0Ei3QkpzUJBPHs7vF
 YMdZJeTTZbe891FD5mxqcydX3TEUvHEZp/SWEkcPS6G4jVBAGFq3Qoq0nskvzP4zzy+HE
 0ewv1t7hYdz8kX+xkTDhRpuNfyxJOJQjOcaIeys4H4E2P1jOP+CDa9ZbFz2H3EirASsnn
 Zv6jmxEFjEFohgupIvJNhB+58b9xYv7XKHvP6/PDWicFOrifmK3N+YtwkRmGilYrOvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914200;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=zx+rSFmJwJ1gtCDaW4ZBInyZBCOzUMdtVWRIyIjJ1xo=;
 b=NnDytB+/SgKWqWwSRX0m5ZK8TQFLK9YRyM7j1OXjx3ZMhGdjqm6lFzCav3tJU1ldJHlh
 mkwWOklL8V9s3Db0MQCXKUuH/TZhzbguWx5MzSqYl9xOt6MeWK/gnXbwVPfvcw9VRUZz5
 G2k0wUHJs+ZwXW+RWQ3Ag8EGb/ThgSM5SqdBb/iGMrGeQJfBLAE1X1EhJMdlFCjBxtax0
 DVDihxV1EdjJw1mvSVSXA+Uu/nMiLMyak+uxAXTjkzMWN0I1Zm0TlarSs+buSRBJyxiyI
 UNWkDze6X+Xn+bUFetdBfE/rh16dt8uRmolXvs7l7eC4FyL3THRaOTLL+eBgoctyTsQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=d+WD9VRV; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C33B4002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 54FDAC653FA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:57:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA4996075C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:37 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 02E0E11D718D0; Tue, 13 Oct 2026 19:50:32 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:05:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asn_oo9FWkl6JN8V@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-38-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-38-bernd@kuhls.net>
X-TUID: 494QO6LQZHnD
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 02E0E11D718D0
X-Spamd-Result: default: False [-1.76 / 30.00]; BAYES_HAM(-3.16)[93.29%];
 DATE_IN_PAST(1.00)[80]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[bootlin.com:url,buildroot.net:url,kuhls.net:email,localhost:rdns,localhost:helo];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v8 37/84] package/luvi: fix build without c++
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

On Tue, Oct 06, 2026 at 06:20:18PM +0200, Bernd Kuhls wrote:
> Buildroot commit 00317f0aff243986983650671fd220ab040af50f bumped the
> package to 2.15.0 which first included upstream commit
> https://github.com/luvit/luvi/commit/262d5f7dff3484285cd8b3bf2ed32ff0f13c8741
> that added the miniz submodule.
> 
> The version of miniz used by luvi contains commit
> https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
> which removed "C" from the project variable causing a dependency to c++
> which causes build errors when the toolchain does not support c++:
> 
> -- Check for working CXX compiler: /bin/false - broken
> 
> This dependency was not intended so we add an upstream commit to fix the
> problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/2a5/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

The patch wasn't applying (I think you didn't backport it to the
version of miniz that was in luvi as of v2.15.0), so I had to fix it
up. Applied with this fixed up.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
