Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8190CCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DD260A9A;
	Fri, 16 Oct 2026 13:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvkj4vEwu__8; Fri, 16 Oct 2026 13:07:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 535D6607CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156052;
	b=aiLOH4s1mlTZOcZStClQBSnmSZzie9jdA/He//3jh/LZENMjOPbKBdC3dERkY1H2Dtel
	 sfQNcdgz1mOiN+aouY17dh/Dm9LR7PiZS7nMfbndC1DZHWUTKoFZ2hZGvP7NFS8dvfDC5
	 DUTP1ijcjxmtbwISoJlKlp4xOxqNFewBYYc8u6cBPyiOb4S9vA6Ywm71to8nLrBAEM1NF
	 C0iPw61av3NbFRPwZxiQSn3y3zS4c70Us96ll8c/qx6BZIioR/lxmapOXcSFvTE8e8viE
	 tZZIf6Y8BPVsyCtjmL9GRBZ9kBOaG/yMFM6PQto6/Pyzu0K39yuj4T2GAajcNQuqbsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PW1vQyOtaElJDcteAXHWBGsOzEfqcAbDwyTI323Jacg=;
	b=Tsug9qiycq4wRlGCEUwh9LPEqjn2RYTYxe9j24YAqDSZbdNE0HFOwCAjYxcfT8bInYKm
	 UWEsOe/1Z9GwAfKJBCyytF99xy+9YbCrdZrqhVREXonWrImexWEs6aBnr49lnmm4wf7Dv
	 98l6yVyhhdRQm68HDEJ+kS+wb3vAF4O2NfWjWqTLpkM2G7DTzRBEOBLmVN6Unn/vNPHLc
	 GeYejaW28z0wA61OB3DqD/mohitYbNlxEHPwjVLj4IF2sAAQtjgkJVqwf+c2q+4jWOFm3
	 kDeeIa9bZ79ZHCFWscRLPKNY6VDki2FMHvp3iFCW0zTXr0ad8KQ9vZRpuNli2xjzBNw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156052;
	bh=PW1vQyOtaElJDcteAXHWBGsOzEfqcAbDwyTI323Jacg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k8KwHsz/bf8KnOV8PAIQ1GukU2zKBGNhifFLrO7mweP5r+yAzhPfq6G+QElCwNdzl
	 OZ7FxjsZ9fFwhwl2+HoTNmpsYFvWEgj87Ed9A3IVKA5L1r1TychRic2sEuVjhspInx
	 UBkpsTXQGY+NVl4PornrSvNlxAXPCIxFGJzxXs+zLyUuduPdYhOe1aLy2gYIbmzm1P
	 Nos1fCx0SYng+KptJ/H/UyzIYJF4W74LyjBUqrrEesnMbVvcvo8NVk0DOBR/e1Y6Zu
	 osdC2c6U11zJ5hSGidDhDG2Woz+Vps0RTeQlTCoVUihRvZarXZgrk36NBcwYwWuzXy
	 xkEdAKTjLgEpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 535D6607CE;
	Fri, 16 Oct 2026 13:07:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B3E7769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C58F60662
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEGOoRmCO2Wc for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:07:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7743C607CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156049;
 b=ApfyHCck34SGkGtudUKM2PGrWhWUWu0RSxSg6EVJ0d8QubX1dGZ6+d8R6sqFlg/tAepI
 B7GRipiJDgFnf45GXhLGtM+Fy7KHNLcPO+BO1MY0uuc/1psVHTv1hKCOI7WLu2HjxeHtS
 vkUUpsXj37DksMzXGLv1l4OguO4mAPTxVgEMiQ5wGqT9WAEhJfdfCze3G234t1Zz3fokB
 n8sxDiPjWiJIWqjuu+rH/cHl9JYmzpYVXql2CHRkk+B4mObyW6SWZOuCQYg4sErzXUtfC
 fmwgxhEVDSUe63jdSj5dN+n2OCeggj4N5PloCVFfPKKsKL/LDJpNFXOolki96HvJI3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156049;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=V17GXx+gfUZCW1TtsUPuC1I338rh+++WjIi0bZHXqcU=;
 b=QdTKIOzDchKt1LQ8pofdeN45uL/doh7fukFBczed5bb2EqPSpYMFjEJt6K5NgHZnyuwo
 wdilytqcMJSGkXSmJOL2y05JTdRXxRP3Qi+puvZj9tWhWY9EkAuo+7bjwrbm5PRCXM6AY
 EIyFvwQEXmv4Rs1zfrfzKtyJ0D5+AS1CJy4Xym8531FSHxNqjF6BWomEQR/P28FucjbqO
 OeoD1OmioK1D89Cw6uLgFcgWcgF2Wp2uL2TGP6kPlajgF5p/zkAX9R66uNhwIrDjq82Is
 PVpqnaRuVS/D9jZgWENw6DV8CH1Nu5ICiHyngk1kDMMJh7Es4M70dOfcO2QUL1ZeMoA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ICaKSAOk; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7743C607CE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:07:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so4091100f8f.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 06:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792156046; x=1792760846;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V17GXx+gfUZCW1TtsUPuC1I338rh+++WjIi0bZHXqcU=;
 b=JzmGzKeVNVkmi5sa1wzF6otG0jfEWTS+W9f7c7RLZ3tAEvagjGEWT3uCj5gdcopkTh
 VoLSFtun7WRLge1l32E8yvx2aShySMpiTe6vEziLLmC5qAONSthhNxo2xHS7i9PNGEnu
 k41nPF1ijTAKimY7tpItoJd/zwD1R9oQRZjP3WTFgIdYB4IO79dObawdgolejU6J49Ki
 0p9V8wnvjJN37pJbTcr7T8Zp5uY0wW7PolAgyvWzHM+U4dqrQ1JXFKnfap+APdXN2iAG
 GG0JOrvkw+Lp5QcymByLtZtMGVGB1F+IGumaiSYJia3KVsBxE3GQg6RbIYjwg1oJWMyP
 zyYQ==
