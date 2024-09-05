Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9049CE7AA0
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 22:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C10406CF;
	Thu,  5 Sep 2024 22:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuOuvf_14UKQ; Thu,  5 Sep 2024 22:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0680C406EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0680C406EA;
	Thu,  5 Sep 2024 22:18:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06DB51BF3E0
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 22:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E85DF4024E
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 22:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3cr7LhfYMAA for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 22:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28E214014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E214014E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28E214014E
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 22:18:19 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 11A23B00535;
 Fri,  6 Sep 2024 00:18:13 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 00:17:43 +0200
Message-ID: <20240905221743.1162124-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725574696;
 bh=Fp8SPWUHmNhNd0TVYlPQ101DHZcMQPePZAc9IkFc/Yo=;
 h=From:To:Cc:Subject:Date:From;
 b=U2qHt7TE/ca7XWxLy8OPzSmdUjG5bmt4XmNFmAUWBueJqT7XjAIRKHOfHGgUFVFgc
 Qfzok25makdkwA5759iJpPTuTU0iNger/V8qSSjFo3awzTr6cv4LbBpycN+pijEnF3
 zk1V21LaZfXr7m3VvxxtcNV+LnKAoCpj15SvPOCRsCnlSxy1Q0EG9/1kFrMSQ9ulNb
 mt/CMAZ3Rj0mlgigy0Hm7AJf2vLzMV/hTEshKdjBUqZw2MURsR0+VHBzL+49VMk9Dg
 3KfCzvhciyppIVsMT1Ip2jN2+MSJlJ1K/3lsBwqJKn+2JUNyK62X51r7J5cWTv39tb
 m6fYrlKJRjjrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=U2qHt7TE
