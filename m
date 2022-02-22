Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA937C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 05:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D5EE40597;
	Tue, 22 Feb 2022 05:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3gjuK9hJwVh; Tue, 22 Feb 2022 05:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6580D40590;
	Tue, 22 Feb 2022 05:36:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 977211BF37F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 05:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A05F607A1
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 05:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIUD1p9srw1o for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 05:36:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19722605A6
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 05:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=nLcFAGPNkPMZ+CntzQSyY2teHBPMOmI0MWZ2eDY/lYc=; 
 t=1645508194;x=1646113594; 
 b=OgTJlidwb0gUWMcCjMIDLZZ0CqHiuaF2Nw5bhpK6P0Td8vCBOWmlY2/8iGP5PAzI8lxYuWd8FtXnH5eg9i7IM7X2V+6l8UhTF5JqwpOkxDsr5Em3iV8MXFzJVXakjYiPlcUNlnWSOKYZILYTmOkLNNMF63N5/fi6IvtvZEXg0yoUhKGG+bowkCJ5RXgPvFElNLDeyb5FSVA6daLJ6fCyfKl90RQ3u25l75uXqIWln1Z+pvbqtY7nVMXnG8TVlGV8QAlTuGl9UGbXQgzsas71oIsG/WfKcS/XnLARf9N/BWRiuN63puHeNIRugPtpNurg8RyipCnI4VOAo55mKFASQA==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nMNqg-0007dD-L9; Tue, 22 Feb 2022 08:36:31 +0300
Message-ID: <d6cc3cf5-a895-660b-0964-057827d9ed22@inbox.ru>
Date: Tue, 22 Feb 2022 08:36:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220221223842.2201966-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220221223842.2201966-1-fontaine.fabrice@gmail.com>
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD95E12778296193B1F957FFA9E11D5F2E7178D8D0D8B63085100894C459B0CD1B9B4D7122C149FAB8424FE67D0F1CDCBAF17F3A17C1FC0EBBAFB1AA341019AC2B8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D63A32B630C59AACEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371A00CE7BDCE207EB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D847D92569521E88E0FAE0C9F4B71D815F6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE71AE4D56B06699BBC9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B55D5BE2F85BDEC5FA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C565C1E6824D8037B43847C11F186F3C59DAA53EE0834AAEE
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A53E0BF7A4495D9F21E54DC975D584ACB1F5AD14CDB08E8211D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75448CF9D3A7B2C848410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D341E2D05735FCBECD1D3F64DDE3A311B27857F8C6646DB78F95B90E9B61681D1B80E6D3D65297715091D7E09C32AA3244C91646A38E92543215D3BD4EC0DFED0975595C85A795C7BAE729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWREYi9mvxH4AU87s9ncoJA==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D694CCA044348ED57404E45B9EE9551C1198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: disable external fmt
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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



On 22.02.2022 01:38, Fabrice Fontaine wrote:
> osm2pgsql doesn't support fmt > 8.0 yet resulting in the following build
> failure since bump of fmt to version 8.1.1 in commit
> ec7fd50d08690a383fec40748ac9b78c3f764316:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/fmt/core.h:1728:7: error: static assertion failed: Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
>   1728 |       formattable,
>        |       ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5af1a0ea176559a5dc787ba945a3a83823f5b1bb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