X-Gm-Message-State: AFq9FYLpNyJvJBDl4INaZ0JjcGZBeij7Vl1HReX8JjhyUf+HYbQlGb4i
 to+9XVza55MZRl11cC6MXoqfrUsp4ztTXPIHAJDjVLlnkJj3U1/2qLQGsXxGN+o0IfN5x4hxSww
 qlK0NPrU=
X-Gm-Gg: AYBFou3ncTf2jvqSXJr4ph2bWTQr1Diw57ZX4lirLbCITIWl+m5HvTuKFdNwJc0RsZo
 3CzODnf51atgoaY46al8xJMyFh966e2PXHsZ9HvaT3ckfOzCFV/iNApApLLqCHjHaxQsiC94WzK
 54l4fFRuk0VOPq47WoAr0ZOpukj4U9biTCNho5XmTXwAmBvYIq9mi8IYgOxqEnzvE7Bf29Nellr
 rx6jbKMRqK6FqtQQUcmPRYH3Br5yn/jHLOZHIjUmOn4dKH/eZdhleWwgxmMD6uzQvIxbHT7HkW3
 yKA9yHYc6ZaxGh2ZKYW4ZGsC9/GPj7lYz03khgj87Tuw9fWegQNtwU7YkA+JzwACfZNua0gGo0E
 AElljm24LpUz9LCLaaT5cO8/r6WOyt8vSLsngq0JepXyJOxmUR5Nm6XtutXxUU3eLUBaVNSs+ZP
 WHsuHgnUlEeXLuHOZCY5I/oFWd4+wfIHzG6kIyidwTaUWMEMQHBOmiXCmVmoe3aP3m36q0oFDtR
 xJYK0LX7J83RSxdWxUzcMCr8mlVINqMAlNziLniVg==
X-Received: by 2002:a05:6000:2f89:b0:488:89ed:4430 with SMTP id
 ffacd0b85a97d-48dbacdfc52mr46683989f8f.33.1792156045644; 
 Fri, 16 Oct 2026 06:07:25 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd471a35sm4363721f8f.7.2026.10.16.06.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 06:07:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 15:07:14 +0200
