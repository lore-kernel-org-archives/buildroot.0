Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACF9CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18AFC402EB;
	Wed,  3 Apr 2024 21:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpF-OTuTu4mp; Wed,  3 Apr 2024 21:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6CEA41848
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6CEA41848;
	Wed,  3 Apr 2024 21:32:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4D141BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DF0B60ED9
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqg3RV6HjZ47 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.65;
 helo=mout01.posteo.de; envelope-from=gero.schwaericke@posteo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A12960E4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A12960E4B
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A12960E4B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:32:26 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 3CE93240027
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 23:32:23 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4V8ydL4XXGz6tw9;
 Wed,  3 Apr 2024 23:32:22 +0200 (CEST)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:30:38 +0000
Message-ID: <20240403213135.699268-1-gero.schwaericke@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1712179943; bh=OK23nHC564FsULcXv9Z+3L3d33SrvV5VMt6N5bayZZY=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=ZbtkJpUEKuwZW3cout9WE0PwdFmt+VU8G4JT10yKjcbVqMmkm+j5ePs02zOgeNQtE
 hKnfc1iSr/btzDBuU38tBXEsi74Poef9GulFTnROopzzv42Z9/s1tMFN8zwHqCCi9m
 6CFXd84++/Kd8Sn+EiRbZfhzhrWJ/golQsszXaIDMVmG1DW2B5WGQ3et2iAhXDl5wI
 ynry2Khb306jANncBhknhmzC59sKohFCi3Kt46WKI9Ye7KQcXokRwWnfK4uwLb/ASS
 NqevWAef5Cw+uguQ3/9iTckZ8VcjmTo9UNh4u5ElonwG96eFb87N4qLlRFYDz0xLe4
 Zt5CtuFd4gjNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=ZbtkJpUE
Subject: [Buildroot] [PATCH] docs/manual: promote using fixed version for
 kernel headers when contributing a board
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiB0aGUgZGVmYXVsdCAobmV3ZXN0KSBrZXJuZWwgaGVhZGVycyBzZXJpZXMgY2hhbmdlcyB0
aGUgYnVpbGQgY2FuCmJyZWFrLiBFeGFtcGxlIGVycm9yIG1lc3NhZ2U6CgogIEluY29ycmVjdCBz
ZWxlY3Rpb24gb2Yga2VybmVsIGhlYWRlcnM6IGV4cGVjdGVkIDYuOC54LCBnb3QgNi41LngKCklu
IHRoZSBhYm92ZSBjYXNlIHRoZSBkZWZjb25maWcgdXNlZDoKCiAgQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTj15CiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
Ni41LjkiCgpUaGUga2VybmVsIGhlYWRlcnMgd2VyZSBub3Qgc3BlY2lmaWVkLCBzbyB0aGUgYnVp
bGQgZGVmYXVsdGVkIHRvIHVzaW5nCnRoZSBrZXJuZWwgc291cmNlcyBhcyBoZWFkZXIgc291cmNl
IGFuZCB0aGUgZGVmYXVsdCAobmV3ZXN0KSBoZWFkZXIKc2VyaWVzLiBGcm9tIC5jb25maWc6Cgog
IEJSMl9LRVJORUxfSEVBREVSU19BU19LRVJORUw9eQogIEJSMl9QQUNLQUdFX0hPU1RfTElOVVhf
SEVBREVSU19DVVNUT01fNl84PXkKClNpZ25lZC1vZmYtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdl
cm8uc2Nod2Flcmlja2VAcG9zdGVvLmRlPgotLS0KIGRvY3MvbWFudWFsL2FkZGluZy1ib2FyZC1z
dXBwb3J0LmFkb2MgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFudWFsL2FkZGluZy1ib2FyZC1zdXBw
b3J0LmFkb2MgYi9kb2NzL21hbnVhbC9hZGRpbmctYm9hcmQtc3VwcG9ydC5hZG9jCmluZGV4IGVm
NmRiZDNjMmIuLjg1ZmQwODE1YTggMTAwNjQ0Ci0tLSBhL2RvY3MvbWFudWFsL2FkZGluZy1ib2Fy
ZC1zdXBwb3J0LmFkb2MKKysrIGIvZG9jcy9tYW51YWwvYWRkaW5nLWJvYXJkLXN1cHBvcnQuYWRv
YwpAQCAtMzIsNyArMzIsMTEgQEAgQWx3YXlzIHVzZSBmaXhlZCB2ZXJzaW9ucyBvciBjb21taXQg
aGFzaGVzIGZvciB0aGUgZGlmZmVyZW50CiBjb21wb25lbnRzLCBub3QgdGhlICJsYXRlc3QiIHZl
cnNpb24uIEZvciBleGFtcGxlLCBzZXQKICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
PXkrIGFuZAogK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUUrIHRvIHRoZSBr
ZXJuZWwgdmVyc2lvbiB5b3UgdGVzdGVkCi13aXRoLgord2l0aC4gSWYgeW91IGFyZSB1c2luZyB0
aGUgYnVpbGRyb290IHRvb2xjaGFpbiArQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1QrCisoZGVmYXVs
dCkgYWRkaXRpb25hbGx5IGVuc3VyZSB0aGF0IHRoZSBrZXJuZWwgaGVhZGVycworK0JSMl9LRVJO
RUxfSEVBREVSU18qKyBhbmQgKGlmIGFwcGxpY2FibGUpIHRoZSBjdXN0b20ga2VybmVsIGhlYWRl
cnMKK3NlcmllcyArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV8qKyBtYXRj
aCB5b3VyIGtlcm5lbAordmVyc2lvbi4KIAogSXQgaXMgcmVjb21tZW5kZWQgdG8gdXNlIGFzIG11
Y2ggYXMgcG9zc2libGUgdXBzdHJlYW0gdmVyc2lvbnMgb2YgdGhlCiBMaW51eCBrZXJuZWwgYW5k
IGJvb3Rsb2FkZXJzLCBhbmQgdG8gdXNlIGFzIG11Y2ggYXMgcG9zc2libGUgZGVmYXVsdAotLSAK
Mi40My4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
