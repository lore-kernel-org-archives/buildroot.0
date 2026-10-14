Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D84CCC6B2C
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 20:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC5028096C;
	Wed, 14 Oct 2026 20:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anJK4OOCnCHP; Wed, 14 Oct 2026 20:09:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9E995808C4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792008590;
	b=OkB6zZnh44u4RBLRL89sB+19R3G9V8SIc0UQkPt1LTlw0JM458h64NnByTcpsqvRzDp/
	 AKoBRcGQmyIidUUjyGauwo2tBylKfOY4GsbYvh4c9ym4FeRHrzP2tFBCYud4r7kZSM12F
	 /esSKmzOYAesAsm4gv8GY5rlmRpUyfZsJEMOXf8SFQAO7I3qWxlRnu4pOj/ImDMPKviZz
	 gVpjpxSjqo6/rFJUBdRCZNQ9Rk70hj/3r8h+yn9rLwivR6+Qidu4Q5rZgAlDN/BBC8864
	 LQXyOLwPceuztWUs9tXgVQhF4KdUTTBTPe9mKP2slWk7DxjATvZky0/L2+PjXhAs8mg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792008590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gFb31KUsK9GKO+bIjeBmtliGXDsgdhgyqk0sgvbAY94=;
	b=JwmvDHoRh1AIl37gOgm8MVnnvqJGIc3ah+PFQhxZyNue5hS9lppcPDk7RjqXtHnCwYmC
	 WnDvfbZl5gckCHEGePwoBblOuwHUsh+jAUf3It3VdX1hm2dqOczSn9IjNXXZYHF4M2Lez
	 bTHXHWsqjmm7rin4SIXVbUT/CuJ8if/CqKC2/VaL7TPu5u/hfZrELeDgYZT2bcL5aRlnn
	 Iv96+bZb2c/ZP8fCZp0qCm8JLVawr+qthJuFCYD9xa3x3J9D2do73DDQEtYR9nUIpQ3Na
	 45xC48Dp2w8Rn2OOr0yXFqdHpFBXo3V4G+mrfO7PNccW6FsuRi+r1VA70md1BOG8L1w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792008590;
	bh=gFb31KUsK9GKO+bIjeBmtliGXDsgdhgyqk0sgvbAY94=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AojU9SwKJVRqjvH7IvGiBoLJbOfc/LCRkWEJ6Fps3wgZv1MxfaLII6nY6HkrO08ca
	 F3inL2J4o+HHCMRkxsPUzEnAGVsx436uCnUVIYyr7hoeLIGwaNk/PyZfdeterSdXKh
	 Lbm4jLMfjRh9G9/zVrj3Bq65y/NWBvlvfuU1Nb8GZLuMcLdaPL8dSyMcdA1vBbtug4
	 ydPBO+ECap0WqRcnrXmj3iT30YJ5TW6i0FaieHgaP7/7RMn6uCPdEeKgxdTwmiuNXa
	 LDOYEp8Ih+OxEuR2Zhd9OAXyBezqEuATkhAJ2WtRcs8S/I8ArbaM4EW6Kf2HoyHZgz
	 FkDLY6BuO8e9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E995808C4;
	Wed, 14 Oct 2026 20:09:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A37F72E0
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A11A3407B2
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vm9hA6KznroL for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 20:09:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E1D7B40786
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792008587;
 b=cRtK924PCSwaFnKa592EOeKw3Iac7mT2gsRX9kxzmVxvTmK+VYa7plG5DzVQnTG9e0Bm
 ZZTukrOw1hHToK1k2Wb3caqPBd8b+TST9o7B7/LS3cxffZhs/8hrEDNh6CR7b4AbkAiQF
 HB1MWwRqtSmI6EASkLTK3NT787UWcRJc7qj7F+P/3/G7+/A/mqUNMXQYoUSlIjNmewH25
 1nPcG7LQhnKg7TgpLbvclpRylE35zLZwHqitWV7K5CHW4wdnhu8Slcm5UeMbi64681gt8
 sS+PfkxkHcSSCmQ4ok8Pb4pj+EoTwLe0BktpOqJ571IoUp67wdzlc3xGqELf2DFoJpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792008587;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-MIME-Autoconverted;
 bh=r7kBz9nq0Ca0qj/KJIyWV1nuYms/yztiJ0K88oNspps=;
 b=cLsO+/YYQzLMprEk82bG5X8hFmeR//uaMw0EnezOBM5wAu348L/bfrb+19jgQ4LiihE6
 NRukhmJivbCpMCkroBgbk1+Ou9eO5R8OxemiQwinb7GHky+1ZYmyutCWTVK8OQlZcfmYc
 1VDthI3UZeXM3eocMxlBx/EwVssby0nmJZzPQoT9CuwixUQfOWAegRNL2GP91q3E3Eqg6
 fdEY3MZCOBjfpYH6HS6LRxzcSgZHuY1VKsqLAovZYZmncw+UUeHeOZmMFY40dWAxXb2bY
 rj9foinUAbTng9/nkk+sK76Dr5pZuld90PhsKhs/kD2Kk6xGznTNhYppRaXlFdWTezw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=ZUbURhMD; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ZUbURhMD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1D7B40786
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:09:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ZUbURhMD39dzdKJuiqvynfXkTzvyXIF9+zJluHpcVSOiwcqVF9WqZcCL34r3AlkC68uEvpY0T2+IBZkg41KRgYId9WMZy66itzRQXuMEy91Ms7RSxmCyqt7n5v3a0t/rteogV65A+JRCuVX9ohnfSpis+rgpurJCcNaCGMDvirgKGGR1ukMkwEMhFQluWkqT5OQBfn3Ny/96/PdFLrrkVytVJMp3rxE5UNQ+ON8M/Hrh7nLxBFtclEYjZ18S3rpOBbwIlrApFPQyexT1FJCtYKe+F2Ty2QeDqX46iKNsRC+004y5lkT+P8E+M6sW5N/kZMf7Iu7ICVJdzPNPvJY9dg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=K5UD+WV+5ij9vX7JwRuxi6EC9PpQvdE79RQab0kMeng=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -275989183; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 20:09:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xH5I9-0000000E4aT-3bpD;
 Wed, 14 Oct 2026 22:09:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 22:09:32 +0200
