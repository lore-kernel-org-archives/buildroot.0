Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE6D10AB81D
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 20:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ABC360623;
	Thu, 26 Mar 2026 20:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UWZRL9T42p5; Thu, 26 Mar 2026 20:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC7096067B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774556687;
	bh=Znhser9ZhhnltP0A3h2N0YiB7dmPjgf57e0Vu61Wgf4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H3p6V7Pu5O96LTPN7HLHFkCAISA+tJNngE+yN/4p13RTOozt1wGfyn8YLK/P/3xI7
	 15mehnApk0tMetSD2iJhnWBgCFlTOAWOsJBB8kCVRGf8rrGdSg0z54u66OzLjYgkEY
	 tLKzG8hha7ssmtkQAriaTN6SWLiFUaKB63TXkOoBuKok/OqdkN8GHbGrW0Rrny+irI
	 OrW6mZN3W71aH9EUdBtAWjFmyQqow0PvR355BE9H9BVfI3amhphsOiMZQztTpRTkz6
	 0JzJs/1u5ib6OakgvOVJmquNAKL3HUUrGPWk5n5HdpOA97gXLlkupbNuKQTVgjAdov
	 b80ieWR+WGaKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7096067B;
	Thu, 26 Mar 2026 20:24:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 000871D3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE5DE40663
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuZSm3Izg8cZ for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 20:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 883D040078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 883D040078
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 883D040078
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:24:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9FA9F13F8A7;
 Thu, 26 Mar 2026 21:24:35 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Mar 2026 21:24:30 +0100
MIME-Version: 1.0
Date: Thu, 26 Mar 2026 21:24:30 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale
 <thomas.perale@mind.be>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <87838493-8642-449a-ad67-052cd05db7e1@gmx.de>
References: <20260326081422.945900-1-titouan.christophe@mind.be>
 <20260326081422.945900-3-titouan.christophe@mind.be>
 <87838493-8642-449a-ad67-052cd05db7e1@gmx.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <6f898e3848b9bee8faa9832ce3250b8b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774556682;
 bh=jsPhxdrrUJ4sFzIaaQCUip6kGfNprJyOfljCGrZHJZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VWM7DgqMBb2qPRgad2GQyyySTwKHVqqcFXtX+C4n80gaETIsnp/Wq68YaeXVtPvDq
 TW1pibNov1N7cJV8Nxty27aSSypzB+7f/5ebhzcGsPsBpbv8ET3XwzGAbi/8bnfVyJ
 PB0pivc6IehvjMppHfiYGkqy26W/xqzMyxEdHMEnl5x/wevUx5V+/MibXVwN4Rd8+T
 xenCnkRuGXm8r2Ne0csa3QnuJ08UyORb2pPezPvFg3sWk2e+shXkSLkcXo0OA1RFyf
 XJvGdajdl3sW7XxaobzEhY30UwouoTOtwOKl0gtPsSwhamBpAnIoubQ+4NqZZeK0d8
 wMBBtK7Y4uhZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VWM7DgqM
Subject: Re: [Buildroot] [PATCH v2 2/2] SECURITY.md: add new file
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona, Titouan, All,

On 26/03/2026 10:38, Fiona Klute via buildroot wrote:
> Hi Titouan!
> 
> Am 26.03.26 um 10:14 schrieb Titouan Christophe via buildroot:
>> This is an in-tree description of Buildroot's security policies
>> 
>> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
>> ---
>> Changes v1->v2:
>> - Add references to the Buildroot User Manual for vulnerability 
>> tracking
>> - Add links to autobuilder pkg-stats and Buildroot security website
>> - Link to CPE info for Buildroot
>> - Explicitely say that security@buildroot.org is a private ML
>> ---
>>   SECURITY.md | 36 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 SECURITY.md
>> 
>> diff --git a/SECURITY.md b/SECURITY.md
>> new file mode 100644
>> index 0000000000..6b21ffd2b9
>> --- /dev/null
>> +++ b/SECURITY.md
>> @@ -0,0 +1,36 @@
>> +# Security Policy
>> +
>> +## Security advisories
>> +
>> +Advisories for Buildroot security vulnerabilities are reported on the
>> +developer's mailing list. A public archive can be consulted on
>> +https://lists.buildroot.org/mailman/listinfo/buildroot
>> +
>> +Buildroot itself has a CPE to track its published vulnerabilities:
>> +https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=buildroot
>> +
>> +The Buildroot project provides some ways for its users to track known
>> +vulnerabilites in the packages included in the generated images, see:
>> +- https://nightly.buildroot.org/manual.html#_details_about_packages
>> +
>> +In addition, detailed informations for all packages integrated with 
>> Buildroot
>> +are updated daily on the following public web pages:
>> +- https://security.buildroot.org/
>> +- https://autobuild.buildroot.org/stats/
>> +
>> +## Reporting a Vulnerability
>> +
>> +To report a security vulnerability found in the Buildroot build 
>> system itself,
>> +please send an email to 
>> [security@buildroot.org](mailto:security@buildroot.org).
>> +
>> +This is a private mailing list contacting the Buildroot maintainers 
>> only.
>> +
>> +## Vulnerabilities in packages
>> +
>> +Buildroot is a build system that cross-compiles packages from 
>> third-party
>> +sources. The Buildroot developers are not responsible for security
>> +vulnerabilities in these packages. Such vulnerabilities should be 
>> reported
>> +directly to the upstream project that maintains the affected package.
>> +
>> +When vulnerabilities are fixed upstream, send a patch to update the 
>> affected
>> +packages in Buildroot.
> 
> I'm not sure what the ideal phrasing is, but I think it is important to 
> be clear here that bugfix patches (especially but not exclusively 
> security ones) may be merged independently of upstream releases, though 
> they should be sent upstream first. People following this ML probably 
> know that, but for someone new it may be an important hint.

While I agree with your comment, I still applied this patch as is.

I think this SECURITY.md file (which is here for "administrative" 
reasons) should remain
as short as possible, and all those security/bugfix patches details 
should preferably go
in the manual:
https://nightly.buildroot.org/manual.html#_contributing_to_buildroot
https://nightly.buildroot.org/manual.html#RELENG

Those sections needs few refreshes, to include the new LTS model, and 
the details to
manage those patches to help LTS maintainers. When those sections will 
be up to date,
we will simply add a link here pointing to those sections.

> Best regards,
> Fiona

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
