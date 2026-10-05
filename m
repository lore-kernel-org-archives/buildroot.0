Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE44FCA5FFC
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 795CB606AA;
	Mon,  5 Oct 2026 15:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wa-sJyL29Xxq; Mon,  5 Oct 2026 15:46:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 732CB60718
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791215163;
	b=gvj7x82B+4XZYHe5cnZXrKKmE9+IHDCMlZ2W45D38/oCU7fepJ9s9ATAOu2T6Iqo3Nxx
	 ybW0+ETOP4w25KQe25V0kYDDFw6eO9Kw5/KDdGokOlg0AVnY9jBJ5ONh1R7SpbAmtZkv2
	 lcAHXA8slQpzZ6kY/Xc/mzx8ROdvIKD3Ho3W/aPp3HF3V7Rt8y0zYMMpm18wewdimACud
	 zt3NsQ8geh8RpOjl3dBnAyv937BAYMgEPoAGAApm+okAvaomGX1tKUkmIL3hRwJAgmeJF
	 Z7mDexKvjVAWR/7ieY/FkuJNBwnTjZs8iE+cXPxLdNpVCguKp7cuoUSxb1IGgRZGbKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791215163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9EgUixasqRYhBDfoovoZZC1W1vOuMSvy7a6iGniu2HA=;
	b=itTJo+V2bitoOyUCqZjN9VJ3olMSQ9/y5RrXlWd4Gfq2WN63KTKCUlrsk1DOJauWPGYZ
	 142fVtc/jsEtCWP7vhY5X+NsJa/oObCGCFqQMiYyHEKx3V9qfO4huX9lHnDJokRIBDpi9
	 JLN9fQxxpvAlxQBMVpIU52nMsMQs5fZUVM0ATPpTbA6XFhkxamn6vcdx5wUCxVp+on238
	 YgTw1AU4A+bU8hzD52qnZHQqyyQaKj39fLLxzc+8dUZrmtWTi4nszsYAicOYCdkX8UDZY
	 hAcFggM8vpND0RF6yi1dXa+NPNx/5XKnG8zhJvGaJWto836bZYJ0X8xoqS7Go6eSmbg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791215163;
	bh=9EgUixasqRYhBDfoovoZZC1W1vOuMSvy7a6iGniu2HA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Jx3GWcKKbxP/5DebFFfopjeGlZ7h0ubqROxKakhCqozBuaAPPk7+ICm/hxvlYI25v
	 DSuZj70eD46vvFCfe4l1bgdFGhJhqJmQ2lsGjQplvp/xiRIA1GcBTBxObgun4d04tA
	 FdqUA8YL7gbvZBGS3UW6+rPnAx9C3ahQJ8NI4bJLRQWzimVF/N5q2N6WNi21tDzfXS
	 0PxqXyLiGjUdpriz7GhmGC1sFezDEl4S+fuBPlkrlhneyeB/v2CxQ35fgOkUxlhK6T
	 t10Q9UPojs18YrJ+LWxkOucww2w93D304m9JKV6e77NdLYuN3NUe/QZTzJZZdOl+DB
	 uDuBR9ou2IYwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 732CB60718;
	Mon,  5 Oct 2026 15:46:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0CC1338
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 926C860677
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPQF-14sZn7J for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 15:41:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 362186065A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791214887;
 b=G6AVECgZlrI5Jtvrp+eZZx5cKxHEcjIzK1WUeexGEgfqOvSQcKmMHdK/pDuZmNkQH9dD
 ypHcr6NrshZsjnUW/2q1CdwzXT+l4BXjrCcPVl94FVDx8voX9Zf8G0Fa0hDxZtH7ms8w9
 g7sB7J3U6T4trBvSN7wkVL6mEahUkOcF/F5fMhfB2YxT9dFyynm2FSbV8FKG7/XmOmVPW
 6EXqINgFgPC9qhUZmAW5Z6Edk+45Pvh4L7QCukMgnRSVIkoHjYvKy355+KPfbGQBAeQh0
 659p8xyMoADc94givkZFQNHC//YOkskxdg8ylWqpyPYnzfKBOwkalW1O4GjGSA6ee1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791214887;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=zARKmKD1dGQZ5nJKSzjw6Gursbm46OAcfcoNsIqKS5g=;
 b=B9KSlFh2PskMzDdRJWvkC8XfsxCJWX53Hu1YipNrYF5u6VQ1HOdxcVR5Pg+N07u6PwxH
 N/XDyANUuWOd/J1oBpVox6HGfbOLzVF6s2tlYD9UqpXAZ/dFWucebx+MTuKTbSLbIu7qk
 Tu0RPbvFuoRYPciwEikWd6b7GUQ/7M3hlRWpw8W9eQSbsIlm80+WyoPJhSbLfjnG/icg6
 teg0PGaxtmdbz7rCdqHh1DPbcTlvNvVmZh8UW5AS7MjAZ11rCsKyTBdoyCjq12nUSpPWD
 uNr+10ltduIrv9droMQ5mkpPIkPx4ksLTq9fG6/zjaUU9i+vqwCBbPPIaweBt7r/5bw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="Hhx7l/9D"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 362186065A
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 15:41:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49e73611928so33695e9.1
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 08:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791214883; x=1791819683;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zARKmKD1dGQZ5nJKSzjw6Gursbm46OAcfcoNsIqKS5g=;
 b=Ifx20nMiAFTIjzyOjPz1ycnP0Re0mtlYqWJsamoHRYl0FHy5bY39r/IPrUYLp6EkLI
 2WZLiUxVKfTO88LmAO4YE2NXIqBq3ALl0PPxLULhAjTU4VRZLZEKHy3l6dMzqMP3UCMA
 htM7/E6WC1eCU9hj7LaF5RReIzE98VbI/MQYEN7Zd8Tdmkq4PRjDWc4NXLTzZPESMIl/
 6SG+Z4x+DVs+mVKfpQvXL7+MW5dmHaj7EeM7g46CG+hAz01YTxnY1RPnxJcFuYlnnUVD
 YY+SU0YMuoI51bT0Itew+6cpETRLsSVgcy9dbw3+CeiN0qpBVQEMVIxfQ+1QDHe05tMs
 thGw==
