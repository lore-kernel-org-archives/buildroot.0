Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C554CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6A44403E0;
	Sun, 11 Oct 2026 13:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWExWcwOeHNz; Sun, 11 Oct 2026 13:04:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F1D2F404C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723871;
	b=Evr6rWnN/upiHVZLIkK/pZRDG17ujHF3/Sdija6lO25BsU9j3fkykHSNVQa3THJAOUp0
	 TFnzfC6ttFAeDyt6VENnJtTNe6tK/HGgTDBYZ+lzl6WiOpn20KtDSbTE5ATvMht840Ehq
	 I3kLU5S26kXuOc/HI4/q2onlxUhQEbqQgVDIqr4B9rYL+XhW3TCYisOykvyirSj8nK4lo
	 IpZgWK5Z//Ih3nkC7G1bFfeVFJJgiEwA4HejCEkFAvRQmA0DEpq9rlnG6dUdUzODHT16I
	 fl09BfMIA8NF9Ncgi2jOOe9PKBujGPm4tST6igdmaIfd0MlNpYBlGXo3jGeZjn6xSww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3Wy3VL1CjwhiW+QZC+QVVqFPvk8KFWVI7WFHln+UpVk=;
	b=Pr7jWXzARAVWh4V8yBx2kWTRiDGG2GGaYQvdwBBoX3G7uxuGjOJHkNo0pZq+aNcWQwFb
	 BuT/Cil2056hOs/WF12UacPMr0gVfIBigtsQ7e034xI8ytFuAWLPcdoPXCVFfZwEGnS/F
	 AfrrrG0KrjAGHAL06feaK8jjZ8bZ6SRIWZ2h9FWo7jSQnhbMs4u4Wb/8276vbf+M2/8Jd
	 7NWSgLKBUDaXHPKoLJWailY53q89N7nnCjW/WeXNmMbPs2nQa9dtIpgo4Ld5Xju/kEQT2
	 PwDrUxYF+Qawm1cyuliHK3rpfF+hqmo/v72ZS+7RGZ66yD1FXNOeQQbiEHKwbjbYXyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723871;
	bh=3Wy3VL1CjwhiW+QZC+QVVqFPvk8KFWVI7WFHln+UpVk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JW1EGbNwOtWQ9wXv4+y3w2qOs7q2bXncVMiwPyjIcHg+dgXi7e/7Gl/K4IO8bPkry
	 p1TSbhY7nBtWcPxbz6mr0RXkz8m+S5wgvSXcMoLPy5tBy4uRP4sOnOvVEoo41QhMFL
	 01zF3+B7KjijEy66vYxHbNF0Y4lvRr9eGaONXzQAbEAYI+N1jlmWi0/RyWZraVCSWf
	 LRQJyqEb0zXUiFxsHzMQdLroebIUWcoO6KwRJ1wm5Wq6bvt6oATbP+2R+j0IsoHTfm
	 IFe1jW8xnJ3oGhmuifJVeZ+bZh2vku6NLlr0Wvb9WXq9UcwsQ7kzlia0B07/rkIngu
	 HIrKgHjHtbWtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1D2F404C1;
	Sun, 11 Oct 2026 13:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E25EE111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C880680D93
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeLBg7QWO_NC for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:04:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27CD580D91
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723868;
 b=fbNOhWj4/EpYQCsd+oveSG3VtsrE27Y28sZ2XTFjbXGaRxZhQOIjx65WiJC0VN59ZN7B
 AuBL/+xqVVxZ8dQYCm8iIeX1jWzhyFkR5guQ4V/VjJz9U052kUz5bmuEn8wCRP72MAfr/
 pYyoPmwPNlQS/SO13vkz+6l5GjwLyiHjDVJq75O85pwDnuPdmIXht8fJKcZ1JLoijbVwE
 +E+PpVqiPazBcixkNno/K3iAaQsYci+JcRyTdCVBo6annK0DGA71e1fnsIazbQI4/q9w7
 qXCdT8XFXFLIFwJ26ON4V29BfrkQjdp1uaf3+VZskGi8EIiiopjGTMLqKsOqvlhUkYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723868;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=i5XiGAPsKdY11RY09V++pXGdhW/RHw8I/ZwUXdhX7f8=;
 b=gvwgy4zkOhSmoCdKrg4vjrGeVpmNNCQz0ZNfTpB1iL+tn+tpSAVD9lbF3DvwgY0FDEtN
 u2k2BXRYK+aKoiaOQj3YaAD1z4/ZTWsNPJqNhUad3kffduAPgvYbm3A5HP23InurM7VjT
 o3C1XgYkq+UUJCOXQ3eSiR8ZorR31xYcDISQTxejxefSDEeUavJpPSHsLDnUeTM70C2Oe
 6LbyDz2IIRD7TKA6YLhIbMsGQd1i888eezsV4x3rVO0txjAD0WQLpX/gZiCGgKYUeSfEu
 id6V6YgTPJEVUgnY3Kr/sWEaFH91JIgq7E8lqjqyf92VK96xAYru95Y+Cec1BPLQ0jA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Yet4DRqO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Yet4DRqO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27CD580D91
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=i5XiGAPsKdY11RY09V++pXGdhW/RHw8I/ZwUXdhX7f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Yet4DRqOhlmfMIA7sBdBz0xeWIW3u10sH9NF6oaCRUf7DX4nHLbGnIVLFtN4hPB2n
 6OOQYO8nEiVTmwnv+awgDasSLxdvB3f+IphJIYm50KD/VzyLMbcvc36g3cb0HsYAeW
 HXmu+YQqjqDDaN6+5anWKbYDhFPv/CfSYgqlbBTmdG9f3bE0ajpt5n+XnOYB2iz6zh
 A8NrbTvIX3T2RqMFlTt0sqM+67dcs8o5gUWYn1N3P7raf1kg8Vj/B8a43/SGBpLvHa
 0Zgs0+7NEO23l3T/9Fwet3mDIqa4H9fRDAynSHD0ZSL/TuexlHuKS9FOxuKMYJT/Dw
 vVQVcTwP+gcVQ==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 0BgBhgskj1hjryudQDZ+7+imXQ2+AblrTMSqe0vMu1iSFQ+2aaieMNJKq2u4FxMQ9Feyik9Ya8O
 Sk/ngfgikpLWYW1V3+7X/GkYUwYV9xfIsc0NjdKDBiYRs+sBFWzss1kjCTWMX5KGPcRGHkx9iNo
 FCypppztEzDg0G0YlMUHnl4iDatSY9HWWYHwghxYGNizjmqtDXIpPsYMnZcmJzYTFBBYav3WsWH
 21/llH7W0pBiF1dK/BNEFLveKtyMVv+Kqmo226BpIGTCG0ZOt/UBEwpOaOth9G1GLbLkZp3t1uO
 c2rn68TEhELLBmNafmBEr3djJCl6VDU4xmmD1QE3EfsLYqpMWoqp37Xk8TgTmCH+fTfRXr+dCZX
 MaYHBzcNop10zMn1B/yMYGVmjw/m+hMx/5MtJDYVTZJLL9oen8W7oDXQPq43n3ODU75jZcg3lYL
 WZeOmg3tYG9HH7Fi1C0TV2JnYgAjLhyNlD5ACVhjDZYct9MM6T9U6YN1rDjJrbuBks7LkdjWMEi
 P1zMpJeikYCwTre3m8ZtlQKiz97ygG5ssSm+cbidhOf6xe7v2zhT3+ChIh+iniMoyXHwedCEyBu
 LOh6gkSTwAvOe43Ws+kZ0B9VNqRo3XB/faywu50=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BA942A4C5858;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-2ZK1;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:21 +0200
Message-ID: <20261011130058.3443432-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 16/52] package/boost: test needs exception
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
index 5ab351d8e4..0f52bbd475 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -373,6 +373,7 @@ config BR2_PACKAGE_BOOST_SYSTEM
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Support for simple program testing, full unit testing, and for
 	  program execution monitoring.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
