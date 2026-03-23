Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDC5EC01B8
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 10:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AF882339;
	Mon, 23 Mar 2026 10:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4HObNlO_DJS; Mon, 23 Mar 2026 10:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 616F082310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774260241;
	bh=VluOHqSUJvZGTt/3004wbaE9T6bvJbyaHMKfFYmTXEM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwqmzpYBspVqpgtaOfygGPIjm39elEmgyuYe4gGL0r7xaNmmxrl/f17RMbvcAn8vv
	 s7wtWWdH7tZzqi+fAqNPAaNpSokuzoqkR0IoDLaBDoptbjXL0ovCoHihTt4kKdI/IG
	 5tQgwI74rJ1HYsdKD+y4yo6x/4aDpoe8n0UlC0ECygxcyozknRNC14BHsbR/ZcWJMj
	 FbzYnT6pZVdU3N+krceV9ZKEbi14j3vY1zxEIbIkB7x5zF/6f/2XYxwqBksbRPZusD
	 C/iaf5jtp/IQw9k1TAmjUZ62Y6hPI2ofYX4QU6JfDqPZbuQYtvk1cAVJPlwBRwiCRS
	 9ZFSYsSc8VpqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616F082310;
	Mon, 23 Mar 2026 10:04:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D49FF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F44140CCE
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5cMSxQIfwzC for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 10:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=54.36.140.182;
 helo=7.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D081B40A90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D081B40A90
Received: from 7.mo533.mail-out.ovh.net (7.mo533.mail-out.ovh.net
 [54.36.140.182])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D081B40A90
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:03:57 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net
 (director1.derp.mail-out.ovh.net [51.68.80.175])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4ffTK63qyyz64j4;
 Mon, 23 Mar 2026 10:03:54 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net
 (director1.derp.mail-out.ovh.net. [127.0.0.1])
 by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:03:54 +0000 (UTC)
Received: from mta10.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.188.121])
 by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4ffTK61c1sz5vdW;
 Mon, 23 Mar 2026 10:03:54 +0000 (UTC)
Received: from mailstore13.priv.ovhmail-u1.ea.mail.ovh.net (unknown
 [10.1.8.13])
 by mta10.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTP id BED787814DE; 
 Mon, 23 Mar 2026 10:03:53 +0000 (UTC)
Date: Mon, 23 Mar 2026 10:03:53 +0000 (UTC)
From: Vincent Cruz <mooz@blockos.org>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot <buildroot@buildroot.org>, 
 Danomi Manchego <danomimanchego123@gmail.com>
Message-ID: <1747365256.25028551.1774260233624.JavaMail.zimbra@blockos.org>
In-Reply-To: <28c45d0ea293dd8eadfcc35b6fb8c1f7@free.fr>
References: <20260312094558.120765-2-mooz@blockos.org>
 <28c45d0ea293dd8eadfcc35b6fb8c1f7@free.fr>
MIME-Version: 1.0
X-Originating-IP: [213.36.7.12]
X-Authenticated-User: mooz@blockos.org
Thread-Topic: package/libwebsockets: bump version to 4.5.4
Thread-Index: f+IW2X+Zb50vuYth1cQOsNilVsn7ag==
x-ovh-tracer-id: 1155736256435506023
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGxs60F2xktYzk6ZmZvi4V2kOdWZztfzZWvaRF3Hp06wxYAE15zLvSqYgQrkh5+wyFoWvLvC1nMfZmDN5i2ba7na7FceRpmtwRo7tR02E/IrrYl8vd+JEYeqs9IDGHTjIC8otJ9Pb1cCqfTnKQQamI40UsNojJqXCuAGYy7/v+z+rrLfNoYrke/99mOwzlLRK9AQLT/OcEYVYtJiMJSHJ6hgsDCMAJsm+fOJWjAdZdBuy/KMo9tuU4iZsFFF4JLISWna9JdqoQ6CEMBI8JFW6e8KWGTUsI3R+9ZFLeenr+ETTFJY0tiGseQHkNES3YaOqJj9/G5CVvsfhOdofF41jphZnQOMI7GraBfIBBwQBSmoyEabCyVdGh4kIyUGZxOhA3fSuMWhlwWnQjcMzi7JkImZqGHKCmLkkgqg+4FZlXpow0POn8qt0hD6GLEujVbSMyPF5Qjsk4LRQdtzJ0PNYaAFiOPsIGqQKnxUhFOmkwMfAXdYp8h+E6AgmPEcw5E/mKLrROpRk327iGo6LcUYNgftoEQN5pxKd0PhYokvO36FLfxKfvrweHSiUIO6DnhoB1NZaARag1IHEzzLP0EBP86FMXkzGuLYfqPWt8jyZ3VkY0QiI8afUdrlfA8dvM8OE09P0Y6h6bewkveRttVbf5WOhkQnk2FcHLDqEp09b3ZOg
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to
 4.5.4
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

Hi Julien,

Sure. I'll try to send a new one today.

Regards,
Vincent Cruz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
