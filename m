Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196A4C2D0CB
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 05:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C2761013;
	Thu, 15 May 2025 05:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6a6c-JLdZ_z; Thu, 15 May 2025 05:52:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD906085A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD906085A;
	Thu, 15 May 2025 05:52:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60B83119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46F4F8143B
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YIs-E0GHIGp for <buildroot@buildroot.org>;
 Thu, 15 May 2025 05:52:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB4D781306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4D781306
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB4D781306
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:52:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3356E43B23;
 Thu, 15 May 2025 05:52:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uFRWC-003xep-1U;
 Thu, 15 May 2025 07:52:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
References: <20250514210430.1064027-1-thomas.perale@mind.be>
Date: Thu, 15 May 2025 07:52:32 +0200
In-Reply-To: <20250514210430.1064027-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Wed, 14 May 2025 23:04:30 +0200")
Message-ID: <87wmais9nj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -105
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeltdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqhedmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeehteegheeuffffueeijeeuveejffdtffefgfetveduhfeigfeiteeltedtuedufeenucffohhmrghinhepnhhishhtrdhgohhvpdhgihhthhhusgdrtghomhdplhhisghrrgifrdhorhhgpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppeegiedrudelfedrjeekrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeeirdduleefrdejkedruddttddphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggvpdhrtghpthhtohepfhhonhhtrghinhgvrdhfrggsrhhitggvsehgmhgri
 hhlrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libraw: security bump to
 version 0.21.4
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following seucrity issues:

s/seucrity/security/

Committed with that fixed, thanks.



> - CVE-2025-43961: metadata/tiff.cpp has an out-of-bounds read in the
 >     Fujifilm 0xf00c tag parser.

 > For more information, see:
 >   - https://nvd.nist.gov/vuln/detail/CVE-2025-43961
 >   - https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2

 > - CVE-2025-43962: phase_one_correct in decoders/load_mfbacks.cpp has
 >     out-of-bounds reads for tag 0x412 processing

 > For more information, see:
 >   - https://nvd.nist.gov/vuln/detail/CVE-2025-43962
 >   - https://github.com/LibRaw/LibRaw/commit/66fe663e02a4dd610b4e832f5d9af326709336c2

 > - CVE-2025-43963: phase_one_correct in decoders/load_mfbacks.cpp allows
 >     out-of-buffer access

 > For more information, see:
 >   - https://nvd.nist.gov/vuln/detail/CVE-2025-43963
 >   - https://github.com/LibRaw/LibRaw/commit/be26e7639ecf8beb55f124ce780e99842de2e964

 > - CVE-2025-43964: tag 0x412 processing in phase_one_correct in
 >     decoders/load_mfbacks.cpp does not enforce minimum w0 and w1 values.

 > For more information, see:
 >   - https://nvd.nist.gov/vuln/detail/CVE-2025-43964
 >   - https://github.com/LibRaw/LibRaw/commit/a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0

 > For more details on the version bump, see the release notes:
 >   - https://github.com/LibRaw/LibRaw/releases/tag/0.21.4
 >   - https://github.com/LibRaw/LibRaw/releases/tag/0.21.3
 >   - https://github.com/LibRaw/LibRaw/compare/0.21.2...0.21.4

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  package/libraw/libraw.hash | 2 +-
 >  package/libraw/libraw.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
 > index 838c598d78..36d9d31948 100644
 > --- a/package/libraw/libraw.hash
 > +++ b/package/libraw/libraw.hash
 > @@ -1,5 +1,5 @@
 >  # Locally calculated
 > -sha256  fe7288013206854baf6e4417d0fb63ba4ed7227bf36fff021992671c2dd34b03  LibRaw-0.21.2.tar.gz
 > +sha256  6be43f19397e43214ff56aab056bf3ff4925ca14012ce5a1538a172406a09e63  LibRaw-0.21.4.tar.gz
 >  sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
 >  sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
 >  sha256  7d6650cef6cf892abe95e55a6bda1e1c42f221fd411b807deb2fc0b805b868d4  README.md
 > diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
 > index 211b67f935..e320b2d835 100644
 > --- a/package/libraw/libraw.mk
 > +++ b/package/libraw/libraw.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBRAW_VERSION = 0.21.2
 > +LIBRAW_VERSION = 0.21.4
 >  LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 >  LIBRAW_SITE = http://www.libraw.org/data
 >  LIBRAW_INSTALL_STAGING = YES
 > -- 

 > 2.49.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
