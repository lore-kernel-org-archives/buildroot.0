Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16808C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 13:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD4AA4173A;
	Fri, 16 May 2025 13:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZairgwdi52x; Fri, 16 May 2025 13:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC68041754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC68041754;
	Fri, 16 May 2025 13:13:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9972F1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 686D8831AE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtEnwpyNLGuP for <buildroot@buildroot.org>;
 Fri, 16 May 2025 13:12:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE15283CFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE15283CFE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE15283CFE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:12:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F056543B57;
 Fri, 16 May 2025 13:12:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uFurs-0094D2-1N;
 Fri, 16 May 2025 15:12:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Martin Chabot <martin.chabot@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
References: <20250306204730.29180-1-ju.o@free.fr>
Date: Fri, 16 May 2025 15:12:52 +0200
In-Reply-To: <20250306204730.29180-1-ju.o@free.fr> (Julien Olivain's message
 of "Thu, 6 Mar 2025 21:47:30 +0100")
Message-ID: <87plg8aecr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeejgefgleelhfekheeuhfevjeetgffhtdfggeeftefgueevveeugeffieegveejvdenucffohhmrghinhepnhigphdrtghomhdpghhithhhuhgsrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmrghrthhinhdrtghhrggsohhtsehgm
 hgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH next 1/1] configs/freescale_imx93frdm: new
 defconfig
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkp1bGllbiIgPT0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JpdGVzOgoK
ID4gVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgaS5NWCA5MyBGUkRNIChGcmVlZG9t
KSBib2FyZC4KID4gVGhlIGkuTVg5MyBGUkRNIGRldmVsb3BtZW50IGJvYXJkIGlzIGEgbG93LWNv
c3QgYW5kIGNvbXBhY3QKID4gZGV2ZWxvcG1lbnQgYm9hcmQgZmVhdHVyaW5nIHRoZSBpLk1YOTMg
YXBwbGljYXRpb25zIHByb2Nlc3Nvci4KCiA+IFNlZTogaHR0cHM6Ly9ueHAuY29tL0ZSRE0tSU1Y
OTMKCiA+IFRoaXMgZGVmY29uZmlnIGlzIGJhc2VkIG9uIGZyZWVzY2FsZV9pbXg5M2V2a19kZWZj
b25maWcgaW50cm9kdWNlZAogPiBieSBTw6liYXN0aWVuLCBpbiBDYy4KCiA+IE5vdGU6IHRoZSBM
aW51eCBhbmQgVS1Cb290IHJlcG9zaXRvcmllcyBhcmUgZm9ya3MuIFRoaXMgaXMgYmVjYXVzZQog
PiB0aGUgTlhQIHNvZnR3YXJlIHRlYW0gZGlkIG5vdCBpbmNsdWRlZCBhbGwgdGhlIG5lY2Vzc2Fy
eSBpLk1YOTMgRlJETQogPiBwYXRjaGVzIGluIHRoZSBzdGFuZGFyZCBOWFAgaS5NWCBCU1AgYXQg
dGhlIHRpbWUgb2YgdGhpcyBjb21taXQuCiA+IEluc3RlYWQsIHBhdGNoZXMgd2VyZSBwdWJsaXNo
ZWQgaW4gYSBkZWRpY2F0ZWQgWW9jdG8gTGF5ZXIgZnJvbSBbMV0uCiA+IFRoZSBmb3JrcyB1c2Vk
IGluIHRoaXMgZGVmY29uZmlnIGFyZSBzaW1wbHkgdGhlIHJlcG9zaXRvcmllcyBbMl0KID4gYW5k
IFszXSB3aXRoIHBhdGNoZXMgZnJvbSBbMV0gYXBwbGllZCBvbiB0aGVtLiBUaGlzIGlzIG9ubHkg
dG8gbWFrZSB0aGlzCiA+IGRlZmNvbmZpZyBzaW1wbGVyIGluIHRoZSBtZWFudGltZSB0aGUgQlNQ
IHBhdGNoZXMgYXJlIGluY2x1ZGVkIGluIHRoZQogPiBOWFAgQlNQIHJlcG9zaXRvcmllcy4KCiA+
IFRoYW5rcyB0byBNYXJ0aW4gQ2hhYm90IGZvciBsZW5kaW5nIGEgYm9hcmQhCgogPiBbMV0gaHR0
cHM6Ly9naXRodWIuY29tL254cC1pbXgtc3VwcG9ydC9tZXRhLWlteC1mcmRtCiA+IFsyXSBodHRw
czovL2dpdGh1Yi5jb20vbnhwLWlteC91Ym9vdC1pbXgKID4gWzNdIGh0dHBzOi8vZ2l0aHViLmNv
bS9ueHAtaW14L2xpbnV4LWlteAoKID4gQ2M6IE1hcnRpbiBDaGFib3QgPG1hcnRpbi5jaGFib3RA
Z21haWwuY29tPgogPiBDYzogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5z
a2lAYXJtYWRldXMuY29tPgogPiBUZXN0ZWQtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUu
ZnI+CiA+IFtKdWxpZW46IFRlc3RlZCBvbiBib2FyZCA3MDAtOTQ2MTEgUmV2IEIxXQogPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKQ29tbWl0dGVkLCB0aGFu
a3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
