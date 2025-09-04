Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7576CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 15:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E5F7401F4;
	Thu,  4 Sep 2025 15:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lR1ewEpkH7Kw; Thu,  4 Sep 2025 15:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83501401EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83501401EF;
	Thu,  4 Sep 2025 15:56:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DBA1106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C822605C0
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKgHcRcq-a3R for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 15:56:18 +0000 (UTC)
X-Greylist: delayed 567 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 04 Sep 2025 15:56:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05FC3605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FC3605A7
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org;
 envelope-from=srs0=jlkb=3p=kaod.org=clg@ozlabs.org; receiver=<UNKNOWN> 
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05FC3605A7
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:56:17 +0000 (UTC)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4cHkP13RQGz4wB6
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 01:46:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHkP03mnsz4w9S;
 Fri,  5 Sep 2025 01:46:44 +1000 (AEST)
Message-ID: <7a1c152c-c9b9-4cac-a985-bd30f3254feb@kaod.org>
Date: Thu, 4 Sep 2025 17:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joel Stanley <joel@jms.id.au>
Cc: buildroot@buildroot.org
References: <20250831123953.391803-1-clg@kaod.org>
 <20250831123953.391803-2-clg@kaod.org>
 <CACPK8XdQnx822DzoWLGrE6PyfcL=e=ZP4kAaAgOE40+Zazpctg@mail.gmail.com>
 <6e35067b-0403-49d9-b706-d47ca3eb519b@kaod.org>
 <CACPK8XeRG6AaF9TzjNqG7-UyEHECKfL9usPP--_owwDixsXJZw@mail.gmail.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Language: en-US, fr