X-Gm-Message-State: AFq9FYKkho3tjKZZDSUJLhwEHOrHfIZYLpqzWRFtHhPwQJYU/0hqQlIA
 x3JBxFdPr+K48/rHEud1XUehvGgsDCrsZiOc5P3PNl44SUYIMwhwTxeWZinJW5kyjWakAqGyVX7
 qDVQTWsoEhg==
X-Gm-Gg: AYBFou11xJxrHontOa3ECiHnQs597ZpLTu1Xxv2Sg9MdlcCZsz3fRyTv6AqI7cApLrV
 143TRHGlaGYgkKuKCCyV6RtprjonJ5140eLHjVxhsHumHBJqOSZAZ4hOK9g3G8fyU5hq7XtSssa
 +mhxHxePjLzIzfK4VtUCmlf5ruqrxSTCrVCv5QNOfyy7V2VQoorig9wuDJiJyuSmc7deTFJ75VZ
 ILRzaYQ3J7SoJNJZWR8h5aOhEZX2m2dDLe7F/2ilwb/HWd3APifBtk4vPiXvx0xD7E6muqrCPfk
 HA+9DTjxmQh5u6t4rX9KTu2pgQxVAiHY6S9VPs8x0pjrwnTSn9iEKfPH+dPsbmJ/9mNbP4Ccb6h
 E/D5nPYFMjwm/xWj0hAIVY23hvFrkM0m4GSiXAZvAla4mSA3MWubOmGldqQG12iNFXrSf7aSQ+T
 VbuUv6Po0hmkmAB5qk2aSHv48s/w7QzgN20siwlPe2MsJtS5Zy/NvMrnp0DEmw5iS8RI61V/dDp
 0DU8JUO6PCF9ifEHLP7mA+fgZzGxd8M85Ouc+oL2Q==
X-Received: by 2002:a5d:6891:0:b0:488:8b9f:6561 with SMTP id
 ffacd0b85a97d-48b068cb5e0mr22206916f8f.30.1791214883343; 
 Mon, 05 Oct 2026 08:41:23 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c642b42d6sm3248800f8f.9.2026.10.05.08.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 08:41:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 17:40:43 +0200
