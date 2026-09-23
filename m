Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46EFC98304
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 19:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985C841BD0;
	Wed, 23 Sep 2026 19:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XU15vsjD2Mzl; Wed, 23 Sep 2026 19:48:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BEA4C41BCA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790192913;
	b=nsfhgLDP8OgpkkRz4ulb5/uL9XkJU7FP9GHaVbpn6Hz7EVjjOX0PX93JscGl+sO7qYiG
	 NM47XCtjGBLlFJkSu9sfc8QsLvQwPrY28FZTUhnJvVoDMgZc/UmFYe+Y8yN+jlbCfYcje
	 RRAmiIDUWUqlfzDn5BxITmLHc8UIvqWKxN2IsaWkOJmPAYyOqPU8WqUcjbw/vvSX+dpxe
	 ax0Uc5UdlSkzGMAo7iz+cRGt0oOJ83VnQD9X7ZOZqn6bG6ggFMFq+jJzWn+MDlZuQVL7n
	 n7JjBW1lotgQw82Jir28T3cBe6CrJwW/Tf/cbnwOb6uC8l5WOWF9cBH3X+PInB1ZCRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790192913;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=l/E8+xuLhoGzxeIuuqLhl1ZFIk/8CVaM+b6LnXCw6zw=;
	b=FY/Gi+pyDLmHTO9WCf0GQO/4phd3BivX46Scqj7xscdZKhNbwmoVftKyaWp2mye1d702
	 OwX+ihE6zEjOr28Cm2otQuqjyJOlhmd89U4NZXCDRRNkwBseUA3shpySJQad2r9CtpW2e
	 tvoGIJz/9Hg4yCOsLdO0UY/mDWfbS/Vp40Z5ReiNdXyDb8TDODRVG3Dxsmclhdspop7MH
	 EQXm9paAim0KvVkz2PN1V8MUxRGaj8/2KRzechfW/Xpw8HW9ajKCe0BvidPKDhokqMByH
	 mzTSj752wvRYe+z9emZKn/c43n5Qp3tF35pyQ2FLsVoNQYDEJ0da1rMAAmXmoHr0qsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790192913;
	bh=l/E8+xuLhoGzxeIuuqLhl1ZFIk/8CVaM+b6LnXCw6zw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RFTazIueM7B04GwyrMb2ktukhctlYCL0rFIjpKQsxXHS+T0iCdntm215QttHE1fYh
	 iXOdpSv+Aq+aXCSRqn7CiHBElEg78J3JkgZqwkR8JFKZ4OV9K//s3Kf2zG7gxCIwQy
	 vHhO7nBWVMNPbx+pvvDpebu0WmKcE8+TvS4eduIr9Sdu6ubi96orA4eoY7SOZHDJct
	 HgrROLjcWD80BtfRoVjrKjADHwVerN4alrPZRYeyDm9H2usQI3GJ9puxuNsxSIw0M4
	 MNUR5425IAaxnNQwRCKHxllr7GfTuFh6M7ajrsCu80tMfxm65UAF0jPArP2iI3OOq3
	 n41Kxg3HFQvxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA4C41BCA;
	Wed, 23 Sep 2026 19:48:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 180F113B
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC4F830E6
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMPXaYEkRMIf for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 19:48:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CB32D81CE1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790192911;
 b=RpkByqSjJjPIZZifnHvPoAX84YS2hcE4zAeVWCTF3IHvGSVgxRu38A430RFDtqdRHpr/
 nTaea7B3rExhlatGvuwZfwxtMF61SmFFHttBJo4YfHr/WKRE2Ihczl4yz14rOqlHhTXDu
 RjGXJm5VhTuYbINAc8Onw71aTphOqS5fjKN00wd4Q6WlfcHEWWxwPFmNrtRMtVxFINOho
 gncQX5qb2PkEczhup7xFEiMut9rjNPBXNPai4tCajwcGt4ZePvztEYg//N5h8qBTiv+h1
 MapiI5PpLhfMgMmVOEJyBQKT9VrdvpqJGp9mlml0iBPHTYoM9QvOgM6gnFA8ExdqrYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790192911;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=XlIFg8IEZ+rwIr1aW9xKot0Ym+mMFXtXz+AD5sa4QBM=;
 b=SqhLwIhCFgmkCmmPSsRv4ec0dws29p83bVKD+JFvUw1pb8UmHEeDRlNYHDi2kuI9ZErr
 D0qhop4yldV/GtB+bS5++F11HUPbGKMfoyx9WFJc5ZhW1zqjvuW1ui/smX8Hfsmq4K1cO
 6wlb1txwy8Kxdyx1lG1EDmxlKlUj9JDW3YlFlPmR0Py+NjOnbtsI5ahZGXibqnsykhN/Y
 bntH4ExoL1yanUUX+GOvQn1fofAE77cY5oDCxMP8U75IaoO+8IFmUqGpT8ZGq4ftDFPZL
 h7y36ontg+Kp3+XaYs3fVTJsf74MpXi+K1BzkdFD3YQ1FwXpLw+gZxtbdO2IM4WyEzQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="ZYrN/SUo"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB32D81CE1
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 19:48:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 63F2A2003B4;
 Wed, 23 Sep 2026 21:48:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Sep 2026 21:48:26 +0200
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 21:48:26 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20260923121453.3986966-1-giulio.benetti@benettiengineering.com>
References: <20260923121453.3986966-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <3fa116738e53f2dc39317b930d004b9d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2] package/nfs-utils: bump version to 3.3.1
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

On 23/09/2026 14:14, Giulio Benetti wrote:
> Remove patches upstreamed in this release.
> 
> Release announce:
> https://lore.kernel.org/linux-nfs/5717a803-805c-409f-a9cc-d0c33a365570@redhat.com/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
