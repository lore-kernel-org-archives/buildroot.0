Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02A5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 21:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41BBF40328;
	Mon, 17 Jan 2022 21:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sS0LEruWH01; Mon, 17 Jan 2022 21:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1443D4031F;
	Mon, 17 Jan 2022 21:06:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9AE61BF388
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A57E840384
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFM3_fCn-loH for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 21:06:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFE2840285
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 21:06:37 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9ZD2nDqaCBBmw9ZD2nwsGT; Mon, 17 Jan 2022 22:06:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642453596; bh=kJ73ta8XnCA/GhAwfrYfbDrh7Z2r23yecwrU653QObA=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=FFGoMIJ156Ojk2VrH0Exn8P5DkaczZsHDm4BoNIEGb3n1KRieWuAGmQ5Yus7XfqQz
 CZjpyI2rOImFM5OPSClPRYTeuCHjy4CnEzDxSIOGSsdc8JOfLyD/CuMviKoHIAAFD3
 P5adqYGA0l6pvDkOTSlhrVDciW9F89CupscdmzdoLUBlxK46b/duBOdjMuhtvuQQoy
 IzbjOK6D5u6FXksTvEQ8spg6+UtWYIWyl7GKWhs3Syu9KB4/K27L048xYFOVUdWEbb
 QuDYh9o++0xckYZ9czuOKMI4YaYVHvVDAKVlBm2j2vWYN0NKHTA38YgSLRVAeTFqKv
 sYdl846wRFLtg==
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
References: <20220116112600.28441-1-kuzminov.sergey81@gmail.com>
 <300B22A3-0051-4FF0-8B59-499BC08C6A7C@benettiengineering.com>
 <78e0fe75-0ecc-51ce-6270-d6f228cfdbaf@gmail.com>
 <759da9ea-e1b8-353c-9745-1f9d91038f08@benettiengineering.com>
 <5abde9b8-d7de-ceb7-10bb-136f3f5992f1@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <3d6ebc46-f664-6125-b378-59c2d9535441@benettiengineering.com>
Date: Mon, 17 Jan 2022 22:06:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5abde9b8-d7de-ceb7-10bb-136f3f5992f1@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFaKMUAZTtrUgD5ke8cXY7rPO/Jn97z/turGISeBrRpIfE9j4ZJSozbOTsnda5DINQ9dcdUmlSn+jT7dyAbzT2OqZkBZCjwSYnKFqzEQyps347srXU9T
 xDqHidA16qG1cyQw8L7Td3uZ7yTzzb1+3WL3SMQYymNjRnx11KEzDKk0y46/taVhGWM+4Q+Q6D/vaqA1DgP2roBcEU2SdqK0rTkPv75zJ2/xyXc9LwzLm243
 2McOsJWPwFIrEyPNPWOfTQ==
