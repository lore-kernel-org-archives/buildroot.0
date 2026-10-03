Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63276CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34DB140EDF;
	Sat,  3 Oct 2026 18:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqGOp1w7xMPz; Sat,  3 Oct 2026 18:41:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 436F940EE6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791052861;
	b=Xrpl9YNVKCu7IGhAaiFi/MRt7e1q7NrXZ9/JIRtKOZTff/0U+MeFwtBDBwveDVus2pQM
	 aFjdpIsxmkYCf/ihnksV9cADydq6487TyqP+PP/lrpKSjkEu4oiEfY635P+trSnbmZxex
	 NT+U8Xx7F5nI1zP80VaBqdxMrFUq0pF5ouGkmAHOJe5k+gOeYUAUJVekpif6FxMPxxqKG
	 GfESbG7xt2RB+8bfxrjgaQmJpgZlfvcag1LnPIB82bFhGsiCjnOB25zXCnlVG47EPSAVI
	 GjbhjIiGfQH0wj+z26k6X29UsQRzWz/GjsTv39rTiY5V3C8T7cwZgDsPq03WWCVhvxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791052861;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:Cc:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fg4/csoFkKo/MknavEV7QChATXr6tREL1WCIrzt1x8g=;
	b=hYpcqod9n98BeC9LyC4t12Diyt9Q5Rt1RYchrO/EU/UdbOKx54FBh6+InmIGWJYlsMzt
	 wTbE+IxIdi1pi81lmi+sQckX/9vDNLAGuzA5qTR+utK8nWavryg5wi7a3+2HUYe2P2Nio
	 mbQO4XXVRHCSzbJzA915mNWrm/m+Rxv+5phffADj5a6CI1RLYmptLQneiSzYqo78G0Xac
	 SdWpBCFiXtr0TasJcSHrOR4KsX9rZf9ryAsxkMLHVP51ufHLD8ZSBdeVk10XtdvR58k9z
	 NGzzLJCL0k1SLpS2jWz2M6ST+R6emVTfpbYFxrKdJAoC4n1RtJYFQQcua1RrSWwGH+w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791052861;
	bh=fg4/csoFkKo/MknavEV7QChATXr6tREL1WCIrzt1x8g=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HJ3+5dIdsPOwYKsqvv4IpkCsgL96ChgilSoYbuMk5Hx01Zk+T477PYqakH1BMjGsk
	 mgZr37mROOpreohT6lPBlPlOGNWb6lj9TY28/FLVwkR5kHbMnCQSd1zgefnDfZ0ZEn
	 01Sx8oVTMncJjlOZqj7Msmggn59uQa3YuHl8iqPk0tUj5zc+jiwUQgDUBjNhAHCY1H
	 nKI8rZTbf50i+AHnCZa6dTZ3nRJmTjNMEu50M5CeeFtbsqXzmLTaI/N1D7Bw31W44V
	 VB+PAg9EtIcyMEj3z9FA/YrR+SdDMyZDuxoyPTx+BfEHJbFUS7sW2LMvBMnYH4AFzn
	 p6Dt+H1pFuWmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 436F940EE6;
	Sat,  3 Oct 2026 18:41:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C50901A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AADBA40EE6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85LOgV6lY8_P for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:40:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 32B7940EDF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791052858;
 b=hyJXW6CBZA8h+VCAEHHHNBphVpvlEKDU4PLRENyowMeS6vk/M7QsKnaX6noaX+GfOoCK
 lOWA0qTERS7zSJULLpJl8GGg3xct28RVOoZMNRm0qC0xeP2maNxjoSYJyV8f5BTPaQ9iA
 yr7UhgNwoKpQICsE18+QU2jOMOaGDF0rPXKuoeV7kBDzcgZYqVT6FYhRkd7/tlNJRMnM4
 Zranx/1/A7oosC2L1suHdbWINA8cGcGANc98o1buZEPE2v5V2yICv89pyBFDBxe2faXC6
 9//9rKodUIp9HSGEm9bk6S2+wMJP7ptARH/xqlyqyEQPnHdhyagWEmeqMikdu9d/WzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791052858;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=OVAgzY+cDiOa2SEvF/yknbIpW24Nj1xcrSkZ7QhEUog=;
 b=FaBoWvDHJwroxyvR0h76wjLcLeBexhzMguC7Dwcs9eS7C1fNExLoPRdzou2s6oJPRK5V
 id5XBpP8FWvtOYPMK0BA0dLr22ZjUACR9TyzVhCmiyd33l6FK1MOIrDtseWh5B/q4Ju5E
 JmZkft4acd6UP+GHmO4lTwDy6efoFSUtX2rfnX/3LQ/OBYrRSs2aXBsOVJSQQu13Jw2q7
 rGKk4whGzrEtR74C+s0pV1zjha2TjK8OcZwKEd5nO5VZOTfnmDgvIrMAgutki1AncV46G
 kDG+Uzk9wknIctomwx3kx/5FjX0fwX3CXC9oq775ljplXOH80nH2TXlutDKbAlVfH7Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nAejPuVb; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32B7940EDF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:40:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAh0-1wgCoz2W4W-00ZR85; Sat, 03
 Oct 2026 20:40:49 +0200
