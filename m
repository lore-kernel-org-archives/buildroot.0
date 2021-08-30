Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9785AC432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 00:26:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33B8260C3E
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 00:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33B8260C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=petri.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4A8940001;
	Mon, 30 Aug 2021 00:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6V8y2QHRyxF; Mon, 30 Aug 2021 00:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D900D40012;
	Mon, 30 Aug 2021 00:26:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10A8D1BF29D
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 00:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C10A80D7F
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 00:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UwtIwYKHOTK for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 00:26:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0479380D5D
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 00:26:15 +0000 (UTC)
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <jonah@petri.us>)
 id 1mKV7r-00070d-Ed; Mon, 30 Aug 2021 02:26:11 +0200
Received: by submission03.runbox with esmtpsa [Authenticated ID (799462)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1mKV7Y-00078E-0I; Mon, 30 Aug 2021 02:25:52 +0200
Message-ID: <8ec58237-a9ee-5d95-bf88-305cb5533139@petri.us>
Date: Sun, 29 Aug 2021 20:25:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210826193424.1650108-1-jonah@petri.us>
 <4bdc9d7d-b4ce-4834-c7ef-eff9865f82fb@mind.be>
From: Jonah Petri <jonah@petri.us>
In-Reply-To: <4bdc9d7d-b4ce-4834-c7ef-eff9865f82fb@mind.be>
Subject: Re: [Buildroot] [PATCH v3 1/1] toolchain: handle toolchains with
 multiple ld*.so.* files
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Ck9uIDgvMjkvMjEgMToyMSBQTSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gT24gMjYv
MDgvMjAyMSAyMTozNCwgSm9uYWggUGV0cmkgd3JvdGU6Cj4+ICAgCWZpIDsgXAo+PiAtCWlmIFsg
ISAtZSAkKFNUQUdJTkdfRElSKS9saWIvbGQqLnNvLiogXTsgdGhlbiBcCj4+IC0JCWlmIFsgLWUg
JCR7QVJDSF9TWVNST09UX0RJUn0vbGliL2xkKi5zby4qIF07IHRoZW4gXAo+PiAtCQkJY3AgLWEg
JCR7QVJDSF9TWVNST09UX0RJUn0vbGliL2xkKi5zby4qICQoU1RBR0lOR19ESVIpL2xpYi8gOyBc
Cj4+IC0JCWZpIDsgXAo+PiArCWlmIFtbICEgJCQoZmluZCAkKFNUQUdJTkdfRElSKS9saWIgLW5h
bWUgJ2xkKi5zby4qJyAtcHJpbnQgLXF1aXQpIF1dOyB0aGVuIFwKPiAgIEkgd2FzIGdvaW5nIHRv
IHNheTogZG9uJ3QgdXNlIFtbLCBpdCdzIGEgYmFzaGlzbS4gSG93ZXZlciwgd2UgYWxyZWFkeSB1
c2UgaXQgaW4KPiBoZWxwZXJzLm1rLCBzbyBJIGd1ZXNzIGl0J3MgT0suIEl0J3MgdXAgdG8gd2hv
ZXZlciBoYXMgYSBwcm9ibGVtIHdpdGggaXQgdG8gZ2V0Cj4gcmlkIG9mIGl0IDotKQo+Cj4gICBU
aGVyZWZvcmUsIGFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLgoKVGhhbmtzISBJIGZvdW5kIGl0IHN1
cnByaXNpbmdseSBoYXJkIHRvIGZpbmQgYSBwbGVhc2luZyBzaGVsbCBhbnN3ZXIgdG8gCiJkb2Vz
IHRoaXMgY29tbWFuZCBzdWNjZWVkICphbmQqIG91dHB1dCBhbnl0aGluZyB0byBzdGRvdXQ/IiB3
aXRob3V0IAppbnZva2luZyBiYXNoaXNtcy7CoCBJIHRvbyB3YXMgd2FyeSBvZiB1c2luZyBbWyBi
ZWZvcmUgSSBzYXcgdGhlIHNhbWUgCnVzYWdlIGxvd2VyIGluIHRoZSBmaWxlLCBhbmQgbm90ZWQg
dGhhdCBiYXNoIGlzIGEgcHJlcmVxdWlzaXRlIGZvciAKYnVpbGRyb290IGluIGdlbmVyYWwuwqAg
SG9wZWZ1bGx5IHNvbWUgZnV0dXJlIGRldiB3b24ndCBjdXJzZSBtZSB0b28gbXVjaCAK4pi6IFRo
YW5rcyBmb3IgYXBwbHlpbmchCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApo
dHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
