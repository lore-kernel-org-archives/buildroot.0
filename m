Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2973EC79FA1
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 08:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D76811FD;
	Fri, 11 Sep 2026 08:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfR0CJ1zRzH2; Fri, 11 Sep 2026 08:06:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D6D90811F1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789113996;
	b=SyrH8boogIJqdqvEIjljsqDMjiVhJAdCQ+/tbZsjOAorusWBvfKPZNCtIJOSpbfHXHpf
	 FuZptsC4KB/SYfJfTPYKp4G4sSGtZlp1x68LYEG90aaXuPuPPboB/DgNtiD4t1s4Wvelt
	 Ddns2QBxzacecMiHQR7ISkjnYE8RiYIF3GYCeiitd28e0gEKPaVC1Q5/bJL/LWY5AHxCB
	 m/jLSlahCkQVPXiAE/h8LOoVQ3Ocdcew9/5pgdDma+yNS9CNJpaTXR8C3Jwpksp3FiHKX
	 RmPtpoeFqILGY6fNu6Eb058dsuw7Glnf1y6CY6ZM7UEjmXEonqTRGun5D40hLZZUBVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789113996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=a5Vn0RwPEYlYz50cTu6fRgidMkM7+QFJYdmJ0bZfXzw=;
	b=ePNQquwYqzk8Tx8kH3ry1Sooa4AGJQ6RXg/nt+qULW3x7Cez9MEkjFz/Jt5rkA1dwMcZ
	 PNctEXTbkN8GHKUH5X65NC4n3u2UOJmf4am2UjboE8jH7SpUKhUIOmIvpuHczeYLnqm1b
	 Sz2VtS7aeHCXxkh2y1ETLxTNUh4VNt1yShz0Rnu4sRti5vJsEbhQWKDoNDKs28FFeQ9Wd
	 l7TdY6pctU+3EGkTW+7uwq56Q9aIFYCBWcGDkKgXaFygggZbrcaxLbdNkC1+wUkRxTsDG
	 qpcr9GUq2v1uo2Csew8O/tMF2Qkt/yNH1abRhRJwkrlF+X+pclPaxqHI8GNwNYZ+Z3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ebwiRaOf;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789113995;
	bh=a5Vn0RwPEYlYz50cTu6fRgidMkM7+QFJYdmJ0bZfXzw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RMNh27BpyVH7BGmG88+u6EgHePlKMltOvYkAJ8x1ab+OFfmpMjRunKZkJ1+bO4q0k
	 AhH2Ed8Wy9BVNrG7+0bf2EtiAcroDIra4NWZWa9WvlAzOrtUnUt1S8c/XIthl8XCkH
	 uCA5syG5bDd20ZK5AOK4ZN89bbYzMeIYGUinWCTHtXWBNQMEkY0upLXmp88VgOsU+0
	 FbOaMKJL1AtDqH7X8eu6pGOi0ItJPk/H5aO+huWsKKgItBoXfyd9t1jmktU6QE1/IQ
	 xGQJlbFGa0hhkLr4EJ16ai1BQJLFLUOcYubZ/LjpigLe8DC7UkC9J/z6fDRkYX5vX1
	 KC7Icm++aTN1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6D90811F1;
	Fri, 11 Sep 2026 08:06:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB01E49D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0FDE811F0
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JAeOVaUM7an for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 08:06:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8ADBB811F7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789113990;
 b=Vb3ADKlxl9eYW9gtsAcY9DlbVlQ99lhUjpvsPCDESTz6uLP7NIkPGLkFmp6pO5NHPzCM
 HYqVd8/zw78yyzsfk2CgxrScTJIz7c++tKSFwwP/R40KvRXs0I6VouBxzl8j4aL+TtvOu
 TUk75I+E5qj+x5I7iaUnascFS5qKgY9KepmA2rZlBNjl8FG0FC2G75afew9cVvBAieLxA
 ktyK0LOGKXZ+L3zJQ749cqmx9I+5y+Hnn5ambpfrYIwXkQnkiNPUwN6jSpuH+21RMNS27
 Q6criRoE16hEpgmNvMk99Mm+Ww+Fs4dsdWs1HMrS2hcIRb4aLNPwF4Jrwe98C+XJxJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789113990;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=kpaNPOsf/W1Iizm3ji8M+Q0h8U71TXXLMPqqWnPjIUE=;
 b=jnWyXY+R88KDDIiEyXih+gWWLXDi2HQIb9Xm6u+Y3V2gHreDX+nY7TfuonYJZMnnsLKN
 wwbsyjkfAP0vFqAG4+1x4mFF/e81xOlhQwjU6ai1RXbuI0/MqF5/5yoObEW675VFv66lR
 SY5lXHiML+8ZOynbsEIjO7g34Ur7bWbYu2pKCTIuDfRjOVkxiLNwiZF47kh4ULnVDi25+
 jHV4CUY9aPYsvdJ5L4T3FHcbk1ROgEdZWI0mM8liXmyq0lu1xWlQteP3beFy4n2AsLdrJ
 2UK6V9U9XWMGk7daTOzuFMxj1UHcKyvIbYYfi22t+P52wJmH9w1Md5z7fzlSuu42QrQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ebwiRaOf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ebwiRaOf
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ADBB811F7
 for <buildroot@busybox.net>; Fri, 11 Sep 2026 08:06:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so533379f8f.3
 for <buildroot@busybox.net>; Fri, 11 Sep 2026 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789113988; x=1789718788; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kpaNPOsf/W1Iizm3ji8M+Q0h8U71TXXLMPqqWnPjIUE=;
 b=ebwiRaOfN2FMLuhOWQu1lB2uZAD5poiJ3jhoeAMPc3QQeiH6TS5BHu+nSxPylEXegX
 P+Q4HEiEj/tda4KgcgB0eOtF+IOkTKdWtWK2U03opie5tsgu8JpTeEQ+PA0sM6tfsHKi
 Ssm6+eHltSAmZJARpZRG0oqssrUebg1bgSN5/Z/4MymR4FVftU0SZFoZk69vAwomQmIP
 WZem4XjIWCBpaUpH78ckJSLgBHB5bH1O/Bs7nOhTAOViOCvuctjmrL9g/iuF17o7ttRu
 QkuN1ecUgfP77VOG6mYkfve6x3kPqbiSRV0cA5VadYW8lCakW255WlGVtdXJ3thcoJfU
 U2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789113988; x=1789718788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kpaNPOsf/W1Iizm3ji8M+Q0h8U71TXXLMPqqWnPjIUE=;
 b=a+8f4RCCoR/Zcvr5Axl9uco4AfeNAyH+IXCDqVN3KGEQThM4ZZnkLrl8wjWeBc/Ywg
 ZvBwdy4SGQbLiwj0zttSr0baIlwH/7MetGmRsWr8dDXs0ML5RaNcMpfOYxDB28viK164
 US5arGl1G42zqI1re5Dpt7wTqKQDMZdIfBbGh8QYe61ODQRvq7vrrFeuieooDobUlr8A
 m+UUfdX4DVr3KIeGO4QKFM7zzemNaDliFEziVcHyMKGOJP5Mbsdx4Yu1uBjrBMAujXBX
 OeUBoB6yuYoqtyv32QtYk+5O+1Z27BJ2b6xhV6plBTY+LYPsZppwg2FMnWRTomh1+/mc
 QFAg==
