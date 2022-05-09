Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B4DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 12:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36A05408E2;
	Mon,  9 May 2022 12:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bNSX1VlqACAM; Mon,  9 May 2022 12:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14E8A40734;
	Mon,  9 May 2022 12:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A21A1BF2F9
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 12:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB18D40734
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 12:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccv83BFT2wHo for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 12:54:38 +0000 (UTC)
X-Greylist: delayed 02:00:01 by SQLgrey-1.8.0
Received: from e2i465.smtp2go.com (e2i465.smtp2go.com [103.2.141.209])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D066405B5
 for <buildroot@buildroot.org>; Mon,  9 May 2022 12:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=smtpcorp.com; s=a1-4; h=List-Unsubscribe:Feedback-ID:From:To:Subject:Date:
 Message-ID:Reply-To:Sender:X-Smtpcorp-Track;
 bh=sm3VdJmu22eC5yH+Hq0nmfQ8929CQmURip1cBI6Uh48=; b=ihNXhq/vGvjaf1gvF5qtlbtPcX
 UriRMsR7a3R3TOvpuXkQQ3uFpdq3LBm+O5azHWaWiGJJVtLNOj6Xl9bFdCsyQu9pXv4QNUgGFewQT
 UeKUytbFHh5ZdgZ1L3whe4bYek1hHZUCma8cDgOZxFqCJLsC1Sg4MVsMNOUlyuE4iiW11BZOskYEs
 QfbjQhNGfmuNA7J+2mQre4FXoiqTkyifvfiNrsDNlNN9qdZuqqkZaqhiemIYWLR9DsmiizVCrSN6G
 YhM8L5SjNiNGg0cdp27n9IimDWQVngqZn/9PGDOKJ700O/Z0/O08dET8a8OyJVLexTWnsiLA6iw/x
 eReI6XUA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonifex.co.uk;
 i=@sonifex.co.uk; q=dns/txt; s=s592615; t=1652100878; h=from : subject
 : to : message-id : date;
 bh=sm3VdJmu22eC5yH+Hq0nmfQ8929CQmURip1cBI6Uh48=;
 b=iquaEN4az4YESrnIGwiAv/Wpbi8OECGdPfuebXgZNhlYp5yYKEgNeQLQU0VOvRElfnLET
 M1v9ALI0tHwZz2jOtBHOZ3jEQM1aAkP0Uakm357Fe3hANoH4fRreBMj4EDH/FigoZbG50tj
 v/G2lTQcQeoIqfEGkMyVc67HRSIx2lR9Z6ojH/E+eNG1bsCGN0bwwyenFAzw7thgnitrbNm
 BMvyHblmawikItDNTJT7Z+GYxQwkmQJuvvWTv4PxhiypmJYDe0dmqNEDODd8INgVgh/ce5O
 rhjqGl0ExNGbXPLlKbovoYsmtcjXM/s8KxUGc7/N6LEDkf9qtqYxCiAn9yNQ==
Received: from [10.45.33.53] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1no124-TRk4zJ-Ce; Mon, 09 May 2022 10:54:28 +0000
Received: from [10.87.224.66] (helo=NETHMAIL.sonifex.co.uk)
 by smtpcorp.com with esmtpsa (TLS1.2:DHE_RSA_2038__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <wesley@sonifex.co.uk>)
 id 1no122-rlZFYS-DU; Mon, 09 May 2022 10:54:26 +0000
Received: from [192.168.0.19] (unknown [192.168.0.19])
 (Authenticated sender: wesley.revens@sonifex.co.uk)
 by NETHMAIL.sonifex.co.uk (Postfix) with ESMTPSA id 6A8E880C2085;
 Mon,  9 May 2022 11:54:22 +0100 (BST)
Message-ID: <f4f5acff-c577-b7cd-c708-4415c2a08b4c@sonifex.co.uk>
Date: Mon, 9 May 2022 11:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
 <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
 <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Wesley Revens <wesley@sonifex.co.uk>
