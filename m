Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A35C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 04:24:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3DC960BD3
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 04:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3DC960BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859304047B;
	Tue, 27 Jul 2021 04:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id icIks_eTGHy8; Tue, 27 Jul 2021 04:24:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB9FD40469;
	Tue, 27 Jul 2021 04:24:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 775D21BF284
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 04:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7066C607D5
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 04:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UhWC8fkOWDOW for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 04:24:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp52.i.mail.ru (smtp52.i.mail.ru [94.100.177.112])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E60C607CC
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 04:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=WuLbD6YYm5cRiRD40l8VZqYHunAOvXab1fp47NQnnSU=; 
 t=1627359874;x=1627965274; 
 b=VOFAxAWjbZvv9/xi/NUscpL5n8isrwtpVxBTibQIWycZxtYGtMUtyWoWwV2K+cQNhvCUWvRl5cLFHimxfQMsI6d8l5fizlgoLMxIhlUKfoiKU4lHtoaeEfdPaPG+EU2uE/GAQktxoHDl/IOLlyo1K6ZfGO8ooniiRZdxvnH4Fn4=;
Received: by smtp52.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m8Edq-0002mO-H7; Tue, 27 Jul 2021 07:24:31 +0300
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
Message-ID: <dc5f35ba-4bff-16dc-eecf-42cab9613355@inbox.ru>
Date: Tue, 27 Jul 2021 07:26:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
Authentication-Results: smtp52.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C34755E0A9F196FCB739C645213AB7C8E0182A05F538085040F6470229DA69173F24D62F909DDA881A851EB6CD9F09A7D3047D024C9446EEDD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE706EB50E99815151DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B100969577675F2D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C7C888CC45EC6509263DCC4A8B3EF9596F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE715C5AF61602698339FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BEA77C8EAE1CE44B0A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCC7E77208185BA9B1D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE76CEF212D22A2C45DEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3BE90F13D913F449135872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458F0AFF96BAACF4158235E5A14AD4A4A4625E192CAD1D9E79DB53CE843736870894867B9B70AC816C8
X-C1DE0DAB: 0D63561A33F958A5AD9DF273631D5D9C0082853152505469BFC43F2AF79F862CD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BF6B963DD989C0FC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349EC559D073CA5B689A37CCB4E96FD1AF792E0C820655A04FDFEEEC719FC38CD9527440438CE145C31D7E09C32AA3244C8F686135D12A4CA25F38A63195414B8BF94338140B71B8EEDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMEANdStWW59gUzM7V+UvJQ==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24D0C10E87A5B2E252AC7E15795E0AF6B2F37B1936A6AEF723EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libgeos: fix build failure
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
From: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Nosthoff <buildroot@heine.tech>, Romain Naour <romain.naour@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

27.07.2021 01:34, Giulio Benetti wrote:
> When building libgeos for or1k -mcmodel=large is needed to link, so let's
> add that gcc option in case we're building for or1k.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/libgeos/libgeos.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
> index a355732af8..43211d0434 100644
> --- a/package/libgeos/libgeos.mk
> +++ b/package/libgeos/libgeos.mk
> @@ -23,6 +23,10 @@ ifeq ($(BR2_arm)$(BR2_armeb),y)
>   LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
>   endif
>   
> +ifeq ($(BR2_or1k),y)
> +LIBGEOS_CXXFLAGS += -mcmodel=large
> +endif
> +
>   LIBGEOS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBGEOS_CXXFLAGS)"
>   
>   $(eval $(cmake-package))
> 
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
