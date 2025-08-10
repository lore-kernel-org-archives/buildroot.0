Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E44C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC4861079;
	Sun, 10 Aug 2025 20:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQ80s6Ocl03Z; Sun, 10 Aug 2025 20:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FE4D61088
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FE4D61088;
	Sun, 10 Aug 2025 20:47:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D666531
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3D1D40F7F
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2QqeYTXOxSK for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:47:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B104D40EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B104D40EC8
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B104D40EC8
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:47:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-61557997574so5331283a12.3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 13:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754858867; x=1755463667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C5d0rUsxuvDc6btW4dAS9zDcryTb3Aoxwzb73Laywn0=;
 b=G4jVGnzKC7tD2QbgkujNs93/W2R3aF/33U+BTmE7SvWBZulCea6rCSEF3ufCBbK9vG
 xWS4ABe74anoPhoFutjVoI4y2kOcGD0VvVpd2k+IAlpGYMATrFop3qYvMypVU+enRxba
 HLqjcfYELgznUKRp9lsspC9s8gaB7joDDQvKGuoK1BX+0wJ0zQkdjKho6bdgwraZQZNF
 KbMtrw+8Lu37KCW+AjdC9/kKfZwpQXrfKjK6VP+in+ushMuJzzoCYpZKGSGpMYSxLTvq
 Vm39xQBpuxp/xzhTOFohH9nVD0Glrj0FbNqU4x0SB3MnJMcIw0rI21OSbE7tfLWPRwDU
 jLYw==
X-Gm-Message-State: AOJu0YwCHO9TG3Ih/jWtVX4zzC/ZhM7756+MIESwitnYWlq/l3ozwBbc
 dbUxsR4Vxf1xwFLDbgxyg6D5w6wp/IOx0xeMKYvChrKg0X0bgBkdlGYYSDcgGMC+oEeOBxQTSJD
 tMkwqRis=
X-Gm-Gg: ASbGnctufxR/3mXP6QHqwC/6rAUPZdj1GV2Smh7vbgmniWuZSYdLYoZgYLAvwCdvvuS
 koUkIfe1IPQxPocC+36QOCyLPkd5baiMa37XWZ5kjZDn8CrB4UZvbLYvID8BPM4v6BLyoZmWspG
 iXsQ+78lIc2Ghq2iXCXSnCjJjJiJoP/BkQbGG9+XqcFGJEa/QIazqeXfzJtoZyQfhvkAWwkxtxK
 +7/RZo4u9zU/d6Dyopa0D6gjw1B1xLZ07hhbXUCxS56YqeJdGLXhNY9DqdoXMynAmYO5+vzJgSQ
 ffebkwnu0Nuf8/QiEFp8/RNUhrjYlHdohDMhkr3LtI1DnHNcUb2Ef1NaYA0CNC6FlE1NY9oWaTy
 ojif1rkceWjioJ/4L/dhv3U1XECLJBYW9j8uHw6wo+FG6xF3oF2l9KuL1DMfW/GxbJbU2CR1o6Z
 BapHdBpxBx+olL
X-Google-Smtp-Source: AGHT+IGlFOszpJYhRe9ARk2hG0MMKXTx7q96/f1164xvNBLBoWwDAXWGr0IMySEiGQARipdtOFzkxA==
X-Received: by 2002:a17:907:9810:b0:af8:f187:3222 with SMTP id
 a640c23a62f3a-af9c647bdaemr995967266b.33.1754858867216; 
 Sun, 10 Aug 2025 13:47:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:2b31:cdf2:d6fe:a9f8:c3f2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af938aa8275sm1666245466b.57.2025.08.10.13.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 13:47:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Julien Olivain <ju.o@free.fr>
Date: Sun, 10 Aug 2025 22:47:42 +0200
Message-ID: <20250810204742.20942-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754858867; x=1755463667;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C5d0rUsxuvDc6btW4dAS9zDcryTb3Aoxwzb73Laywn0=;
 b=TjfD8DZkQxGsxFfmcH/37pUTCZyOu/kz50rrtWnxHrZiENW3ltt77ztvhiblABn6ZS
 w9jeVWjcCxxJv1QehdHPWe/FPbO3no+vzyRqtBqnhKRjFuVR4AatnTqZ+i2EAi2ixvHQ
 s130cRkAxoD/8XjNwveE3B4ssRbGM04VNgXkg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TjfD8DZk
