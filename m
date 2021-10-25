Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF67C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:20:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E91260EE9
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E91260EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C27D5402D0;
	Mon, 25 Oct 2021 08:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjVzx-D6zCV0; Mon, 25 Oct 2021 08:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 926BC40357;
	Mon, 25 Oct 2021 08:20:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2D11BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 024EE80DF9
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5i-Zo2IHUa1E for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 08:20:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85ACE80D96
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 08:20:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 65so6364130ljf.9
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 01:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpZulFKaOD65dyT+tCUlCuglvP/Y95bh5L6/cIVWGbk=;
 b=ttMqJVaPlSpzJ7j1ulAUVzurvcKs7KNbYY2kzxsS5x5/8pJHTmcAGQCWHN3yg1Ht9P
 7hciQuTt3GzOJbcbmbWepM2w+eBGtC0v9CiiyTP9pMELuapUVMRW6TYktHRFVQ+IQirc
 SRq5pGOG35rXaRXMCVyFQp3/XExoB6lDr7T80cDYQH9yqzcAfMgXuiamC0uZ9SDD8TOt
 MaPV8nhKx17Msun3onPHkveF7p+xNaddb9G5Y+clIrfb+Meosx4ZwDvICFH8nWrbY3Y2
 o1O9YY877Yn+p3nYJ1Zm0jhzFK0T0iXQfXjNBrrmiwj/jqligs9YvsCMuYlpy6MOriu7
 kLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpZulFKaOD65dyT+tCUlCuglvP/Y95bh5L6/cIVWGbk=;
 b=qQbxPBfFmaljkydvUGXMXk/NeIZl1cByEEOBOHljy/2rcUgEu8MQYynYD5prCOhQCt
 iduwcNtM9BiI746Spap5vl5ymm7mHE1k/Oiersd3GGj/FGooovD3+TFA/q4RGYwciiNj
 O+WLKNM5H4BZ0Wr7oeK8bqLjSda6PcOWTmaERAUIncVyJHWhVjhepwF1WHewvlgcwinc
 U+sTS9Jk/Zwg/ewYxSOk0pvlVgwL7X6nlAMFrnu9puzmbYsvJ78U8LV3PsdxwdaqU5Ge
 1HeCQQy2F9DBEWnOCx1bDfpX9Xis8IhCgu/EccHCPstUjoTUXehiYZY64GYjQ7rkNfHd
 N30A==
X-Gm-Message-State: AOAM533rRIqGGJGGMC+44a911nhj+M6SeyXSZ21jmBVScyFFCUAqFTZw
 01+cb8kebQTYM/gP1ghNWlSJfvs17a/nEHb0s1muIA==
X-Google-Smtp-Source: ABdhPJxe68NfZCp6wuRa4jLBHq+nXx2oqNOr6mj7cn/ybbUl4tGQJbpMfwcvHHTPYslLYc/MAPtvDQ==
X-Received: by 2002:a2e:a5c6:: with SMTP id n6mr17055111ljp.7.1635149997884;
 Mon, 25 Oct 2021 01:19:57 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id t18sm1578448lfl.289.2021.10.25.01.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:19:57 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 11:19:55 +0300
