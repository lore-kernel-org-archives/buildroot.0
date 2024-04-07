Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F5CCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 18:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2222160A6A;
	Sun,  7 Apr 2024 18:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BNQjrdAUKut; Sun,  7 Apr 2024 18:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2999B60A76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2999B60A76;
	Sun,  7 Apr 2024 18:42:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58A771BF293
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 18:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB9E3404B4
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 18:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-A_tXctcO9u for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 18:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F79740103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F79740103
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F79740103
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 18:42:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4162b7f18b6so20156885e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 11:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712515324; x=1713120124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RtH78fBnW1m4qhHwX5HA4eQVy3PPlVz9eCLPoU0f1Wg=;
 b=H4iY4JM3DIINmuxL7xFbG/ugaKn/Pw6Ls+lu8GATVAxnLDDe5Bca0gApHXu3rvMLRe
 o8UMqXROqVYq8716mNuotLkM52d4tDG2JKLUZcPcsTltATtt0ARgkCAm/En3nCI/wXim
 uTE1xRyBK9Xhk3ZMpUCOTZMNkz9x2pu+cgpP+h1q8RN1SyTOntq6B8raQJ7EnpLqaGmN
 sKrcuTCC59OJVW6WVYQ2H0CEYMjPuSaU8Awnypzvs0U25M+jTFe8JmgR42r6758evu4r
 Tgo6Nn6TPV4CMvEgYEg/fFJskmM/r2KcPFel6TWT+5YHJ4spY/YJ/tMjYht+V6zxyoeK
 sh5w==
X-Gm-Message-State: AOJu0YwIhUMCkBJIjorOzWWmq3gAFk95EbrTERysw7Z9ttS2nhy/iBsh
 hQF6flFOP8xp3yatLwkLVv9k0eHULcwqhZCzhjsqDbfvrupB1AkQzB4UV+ld
X-Google-Smtp-Source: AGHT+IH/P5ZV+MxPgCy50VhK5YX97YOixQ5steRiJfpZFyJ+fn16xpED15otpWjtEa3+Ls9nZxvNyQ==
X-Received: by 2002:a05:600c:3ac6:b0:416:2c21:96c with SMTP id
 d6-20020a05600c3ac600b004162c21096cmr5082739wms.40.1712515323984; 
 Sun, 07 Apr 2024 11:42:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j31-20020a05600c1c1f00b004163de5135dsm5774524wms.34.2024.04.07.11.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 11:41:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 20:41:52 +0200
