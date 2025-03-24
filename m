Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D4C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 16:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC9040214;
	Mon, 24 Mar 2025 16:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haNK7oF5_uY9; Mon, 24 Mar 2025 16:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C48240356
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C48240356;
	Mon, 24 Mar 2025 16:21:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C02F1B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6273405F0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcJ6I136vzH9 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 16:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4FDF405C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4FDF405C4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4FDF405C4
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:21:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A9E844392;
 Mon, 24 Mar 2025 16:21:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1twkYN-005Usi-35;
 Mon, 24 Mar 2025 17:21:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Heiko Thiery <heiko.thiery@gmail.com>,  Andrey
 Yurovsky <yurovsky@gmail.com>
References: <20250316075756.333766-1-peter@korsgaard.com>
 <d3fa638db3bf0ad03f5f9d345011c2eb@free.fr>
 <87h63s4v60.fsf@dell.be.48ers.dk>
Date: Mon, 24 Mar 2025 17:21:31 +0100
In-Reply-To: <87h63s4v60.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 16 Mar 2025 20:44:55 +0100")
Message-ID: <87zfha4cxg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeduveehveefhffgveejleegtefhieehgfefveekieevkeeuheegteffgfelvdffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehhvghikhhordhthhhivghrhiesghhmrghilhdrtghomhdprhgtphhtthhopeihuhhrohhvshhkhiesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/rauc: needs libopenssl, not libressl
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
 >> Hi Peter,
 >> On 16/03/2025 08:57, Peter Korsgaard wrote:
 >>> Fixes
 >>> http://autobuild.buildroot.net/results/6efc1275d3aac9f0a4c000f3d0911b5a880e495d/
 >>> Rauc uses X509_PURPOSE_get_by_id() since rauc-1.3 with commit
 >>> 375dbb16dd94
 >>> ("src/signature: add support for codesigning certificate purpose"):
 >>> ../src/signature.c: In function 'signature_init':
 >>> ../src/signature.c:97:13: warning: implicit declaration of function
 >>> 'X509_PURPOSE_get_by_id'; did you mean 'X509_PURPOSE_get_id'?
 >>> [-Wimplicit-function-declaration]
 >>> 97 |         if (X509_PURPOSE_get_by_id(id) >= 0) {
 >>> Which is not provided by LibreSSL:
 >>> nm -D target/usr/lib/libcrypto.so | grep X509_PURPOSE_
 >>> 00000000001377b0 T X509_PURPOSE_get0
 >>> 0000000000137850 T X509_PURPOSE_get0_name
 >>> 0000000000137860 T X509_PURPOSE_get0_sname
 >>> 00000000001377d0 T X509_PURPOSE_get_by_sname
 >>> 00000000001377a0 T X509_PURPOSE_get_count
 >>> 0000000000137840 T X509_PURPOSE_get_id
 >>> So force the use of libopenssl.
 >>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >>> ---
 >>> package/rauc/Config.in | 1 +
 >>> 1 file changed, 1 insertion(+)
 >>> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
 >>> index af0b99c36b..701ffef76b 100644
 >>> --- a/package/rauc/Config.in
 >>> +++ b/package/rauc/Config.in
 >>> @@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
 >>> depends on BR2_USE_WCHAR # glib2
 >>> select BR2_PACKAGE_LIBGLIB2
 >>> select BR2_PACKAGE_OPENSSL
 >>> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # uses
 >>> X509_PURPOSE_get_by_id

 >> If we force libopenssl here...

 >>> # uses ENGINE_* API
 >>> select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 >> ^~~~~~~~~~~~~~~~~~~~~~~~~
 >> ...should we also remove the "if" condition here?

 > Ahh yes, we can.

 > Committed with that fixed, thanks.

Committed to 2024.11.x, thanks. The function was dropped (by accident?)
by libressl 3.9, so 2024.02.x is not affected.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