X-Gm-Message-State: AFuF++nAJtIirFzYbDByM9HQzqpTGfbWGrnHC31A9n3y4+hvkMsoIPda
 g/55NkeJ9tXpi3hOqMMQwhvWgF9ZCJhhFe5GXevLthDRGfXuwEO8D752FJRJBQ==
X-Gm-Gg: AYBFou3UqKPTWyEaDH6eeYM/aUhTfx3qNC1VIebRTm6CBbZ+YquVdntbu/WeN/lPi7K
 ve2/+jfi5DkHEdsyIY5zaKXOeUvWuoJM2SnqMQFb92tbqiubDoJzBfa6M3/faInBB7rFRCU4tNg
 /jsVv7ijAPP9Hm5AiaGPkkCHB/y04ePmdmf4Ou2D9EhHell5vSnYFldUn9TwBXT5mmxFZCHEgxY
 zbUEjYiNjNlB8VrqIEA2M2Uaz6GakAIy8vo5uKl0kb4JOOqa2NHnsadX96h1sDq8yzbmWBoUtPd
 HpXH1HS9GEGkaMUZfsG7PRnGLfLviXTi/76TJ+Uj/KfIWC4KD+/X5O2a2n+k0igHWijjLcbYqdP
 y29ct0LJdUKg9h7duYggKzZEgJdcsX4wOdo76g0eJjgZIDDv7CO0BykGdGfxGNQ+00GwFTaW+vc
 0Mf+zduQnPcDbPWrFzmXlp6o9hmlOhz3eDaDcy9LJaP3B/+fUjorHK3VICxpgJ9OpbkB+F+CxMm
 Doht/3ZREWx/VmIUV1NYuQik+zRKR1gjJZMZCdu5w==
X-Received: by 2002:a05:600c:3506:b0:49c:fc6e:8cba with SMTP id
 5b1f17b1804b1-49e619dc31emr31670365e9.30.1789113987875; 
 Fri, 11 Sep 2026 01:06:27 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c2985dsm232793095e9.6.2026.09.11.01.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 01:06:27 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri, 11 Sep 2026 10:06:10 +0200
Message-ID: <20260911080611.55857-3-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080611.55857-1-francois.perrad.86@gmail.com>
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/lua-lunix: fix incompatible pointer
 types
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://autobuild.buildroot.org/results/7fba1da21af93a7a0431fb9431dc3c8e872a00ac

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 ...0002-fix-Wincompatible-pointer-types.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch

diff --git a/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch b/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
new file mode 100644
index 000000000..910d684b8
--- /dev/null
+++ b/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
@@ -0,0 +1,37 @@
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 9 Sep 2026 20:36:07 +0200
+Subject: [PATCH] fix -Wincompatible-pointer-types
+
+src/unix.c: In function 'unix_sigaction':
+src/unix.c:9721:32: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+ 9791 |                 act.sa_handler = unixL_tosighandler(L, -1);
+      |                                ^
+In file included from src/unix.c:48:
+/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+
+note: this warning is enabled by removing -std=gnu99 from CFLAGS
+
+Upstream: https://github.com/wahern/lunix/pull/25
+Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
+---
+ src/unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lunix-rel-20220331/src/unix.c b/lunix-rel-20220331/src/unix.c
+index 2e0d77a..6d91e51 100644
+--- a/lunix-rel-20220331/src/unix.c
++++ b/lunix-rel-20220331/src/unix.c
+@@ -1278,7 +1278,7 @@ MAYBEUSED static void ts_timersub(struct timespec *r, struct timespec a, struct
+  * manipulated in C as type pointer-to-function. Accordingly, our code
+  * expects lua_touserdata to return pointer-to-pointer-to-function.
+  */
+-typedef void u_sighandler_t();
++typedef void u_sighandler_t(int);
+ 
+ MAYBEUSED static void sa_discard(int signo NOTUSED) {
+ 	return;
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
