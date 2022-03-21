Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82246C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 05:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085C84086C;
	Mon, 21 Mar 2022 05:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cv_ufL4oZej; Mon, 21 Mar 2022 05:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4144040510;
	Mon, 21 Mar 2022 05:53:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9621BF44C
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 05:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 366CA40523
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 05:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=inbox.ru
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ji7rTGMJxH8H for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 05:53:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA3E140133
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 05:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=UwKhMXSz4Jihsjokp8i9nuEsrKgTzGxSGmsV55zuWIM=; 
 t=1647842022;x=1648447422; 
 b=r2qH3rFEiBmj33on8n0SRbQVoF51KRngTSNjdFyVioq9wBpVKrKjFLK1VXqT8SNuuipMtZhj6CDukTUuC+Alqz3itwq4bSPWbY9vPykOfzU8xdVCL9VtBSCuOQKGRrD80InWqNUtrxSWcalxqnAGgPPJLpy9gfpzyrAVbOl1CRwDbo545FAI0rqZ9us5qxuPF1Eu4A7I6PeArt7OiJitOiwQaKDW8gjJeL/xXlI3ZZ5mkhIVV62pM7BGGn7Fynbu/j1fYrB21OJtBiUSHDXmhtXUDXSIvUzHSbTDrHv8OiE+xt4vIDQwCQL+IKkP5+YmqAu8E6kIt3C5sT6C6V6m8w==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1nWAz4-0004W5-Is; Mon, 21 Mar 2022 08:53:38 +0300
Message-ID: <9c95f18f-fcfc-47a2-4522-95eac502c73f@inbox.ru>
Date: Mon, 21 Mar 2022 08:53:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220320163930.1566656-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220320163930.1566656-1-fontaine.fabrice@gmail.com>
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DAEE08C8B4332C69BD3B54C3E627D4433182A05F538085040AE3A2EFF4E4474E9F035915083D23E6BA6E3879DB71425CB8C53F82A1E5FFBF8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375A514678F9DF65078638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D818104E8963468A0666D1A0E37E17FBA26F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A80DFD3A0D2C7BC9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BDBA3F3F673D6AB81A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CDDB9BF3B882869D543847C11F186F3C59DAA53EE0834AAEE
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A550AF96EEE05914A53E0C43E796C00798BA3DAB466090AE22D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75403D0D5E9DD61F6C410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34FACF503ACC83041BEEE3B7C9BE7BBF964EA19A227FC93608F0F582D7386CDCE152F1D918644E13D51D7E09C32AA3244C126A19A4B63F9E95442440B8157A7388B018FE5BB746DCD1729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojSLL0ldHQsla85zb8JZP1Jw==
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D62085BC7FB17B91D0AFB17DE603CB067298CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: security bump to
 version 2.5.2
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



On 20.03.2022 19:39, Fabrice Fontaine wrote:
> Fix CVE-2022-24128: Timescale TimescaleDB 1.x and 2.x before 2.5.2 may
> allow privilege escalation during extension installation. The
> installation process uses commands such as CREATE x IF NOT EXIST that
> allow an unprivileged user to precreate objects. These objects will be
> used by the installer (which executes as Superuser), leading to
> privilege escalation. In order to be able to take advantage of this, an
> unprivileged user would need to be able to create objects in a database
> and then get a Superuser to install TimescaleDB into their database. (In
> the fixed versions, the installation aborts when it finds that an object
> already exists.)
> 
> "This release contains bug fixes since the 2.5.1 release.
> This release is high priority for upgrade. We strongly recommend that
> you upgrade as soon as possible."
> 
> https://github.com/timescale/timescaledb/releases/tag/2.5.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