Autocrypt: addr=clg@kaod.org; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSBDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQGthb2Qub3JnPsLBeAQTAQIAIgUCW7yjdQIbAwYLCQgHAwIGFQgCCQoL
 BBYCAwECHgECF4AACgkQUaNDx8/77KGRSxAAuMJJMhJdj7acTcFtwof7CDSfoVX0owE2FJdd
 M43hNeTwPWlV5oLCj1BOQo0MVilIpSd9Qu5wqRD8KnN2Bv/rllKPqK2+i8CXymi9hsuzF56m
 76wiPwbsX54jhv/VYY9Al7NBknh6iLYJiC/pgacRCHtSj/wofemSCM48s61s1OleSPSSvJE/
 jYRa0jMXP98N5IEn8rEbkPua/yrm9ynHqi4dKEBCq/F7WDQ+FfUaFQb4ey47A/aSHstzpgsl
 TSDTJDD+Ms8y9x2X5EPKXnI3GRLaCKXVNNtrvbUd9LsKymK3WSbADaX7i0gvMFq7j51P/8yj
 neaUSKSkktHauJAtBNXHMghWm/xJXIVAW8xX5aEiSK7DNp5AM478rDXn9NZFUdLTAScVf7LZ
 VzMFKR0jAVG786b/O5vbxklsww+YXJGvCUvHuysEsz5EEzThTJ6AC5JM2iBn9/63PKiS3ptJ
 QAqzasT6KkZ9fKLdK3qtc6yPaSm22C5ROM3GS+yLy6iWBkJ/nEYh/L/du+TLw7YNbKejBr/J
 ml+V3qZLfuhDjW0GbeJVPzsENuxiNiBbyzlSnAvKlzda/sBDvxmvWhC+nMRQCf47mFr8Xx3w
 WtDSQavnz3zTa0XuEucpwfBuVdk4RlPzNPri6p2KTBhPEvRBdC9wNOdRBtsP9rAPjd52d73O
 wU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhWpOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNL
 SoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZKXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVU
 cP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwpbV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+
 S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc
 9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFUCSLB2AE4wXQkJbApye48qnZ09zc929df5gU6
 hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iSYBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616d
 tb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6gLxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/
 t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1c
 OY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0SdujWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475
 KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/JxIqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8
 o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoX
 ywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjKyKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0
 IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9jhQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Ta
 d2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yops302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it
 +OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/pLHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1n
 HzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBUwYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVIS
 l73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lUXOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY
 3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfAHQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4Pls
 ZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQizDiU6iOrUzBThaMhZO3i927SG2DwWDVzZlt
 KrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gDuVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CACPK8XeRG6AaF9TzjNqG7-UyEHECKfL9usPP--_owwDixsXJZw@mail.gmail.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: Re: [Buildroot] [PATCH 1/4] configs/aspeed-*: bump Linux to 6.16.4
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOS80LzI1IDA2OjU5LCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gT24gV2VkLCAzIFNlcHQgMjAy
NSBhdCAxNDozMiwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cj4+Cj4+
IE9uIDkvMy8yNSAwMTowMSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+Pj4gT24gU3VuLCAzMSBBdWcg
MjAyNSBhdCAyMjoxMSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cj4+
Pj4KPj4+PiBTaW5jZSBMaW51eCA2LjUgbW92ZWQgLmR0cyBmaWxlcyB0byB2ZW5kb3Igc3ViLWRp
cmVjdG9yaWVzLCBhZGp1c3QgdGhlCj4+Pj4gcG9zdC1pbWFnZS5zaCBzY3JpcHQgdG8gdGFrZSBp
bnRvIGFjY291bnQgdGhlICdhc3BlZWQvJyBwcmVmaXggaW4gLmR0cwo+Pj4+IGZpbGUgbmFtZXMu
Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3Jn
Pgo+Pj4KPj4+IElzIGl0IGN1c3RvbWFyeSB0byB1c2UgYSBzcGVjaWZpYyB2ZXJzaW9uPyBJZiBu
b3QsIGxlYXZpbmcgdGhlc2UKPj4+IGJvYXJkcyB0byB1c2UgdGhlIGRlZmF1bHRzIHdvdWxkIG1h
a2Ugc2Vuc2UgYW5kIHNhdmUgaGF2aW5nIHRvIHVwZGF0ZQo+Pj4gdGhlbSBpbiB0aGUgZnV0dXJl
Lgo+Pgo+PiBBbGwga2VybmVscyBhYm92ZSB2Ni41IG5lZWQgaXQgYW5kIEkgZG91YnQgb25lIHdv
dWxkIHdhbnQgdG8gdXNlCj4+IGFueXRoaW5nIGJlbG93IHY2LjYuIHY2LjYgaGFzIGJlZW4gdGhl
IGJhc2UgdmVyc2lvbiBvZiB0aGUgU0RLCj4+IGFuZCBPcGVuQk1DIGtlcm5lbCBmb3IgYSB3aGls
ZSBub3cuCj4gCj4gSSB3YXMgc3VnZ2VzdGluZyB3ZSBkb24ndCBzcGVjaWZ5IHRoZSB2ZXJzaW9u
IGluIHRoZSBhc3BlZWQgY29uZmlncy4KPiBJdCB3b3VsZCB0aGVuIHBpY2sgdXAgdGhlIGRlZmF1
bHQgd2hpY2ggaXMgNi4xNiBhdCB0aGUgbW9tZW50LCBidXQKPiB3b3VsZCBtb3ZlIGZvcndhcmQg
d2l0aG91dCBpbnRlcnZlbnRpb24gKGEgcG9zaXRpdmUgdGhpbmcpLgoKb2guIHllcy4gVGhhdCB3
b3JrcyB0b28gYnV0IEkgZGlkbid0IHNlZSBhbnkgb3RoZXIgY29uZmlncyAqbm90KgpzcGVjaWZ5
aW5nIGEgTGludXggdmVyc2lvbiwgb2ZmaWNpYWwgb3IgY3VzdG9tLiBUaGUgbWFpbnRhaW5lcnMK
c2hvdWxkIHRlbGwgdXMgaWYgdGhpcyBpcyBwb3NzaWJsZS4KCgpUaGFua3MsCgpDLgoKICAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