Message-ID: <20240407184152.3241588-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712515324; x=1713120124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RtH78fBnW1m4qhHwX5HA4eQVy3PPlVz9eCLPoU0f1Wg=;
 b=Tg4BWEzNbmtNe072q9NjS+vZrrVgtv773gPqfmqbFTkPA8TKF1wXb+zoazyu971dyo
 flVta1TlyRNCO6utypHjIPrQ4qO3gAFryeDkdZ2d4wrMynswQM5l2+W0G57NA50QBvke
 r17JKvpW6lOmswR5QhqDXDEz3isIxpluYzC0oQIhyoqDp0fgrG5kXA/fLf1KuP9fQUHg
 LQgUzIil4s0P7wAOW+ohqC/FQDlTk5VAZHLmOTe/OVeDoZTYmL1UvzIVPBlF2TCBtwTh
 h1s9HAJWA+vD5QL821Nqz3bU6y2X6FgV7dCjXrevhbaUKgwdU7yeSMJksQhLwbhSV9qa
 afeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tg4BWEzN
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix build with gcc >= 13
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGdjYyA+PSAxMzoKCkluIGZpbGUg
aW5jbHVkZWQgZnJvbSAuLi9zcmMvYmFzaWMvbWFjcm8uaDo0NDYsCiAgICAgICAgICAgICAgICAg
ZnJvbSAuLi9zcmMvYmFzaWMvYWxsb2MtdXRpbC5oOjEwLAogICAgICAgICAgICAgICAgIGZyb20g
Li4vc3JjL3NoYXJlZC9pbnN0YWxsLmM6MTI6Ci4uL3NyYy9zaGFyZWQvaW5zdGFsbC5jOiBJbiBm
dW5jdGlvbiDigJhpbnN0YWxsX2NoYW5nZXNfZHVtcOKAmToKLi4vc3JjL3NoYXJlZC9pbnN0YWxs
LmM6NDQ0OjY0OiBlcnJvcjog4oCYJXPigJkgZGlyZWN0aXZlIGFyZ3VtZW50IGlzIG51bGwgWy1X
ZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0KICA0NDQgfCAgICAgICAgICAgICAgICAgICAgICAgICBl
cnIgPSBsb2dfZXJyb3JfZXJybm8oY2hhbmdlc1tpXS50eXBlLCAiRmFpbGVkIHRvICVzIHVuaXQs
IHVuaXQgJXMgZG9lcyBub3QgZXhpc3QuIiwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKRml4ZXM6CiAtIGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm9yZy9yZXN1bHRzL2UwZDZiN2Q0MWZlZmVjNTM5YTE3YTNlZjVjODljMTkyY2Uy
OWZkMDQKClNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VA
Z21haWwuY29tPgotLS0KIC4uLnJuaW5nLWFib3V0LWVtcHR5LWRpcmVjdGl2ZS1hcmd1bWVudC5w
YXRjaCB8IDQ1ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zeXN0ZW1kLzAwMDEtaW5zdGFsbC1m
aXgtY29tcGlsZXItd2FybmluZy1hYm91dC1lbXB0eS1kaXJlY3RpdmUtYXJndW1lbnQucGF0Y2gK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvMDAwMS1pbnN0YWxsLWZpeC1jb21waWxlci13
YXJuaW5nLWFib3V0LWVtcHR5LWRpcmVjdGl2ZS1hcmd1bWVudC5wYXRjaCBiL3BhY2thZ2Uvc3lz
dGVtZC8wMDAxLWluc3RhbGwtZml4LWNvbXBpbGVyLXdhcm5pbmctYWJvdXQtZW1wdHktZGlyZWN0
aXZlLWFyZ3VtZW50LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
Ljk0MDhhNmRhMGUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3N5c3RlbWQvMDAwMS1pbnN0
YWxsLWZpeC1jb21waWxlci13YXJuaW5nLWFib3V0LWVtcHR5LWRpcmVjdGl2ZS1hcmd1bWVudC5w
YXRjaApAQCAtMCwwICsxLDQ1IEBACitGcm9tIDgwNDBmYTU1YTFjYmMzNGRlZGUzMjA1YTkwMjA5
NWVjZDI2YzIxZTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBMdWNhIEJvY2Nhc3Np
IDxibHVjYUBkZWJpYW4ub3JnPgorRGF0ZTogU2F0LCAyNCBGZWIgMjAyNCAxMjowNTo0NCArMDAw
MAorU3ViamVjdDogW1BBVENIXSBpbnN0YWxsOiBmaXggY29tcGlsZXIgd2FybmluZyBhYm91dCBl
bXB0eSBkaXJlY3RpdmUgYXJndW1lbnQKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworT24gcHBjNjRlbCB3aXRoIGdjYyAxMy4yIG9uIFVidW50dSAyNC4wNDoKKworM3MgSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIC4uL3NyYy9iYXNpYy9tYWNyby5oOjM4NiwKKzQ4M3MgICAgICAg
ICAgICAgICAgICBmcm9tIC4uL3NyYy9iYXNpYy9hbGxvYy11dGlsLmg6MTAsCis0ODNzICAgICAg
ICAgICAgICAgICAgZnJvbSAuLi9zcmMvc2hhcmVkL2luc3RhbGwuYzoxMjoKKzQ4M3MgLi4vc3Jj
L3NoYXJlZC9pbnN0YWxsLmM6IEluIGZ1bmN0aW9uIOKAmGluc3RhbGxfY2hhbmdlc19kdW1w4oCZ
OgorNDgzcyAuLi9zcmMvc2hhcmVkL2luc3RhbGwuYzo0MzI6NjQ6IGVycm9yOiDigJglc+KAmSBk
aXJlY3RpdmUgYXJndW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQorNDgz
cyAgIDQzMiB8ICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IGxvZ19lcnJvcl9lcnJubyhj
aGFuZ2VzW2ldLnR5cGUsICJGYWlsZWQgdG8gJXMgdW5pdCwgdW5pdCAlcyBkb2VzIG5vdCBleGlz
dC4iLAorNDgzcyAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cis0ODNzIC4uL3NyYy9zaGFyZWQvaW5zdGFsbC5jOjQzMjo3NTogbm90ZTog
Zm9ybWF0IHN0cmluZyBpcyBkZWZpbmVkIGhlcmUKKzQ4M3MgICA0MzIgfCAgICAgICAgICAgICAg
ICAgICAgICAgICBlcnIgPSBsb2dfZXJyb3JfZXJybm8oY2hhbmdlc1tpXS50eXBlLCAiRmFpbGVk
IHRvICVzIHVuaXQsIHVuaXQgJXMgZG9lcyBub3QgZXhpc3QuIiwKKworVXBzdHJlYW06IGh0dHBz
Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29tbWl0LzgwNDBmYTU1YTFjYmMzNGRlZGUz
MjA1YTkwMjA5NWVjZDI2YzIxZTMKK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgorLS0tCisgc3JjL3NoYXJlZC9pbnN0YWxsLmMgfCA3
ICsrKysrLS0KKyAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQorCitkaWZmIC0tZ2l0IGEvc3JjL3NoYXJlZC9pbnN0YWxsLmMgYi9zcmMvc2hhcmVkL2luc3Rh
bGwuYworaW5kZXggZmFiZjVkYjdlZDJlMS4uYzNhOTRkMTkxMjE2NSAxMDA2NDQKKy0tLSBhL3Ny
Yy9zaGFyZWQvaW5zdGFsbC5jCisrKysgYi9zcmMvc2hhcmVkL2luc3RhbGwuYworQEAgLTM0MCw5
ICszNDAsMTIgQEAgdm9pZCBpbnN0YWxsX2NoYW5nZXNfZHVtcChpbnQgciwgY29uc3QgY2hhciAq
dmVyYiwgY29uc3QgSW5zdGFsbENoYW5nZSAqY2hhbmdlcywKKyAgICAgICAgIGFzc2VydCh2ZXJi
IHx8IHIgPj0gMCk7CisgCisgICAgICAgICBmb3IgKHNpemVfdCBpID0gMDsgaSA8IG5fY2hhbmdl
czsgaSsrKSB7CistICAgICAgICAgICAgICAgIGlmIChjaGFuZ2VzW2ldLnR5cGUgPCAwKQorLSAg
ICAgICAgICAgICAgICAgICAgICAgIGFzc2VydCh2ZXJiKTsKKyAgICAgICAgICAgICAgICAgYXNz
ZXJ0KGNoYW5nZXNbaV0ucGF0aCk7CisrICAgICAgICAgICAgICAgIC8qIFRoaXMgdHJpZXMgdG8g
dGVsbCB0aGUgY29tcGlsZXIgdGhhdCBpdCdzIHNhZmUgdG8gdXNlICd2ZXJiJyBpbiBhIHN0cmlu
ZyBmb3JtYXQgaWYgdGhlcmUKKysgICAgICAgICAgICAgICAgICogd2FzIGFuIGVycm9yLCBidXQg
dGhlIGNvbXBpbGVyIGRvZXNuJ3QgY2FyZSBhbmQgZmFpbHMgYW55d2F5LCBzbyBzdHJuYSh2ZXJi
KSBpcyB1c2VkCisrICAgICAgICAgICAgICAgICAqIHRvby4gKi8KKysgICAgICAgICAgICAgICAg
YXNzZXJ0KHZlcmIgfHwgY2hhbmdlc1tpXS50eXBlID49IDApOworKyAgICAgICAgICAgICAgICB2
ZXJiID0gc3RybmEodmVyYik7CisgCisgICAgICAgICAgICAgICAgIC8qIFdoZW4gbWFraW5nIGNo
YW5nZXMgaGVyZSwgbWFrZSBzdXJlIHRvIGFsc28gY2hhbmdlIGluc3RhbGxfZXJyb3IoKSBpbiBk
YnVzLW1hbmFnZXIuYy4gKi8KKyAKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
