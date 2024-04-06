Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B769CD1284
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 16:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB58D40126;
	Sat,  6 Apr 2024 16:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNt6BDyuwak4; Sat,  6 Apr 2024 16:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D306040433
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D306040433;
	Sat,  6 Apr 2024 16:58:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C543A1BF2F5
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 16:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B164740513
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 16:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SI36Kh-__BHx for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 16:58:35 +0000 (UTC)
X-Greylist: delayed 7230 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 06 Apr 2024 16:58:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE51240506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE51240506
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.97;
 helo=smtp-outgoing-1602.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
Received: from smtp-outgoing-1602.laposte.net (smtp-outgoing-1602.laposte.net
 [160.92.124.97])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE51240506
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 16:58:33 +0000 (UTC)
X-mail-filterd: {"version":"1.7.5","queueID":"4VBdkv2nvLzWf0M","contextId":
 "056805b6-b675-4d7b-ab4d-d269580d0b37"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0107.laposte.net (SMTP Server) with ESMTP id 4VBdkv2nvLzWf0M;
 Sat,  6 Apr 2024 16:57:59 +0200 (CEST)
X-mail-filterd: {"version":"1.7.5","queueID":"4VBdkv1mtJzWf07","contextId":
 "28cd803b-b3d1-4791-92f1-2f618689a47c"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0107.laposte.net (SMTP Server) with ESMTPSA id 4VBdkv1mtJzWf07;
 Sat,  6 Apr 2024 16:57:59 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 64E7B5C5C5CF;
 Sat,  6 Apr 2024 16:57:58 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.97)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1rt7Uf-0000000045N-1LbV; Sat, 06 Apr 2024 16:58:09 +0200
To: buildroot@buildroot.org
Date: Sat,  6 Apr 2024 16:58:02 +0200
Message-ID: <20240406145802.15700-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1712422711;
 bh=l6cR47HtdUnrds6Atf2H3OGTnqcWmAqqVldLzVWGAj0=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=gBX9pvanSvF+9ZsXZAwTzJRAShbd5J//szhsKQ2LjY2OvzBQLdTxMPjW7rIOhWQwL3n/xyw1mMRvyDMaWw0WV2CDeB+cGW/JZFWRJ2EbY0MH1b2TwFBSy8ymfGULSSePZR/6qKrfh46UViPg3kh5JWwKQ2j9Ka6RdFpEU5cyBMzQ902H/+lG6fuqEnHKBTHAcHUVcRS8jHse6C8NL0uAIdoEYgRog66dvJxUGOcrkrEBgpbg3pBLbGVkZFfB9RPq0DiNUKY7PGe3CE8Z/9V5ubqg9bkMEJ8j0/ESEaZxTRh9gTO2NSq2KmbYSjJO1HoT8cAbL8lgjlMwdDlm4KHcEA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=gBX9pvan
Subject: [Buildroot] [PATCH] configs/bananapi_m2_zero: bump Linux to 6.8.4
 and U-Boot to 2024.04
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmVjZXNzYXJ5IGFkYXB0YXRpb25zOgotIFRoZSBTRCBjYXJkIGlzIG5vdyBjYWxsZWQgbW1jYmxr
MTsgYWRhcHQgTGludXggYm9vdCBjb21tYW5kIGFjY29yZGluZ2x5LgotIFRoZSBEVEIgaXMgbm93
IHVuZGVyIHRoZSBhbGx3aW5uZXIvIGZvbGRlci4KLSBVLUJvb3QgbmVlZHMgT3BlblNTTCB0byBi
dWlsZC4KCkZpeGVzOgotIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2pvYnMvNjU0NDUwMTExMQoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5j
ZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgotLS0KIGJvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLXplcm8vYm9vdC5jbWQg
fCAgMiArLQogY29uZmlncy9iYW5hbmFwaV9tMl96ZXJvX2RlZmNvbmZpZyAgICAgICB8IDEwICsr
KysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2JvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLXplcm8vYm9vdC5jbWQg
Yi9ib2FyZC9iYW5hbmFwaS9iYW5hbmFwaS1tMi16ZXJvL2Jvb3QuY21kCmluZGV4IDA4MTQ1MDkz
NWIuLjcwY2NkZjcwNDUgMTAwNjQ0Ci0tLSBhL2JvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLXpl
cm8vYm9vdC5jbWQKKysrIGIvYm9hcmQvYmFuYW5hcGkvYmFuYW5hcGktbTItemVyby9ib290LmNt
ZApAQCAtMSw0ICsxLDQgQEAKLXNldGVudiBib290YXJncyBjb25zb2xlPXR0eVMwLDExNTIwMCBl
YXJseXByaW50ayByb290PS9kZXYvbW1jYmxrMHAyIHJvb3R3YWl0CitzZXRlbnYgYm9vdGFyZ3Mg
Y29uc29sZT10dHlTMCwxMTUyMDAgZWFybHlwcmludGsgcm9vdD0vZGV2L21tY2JsazFwMiByb290
d2FpdAogCiBtbWMgZGV2IDAKIGZhdGxvYWQgbW1jIDAgJGtlcm5lbF9hZGRyX3IgekltYWdlCmRp
ZmYgLS1naXQgYS9jb25maWdzL2JhbmFuYXBpX20yX3plcm9fZGVmY29uZmlnIGIvY29uZmlncy9i
YW5hbmFwaV9tMl96ZXJvX2RlZmNvbmZpZwppbmRleCBlNWM4OWZjZTQwLi44YTNlNWNkODMwIDEw
MDY0NAotLS0gYS9jb25maWdzL2JhbmFuYXBpX20yX3plcm9fZGVmY29uZmlnCisrKyBiL2NvbmZp
Z3MvYmFuYW5hcGlfbTJfemVyb19kZWZjb25maWcKQEAgLTEsMjYgKzEsMjYgQEAKIEJSMl9hcm09
eQogQlIyX2NvcnRleF9hNz15CiBCUjJfQVJNX0ZQVV9ORU9OX1ZGUFY0PXkKLUJSMl9QQUNLQUdF
X0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV85PXkKK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhf
SEVBREVSU19DVVNUT01fNl84PXkKIEJSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iV2VsY29tZSB0
byBCdWlsZHJvb3QgZm9yIHRoZSBCYW5hbmFwaSBNMiBaZXJvIgogQlIyX1JPT1RGU19QT1NUX0lN
QUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgogQlIyX1JPT1RGU19QT1NU
X1NDUklQVF9BUkdTPSItYyBib2FyZC9iYW5hbmFwaS9iYW5hbmFwaS1tMi16ZXJvL2dlbmltYWdl
LmNmZyIKIEJSMl9MSU5VWF9LRVJORUw9eQogQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tj15Ci1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjkuMTEiCitCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjguNCIKIEJSMl9MSU5VWF9LRVJO
RUxfREVGQ09ORklHPSJzdW54aSIKIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9eQotQlIy
X0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InN1bjhpLWgyLXBsdXMtYmFuYW5hcGktbTIt
emVybyIKK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhbGx3aW5uZXIvc3VuOGkt
aDItcGx1cy1iYW5hbmFwaS1tMi16ZXJvIgogQlIyX1RBUkdFVF9ST09URlNfRVhUMj15CiBCUjJf
VEFSR0VUX1JPT1RGU19FWFQyXzQ9eQogIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNl
dAogQlIyX1RBUkdFVF9VQk9PVD15CiBCUjJfVEFSR0VUX1VCT09UX0JPQVJETkFNRT0iYmFuYW5h
cGlfbTJfemVybyIKIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQotQlIyX1RBUkdF
VF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMC4xMCIKK0JSMl9UQVJHRVRfVUJPT1Rf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMDQiCiBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RU
Qz15Ci1CUjJfVEFSR0VUX1VCT09UX05FRURTX1BZVEhPTjM9eQogQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19QWUxJQkZEVD15CitCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQogQlIyX1RB
UkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9NPXkKIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NVU1RP
TV9OQU1FPSJ1LWJvb3Qtc3VueGktd2l0aC1zcGwuYmluIgogQlIyX1BBQ0tBR0VfSE9TVF9VQk9P
VF9UT09MUz15Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