Subject: [Buildroot] [PATCH next 1/1] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
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
Cc: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S2VybmVsIGNvbW1pdCBbMV0gaW50cm9kdWNlZCBNU00gR1BVIGRyaXZlciBoZWFkZXIgZ2VuZXJh
dGlvbiB3aXRoIGEKUHl0aG9uIHNjcmlwdC4gVGhpcyBjb21taXQgd2FzIGZpcnN0IGluY2x1ZGVk
IGluIHY2LjEwLiBUaGlzIGRyaXZlciBpcwphbHNvIGVuYWJsZWQgYXMgYSBtb2R1bGUgaW4gdGhl
IGFybTY0IGFyY2hpdGVjdHVyZSBkZWZhdWx0CmNvbmZpZ3VyYXRpb24uIFNlZSBbMl0uIFRoaXMg
aXMgYSBjb21tb24gc2l0dWF0aW9uLgoKVGhpcyBtaXNzaW5nIGRlcGVuZGVuY3kgaXMgbm90IGRl
dGVjdGVkIGluIHRoZSBCdWlsZHJvb3QgQ0ksIGJlY2F1c2UKdGhlIHJlZmVyZW5jZSBkb2NrZXIg
aW1hZ2UgY29udGFpbnMgYSBweXRob24zIGludGVycHJldGVyLiBTZWUgWzNdLgoKRm9yIGluZm9y
bWF0aW9uLCB0aGUgTGludXggbGF0ZXN0IGtlcm5lbCB2ZXJzaW9uIHdhcyB1cGRhdGVkIGluCkJ1
aWxkcm9vdCBjb21taXQgMmI2ZGJhMDBiICJsaW51eDogYnVtcCBsYXRlc3QgdmVyc2lvbiB0byA2
LjEwIi4KU2VlIFs0XS4KClRoZSBpc3N1ZSBjYW4gYmUgb2JzZXJ2ZWQgYnkgcnVubmluZyB0aGUg
Zm9sbG93aW5nIGNvbW1hbmRzIG9uIGEgaG9zdAp3aXRob3V0IHRoZSBweXRob24zIGludGVycHJl
dGVyIGluc3RhbGxlZDoKCiAgICBjYXQgPDxFT0YgPi5jb25maWcKICAgIEJSMl9hYXJjaDY0PXkK
ICAgIEJSMl9MSU5VWF9LRVJORUw9eQogICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZB
VUxUX0NPTkZJRz15CiAgICBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiAg
ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKICAgIEVPRgogICAgbWFrZSBvbGRkZWZjb25maWcK
ICAgIG1ha2UgbGludXgKClRoZSBLZXJuZWwgYnVpbGQgZmFpbHMgd2l0aCBvdXRwdXQ6CgogICAg
ICBHRU5IRFIgIGRyaXZlcnMvZ3B1L2RybS9tc20vZ2VuZXJhdGVkL2EyeHgueG1sLmgKICAgIC9i
aW4vc2g6IDE6IHB5dGhvbjM6IG5vdCBmb3VuZAogICAgbWFrZVs3XTogKioqIFtkcml2ZXJzL2dw
dS9kcm0vbXNtL01ha2VmaWxlOjE3NjogZHJpdmVycy9ncHUvZHJtL21zbS9nZW5lcmF0ZWQvYTJ4
eC54bWwuaF0gRXJyb3IgMTI3CgpUaGlzIGNvbW1pdCBmaXhlcyB0aGlzIGlzc3VlIGJ5IGludHJv
ZHVjaW5nIGEgbmV3CkJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9QWVRIT04zIGNvbmZpZ3Vy
YXRpb24gdGhhdCB3aWxsIG5lZWQgdG8gYmUKc2VsZWN0ZWQgaW4gcmVsZXZhbnQgc2l0dWF0aW9u
cy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9z
dGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9MGZkZGQwNDVmODhlMzRkNjE2MDc4NWEzYTVlNTA2
ZDM3NDU2NjQ1NApbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvc3RhYmxlL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWc/
aD12Ni4xMC44I244NjgKWzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2Jsb2IvMjAyNC4wOC1yYzMvc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZT9yZWZfdHlw
ZT10YWdzI0w0MApbNF0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vY29tbWl0LzJiNmRiYTAwYmUyN2EwOWJjN2U4OGZhZjA4NzFmODJiZjk1NTg5Y2YKClJlcG9y
dGVkLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+ClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Ci0tLQogbGludXgvQ29uZmlnLmlu
IHwgMTEgKysrKysrKysrKysKIGxpbnV4L2xpbnV4Lm1rICB8ICA0ICsrKysKIDIgZmlsZXMgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpbnV4L0NvbmZpZy5pbiBiL2xp
bnV4L0NvbmZpZy5pbgppbmRleCA0MjlhN2VhYmVmLi43ODIzNjY1ODZjIDEwMDY0NAotLS0gYS9s
aW51eC9Db25maWcuaW4KKysrIGIvbGludXgvQ29uZmlnLmluCkBAIC00OTIsNiArNDkyLDE3IEBA
IGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfUEFIT0xFCiAJICBzdWNoIGFzICJC
VEY6IC50bXBfdm1saW51eC5idGY6IHBhaG9sZSAocGFob2xlKSBpcyBub3QKIAkgIGF2YWlsYWJs
ZSIuCiAKK2NvbmZpZyBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfUFlUSE9OMworCWJvb2wg
Ik5lZWRzIGhvc3QgcHl0aG9uMyIKKwloZWxwCisJICBTb21lIExpbnV4IGtlcm5lbCBjb25maWd1
cmF0aW9uIG9wdGlvbnMgKHN1Y2ggYXMgdGhlCisJICBDT05GSUdfRFJNX01TTSBpbiB2Ni4xMCBh
bmQgZ3JlYXRlcikgcmVxdWlyZSBhIGhvc3QgcHl0aG9uMworCSAgaW50ZXJwcmV0ZXIuIEVuYWJs
aW5nIHRoaXMgb3B0aW9uIHdpbGwgZW5zdXJlIGhvc3QtcHl0aG9uMworCSAgZ2V0cyBidWlsdCBi
ZWZvcmUgdGhlIExpbnV4IGtlcm5lbC4KKworCSAgRW5hYmxlIHRoaXMgb3B0aW9uIGlmIHlvdSBn
ZXQgYSBMaW51eCBrZXJuZWwgYnVpbGQgZmFpbHVyZQorCSAgc3VjaCBhcyAicHl0aG9uMzogbm90
IGZvdW5kIi4KKwogIyBMaW51eCBleHRlbnNpb25zCiBzb3VyY2UgImxpbnV4L0NvbmZpZy5leHQu
aW4iCiAKZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKaW5kZXgg
MTZkOWYxOTQ3MC4uOTIwMzVkMGRhOSAxMDA2NDQKLS0tIGEvbGludXgvbGludXgubWsKKysrIGIv
bGludXgvbGludXgubWsKQEAgLTEzOCw2ICsxMzgsMTAgQEAgZGVmaW5lIExJTlVYX0ZJWFVQX0NP
TkZJR19QQUhPTEVfQ0hFQ0sKIGVuZGVmCiBlbmRpZgogCitpZmVxICgkKEJSMl9MSU5VWF9LRVJO
RUxfTkVFRFNfSE9TVF9QWVRIT04zKSx5KQorTElOVVhfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0
aG9uMworZW5kaWYKKwogIyBJZiBob3N0LXVib290LXRvb2xzIGlzIHNlbGVjdGVkIGJ5IHRoZSB1
c2VyLCBhc3N1bWUgaXQgaXMgbmVlZGVkIHRvCiAjIGNyZWF0ZSBhIGN1c3RvbSBpbWFnZQogaWZl
cSAoJChCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTKSx5KQotLSAKMi40Ni4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
