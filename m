Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CC6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 06:02:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE5460F45
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 06:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CE5460F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECD19401FF;
	Mon,  6 Sep 2021 06:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grNUmRVhUJ01; Mon,  6 Sep 2021 06:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2033E400ED;
	Mon,  6 Sep 2021 06:02:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3DE61BF3BD
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 06:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADC56400ED
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 06:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CX1EWRL0eZbW for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 06:01:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fallback16.mail.ru (fallback16.mail.ru [94.100.177.128])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB910400BB
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 06:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=MO0azZgDVJKc8kUU04viYfBZJnS2DyJaJ/EuPiptAsM=; 
 t=1630908117;x=1631513517; 
 b=JLQ5y3XQxGza2dy4BrRT7N7xjPkyHdeh1NbuNDTws0xhq4I2bdRkLU+vBJyLK7FghSzIlUc6nw3IGqRvjOpJ6o9ONX1qCGt10XWWvHg9WJKFHpUaduEueKsR8vNHV5JEolFbiYIIJpHMLMJQqyf9Bfszh7fLbeRLbttyG2QF2lA=;
Received: from [10.161.55.49] (port=33378 helo=smtpng1.i.mail.ru)
 by fallback16.i with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1mN7ha-0001C5-R2
 for buildroot@buildroot.org; Mon, 06 Sep 2021 09:01:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=MO0azZgDVJKc8kUU04viYfBZJnS2DyJaJ/EuPiptAsM=; 
 t=1630908114;x=1631513514; 
 b=cOtWIxMeAao2VazBIPEixR9R3ViR6risNgZIJvEVwVmN//3eUZBew+tQ6uxT7rfDLNX/MSsYkUcT0QRrdzENkz8Id8pbjOBoOxTQ0HF8/xjIJ9eSgetXuEWGu7QSKtcU6gm3M3zOzF41E24/3/xSY84jd/qBJ7jcTc+m6ScvfPxmci23TGCcqN75AZi/+2zYDxVSxHNqt3qNjSUkUc3edkc87jy/e4HZZbAQK4bs2an5c5CWvD9s0nVWe5lQDfNYEBc1vysuIeCEMlkmhPzgnqGNTQx8h69FeeQoay1sVWQnypM0U5v0VoWmG7rUrza72pdriJ4h8hBMUAK6hLEJ3A==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1mN7hQ-00063J-Q1; Mon, 06 Sep 2021 09:01:45 +0300
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905084045.557846-1-fontaine.fabrice@gmail.com>
Message-ID: <fb243ba7-34e3-387c-e354-bcf66e6ead4e@inbox.ru>
Date: Mon, 6 Sep 2021 09:01:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210905084045.557846-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9D96C1EA41D18F4D5024F685B875086397E6085D2F3B7D615182A05F5380850409831534B9D6FBB19F5245E93208C014B668DDBF8048EFA9B321D3CCFC34C55EF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7922D113DFDC6D5A3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637575C0790A70C4B158638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E88921DEA8ED1603B991835D9F0563576F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE71DD432BB81541BCF9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B292D688DDAD4E7BC389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4931B544F03EFBC4D57F67BA0E7924E9B8DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5B43D7D683F9DB4595266478D062CF534893F8102D54BCEC3D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B8DF8BCBF3A9906F410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34D1AE09A115117C96DECEE714428469C41E1EB5AB382E1B1B74999B1AC1E0D8D0FE55EA148BFA6CE41D7E09C32AA3244CB6B4EE724EDE49F0FC8119525D3124E533C9DC155518937F729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2BdsxQzaueXHCbH4Yr08ag==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D4AF07DD915DAE1A5BC548F05C692442A98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888E0D4ABDE8C577C2ED
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B41CF6D121B75A86E92788D9037C8C289A3A1D153059364B3C049FFFDB7839CE9E499B4A5ABE7DBED5A414CF24028AD94A13FAA89A45752AB0BA51F6C3FEF9F2CD
X-7FA49CB5: 0D63561A33F958A53B00D7000DE9D26523E73ACC233F2F1C91BF9BA4AE468567CACD7DF95DA8FC8BD5E8D9A59859A8B64867147855D7D54E
X-C1DE0DAB: 0D63561A33F958A53B00D7000DE9D26523E73ACC233F2F1C76CC52AB2D5D3122D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFda9ew2E0E1qx8HSHGccd6NQ==
X-Mailru-MI: 800
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: needs gcc >= 4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@lists.buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CgowNS4wOS4yMDIxIDExOjQwLCBGYWJyaWNlIEZvbnRhaW5lINC/0LjRiNC10YI6Cj4gb3NtMnBn
c3FsIG5lZWRzIEMrKzE0IHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiAxLjUuMSBpbiBjb21taXQKPiBh
NzE2NjFmZmIyMTZjNzQyM2RjZDAyZWM5ZThkNzAzMjUyZGJjYmFkIGFuZAo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuc3RyZWV0bWFwL29zbTJwZ3NxbC9jb21taXQvZDM1ZGQzNThkNmU0YTg4YTc5
MmJlNjBjODViZjU1ZDIzNjBjMWE3MQo+IHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFp
bHVyZToKPiAKPiAvaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0LTEv
YnVpbGQvb3NtMnBnc3FsLTEuNS4xL3NyYy9kYi1jb3B5LmNwcDogSW4gbWVtYmVyIGZ1bmN0aW9u
ICd2b2lkIGRiX2NvcHlfdGhyZWFkX3Q6OnN5bmNfYW5kX3dhaXQoKSc6Cj4gL2hvbWUvYnVpbGRy
b290L2F1dG9idWlsZC9pbnN0YW5jZS0xL291dHB1dC0xL2J1aWxkL29zbTJwZ3NxbC0xLjUuMS9z
cmMvZGItY29weS5jcHA6MTA4OjE2OiBlcnJvcjogJ21ha2VfdW5pcXVlJyBpcyBub3QgYSBtZW1i
ZXIgb2YgJ3N0ZCcKPiAgICAgICBhZGRfYnVmZmVyKHN0ZDo6bWFrZV91bmlxdWU8ZGJfY21kX3N5
bmNfdD4oc3RkOjptb3ZlKGJhcnJpZXIpKSk7Cj4gICAgICAgICAgICAgICAgICBeCj4gCj4gRml4
ZXM6Cj4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzMwYWU0Yjk0
MDU0NTQ5MTk0MzcwOThkMjlhYmJkNzQzNjM4Yzk0MjMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBN
YXhpbSBLb2NoZXRrb3YgPGZpZG9fbWF4QGluYm94LnJ1PgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
