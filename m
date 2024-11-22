Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF003E69186
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 18:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3CE042C4E;
	Fri, 22 Nov 2024 18:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GZOijaBIswk; Fri, 22 Nov 2024 18:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92AA942B88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92AA942B88;
	Fri, 22 Nov 2024 18:09:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74D71E11
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 632F16111B
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OsB47O-rkQG for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 18:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BAB960624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BAB960624
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BAB960624
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 18:09:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2682F13F89C;
 Fri, 22 Nov 2024 19:09:31 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43244])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 22 Nov 2024 19:09:31 +0100
MIME-Version: 1.0
Date: Fri, 22 Nov 2024 19:09:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <3rw5dd3fqy2obmnqnb3jg3jauddbzwkyh3y6vfuhqo7rfxye5t@4j7qvg5m6tkq>
References: <20241121225344.203867-1-ju.o@free.fr>
 <3rw5dd3fqy2obmnqnb3jg3jauddbzwkyh3y6vfuhqo7rfxye5t@4j7qvg5m6tkq>
User-Agent: Webmail Free/1.6.9
Message-ID: <c4b4d413e8a64acb3e88a48e5192a513@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732298972;
 bh=xiAX+gZeAC9KfgaRlL1CW27LGp2+M2o0CP15nLgoZ4g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SieiLgYfoPNy6HQewXftcEZ7NG1gkJUHtr9WiEFMWRh7/jlmejKI9wR7lt8b2Zdol
 jGBsEC+jwuIKxwY2KY4GZq0neIuaLHu9AuKdlo67HkHR2Uv9qlSJ35nJgedNW/mbps
 VEWKVBHoOA7gFKyz8H/Twti0RZ3Gfudomb4oYC4KCwk/Ws6mnq3fIZSeNmNANAI3hd
 vbQ5TBvmbu8FmPTCFvpXuUZF3HmbQOlqgHHBvMhRX+81tSdJDG+iwVJ7Pd1uOffRrB
 pDxS60YPuH6TlJtAg6j0XZhv79AJZjWvS4kdQuHWExNnxfBAgj+wsLr/detmP3BCa7
 HS4KUXpHL+5Og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SieiLgYf
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux-libs: allowing
 building even on non-Y2038 compliant systems
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

Hi Vincent,

On 22/11/2024 01:25, Vincent Jardin wrote:
> Hi Julien,
> 
> On Thu, Nov 21, 2024 at 11:53:44PM UTC, Julien Olivain wrote:
>> Since the bump of util-linux to version 2.40.2 in Buildroot commit
>> f14929c657a7b1794dcd39ac469d2ad826465d98 ("package/util-linux: update
>> to 2.40.2"), the build will fail on systems that are not Y2038,
>> such as uClibc configurations.
>> 
>> In order to preserve the previous behavior, pass --disable-year2038.
>> See the gnulib documentation for details [1]. Contrary to what the
>> option name might suggest, it doesn't really disable Y2038 support,
>> but only the check that the system is Y2038 compliant. So even with
>> --disable-year2038, if the system is Y2038 compliant (uses a 64-bit
>> arch, uses the musl C library, or uses the glibc C library with
>> BR2_TIME_BITS_64=y), util-linux tools will be Y2038 compliant.
>> 
>> "--disable-year2038" was already added to util-linux in commit
>> 11ae90b00 "package/util-linux: allowing building even on non-Y2038
>> compliant systems".
>> 
>> Fixes:
>> https://autobuild.buildroot.org/results/630fc287deb1cf5a684f274058b918a5d7aef989
>> 
>> [1] 
>> https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  package/util-linux/util-linux-libs/util-linux-libs.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk 
>> b/package/util-linux/util-linux-libs/util-linux-libs.mk
>> index 0337e7e13a..1a66f3847a 100644
>> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
>> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
>> @@ -28,7 +28,8 @@ UTIL_LINUX_LIBS_DEPENDENCIES = \
>>  	$(TARGET_NLS_DEPENDENCIES)
>>  UTIL_LINUX_LIBS_CONF_OPTS += \
>>  	--disable-rpath \
>> -	--disable-makeinstall-chown
>> +	--disable-makeinstall-chown \
>> +	--disable-year2038
> 
> Could you add a comment extracted from your commit log that the
>   option name might suggest, it doesn't really disable Y2038 support,
>   but only the check that the system is Y2038 compliant.
> ?
> 
> So we won't, by mistake drop it. It is really counter intuitive.

I'll add the same comment which is in the util-linux package, and
send a v2.

Thanks for the review!

> Beside this cosmetic comment, it LGTMs.
> 
> Reviewed-by: Vincent Jardin <vjardin@free.fr>
> 
> thanks,
>   Vincent

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
