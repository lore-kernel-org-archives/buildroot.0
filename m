Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3407C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 04:24:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2376109D
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 04:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C2376109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=inbox.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AB154038E;
	Tue, 27 Jul 2021 04:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TC_qnnwLKwzu; Tue, 27 Jul 2021 04:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A240740389;
	Tue, 27 Jul 2021 04:24:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82F381BF284
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 04:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 723FE4037B
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 04:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4e8UrtaBeFH for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 04:24:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp48.i.mail.ru (smtp48.i.mail.ru [94.100.177.108])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9055A400CA
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 04:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=l+bbGlmTktHIu1GL1Ast/p7xecy5zj86JToFY75Vi7Q=; 
 t=1627359884;x=1627965284; 
 b=DglykyUylGYYpfExV3AVwSP/N9s8P2pNSBdcU3uV9HEpsERRrDa+/Fid/m3hpbjkA64E3UNRilTtCyCcCMZzecxBp3SlDt546668yWHvKoUjGsh6wHAIFdKhHXfqiPswobkDnmQzyg+CxzVFB951s24D7U6QlOQKLyVx4hF28lk=;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m8Ee1-00026c-KA; Tue, 27 Jul 2021 07:24:42 +0300
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-3-giulio.benetti@benettiengineering.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <cfbd8ea3-69fd-8a80-7a0a-f9090485def8@inbox.ru>
Date: Tue, 27 Jul 2021 07:26:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726223435.2906458-3-giulio.benetti@benettiengineering.com>
Content-Language: en-US
Authentication-Results: smtp48.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C351B198F4576AC7B21928AAE70459C21B182A05F53808504025B7995A2AD3AC699FDFC1EE91C10691199D03F94AE024A561C4BD8434935039
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7180ADF26E81B0C77EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372FD0E46BD6FDBDB0EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BBCA57AF85F7723F20B147F8B64CC302BAE876C224DF3426920879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C04CF195F1528592878941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDB19F53EE528DD389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637833D1493F6DF72ABD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE72548D85CED5985ABEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3BE90F13D913F449135872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458F0AFF96BAACF4158235E5A14AD4A4A4625E192CAD1D9E79DB53CE84373687089448F520DBB289047
X-C1DE0DAB: 0D63561A33F958A59D39FE1491B8E79677DF73B4F926D7A66CD72E9B03C35C57D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BF6B963DD989C0FC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349C39CCCDAABCB54B2F96DBEDDD7A29924765693333E449EF490176FC8B788DCA1E2E06E0A22B02A21D7E09C32AA3244C38BF5F3340D1563FA71B34350C37A5C3A90944CA99CF22E3DCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMEANdStWW5+AExOlSPb8FQ==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24FD99AFBEBBFC80BD9A1C6FE68546D308F5414798E01375CCEE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH v2 2/3] package/protobuf: fix build failure
 due to missing -mcmodel=large
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Nosthoff <buildroot@heine.tech>, Romain Naour <romain.naour@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

27.07.2021 01:34, Giulio Benetti wrote:
> When building protobuf for or1k -mcmodel=large is needed to link, so let's
> add that gcc option in case we're building for or1k.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/protobuf/protobuf.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 492917c5e8..75791fade2 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -24,6 +24,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>   PROTOBUF_CXXFLAGS += -O0
>   endif
>   
> +ifeq ($(BR2_or1k),y)
> +PROTOBUF_CXXFLAGS += -mcmodel=large
> +endif
> +
>   PROTOBUF_CONF_ENV = CXXFLAGS="$(PROTOBUF_CXXFLAGS)"
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> 
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
