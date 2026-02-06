Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A03BEB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1394F611AD;
	Fri,  6 Feb 2026 08:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOUTfGvoNQw8; Fri,  6 Feb 2026 08:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A13DF611AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365501;
	bh=Q6PMn/Zgbrxu3N3ESlyhDQ3Hw9ZTRcFTMPmeRindu4I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LLIsP1I0mlwYZFyXAjo4fUcUgqHwOPqOCzg6egoGB+oOD4fY/ojsY/6TSn4id0XcE
	 5rU/nB2nAEv39dcVvnh3/6fM3PDIxajnbzXHFsmRU6xhqK6EOkU/0SAB2jqW1u5nMR
	 scriYl47bLZNbPk9taSsm47ntD6iXi1hKMoePKHncdr0Zsc4KJq0rOflEhbUDpUKu/
	 heWAcB/RpQmFJv+Smtk5gURefA4GBq83mJRFJA/FxAo1sc6+UbjgWKRkW6Qlxw1F8T
	 JW0KXnWyGd/2abvR7lQbjLtqamL7S5OyxY6Sa6LbXI2ciKx+dlBngnSZA7fjyNAGMO
	 oW6bZtnOVOzhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A13DF611AE;
	Fri,  6 Feb 2026 08:11:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FAA7219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DD5C408E3
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kdywv5xZESLr for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C6F9408C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C6F9408C6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C6F9408C6
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so1185171f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365491; x=1770970291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mSqquPGxuowY4wwei/IzL78kvBbG/5epQeGJJgAvpGk=;
 b=osKe7+NdwZlNZTGVEsHhZT0XOC9Kz9584MFdtnNB9A5mYgnzsNjKzpEhIhAso5wgwp
 SCtbvHcefVs2jzfeHhVKhxb7Bj36H2FL2xLBJ/kAoZdAUd2eZRUbErIfY8lkSqgklQOg
 9Nbu09QG3TCGwBPbSRYG8ketvzsaMxlwMZR6KxrvvyqhYdR8dzbOc/+aMGTu7NTF36vX
 6xcfdNE3nkn+2M86+AYfwK6McXQfGkWla/GH/628GhRIgoGv3BsmLoApL3WDuD7s1BIV
 8AbCbFkbMgVPocbGtZdL9fGr+yvIpw4ZIx8a2jwZ+DbSpc7aNloCSXwRCtogP5wywZss
 A14w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdtPbhK6fg0jycbwmNqv8+8uMycE/gcMghgRmYR1mrXj1VoFduk7il8MsY6TViLiWChZmyYCPR7CU=@buildroot.org
X-Gm-Message-State: AOJu0YysSzJLg73GcYZpPMSUUqt6imdO0mAvL7wi0lUPrY4mpplCiDVN
 sGeWLLNXFOVBqe3lt6r50/oqiAxQ970DCVUx0v1iQJMJsCTUiiAt7+K5R6BslFYe7EtIOmGA8YE
 VTvWy
X-Gm-Gg: AZuq6aLIq/qGwMWCcYPZfsRAAk6ikYAh18+TifiD0qtFIUpFqFuTGP1NL1TzphPlyyE
 +XJhv4ku1eL2sOYI3nN0SymoQFtsBcZlhDEEJg+ibYUIxf1q3vv5sL2QA/oQTg7jGgwJCMFOnH8
 0mAqQsCwcz9q93U3XCf9ad0LF3tgrHYpspuf4AjFcLKlf9/38FxpWD/oKsvZQA+Io5K/g896XIx
 UAccGh/FiDYllgp0MdqSt75i2w1HuvKRktv6qMkcALzlUmNdH0XYs+snGMBQVtEeBkkK4FfjG7S
 F4Hc6AKNs6edbcJ4Rv0Xq/W3/cfUqAzxez+0PWE4e2GvbbHYSubfY2qLI6FaXOgx18CdjT4wDim
 uKA+ontr0/Va3Z+oXg1vMexffw8YOBk1/oLr2qoRT9fGHmGc8oknWczEEgtqxM+arLLnmUIVPxY
 iNaBk=
X-Received: by 2002:a5d:64c9:0:b0:436:180e:78d9 with SMTP id
 ffacd0b85a97d-43629035082mr2827480f8f.1.1770365490912; 
 Fri, 06 Feb 2026 00:11:30 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2ed9sm3781708f8f.5.2026.02.06.00.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:30 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:30 +0100
