Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1197CC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B948E403F8;
	Wed, 16 Sep 2026 21:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtVJJO0WQTIJ; Wed, 16 Sep 2026 21:37:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C11E1403E8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594654;
	b=rpuq+bN8fLTaZHLTiLbr7v7N6iaM/IqRrSCswYR+3gZiJdqZVLh/6ls4Om/+DPhmT/E/
	 x6Bf7GbYI4RWcYVmU25DyfvA9HDNUEHZ0IzqNTiEFuS1Z0O2QCxNVNEgNmIVXRC6PZeFx
	 TZssEpEDmDNebGz1inMuNM2k3oi3LVSXRsUC01EzyW6xvwG2jw3KW8comevbjiu3HStbK
	 ZZIcDtHnLVU1CzNmBFXQo8goyjCJfsl6hUvCANHet23EE6QcNEgDjXbbAgfcPM88X/ZF9
	 Y03x0ULx5uDHwhoIG1msCpPbfJcxtUFxELjL7xjqt0svWDwRLtoi9dOFirzv8MbuH+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gsEpqD5hi5L5ejEdr/xuWlMBbdzrhtRJ+Ie/ABk2fQ4=;
	b=tDG/t6+pZeNo+poZtCvYSTiOKrC83dUuJXxaeC6xg6Nn5fpaIDBPDjJrMQ6vg1NaDULI
	 ZF9JGlaLMjahZOPTUS4xH3rXr38OLAMnBfa3N9duI4KjHIA/ne41DDpsr9IazZCWWE1mX
	 qJXdpYyvcSIyUqFQ9+DYOZxtWe2sKL0CrxXJZ+/otdyfV0EnDRcbrcr2PNIm3leDHuOri
	 HkO4oGfn2Ajv5atj/jKyLCtaud3pKQ+3Q++tOkcfAF5ek3GRaKhl2TZPzq5xpbQfrAK+S
	 eG9eprjPCngyAqX5hbQq21dQ7GkBEcwKxnDp/DbnDAxKbp3GHrdH/czh7EIxz975jxA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594654;
	bh=gsEpqD5hi5L5ejEdr/xuWlMBbdzrhtRJ+Ie/ABk2fQ4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Kh9N53xFnEQ30eoZUXHpIPZRRGX0EQ9/chSLednLei5bkfx9wb0yGVOaMgP2Ox03H
	 Wn50MYmz7Flnx9imJECXImiiDk099bG7EYWD11lbHB7ulTlyjuOEpRWOCaRJaXKRMe
	 ADG0qRs3STPKoW8HXSSbUgjiVatE5wRA58Io3gvOVAokvWvFRPCwcP+UkFhlvp2Kyb
	 7XYZMn2ppwGx4svl4sRxlts2OqkGx9eKWUSD+QaAOlZBd+hWE8W2AJwaLo7xWKQYCv
	 m5bN+He5FwsinBy5seDYo442GltlMTU18hyiBzgkwtXNTVBmUS6sWV5xNDg/x5sY4q
	 cUdvjKH3X//Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11E1403E8;
	Wed, 16 Sep 2026 21:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6707A24D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58B0B403E8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxthCmEzYUm2 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 70AB7403E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594652;
 b=FcN7uiX4FPe8wxzy/0aku6ZTTSXMt5JBjYUHvoIl07N9FLiwYSR3BxJ9b7k67BVuPqvJ
 p4yenYX/muVnWk9HD1AdrKr1apDd0AFqGaGW5mSJECRxySw4CWtmlYs81KZvSk6psZwlf
 0LEnnNmykQqESUTP39bCrvvvGcJFHCOPAoAsMzr1J3nI8XUM6xI74+5Mx+BrOkj6Q+irM
 EzPGadBr0JP4RvvlnLsL8Pa/t48D6Y9TZxNWGC2Cd0woyCeswl5s4lVodhjUe1R6FkgSQ
 LgXcg5x8cQ6BprkwigHeSdIPBIv/seUUg1e/qeslyGZiWuAZcHnTlBECwMS36MylZvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594652;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=PmXmY69mhKxU/v8WIpAWqkSa/1j4rX1CqaY7wxShvs0=;
 b=O8wagh/NVlkXrhGf6mtOLM+Rp9m+QIbGQ1sZP29TukdS+hDv13S+tWe3pEYBGmsxAqvh
 e3yxwP31S8uDNYM8zglEs/6lU3fN/RW2nrA5xPp7Anqh0Io1oSC5K7gLpnbgnbPLJYymj
 6rslPk6iEvXGhqF2LJ2sE6AWtfRmymBCCK0jT27FeRrBgl8Mn4KXpW8sdPoP6V5RbrS7v
 8rI8O/zEZKSpXQH8wnLaL1IQxXHIdoUfHdjqw0Q5sAg+/niDuSnyIAm3XHILw+7QLGWVG
 FZu6mh8jVoXsIiDtgVw4cl9SUvWoR3lXvTzrmBYn6Bdbid8Bfnb432rg62ABQy9l2GA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="E5ckDL1/"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70AB7403E1
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:37:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4621DC5CD6B;
 Wed, 16 Sep 2026 21:38:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0E09860337;
 Wed, 16 Sep 2026 21:37:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F50511C79AB4; 
 Wed, 16 Sep 2026 23:37:23 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:37:23 +0200
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <aqsLoHzcU6UWyYGg@windsurf>
References: <20260820105705.1502630-1-raphael.melotte@mind.be>
 <20260820105705.1502630-2-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260820105705.1502630-2-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/gumbo-parser: update hash
 following Codeberg changes
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
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, arnout@rnout.be,
 romain.naour@smile.fr, Fiona Klute <fiona.klute@gmx.de>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Adding a number of other Buildroot maintainers in Cc.

On Thu, Aug 20, 2026 at 12:57:00PM +0200, Rapha=EBl M=E9lotte via buildroot=
 wrote:
> Codeberg has changed the way it generate hashes for at least some of
> the generated tarballs (see [1]).
> =

> Since it only affects a small number of packages for us (3 on master)
> and the upstream discussion seems to consider it a "one time change",
> just update the hash to match the new one.
> =

> [1]: https://codeberg.org/Codeberg/Community/issues/2861
> =

> Signed-off-by: Rapha=EBl M=E9lotte <raphael.melotte@mind.be>
> ---
>  package/gumbo-parser/gumbo-parser.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parse=
r/gumbo-parser.hash
> index b8809d4db9..8e0dd91629 100644
> --- a/package/gumbo-parser/gumbo-parser.hash
> +++ b/package/gumbo-parser/gumbo-parser.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  dbdc159dc8e5c6f3f254e50bce689dd9e439064ff06c165d5653410a5714ab66=
  0.13.2.tar.gz
> +sha256  90bea83283760339da194fb90112a532854c13cd1eabdabc7ef7a4dede1dbc9d=
  0.13.2.tar.gz

Unfortunately I don't think we can do that. sources.buildroot.net has
most likely cached the previous version of the tarball.

Has this package published a new release so that we can do the bump +
hash chance at the same time?

Otherwise, is there a trick we could use to generate a different
filename?

Same applies to PATCH 3/3 in your series.

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
