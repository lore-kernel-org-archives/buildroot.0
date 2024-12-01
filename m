Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98F9D49779
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 16:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80BC360BA2;
	Sun,  1 Dec 2024 16:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeZyPlhS56KQ; Sun,  1 Dec 2024 16:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D7B36157C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D7B36157C;
	Sun,  1 Dec 2024 16:50:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0373A976
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1605584D20
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTFgUGJOZUIN for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 16:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.54;
 helo=sender4-of-o54.zoho.com; envelope-from=daniel@tohka.us;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4642B84D23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4642B84D23
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4642B84D23
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 16:50:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733071796; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dkbUGwqLD543AxX0w+BuT86B2o6BVVLG9vz92PdNas+8HfrhJDdSr/w6fwAfhRdUff/IJEhw22ecfnVWZ3eIXeM8EuGjxu+WJy5A8DDXPfSM1F+dNOlxxTeszrj/597nWD4AfgUDPT+3kTltrDUFYf4spu+sj6kv3zt+OVad8kI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733071796;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jvSaYjaAij9bzP0dGnd6zXRBW947Fmp07WPoFCjqV1Q=; 
 b=n5h2vZ+smU0lCb1a8ksEjH29lPwKEXX2vt4r5NTrckoojrVvGWOKX4J53hd3A1+3IGD19zzNYR0xVgy7vuUNK+70qgaTujn9pQRT8k2cVMZUHdooUPnAm12IvOd37cWTPEWxZeS65RbdrMbvofVOFnuXZ0ty7FA+Qk04Bpjk8Dc=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=tohka.us;
 spf=pass  smtp.mailfrom=daniel@tohka.us;
 dmarc=pass header.from=<daniel@tohka.us>
Received: by mx.zohomail.com with SMTPS id 1733071794939762.6901556142947;
 Sun, 1 Dec 2024 08:49:54 -0800 (PST)
From: =?UTF-8?q?Derzsi=20D=C3=A1niel?= <daniel@tohka.us>
To: buildroot@buildroot.org
Date: Sun,  1 Dec 2024 18:49:49 +0200
Message-ID: <20241201164949.21267-1-daniel@tohka.us>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1733071796; 
 s=tohka; d=tohka.us; i=daniel@tohka.us;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=jvSaYjaAij9bzP0dGnd6zXRBW947Fmp07WPoFCjqV1Q=;
 b=abK6WM1Iaqv0VuVVZH46/sgroQ1T81NxjukTMpRzsnV11bLi56NIYihGZTeke1e9
 HEfWkaAqMCh59RvVFz9FJWeoeTpMWWO/reoNQaRRXWqN1ybN9iWeHsUJNk9PH+WWrpA
 rtvrJWTt3H0jTbCjqhyNpU3ti3eBHt2ShQmruu0Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=tohka.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=tohka.us header.i=daniel@tohka.us
 header.a=rsa-sha256 header.s=tohka header.b=abK6WM1I
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.12
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
Cc: =?UTF-8?q?Derzsi=20D=C3=A1niel?= <daniel@tohka.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nIC0gaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvcmVsZWFzZXMvdGFn
L3Y2LjEyCgpTaWduZWQtb2ZmLWJ5OiBEZXJ6c2kgRMOhbmllbCA8ZGFuaWVsQHRvaGthLnVzPgot
LS0KIHBhY2thZ2Uvc3RyYWNlL3N0cmFjZS5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3N0cmFjZS9z
dHJhY2UubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3RyYWNlL3N0cmFjZS5oYXNoIGIvcGFj
a2FnZS9zdHJhY2Uvc3RyYWNlLmhhc2gKaW5kZXggZTE2N2Y5ZDIuLmI1YTUzYzYyIDEwMDY0NAot
LS0gYS9wYWNrYWdlL3N0cmFjZS9zdHJhY2UuaGFzaAorKysgYi9wYWNrYWdlL3N0cmFjZS9zdHJh
Y2UuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNr
aW5nIHNpZ25hdHVyZSB3aXRoIFJTQSBrZXkgMHhBODA0MUZBODM5RTE2RTM2Ci0jIGh0dHBzOi8v
c3RyYWNlLmlvL2ZpbGVzLzYuMTEvc3RyYWNlLTYuMTEudGFyLnh6LmFzYwotc2hhMjU2ICA4MzI2
MjU4M2EzNTI5ZjAyYzM1MDFhYThiOGFjNzcyYjRjYmMwM2RjOTM0ZTk4YmFiNmU0ODgzNjI2ZTI4
M2E1ICBzdHJhY2UtNi4xMS50YXIueHoKKyMgaHR0cHM6Ly9zdHJhY2UuaW8vZmlsZXMvNi4xMi9z
dHJhY2UtNi4xMi50YXIueHouYXNjCitzaGEyNTYgIGM0N2RhOTNiZTQ1YjYwNTVmNGRjNzQxZDdm
MjBlZmFmNTBjYTEwMTYwYTViMTAwYzEwOWIyOTRmZDljMGJkZmUgIHN0cmFjZS02LjEyLnRhci54
egogc2hhMjU2ICAxOTg4ZDBlMWFhMTAxZDY4ODU1ZThjNGY5NDBhYWNmMjUzMTA1MWI4MmY2YjYw
OGViMDI2YzVmYWQxZjMzZGYxICBDT1BZSU5HCiBzaGEyNTYgIDdjMzc5NDM2NDM2YTU2MjgzNGFh
N2QyZjVkY2FlMWY4MGEyNTIzMGZhNzQyMDEwNDZjYTFmYmE0MzY3ZDM5YWEgIExHUEwtMi4xLW9y
LWxhdGVyCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmFjZS9zdHJhY2UubWsgYi9wYWNrYWdlL3N0
cmFjZS9zdHJhY2UubWsKaW5kZXggMzY3YTQ0ZGEuLjVhZGExOGM2IDEwMDY0NAotLS0gYS9wYWNr
YWdlL3N0cmFjZS9zdHJhY2UubWsKKysrIGIvcGFja2FnZS9zdHJhY2Uvc3RyYWNlLm1rCkBAIC00
LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotU1RSQUNFX1ZFUlNJT04g
PSA2LjExCitTVFJBQ0VfVkVSU0lPTiA9IDYuMTIKIFNUUkFDRV9TT1VSQ0UgPSBzdHJhY2UtJChT
VFJBQ0VfVkVSU0lPTikudGFyLnh6CiBTVFJBQ0VfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9z
dHJhY2Uvc3RyYWNlL3JlbGVhc2VzL2Rvd25sb2FkL3YkKFNUUkFDRV9WRVJTSU9OKQogU1RSQUNF
X0xJQ0VOU0UgPSBMR1BMLTIuMSsKLS0gCjIuNDcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
