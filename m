Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4497BC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 09:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9577360D6C;
	Sun, 18 May 2025 09:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laxuIo5VCKag; Sun, 18 May 2025 09:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FF4860D73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FF4860D73;
	Sun, 18 May 2025 09:27:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D5601BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DFB940757
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0cMqqz3g11o for <buildroot@buildroot.org>;
 Sun, 18 May 2025 09:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C94034073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C94034073A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C94034073A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 09:27:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BEBE431EA;
 Sun, 18 May 2025 09:27:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGaIo-00Gm2L-2U;
 Sun, 18 May 2025 11:27:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250425164925.314461-1-guillaume.chaye@zeetim.com>
Date: Sun, 18 May 2025 11:27:26 +0200
In-Reply-To: <20250425164925.314461-1-guillaume.chaye@zeetim.com> (Guillaume
 Chaye's message of "Fri, 25 Apr 2025 12:49:25 -0400")
Message-ID: <87a57aw9oh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkefhffehtdeiudektedvhefhfffftdeuhefgteduleeihfffffegveetleegudfhnecuffhomhgrihhnpegtuhhrlhdrshgvpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghhuihhllhgruhhmvgdrtghhrgihvgesiigvvghtihhmrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhop
 ehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCHv2 1/1] support/download/dl-wrapper: add
 basic support for smb file download using curl
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

>>>>> "Guillaume" == Guillaume Chaye <guillaume.chaye@zeetim.com> writes:

 > It allows to download files from smb share in buildroot packages.
 > Usage is specified in manual.

 > Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>

Committed after reworking the documentation a bit, thanks.

> ---
 >  docs/manual/adding-packages-generic.adoc | 7 +++++++
 >  package/pkg-generic.mk                   | 2 +-
 >  support/download/dl-wrapper              | 2 +-
 >  3 files changed, 9 insertions(+), 2 deletions(-)

 > diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
 > index 7e2e066c16..881beab6e1 100644
 > --- a/docs/manual/adding-packages-generic.adoc
 > +++ b/docs/manual/adding-packages-generic.adoc
 > @@ -337,6 +337,13 @@ not and can not work as people would expect it should:
 >       for +local+ packages, no patches are applied. If you need to
 >       still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
 >       xref:hooks-rsync[].
 > +  ** +smb+ for retrieving source code from SMB share. Used by default
 > +     when +LIBFOO_SITE+ begins with +smb://+.
 > +	 It uses +curl+ as download backend.
 > +	 Syntax expected: +LIBFOO_SITE=smb://<server>/<share>/<path>+.
 > +	 This method might require to define -u option in +LIBFOO_DL_OPTS+
 > +	 For more informations, please refer to the curl documentation in
 > +	 +https://curl.se/docs/tutorial.html+
 
 >  * +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
 >    with the git submodules in the repository.  This is only available
 > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
 > index f22b6e981a..95ff9135bd 100644
 > --- a/package/pkg-generic.mk
 > +++ b/package/pkg-generic.mk
 > @@ -1260,7 +1260,7 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 >  DL_TOOLS_DEPENDENCIES += hg
 >  else ifeq ($$($(2)_SITE_METHOD),cvs)
 >  DL_TOOLS_DEPENDENCIES += cvs
 > -else ifneq ($(filter ftp ftps,$$($(2)_SITE_METHOD)),)
 > +else ifneq ($(filter ftp ftps smb,$$($(2)_SITE_METHOD)),)
 >  DL_TOOLS_DEPENDENCIES += curl
 >  endif # SITE_METHOD
 
 > diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
 > index 5445aad5a7..b70c8edbd9 100755
 > --- a/support/download/dl-wrapper
 > +++ b/support/download/dl-wrapper
 > @@ -96,7 +96,7 @@ main() {
 >          backend="${backend_urlencode%|*}"
 >          case "${backend}" in
 >              git|svn|cvs|bzr|file|scp|hg|sftp) ;;
 > -            ftp|ftps) backend="curl" ;;
 > +            ftp|ftps|smb) backend="curl" ;;
 >              *) backend="wget" ;;
 >          esac
 >          uri=${uri#*+}
 > -- 

 > 2.39.5

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
