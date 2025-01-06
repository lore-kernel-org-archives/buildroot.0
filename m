Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90944E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 11:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F5B4031C;
	Mon,  6 Jan 2025 11:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31ig2x4_Rbgs; Mon,  6 Jan 2025 11:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 123F64032E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 123F64032E;
	Mon,  6 Jan 2025 11:01:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5B17D92
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 11:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96AED606AA
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 11:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wf5n8Bnd5WwC for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 11:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BCF560623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BCF560623
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BCF560623
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 11:01:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23D17E0006;
 Mon,  6 Jan 2025 11:01:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tUkrT-00Bu96-1C;
 Mon, 06 Jan 2025 12:01:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jan 2025 12:01:29 +0100
Message-Id: <20250106110130.2837398-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: do not pass
 linker flags if not linking
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2lzc3Vl
cy81NQoKV2hlbiBnY2Mgc2VlcyBhIGxpbmtlciBvcHRpb24gKC1XbCwuLikgaXQgZXhlY3V0ZXMg
dGhlIGxpbmtlciwgbGVhZGluZyB0bwpjb25mdXNpbmcgZXJyb3IgbWVzc2FnZXMgaWYgbm8gc291
cmNlIGZpbGVzIGFyZSBwcm92aWRlZCwgRS5HLjoKCiUgZ2NjCmdjYzogZmF0YWwgZXJyb3I6IG5v
IGlucHV0IGZpbGVzCmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCgolwqBnY2MgLVdsLC16LG5vdwov
dXNyL2Jpbi9sZDogL3Vzci9saWIvZ2NjL3g4Nl82NC1saW51eC1nbnUvMTIvLi4vLi4vLi4veDg2
XzY0LWxpbnV4LWdudS9TY3J0MS5vOiBpbiBmdW5jdGlvbiBgX3N0YXJ0JzoKKC50ZXh0KzB4MTcp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBtYWluJwpjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVy
bmVkIDEgZXhpdCBzdGF0dXMKCkl0IGlzIG5vdCByZWFsbHkgdHJpdmlhbCB0byBkZXRlY3QgaW4g
dGhlIHdyYXBwZXIgaWYgbGlua2luZyB3aWxsIGJlIGRvbmUsCmJ1dCB3ZSBjYW4gYXQgbGVhc3Qg
Y2hlY2sgaWYgYW55IG5vbi1vcHRpb24gYXJndW1lbnRzIChFLkcuICBzb3VyY2Uvb2JqZWN0CmZp
bGVzKSBhcmUgcGFzc2VkIGFuZCBza2lwIHRoZSAtV2wsLi4gb3B0aW9ucyBpZiBub3QuCgolIC4v
aG9zdC9iaW4vYWFyY2g2NC1saW51eC1nY2MKYWFyY2g2NC1saW51eC1nY2MuYnJfcmVhbDogZmF0
YWwgZXJyb3I6IG5vIGlucHV0IGZpbGVzCmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCgpXaXRoIHRo
aXMgZml4ZWQgd2Ugbm8gbG9uZ2VyIG5lZWQgdGhlIHNwZWNpYWwgY2FzZSBmb3IgLS1oZWxwIC12
IGZyb20gY29tbWl0Cjk5NTQzMTVmYzViMiAoInRvb2xjaGFpbi90b29sY2hhaW4td3JhcHBlcjog
bWFrZSBnY2MgLS1oZWxwIC12IHdvcmsKY29ycmVjdGx5IiksIHNvIGRyb3AgdGhhdC4KClNpZ25l
ZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KLS0tCiB0b29s
Y2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rvb2xjaGFpbi90b29sY2hhaW4td3JhcHBlci5jIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi13
cmFwcGVyLmMKaW5kZXggZGIxMWNkYjZhYi4uOGIxZmI3OWRkZSAxMDA2NDQKLS0tIGEvdG9vbGNo
YWluL3Rvb2xjaGFpbi13cmFwcGVyLmMKKysrIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVy
LmMKQEAgLTI0NSw3ICsyNDUsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJ
Y2hhciAqcHJvZ3BhdGggPSBhcmd2WzBdOwogCWNoYXIgKmJhc2VuYW1lOwogCWNoYXIgKmVudl9k
ZWJ1ZzsKLQlpbnQgcmV0LCBpLCBjb3VudCA9IDAsIGRlYnVnID0gMCwgZm91bmRfc2hhcmVkID0g
MDsKKwlpbnQgcmV0LCBpLCBjb3VudCA9IDAsIGRlYnVnID0gMCwgZm91bmRfc2hhcmVkID0gMCwg
Zm91bmRfbm9ub3B0aW9uID0gMDsKIAogCS8qIERlYnVnIHRoZSB3cmFwcGVyIHRvIHNlZSBhcmd1
bWVudHMgaXQgd2FzIGNhbGxlZCB3aXRoLgogCSAqIElmIGVudmlyb25tZW50IHZhcmlhYmxlIEJS
Ml9ERUJVR19XUkFQUEVSIGlzOgpAQCAtMzExLDEzICszMTEsMTEgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiphcmd2KQogCQlyZXR1cm4gMzsKIAl9CiAKLQkvKiBza2lwIGFsbCBwcm9jZXNz
aW5nIC0taGVscCBpcyBzcGVjaWZpZWQgKi8KKwkvKiBhbnkgbm9uLW9wdGlvbiAoRS5HLiBzb3Vy
Y2UgLyBvYmplY3QgZmlsZXMpIGFyZ3VtZW50cyBwYXNzZWQ/ICovCiAJZm9yIChpID0gMTsgaSA8
IGFyZ2M7IGkrKykgewotCQlpZiAoIXN0cmNtcChhcmd2W2ldLCAiLS1oZWxwIikpIHsKLQkJCWFy
Z3ZbMF0gPSBwYXRoOwotCQkJaWYgKGV4ZWN2KHBhdGgsIGFyZ3YpKQotCQkJCXBlcnJvcihwYXRo
KTsKLQkJCXJldHVybiAxOworCQlpZiAoYXJndltpXVswXSAhPSAnLScpIHsKKwkJCWZvdW5kX25v
bm9wdGlvbiA9IDE7CisJCQlicmVhazsKIAkJfQogCX0KIApAQCAtMzQyLDggKzM0MCwxMSBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJfQogCiAJLyogc3RhcnQgd2l0aCBwcmVk
ZWZpbmVkIGFyZ3MgKi8KLQltZW1jcHkoY3VyLCBwcmVkZWZfYXJncywgc2l6ZW9mKHByZWRlZl9h
cmdzKSk7Ci0JY3VyICs9IHNpemVvZihwcmVkZWZfYXJncykgLyBzaXplb2YocHJlZGVmX2FyZ3Nb
MF0pOworCWZvciAoaSA9IDA7IGkgPCBzaXplb2YocHJlZGVmX2FyZ3MpIC8gc2l6ZW9mKHByZWRl
Zl9hcmdzWzBdKTsgaSsrKSB7CisJCS8qIHNraXAgbGlua2VyIGZsYWdzIHdoZW4gd2Uga25vdyB3
ZSBhcmUgbm90IGxpbmtpbmcgKi8KKwkJaWYgKGZvdW5kX25vbm9wdGlvbiB8fCBzdHJuY21wKHBy
ZWRlZl9hcmdzW2ldLCAiLVdsLCIsIHN0cmxlbigiLVdsLCIpKSkKKwkJCSpjdXIrKyA9IHByZWRl
Zl9hcmdzW2ldOworCX0KIAogI2lmZGVmIEJSX0ZMT0FUX0FCSQogCS8qIGFkZCBmbG9hdCBhYmkg
aWYgbm90IG92ZXJyaWRkZW4gaW4gYXJncyAqLwpAQCAtNDYzLDcgKzQ2NCw3IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKIAkJICAgICFzdHJjbXAoYXJndltpXSwgIi1EX19VQk9P
VF9fIikpCiAJCQlicmVhazsKIAl9Ci0JaWYgKGkgPT0gYXJnYykgeworCWlmIChpID09IGFyZ2Mg
JiYgZm91bmRfbm9ub3B0aW9uKSB7CiAJCS8qIGh0dHBzOi8vd2lraS5nZW50b28ub3JnL3dpa2kv
SGFyZGVuZWQvVG9vbGNoYWluI01hcmtfUmVhZC1Pbmx5X0FwcHJvcHJpYXRlX1NlY3Rpb25zICov
CiAjaWZkZWYgQlIyX1JFTFJPX1BBUlRJQUwKIAkJKmN1cisrID0gIi1XbCwteixyZWxybyI7Ci0t
IAoyLjM5LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
