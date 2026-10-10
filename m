Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164B7CA9EC7
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AA6810BA;
	Sat, 10 Oct 2026 17:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9eXNJTK43S3; Sat, 10 Oct 2026 17:49:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC4C681065
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791654551;
	b=ZWhsnB6w0lNS8xSgJxXG0dpGOpnwTTPNlJ03Q5BX9Tdi6HZ6pVHxViHh3cYwJQIETK4Y
	 ZfnhT2t/SV+i3AJUWshmQUXOQyGzjHfRtsUgCM76uM3Xgnv+dymq3bOY0xCleclL+3uNe
	 rfXeY6TQweLFYi7VI54M6OaimV9afutqA+ysoZcSCBSG1eKFK7QNcVC+lEqljaBDIeqVy
	 9DbIMrd57od8yoZBmd4zMpJDIQjhEVGDTcC3zJC/cWB+Sj6Zw0e81MD5nmjX6bk1Qd0eJ
	 tz+LlHmfVLeG118mE5WOL4EP7x2W8sg9nyt045ZDhuqZOGGwVeZdTI3ojSBvxMlc4Iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791654551;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nTa8dOmU222zJ3jFFk9k/yKq18ei23mtHPa4ZWI7w1A=;
	b=lSyLpzOC4dHnC4riNMidaxMszPP9NbqOOAVKbrPOZb8nm78BXE4XboqRgBkrgofxqDlh
	 q57REfbLgW5gSZtVOkPb2lPVo9hJ9WBtOF4cJzYIyYd0VPN0dO27/G5FfXmRP2cieCaTx
	 zHJ/VD73yfkytdfTJLAveTETHS5LovdEbbDLTD63QZg4YXDA2I1ztx0mHunEONBjIqYyZ
	 vdNWCO+bCr4glMBxnNLzg/4MYakDSwXLDECckEJb9D41WuOlIgP9OZtagIutRaa274u3b
	 wxbAy0H1B2cl0vg1v29tG9mJL43Y/Gv6Oursm3WG6+20rMrWv6L0XxZOELq4OHZOTPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791654551;
	bh=nTa8dOmU222zJ3jFFk9k/yKq18ei23mtHPa4ZWI7w1A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PrxjSFF2UQB/yr7jo1GlPYJ6W3zW7unDlXbQqruwHC0kSCbTSOUbIhaKvCmYJ6lZj
	 sf7r40O5Uvg+wCO0my4LRTT6gUCtiFU/dlWy++G+zd0L9MuFM9en3BVhjEL+zBvlpN
	 d4mzQIQFsxL7zE/p15WT69m9m50pwCp6qZ/OcmhUdQ3RhuygoMSmNckV/a/pnqDNkl
	 wCr6/96z+/HrLiC41l20zFOb0zjmyrWOvFi9VxmT4SVS2M5m0FVxSOYFuUlqP2+5O5
	 pMfpw51UFo+MwoJUS4WKRrDifhm6jnnUCVoaymqYoxR4NqWgzJySGC/ghBE959Cx2u
	 GRYVoBCro0AYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4C681065;
	Sat, 10 Oct 2026 17:49:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 891BB105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F11280FFD
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNkI0EIYb0qH for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:49:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 234C281065
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791654549;
 b=jiZoBhSS8sofNF25+6vM2C1j0lsfZhEAqSMzJ6QfAPGdbsHABzkG2Y/TXtf452K49pT2
 6Osb5E2ikyFUfdMNQ5rgCqoRi6v9svv+EzHPfgIwpaD8seIfldD2QFwYzM13pvNZ2Sivh
 ogMo28hY1lRwAkGWhTU60EE/7JkHkf+sj6iegULszN4sFzRbiLvEe/YpAQAF6E0OPt0dM
 irdfT9LZVLdjzVvbG+oZxiUXh+tGyBoByW64Hdi/GXptzuLL0DnPz33WeLdrvHDGNajRH
 JGrQEuZq8JVb5mK/NwH8oDeeUpIRc3DakD/pAUdx1bqRQKd7wJipG0RQm8S1zuJCk0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791654549;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ZQ2cq6W2i/O42ULbdxEQVYA6GCaJ46Y01jKpPW1CWp4=;
 b=qkmAP/XbLbhtVc0L7jeOprf4uNKMYuSGboQ2IGQCPs9EjMA6Qt0ZVcMTZCtsyIMhFhvB
 EFioHID/XqYo15L3wXq43a1KLLSPYZIUPzVurm7gtnABF94dtmYy1eU9Rfqx6F2JvygNK
 kae1JFhIviNNfI8NlwgrKQmDouHi4QAvedQks9zwLwMYZb1NgRZON7Je+6DCYQn+MWVXC
 RhtOEitE95AMXZdMC3WIniqNAq1PIfOGPTBOp1CuiYuEipr0/Se9mrwkga1UJV+eMQMRB
 kPm7/432+vpruvfjOMgpsFcOfEpIcgrIV/GtQs3TneWsvYZ8csQGbPPgetz78zm+5Tg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="oZjC/fYT"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 234C281065
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:49:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5B0D24E411CC;
 Sat, 10 Oct 2026 17:49:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8DACA6075C;
 Sat, 10 Oct 2026 17:49:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9536011D701FC; 
 Sat, 10 Oct 2026 19:49:02 +0200 (CEST)
Date: Sat, 10 Oct 2026 19:49:01 +0200
To: dowan gullient <dowan.gullient@smile.fr>
Cc: chakrabortyshubham66@gmail.com, buildroot@buildroot.org, 
 Joseph Kogut <joseph.kogut@gmail.com>
Message-ID: <asp5ttIPoT_UiyNg@windsurf>
References: <20260430121520.2565804-1-chakrabortyshubham66@gmail.com>
 <f3d370e6-5cb6-4f54-99ac-883afa561379@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3d370e6-5cb6-4f54-99ac-883afa561379@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/bash: bump to version 5.3
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

Hello,

[Adding Joseph in Cc.]

On Fri, Jun 26, 2026 at 04:11:37PM +0200, dowan gullient via buildroot wrote:

> > +Upstream: N/A
> I think that marking these patches as "Upstream: N/A" might not be the best.
> Since these patches fix legitimate build failures in the Bash source code,
> they are relevant to the upstream maintainers. It might be better to also
> submit them to the bug-bash mailing list and provide a link to the archive,
> similar to what was done for patch 0002.

Clearly, patches against bash must be submitted upstream. We cannot
accept those patches with "Upstream: N/A".

Also, not sure why we need all those patches, if Yocto has a lot less:
https://layers.openembedded.org/layerindex/recipe/81/.

Could you rework this?

Also, Joseph was working on this version bump. Any progress, or
perhaps coordination effort?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
