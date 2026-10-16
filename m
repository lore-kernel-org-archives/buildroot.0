Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E1CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A871640A16;
	Fri, 16 Oct 2026 15:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSIkRuaHE9Zv; Fri, 16 Oct 2026 15:02:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CBF3D40A5C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162937;
	b=UHS53PuafgU/StLwK+hZ0WlV+FtjBUV089TM2OiXCtu6Or+473HteK12sqFmN4TuJyt0
	 yC9Lh9XcBQZBUWYmEG6J2BcsQg0kqXbe8DMqHJ9usDOPl2LsBkO+pCPcgmMRTFr7HA0re
	 NXkxSnaQ8bd1a8XXHiBJAIgvA8CZnw3HwOmsnL5i8lKuFo02cqNRkDtDtOiSiw26A/q01
	 yMIAyOPBCE58bqWmsMnJyIivtemckA9bTfIHC057Yjxgn8srEddnAuuWmixn67XUtsOPd
	 PwgBpLef6b0Qi8+JXKSNx/QZkVzQLsO4UklhVo4wI+vgJO70oDvj3ga7hKNabgS27VA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162937;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cCedSMMchwCzbEXYOtIM47NJKdwrzqAAyJmwFiAbtTI=;
	b=rbuCo4Z8ICPkxBn/h6d19NKivsATKOzpcB9y0Cy6ICi2SWgJ+0L5pRj5nDVgnwMkfDiX
	 9gDq9FOgTy1InK0TksO8woMJbfsALl/ccaQOTDVT/1r+mXrIn5xq/xQPCnzLVYSniKuFC
	 2uTf+d+e7CkUiiZbnqbFe+6dInxvfLM43EqZkjsbL1CdEprW4MaA56thgv7mZtadYOaHo
	 Tuw2mJsLk7RozObs7yHrzofiNjQbahbQ5B3/muRoHe2cG2KxQhcVkXTJqVno47kQZNCLj
	 3O8maeMJxYucUUUr+K5AJoJnmci7NQGar9e5Y0utQNdpkS0ajMMDM8SaM8/n6wMRrEw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162937;
	bh=cCedSMMchwCzbEXYOtIM47NJKdwrzqAAyJmwFiAbtTI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EhmUhyEpoz4nobVe38Hdw2DLBs91o0B70pwKIkwDP1NpAAYqDQlw884z9+m7JNHFY
	 7JMBC4gO7rBDOOrvur6W8PWHbnZqIAx7wAbz+NgVSZ6YgsynIizH9Fnl2BwSSw7KVY
	 13TO7qi4mTr4CS2H/jLb2gn3u7cu4Y06bvC2Doy0a+GJvtYAz2udVQBXtd+6263bYl
	 wcvgP0doGq0ye4s7Zi3IXhPKyNUNw+u9MMSxoxkUZ52A1ag+Uvfathl7c5hvTt2DTf
	 HK2Oex0IHZsXgYhXC9zbwy88M8Dy/kU/6MLBTz/5plfI0eugZHYoqF6it0wqTZhKK0
	 k7qcjsVs9Djxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF3D40A5C;
	Fri, 16 Oct 2026 15:02:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EF957AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 851104016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbNTc5D2rXMq for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B1BFC40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162935;
 b=HHmW3998AD/3GoAlfwBHlRX67CKAKN+Cpl/GGSCPOYNRTYLRAZqi9awksbEX7TyVHed4
 /Rmwczc5V1Y2vV7Z4vafILvW+kaxs+n+mg5Hq1mzfijp2SM+uGzc2e23/UW8JnpUJ21wy
 ASrVdnMxzG/xqFIEQzGcgaltfATcju2PsYgJEcOB+YIOI++DbcyPYbGCRaUmE1yFIAY7s
 930rWZ9j7v72U6Tu6pqNqMew+44HKRb62I47MeGe7MUjxjiZZE/qCFEtGt3x/GzG1sbO5
 UgqabofVmp/dCSEJdIhCMQFOqqjC14AxJ/yB4LlAX7joJif+xzeHU1zzwiIYfRIHX3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162935;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=p3pQ1LuJnzRGZvgAGeu/ovchuqH8VQg1KuK9mniY1SY=;
 b=djtdZcUyz7MXtr1ewI3S9sktAyq6/xt4cX3sszHGlpD8+PxFIX0AqwVYgRPbx5/tqW3M
 gN7PxkrdXlmz/VC7SNxTF4QJdiaOKxUkOnXePIlNzEhHKxeHx+wFGfIDL7MFvn++TfX9Q
 pRwzfZebMM7Ud467hWmpEhLd0luRjnY6e5BQloz+2fgZRbr5ejinJwRPz4lMoudk56SUa
 UJcCDelzaVee6VDi2ptNSkbNoVLiIbvI7mYxTCkrlBeQNjQ5UdgpT9RpB7L233UL9025c
 cR786jXQ30MFpQN4Nf+9N56ZX5jFoNScQFDv/b32g5va7SY8+J6JoUBHR8QRZMCAJ4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Vu5jYmIs; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1BFC40042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso376455e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162932; x=1792767732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=p3pQ1LuJnzRGZvgAGeu/ovchuqH8VQg1KuK9mniY1SY=;
 b=xMv8r8pvLqC5iUXAWfLwEoZ9JrogQd5R5Qzv/ZOh0mPZst+m7k1VLlBWJQ6Q6Woi5w
 pe7aX0jQ61TBsF6LsmHzw+oRttFeNFQx2+WYeVASDHCtr1L6v1mOJO9tQb9eqmLjkpWO
 uobO6WpFh4lfCn9SXiP0DHU16HTi0BsFfI4LJTtcJfTpRwGqc/MwMHAb9+1SMUdCAljb
 y9vZFpLt5fCdhNmUtR19vn0ijQ0RqhkwfkdB0YUXdmoMEdm297hio29quyAIbliYpguY
 pse6T3qYHNOgBWuJ4ydNKKuNTzzV8ueHHgijVYmdYBeH6SueR61n97FAYXrHMcO1kt9m
 VIBA==