Message-ID: <20260206081130.31756-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127164715.309118-1-peter@korsgaard.com>
References: <20260127164715.309118-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365491; x=1770970291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSqquPGxuowY4wwei/IzL78kvBbG/5epQeGJJgAvpGk=;
 b=WxKCQojoT5W0etkQ9tN0bvtvpCV2sgcXcxk2oyCEYCPS2axGNHNZQuKcUZlXTTvL4h
 Me1DWmNEAikN05w2SWZYiU/BD82gmahLrs8J02nW5FBAQ0gQjm5uY8n7dMuLWn9ZWuh0
 JTUgBSiksqR/vYH1t3ORuwcvjLx0LMF4tV4ITSiuDyBC97qfhCLC+Swf2mKARUegvb1F
 AegR2NJKSgvVBVgOhQalGHKDUDAiJYH6RTt40GYJOkBG5rvJQaRfidDHRZt9i0sXCwdO
 yQmJ7VofXffLRaminsIfUGC7gUhDDVp2zvJjlKjaKw6LCYc3z2nWn/Q/J+r3osqBDg0G
 pk0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WxKCQojo
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.25.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerabilities:
> 
> - CVE-2025-61728: archive/zip: denial of service when parsing arbitrary ZIP
>   archives
> 
>   archive/zip used a super-linear file name indexing algorithm that is
>   invoked the first time a file in an archive is opened.  This can lead to a
>   denial of service when consuming a maliciously constructed ZIP archive.
> 
> - CVE-2025-61726: net/http: memory exhaustion in Request.ParseForm
> 
>   When parsing a URL-encoded form net/http may allocate an unexpected amount
>   of memory when provided a large number of key-value pairs.  This can
>   result in a denial of service due to memory exhaustion.
> 
> - CVE-2025-68121: crypto/tls: Config.Clone copies automatically generated
>   session ticket keys, session resumption does not account for the
>   expiration of full certificate chain
> 
>   The Config.Clone methods allows cloning a Config which has already been
>   passed to a TLS function, allowing it to be mutated and reused.
> 
>   If Config.SessionTicketKey has not been set, and
>   Config.SetSessionTicketKeys has not been called, crypto/tls will generate
>   random session ticket keys and automatically rotate them.  Config.Clone
>   would copy these automatically generated keys into the returned Config,
>   meaning that the two Configs would share session ticket keys, allowing
>   sessions created using one Config could be used to resume sessions with
>   the other Config.  This can allow clients to resume sessions even though
>   the Config may be configured such that they should not be able to do so.
> 
> - CVE-2025-61731: cmd/go: unexpected code execution when invoking toolchain
> 
>   The Go toolchain supports multiple VCS which are used retrieving modules
>   and embedding build information into binaries.
> 
>   On systems with Mercurial installed (hg) downloading modules (e.g.  via go
>   get or go mod download) from non-standard sources (e.g.  custom domains)
>   can cause unexpected code execution due to how external VCS commands are
>   constructed.
> 
>   On systems with Git installed, downloading and building modules with
>   malicious version strings could allow an attacker to write to arbitrary
>   files on the system the user has access to.  This can only be triggered by
>   explicitly providing the malicious version strings to the toolchain, and
>   does not affect usage of @latest or bare module paths.
> 
>   The toolchain now uses safer VCS options to prevent misinterpretation of
>   untrusted inputs.  In addition, the toolchain now disallows module version
>   strings prefixed with a "-" or "/" character.
> 
> - CVE-2025-61730: crypto/tls: handshake messages may be processed at the
>   incorrect encryption level
> 
>   During the TLS 1.3 handshake if multiple messages are sent in records that
>   span encryption level boundaries (for instance the Client Hello and
>   Encrypted Extensions messages), the subsequent messages may be processed
>   before the encryption level changes.  This can cause some minor
>   information disclosure if a network-local attacker can inject messages
>   during the handshake.
> 
> For details, see the announcement:
> https://groups.google.com/g/golang-announce/c/Vd2tYVM8eUc
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.11.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 7c689f9144..6134ec5f75 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f  go1.25.5.src.tar.gz
> -sha256  db908a86e888574ed3432355ba5372ad3ef2c0821ba9b91ceaa0f6634620c40c  go1.25.5.linux-386.tar.gz
> -sha256  9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b  go1.25.5.linux-amd64.tar.gz
> -sha256  b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9  go1.25.5.linux-arm64.tar.gz
> -sha256  0b27e3dec8d04899d6941586d2aa2721c3dee67c739c1fc1b528188f3f6e8ab5  go1.25.5.linux-armv6l.tar.gz
> -sha256  f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4  go1.25.5.linux-ppc64le.tar.gz
> -sha256  a5d0a72b0dfd57f9c2c0cdd8b7e0f401e0afb9e8c304d3410f9b0982ce0953da  go1.25.5.linux-s390x.tar.gz
> +sha256  58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059  go1.25.6.src.tar.gz
> +sha256  59fe62eee3cca65332acef3ebe9b6ff3272467e0a08bf7f68f96334902bf23b9  go1.25.6.linux-386.tar.gz
> +sha256  f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a  go1.25.6.linux-amd64.tar.gz
> +sha256  738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5  go1.25.6.linux-arm64.tar.gz
> +sha256  679f0e70b27c637116791e3c98afbf8c954deb2cd336364944d014f8e440e2ae  go1.25.6.linux-armv6l.tar.gz
> +sha256  bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73  go1.25.6.linux-ppc64le.tar.gz
> +sha256  3d97cc5670a0da9cb177037782129f0bf499ecb47abc40488248548abd2c2c35  go1.25.6.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index c932baf018..91e5fbf347 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.25.5
> +GO_VERSION = 1.25.6
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
