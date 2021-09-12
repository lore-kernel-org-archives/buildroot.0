Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DCFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:41:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8CC96103D
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8CC96103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7343981BCF;
	Sun, 12 Sep 2021 21:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57VgRzmonYhI; Sun, 12 Sep 2021 21:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD0B181BC0;
	Sun, 12 Sep 2021 21:41:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5AAD1BF3FD
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5622404A9
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjbR_TC6Sc_Z for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 21:40:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3823404A3
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 21:40:58 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PXDcmDG1mnyXHPXDcmA7gE; Sun, 12 Sep 2021 23:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631482856; bh=lWf1JiExBRId4Mb0BwzZR/5t+CxZid/0UoeaALc5ngQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=avnmxeltEOG7jA4j33GmUSbVejjLpwYCth0z+SdfKxhYf7bEuiSeqT2f349gFulpg
 RaKK7toe4SgWo6qsyOydB3GO+DSM/e0JIdZPoao9b+jezQz1lJyqOyBBwkm9xWc7BC
 D9uR7+D0ISFUkqtQCBTF6jIp78+znLJ09KnPFtB5DCGcIKByxui9OW0lGqy5lKIg7i
 PJiI5F/R6SNHWgxVmkDxn/NKGn2UHlOy4K31v5msS2PsXJ8Alhk5YdFxuM4jQWXIgh
 mQko23s3aKOR35mtmOvor9wbkg4GI9s+4xC1O1adX5gqoIlmojqLRKjAumNkEpQzsc
 CvtOEnjc/9jWw==
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210912200706.2884974-1-fontaine.fabrice@gmail.com>
 <bfb503d3-a70e-9e12-6a39-d0d56dbb5e56@benettiengineering.com>
 <60e98119-f7e7-f7d4-0976-ddd62295b068@benettiengineering.com>
 <CAPi7W80iLwuDZGOvNgbebi52xEMznmOgcQjfFNoZMHdAXr0zSw@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <948dbc60-ecfe-3447-dc05-7b247ccc45b4@benettiengineering.com>
Date: Sun, 12 Sep 2021 23:40:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPi7W80iLwuDZGOvNgbebi52xEMznmOgcQjfFNoZMHdAXr0zSw@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfMQQPQivywyeRSoYx6KAF4YfvPyD7sU6i2HCfMzHRP/pJ+l7W8G3m4jfVvMHOlo8vap+0J3Rx+fuYBzOq9kAyND6AgvczyN3GxpiJYfb/RF/8Uvczy0i
 ppsCSF10m1WaLQ57jS4ruEM9Hle2QZQpk207kD3L7fnTyi/NhLa1bI5nzlj33px8JsIzTk1KHwimDySgUaIGtZ7mc/cXIRFx+gnUw1A2pmN3Sez/ZAYZzRxq
 SKFeYr74FtX+CyKYG9JJzWooyWJdBzmY6PkAwxcL6ig=
Subject: Re: [Buildroot] [PATCH 1/1] package/minicom: drop autoreconf
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGkgRmFicmljZSwKCk9uIDkvMTIvMjEgMTE6MzMgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6
Cj4gSGkgR2l1bGlvLAo+IAo+IExlIGRpbS4gMTIgc2VwdC4gMjAyMSDDoCAyMzoxMSwgR2l1bGlv
IEJlbmV0dGkKPiA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gYSDDqWNy
aXQgOgo+Pgo+PiBPbiA5LzEyLzIxIDExOjA5IFBNLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4+
IEhpIEZhYnJpY2UsCj4+Pgo+Pj4gT24gOS8xMi8yMSAxMDowNyBQTSwgRmFicmljZSBGb250YWlu
ZSB3cm90ZToKPj4+PiBhdXRvcmVjb25mIChhbmQgc28gQU1fSUNPTlYpIGlzIG5vdCBuZWVkZWQg
c2luY2UgY29tbWl0Cj4+Pj4gMmRmMzJlMGQ0NDM3YjQyMjE3NTA4OWVkZjE5MTcyMTk2NTZmY2Nl
Zgo+Pj4KPj4+IENhbiB5b3Ugc3BlY2lmeSB0aGUgdXBzdHJlYW0gY29tbWl0IGluc3RlYWQgb2Yg
dGhlIEJ1aWxkcm9vdCBvbmUgaW4KPj4+IGNvbW1pdCBsb2c/Cj4gVGhlcmUgaXMgbm8gdXBzdHJl
YW0gY29tbWl0LCB3ZSBjYW4gZHJvcCBhdXRvcmVjb25mLCBiZWNhdXNlIHdlJ3JlCj4gdXNpbmcg
dGhlIG9mZmljaWFsIHRhcmJhbGwgd2hpY2ggcHJvdmlkZXMgYSBjb25maWd1cmUgc2NyaXB0IHNp
bmNlCj4gYnVpbGRyb290IGNvbW1pdCAyZGYzMmUwZDQ0MzdiNDIyMTc1MDg5ZWRmMTkxNzIxOTY1
NmZjY2VmLgoKQWgsIHBhcmRvbiwgeW91J3JlIHJpZ2h0LCBpdCdzIHRoZSB0YXJiYWxsIGFuZCBp
dCBjb250YWlucyBjb25maWd1cmUgCnNjcmlwdCBhbHJlYWR5IGdlbmVyYXRlZCwgc28gbm8gdXBz
dHJlYW0gY29tbWl0LiBGaW5lLgoKVGhhbmsgeW91IGFuZAoKUmV2aWV3ZWQtYnk6IEdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgoKS2luZCByZWdh
cmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPj4KPj4gQWgg
eWVhaCwgd2l0aCBhIGxpbmsgdG9vLgo+Pgo+PiBUaGFua3MgYSBsb3QKPj4KPj4gLS0KPj4gR2l1
bGlvIEJlbmV0dGkKPj4gQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKPj4KPj4+Cj4+PiBFeGNlcHQg
dGhhdDoKPj4+Cj4+PiBSZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRp
QGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzCj4+Pgo+Pgo+IEJl
c3QgUmVnYXJkcywKPiAKPiBGYWJyaWNlCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGxp
c3RzLmJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