Subject: Re: [Buildroot] [PATCH] board/orangepi/orangepi-zero:extlinux,
 refactoring
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU2VyZ2V5LAoKcGxlYXNlIGtlZXAgTUwgaW4gQ2MocmVwbHkgdG8gYWxsKSwgdGhhbmsgeW91
CkkgZm9sbG93IHdpdGggYW5vdGhlciBlLW1haWwKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkg
RW5naW5lZXJpbmcgc2FzCgpPbiAxNy8wMS8yMiAyMTo1NiwgU2VyZ2V5IEt1em1pbm92IHdyb3Rl
Ogo+IEhpLCBHaXVsaW8uIFdpZmkgaXMgd29ya2luZywgdGhhbmtzLgo+IAo+ICMgdW5hbWUgLWEK
PiBMaW51eCBPcmFuZ2VQaV9aZXJvIDUuMTYuMSAjMSBTTVAgTW9uIEphbiAxNyAyMTo0Njo0NSBN
U0sgMjAyMiBhcm12N2wKPiBHTlUvTGludXgKPiAjIGl3Y29uZmlnCj4gbG/CoMKgwqDCoMKgwqDC
oCBubyB3aXJlbGVzcyBleHRlbnNpb25zLgo+IAo+IGV0aDDCoMKgwqDCoMKgIG5vIHdpcmVsZXNz
IGV4dGVuc2lvbnMuCj4gCj4gd2xhbjDCoMKgwqDCoCBJRUVFIDgwMi4xMcKgIEVTU0lEOiJBRkQ3
REYiCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgTW9kZTpNYW5hZ2VkwqAgRnJlcXVlbmN5OjIuNDUy
IEdIesKgIEFjY2VzcyBQb2ludDoKPiAyQzpDODoxQjo0QzpFMTpGMwo+ICAgwqDCoMKgwqDCoMKg
wqDCoMKgIEJpdCBSYXRlPTI2IE1iL3PCoMKgIFR4LVBvd2VyPTIwIGRCbQo+ICAgwqDCoMKgwqDC
oMKgwqDCoMKgIFJldHJ5IHNob3J0IGxpbWl0OjfCoMKgIFJUUyB0aHI6b2ZmwqDCoCBGcmFnbWVu
dCB0aHI6b2ZmCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgRW5jcnlwdGlvbiBrZXk6b2ZmCj4gICDC
oMKgwqDCoMKgwqDCoMKgwqAgUG93ZXIgTWFuYWdlbWVudDpvbgo+ICAgwqDCoMKgwqDCoMKgwqDC
oMKgIExpbmsgUXVhbGl0eT0yOC83MMKgIFNpZ25hbCBsZXZlbD0tODIgZEJtCj4gICDCoMKgwqDC
oMKgwqDCoMKgwqAgUnggaW52YWxpZCBud2lkOjDCoCBSeCBpbnZhbGlkIGNyeXB0OjDCoCBSeCBp
bnZhbGlkIGZyYWc6MAo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIFR4IGV4Y2Vzc2l2ZSByZXRyaWVz
OjTCoCBJbnZhbGlkIG1pc2M6MMKgwqAgTWlzc2VkIGJlYWNvbjowCj4gCj4gIyBpZmNvbmZpZwo+
IGV0aDDCoMKgwqDCoMKgIExpbmsgZW5jYXA6RXRoZXJuZXTCoCBIV2FkZHIgMDI6NDI6RkQ6NDY6
MUQ6RDMKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBVUCBCUk9BRENBU1QgTVVMVElDQVNUwqAgTVRV
OjE1MDDCoCBNZXRyaWM6MQo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIFJYIHBhY2tldHM6MCBlcnJv
cnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBmcmFtZTowCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAg
VFggcGFja2V0czowIGVycm9yczowIGRyb3BwZWQ6MCBvdmVycnVuczowIGNhcnJpZXI6MAo+ICAg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbGxpc2lvbnM6MCB0eHF1ZXVlbGVuOjEwMDAKPiAgIMKgwqDC
oMKgwqDCoMKgwqDCoCBSWCBieXRlczowICgwLjAgQinCoCBUWCBieXRlczowICgwLjAgQikKPiAg
IMKgwqDCoMKgwqDCoMKgwqDCoCBJbnRlcnJ1cHQ6NDMKPiAKPiBsb8KgwqDCoMKgwqDCoMKgIExp
bmsgZW5jYXA6TG9jYWwgTG9vcGJhY2sKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBpbmV0IGFkZHI6
MTI3LjAuMC4xwqAgTWFzazoyNTUuMC4wLjAKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBVUCBMT09Q
QkFDSyBSVU5OSU5HwqAgTVRVOjY1NTM2wqAgTWV0cmljOjEKPiAgIMKgwqDCoMKgwqDCoMKgwqDC
oCBSWCBwYWNrZXRzOjAgZXJyb3JzOjAgZHJvcHBlZDowIG92ZXJydW5zOjAgZnJhbWU6MAo+ICAg
wqDCoMKgwqDCoMKgwqDCoMKgIFRYIHBhY2tldHM6MCBlcnJvcnM6MCBkcm9wcGVkOjAgb3ZlcnJ1
bnM6MCBjYXJyaWVyOjAKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBjb2xsaXNpb25zOjAgdHhxdWV1
ZWxlbjoxMDAwCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgUlggYnl0ZXM6MCAoMC4wIEIpwqAgVFgg
Ynl0ZXM6MCAoMC4wIEIpCj4gCj4gd2xhbjDCoMKgwqDCoCBMaW5rIGVuY2FwOkV0aGVybmV0wqAg
SFdhZGRyIDEyOjQyOkZEOjQ2OjFEOkQzCj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgaW5ldCBhZGRy
OjE5Mi4xNjguMTAuMjQwwqAgQmNhc3Q6MTkyLjE2OC4xMC4yNTUgTWFzazoyNTUuMjU1LjI1NS4w
Cj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgVVAgQlJPQURDQVNUIFJVTk5JTkcgTVVMVElDQVNUwqAg
TVRVOjE1MDDCoCBNZXRyaWM6MQo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIFJYIHBhY2tldHM6ODgg
ZXJyb3JzOjAgZHJvcHBlZDozNCBvdmVycnVuczowIGZyYW1lOjAKPiAgIMKgwqDCoMKgwqDCoMKg
wqDCoCBUWCBwYWNrZXRzOjE0IGVycm9yczowIGRyb3BwZWQ6MCBvdmVycnVuczowIGNhcnJpZXI6
MAo+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbGxpc2lvbnM6MCB0eHF1ZXVlbGVuOjEwMDAKPiAg
IMKgwqDCoMKgwqDCoMKgwqDCoCBSWCBieXRlczoxMzUxNiAoMTMuMSBLaUIpwqAgVFggYnl0ZXM6
MTkyNyAoMS44IEtpQikKPiAKPiAjIHBpbmcgZ29vZ2xlLmNvbQo+IFBJTkcgZ29vZ2xlLmNvbSAo
MjE2LjIzOS4zOC4xMjApOiA1NiBkYXRhIGJ5dGVzCj4gNjQgYnl0ZXMgZnJvbSAyMTYuMjM5LjM4
LjEyMDogc2VxPTAgdHRsPTEwMiB0aW1lPTU0Ljg5MCBtcwo+IDY0IGJ5dGVzIGZyb20gMjE2LjIz
OS4zOC4xMjA6IHNlcT0xIHR0bD0xMDIgdGltZT01NC4xMDIgbXMKPiA2NCBieXRlcyBmcm9tIDIx
Ni4yMzkuMzguMTIwOiBzZXE9MiB0dGw9MTAyIHRpbWU9NTEuNTgzIG1zCj4gXkMKPiAtLS0gZ29v
Z2xlLmNvbSBwaW5nIHN0YXRpc3RpY3MgLS0tCj4gMyBwYWNrZXRzIHRyYW5zbWl0dGVkLCAzIHBh
Y2tldHMgcmVjZWl2ZWQsIDAlIHBhY2tldCBsb3NzCj4gcm91bmQtdHJpcCBtaW4vYXZnL21heCA9
IDUxLjU4My81My41MjUvNTQuODkwIG1zCj4gCj4gCj4gCj4gMTcuMDEuMjAyMiAxNDozOCwgR2l1
bGlvIEJlbmV0dGkg0L/QuNGI0LXRgjoKPj4gSGkgU2VyZ2V5LAo+Pgo+PiBPbiAxNi8wMS8yMiAx
OToxOSwgU2VyZ2V5IEt1em1pbm92IHdyb3RlOgo+Pj4gMTYuMDEuMjAyMiAxODoyOSwgR2l1bGlv
IEJlbmV0dGk6Cj4+Pj4gSGkgU2VyZ2V5LCBQZXRlciwgQWxsLAo+Pj4+Cj4+Pj4gKyMgQXJjaGl0
ZWN0dXJlCj4+Pj4gQlIyX2FybT15Cj4+Pj4gQlIyX2NvcnRleF9hNz15Cj4+Pj4gQlIyX0FSTV9G
UFVfVkZQVjQ9eQo+Pj4+IOKApkhlcmUgXl5eIHlvdSBjYW4gZW5hYmxlIFZGUCtORU9OLiBJdOKA
mXMgd29ya2luZyBvbiBhbGwgT2xpbWV4IGJvYXJkcwo+Pj4+IHdpdGggc3VueGkgQTcgYW5kIGNh
biBzcGVlZCB0aGluZ3MgdXAuCj4+Pj4KPj4+IEhpLCBHaXVsaW8uIEkgd2lsbCB0ZXN0LCB0aGFu
a3MuCj4+Pgo+Pj4KPj4+Pj4gKyMgV2lyZWxlc3MgZHJpdmVyIGFuZCBmaXJtd2FyZQo+Pj4+PiAr
IyBbMTYuMDEuMjAyMl0gRG9lc24ndCBjb21waWxlIHdpdGggbmV3ZXIga2VybmVscyA+IDUuMTIu
eAo+Pj4+PiBCUjJfUEFDS0FHRV9YUjgxOV9YUkFESU89eQo+Pj4+PiBCUjJfUEFDS0FHRV9BUk1C
SUFOX0ZJUk1XQVJFPXkKPj4+Pj4gQlIyX1BBQ0tBR0VfQVJNQklBTl9GSVJNV0FSRV9YUjgxOT15
Cj4+Pj4gQ2FuIHlvdSBwb2ludCBhIHRlc3QgY2FzZT8gVGhpcyB3YXkgSSBjb3VsZCB0cnkgdG8g
Zml4IGJ1aWxkaW5nIGFuZAo+Pj4+IHlvdSBjb3VsZCB0ZXN0IGlmIGl0IHdvcmtzLgo+Pj4+Cj4+
Pj4gVGhhbmsgeW91Cj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4g4oCULQo+Pj4+IEdpdWxpbyBCZW5l
dHRpCj4+Pj4gQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKPj4+Pgo+Pj4gVG8gY2hlY2ssIHNldCB0
aGUgcGFyYW1ldGVycyBpbiB0aGUgY3VycmVudCB2ZXJzaW9uIG9mIEJ1aWxkcm9vdAo+Pj4gQlIy
X1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE1PXkKPj4+IEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTUuMTUiCj4+PiBpbiB0aGUgY29uZmlncy9v
cmFuZ2VwaV96ZXJvX2RlZmNvbmZpZyBmaWxlCj4+Pgo+Pj4gbWFrZSBvcmFuZ2VwaV96ZXJvX2Rl
ZmNvbmZpZwo+Pj4gbWFrZQo+Pgo+PiBJJ3ZlIGZpeGVkIHRoZSBidWlsZGluZyBvZiB0aGlzIF5e
XjoKPj4gaHR0cHM6Ly9naXRodWIuY29tL2dpdWxpb2JlbmV0dGkvYnVpbGRyb290L2NvbW1pdC81
ZThhNDIyYjIzMWYzOTVkNjY3NGEyMzEwZWYwZmZiZjY0YWIzOGRjCj4+Cj4+Cj4+IENhbiB5b3Ug
dGVzdCBpZiBpdCB3b3JrcyBydW50aW1lPwo+Pgo+PiBUaGlzIHdheSB5b3VyIGFjdHVhbCBwYXRj
aCBjYW4gY2hhbmdlIHVzaW5nIGxhdGVzdCBMaW51eCg1LjE2LjEpLgo+Pgo+PiBJJ3ZlIGFscmVh
ZHkgb3BlbmVkIGEgUFIgZm9yIHRoYXQgcGF0Y2g6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9maWZ0
ZWVuaGV4L3hyYWRpby9wdWxsLzE1Cj4+Cj4+IE9uY2UgbXkgcGF0Y2ggd2lsbCBiZSBtZXJnZWQg
SSB3aWxsIGJ1bXAgeHJhZGlvIHZlcnNpb24gdG8gbGF0ZXN0IGluCj4+IEJ1aWxkcm9vdC4KPj4K
Pj4gVGhhbmsgeW91Cj4+IEJlc3QgcmVnYXJkcwo+IAo+IAoKLS0gCkdpdWxpbyBCZW5ldHRpCkJl
bmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