Message-ID: <7a895576-8ee9-467b-bb1a-6cd8f9a61e76@gmx.de>
Date: Sat, 3 Oct 2026 20:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261003160713.1350799-1-bernd@kuhls.net>
 <asEp-UvwtZnTyfY9__33610.5728916422$1791044172$gmane$org@windsurf>
 <pan$688e1$f7d25450$3dd59207$f0732914@ID-313208.user.individual.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
Cc: Buildroot ML <buildroot@buildroot.org>
In-Reply-To: <pan$688e1$f7d25450$3dd59207$f0732914@ID-313208.user.individual.net>
X-Provags-ID: V03:K1:ZUWBSmY1uU1g5FuIRtLjBFybne94KAADh3+4RtSSNIdLqokeIHu
 KI99Lb34cTgSPYLib+ef+0mUjTo9m1soujKQfQ9Rj44YV4MOBVX9bBirqrlhy0eiOTr2duF
 tILAvUeVkEbobkzKN6i/NaL1+5Z24OEYEFyNFL7IFBgXk/qqsKjpEbljObbtRD3cIWfdeYp
 iSVskFdPBH8aNOvQkEKsQ==
UI-OutboundReport: notjunk:1;M01:P0:eAn/H6wZ54Y=;iN16tD9HtxIY9LtWlxGc3z4yC3P
 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
Subject: Re: [Buildroot] [PATCH 1/2] package/python-scipy: remove license
 file
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd, hi Thomas!

Am 03.10.26 um 18:31 schrieb Bernd Kuhls:
> Am Sat, 3 Oct 2026 18:15:47 +0200 schrieb Thomas Petazzoni via buildroot:
> 
>> and I'm wondering if this "BSD" wasn't just for this ARPACK thing?
> 
> Hi Thomas,
> 
> afaics scipy itself is distributed under the BSD license:
> https://github.com/scipy/scipy/blob/v1.18.1/pyproject.toml#L62
> 
> SciPy contains other libraries which are also distributed under the BSD
> license:
> https://github.com/scipy/scipy/blob/v1.18.1/LICENSES_bundled.txt
The problem is that there is no "the" BSD license, rather a whole family 
of similar licenses.

https://github.com/scipy/scipy/blob/v1.18.1/LICENSE.txt looks like what 
SPDX calls BSD-3-Clause [1], which is already in PYTHON_SCIPY_LICENSE 
separately. There is also a "BSD-Style", which is rather vague and 
should be replaced with a specific identifier.

Scipy has a list of licenses for files bundled from other projects: 
https://github.com/scipy/scipy/blob/v1.18.1/LICENSES_bundled.txt

I'm not familiar with the Scipy code and so can't vouch for its accuracy 
or completeness, but all the "License:" values given there are SPDX 
identifiers, so assuming the list is accurate and complete (if not, that 
needs to be fixed upstream!) you could just gather all unique values 
from there into PYTHON_SCIPY_LICENSE. :-)

Best regards,
Fiona


[1] https://spdx.org/licenses/BSD-3-Clause.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
