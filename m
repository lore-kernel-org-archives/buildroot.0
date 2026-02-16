Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB36E63F2A
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 05:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9617E40A53;
	Mon, 16 Feb 2026 05:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IjxHbq6pHyo; Mon, 16 Feb 2026 05:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F91B40A58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771219775;
	bh=rHF4eBYXCjS1bmo+zwkSuh7Nm1Z+6MFbIVOvucinRKU=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/TjNTGQlY+YYL5KA++DhmUScV9X/MhqYKoXD2KSVMqv+DrT4uD0Ks3y2VZJu582g
	 hX47kRTLRJk2LOS7zjiHcbaKElgDM0sDZeQYT1A34iT5OLh5QRMANbDT9x3pRw2kJA
	 84jCYc5cL1c6LNrNBtnefmO/nqoAvupF4sDTyMCNW3W6gngkfOmNSSR+PhtOQEF10K
	 UOmUrmLxQJlmqTY6x+9XPV4dWfJYKOQYpHYvPfNkxp3cKxAKwEAjBjjoktxE6EiEbT
	 O0/QEoA9BH/Z5SGvVIm5s0xycX/OsYqOjbTB6XTnA7Ry/1lJjSH1S8z92GGKtoHjZy
	 Gc5LHMBob1vaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F91B40A58;
	Mon, 16 Feb 2026 05:29:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA496270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 05:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B25240142
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 05:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXt8WDdVIwja for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 05:29:33 +0000 (UTC)
X-Greylist: delayed 927 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Feb 2026 05:29:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ADD464007F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADD464007F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.78;
 helo=send239.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send239.i.mail.ru (send239.i.mail.ru [95.163.59.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADD464007F
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 05:29:32 +0000 (UTC)
Received: from [10.113.179.22] (port=59118 helo=send240.i.mail.ru)
 by exim-fallback-7b9db9d745-wwrbz with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1vrqw6-00000000J11-2aUk
 for buildroot@buildroot.org; Mon, 16 Feb 2026 08:14:18 +0300
Received: by exim-smtp-5d446c7b8f-28zpb with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vrqvp-000000009FA-2O3o; Mon, 16 Feb 2026 08:14:02 +0300
Message-ID: <325dbb31-c92a-4367-978a-b6b6afc82b75@inbox.ru>
Date: Mon, 16 Feb 2026 08:14:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260216051314.145935-1-bernd@kuhls.net>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260216051314.145935-1-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9A6EFB945BF0DEAB2F96CBC83A3B9494A238C435315A85C5F182A05F5380850404132977E9527F8CE3DE06ABAFEAF6705DF154AEEFBE6E435277375E688FCE25FF8A48EF99929F69E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78C6616F30072131EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375662E783F4C49E27FAE0D22B125A1096129F8C6F42BC8A698ABA442569CF65834348EEF46B7454FC60B9742502CCDD46D0D5DBE5CE84B47B0E4117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC081CF0AE924DC023A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520B28585415E75ADA928451B159A507268D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C0D75EB778CE7D8A0C68655334FD4449CB33AC447995A7AD1857739F23D657EF2BD5E8D9A59859A8B67393CE827C55B5F775ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5D017593A278925DE5002B1117B3ED696D9F5DEDD8C0D0C679E040399BDE4761E823CB91A9FED034534781492E4B8EEADCAFEFF123806BC82BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CAB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659DF45B7E358736A953771438894867CCF81F89A661E4B669BDAB05BC3C8F6665643F5B449D69F3A83B8341EE9D5BE9A0A894B09E0DF1F1E9C866C4CB4DD2C9E356CB6A7A4A02DDD568CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVReXxXgcs1IGC8Q0l89rQzw=
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD2230D5EF5850C7BE4603691AAAE4B65C5E378FED1345F26A590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4D18B7733AFD02D5BE018139F08E99591C01C6F1E93F0DDD1049FFFDB7839CE9EDAA8A36E17FFA08F6BD4F0C6FCFD04CA6E550E69C15221A994C9C581BF276FC74893F53572E84425
X-7FA49CB5: 0D63561A33F958A5962F3950A61B75B95002B1117B3ED696E86914287343C97ECB2E3681EEBA4C9602ED4CEA229C1FA827C277FBC8AE2E8B977E27FDF027349E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZcDiiEphvFikbDILL1DecLg==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=lW9Cpt7y2Poe6Hw644RpA0WgJ5kJ5JNDFeXQ9GK+Nys=; t=1771219772; x=1771309772; 
 b=UEF55V5D4QM+jrgxZyv6S6nzNo0D55O2cR6Vasn0XzUOikIweuAJNhT5PrDXyD5V7i1fVvKdirK
 RzpOHKs36nzISLWYVcmiMgrCJ1B4t0a3/OXZ50AAxR5lHthuuWTncaR5DLgpFPcsKRbNpdTL8Zo3B
 1ofzxuwuBQ2gRqKB6exmB3cNini7TAV8I+C8xIb1fta+kAQL+uBIqr7uY6nbo34H3ZugUdY7TK94Z
 9BC518XpXgcnsMEaYWDOE7eeZ6LjwMZKHv2B2lJKAm0Qnyx8GQUb0tit3GVXkzGNOa0lkP9Yi0M/q
 jpNgsFpmCYVi/SiS0GVxkNoU1lqU+eqvlMAA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=lW9Cpt7y2Poe6Hw644RpA0WgJ5kJ5JNDFeXQ9GK+Nys=; t=1771218858; x=1771308858; 
 b=NlU9gyvq4MuMRvDRnhpIPekM393636YMD2ao7TTfAXgEE2X9r/2KE/rvSarbIDNgbo7EWUkmGBz
 ufTXtbw90t0imd00NFH465Jp1C+z7J70mANMEVtiYqu/kuLU9A3qrevMWJC8bX6AxC/wqyj+qV1j7
 nKhg2NOdIeWDjtyPtZVbjJM8krIIEJ9HX3Ukp+2tnOauCuAmO2ZiOFChLyw6+PbFIHPc1XNkM3jh8
 oEO85PY3pKWPeY+QEZivFkL2vk1tbYGDgE9a5y/Izsfj2kHPRr/dKzC0KWmMy1egXpaTqiQaRCJ+t
 artfZ513vJtE4Ayf4a5+6LmM841yUZp4jW+A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=UEF55V5D; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=NlU9gyvq
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 18.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

16.02.2026 08:13, Bernd Kuhls wrote:
> https://www.postgresql.org/about/news/postgresql-182-178-1612-1516-and-1421-released-3235/
> 
> Fixes CVE-2026-2003, CVE-2026-2004, CVE-2026-2005, CVE-2026-2006 &
> CVE-2026-2007.
> 
> Updated license hash due to copyright year bump:
> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=aa4b5ebc7640f60905cd4c71db45674e5941b611
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
