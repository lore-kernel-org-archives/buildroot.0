Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99184CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7192640EAE;
	Sat,  3 Oct 2026 07:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7y3sFDC7Ufo; Sat,  3 Oct 2026 07:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8332F40EAB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011405;
	b=QIgYLPsDGBaUucHWcmKuGQ6hinyXhQj6au4Wu/gkJ0uT5bj+OhvIs1Bnyyd8Fk3KwgqT
	 s9aG/0lJzAvgpQQ/1Ph4J+JWvZNyb5oGDkj3bpqZnZeUOQIEim74mGczQnwViqU0GeAXH
	 +u7E+WLR2PSPJs4vCqoWs2wayLBTe/hfbM6JWfEKa9hSKc/IGGeTRmWDFRWoQi14vpiJz
	 E4ntAyURRSWqCTXU3ol2JJUfomcYAiQF5mMVTMJX1x6Xj2Lftwu4Y1wtFlgmgDznJf13r
	 0LZpbxu1WZ+tJMCVvfubVXZLcv6deRMtkm1AeC9t2wk/lBJ7D0i6iRxZ0Yq4lUnsZhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i3EtnRx1OjP4JGheZvA5Ce3L6Bpe2jWOkNRL3jiekBo=;
	b=S2cVXinjs8WDr/Lv+iqp3ixtm5PFWoged5VlTeFluWgzWdI8SvdIt+q+4P9BxSjWjK/6
	 4HM7fPU1NGmOP/c7c3Hx+j7cjUkETLoG8wEJ3JJ5T6kXjlrZjmLorx4R6Duw8bdlYTGL0
	 s9MCHsDCZJIrayQsDxCQBOYXXQiF2vGRBvK2SB2XrS8WV04jXsoFeUa928SRjirW2c6fE
	 hr9MgVVa7dvTGaZRwQe8+NPF6EzyAeVYfgYXYoCAE+ey1yOZTRzPz/ok5XSmLvzK5jp1S
	 NU814NxUrliGLdeRlgI8aM7Luv5qOhdNWqbW7iRUeSTWG6z62FaFa/bR0u073NaDFZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tDgGFwow;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011405;
	bh=i3EtnRx1OjP4JGheZvA5Ce3L6Bpe2jWOkNRL3jiekBo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MgSKlW58FMwyK54/5EmA/aFn44S1/sUg8qDPoVjGh34f3+pIrOXVjnOWWq6BvoA/8
	 DlmwO/azSAeMWNbi4oE/M6DN2bMtE43uQYKKn0bDpvJ87KdnEWbG60d89yPfokbcNn
	 gPSnH1W/CclkfeVhH/9tTdWqqWk5kAngpHeAsFr2PuBMDJ/pGZgJoMBPcp7NZZmqUF
	 SZznsaWIhfjt9WlG+9qsmP6QGBKxfM7+SjQMeeNgWbuOrq8h6gogYFcvCo7HCSyNv5
	 vd5SV2NzsLg4TEH3cy0VmyrODQmq4Pbt2bsP6sQE+jsWdGyPencTebxK5O05XJY78m
	 TdgkGMRdfELDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8332F40EAB;
	Sat,  3 Oct 2026 07:10:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D790334E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C941040E9A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMsXhOEaUt38 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:10:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CDC8D40EAC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011404;
 b=d8OsN+CzipQF+Ye7pA5tFbaZHKI255YYDg/isnyvE5uWsm+JdJAUFr0t0AlHuGjdOxI3
 onCeySV8qT0Wd9EBWizt1xKcameZpSITmwXkDFLWFLFA2r2eEs9FPBeAsnp97Js/AbXZg
 3LdZBk1Sc5I3I7DpSl9gWo4jHLARtK0ifWDUxXCQuJsqLLtM3kSzqTR+b+k+nQM5q7Exb
 yRqAaZPEHsfs3+Ov9ffEnqTke5FfeSa/XQYmdHEgw0CzK/cmYKG6/646D6BvjBtOzuWQ+
 zhA9otXsWVOw8NH3si+cRh/g3L1Cd4svIN7tYrBSOCU4d1MNkDDJaANmeexLyXTBLYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011404;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UVYnJjp57DAYOnA5kTVeAs2azn3Lotm0Ub608CkXxZY=;
 b=qrQ97Q9wkbP46Yyi/7Tn9/0rRtBPfker0fZlNMnNi6zodfd4F5a9lmtqqw5bqdv/Feyn
 9HrVECIa9bhMWluw/1snZwYDV0PhyYcUnJTQdTx17feyqaTTk2L1GK5aAN65XQhDqNhh4
 uE7DPGB9yHc6Vw+5YgcwpwYxpePbCueXCjjxftOg3QNajL3fH1fhJKr44WwS60gmnxugX
 sS7am1hw9/wNsBtWTWhSxosspzwGm5V0HJKX98eJbZFUg342i+jqwkaZfCgszJlot1iaM
 5rijGFWfPNGJaj0Cl6H0kD3sIGCeRRGhTi9RpTyrPgFwifBwcD2ASl3oscgFpGRdbFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tDgGFwow; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tDgGFwow
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDC8D40EAC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010929;
 bh=UVYnJjp57DAYOnA5kTVeAs2azn3Lotm0Ub608CkXxZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tDgGFwoweJ/33Sv5AiLr/j67+XszS559kNg8mAZc7ajMbZ4NRdbZxmb0PGwMx5Rm+
 ZzIgHWUS8p+kJbLyuWkG5UnyjfoDl1zMJsI/bjceq3yQWdPuTKj1oVn/CLx/VYXDFF
 +rU6/nF27Myi0bPDP4ThG6A17WskgouZNOcbgCdt59ZVy76Apg1ngpSZfzA3Srf6+S
 g7gD9z9ANmAAOgPtupjaVPhJZafEWd8gbEq/3aYvVnnW/CL+RvjJAJAgkczQF5wINl
 tiX//GCIucxixtoGSLBKjgD3NxXoT1nYWC5BEzG/ERgNH8G0Sccwp7uxImSa9uQGtq
 UAP+S1q7SScjQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 E81Vt7CzqhzPu5oxSo75Y26CVmDiFrf/jXNq+qFj8xWxznoo7WJdLKQ3+JIyNKuDYnjmZke6mVg
 vwh+nHnYakr4/zNJmWQXBbwEyeljcwE/ID0vVRdN5X4fLQ/t8ej02Tv8+Jgrd9Mg1WQ/M9Jrt4+
 +/Uy6wRgoZOzqg25l2ggRTIjUMgnPKRp/vGzUzooa6aePbPPWvsc9kqep0fkp6NrEgmnYFbU6MW
 SsK4Y3GnXcxLJ8Sj+4fAyajS+8r8y4Pff6cSSCf+Us8fDO+Q9E84hy2zjeekMkDv2s1Z9ZZbjov
 BAC35CajXX//fHnsjp0W04cLwVLbshcEt0/M4srahVGHXiLMakb5V86ivhPZ9aVBFI6rT6b4Xqw
 6zPW3D/ajhahiZfGqTcZNtmePAkorzIlkdJXdRqk7hgLRTaSAKFzLg8YSQ0x6HupGA/6vHJaRce
 iTSCDE/KIKVYlvK30tpHqK0EbRCGaDOF654X0cPhw1oIiHoj6ZbT1H1tZDLQGapXAtwpVOuQ095
 iSWw+1CpsaCU8xBg2rYvUqN8MasYoRGxoyLb8OXwqmYhFtGdwXKhlXVIk0DdbR7jzH4A9VGZME+
 3zSlHJPamGIMsPWRUQf9bW/7HhwwwGXoTTOyyI8FX7Q2eZhktQydN+rwpxBNyFnrvHHepaEzuUI
 JovK4CS0dGGvjsO0XKQ==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 870D6A4C5432;
 Sat,  3 Oct 2026 09:02:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-0zaX;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:51 +0200
Message-ID: <20261003070128.1295458-79-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 079/114] package/python-scipy: bump version to
 1.18.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-scipy/python-scipy.hash | 4 ++--
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 27a72904d2..f6ce986a68 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  d36aba61d4b01c50551efd38ca03752f  scipy-1.17.1.tar.gz
-sha256  95d8e012d8cb8816c226aef832200b1d45109ed4464303e997c5b13122b297c0  scipy-1.17.1.tar.gz
+md5  e71b80d5afd37a5abf6e413f287315d3  scipy-1.18.1.tar.gz
+sha256  52c4b7422442aba924d03ad4019852b08a92e64ea187b933135687bfe2747307  scipy-1.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  221e59f5e910fd7f94e44f0dac77436a11338c285c6346232e4a850a50da0e94  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 8c536df130..14c57c2660 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.17.1
+PYTHON_SCIPY_VERSION = 1.18.1
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7a/97/5a3609c4f8d58b039179648e62dd220f89864f56f7357f5d4f45c29eb2cc
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7e/74/66de6258867beb2ef08f35f9f2ac017a52cacd5081714d239ff1a442d458
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
