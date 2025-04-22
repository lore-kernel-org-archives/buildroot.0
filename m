Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1D3C369D3
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 11:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9740480D03;
	Tue, 22 Apr 2025 11:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-nst6hTTXzj; Tue, 22 Apr 2025 11:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBAFF81638
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBAFF81638;
	Tue, 22 Apr 2025 11:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20A3A68
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D50881638
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ek-DGsv2lqC for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 11:34:34 +0000 (UTC)
X-Greylist: delayed 398 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 22 Apr 2025 11:34:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20C8A80D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C8A80D03
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:6b8:c02:900:1:45:d181:d204; helo=forward204b.mail.yandex.net;
 envelope-from=leo@yuriev.ru; receiver=<UNKNOWN> 
Received: from forward204b.mail.yandex.net (forward204b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20C8A80D03
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:34:32 +0000 (UTC)
Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d103])
 by forward204b.mail.yandex.net (Yandex) with ESMTPS id BE6CB65138
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:27:59 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c37:f37c:0:640:1e45:0])
 by forward103b.mail.yandex.net (Yandex) with ESMTPS id C089860B23
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 14:27:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id mRMTvL2Lf0U0-Ve3NQzGh; 
 Tue, 22 Apr 2025 14:27:49 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Tue, 22 Apr 2025 14:27:32 +0300
Message-ID: <20250422112734.313858-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1745321269; bh=48uh4srzvsVuyG1miF2ojpX68JQFUVKSEebrKU7V81k=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=L7KpwYIorDSpMcW5BD9ldjEUOapVuJYA+DsLSiWkv5BTBmDQ5r2ZlD73ZvFitrCoI
 XFjN6+wHchWCuCEbw+X3BVWCIMmWv6QsqPCXFqjVpkfr6Oi5HalqxuSHEvISHmLJsS
 UeNjAAFhtAJfVT0CLgt9whIxm8k7atoKRa3wKe3o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.6
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

VGhpcyByZWxlYXNlIGNhbGxlZCAi0JHRg9C30LjQvdCwIiAoRWxkZXJiZXJyeSkgb2YgdGhlIHN0
YWJsZSBsaWJtZGJ4IGJyYW5jaC4KClBsZWFzZSB2aXNpdCBodHRwczovL2xpYm1kYnguZHFka2Zh
LnJ1IGZvciBtb3JlIGluZm9ybWF0aW9uLCBjaGFuZ2Vsb2csCmNyZWRpdHMgYW5kIGFja25vd2xl
ZGdtZW50cywgZG9jdW1lbnRhdGlvbiwgQysrIEFQSSBkZXNjcmlwdGlvbiBhbmQKbGlua3MgdG8g
dGhlIG9yaWdpbmFsIGdpdCByZXBvIHdpdGggdGhlIHNvdXJjZSBjb2RlLiBRdWVzdGlvbnMsIGZl
ZWRiYWNrCmFuZCBzdWdnZXN0aW9ucyBhcmUgd2VsY29tZSB0byB0aGUgVGVsZWdyYW0nIGdyb3Vw
IGh0dHBzOi8vdC5tZS9saWJtZGJ4LgoKU2luY2UgMC4xMy54IGxpYm1kYnggaXMgbGljZW5zZWQg
dW5kZXIgdGhlIEFwYWNoZSAyLjAgTGljZW5zZS4KRm9yIG5vdGVzIGFib3V0IHRoZSBsaWNlbnNl
IGNoYW5nZSwgcGxlYXNlIHJlZmVyIHRvIHRoZSBDT1BZUklHSFQgZmlsZQp3aXRoaW4gb3JpZ2lu
YWwgbGlibWRieCBzb3VyY2UgY29kZSByZXBvc2l0b3J5Cmh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9q
ZWN0L2VydGhpbmsvbGlibWRieAoKU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC1
0LIgKExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2LnJ1PgotLS0KIHBhY2thZ2UvbGlibWRieC9s
aWJtZGJ4Lmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIGIvcGFja2FnZS9saWJtZGJ4L2xp
Ym1kYnguaGFzaAppbmRleCAyMDI5MzdlN2JlLi5hZTUyNjY3MTZiIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2xpYm1kYngvbGlibWRieC5oYXNoCisrKyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhh
c2gKQEAgLTEsNiArMSw2IEBACiAjIEhhc2hlcyBmcm9tOiBodHRwczovL2xpYm1kYnguZHFka2Zh
LnJ1L3JlbGVhc2UvU0hBMjU2U1VNUwotc2hhMjU2ICA4NmRmMzBjYTIyMzFjOWIzYWQ3MTQyNGJi
ODI5ZGNhOTA0MTk0N2Y1NTM5ZDQyOTUwMzBjNjUzZDQ5ODJjMWJlICBsaWJtZGJ4LWFtYWxnYW1h
dGVkLTAuMTMuNC50YXIueHoKK3NoYTI1NiAgNTdkYjk4N2RlNmY3Y2NjNjZhNjZhZTI4YTdiZGE5
ZjlmYmI0OGFjNWZiOTI3OWJjY2E5MmZkNWRlMTMwNzVkMSAgbGlibWRieC1hbWFsZ2FtYXRlZC0w
LjEzLjYudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIDBkNTQyZTBjODgw
NGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1MTI4N2UxMWI5MzhlOTQ1OTQgIExJ
Q0VOU0UKLXNoYTI1NiAgNjk5YTYyOTg2YjZjOGQzMTEyNDY0NmRmZmQ0YjE1ODcyYzdkM2JjNWVl
Y2VhNTk5NGVkYjFmNTE5NWRmNDlkMSAgTk9USUNFCitzaGEyNTYgIDY1MWY3MWI0NmM2YmIwMDQ2
ZDIxMjJkZjdmOWRlZjljYjI0ZjRkYzI4YzViMTFjZWYwNTlmNjY1NjVjZGEzMGYgIE5PVElDRQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgYi9wYWNrYWdlL2xpYm1kYngv
bGlibWRieC5tawppbmRleCAyMDQ4MTVlNjg4Li5mNDYxZDk4Mzk3IDEwMDY0NAotLS0gYS9wYWNr
YWdlL2xpYm1kYngvbGlibWRieC5taworKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawpA
QCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQk1EQlhfVkVS
U0lPTiA9IDAuMTMuNAorTElCTURCWF9WRVJTSU9OID0gMC4xMy42CiBMSUJNREJYX1NPVVJDRSA9
IGxpYm1kYngtYW1hbGdhbWF0ZWQtJChMSUJNREJYX1ZFUlNJT04pLnRhci54egogTElCTURCWF9T
SVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlCiBMSUJNREJYX1NVUFBPUlRT
X0lOX1NPVVJDRV9CVUlMRCA9IE5PCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
