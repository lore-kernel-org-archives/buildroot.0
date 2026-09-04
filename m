Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973CBC624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 356B860C21;
	Sat,  5 Sep 2026 08:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SE5sK5ZajCF; Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6EFCF60C1A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595954;
	b=M4MdMlW5Af6Lal9Kt4n01ANSq8aOI2eWUPhmcRUSWu5QjdqpRHGpxVvD3pWmdZo6GRX/
	 76GwQxkBaCI588g0V0d1ecTnOqJz4Mk7k+pNR2vbUaB/rU+1DsU4YHQFpEE46h3Ebl74v
	 9VwqMhRCXJhcSaOI3UDWBvUTGS9LEwmJSvtgiGvBXqVcNVjlKGkkfm8gJzgJxXSQ0XIVH
	 2K1D6VD99Lih6JrCxrj/udyQSrrdM2ZQL6/ByS5Uc1w/xsAo2MLbvdMrSk2+DoDJsa5zC
	 uNpAnGM32HrHmgKiiqqQzwnB8WSmJXkl2zXwTNUyylp/3GgoKdVd3R1EqU+fHkr0ldA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2lQVn922YpjgYSdKQ5nXOD09HRruHEsTpnBpE26v1MY=;
	b=CKFZ7G2SK4smPlNSi+Ah+mI+J3T5yJYbzm2xalOG90cKWmmQI9Uqz3Vzn4YbIjOUkqzO
	 cRweydCJI3JKEA3XwRZvEyBOYQf8YUdoC1F9nyyfSzIEwlEOgI1cq+OXLB21s+JE/nrHJ
	 c8A01l8JwhpWj4XNN4RCsiMNIN6Hpyo9R+wRqOGQ3mRp4r9vuRn4c/cSsjPhHA9/IYvNn
	 m5GP4iFNyD9aa1SxPaCcsabwgsz51cU8LUXs9x9l3PWu1/nRB5z3Q0ZjLm/YKcSPcEl/E
	 2ULioiLCC72Tuvs4Hx4/fQIXgz5nrAdLSex2kdSUIkNgwQrDq8JbJofc74oIdrcTITA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595954;
	bh=2lQVn922YpjgYSdKQ5nXOD09HRruHEsTpnBpE26v1MY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNJQRMn26dNCUTIYZGrbYEaQVTrFfQ74MnxCc+Er18W1Dcg92609BLteSzAoiWVDm
	 q7W0ZEi4Om4FwXaZqTHC7OH+lJEyVVlxrgoBr5ZGVXPjbH60muqYNCvTZTbvHR81Q8
	 7TpHUAk9/laPMuFvs1BpkfXp7Zi8w3E5qZRTccnlx+u0JJuyhoV+13o6+dMrLyOBfW
	 Oa6HGXUn2JNHHK/majPvze0Ph5PqLkGMahz/lAsTNiMJJaKj+jw4lRHsxU8SlEAW4Z
	 27umR2Y0pbb5SfpG6mGPbEePqu7S51b1VUv+JckIIy+7Xn4RIixjwVsqftvqPakwsy
	 X1dSNfUYTYF4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EFCF60C1A;
	Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 224F8970
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0864281183
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRC5plQE9aKN for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E79D38112F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595950;
 b=PTE4LNqU6CVV4gNP9cBcxsbcKbkREuQsryScjtjzvPPUQ36IPpl1DK76Whl01K6WwphQ
 dI0xSpMcOKpnAF/QTX/18a1eN36bNIIM++l2VZG+vwcvnrQp3/JCFPg9DAXFnd02qRNzT
 URmgp6AEfyu3Si9IrgKCXApvc8ev9CWCFdbpIz0Gr1+F7avPJLx0Ap2tlwxaWCPpeu/LN
 2l2rbARvtJvdCW9fZ7wh4yMs16JEoZfGCz0yiHecsKiYVfknOXNfIQw6bUi7tLdCC9QSC
 p6CXmMJfcvzrOpLGbBncS+7ke1fIIfaIFU1NN1uToNEME1vaB1rtehp2VfZR8x+l0cA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595950;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=UROkneecZucr4OTgzi6njI2GK29ZKg3MrXfT+y9NRCg=;
 b=FjcE8aqXN1VptexlSQB+o1ZgVPYVrBeUBF3JqgS6GPH94u2bCbU8059RCrbWS3tX+lwg
 a1MQUJR/dTaxGAMzvcPaPmDYOUbYtgI4j3V5ZSrXIrgMnXUFsWAu7Uu3u51nzld3Ul9a4
 iLzPBzMqrofWZoVZcVArZaYD6e0cto8+DW/INbF38e178hB4w2oaX+XkN7vnK3y660Pvn
 /7+gHIp2cQBZd/mGkAIO2l6WOBNFt9gfA5D3k2npzC8Ro+3mVnjREU4Fj9Cwt9+6Iv/Qp
 OhZ/rt4aOGmzxb2N5iobdX0WUj7VJoCx9HnJtkSPYlzGBcE3hBwJ3NAXHKVhnKkPFcA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CR+s2KHg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CR+s2KHg
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E79D38112F
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-482e257a23aso1255853f8f.0
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595947; x=1789200747; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UROkneecZucr4OTgzi6njI2GK29ZKg3MrXfT+y9NRCg=;
 b=CR+s2KHgtMpricFvia6VOWasZWXE+FxetLrsF/shhvAHpWZXsadNS3QfnStzduaxBq
 xG+PwrKmTROwlFVBp6cNvmWBFvG7AxmuGQGmdeuV/yPO22wiaU+sYyXhuHLdlik4Xl9I
 Hbm2WAKsIbv2b/XQvGOIh8GUFCRl+Vsg1+Xwp5tesNQhytNGQVE3ypA0ECXNlWDOsJJl
 UGTl/3CqG4dq2rLAAt5yu/L+jbYPAq527Tk+drEFb3JaxgJOFE1oEloPfgN3Ry9m2Ctx
 crxMxCz3fpwDyvGiUsfcc5pgMZHAqmPaX8lZJYkdUwSqo+yMVgQQeey6oOG4eKftCfLN
 t1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595947; x=1789200747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UROkneecZucr4OTgzi6njI2GK29ZKg3MrXfT+y9NRCg=;
 b=YVSnkUyLg0sp1n0GfTZLbAp3AFIdF2TZUO9AoCZxDe04Wyc3eY6dGunZHlsa7+zBG8
 /V6Dw0hYXfX11ZsC8ePBpnvFvL4AXKq/iC3rKuG+/GBrCF2J2YZUQowNP75x6X7+ObcI
 60cr45CunlzBTLFMfxQuONx7k8wRvOSvpVOVrLITDPxIFOTAI9gev/zAUSL1ECzYvX1+
 IFmVeb+0n8MRhgOqVG+7mb9BrS8BtZsl7HGDHL8ifH1V1qN2DfRNHkEXoAwCeed1yfGU
 OrJ9VWNs50FX/iCRb6I9wptpv/v9bOqCa0N6kdjf5ta4KtV6Y+Plidq3nL1Atf2W7tEh
 gWWQ==
