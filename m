Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB39BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 05:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C980960B8D;
	Fri, 25 Mar 2022 05:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nWPeJAJP6lm; Fri, 25 Mar 2022 05:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D27607F2;
	Fri, 25 Mar 2022 05:38:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9E411BF870
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 05:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A853583147
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 05:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHyHniQWQTut for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 05:38:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B49082846
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 05:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=eAlnj+Ev5fo4h189HLBwW7wvgIKWmtNSXlZnzA44DnY=; 
 t=1648186722;x=1648792122; 
 b=I7KXRABO05x0MMQJy4UQw9CrgWZCO4236CDZvhLeGeWBs8EDT122/owSuH5mh6Gl2Ll12YR8neY0flrk8wHW3h4jzjKSKb8JqS2sxUnNFZv8wmoSldY7jaSXBXwwMb0rWtRjDkUmGhWmJF7zqVBodSZrgIij3YGFV4PZi6jzNKO2ugR94GIPcaYOxhQNwsKQQDFWKho07OQ0WkSBDw2N9P0j7Qn6aR1DBhOpuasnlLUWMXl7ZeNyVq5RikX6O1ecmQ6zNNMMs4khgnplpTdFOg8VFUUjip6586BPOK11i8YBaZxJsUHT1j7GBMGwdRii8di7nsqZ/HxxNLQZD8ItAw==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nXcek-0001jp-EK; Fri, 25 Mar 2022 08:38:38 +0300
Message-ID: <944e8eb8-c4a6-f009-00a9-8b273b947cef@inbox.ru>
Date: Fri, 25 Mar 2022 08:38:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220324223218.27767-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220324223218.27767-1-fontaine.fabrice@gmail.com>
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D8CF2CFB95539D9144AAA932A5836E553182A05F538085040E6DE1A84D5334D806D257F6D4FBFFFE0FA64B064E1A6DFCC468E36659518558E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE745229D52CF30560CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BD890EF519C7ACB58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81E9190E5C2193F7A64399AE82E8634B46F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF1175FABE1C0F9B6A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A53FD1A18683F3DBFB52C0C62F373C2D87E54BC078A7BC5E95D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA753530422897FB34C3410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A783A638E01A3CDEC31732D279CD3616B2243704A14A6CDBA33E8A8DB993751B4CC688027ACA0AE21D7E09C32AA3244C3F06FFB0980E0DC7EDD2B20DEF27236655E75C8D0ED9F6EE729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojK8YCJeMbD4r3i4HoKxz24Q==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D611F2FB5CE01C12901938F407D24D68D398CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 1/1] package/protozero: fix build with
 clang-tidy
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



On 25.03.2022 01:32, Fabrice Fontaine wrote:
> Fix the following build failure if clang-tidy is found on host (and
> protobuf is built before protozero) which is raised since tests are
> disabled in commit be4869f393561aa5c297b631efc62dfd5e1c3f3f:
> 
> CMake Error at CMakeLists.txt:77 (add_dependencies):
>    The dependency target "writer_tests" of target "clang-tidy" does not exist.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c3ae3b5caf79eb30c8a1786f58abea4f2b41a26e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
