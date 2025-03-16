Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6ABC282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 19:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451BC811CE;
	Sun, 16 Mar 2025 19:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfgxjvVYOgQ3; Sun, 16 Mar 2025 19:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A55B811EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A55B811EA;
	Sun, 16 Mar 2025 19:45:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C70FCD5
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 19:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B707E811EA
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 19:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtacEFwKL-LA for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 19:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C589811CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C589811CE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C589811CE
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 19:45:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9BC244378;
 Sun, 16 Mar 2025 19:44:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tttup-003uoW-2x;
 Sun, 16 Mar 2025 20:44:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Heiko Thiery <heiko.thiery@gmail.com>,  Andrey
 Yurovsky <yurovsky@gmail.com>
References: <20250316075756.333766-1-peter@korsgaard.com>
 <d3fa638db3bf0ad03f5f9d345011c2eb@free.fr>
Date: Sun, 16 Mar 2025 20:44:55 +0100
In-Reply-To: <d3fa638db3bf0ad03f5f9d345011c2eb@free.fr> (Julien Olivain's
 message of "Sun, 16 Mar 2025 11:54:35 +0100")
Message-ID: <87h63s4v60.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeejgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeduveehveefhffgveejleegtefhieehgfefveekieevkeeuheegteffgfelvdffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehhvghikhhordhthhhivghrhiesghhmrghilhdrtghomhdprhgtphhtthhopeihuhhrohhvshhkhiesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Hi Peter,
 > On 16/03/2025 08:57, Peter Korsgaard wrote:
 >> Fixes
 >> http://autobuild.buildroot.net/results/6efc1275d3aac9f0a4c000f3d0911b5a880e495d/
 >> Rauc uses X509_PURPOSE_get_by_id() since rauc-1.3 with commit
 >> 375dbb16dd94
 >> ("src/signature: add support for codesigning certificate purpose"):
 >> ../src/signature.c: In function 'signature_init':
 >> ../src/signature.c:97:13: warning: implicit declaration of function
 >> 'X509_PURPOSE_get_by_id'; did you mean 'X509_PURPOSE_get_id'?
 >> [-Wimplicit-function-declaration]
 >> 97 |         if (X509_PURPOSE_get_by_id(id) >= 0) {
 >> Which is not provided by LibreSSL:
 >> nm -D target/usr/lib/libcrypto.so | grep X509_PURPOSE_
 >> 00000000001377b0 T X509_PURPOSE_get0
 >> 0000000000137850 T X509_PURPOSE_get0_name
 >> 0000000000137860 T X509_PURPOSE_get0_sname
 >> 00000000001377d0 T X509_PURPOSE_get_by_sname
 >> 00000000001377a0 T X509_PURPOSE_get_count
 >> 0000000000137840 T X509_PURPOSE_get_id
 >> So force the use of libopenssl.
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/rauc/Config.in | 1 +
 >> 1 file changed, 1 insertion(+)
 >> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
 >> index af0b99c36b..701ffef76b 100644
 >> --- a/package/rauc/Config.in
 >> +++ b/package/rauc/Config.in
 >> @@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
 >> depends on BR2_USE_WCHAR # glib2
 >> select BR2_PACKAGE_LIBGLIB2
 >> select BR2_PACKAGE_OPENSSL
 >> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # uses
 >> X509_PURPOSE_get_by_id

 > If we force libopenssl here...

 >> # uses ENGINE_* API
 >> select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 >                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
 > ...should we also remove the "if" condition here?

Ahh yes, we can.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
