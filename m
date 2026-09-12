Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7818AC79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D1C80D7F;
	Sat, 12 Sep 2026 13:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHSG3ODigNFV; Sat, 12 Sep 2026 13:09:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EF94780D88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789218562;
	b=MVFogoh7C7gCNm0Esf/mIjY0ypkSuD/mhMQWUroO+7EQE6wg3/zsxWDs4C3Q2mdYw/lx
	 kbfo98gP/gKS7gQGx1tPNdzccrr+2JxUFBHbTx+sKtr/5mGAcdDumkVmAYbuV+RoaqjF+
	 xAT68dkqbeD+yBCkEnalVQkmyQjJso2Rr2Kt07F7oWJgPaHl1ypLLkMjmJWoQBMUR1X0Q
	 rZ9KBnruf8zkfBuwYnPDsPOn0TiUsUu2XHSmRS7MmWlD6h0ShuoW2FBR7Pyf0l1hgw06g
	 9yXLiI75VuSakPGjT+iKfbvdIPc3WT0rIesNXlOXpVM1vFwpYVkk8u+IvJp87dAa3TQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789218562;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=QYH7OGu82B2bTHU5gEnqqmZCo9qdeOCX73AvGn61scU=;
	b=ZmXeo8YseYuf6PGgIe2JFNOPRXhOO2Fz4nwkIRxlychU8ULdhxK0pYDkrmoJukymLGsY
	 c4mUFMOtpdR54z1CLHo/cL9PniurrqVmY1R5Isd+kRxruenKqcso3VoTmy+eIY26ynsDH
	 fYoUgQs48FormWtcuN1Tc/3j75K64lNP4+sPnJKC8L2OYZY17HoAv8xJk8G3C/JsWZjJa
	 wlzOgdXp60f6TT7Wp8H8/wPqd4BGWHdQ59JnS36jioKWkWZWXNPMP8pn+bxq0n1HsUBOx
	 EH7s+8wu1iJzfuLbHkWDM8Lmw8m4lUIXvax9WgPCw3rAVlru68wMhgAylTj/H2PdLgw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789218562;
	bh=QYH7OGu82B2bTHU5gEnqqmZCo9qdeOCX73AvGn61scU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qbxaEeJCQP/fvVFP7ZNf+QtPiSgl+z7pl8ypHSrH1M8ia+S6rURopgOn9zM35a0Jq
	 qMm7vQDbYMl7dFQtiZAKndGoVsiA7M29RGksKOq50oLMxBCmQVg/6QNqITu0yE9Z5y
	 YaSt9paqMkZZj3reO6kMrGZq9gYMO9BtZXLrBJA6iz+ujPl/484OLbDzFAprsjtQhJ
	 qwi0rNVidTW/TRYSYaigor4I6zEh3ZTZ50m0mjcyxTngiMzP7RHF+qZvrCyZzgdMP6
	 8ax5emET9NhMLkgIaxlWpwk1BddEmrUSVHmnpaHwzbtqtP5Bct1SM6zwOJQpYY7LMj
	 VE9G5DOq5wnFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF94780D88;
	Sat, 12 Sep 2026 13:09:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61E81EB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D61C80D88
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xo5HqnwoxVBl for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:09:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F18FF80D7F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789218558;
 b=OUUyw+shVRgMNUEnll6pFH81YmCIzu4oy6FLwPJMZWoKtfNs2lYZaxUEmvUh2jq4zQO3
 X7Zv8r0i5M2IyikTzeCZIlgvq2I8aSbuXAPSMJJ3YSsUNSFvjx+CC36FtaPHWp022o/iK
 P8VIQMxVfDn5w+nV3rYclXhQHKlsLmkM+s4GcwobtVkssFaJm5qmW7BDpFRzIbXCJxKRP
 0fN8oCsodbgCqjkOmrNejQ4x0Ka7vMpD6//eZE+4vICUPxLw66pB9OT8JhS/8e2EpXMGd
 azX1+jjtiOfk2eJIixwj3JpP9gZuGPNsJlnmHrP4u35EjrhENeJvPPNgpuGWrjrVrxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789218558;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=g83K98I+akZ1GvSGYtnDbsEnN+zUUd6+32KMcceU1H4=;
 b=aJ993OV6q3DQv/SwAPfWD72nAzHap4FWbDcusHSzwYs81j/UgvYqf+sTSQp97kT+DT5u
 R4PA/O+09OypZ9jSBp3qMDxDSJRBM3TtePqz22yEpeJoq+F89Lk7POkbb8tGro+6hNT6K
 zfeNJQsrUkEpDKdvNs/9Pg1Mhxc2qrkii1yew8pJTDkaFTYNa71QKC0dSqoCp61xPS21h
 3XQ/1OVfAyFJzi9KIz145guEU08oPRFm2t8iy5f1w8jp3ctEEeTmVVLD0PgI2vZvxakNW
 zDJUG43IYIYfJGGATQKm1GKU24hDwZB1051mHiY1H6KxsRU3BD4szAMM7n6XxQAho2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZyfoqaPy; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F18FF80D7F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:09:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F36AC6013C;
 Sat, 12 Sep 2026 15:09:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 15:09:10 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 15:09:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260904171031.194697-1-bernd@kuhls.net>
References: <20260904171031.194697-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <38f9763482279d00c26e12395a093f1c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/sentry-cli: bump version to
 3.7.0
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

On 04/09/2026 19:10, Bernd Kuhls wrote:
> https://github.com/getsentry/sentry-cli/blob/3.7.0/CHANGELOG.md
> 
> Removed patch which is not needed anymore.
> 
> Updated license hash due to upstream commits:
> 
> copyright year bump:
> https://github.com/getsentry/sentry-cli/commit/734fa8cddc8308133d6f807cec01a9e5e668aba8
> 
> switch to FSL-1.1-MIT license:
> https://github.com/getsentry/sentry-cli/commit/3ed4ada174945c83702350ceb83944651f1d8ff2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