Message-Id: <20211025081955.1215401-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/softhsm2: new package
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhdGNoIGFkZHMgYSBwYWNrYWdlIGZvciBzb2Z0aHNtMi4KClNpZ25lZC1vZmYtYnk6IEpv
c8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgotLS0KWyB2MSAtPiB2
MiBdCiAgLSBBZGRlZCBoYXNoIGZpbGUgYW5kIGxpY2Vuc2UgaW5mb3JtYXRpb24KICAtIE1vdmVk
IHJlY2lwZSB0byB1c2UgdGFyYmFsbAogIC0gUHJvdmlkZWQgc3VwcG9ydCB0byBidWlsZCBhZ2Fp
bnN0IGRpZmZlcmVudCBzc2wgbGlicmFyaWVzCiAgLSBGaXhlZCB0b29sY2hhaW4gZGVwZW5kZW5j
aWVzIGFuZCBzc2wgc2VsZWN0CiAgLSBSZWZlcmVuY2VkIHRoZSBwYWNrYWdlIGluIHBhY2thZ2Uv
Q29uZmlnLmluCiAgLSBBZGRlZCBteXNlbGYgYXMgZGV2ZWxvcGVyClsgdjIgLT4gdjMgXQogIC0g
Rml4IGluZGVudGF0aW9uIGluIENvbmZpZy5pbiBhbmQgaGFzaCBmaWxlCiAgLSBSZW1vdmVkIGNo
b2ljZSBpbiBDb25maWcuaW4KICAtIEFkZGVkIGRlcGVuZGVuY2llcyB0byB0b29sY2hhaW4gY29t
bWVudAogIC0gUmVtb3ZlZCBhdXRvcmVjb25mIGZsYWcgaW4gcmVjaXBlCgogREVWRUxPUEVSUyAg
ICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL3NvZnRoc20yL0NvbmZpZy5pbiAgICAgfCAxOCArKysrKysrKysr
KysrKysrKysKIHBhY2thZ2Uvc29mdGhzbTIvc29mdGhzbTIuaGFzaCB8ICA0ICsrKysKIHBhY2th
Z2Uvc29mdGhzbTIvc29mdGhzbTIubWsgICB8IDE1ICsrKysrKysrKysrKysrKwogNSBmaWxlcyBj
aGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zb2Z0
aHNtMi9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NvZnRoc20yL3NvZnRo
c20yLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NvZnRoc20yL3NvZnRoc20yLm1r
CgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZjZjMzk1MTZiNS4u
ODNkMjBkNTZjYyAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0y
OTI3LDMgKzI5MjcsNiBAQCBGOglwYWNrYWdlL3Fqc29uLwogRjoJcGFja2FnZS9xdWF6aXAvCiBG
OglwYWNrYWdlL3NoYXBlbGliLwogRjoJcGFja2FnZS90aW5jLworCitOOglKb3PDqSBQZWtrYXJp
bmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KK0Y6CXBhY2thZ2Uvc29mdGhzbTIvCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IDc5
NzE3MjY4NzUuLjRmOWNkMzhhOTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBi
L3BhY2thZ2UvQ29uZmlnLmluCkBAIC0yMDE5LDYgKzIwMTksNyBAQCBtZW51ICJTZWN1cml0eSIK
IAlzb3VyY2UgInBhY2thZ2UvbGlic2VtYW5hZ2UvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS9saWJzZXBvbC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3NhZmVjbGliL0NvbmZpZy5p
biIKKwlzb3VyY2UgInBhY2thZ2Uvc29mdGhzbTIvQ29uZmlnLmluIgogZW5kbWVudQogCiBtZW51
ICJUZXh0IGFuZCB0ZXJtaW5hbCBoYW5kbGluZyIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc29mdGhz
bTIvQ29uZmlnLmluIGIvcGFja2FnZS9zb2Z0aHNtMi9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNWQ4NDk5N2MwNwotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2Uvc29mdGhzbTIvQ29uZmlnLmluCkBAIC0wLDAgKzEsMTggQEAKK2NvbmZpZyBCUjJfUEFD
S0FHRV9TT0ZUSFNNMgorCWJvb2wgInNvZnRoc20yIgorCWRlcGVuZHMgb24gQlIyX0lOU1RBTExf
TElCU1REQ1BQCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzggIyBD
KysxMQorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGRsb3BlbigpCisJc2VsZWN0IEJS
Ml9QQUNLQUdFX09QRU5TU0wKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTF9GT1JDRV9MSUJP
UEVOU1NMCisJaGVscAorCSAgU29mdEhTTSBpcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiBhIGNyeXB0
b2dyYXBoaWMgc3RvcmUKKwkgIGFjY2Vzc2libGUgdGhyb3VnaCBhIFBLQ1MjMTEgaW50ZXJmYWNl
LiBZb3UgY2FuIHVzZSBpdAorCSAgdG8gZXhwbG9yZSBQS0NTIzExIHdpdGhvdXQgaGF2aW5nIGEg
SGFyZHdhcmUgU2VjdXJpdHkKKwkgIE1vZHVsZS4KKworCSAgaHR0cHM6Ly93d3cub3BlbmRuc3Nl
Yy5vcmcvc29mdGhzbQorCitjb21tZW50ICJzb2Zoc20yIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMr
KywgZ2NjID49IDQuOCBhbmQgZHluYW1pYyBsaWJyYXJ5IHN1cHBvcnQiCisJZGVwZW5kcyBvbiAh
QlIyX0lOU1RBTExfTElCU1REQ1BQIHx8IEJSMl9TVEFUSUNfTElCUyB8fCBcCisJCSFCUjJfVE9P
TENIQUlOX0dDQ19BVF9MRUFTVF80XzgKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc29mdGhzbTIvc29m
dGhzbTIuaGFzaCBiL3BhY2thZ2Uvc29mdGhzbTIvc29mdGhzbTIuaGFzaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mNTlmMGJmMDI4Ci0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5oYXNoCkBAIC0wLDAgKzEsNCBAQAorIyBGcm9tIGh0
dHBzOi8vd3d3Lm9wZW5kbnNzZWMub3JnLzIwMjAvMDQvMTYwMi8KK3NoYTI1NiAgNjEyNDk0NzMw
NTRiY2QxODExNTE5ZWY5YTk4OWE4ODBhN2JkY2MzNmQzMTdjOWMyNTQ1N2ZjNjE0ZGY0NzVmMiAg
c29mdGhzbS0yLjYuMS50YXIuZ3oKKyMgTG9jYWxseSBjb21wdXRlZAorc2hhMjU2ICAyMzBjYWI3
MTAyODE2ZTk5ZjdjZTAzZWY0NzYzNTJmY2FkMDlkNzQyZmNiYzY1ODBkNDQzOTNkYjYyODBiNjRj
ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3NvZnRoc20yL3NvZnRoc20yLm1rIGIvcGFj
a2FnZS9zb2Z0aHNtMi9zb2Z0aHNtMi5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi5jNDE4ZTM2NDhlCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zb2Z0aHNtMi9z
b2Z0aHNtMi5tawpAQCAtMCwwICsxLDE1IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIwor
IyBzb2Z0aHNtMgorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworU09GVEhTTTJfVkVSU0lP
TiA9IDIuNi4xCitTT0ZUSFNNMl9TT1VSQ0UgPSBzb2Z0aHNtLSQoU09GVEhTTTJfVkVSU0lPTiku
dGFyLmd6CitTT0ZUSFNNMl9TSVRFID0gaHR0cHM6Ly9kaXN0Lm9wZW5kbnNzZWMub3JnL3NvdXJj
ZQorU09GVEhTTTJfTElDRU5TRSA9IEJTRC0yLUNsYXVzZQorU09GVEhTTTJfTElDRU5TRV9GSUxF
UyA9IExJQ0VOU0UKK1NPRlRIU00yX0RFUEVOREVOQ0lFUyA9IG9wZW5zc2wKK1NPRlRIU00yX0lO
U1RBTExfU1RBR0lORyA9IFlFUworCiskKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