Message-ID: <20261005154047.413898-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930120101.474560-1-raphael.melotte@mind.be>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/python-pipcl: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGlwY2wgdXNlZCB0byBiZSBidW5kbGVkIGluIHB5dGhvbi1weW11cGRmLCBidXQgaXMgbm93IGF2
YWlsYWJsZSBhcyBhCnNlcGFyYXRlIHBhY2thZ2UuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBN
w6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYyOgog
IC0gUmVtb3ZlIENvbmZpZy5pbgoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLmhhc2ggfCAgNSAr
KysrKwogcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLm1rICAgfCAxNSArKysrKysr
KysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXBpcGNsL3B5dGhvbi1waXBjbC5oYXNoCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLm1rCgpkaWZmIC0tZ2l0
IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZDYyYmZhYWZiMy4uMjE3ZmNlMDNhOSAx
MDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0yODQ5LDYgKzI4NDks
NyBAQCBGOglwYWNrYWdlL211cGRmLwogRjoJcGFja2FnZS9weXRob24tYm90bzMvCiBGOglwYWNr
YWdlL3B5dGhvbi1ib3RvY29yZS8KIEY6CXBhY2thZ2UvcHl0aG9uLWptZXNwYXRoLworRjoJcGFj
a2FnZS9weXRob24tcGlwY2wvCiBGOglwYWNrYWdlL3B5dGhvbi1weW11cGRmLwogRjoJcGFja2Fn
ZS9weXRob24tcnNhLwogRjoJcGFja2FnZS9weXRob24tczN0cmFuc2Zlci8KZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcHl0aG9uLXBpcGNsL3B5dGhvbi1waXBjbC5oYXNoIGIvcGFja2FnZS9weXRob24t
cGlwY2wvcHl0aG9uLXBpcGNsLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uZjAxYWYwY2NlZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXBpcGNs
L3B5dGhvbi1waXBjbC5oYXNoCkBAIC0wLDAgKzEsNSBAQAorIyBtZDUsIHNoYTI1NiBmcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHlwaS9waXBjbC9qc29uCittZDUgIDc2ODgzMjQzNjEwMjc4Yjc3NzI1
ZmViMTgxMzE0MWY4ICBwaXBjbC0xMi50YXIuZ3oKK3NoYTI1NiAgYzc1NDU0ODBjZmE4MDg1MDBk
OGI2MDZkYTczZGI3Zjg5YTg3MjI1OGJjZGIyOTM3MTYxMjZlMmNjZmYxYTVjNiAgcGlwY2wtMTIu
dGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcworc2hhMjU2ICA1N2M4
ZmYzM2M5YzBjZmMzZWYwMGU2NTBhMWNjOTEwZDdlZTQ3OWE4YmM1MDlmNmM5MjA5YTdjMmExMTM5
OWQ2ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1waXBjbC9weXRob24tcGlw
Y2wubWsgYi9wYWNrYWdlL3B5dGhvbi1waXBjbC9weXRob24tcGlwY2wubWsKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzBlOTdlZWViMwotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcHl0aG9uLXBpcGNsL3B5dGhvbi1waXBjbC5tawpAQCAtMCwwICsxLDE1IEBACisj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBweXRob24tcGlwY2wKKyMKKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCisKK1BZVEhPTl9QSVBDTF9WRVJTSU9OID0gMTIKK1BZVEhPTl9QSVBDTF9T
T1VSQ0UgPSBwaXBjbC0kKFBZVEhPTl9QSVBDTF9WRVJTSU9OKS50YXIuZ3oKK1BZVEhPTl9QSVBD
TF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzY0LzFhLzlh
YjJiMjcyZGVmOWRiOWM4MGJmMThmZTgyODIxMTljMmM0YzA3NGNjNTQyMDMwYTI4ZTQxMzZkZDEz
YgorUFlUSE9OX1BJUENMX1NFVFVQX1RZUEUgPSBwZXA1MTcKK1BZVEhPTl9QSVBDTF9MSUNFTlNF
ID0gQUdQTC0zLjArCitQWVRIT05fUElQQ0xfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKK0hPU1Rf
UFlUSE9OX1BJUENMX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uLXBhY2thZ2luZworCiskKGV2
YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