Message-ID: <20261014200935.3354206-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/libglib2: security bump to version
 2.88.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tm8gQ1ZFcyBzcGVjaWZpZWQsIGJ1dCBORVdTIHN0YXRlczoKCiE1Mzk0IEJhY2twb3J0IHZhcmlv
dXMgc2VjdXJpdHkgZml4ZXMgdG8gZ2xpYi0yLTg4Cmh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9H
Tk9NRS9nbGliLy0vbWVyZ2VfcmVxdWVzdHMvNTM5NAoKQW5kIGEgbnVtYmVyIG9mIG90aGVyIGJ1
Z2ZpeGVzOgoKKiBCdWdzIGZpeGVkOgogIC0gIzQwMTEgZ2lvL3Rlc3RzL3NlcnZpY2VzOiBJbnN0
YWxsZWQgc2VydmljZSBmaWxlIGNvbnRhaW5zIGJ1aWxkIHBhdGggYWZ0ZXIKICAgICE1MjU5IChK
YWlwYXVsIENoZWVybmFtKQogIC0gIzQwMjAg4oCYVExTIGNhbGxiYWNrIG5vdCBpbnZva2Vk4oCZ
IGVycm9yIG9uIG1zeXMyLWNsYW5nNjQgQ0kgam9iIChMdWNhIEJhY2NpKQogIC0gITUyNjIgQmFj
a3BvcnQgITUyNjEg4oCcZ2lvL3Rlc3RzL3NlcnZpY2VzOiBGaXggaW5zdGFsbGVkIHNlcnZpY2Ug
ZmlsZQogICAgY29udGFpbmluZyBidWlsZCBwYXRo4oCdIHRvIGdsaWItMi04OAogIC0gITUyNzMg
QmFja3BvcnQgITUyNjYg4oCcZG9jczogRml4IGdpbyBnaS1kb2NnZW4gZG9jc191cmzigJ0gdG8g
Z2xpYi0yLTg4CiAgLSAhNTI4NSBCYWNrcG9ydCAhNTI4MyDigJxnY29uc3RydWN0b3I6IFJlZmVy
ZW5jZSBfdGxzX3VzZWQgYWxzbyBvbiBHQ0MsIENMYW5n4oCdCiAgICB0byBnbGliLTItODgKICAt
ICE1MzIzIEJhY2twb3J0ICE1MzExIOKAnGZpeDogaGFuZGxlIGxvbmcgZmlsZW5hbWVzIGluIHRy
YXNoIGJ5IHRydW5jYXRpbmcgZnJvbQogICAgZnJvbnTigJ0gdG8gZ2xpYi0yLTg4CiAgLSAhNTM3
OSBVcGRhdGUgTm9yd2VnaWFuIE55bm9yc2sgdHJhbnNsYXRpb24KICAtICE1Mzk0IEJhY2twb3J0
IHZhcmlvdXMgc2VjdXJpdHkgZml4ZXMgdG8gZ2xpYi0yLTg4CgoqIFRyYW5zbGF0aW9uIHVwZGF0
ZXM6CiAgLSBOb3J3ZWdpYW4gTnlub3JzayAoUm95LU1hZ25lIE1vKQoKaHR0cHM6Ly9naXRsYWIu
Z25vbWUub3JnL0dOT01FL2dsaWIvLS9ibG9iLzIuODguMy9ORVdTP3JlZl90eXBlPXRhZ3MKClNp
Z25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KLS0tCiBw
YWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvbGliZ2xpYjIv
bGliZ2xpYjIubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIuaGFz
aCBiL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIuaGFzaAppbmRleCA4OTcwZWY3NGUzLi45NWJm
NGQzMTc5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLmhhc2gKKysrIGIv
cGFja2FnZS9saWJnbGliMi9saWJnbGliMi5oYXNoCkBAIC0xLDQgKzEsNCBAQAotIyBodHRwczov
L2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2VzL2dsaWIvMi44OC9nbGliLTIuODguMy5zaGEyNTZz
dW0KLXNoYTI1NiAgYWIyNGQyNGU2OThkZmExZTQwOGI3YmNkYjUwOGY0YWFmYzkwNjE4NWE4Yjhj
ZTcyZmRmNzliYmJkYzliMzgzYiAgZ2xpYi0yLjg4LjMudGFyLnh6CisjIGh0dHBzOi8vZG93bmxv
YWQuZ25vbWUub3JnL3NvdXJjZXMvZ2xpYi8yLjg4L2dsaWItMi44OC40LnNoYTI1NnN1bQorc2hh
MjU2ICAyNWZkMTY5ZjNiMmY5MWZlMjM5MWFkMjk3ODgzY2UwZmNmMzBjNjlmYzc4OWZmZDFjOTY3
MmQxMzMyYjFjNWE4ICBnbGliLTIuODguNC50YXIueHoKICMgTGljZW5zZSBmaWxlcywgbG9jYWxs
eSBjYWxjdWxhdGVkCiBzaGEyNTYgIGZhNmYzNjYzMGJiMWUwYzU3MWQzNGIyYmJkZjE4OGQwODQ5
NWM5ZGJmNThmMjhjYWMxMTJmMzAzZmMxZjU4ZmIgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGliZ2xpYjIvbGliZ2xpYjIubWsgYi9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCmlu
ZGV4IGJmZTQ5MjAyOTEuLjQ1YWE4OTRiODEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliZ2xpYjIv
bGliZ2xpYjIubWsKKysrIGIvcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5tawpAQCAtNSw3ICs1
LDcgQEAKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKIExJQkdMSUIyX1ZFUlNJT05fTUFKT1Ig
PSAyLjg4Ci1MSUJHTElCMl9WRVJTSU9OID0gJChMSUJHTElCMl9WRVJTSU9OX01BSk9SKS4zCitM
SUJHTElCMl9WRVJTSU9OID0gJChMSUJHTElCMl9WRVJTSU9OX01BSk9SKS40CiBMSUJHTElCMl9T
T1VSQ0UgPSBnbGliLSQoTElCR0xJQjJfVkVSU0lPTikudGFyLnh6CiBMSUJHTElCMl9TSVRFID0g
aHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9nbGliLyQoTElCR0xJQjJfVkVSU0lP
Tl9NQUpPUikKIExJQkdMSUIyX0xJQ0VOU0UgPSBMR1BMLTIuMSsKLS0gCjIuNDcuMwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
