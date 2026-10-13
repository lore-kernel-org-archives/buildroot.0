Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB39CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 14:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F20F2404FF;
	Tue, 13 Oct 2026 14:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDegrLeIaUG8; Tue, 13 Oct 2026 14:19:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED1F7403BD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791901167;
	b=dGH5DrcRZ3l68NE0UE/pDU55LVHi48Fiw5RKLaB1toHB6vGW6YH33TC8Bff+RF17f+nl
	 WGg3nqV4NwqTsIM1r3g6DwZb7Icy4gMwmzIkjyM0CwbFf+DDmi1iyQmRGpiCQ81UYAgEd
	 NnEruxPYzuSwZb/K7CqaGTX3dNhut4Lnj71gRehnuUXHjK4uW6jOJDIPw024DEp0wLpdM
	 2+aMvf+sDXMDD5p7HP4rxZPeok35xVYskiL1elVRxY/aLrwFGG/Dt4DmpDshvbcD35oPY
	 yodU6pMNhwj0m8VRRqbTQiDtmJ33HijqRZTu5t3KTVle94qbnw4OMe/bM1ahUL1bqWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791901167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cxI9UzEF/RDGW+eNT8nCmOJ3bgHyQO9C54ycuJXngIc=;
	b=PkwFGuaWRMVilWGeoov3x6qEvbidy6kpZk223FiYbi59tKF2kV+xrBSpDHuWNvpX3GHf
	 UvFLU0IVOIMEj9FXKJGO0gi9KmF5VlP9D6nmXxohvFaYrwx/A7Z98o6ilhxDYuJJVm682
	 j/NOVgwGTCLWhoKk9IfwU8g7QgmLMmeNS9dWhT4xi/OTUkvoxzOdC+j08KXvL+Z9RWv7y
	 ClE/k2UgIsI/BKlkGstUWpFxDJqN6tOt1nJB+93OYE2io8NGXgzMcjAbJlhmKNEz4F7RZ
	 AYK3XVJSSxNYj0ooohMAZf/Iisa/x7n0me3SNQlspmW+sB4zSymKpt3T+/BB01sARtw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791901167;
	bh=cxI9UzEF/RDGW+eNT8nCmOJ3bgHyQO9C54ycuJXngIc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mf3wiony4eHR2nfE54a0pDIbXpu/ZnW+sIiD59nBfsN+JfDvdFoVKwE2NZN74oOW0
	 clhbTKd5vuPM84eWnfq4ZR6VUSDfF0S6yNfwip+wATzQUXC7oJ99FiIaANQElF7B7W
	 GJMjQ73JYph+mzXz78albGifKqd7rm1HMENgJdmcnCpPBR6mOV93Cd4+Nhhw1qoBJZ
	 GF2YmcI+bqVQ8NW9dvfGFddzjQmsHtGwqKG7SFasKBmPp/0otPuPqKv8wtQ1STMsMJ
	 7yOY5knP4TihAIq9AFUNBF0cDIET9n1xgD42kukceYz/fxsXWXYtmABoJ4c+pSja8s
	 yvdc6A39p0OgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED1F7403BD;
	Tue, 13 Oct 2026 14:19:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73A17235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 599218096F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-K-nfdj4Een for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 14:19:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4968480880
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791901164;
 b=KyzSPVb7Ifj+VdZRWHPdFcDcHXs5UQ2zYqQ5EVYuHQTXN4BPGcpfC44iTg0G+qSYTS3v
 3i8jEsZ+euF4kE/55Krm99jy5vIZ9DyAoBrLCSeNo19D0FbnH5VWL6U2wLPs3IDGhWrQh
 tds2dgfwdxyqGvztrZ918DuFPBbAxe7Smvkid/pCGT8bpCoeC6sq0XXhoriLZIEqzF9gZ
 0YxnaORYn23JfxBSwBS9f3rgIl6b9ouwPPmrQbgs37Hu8pHBVQxfKVIUNe2OKF57aDy5/
 Qd6G0ghbZrXqX2JZjtFhqPYeDAaOi85DZLEVp3YNT+BTDFG9vNMoA3z31GpzPfhQ03g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791901164;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=f9B2PkUyi/IqJ7dBafU2XSAnwa97l0We8YP+a4aM+Y4=;
 b=Y7Q1nWoh+baUwgobdMsm7DVUVwNfmgrBRfwTi0Jc5segP6vKeoWp2oiwDTNRkEZmqM7Q
 PBhZ+96M5vod/Okq3iUHJwBtiOoasMHMpSpnme6AxhHdXDHV8TVEo/DZsOnKMm+r9dL3A
 /NtrkhMOyGOtSVZAm1Jjx2KwCcoEmQuyXF7N13VMOjZWFbqICLr9zqOkiFv8ms29uFANk
 WwMMsK+UZ92uoYsQQzRw+GGl8+D1yB1gVAqwbFNHVfeCeKef2LCpDpx0I/NQ9K7Z5WEsC
 DSfAP62cFEp8/Q7Nu1peSEeAl8s8WLWg6z1vGokukIjrWDB/P5DEDhcX2sqA5UbNZug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=F6zprwpY; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4968480880
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:19:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D0F7BC653EF;
 Tue, 13 Oct 2026 14:20:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40BEF60362;
 Tue, 13 Oct 2026 14:19:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B806111D716BA; 
 Tue, 13 Oct 2026 16:19:19 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:19:19 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Will Newton <will.newton@gmail.com>
Message-ID: <as49hKBimzOid79a@windsurf>
References: <20260901114951.2675876-1-yegorslists@googlemail.com>
 <aq2VV4mwPo83xmnL@windsurf>
 <CAGm1_ks6eJr4qpwgEUVOnXejar6okr+QyWxqEbB98Wrc0GSkgw@mail.gmail.com>
 <CAGm1_ktftT0eCbujWXYwky+_u18eSbyxDFWoMgrL9r7fw-rKkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_ktftT0eCbujWXYwky+_u18eSbyxDFWoMgrL9r7fw-rKkA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libmicrohttpd: ignore
 CVE-2025-59777 and CVE-2025-62689
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

On Thu, Oct 08, 2026 at 04:01:30PM +0200, Yegor Yefremov wrote:

> > I filed a request a week ago. Till now no answer :-(
> 
> I got the answer. Both CVEs are no longer valid for the current
> version. The patch can be dismissed.

Thanks a lot!

In the future: it is fine for me if you send <pkg>_IGNORE_CVES entries
as long as an e-mail to fix the NVD database is also sent. It's a bit
like having the patch locally and upstreaming the fix. Once the fix is
upstreamed (NVD database is fixed), the <pkg>_IGNORE_CVES entry can be
dropped. And if we forget to drop it, the CVE checker tool in
Buildroot is supposed to tell us: "you have a <pkg>_IGNORE_CVES entry
for CVE-YYYY-ABCABC but this CVE isn't affecting the version of the
package in Buildroot", which is a hint that the entry is stale.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
