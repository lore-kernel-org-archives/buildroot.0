Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4B4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 18:22:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56EDA60EE9
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 18:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56EDA60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9AEB40243;
	Sun, 26 Sep 2021 18:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29u7nn_Is_j2; Sun, 26 Sep 2021 18:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7D2940226;
	Sun, 26 Sep 2021 18:22:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22B771BF30D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 18:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123C5818A2
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 18:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WzJx3Xl4vNH for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 18:22:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFE19817ED
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 18:22:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g16so45233461wrb.3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EHEsW5TE8pz7MYeVswhhij0ZVZSGwxxURlmws+ZOLfY=;
 b=BaMo9B5LXUpTpdJbKYTE4OIbmReT8KoVjsTMmBxRhm0CiqvBLFBOPmp5yfoj/ueiDB
 1FjPbTScZO0JZQDqdT8CHJafKT6c5xnpFzApFX9FfpMGjLQCVvySZBTyXkrouXkFNh7O
 kD2zuU+0bzjJX9SaAOCFuJ1dqjIJUp0xWYIvNGaq7NDKbq6ej+6lypLSh+B7m7UuMvlz
 l5Y0j65MpYY6XZd8Dvyk8b73NA1cpqIr2JGDJv9BEH1W6jG+cs0wY3YAJEtat7SNz/Ud
 COHBn+vaRu45Bi+/D0Rp0MCb9etN1GMC0zU4sxPpH71mWachRTLxjwuhnqUqvuT11odD
 J5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EHEsW5TE8pz7MYeVswhhij0ZVZSGwxxURlmws+ZOLfY=;
 b=aNfgV9kiCMp/XuSUxQTQNvySbgbLTw4+Kd/tKbhwQGHiwBwQJigFxK1Ut43uOShuf2
 ym4MqD24z1GgvDjzcAHVlcJEDRObu2/KF/chEJdKqjGUT61F2dfEC/oBuPBljoituT30
 1Ob91WP9GNZRQZdN0nvERVpTInz+6EmfPCF0YRwqRV6lMzIEXG2IWMBHdJDzEDFrQ//k
 PiJeJoaltqhWqiLjnbj/FahM0lMaKnWhIslxBzKsyddSDdDDuZ+WT0l77wXTgH56AmIF
 DRSmlV5b2Qnsr4UF1i3QAPSIZuXZ6xHnUFRwuEv4vz3WsAJNWFoq7UmN5OSBa0JV6VEs
 XvCA==
X-Gm-Message-State: AOAM531bRqTgDAEq9b8ViKol1PVmKGOEi4t6EKHjeLSrf1INmP9VmEm7
 AYRgIA9Ivm2l7mG8vTKpcqMk52MRasuuYQ==
X-Google-Smtp-Source: ABdhPJxRD2siFY78Qn2r9U9CbyZNL3HprejUwgSucBkp/XzV5QijodlfKhNI0nj9oSah3XZstXrmFw==
X-Received: by 2002:adf:bb07:: with SMTP id r7mr24351902wrg.310.1632680557909; 
 Sun, 26 Sep 2021 11:22:37 -0700 (PDT)
Received: from localhost.localdomain ([109.143.67.179])
 by smtp.gmail.com with ESMTPSA id i27sm18961275wmb.40.2021.09.26.11.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 11:22:37 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 20:22:10 +0200
