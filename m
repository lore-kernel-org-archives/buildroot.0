Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344EFC021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 08:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E997C80BBA;
	Thu, 13 Feb 2025 08:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L14vQ37wRhlG; Thu, 13 Feb 2025 08:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 006D681150
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 006D681150;
	Thu, 13 Feb 2025 08:22:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB16199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 822D06084F
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uM6P1epwa4Y for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 08:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE4C4606EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE4C4606EB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE4C4606EB
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:22:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37AC744307;
 Thu, 13 Feb 2025 08:22:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tiUUI-00De8t-0y;
 Thu, 13 Feb 2025 09:22:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org,  Daniel Lang <dalang@gmx.at>,  Fabrice Fontaine
 <fontaine.fabrice@gmail.com>,  James Knight <james.knight@collins.com>
References: <20250212094513.2410216-1-peter@korsgaard.com>
 <a9c9bdfe-eb67-43b0-a38b-338825d4144f@smile.fr>
Date: Thu, 13 Feb 2025 09:22:22 +0100
In-Reply-To: <a9c9bdfe-eb67-43b0-a38b-338825d4144f@smile.fr> (Romain Naour's
 message of "Wed, 12 Feb 2025 23:46:52 +0100")
Message-ID: <87bjv6z22p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepieejtdetgefghfeuuddvtedugeegkeelleeuudeukeduieffieekgfeuudelteeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhgthhkmhhmrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepuggrlhgrnhhgsehgmhigrdgrthdprhgtphhtthhopehfohhnthgrihhnvgdrfhgrsghrihgtvgesghhmrghilhdrtghomhdprhgtphhtthhop
 ehjrghmvghsrdhknhhighhhthestgholhhlihhnshdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/at-spi2-core: propagate !static
 dependency
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

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdy
aXRlczoKCiA+IEhlbGxvIFBldGVyLAogPiBMZSAxMi8wMi8yMDI1IMOgIDEwOjQ1LCBQZXRlciBL
b3JzZ2FhcmQgYSDDqWNyaXTCoDoKID4+IEZpeGVzIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzA2ZmIxMjc1YTZjNjdkMGJiNmU4ZTZjMGFiMzFjY2UyNTg3ZDVhMGYvCiA+
PiAKID4+IENvbW1pdCBkMTc1N2ZkZmIwMDEgKCJwYWNrYWdlL2F0LXNwaTItY29yZTogYnVtcCB0
byB2ZXJzaW9uIDIuNDguMCIpIGFkZGVkIGEKID4+IGRlcGVuZGVuY3kgb24gIXN0YXRpYyBidXQg
Zm9yZ290IHRvIHByb3BhZ2F0ZSBpdCB0byB0aGUgcmV2ZXJzZQogPj4gZGVwZW5kZW5jaWVzLiAg
Rml4IHRoYXQuCiA+PiAKID4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4KID4+IC0tLQogPj4gcGFja2FnZS9hdGttbS9Db25maWcuaW4gICAgIHwg
NiArKysrLS0KID4+IHBhY2thZ2UvYXRrbW0yXzI4L0NvbmZpZy5pbiB8IDYgKysrKy0tCiA+PiBw
YWNrYWdlL2xpYmdsYWRlL0NvbmZpZy5pbiAgfCA2ICsrKystLQogPj4gcGFja2FnZS9saWJndGsy
L0NvbmZpZy5pbiAgIHwgNSArKystLQogPj4gcGFja2FnZS9saWJndGszL0NvbmZpZy5pbiAgIHwg
NSArKystLQogPj4gNSBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKID4+IAogPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXRrbW0vQ29uZmlnLmluIGIvcGFj
a2FnZS9hdGttbS9Db25maWcuaW4KID4+IGluZGV4IDU3MWQ3ZTY5YWQuLmU3YWMwNjA2ZjAgMTAw
NjQ0CiA+PiAtLS0gYS9wYWNrYWdlL2F0a21tL0NvbmZpZy5pbgogPj4gKysrIGIvcGFja2FnZS9h
dGttbS9Db25maWcuaW4KID4+IEBAIC01LDYgKzUsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQVRL
TU0KID4+IGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGF0LXNwaTItY29y
ZS9nbGlibW0gLT4gbGliZ2xpYjIKID4+IGRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBhdC1zcGky
LWNvcmUvZ2xpYm1tIC0+IGxpYmdsaWIyCiA+PiBkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBh
dC1zcGkyLWNvcmUvZ2xpYm1tIC0+IGxpYmdsaWIyCiA+PiArCWRlcGVuZHMgb24gIUJSMl9TVEFU
SUNfTElCUyAjIGF0LXNwaTItY29yZQogPj4gc2VsZWN0IEJSMl9QQUNLQUdFX0FUX1NQSTJfQ09S
RQogPj4gc2VsZWN0IEJSMl9QQUNLQUdFX0dMSUJNTQogPj4gc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
QlNJR0MKID4+IEBAIC0xNCw3ICsxNSw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9BVEtNTQogPj4g
CiA+PiBodHRwOi8vd3d3Lmd0a21tLm9yZy8KID4+IAogPj4gLWNvbW1lbnQgImF0a21tIG5lZWRz
IGEgdG9vbGNoYWluIHcvIEMrKywgd2NoYXIsIHRocmVhZHMsIGdjYyA+PSA3IgogPj4gK2NvbW1l
bnQgImF0a21tIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSwgQysrLCB3Y2hh
ciwgdGhyZWFkcywgZ2NjID49IDciCiA+PiBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCiA+PiBkZXBl
bmRzIG9uICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83IHx8ICFCUjJfVVNFX1dDSEFSIFwK
ID4+IC0JCXx8ICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RI
UkVBRFMKID4+ICsJCXx8ICFCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9UT09MQ0hBSU5f
SEFTX1RIUkVBRFMgXAogPj4gKwkJfHwgQlIyX1NUQVRJQ19MSUJTCiA+PiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9hdGttbTJfMjgvQ29uZmlnLmluIGIvcGFja2FnZS9hdGttbTJfMjgvQ29uZmlnLmlu
CiA+PiBpbmRleCBlODgwNzNiODdhLi5lNjJhOGU3MjliIDEwMDY0NAogPj4gLS0tIGEvcGFja2Fn
ZS9hdGttbTJfMjgvQ29uZmlnLmluCiA+PiArKysgYi9wYWNrYWdlL2F0a21tMl8yOC9Db25maWcu
aW4KID4+IEBAIC01LDYgKzUsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQVRLTU0yXzI4CiA+PiBk
ZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgIyBhdC1zcGkyLWNvcmUvZ2xpYm1t
IC0+IGxpYmdsaWIyCiA+PiBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgYXQtc3BpMi1jb3JlL2ds
aWJtbSAtPiBsaWJnbGliMgogPj4gZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSICMgYXQtc3BpMi1j
b3JlL2dsaWJtbSAtPiBsaWJnbGliMgogPj4gKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMg
IyBhdC1zcGkyLWNvcmUKCiA+IE5vdyB0aGUgZGVwZW5kZW5jeSBtdXN0IGJlIHByb3BhZ2F0ZWQg
dG8gcGFja2FnZXMgdGhhdCBzZWxlY3QgYXRrbW0yXzI4CiA+IHBhY2thZ2U6KGd0a21tMykuCgpB
cmdoLCBpbmRlZWQuIEknbGwgc2VuZCBhIHYyLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
