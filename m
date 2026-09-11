Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8083C88E50
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 08:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA9240AE4;
	Fri, 11 Sep 2026 08:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYIJo6PWUwvm; Fri, 11 Sep 2026 08:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 95A0840B55
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789113994;
	b=OgWTlv8ci//CrNOkbY1SY76z+6NrfEmITHrPio6X9nashKBkhgK+6Ix3cjFFciACUIbK
	 VVYtH/crWvm4a8eQoDJgilMxSzUOyWpgWtZrXStsBfCdizLjZ3FEeo7JSiwv+AosIxPHm
	 FOoqoZKFWorZwemOv4ViG9Bt2i4nHw7JT6I6fj1jnWsG4ZGnjhbB5exbJSC7jG+783Xjm
	 O95qbnBFBqOdxhbfgHD2XaRbKkKgecY6mhldbEJOBJrn3+LismJu5rKkuO0wlhA2N9qmA
	 U+coLreIKbrBIbSC/F4+p6ZQeJTFUokBLoM2xOd3a6uy7pI/WXPqCy0mN7OSW+y8v6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789113994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=F1fQhYasckhvM60ehXy4FfC/DJ2eLuK71ecg+OtkfDs=;
	b=hH8j22UJPov5ETPl7DrnfwVsnDVIsqUJ92wubUUJEYeyZ5jNAU1wki9eC9OsqVIq6xVd
	 GgRYi6BAmTKjy+igA1vOLHgR8/+LC4JChrtpmGdw+vHxCoZDeQvCtBFml8demeLiCdDyu
	 HHv9O3owz2Di0x2nC207sCIsSzrn1FNQJQiT/xqWUy+W4DrJEMitu943LWMLiByov9KiN
	 E4vrTTB/yf3mC8QsvESiWl+9YdQZtdhsP1beEJO7hnVey72+mbJ/deS0Nr7uhOGVpaMlN
	 uargs7C55EGuZ85SWsGNGS+y1SEHZfJ3Pw0ok14bVCbpj52Uvt7ODxHZPMGBFa9ErXw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789113994;
	bh=F1fQhYasckhvM60ehXy4FfC/DJ2eLuK71ecg+OtkfDs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FO8LnBIcoJqEPAEI2f45GY/jGUIt+WHm7kKKx+F1tp+k/hIHF/Wf9jBeOwOG2+jnt
	 jYOdkTPw+ppYEk5xaRTUNnSqo4iMlF+NtssQQs8UNhn0upi+Tesbqb62ZcjLZJE7MI
	 UwIOT8bX0jiSu7h5V8RhyXfrmm74IrcbP0pfnQ1Im9WHw4xzJmPs6h5VYexctw80Qu
	 SpbV/Jf7ErNpJ8jksbASyDNnBLVtdJasAsJ/S6JTWF7qRA7u/HpUT7JIldNVXDBAtw
	 KujrNYx6Vk0+MpQfWYTpLmUnfI1h11F6qLaxt2lWhCtg/D1m6HZWUjkY2yK6+afvdU
	 nNwXI54yy60aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A0840B55;
	Fri, 11 Sep 2026 08:06:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8872349D
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DA51811F0
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 08:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoJumtwYJlU5 for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 08:06:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 578B3811F1
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789113990;
 b=NKZ9b2lW7AWqZMBg/NdYGP+yMbZOaGXQFMoHvg5ih1K3lpb9WyEF/rvbIGJM82n03DFQ
 Y2yq+jTUz/erYmktLKXQcW0+dyciuxUaKWsj1LMAhhCi8ldMExgRDL8w3WSRMfXHX6i5S
 qvi2mutNhGV/6kOBU1r27ya14YS3B9mDoQCYanHxa8AYYs6+2AOiFP9/EvQXfPkw/e810
 aHwWMkO5iBq+fcQbjEf2GXLFkTMLAt5ufVgP5jmqibP7+sAE0Ouo7IGzFD1X+mMTZl06m
 6UNT4YRynZwJ27k6Ef2j2zzGiwB1ZTxjsOIwDeUyeWZ7LphGnMiS4k80hPJMZf6Hrvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789113990;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=AgcbnOPLcFmy+yNix5TzsDm7g/6dABz7qZl+Gxiwso4=;
 b=GTj7m/Nt/KQ4i3SDfEgjMCK4V6c42o8uxVV1R9Lfxb0jq2N3dFaHTl7AJimkNfp5kJxI
 k8s61RaluLQioi62mbyOa5PiRnGfouBylB4qEx/oFgth+kqGGhFVRF73Fd2I4/CXjID5n
 fC+zP7THzFRWM5jc4rwKPZXT0d4Ap8oMlJTPZLxMuG04ePfzHXNtot+3zLPv0VI0M+lkN
 DmnQtmmkClhQncIAfD5l1d6QlPLaqhnnxb1f70c3b3zoI2Y2ugiiBB8P7UYbLKJjMzFKx
 JIE/U8oiVvXGzjfBW3k3S/kc9KCfcsPRIf5JaL3WzoJ41U9NsMd27MM2xqw7f/MPsaw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YGlKDEXx; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YGlKDEXx
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 578B3811F1
 for <buildroot@busybox.net>; Fri, 11 Sep 2026 08:06:29 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485b1d2874fso153647f8f.0
 for <buildroot@busybox.net>; Fri, 11 Sep 2026 01:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789113987; x=1789718787; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AgcbnOPLcFmy+yNix5TzsDm7g/6dABz7qZl+Gxiwso4=;
 b=YGlKDEXxzwPoj5zhurdS6VeIeAjh0gn1cOC2mUt5PVF4RRVM6brUNcNiHUBJgkgz1Q
 MpUaFJW+t7niZQyVGiM3Fsu9jPfRqdfMFuScOMiRpnEzo9kD3IDXZ3fg7oBLdcnidqWe
 yfGmAGJiBMmMZXGEaIsySFAHfpZ2tNmJm1LTPPJPf14cabUCHX6bKXUgm4Ut1Qyk9Q+E
 q7e+6PinKipmg+XRWmJbK5fY3S4OqDAf8AQ0wJoDyne/Vuhud2xAnzcBK1ZinCfkxzCl
 4loM0bw1+UkwFo8xgdcT9IfIulP2kTxY3ORQyGjI36VF2FVRu8F9JBIkenBLE6AY2EN2
 gzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789113987; x=1789718787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AgcbnOPLcFmy+yNix5TzsDm7g/6dABz7qZl+Gxiwso4=;
 b=XXbg0/ZW1oRrgNu94fkiN69nXUFTI6WnZLl6lwKxc8ACWE0GN7wG0n7Nv/XWoHNGjv
 teIlJOnnv6iL8mlItn4HqUv1Zc3TykOuDo9ILg7aJLGbGsFxi6gdd6hf9Ty3trcAKpur
 6RdNEqMgyfChG2r9GMBtx+cvapBTi4lhwDRc2joLMWcUK/Tk8VYuPrFFhbmd1kKkobZ5
 SpdoHrT4R25id4KynO4PILbohlV+qggZSSJJSr6iOYXbvwnEi+eHcFL0bLjGlSvMYc4d
 gszp7d0peOiH8H00scuBic5MbEzKj/HUTLm7A7hu+YKPcOHwV/hAAEY/GEvK3RFRHYUt
 +MOw==
