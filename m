Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432EFCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09E8240645;
	Sun, 11 Oct 2026 13:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86jGSrAMrJGo; Sun, 11 Oct 2026 13:03:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B952405D2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723833;
	b=PnY+dsBdmkxQN+UMTGgdlqlYEtKuXN5dGmNTmBkD4i87YW6DEtsQkWYlkvtS31NuYS/y
	 Re7EljvM2+EUZ8LxC/PMnTks1cDZ9by7GGYCwynWgzWmDFgWuXVbhiKc+kUeoaAZEIZDC
	 EdS7dzRsmaYtZdaYxiW/0bAC8ZsxH4iL9WzemzTUY6b4KaHDRt8haWnmL77EXqPqizaAu
	 G+xn8r7NdkNgd2I7fwjbW4HxH5COoV0pmS49TeZWPGom9+eNA5r5XX2kXnveBXw3Y3+7l
	 lIkxKRwsJYVrvvHRDjfiq+tp8wRgpD4K5Ttxt3WogtxfvuSBCr/yRkRFMZlLbpS7/uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=42K+AjXjbdRAan+I0i4r+pGnQb0UE/wNngm6Lm0P+1s=;
	b=Ow5J5HW/0ZX9CVYTvvTLfCINRCmkhrT8otrex44c9ZW79IHjBz2Ei8g1t45W38hc/4XI
	 1pI6s5QH7xAXmNikYv4ozA8ZqVR7FdBmgt0qzedzpaklCgJyN9hKFCnjiUhB1wY2kfOOI
	 6myvTlj1qDSBDaT/BpaM8/4ubh8t9TC5rEZECFDerjuvPxF18HVJxNWwhMtOrRT0IehAI
	 lSERzi3K5CYNl5ylyeBHF8XSGEQG90beZn2hrVjt+20LvD18yZubHoOCfBf1rUkmS/ucU
	 RYK+BDOl3r+H5Kx3OeP+zX44TG117YfMyVD31jLsZKKiBevxXh+2jdo0N+y1cV2wtwQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723833;
	bh=42K+AjXjbdRAan+I0i4r+pGnQb0UE/wNngm6Lm0P+1s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PqbttsaR5MJ0wJtlZNWr8tahP39HAAhNsT6WHsQ8J24vl1CITwdS4NQCI+zgSHy+C
	 OsdwoihV9mqvH+U6iGv5hgjrZA8uUSo76eXR3QDwTZzMGXQHe9H3eXpjY6ie6AdMRK
	 Q6ebogaqxJ/4tHM2cyC9BJc1eNCaj+JLrN2h3+SyENI3e2t/TAU3T+oQTTllODnd3G
	 cXH4KVEZbdAOMUq+IzJ7Qq0F50QEhWhjBHjjVk8kID7gIcD9y/JaEch89dWoWWyIcG
	 G3xLcxa1C2paEW0ryQfpwM3+WVDTgPl2smo3f6SNVAp7zDqvETjFxKiY8aZ02Qj7c9
	 F5f0rgmkgUkOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B952405D2;
	Sun, 11 Oct 2026 13:03:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E754D111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E521D40071
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01dPu6q7-Lub for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:03:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 42FD64002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723831;
 b=HbozwnrxMAJe7lg3w4HuH+sh+wd3lPfly9TV1BLvRW3UD+368spJ79YJZKBMdHy3xv48
 N1WAc2C0dFckwUrR9x8/99KAraVFEVAzKIkE9B6PjQuYWyV85Rl0RUVk/NT5kfB5IONbC
 XR/3c6pYdOhlLHw2yMkhlJFeTAV9iSOSApNtBbk8I+B9xi2gnCmzKWSLOZQYE2F+jJ/n9
 ARHR1WF8gxEeUUU7jxcO4GOXDU7JKHSNE8lVXOwgN/cJy+GYAMVeDIE70Ixs15lwnUZYp
 bY0aFtO3vZSW4JGmK5fJX8w2Zd0MgS2wPe79+tdVrK/fYZIY9dyLvzZMP2SxBUYqZ5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723831;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=2gtyKHS0ZUa3TTKBaMqQLsWCtQvgfD13cL6Mqskv0gg=;
 b=Qb3/41j/x1DnYYInYHuScfO9XwF7t6kFxuDq70aDdE/vE5gMLeJWeUV6O+601ZUzCfUB
 idlz05KSiBTI78K4Om0dhrqyzeK6+1ZuCi7djrnBoWACl9J+ng+/ZRRqX4PkU1MX2C7qV
 GcNiHBGtvAGdFtosyNswv/Kuc2GHtuK146vr43KqDFxWg6EDzo6XygHRiBcV6bMllzslc
 7/nhI4QS4X76truQOs2z92Y99be+rDvgq3AakUR6GfqXF4qXW3RRL+OO8R+V4lpeqEBTG
 URdH/gTRNmiw0NvvjV9znvNKQsBCYnCLYU6PcaT2/2RJAj18oRrC9FV6nNZgPeSvegA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mND8YMoA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mND8YMoA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42FD64002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=2gtyKHS0ZUa3TTKBaMqQLsWCtQvgfD13cL6Mqskv0gg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mND8YMoAO2gN1hqVHrjJWvwZe9IChZaiG2Vd9j8sFpKhbKXE6X2qDjSkwD+TxA/Ez
 rAw2361nO63giME2kF8WvjczrbHjCWTkLP/c4N/xa1ogxjkvtg5fLbjPVqon99Z3db
 iDUakKUWEgjLAzdmbDS8JmXehX7SgeKEtjtUkmofLs0HFa+J4W0zBCqfnGbIgSf8lK
 2mPmO+WVCbpuU5weQqr1WV8yHkdYNxrcyZTtS7Hunz/RfkYH+A79tUZPatgeGzO+qa
 MZmhsfc74pl31H04vwWt9GLoVJ8SSPSAV2hNUuchD+uOuw9A9WDEpwFBpt0CPACTAr
 MmljlFeVEM75g==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 N1/Rqg25sfckuYAyHvJcbU5pe8o+T8zug2pwj4eWMlilABoJmvhcmeqSHMJjzZfvWOcCiSyqCmW
 C1VDaUS0Si2bdJbq2MUs6KcxBWJuxPcSvYWf5tmi2pCat7eDvMXWZty+/zN84i7xkizDwXD1bo+
 Fnr/TfKMhVrg5lbevT1qD6IB1B87UWu7Og9Jzxo5gcXasJo66g0AitfCu9gXUxcIUZzSMnwFOHJ
 pEGimbQAw2J0btxRafmTLY8Mjc5xD+3Xt3Stm1RrjLVwciEvydUML6CL8BLi9vvznMYPYOta01e
 zeealfC8zS1SuGD4Irj9tP5ybXDLeSY1nyqscpzH49OlCUcX2Jvyb7DIOavZ+kAAtZBGwy7Cn7W
 xUjGde/YwGhlb25LMuMuiWd5W8Oo9n8CZD0iV0QL8wFqyUjPwG9vpRdJmFXvLXjE2+7u90Y2Vj/
 W8FR/85JIeIoqJyeEVSOGUr9bU4+kctmlmG/OAFICitaSLZTTkByNtEVFvJuVPFAFkC8McimXUd
 5cRFL29C2YFNuV45FZ+j4u3xJcwamEFqo87LWzIkQJKnbwrBJUNmM5C/r5zGWwDU9caT4fePQeU
 13ZAEj1EdKBEQNZMW9k7P1QDltZQMmvjpoX1b9FykaEUMZU=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D898A4C5852;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-1YKd;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:17 +0200
Message-ID: <20261011130058.3443432-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 12/52] package/boost: fiber needs exception
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f22f263538..362cd6c95c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -147,6 +147,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  C++11 userland threads library.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