In-Reply-To: <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
Feedback-ID: 592615m:592615abMtQZZ:592615sHGBV5TFLK
X-Report-Abuse: Please forward a copy of this message, including all headers, 
 to <abuse-report@smtp2go.com>
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwKCk9uIDA5LzA1LzIwMjIgMTA6MjIsIE5lYWwgRnJhZ2VyIHdyb3RlOgo+IEhpIFdl
c2xleSwKPgo+PiBVLUJvb3QgMjAyMi4wMSAoTWF5IDA5IDIwMjIgLSAwOTo1MTo0MyArMDEwMCkK
Pj4gQ1BVOiAgIFp5bnFNUAo+PiBTaWxpY29uOiB2Mwo+PiBQTVVGVyBubyBwZXJtaXNzaW9uIHRv
IGNoYW5nZSBjb25maWcgb2JqZWN0IERldGVjdGVkIG5hbWU6IHp5bnFtcC1zbWstazI2LXhjbDJn
LXJldjEtc2NrLWt2LWctcmV2MQo+IEkgYW0gd29ya2luZyBvbiB0aGlzIGluIHBhcmFsbGVsIHdp
dGggeW91LiAgSSBiZWxpZXZlIHlvdXIgcmVtYWluaW5nIGlzc3VlIGlzIGR1ZSB0byB0aGUgcG11
IGZpcm13YXJlLgo+Cj4gSSB3YXMgbm90IGF3YXJlIHRoYXQgd2UgaGFkIGNoYW5nZWQgdGhlIGJ1
aWxkIG9wdGlvbnMgZm9yIHRoZSBwbXUgZmlybXdhcmUgZm9yIGtyaWEsIHNvIHVzaW5nIGEgc3Rh
bmRhcmQgenlucW1wIHBtdSBmaXJtd2FyZSB3aWxsIGZhaWwuCj4KPiBUaGlzIGlzIHdoYXQgSSBj
dXJyZW50bHkgaGF2ZSBpbmNsdWRlZCBhcyBpdCBpcyBkb3dubG9hZGluZyBhIHByZS1idWlsZCBz
dGFuZGFyZCB6eW5xbXAgcG11IGZpcm13YXJlLgo+Cj4gSW5zdGVhZCwgaWYgeW91IHRha2UgdGhl
IHBtdSBmaXJtd2FyZSBmcm9tIHBldGFsaW51eCwgY29udmVydCBpdCB0byBhIGJpbiB1c2luZyBv
Ympjb3B5IGFuZCBwbGFjZSB0aGlzIHBtdWZ3LmJpbiBpbiB5b3VyIGJ1aWxkcm9vdCBkbC91Ym9v
dCBkaXJlY3RvcnksCj4gdGhpcyB3aWxsIGVuYWJsZSB0aGUgY29ycmVjdCBwbXVmdyBnZXR0aW5n
IGluY2x1ZGVkIHdpdGggeW91ciBzcGwgaW4geW91ciBib290LmJpbiBnZW5lcmF0aW9uLgo+Cj4g
Q291bGQgeW91IGdpdmUgdGhpcyBhIHRyeSBhbmQgbGV0IG1lIGtub3cgaG93IHlvdSBwcm9ncmVz
cz8KPgo+IEJlc3QgcmVnYXJkcywKPiBOZWFsIEZyYWdlcgo+IEFNRAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CkkgaW5pdGlhbGx5IHRyaWVkIHVzaW5nIHBtdWZ3
IGZyb20gdGhlIHhpbGlueC1rMjYtc3RhcnRlcmtpdC0yMDIxLjEgCnBldGFsaW51eCBCU1AKYnV0
IHRoYXQgZmFpbGVkLiBTbyBJIHRyaWVkIHRoZSBwbXVmdyBmcm9tIHRoZSAyMDIyLjEgQlNQIGlu
c3RlYWQgYW5kIApoYXZlIG5vdyBtYWRlIHNvbWUgbW9yZSBwcm9ncmVzcy4KCk15IGJvYXJkIGlz
IGJvb3RpbmcgdG8gYSB1LWJvb3QgcHJvbXB0IG5vdyBidXQgbm90IGNvbnRpbnVpbmcgaW50byBM
aW51eCAKZnJvbSB0aGUgU0QgY2FyZC4KCkhlcmUgaXMgbXkgY29uc29sZSBvdXRwdXQ6CgpVLUJv
b3QgU1BMIDIwMjIuMDEgKE1heSAwOSAyMDIyIC0gMTE6NDc6NTggKzAxMDApClBNVUZXOsKgIHYx
LjEKTG9hZGluZyBuZXcgUE1VRlcgY2ZnIG9iaiAoMjAxNiBieXRlcykKU2lsaWNvbiB2ZXJzaW9u
OsKgwqDCoMKgwqDCoMKgIDMKRUwgTGV2ZWw6wqDCoMKgwqDCoMKgIEVMMwpDaGlwIElEOsKgwqDC
oMKgwqDCoMKgIHhjazI2Ck11bHRpYm9vdDrCoMKgwqDCoMKgIDY0ClRyeWluZyB0byBib290IGZy
b20gU1BJCk5PVElDRTrCoCBCTDMxOiB2Mi42KHJlbGVhc2UpOgpOT1RJQ0U6wqAgQkwzMTogQnVp
bHQgOiAwOTo1MTowOSwgTWF5wqAgOSAyMDIyCgoKVS1Cb290IDIwMjIuMDEgKE1heSAwOSAyMDIy
IC0gMTE6NDc6NTggKzAxMDApCgpDUFU6wqDCoCBaeW5xTVAKU2lsaWNvbjogdjMKUE1VRlcgbm8g
cGVybWlzc2lvbiB0byBjaGFuZ2UgY29uZmlnIG9iamVjdApEZXRlY3RlZCBuYW1lOiB6eW5xbXAt
c21rLWsyNi14Y2wyZy1yZXYxLXNjay1rdi1nLXJldjEKTW9kZWw6IEF2bmV0IFVsdHJhOTYgUmV2
MQpCb2FyZDogWGlsaW54IFp5bnFNUApEUkFNOsKgIDIgR2lCClBNVUZXOsKgIHYxLjEKRUwgTGV2
ZWw6wqDCoMKgwqDCoMKgIEVMMgpDaGlwIElEOsKgwqDCoMKgwqDCoMKgIHhjazI2ClBNVUZXIG5v
IHBlcm1pc3Npb24gdG8gY2hhbmdlIGNvbmZpZyBvYmplY3QKTkFORDrCoCAwIE1pQgpNTUM6wqDC
oCBQTVVGVyBubyBwZXJtaXNzaW9uIHRvIGNoYW5nZSBjb25maWcgb2JqZWN0ClBNVUZXIG5vIHBl
cm1pc3Npb24gdG8gY2hhbmdlIGNvbmZpZyBvYmplY3QKbW1jQGZmMTYwMDAwOiAwLCBtbWNAZmYx
NzAwMDA6IDEKTG9hZGluZyBFbnZpcm9ubWVudCBmcm9tIFNQSUZsYXNoLi4uIFBNVUZXIG5vIHBl
cm1pc3Npb24gdG8gY2hhbmdlIApjb25maWcgb2JqZWN0CnNwaV94ZmVyOiBUaW1lb3V0ISBUWCBG
SUZPIG5vdCBmdWxsCioqKiBXYXJuaW5nIC0gc3BpX2ZsYXNoX3Byb2JlX2J1c19jcygpIGZhaWxl
ZCwgdXNpbmcgZGVmYXVsdCBlbnZpcm9ubWVudAoKSW46wqDCoMKgIHNlcmlhbApPdXQ6wqDCoCBz
ZXJpYWwKRXJyOsKgwqAgc2VyaWFsClBNVUZXIG5vIHBlcm1pc3Npb24gdG8gY2hhbmdlIGNvbmZp
ZyBvYmplY3QKQm9vdG1vZGU6IFFTUElfTU9ERQpSZXNldCByZWFzb246wqDCoCBTT0ZUCk5ldDrC
oMKgIE5vIGV0aGVybmV0IGZvdW5kLgpzY2FubmluZyBidXMgZm9yIGRldmljZXMuLi4KSGl0IGFu
eSBrZXkgdG8gc3RvcCBhdXRvYm9vdDrCoCAwCnNwaV94ZmVyOiBUaW1lb3V0ISBUWCBGSUZPIG5v
dCBmdWxsCkZhaWxlZCB0byBpbml0aWFsaXplIFNQSSBmbGFzaCBhdCAwOjAgKGVycm9yIC0yKQpR
U1BJOiBTQ1JJUFQgRkFJTEVEOiBjb250aW51aW5nLi4uCkpUQUc6IFRyeWluZyB0byBib290IHNj
cmlwdCBhdCAyMDAwMDAwMAojIyBFeGVjdXRpbmcgc2NyaXB0IGF0IDIwMDAwMDAwCldyb25nIGlt
YWdlIGZvcm1hdCBmb3IgInNvdXJjZSIgY29tbWFuZApKVEFHOiBTQ1JJUFQgRkFJTEVEOiBjb250
aW51aW5nLi4uCkNhcmQgZGlkIG5vdCByZXNwb25kIHRvIHZvbHRhZ2Ugc2VsZWN0ISA6IC0xMTAK
ZmFpbGVkIHRvIHNldCB2cW1tYy12b2x0YWdlIHRvIDMuM1YKZmFpbGVkIHRvIHNldCB2cW1tYy12
b2x0YWdlIHRvIDMuM1YKZmFpbGVkIHRvIHNldCB2cW1tYy12b2x0YWdlIHRvIDMuM1YKZmFpbGVk
IHRvIHNldCB2cW1tYy12b2x0YWdlIHRvIDMuM1YKZmFpbGVkIHRvIHNldCB2cW1tYy12b2x0YWdl
IHRvIDMuM1YKZmFpbGVkIHRvIHNldCB2cW1tYy12b2x0YWdlIHRvIDMuM1YKQ2FyZCBkaWQgbm90
IHJlc3BvbmQgdG8gdm9sdGFnZSBzZWxlY3QhIDogLTExMApzcGlfeGZlcjogVGltZW91dCEgVFgg
RklGTyBub3QgZnVsbApGYWlsZWQgdG8gaW5pdGlhbGl6ZSBTUEkgZmxhc2ggYXQgMDowIChlcnJv
ciAtMikKUVNQSTogU0NSSVBUIEZBSUxFRDogY29udGludWluZy4uLgoKCm5vIGRldmljZXMgYXZh
aWxhYmxlCk5BTkQ6IFNDUklQVCBGQUlMRUQ6IGNvbnRpbnVpbmcuLi4Kc3RhcnRpbmcgVVNCLi4u
CkJ1cyB1c2JAZmUzMDAwMDA6IFBNVUZXIG5vIHBlcm1pc3Npb24gdG8gY2hhbmdlIGNvbmZpZyBv
YmplY3QKcHNndHJfcGh5IHBoeUBmZDQwMDAwMDogbGFuZSAzICh0eXBlIDEsIHByb3RvY29sIDMp
OiBQTEwgbG9jayB0aW1lb3V0CnBzZ3RyX3BoeSBwaHlAZmQ0MDAwMDA6IFBIWTogRmFpbGVkIHRv
IHBvd2VyIG9uIHBoeUBmZDQwMDAwMDogLTExMC4KcHJvYmUgZmFpbGVkLCBlcnJvciAtMTEwCk5v
IHdvcmtpbmcgY29udHJvbGxlcnMgZm91bmQKVVNCIGlzIHN0b3BwZWQuIFBsZWFzZSBpc3N1ZSAn
dXNiIHN0YXJ0JyBmaXJzdC4Kc3RhcnRpbmcgVVNCLi4uCkJ1cyB1c2JAZmUzMDAwMDA6IFBNVUZX
IG5vIHBlcm1pc3Npb24gdG8gY2hhbmdlIGNvbmZpZyBvYmplY3QKcHNndHJfcGh5IHBoeUBmZDQw
MDAwMDogbGFuZSAzICh0eXBlIDEsIHByb3RvY29sIDMpOiBQTEwgbG9jayB0aW1lb3V0CnBzZ3Ry
X3BoeSBwaHlAZmQ0MDAwMDA6IFBIWTogRmFpbGVkIHRvIHBvd2VyIG9uIHBoeUBmZDQwMDAwMDog
LTExMC4KcHJvYmUgZmFpbGVkLCBlcnJvciAtMTEwCk5vIHdvcmtpbmcgY29udHJvbGxlcnMgZm91
bmQKVVNCIGlzIHN0b3BwZWQuIFBsZWFzZSBpc3N1ZSAndXNiIHN0YXJ0JyBmaXJzdC4KCkRldmlj
ZSAwOiB1bmtub3duIGRldmljZQpzdGFydGluZyBVU0IuLi4KQnVzIHVzYkBmZTMwMDAwMDogUE1V
Rlcgbm8gcGVybWlzc2lvbiB0byBjaGFuZ2UgY29uZmlnIG9iamVjdApwc2d0cl9waHkgcGh5QGZk
NDAwMDAwOiBsYW5lIDMgKHR5cGUgMSwgcHJvdG9jb2wgMyk6IFBMTCBsb2NrIHRpbWVvdXQKcHNn
dHJfcGh5IHBoeUBmZDQwMDAwMDogUEhZOiBGYWlsZWQgdG8gcG93ZXIgb24gcGh5QGZkNDAwMDAw
OiAtMTEwLgpwcm9iZSBmYWlsZWQsIGVycm9yIC0xMTAKTm8gd29ya2luZyBjb250cm9sbGVycyBm
b3VuZApObyBldGhlcm5ldCBmb3VuZC4KbWlzc2luZyBlbnZpcm9ubWVudCB2YXJpYWJsZTogcHhl
dXVpZApSZXRyaWV2aW5nIGZpbGU6IHB4ZWxpbnV4LmNmZy8wMDAwMDAwMApObyBldGhlcm5ldCBm
b3VuZC4KUmV0cmlldmluZyBmaWxlOiBweGVsaW51eC5jZmcvMDAwMDAwMApObyBldGhlcm5ldCBm
b3VuZC4KUmV0cmlldmluZyBmaWxlOiBweGVsaW51eC5jZmcvMDAwMDAwCk5vIGV0aGVybmV0IGZv
dW5kLgpSZXRyaWV2aW5nIGZpbGU6IHB4ZWxpbnV4LmNmZy8wMDAwMApObyBldGhlcm5ldCBmb3Vu
ZC4KUmV0cmlldmluZyBmaWxlOiBweGVsaW51eC5jZmcvMDAwMApObyBldGhlcm5ldCBmb3VuZC4K
UmV0cmlldmluZyBmaWxlOiBweGVsaW51eC5jZmcvMDAwCk5vIGV0aGVybmV0IGZvdW5kLgpSZXRy
aWV2aW5nIGZpbGU6IHB4ZWxpbnV4LmNmZy8wMApObyBldGhlcm5ldCBmb3VuZC4KUmV0cmlldmlu
ZyBmaWxlOiBweGVsaW51eC5jZmcvMApObyBldGhlcm5ldCBmb3VuZC4KUmV0cmlldmluZyBmaWxl
OiBweGVsaW51eC5jZmcvZGVmYXVsdC1hcm0tenlucW1wLXp5bnFtcApObyBldGhlcm5ldCBmb3Vu
ZC4KUmV0cmlldmluZyBmaWxlOiBweGVsaW51eC5jZmcvZGVmYXVsdC1hcm0tenlucW1wCk5vIGV0
aGVybmV0IGZvdW5kLgpSZXRyaWV2aW5nIGZpbGU6IHB4ZWxpbnV4LmNmZy9kZWZhdWx0LWFybQpO
byBldGhlcm5ldCBmb3VuZC4KUmV0cmlldmluZyBmaWxlOiBweGVsaW51eC5jZmcvZGVmYXVsdApO
byBldGhlcm5ldCBmb3VuZC4KQ29uZmlnIGZpbGUgbm90IGZvdW5kCnN0YXJ0aW5nIFVTQi4uLgpC
dXMgdXNiQGZlMzAwMDAwOiBQTVVGVyBubyBwZXJtaXNzaW9uIHRvIGNoYW5nZSBjb25maWcgb2Jq
ZWN0CnBzZ3RyX3BoeSBwaHlAZmQ0MDAwMDA6IGxhbmUgMyAodHlwZSAxLCBwcm90b2NvbCAzKTog
UExMIGxvY2sgdGltZW91dApwc2d0cl9waHkgcGh5QGZkNDAwMDAwOiBQSFk6IEZhaWxlZCB0byBw
b3dlciBvbiBwaHlAZmQ0MDAwMDA6IC0xMTAuCnByb2JlIGZhaWxlZCwgZXJyb3IgLTExMApObyB3
b3JraW5nIGNvbnRyb2xsZXJzIGZvdW5kCk5vIGV0aGVybmV0IGZvdW5kLgpObyBldGhlcm5ldCBm
b3VuZC4KWnlucU1QPgpUbyB1bnN1YnNjcmliZSBjbGljazogaHR0cDovL2xpbmsuc29uaWZleC5j
by51ay91cy8/ZT0xbm8xMjJyX1pGWVNEbC4tQ0xYY2ZnRjNEY1NzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