X-Gm-Message-State: AFuF++m/T2fS+JhQPdXwQY6zxZw0acGyMJMXmLUZ9GOi2dVM+EyppayK
 JISrsk5tCFVLTwLm4scEz9Xenn/TabhkR4j0GpmaO2TnkKbRNbS7tKFQr9Dw3g==
X-Gm-Gg: AYBFou0Lt8KBy8V2Z3imi+o1D5sSwLfgO+jybLOusggd7vguCTjN+WjAllVLpx/gPAZ
 uPh4BFuOGcEH5jWLyzTNqa0IG+OBw2Ib81MyBqM+AJf9mCv9TptCCcyNFGIBc2r19VQD1PEzlsb
 xrcCCZ5+w/hwoz4QdbR+SCdyIhO05LsLhPZBqsDt8rtmDn3Mne5FAnN9iOcQuK1c2WNVF5q0EUs
 iS78HUWlSR4cQQil6nUwt8eUl8h3fUn0lhMS1DQHovMq+yoOikpgMDQN0otK5Ww5qkpyGj6VKbz
 cppdoB1xAXrysBXrouC2Gzn9WJoYihZpOONZnCsTpwuQ+BQRP4f9HrPHK9EBPTlS+tmGnrA990b
 WsdaLyOXQq4xgYCLBTV0P6IZJtVTVfk1y7CFW5WSDCTF/xwjKDIvO3QNkxsxM5/J2zpOb3JkRSC
 FS7TQEf2f5Vxoo9jNp+hoiG1r737CqG+5qCWVdBV4/Yw68wHYmdPZSdpHpxOPHfWpn3p+sJnSLn
 u8N92pGdRSYcoxZmLiksv7nBLSw2hzZT49k2BgAxQ==
X-Received: by 2002:a05:600c:3115:b0:49d:1e79:35d6 with SMTP id
 5b1f17b1804b1-49e61094b9bmr38719195e9.14.1789113987181; 
 Fri, 11 Sep 2026 01:06:27 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c2985dsm232793095e9.6.2026.09.11.01.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 01:06:26 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri, 11 Sep 2026 10:06:09 +0200
Message-ID: <20260911080611.55857-2-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080611.55857-1-francois.perrad.86@gmail.com>
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/luv: bump to version 1.52.1-0
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index f47257f37..779046e65 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc706d9141c185bdce08b6fc8a9d4df05c3ac3676809ee4e9e37e1553d821237  luv-1.51.0-1.tar.gz
+sha256  3e6eb820a3aee034f85f9cce9bd77b5d42f34d128a1ccec877adf28c913577c7  luv-1.52.1-0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 0349f7afb..3d79bab16 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.51.0-1
+LUV_VERSION = 1.52.1-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