Message-ID: <20261016130716.32627-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001072630.546933-1-raphael.melotte@mind.be>
References: <20261001072630.546933-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] utils/bump-stable-kernel-versions: fix
 newline in commit message
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnkgZGVmYXVsdCAoeHBnX2VjaG8gZGlzYWJsZWQpIGJhc2gncyBlY2hvIGRvZXNuJ3QgZXhwYW5k
IGVzY2FwZXMsCndoaWNoIHJlc3VsdHMgaW4gYSBsaXRlcmFsICdcbicgYmVpbmcgaW5zZXJ0ZWQg
aW4gdGhlIGNvbW1pdAptZXNzYWdlLiBGb3IgZXhhbXBsZToKVXBkYXRlIHRoZSBsYXRlc3Qga2Vy
bmVsIHJlbGVhc2VzIHRvOlxuIC0gNi4xOC41MyAtPiA2LjE4LjU0CgpDb21taXQgZGEwMWI3Mjcx
YSAoInV0aWxzL2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9uczogdXBkYXRlIGZvcgpzcGxpdCBo
YXNoIGZpbGUiKSBhZGRlZCB0aGUgJ1xuJyBsaW5lLCBidXQgYXQgdGhhdCBwb2ludCB0aGUgdmFy
aWFibGUKd2FzIG5ldmVyIHByaW50ZWQuCgpUaGUgYnVnIGJlY2FtZSB2aXNpYmxlIGluCmZhYjUw
ZWQzYjEgKCJ1dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnM6IGF1dG9tYXRpY2FsbHkg
Y29tbWl0CnJlc3VsdCIpLCB3aGVuIGVjaG8gIiR7dXBkYXRlZF92ZXJzaW9uc30iIHdhcyBpbnRy
b2R1Y2VkLgoKU2luY2UgdGhlIHNjcmlwdCBhbHJlYWR5IHVzZXMgYmFzaCBhcnJheXMgYW5kIHRo
ZSBsaXN0IG9mIHVwZGF0ZWQKdmVyc2lvbnMgZml0cyBhbiBhcnJheSB3ZWxsLCB1c2Ugb25lLiBU
aGlzIGFsbG93cyB1cyB0byBlYXNpbHkgcHJpbnQKaXRzIGNvbnRlbnQgd2l0aCBhY3R1YWwgbmV3
bGluZXMgd2l0aG91dCBzdG9yaW5nIHRoZW0gaW4gYSB2YXJpYWJsZS4KClRoZSBmaXhlZCBzdHJp
bmcgaW5pdGlhbGx5IGNvbnRhaW5lZCBpbiAndXBkYXRlZF92ZXJzaW9ucycgaXMgYWxzbwptb3Zl
ZCB0byBhbiBlY2hvIGNhbGwsIHNvIHRoYXQgJ3VwZGF0ZWRfdmVyc2lvbnMnIHJlYWxseSBjb250
YWlucyBvbmx5CnRoZSBsaXN0IG9mIHVwZGF0ZWQgdmVyc2lvbnMuCgpGaXhlczogZmFiNTBlZDNi
MTUzMjAzN2ZhNjc1ODJhNmI0N2FjNDA4NGRhYWE4OCAoInV0aWxzL2J1bXAtc3RhYmxlLWtlcm5l
bC12ZXJzaW9uczogYXV0b21hdGljYWxseSBjb21taXQgcmVzdWx0IikKU2lnbmVkLW9mZi1ieTog
UmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KQ2hhbmdlcyB2
MSAtPiB2MjoKICAtIHVzZSBhIGJhc2ggYXJyYXkgaW5zdGVhZCBvZiBBTlNJIEMgcXVvdGluZy4K
CiB1dGlscy9idW1wLXN0YWJsZS1rZXJuZWwtdmVyc2lvbnMgfCA3ICsrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdXRp
bHMvYnVtcC1zdGFibGUta2VybmVsLXZlcnNpb25zIGIvdXRpbHMvYnVtcC1zdGFibGUta2VybmVs
LXZlcnNpb25zCmluZGV4IGFmODVkMzI4NTIuLmIwMmI4NTRkOTUgMTAwNzU1Ci0tLSBhL3V0aWxz
L2J1bXAtc3RhYmxlLWtlcm5lbC12ZXJzaW9ucworKysgYi91dGlscy9idW1wLXN0YWJsZS1rZXJu
ZWwtdmVyc2lvbnMKQEAgLTI3LDcgKzI3LDcgQEAgZWNobyAiJHtsYXRlc3RfdmVyc2lvbn0gLT4g
JHtsYXRlc3RfcmVsZWFzZV92ZXJzaW9ufSIKIAogdXBkYXRlZF9maWxlc19saXN0PSgpCiB1cGRh
dGVkX3JlbGVhc2VzX2xpc3Q9JycKLXVwZGF0ZWRfdmVyc2lvbnM9J1VwZGF0ZSB0aGUgbGF0ZXN0
IGtlcm5lbCByZWxlYXNlcyB0bzonCit1cGRhdGVkX3ZlcnNpb25zPSgpCiAKIHVwZGF0ZV9saW51
eF9oYXNoKCkgewogICAgIEhBU0hGSUxFPSIkMSIKQEAgLTg1LDcgKzg1LDcgQEAgdXBkYXRlX2xp
bnV4X2hhc2goKSB7CiAgICAgICAgICAgICAgICAgZmkKIAogICAgICAgICAgICAgICAgIHVwZGF0
ZWRfcmVsZWFzZXNfbGlzdD0iJHt1cGRhdGVkX3JlbGVhc2VzX2xpc3R9ICR7cmVsZWFzZV92ZXJz
aW9ufS54IgotICAgICAgICAgICAgICAgIHVwZGF0ZWRfdmVyc2lvbnM9IiR7dXBkYXRlZF92ZXJz
aW9uc31cbiAtICR7b2xkX3ZlcnNpb259IC0+ICR7bmV3X3ZlcnNpb259IgorICAgICAgICAgICAg
ICAgIHVwZGF0ZWRfdmVyc2lvbnMrPSgiJHtvbGRfdmVyc2lvbn0gLT4gJHtuZXdfdmVyc2lvbn0i
KQogICAgICAgICAgICAgZmkKICAgICAgICAgZWxzZQogICAgICAgICAgICAgIyBEaWZmZXJlbnQg
bGluZTogUmVzZXQgaGFzaCBsaXN0IGFuZCBqdXN0IGNvcHkgdGhpcyBsaW5lIG92ZXIgYXMgaXMu
CkBAIC0xMTEsNyArMTExLDggQEAgaWYgWyAtbiAiJHt1cGRhdGVkX3JlbGVhc2VzX2xpc3R9IiBd
OyB0aGVuCiAgICAgZ2l0IGNvbW1pdCAtLXZlcmJvc2UgLS1lZGl0IC0tc2lnbm9mZiAtLWZpbGU9
PCggewogICAgICAgICBlY2hvICJ7bGludXgsIGxpbnV4LWhlYWRlcnN9OiBidW1wJHt1cGRhdGVk
X3JlbGVhc2VzX2xpc3QvLy54IC8ueCwgfSBzZXJpZXMiCiAgICAgICAgIGVjaG8KLSAgICAgICAg
ZWNobyAiJHt1cGRhdGVkX3ZlcnNpb25zfSIKKyAgICAgICAgZWNobyAnVXBkYXRlIHRoZSBsYXRl
c3Qga2VybmVsIHJlbGVhc2VzIHRvOicKKyAgICAgICAgcHJpbnRmICcgLSAlc1xuJyAiJHt1cGRh
dGVkX3ZlcnNpb25zW0BdfSIKICAgICB9ICkKIGVsc2UKICAgICBlY2hvICc+Pj4gTm90aGluZyBo
YXBwZW5lZC4nCi0tIAoyLjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