Message-Id: <20210926182211.1121174-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210907120933.31647-1-raphael.melotte@mind.be>
References: <20210907120933.31647-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/mupdf: fix building with mips
 toolchains
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aCBzb21lIHRvb2xjaGFpbnMgKGUuZy4gbWlwczY0ZWwpLCBwYXJ0aWFsIGxpbmtpbmcgZmFp
bHMgaW4gdGhlCmZvbGxvd2luZyB3YXk6Ci90bXAvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29w
dC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmMvOC40LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9i
aW4vbGQ6IGJ1aWxkL3JlbGVhc2UvbGlibXVwZGYuYShEaW5nYmF0cy5jZmYubyk6IEFCSSBpcyBp
bmNvbXBhdGlibGUgd2l0aCB0aGF0IG9mIHRoZSBzZWxlY3RlZCBlbXVsYXRpb24KL3RtcC9pbnN0
YW5jZS0xL291dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2MvbWlw
czY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy84LjQuMC8uLi8uLi8uLi8uLi9taXBzNjRlbC1i
dWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9sZDogZmFpbGVkIHRvIG1lcmdlIHRhcmdldCBzcGVj
aWZpYyBkYXRhIG9mIGZpbGUgYnVpbGQvcmVsZWFzZS9saWJtdXBkZi5hKERpbmdiYXRzLmNmZi5v
KQoKVGFraW5nIGluc3BpcmF0aW9uIGZyb20gY29tbWl0CjllY2E0YjlmODRmZTI1MzVkOGNhZWU2
ZWViMDYyY2UzMzczM2JkZjEsIGZpeCBpdCBieSB1c2luZyBHQ0MgaW5zdGVhZApvZiBMRCBmb3Ig
cGFydGlhbCBsaW5raW5nLgoKTm90ZSB0aGF0IG9uIG1pcHMgdGhlIGJ1aWxkIHdpbGwgbm93IHBy
b2R1Y2Ugd2FybmluZ3Mgc2ltaWxhciB0byB0aGlzCm9uZToKYnVpbGRyb290L291dHB1dC9ob3N0
L2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS8xMC4zLjAvLi4vLi4vLi4vLi4v
bWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IGJ1aWxkL3JlbGVhc2UvbGlibXVw
ZGYuYShOb3RvU2Fuc1RhaVRoYW0tUmVndWxhci50dGYubyk6IHdhcm5pbmc6IGxpbmtpbmcgYWJp
Y2FsbHMgZmlsZXMgd2l0aCBub24tYWJpY2FsbHMgZmlsZXMKCkR1cmluZyBhIHJ1bnRpbWUgdGVz
dCBvbiBtaXBzNjRlbCB1bmRlciBxZW11LCBtdXBkZi14MTEgd2FzCm5vbmV0aGVsZXNzIGFibGUg
dG8gZGlzcGxheSBhIHNhbXBsZSBQREYgZmlsZSBjb3JyZWN0bHkuCgpGaXhlczoKLSBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xNTZmZTllZTVmNmRjY2RjOTg5OTBmNmM1
ZGU1NTYyMzgzYmMyYjc0LwoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIEFkZCB1cHN0cmVh
bSBzdGF0dXMuCiAgLSBSZXdvcmQgcGF0Y2ggbWVzc2FnZSBhbmQgbmFtZS4KICAtIENoYW5nZSBj
b21taXQgdGl0bGUuCiAuLi4wMDEtVXNlLUNDLWluc3RlYWQtb2YtTEQtZm9yLU9CSkNPUFkucGF0
Y2ggfCA0MyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbXVwZGYvMDAwMS1Vc2UtQ0MtaW5zdGVh
ZC1vZi1MRC1mb3ItT0JKQ09QWS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVwZGYvMDAw
MS1Vc2UtQ0MtaW5zdGVhZC1vZi1MRC1mb3ItT0JKQ09QWS5wYXRjaCBiL3BhY2thZ2UvbXVwZGYv
MDAwMS1Vc2UtQ0MtaW5zdGVhZC1vZi1MRC1mb3ItT0JKQ09QWS5wYXRjaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45OTFhMjM0N2E3Ci0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9tdXBkZi8wMDAxLVVzZS1DQy1pbnN0ZWFkLW9mLUxELWZvci1PQkpDT1BZLnBhdGNo
CkBAIC0wLDAgKzEsNDMgQEAKK0Zyb20gYTRmYTgwOTgyMWY4ZDI4M2MxYzQyYTQwN2M3ZjM2ZDZh
ZDMzMjg1ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206ID0/VVRGLTg/cT9SYXBoYT1D
Mz1BQmw9MjBNPUMzPUE5bG90dGU/PSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CitEYXRlOiBU
aHUsIDIgU2VwIDIwMjEgMjA6MTc6MjYgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gVXNlIENDIGlu
c3RlYWQgb2YgTEQgZm9yIE9CSkNPUFkKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworV2hlbiBjcm9zcy1jb21waWxpbmcgZm9yIG1pcHMgdGFyZ2V0cyB1c2luZyBCdWlsZHJv
b3QsIHVzaW5nIExEIGZvcgorcGFydGlhbCBsaW5raW5nIGZhaWxzIGluIHRoZSBmb2xsb3dpbmcg
d2F5OgorL3RtcC9pbnN0YW5jZS0xL291dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYmlu
Ly4uL2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy84LjQuMC8uLi8uLi8u
Li8uLi9taXBzNjRlbC1idWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9sZDogYnVpbGQvcmVsZWFz
ZS9saWJtdXBkZi5hKERpbmdiYXRzLmNmZi5vKTogQUJJIGlzIGluY29tcGF0aWJsZSB3aXRoIHRo
YXQgb2YgdGhlIHNlbGVjdGVkIGVtdWxhdGlvbgorL3RtcC9pbnN0YW5jZS0xL291dHB1dC0xL2hv
c3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxp
bnV4LXVjbGliYy84LjQuMC8uLi8uLi8uLi8uLi9taXBzNjRlbC1idWlsZHJvb3QtbGludXgtdWNs
aWJjL2Jpbi9sZDogZmFpbGVkIHRvIG1lcmdlIHRhcmdldCBzcGVjaWZpYyBkYXRhIG9mIGZpbGUg
YnVpbGQvcmVsZWFzZS9saWJtdXBkZi5hKERpbmdiYXRzLmNmZi5vKQorCitUbyBmaXggaXQsIHVz
ZSBDQyBpbnN0ZWFkIG9mIExEIGZvciBwYXJ0aWFsIGxpbmtpbmcuCisKKydub3N0ZGxpYicgaGFz
IHRvIGJlIGFkZGVkLCBvciBpdCB3aWxsIHRyeSB0byB1c2UgR0NDIGxpYnJhcmllcyBmb3IKK3Bh
cnRpYWwgbGlua2luZyBhbmQgZmFpbCB3aXRoICdjYW5ub3QgZmluZCAtbGdjY19zJy4KKworRml4
ZXM6CistIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzE1NmZlOWVlNWY2
ZGNjZGM5ODk5MGY2YzVkZTU1NjIzODNiYzJiNzQKKworU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wg
TcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgorW1Vwc3RyZWFtIHN0YXR1czogaHR0
cHM6Ly9idWdzLmdob3N0c2NyaXB0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9NzA0NDQyXQorLS0tCisg
TWFrZWZpbGUgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCisKK2RpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCitpbmRleCBhODFhNzJi
ZDIuLmU5NmQ1MjQ2ZCAxMDA2NDQKKy0tLSBhL01ha2VmaWxlCisrKysgYi9NYWtlZmlsZQorQEAg
LTYzLDcgKzYzLDcgQEAgZW5kaWYKKyBMSU5LX0NNRCA9ICQoUVVJRVRfTElOSykgJChNS1RHVERJ
UikgOyAkKENDKSAkKExERkxBR1MpIC1vICRAICReICQoTElCUykKKyBUQUdTX0NNRCA9ICQoUVVJ
RVRfVEFHUykgY3RhZ3MgLVIgLS1jLWtpbmRzPStwIC0tZXhjbHVkZT1wbGF0Zm9ybS9weXRob24g
LS1leGNsdWRlPXBsYXRmb3JtL2MrKworIFdJTkRSRVNfQ01EID0gJChRVUlFVF9XSU5EUkVTKSAk
KE1LVEdURElSKSA7ICQoV0lORFJFUykgJDwgJEAKKy1PQkpDT1BZX0NNRCA9ICQoUVVJRVRfT0JK
Q09QWSkgJChNS1RHVERJUikgOyAkKExEKSAtciAtYiBiaW5hcnkgLXogbm9leGVjc3RhY2sgLW8g
JEAgJDwKKytPQkpDT1BZX0NNRCA9ICQoUVVJRVRfT0JKQ09QWSkgJChNS1RHVERJUikgOyAkKEND
KSAtV2wsLXIgLVdsLC1iIC1XbCxiaW5hcnkgLVdsLC16IC1XbCxub2V4ZWNzdGFjayAtbm9zdGRs
aWIgLW8gJEAgJDwKKyBHRU5ERUZfQ01EID0gJChRVUlFVF9HRU5ERUYpIGdlbmRlZiAtICQ8ID4g
JEAKKyBETExUT09MX0NNRCA9ICQoUVVJRVRfRExMVE9PTCkgZGxsdG9vbCAtZCAkPCAtRCAkKG5v
dGRpciAkKF46JS5kZWY9JS5kbGwpKSAtbCAkQAorIAorLS0gCisyLjMzLjAKKwotLSAKMi4zMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
