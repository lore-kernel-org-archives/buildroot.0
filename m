Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F09E9D831
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 04:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C2C380F1E;
	Mon,  6 Apr 2026 04:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhWAe3AscZX4; Mon,  6 Apr 2026 04:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 511ED80F21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775450658;
	bh=6pYOz9cADANslH0MrHaMfFQgISyhFWG4Ec6l5BuNmL8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rTwFBQ0tTt29b1+gBNsuBIeY3cBpGXqBWZb33ILBv0ia12ozKIOXUn0SfmoM9+CYU
	 BZJ7Rju85kSvV5EpsDexv/25tICdah90EEAdAm9RqmyyqVvX9WkQZwTF3y+P7z62XG
	 MvLYX2jSjXXSXf0WlOHjf4JV3iVQW0cbO/WUnHP+ZpEXbPjrcrgtwHEAmoOoWaDsOj
	 +RzlEMdwy131r9btoANwDd7VnAYLq4qjxLh/5QWuH4Y/qX6erGPFZsXwY9/+T8Liqx
	 zayTV1TyWAt+32VFvkx3WxC0ouFoJbzJsxo2paOjn1b56xqGuMSm/1eI6QNZShbK0c
	 f0YkXqYMHMmxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 511ED80F21;
	Mon,  6 Apr 2026 04:44:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 761982EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 04:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B6AB606A8
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 04:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkWWhtZeAvfr for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 04:44:15 +0000 (UTC)
X-Greylist: delayed 923 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 Apr 2026 04:44:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD5F26061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD5F26061B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.172;
 helo=send77.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send77.i.mail.ru (send77.i.mail.ru [89.221.237.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD5F26061B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 04:44:12 +0000 (UTC)
Received: from [10.113.165.195] (port=59430 helo=send126.i.mail.ru)
 by exim-fallback-7b9c6d9755-k84rd with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1w9ba6-00000000Jpg-3l3y
 for buildroot@buildroot.org; Mon, 06 Apr 2026 07:28:59 +0300
Received: by exim-smtp-97b5b6448-rfr9h with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1w9bZt-00000000Htx-3O0I; Mon, 06 Apr 2026 07:28:46 +0300
Message-ID: <eb361a40-ff81-433d-960b-84b561980c71@inbox.ru>
Date: Mon, 6 Apr 2026 07:28:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
References: <20260405121524.2590079-1-bernd@kuhls.net>
 <20260405121524.2590079-2-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260405121524.2590079-2-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD931A1A7E579CE6E95EB64011DCAEE3F6D553972DC0743B7D1182A05F5380850403CCAA9788B9C6D1B3DE06ABAFEAF67055655B481EF51B0CC0669EDFF56B1A9A2217A548D7C17D9D2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E22BCA80EDA7B036EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B283D0FDCED5B4C8E32E070BE324C7D3C431B1513DF4E17151BB0A4F435E46E6718B35066C979671628AA50765F7900637036D0B7DAED17EFF389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C058C1844A7A85E7B68941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B68BFD6B1B042489ACCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE79E9721B410A3B6ED731C566533BA786AA5CC5B56E945C8DA
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A57FB6D86300F6E9465002B1117B3ED696536C2A1616E46610A13BD6A4B0E00B96823CB91A9FED034534781492E4B8EEAD17AEC49845D0B908
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CAB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659F168B971CD4608D4F1B213A4042A2AC5B31AF11C2AE19A2A047BBA741654FF681507C3F809E9DDC2B8341EE9D5BE9A0A18DE82C0CE839620C50172D53AD74D2E37CBA053926EC1F66536EB022892E5344C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVajF1spCY9aaGE+DuDYg7lw=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE2976D50635ACE314940CB9911F9B61713524C4B26652763D390DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B43AA9A89F3DE39AFE9B678AD1178C96D972D1E809D7BC6EB868F3CF0E9FE49B696FF3FEA7B950DB0236805A84C49109989403CD34251C33E06D8560018FECCE77E520A8A5846B2844
X-7FA49CB5: 0D63561A33F958A559E0A7463937D9975002B1117B3ED69629BE8D3F42D1647A8E3074072ED0045E02ED4CEA229C1FA827C277FBC8AE2E8B048AE8F0AD9A9E60
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZHDMnEWPKvHZ31qnXI2Kh9g==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=tbKdNsdM3BlCay7wCmKhxSsL4zlyhuDwQj1BZLIzQHM=; t=1775450652; x=1775540652; 
 b=JiNbY7ou7gXfCMuIAJ7rfqMPWbytIb4MYSauL/t8a3BXiyw27aaFTgaMevh6U7mrgTyhBie2WnX
 1+FgPzPaj+jN4W3jR+KbX7bSlp8ebFVJc0xxb0/Y+zesdJdXqOeTQh52pGodXqytRLtW81V9c1hhm
 2xDxVJetxLJqgYBZAytNFn1krOTlIavaDzUeoa1cKHjvwXwAbpX+MfqCrJdkAVDch5JSCbQU1s9N7
 Cj65fxQOC49x9+j+jd0exnI0X1a49Ke/NGlKlV5xXVX+CuCMbEMfxf9LvOFDJgokgFf6HFyhC/6KN
 RWEGQ4nIfCQW8xcSGXyE2EyW4ggMwmWD2bdw==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=tbKdNsdM3BlCay7wCmKhxSsL4zlyhuDwQj1BZLIzQHM=; t=1775449738; x=1775539738; 
 b=nC5up/B1I6iv9nTtnqolGJrjSIYNnkiz6yH6hAnLPUgmFDFhZpByrzjHOf7a4Y4La5QmSELbE3r
 ngfwiqQyC4Z3CkB1foXUkt7APU1it/5jNeYJHgmqRyRvJYqfCZY1DbYoh8BU0Yxcxv3iTLZgLZYMU
 oICcAtzidSA2p4eq8H6CAXKQfnwXfJk+nWfhVvAl0LboOTJHim/V0MBtgpm1WjnyKDmJ0k8ZD4xng
 Vi5Zz4dq1aReimGTnTvAwo+XnjR0HctWsqugAPGevw8/6DH33NQHK711gc6ZC+eq73fF+pbU10wVi
 FxWiVUhkMmRBPy2rirX+C8aCBHL9voTDTcgw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=JiNbY7ou; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=nC5up/B1
Subject: Re: [Buildroot] [PATCH 2/2] package/postgis: bump version to 3.6.2
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

05.04.2026 15:15, Bernd Kuhls wrote:
> https://github.com/postgis/postgis/blob/3.6.2/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
