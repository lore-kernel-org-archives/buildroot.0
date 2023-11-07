Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2834BC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 13:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7DFD402A7;
	Tue,  7 Nov 2023 13:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7DFD402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLU1vKLKPmjE; Tue,  7 Nov 2023 13:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E457402E6;
	Tue,  7 Nov 2023 13:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E457402E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6317D1BF95D
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49E7E40128
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E7E40128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGBD9s7wktuO for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 13:30:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9316D4026D
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 13:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9316D4026D
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAA7420012;
 Tue,  7 Nov 2023 13:29:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0M9W-00HG1a-08;
 Tue, 07 Nov 2023 14:29:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231107124439.4105974-1-peter@korsgaard.com>
Date: Tue, 07 Nov 2023 14:29:58 +0100
In-Reply-To: <20231107124439.4105974-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 7 Nov 2023 13:44:38 +0100")
Message-ID: <87wmutwv1l.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] utils/add-custom-hashes: add script to
 manage global patch dir hashes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add a script to manage the .hash files in the BR2_GLOBAL_PATCH_DIR for
 > packages using custom versions.

 > To use it, run in a configured Buildroot directory, E.G.

 >   make foo_defconfig; ./utils/add-custom-hashes

 > We support multiple patch directories in BR2_GLOBAL_PATCH_DIR.  If multiple
 > directories are specified then use the last one as that is likely to be the
 > most specific one.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  docs/manual/customize-patches.adoc |   2 +
 >  utils/add-custom-hashes            | 103 +++++++++++++++++++++++++++++
 >  2 files changed, 105 insertions(+)
 >  create mode 100755 utils/add-custom-hashes

 > diff --git a/docs/manual/customize-patches.adoc b/docs/manual/customize-patches.adoc
 > index 72e87c3c04..f33bbcdde7 100644
 > --- a/docs/manual/customize-patches.adoc
 > +++ b/docs/manual/customize-patches.adoc
 > @@ -79,3 +79,5 @@ the first file to exist is used to check a package download:
 
 >  * +<global-patch-dir>/<packagename>/<packageversion>/<packagename>.hash+
 >  * +<global-patch-dir>/<packagename>/<packagename>.hash+
 > +
 > +The +utils/add-custom-hashes+ script can be used to generate these files.
 > diff --git a/utils/add-custom-hashes b/utils/add-custom-hashes
 > new file mode 100755
 > index 0000000000..857ca3dd4c
 > --- /dev/null
 > +++ b/utils/add-custom-hashes
 > @@ -0,0 +1,103 @@
 > +#!/usr/bin/env bash
 > +set -e
 > +
 > +# Add hash files for packages with custom versions for
 > +# BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 > +#
 > +# Run in a configured Buildroot directory, E.G.
 > +# make foo_defconfig; ./utils/add-custom-hashes
 > +
 > +# print BR-style message
 > +# message <info message>
 > +message() {
 > +    tput smso 2>/dev/null
 > +    echo "$*"
 > +    tput rmso 2>/dev/null
 > +}
 > +
 > +# print error message and exit
 > +# die <error message>
 > +die() {
 > +    echo "Error: $*" >&2
 > +    exit 1
 > +}
 > +
 > +# get package(s) for download file, if any
 > +# get_pkgs <json> <file>
 > +get_pkgs() {
 > +    jq --arg file "$2" -r \
 > +       'to_entries[] | select(.value.downloads[0].source == $file) | .key | strings' "$1"
 > +}
 > +
 > +# get download dir for package
 > +# get_pkg_dl_dir <json> <package>
 > +get_pkg_dl_dir() {
 > +    jq --arg pkg "$2" -r '.[$pkg].dl_dir | strings' "$1"
 > +}
 > +
 > +# generate hash file for download file
 > +# gen_hash <dir> <file>
 > +gen_hash() {
 > +    (
 > +        cd "$1" && printf '# Locally calculated\nsha256  ' && sha256sum "$2"
 > +    )
 > +}
 > +
 > +command -v jq || die 'Script needs jq'

Ups, this was a last minute addition, the stdout of command -v should be
redirected to /dev/null.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
