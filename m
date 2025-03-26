Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53D7C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 20:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D1DC60A64;
	Wed, 26 Mar 2025 20:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNX3vvpgfBta; Wed, 26 Mar 2025 20:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F7E60AA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F7E60AA6;
	Wed, 26 Mar 2025 20:20:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 582AE150
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4729280E59
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaTD2lxl4FWE for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 20:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1600F80E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1600F80E46
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1600F80E46
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:20:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85CFD443B3;
 Wed, 26 Mar 2025 20:20:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1txXEX-00CqNy-2a;
 Wed, 26 Mar 2025 21:20:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250326201652.3058963-1-peter@korsgaard.com>
Date: Wed, 26 Mar 2025 21:20:17 +0100
In-Reply-To: <20250326201652.3058963-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 26 Mar 2025 21:16:51 +0100")
Message-ID: <87tt7fv91a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieeigeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfedvveekhfetudeggffffeektdekueeulefhhefhvedvvdfggfejhfelfedvffdunecuffhomhgrihhnpehrvggrughthhgvughotghsrdhiohdpghhithhhuhgsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfohhnthgrihhnvgdrfhgrsghrihgtvgesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to version
 2.8.10
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2025-27809: Note that TLS clients should generally call
 >   mbedtls_ssl_set_hostname() if they use certificate authentication (i.e.
 >   not pre-shared keys).  Otherwise, in many scenarios, the server could be
 >   impersonated.  The library will now prevent the handshake and return
 >   MBEDTLS_ERR_SSL_CERTIFICATE_VERIFICATION_WITHOUT_HOSTNAME if
 >   mbedtls_ssl_set_hostname() has not been called.

 >   https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-03-1/

 > - CVE-2025-27810: Zeroize temporary heap buffers used in PSA operations.
 >   Fix a vulnerability in the TLS 1.2 handshake.  If memory allocation
 >   failed or there was a cryptographic hardware failure when calculating the
 >   Finished message, it could be calculated incorrectly.  This would break
 >   the security guarantees of the TLS handshake.

 >   https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-03-2/

 > For more details, see the release notes:
 > https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.10

Notice this also states:

Mbed TLS 2.28.10 is the last release of the 2.28 LTS and won't receive
bug fixes or security fixes anymore.  Users are advised to upgrade to a
maintained version.

So it would be great if someone who actually uses mbedtls could bump it
to the 3.6 series.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