X-Gm-Message-State: AFuF++kBFk5w4sBeFhhFtBwDojVaSLxdySdNgbTJY2OMuIc5FxWqE2Uz
 H49xNO58zqgGYh+nbHECU7hs0HYcyakaShg5LxEpouk/zpYcYglJOwaeWJd9eQ==
X-Gm-Gg: AYBFou0volLGjEwhzUwXvRAbqmcE/4m29o8yVBXH0lGrERMh0o8sCBtrUEKNg0CbST/
 7gflxfM4qsqqM2uY2VhAS4Gv5K+FSNul90mGxDs6y7LdnFJd4ie6PrDKTcC8XkAKpZsVgKLvZS3
 hGSmHwRLfSjgdmzXDgk32IGAMpINwqg8Nt81sc5vvn6mABnmC6/ZkzVH9lWWyhLKaOnkjkvb3AC
 0C06kX5fh8G5qqUsRSfOBkct6SkRXC1apzIap0of3h/YeqIuabYpKUqn1BVTjJITSM6jxUOJ+Wr
 d0Jh5FGFsy82iYeLAbElgMuZz1ehyqUoKmwAabDWvW7/M/QHKGIO4QyrBc29UHmLuPjNnK+MMNa
 yO1h2KMe2NtHx0KqCJGXs1jTdX+l0g+13Ngp3iX3L7rPefwBRZtXUu3vptEDXVylx0XNuDG5HNv
 XecyyXxJAW0zUdtP0m74UPvS0dpqjiimI66J9KCccOzQE2BO+lG71bYa6Q1OwLZCljPUl88Atij
 WYGeT2HpD4IJpIw2fU=
X-Received: by 2002:a05:6000:1ac8:b0:485:8926:531d with SMTP id
 ffacd0b85a97d-48589265336mr10448223f8f.4.1788595947085; 
 Sat, 05 Sep 2026 01:12:27 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:26 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:12 +0200
Message-ID: <20260904185921.587878-4-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/12] package/lua-lrexlib-pcre2: bump to
 version 2.9.4
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

diff LICENSE: update copyright years

see changelog on https://github.com/rrthomas/lrexlib/blob/rel-2-9-4/NEWS

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash | 4 ++--
 package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
index 090b83d48..13ab6fb80 100644
--- a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
+++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  9bb1cb2f307eb70d66fdab499864de732c891aace0ceb6a338194e2e6631b9c3  lrexlib-pcre2-2.9.2-1.src.rock
-sha256  067992fa7c5866e01d6c8fe93dfa1e1456a6ac81fa59ccdc72f5adcd6e5b3690  lrexlib/LICENSE
+sha256  d41d736a309b14fed859ed4d3a49de89ef8f6565a7143570ed0cf1ccdbaebf29  lrexlib-pcre2-2.9.4-1.src.rock
+sha256  c1f071c55958bc56292706c46eaae7a58f6876dfd8ee125b33f7db0700883403  lrexlib/LICENSE
diff --git a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
index 3d0c3c57f..40ce5f6ff 100644
--- a/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
+++ b/package/lua-lrexlib-pcre2/lua-lrexlib-pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LREXLIB_PCRE2_VERSION = 2.9.2-1
+LUA_LREXLIB_PCRE2_VERSION = 2.9.4-1
 LUA_LREXLIB_PCRE2_NAME_UPSTREAM = Lrexlib-PCRE2
 LUA_LREXLIB_PCRE2_SUBDIR = lrexlib
 LUA_LREXLIB_PCRE2_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