X-Gm-Message-State: AFq9FYKwjRfjud9ZWDj0alPHRxNdVuNPRl4ldofIAb/aYIaCGKXjNKVY
 Nr17UVMp0nbDuLrGz4aF0DMEyF//cBYqUpKWkhIs1GsKCZWirWNRdGOVSY7vPNA2jSNr+VShKC1
 CtgVlnBE=
X-Gm-Gg: AYBFou0eACgwCXxlSyYXioXuQObdvODfCIJ5+vWaQrlqy6tf+wAwPjkXbULNlRx9QHt
 ECBoQK6sl6BLkYrGP0jHhdbgByygXzP8z81eZ5Md9mCJNrXBOkumD1OZkusilMORjZu9fE0Hw7f
 Cq/tHOv8dzOo3BU1ZK/pKfFjLzamPNWDsAOg5aiTnPIITm1x6usnE8GlSY/ZUssHdc1qVOdRxRf
 TfKud2m46K9s3X6WRbXAUyFb/Yo/Bs1JWVnd4Uu9TPYezmDGtIzwMG7nCibRskP7+TiGkFtKhh9
 03mT2MVjTbaHo/TcgEAHhUlEdtjdptgq6EBeRZVBjKaD9GLVSPU3tCPsQme/FuLIb3IfkZsAF7/
 m7NMwdQ5uIB6qo0k90eqWWjvqynLIvbV+14w1gWhNM7/ozdd+c0FMi8ZXokuYPFYy/9a+67HuSB
 5YvxDMIo7i9hDZ2L2J5bonko01vGOKSBPc0zNKFsnGL4kEwvrk+LbHkt8Zy1ObsdsX8R+poXXuZ
 39i8GcjHO3fFztWHTv+i4rMir2DACSsxQfHwMclW/W6QBPSFcdN
X-Received: by 2002:a05:600c:a085:b0:49f:c1a1:5222 with SMTP id
 5b1f17b1804b1-4a1d762ba65mr904675e9.33.1792162932370; 
 Fri, 16 Oct 2026 08:02:12 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ad6245sm71311705e9.3.2026.10.16.08.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:11 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:09 +0200
Message-ID: <20261016150210.60390-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-6-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 05/11] package/m4: add CPE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/m4/m4.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/m4/m4.mk b/package/m4/m4.mk
> index 396c2bbee2..89a9989268 100644
> --- a/package/m4/m4.mk
> +++ b/package/m4/m4.mk
> @@ -9,5 +9,6 @@ M4_SOURCE = m4-$(M4_VERSION).tar.xz
>  M4_SITE = $(BR2_GNU_MIRROR)/m4
>  M4_LICENSE = GPL-3.0+
>  M4_LICENSE_FILES = COPYING
> +M4_CPE_ID_VENDOR = gnu
>  
>  $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