Subject: [Buildroot] [PATCH v2] package/ufs-utils: fix hash file
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

Rml4IHRoZSBmb2xsb3dpbmcgZXJyb3I6Cgp3Z2V0IC1uZCAtdCAzIC0tY29ubmVjdC10aW1lb3V0
PTEwIC1PICcvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy51ZnMt
dXRpbHMtNy4xNC4xMi50YXIuZ3ouNjhKMVdKL291dHB1dCcgJ2h0dHBzOi8vZ2l0aHViLmNvbS9T
YW5EaXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy9hcmNoaXZlL3Y3LjE0LjEyL3Vmcy11dGlscy03
LjE0LjEyLnRhci5neicKLS0yMDI1LTA4LTA3IDExOjA3OjMyLS0gIGh0dHBzOi8vZ2l0aHViLmNv
bS9TYW5EaXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy9hcmNoaXZlL3Y3LjE0LjEyL3Vmcy11dGls
cy03LjE0LjEyLnRhci5negpSZXNvbHZpbmcgZ2l0aHViLmNvbSAoZ2l0aHViLmNvbSkuLi4gMTQw
LjgyLjEyMS40CkNvbm5lY3RpbmcgdG8gZ2l0aHViLmNvbSAoZ2l0aHViLmNvbSl8MTQwLjgyLjEy
MS40fDo0NDMuLi4gY29ubmVjdGVkLgpIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9u
c2UuLi4gMzAyIEZvdW5kCkxvY2F0aW9uOiBodHRwczovL2NvZGVsb2FkLmdpdGh1Yi5jb20vU2Fu
RGlzay1PcGVuLVNvdXJjZS91ZnMtdXRpbHMvdGFyLmd6L3JlZnMvdGFncy92Ny4xNC4xMiBbZm9s
bG93aW5nXQotLTIwMjUtMDgtMDcgMTE6MDc6MzItLSAgaHR0cHM6Ly9jb2RlbG9hZC5naXRodWIu
Y29tL1NhbkRpc2stT3Blbi1Tb3VyY2UvdWZzLXV0aWxzL3Rhci5nei9yZWZzL3RhZ3MvdjcuMTQu
MTIKUmVzb2x2aW5nIGNvZGVsb2FkLmdpdGh1Yi5jb20gKGNvZGVsb2FkLmdpdGh1Yi5jb20pLi4u
IDE0MC44Mi4xMjEuMTAKQ29ubmVjdGluZyB0byBjb2RlbG9hZC5naXRodWIuY29tIChjb2RlbG9h
ZC5naXRodWIuY29tKXwxNDAuODIuMTIxLjEwfDo0NDMuLi4gY29ubmVjdGVkLgpIVFRQIHJlcXVl
c3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9LCkxlbmd0aDogdW5zcGVjaWZpZWQg
W2FwcGxpY2F0aW9uL3gtZ3ppcF0KU2F2aW5nIHRvOiDigJgvaG9tZS9kYXJpby9wcm9qZWN0cy9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy51ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3ouNjhKMVdKL291
dHB1dOKAmQoKL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1dC9iICAgICBbIDw9
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXSAgNzcuNzZLICAtLS4tS0IvcyAgICBpbiAwLjA2cwoK
MjAyNS0wOC0wNyAxMTowNzozMiAoMS4zMiBNQi9zKSAtIOKAmC9ob21lL2RhcmlvL3Byb2plY3Rz
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5nei42OEoxV0ov
b3V0cHV04oCZIHNhdmVkIFs3OTYyM10KCkVSUk9SOiB3aGlsZSBjaGVja2luZyBoYXNoZXMgZnJv
bSBwYWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMuaGFzaApFUlJPUjogdWZzLXV0aWxzLTcuMTQu
MTIudGFyLmd6IGhhcyB3cm9uZyBzaGEyNTYgaGFzaDoKRVJST1I6IGV4cGVjdGVkOiA5NmNkNTc4
NzIyODMwYmM3ZDhhNDE4ZDUyOGEzMDY3YzBiODBhZDQzN2Y2NmMzMzMzZWJjMjM4ZmU1MjQzNmEy
CkVSUk9SOiBnb3QgICAgIDogOTZkMTVjZTRiMDk5MDA0OWQ4MTJkMjRhZmMyYTYyMjQwYzFhNGFh
NTM0ZWE2YWViYjVhZWJkMzRkY2NiMmRhYwpFUlJPUjogSW5jb21wbGV0ZSBkb3dubG9hZCwgb3Ig
bWFuLWluLXRoZS1taWRkbGUgKE1JVE0pIGF0dGFjawp3Z2V0IC1uZCAtdCAzIC0tY29ubmVjdC10
aW1lb3V0PTEwIC1PICcvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxk
Ly51ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3ouSFlwcUttL291dHB1dCcgJ2h0dHBzOi8vc291cmNl
cy5idWlsZHJvb3QubmV0L3Vmcy11dGlscy91ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3onCi0tMjAy
NS0wOC0wNyAxMTowNzozMi0tICBodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC91ZnMtdXRp
bHMvdWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6ClJlc29sdmluZyBzb3VyY2VzLmJ1aWxkcm9vdC5u
ZXQgKHNvdXJjZXMuYnVpbGRyb290Lm5ldCkuLi4gMjYwNjo0NzAwOjIwOjo2ODFhOjI1LCAyNjA2
OjQ3MDA6MjA6OmFjNDM6NDgzOCwgMjYwNjo0NzAwOjIwOjo2ODFhOjEyNSwgLi4uCkNvbm5lY3Rp
bmcgdG8gc291cmNlcy5idWlsZHJvb3QubmV0IChzb3VyY2VzLmJ1aWxkcm9vdC5uZXQpfDI2MDY6
NDcwMDoyMDo6NjgxYToyNXw6NDQzLi4uIGNvbm5lY3RlZC4KSFRUUCByZXF1ZXN0IHNlbnQsIGF3
YWl0aW5nIHJlc3BvbnNlLi4uIDIwMCBPSwpMZW5ndGg6IDc5NjE5ICg3OEspIFthcHBsaWNhdGlv
bi94LWd0YXItY29tcHJlc3NlZF0KU2F2aW5nIHRvOiDigJgvaG9tZS9kYXJpby9wcm9qZWN0cy9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkLy51ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3ouSFlwcUttL291
dHB1dOKAmQoKL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1dC9iIDEwMCVbPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0+XSAgNzcuNzVLICAtLS4tS0IvcyAgICBpbiAwLjAycwoK
MjAyNS0wOC0wNyAxMTowNzozMyAoNC45NiBNQi9zKSAtIOKAmC9ob21lL2RhcmlvL3Byb2plY3Rz
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5nei5IWXBxS20v
b3V0cHV04oCZIHNhdmVkIFs3OTYxOS83OTYxOV0KCnVmcy11dGlscy03LjE0LjEyLnRhci5nejog
T0sgKHNoYTI1NjogOTZjZDU3ODcyMjgzMGJjN2Q4YTQxOGQ1MjhhMzA2N2MwYjgwYWQ0MzdmNjZj
MzMzM2ViYzIzOGZlNTI0MzZhMikKCkxvb2tpbmcgYXQ6CgpodHRwczovL3NvdXJjZXMuYnVpbGRy
b290Lm5ldC91ZnMtdXRpbHMvdWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6Cgp3aXRoIGhhc2g6Cgpz
aGEyNTYgIDk2Y2Q1Nzg3MjI4MzBiYzdkOGE0MThkNTI4YTMwNjdjMGI4MGFkNDM3ZjY2YzMzMzNl
YmMyMzhmZTUyNDM2YTIgdWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6CgphbmQ6CgpodHRwczovL2dp
dGh1Yi5jb20vU2FuRGlzay1PcGVuLVNvdXJjZS91ZnMtdXRpbHMvYXJjaGl2ZS92Ny4xNC4xMi91
ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3oKCndpdGggaGFzaDoKCnNoYTI1NiAgOTZkMTVjZTRiMDk5
MDA0OWQ4MTJkMjRhZmMyYTYyMjQwYzFhNGFhNTM0ZWE2YWViYjVhZWJkMzRkY2NiMmRhYyB1ZnMt
dXRpbHMtNy4xNC4xMi50YXIuZ3oKCmFuZCBydW5uaW5nIGRpZmZvc2NvcGUgdXRpbGl0eSBvbiB0
aG9zZSB0d28gYXJjaGl2ZXMsIGl0IHBvaW50cyB0byB0aGUgdXBzdHJlYW0gY29tbWl0OgoKaHR0
cHM6Ly9naXRodWIuY29tL1NhbkRpc2stT3Blbi1Tb3VyY2UvdWZzLXV0aWxzL2NvbW1pdC85ODlk
Y2QyOTcyMjNkNjg5NmM1ODkyNTMyZDE0OTg0MzI2ZmEwOTNkCgpUaGUgZmlsZSBkYXRlcyBhcmUg
YWxzbyBkaWZmZXJlbnQgaW5zaWRlIHRoZSB0YXIgZmlsZS4KCk9uIEp1bGllbuKAmXMgc3VnZ2Vz
dGlvbiwgSSBvcGVuZWQgYSB0aWNrZXQgWzFdIHRvIGhpZ2hsaWdodCB0aGUgaXNzdWUgYW5kCmlu
Zm9ybSB0aGUgdWZzLXV0aWxzIG1haW50YWluZXJzIGFib3V0IHRoZSBwcm9ibGVtLgoKWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS9TYW5EaXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy9pc3N1ZXMvNzYK
CkZpeGVzOgpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYjY5L2I2OTQ3
MmQyZWFmMjdkZmNjOTdjMzAwYjk2ODY4Y2FiNTIwNjhjZTkKaHR0cHM6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm9yZy9yZXN1bHRzLzQyOS80MjlhMjg2NjlkOThjNmY0MjRmMzNhMjExZWIwZWJiNDhj
NmY0NTUzCmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8wMWIvMDFiOTBi
ZDdkNzhhMzRhZTczMjE5MWI3NTBlZmM2OWYxOTVjNzhlYwpodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvYTA5L2EwOTdlNDgzMTRiZTJmNTIyMjM4ODgwZTlhYjQ1MjljZWJl
ZmY0N2IKCkNvLURldmVsb3BlZC1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KU2ln
bmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgoKLS0tCgpDaGFuZ2VzIHYxIC0+IHYyOgogLSBSZS13b3JrIHRoZSBjb21taXQgbWVz
c2FnZSBmb2xsb3dpbmcgSnVsaWVuIHN1Z2dlc3Rpb25zCgogcGFja2FnZS91ZnMtdXRpbHMvdWZz
LXV0aWxzLmhhc2ggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMuaGFzaCBi
L3BhY2thZ2UvdWZzLXV0aWxzL3Vmcy11dGlscy5oYXNoCmluZGV4IDg5MDUzOTk2YWIzYi4uZTMy
Mjc1OTUwMjI5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMuaGFzaAor
KysgYi9wYWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMuaGFzaApAQCAtMSwzICsxLDMgQEAKICMg
TG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICA5NmNkNTc4NzIyODMwYmM3ZDhhNDE4ZDUyOGEzMDY3
YzBiODBhZDQzN2Y2NmMzMzMzZWJjMjM4ZmU1MjQzNmEyICB1ZnMtdXRpbHMtNy4xNC4xMi50YXIu
Z3oKK3NoYTI1NiAgOTZkMTVjZTRiMDk5MDA0OWQ4MTJkMjRhZmMyYTYyMjQwYzFhNGFhNTM0ZWE2
YWViYjVhZWJkMzRkY2NiMmRhYyAgdWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6CiBzaGEyNTYgIDIz
MWY3ZWRjYzczNTJkNzczNGE5NmVlZjBiODAzMGY3Nzk4MjY3OGM1MTY4NzZmY2I4MWUyNWIzMmQ2
ODU2NGMgIENPUFlJTkcKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
