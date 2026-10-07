Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2DECA5FFF
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 06:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1450880EB7;
	Wed,  7 Oct 2026 06:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gWIzMhXT6ms; Wed,  7 Oct 2026 06:05:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5C21380EB8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791353116;
	b=daGNEO+u2I/9W0kshLPMacwjWmJBOwvyDZhktr6F+eJD06y48KWuUKLXmRkHz/D0E/pQ
	 +e38pNfXNtLtqzWrG7oSfSKwE21BCpAeCiC2eeLEEbAUS19OtonQvwBbmO5167ZJC4ERr
	 JlSbHTGJsvTMG1V4Bxa9PhsMCumYhGALTVIJVU520SipM0kQatd0R+S1E1UIEjBlwmSSt
	 blYLEP7LpwC7teF37L8uQ5AboAZcp6KNpoemiIju4zj6IRVkqRdz5sy8PYqG0cVG/mBAO
	 0hv4Pu7zSGlil+jjDrois91Xe0KQM8FOe1axQASXSyblcXHejajSGkFdC+JKppANOGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791353116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6hLkn4KMqX3gRAVXROR17qAcduoJxhLb+PSCEjw4dxg=;
	b=NEUthr0/KzCaOskX+SXHWZjY9YTRwH6FI2+Cv3Y0rWedD+nodYZY4zQeQ14qrRza8P1y
	 WYqBS0rLwU8/n5k362+HNZztmyUOnXDmix+6y1R7dSHHU38RumzaCh9NuIXvT/Yr+Aa8B
	 eHVxk4px/xQd0ZaX4GBj+eKqY2PNBf6mSGMUTAZDsLPegMB/isX7VY1FpSQrt5cuotIv8
	 TQbUptyNVBcte1v9jy0k3HkQPa17F30Z7kcMyJM+FVDAup7hHfmfgaxvwBQxWo0fv/vs8
	 YHGP3T8MsuagOckRRea4/ErQ4b+P6LAFKssScsjtchkAfb1lQrNlvBM6DiX8EvUiPiA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=RTBbvgGh;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791353116;
	bh=6hLkn4KMqX3gRAVXROR17qAcduoJxhLb+PSCEjw4dxg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lEDgAjf9mdJgyhq9ia1/vB8yWZDuVTI37PVmoEndbwKK/HfnC8/KGSvbpPos+0cAw
	 TrFDjDnIeZLzWt1dHd63EhAQFeOA8N5Ijzx0O699tA05+B7CBsmaOIsJJGBm1UEgYl
	 cdH1gQRSFoTvh9vhf2ZvhYP2lVYDW4KLmqAEDUp2QvlaNj6CujmKAwr2G1b8hfYLoY
	 fVcNjKH6LOwBmJwVfAYi55m12LwYa6/BMA70fBCzaDR0quRN0ph9QUqMg1AVQFJLCu
	 IqaUbJzl+8bGNmJG9c9MMB3gO31vT8J0Mj1IKkrvL6EJ+zJaiYIN91D9j8njGpM56T
	 DbWFg1EVZBRlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C21380EB8;
	Wed,  7 Oct 2026 06:05:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C29D532F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8990809CF
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGzhfVWdba8b for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 05:47:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5C5D380698
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791352034;
 b=rXZ8v/LnzV5B5Q1cchpycHVL3mN+hyidxwgfg8xJrElvwkqD2rmrq9NhP67qMSDgg33a
 Hc6z7NAcDUjUv0I2dWDPKTAAW/IjTz0dnEr58QKwbT3M5MBcteju6BHIzq/1quhmEBUVZ
 9JMFW3ouBOCSQFJlk1GnbABmbBI5lCMb9w2aSYlneyh5oiKsGNyHFuZ8EKam9AM/z7o7u
 UNAGe2nJMWopojg4jL4hA4+SY2puQEEnnV11YVotKnx5mhugnlTsaeHCnquCWPPVucDeA
 R4gqcLpRmIqanscsq+Vyf7WcKEKC6Z5QBfilWFdGkpVXXvmnP1JVSZ6DVENdg06PYTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791352034;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=+jrqIm0MVaaBkV0BnTKkpvc14oYlKFsj9vDn/n8URWU=;
 b=FyD624J2hByIQc+qMR2K13Lk29MzvPfxvIDbWv8V8J8pQuL2t5RXUX9sqkLw1jrjkv34
 WGADmCPO0nljlsSFADRWKv2tEX2QjoSn2OpwyTLwxW5Z+5tfkC47DAl23DlGCmyEzMFOD
 qeIi9B+dxt7qLuzw8JUYayzHVtvQU6SYQ9NVZFwi6rNHDFyHUc3WKq2nsJIw31KMKmCBi
 /CGYktWPmjfYRIttOZJXfCuIAkM63us/dzJXoYNcQpkdtEdcFScYzkzVuhoR6xKHP9bvl
 g5ISpN013MUqfZPrPgcTPundm0yZm1tphXmGxLIPCZIBh5J/2ASW28+ksoBAWjasHMQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=RTBbvgGh; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=RTBbvgGh
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C5D380698
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 05:47:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=RTBbvgGhKEVop5bJRnq2Qif0me/pmaAYCOyDvGh8F0PhZAlaSUuf/wJmObSLnfB0bELKqkVnSYQdfrnCShlAMEvE992G4fNQCfCZ1lJQCwz0dBe20jUiMmz13pmxeI2fhgIHQXzxzA2R/De/TO17g/WMQKB4shf0+G+Je6fH5/jk6xcJRkeG7m38MqV0oLtAHr7TND/kvy+FVFyk+HEXcVHNrRocImEXu0Jui7zF5uY7x6mY5mMxkTDFVjKvLSVx9HAB6cxN4H1atjyjwJgylwHoPNNJOokbiBVzLFOoDYt0HyJ11xIdUuYvHhB7Gby25H6jguOBjC0W6AqSTkNN0A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=FhqC+7QgkMNkQD6xQtUeLOuYIfM9UC+jvF7dkFkKvic=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1782818382; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 05:47:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEKUW-0000000F5mN-3tsg;
 Wed, 07 Oct 2026 07:47:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jesse Talavera <jesse@jesse.tg>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20261006203951.501419-1-jesse@jesse.tg> (Jesse Talavera's
 message of "Tue, 6 Oct 2026 16:39:51 -0400")
References: <20261006203951.501419-1-jesse.ref@jesse.tg>
 <20261006203951.501419-1-jesse@jesse.tg>
Date: Wed, 07 Oct 2026 07:47:00 +0200
Message-ID: <87bj96t63v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: enable systemd support
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

>>>>> "Jesse" == Jesse Talavera <jesse@jesse.tg> writes:

 > `--systemd-install-services` just installs samba's unit files,
 > whereas `--with-systemd` enables samba's own systemd integration,
 > used to send status updates to systemd.
 > I needed this because an app I'm writing needs to know
 > when samba is ready to start serving files.

 > Signed-off-by: Jesse Talavera <jesse@jesse.tg>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
