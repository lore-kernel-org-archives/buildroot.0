Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A3DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 16:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B926E6124E;
	Wed, 30 Mar 2022 16:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzcHevpyRg9y; Wed, 30 Mar 2022 16:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0CFD6124A;
	Wed, 30 Mar 2022 16:32:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF4801BF341
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 16:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAD3E404AF
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 16:32:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ooDmuIFum-N for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 16:32:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B2354015D
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 16:32:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C32E2000E;
 Wed, 30 Mar 2022 16:32:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZbFP-0005Uy-E8; Wed, 30 Mar 2022 18:32:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220327202415.1248312-1-Jason@zx2c4.com>
 <20220329050401.110856-1-Jason@zx2c4.com>
Date: Wed, 30 Mar 2022 18:32:39 +0200
In-Reply-To: <20220329050401.110856-1-Jason@zx2c4.com> (Jason A. Donenfeld's
 message of "Tue, 29 Mar 2022 01:04:01 -0400")
Message-ID: <871qyj8kpk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

Hi,

 > The RNG can't actually be seeded from a shell script, due to the
 > reliance on ioctls. For this reason, the seedrng project provides a
 > basic script meant to be copy and pasted into projects like buildroot
 > and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.

 > This commit imports it into buildroot and wires up the init scripts to
 > call it. This also is a significant improvement over the current init
 > script, which doesn't credit entropy and whose hashing in shell scripts
 > is sort of fragile.

 > As seedrng.c is a short tiny C program, we include this here in the
 > package, like a few other packages do. Later we'll investigate adding
 > this to busybox, but for now, this is a good start and a positive step
 > in the right direction.

As discussed on IRC, I think it would be nicer to just add a normal
seedrng package and depend on that from urandom-scripts, so the standard
version/license info/.. stuff works. I can do that change if needed.

You mentioned something on IRC about this containing differences from
what it is seedrng.git. Those changes/fixes are presumably not specific
to Buildroot, will you add those changes to the git repo as well?


 > +# The following knobs can be adjusted by placing uncommented modified lines
 > +# into /etc/default/urandom:
 > +#
 > +# Set these to change where the seed and runtime lock file are stored:
 > +#
 > +#     export SEEDRNG_SEED_DIR=/var/lib/seedrng
 > +#     export SEEDRNG_LOCK_FILE=/var/run/seedrng.lock
 > +#

Will you add the logic for these features to seedrng.git? If not, then I
don't think we should have them here either. A bunch of other code already
expects "normal" locations, so people generally have to handle such
customizations by symlinks in their rootfs(-overlay).

If this customization is left in, then it should ideally use the
existing (directory part of) URANDOM_SEED, which used to be how the
location could be customized for backwards compatibility.


 >  case "$1" in
 >  	start|restart|reload)
 >  		# Carry a random seed from start-up to start-up
 >  		# Load and then save the whole entropy pool
 > -		init_rng && save_random_seed;;
 > +		# Never fail, as this isn't worth making a fuss
 > +		# over if it doesn't go as planned.
 > +		seedrng || true;;
 >  	stop)
 >  		# Carry a random seed from shut-down to start-up
 >  		# Save the whole entropy pool
 > -		save_random_seed;;
 > +		seedrng;;

Nice and short! The comments above are not really correct any more, as
the stop logic also loads.


 > +++ b/package/urandom-scripts/seedrng.c
..

 > +#define le32_to_cpup(a) le32toh(*(a))
 > +#define cpu_to_le32(a) htole32(a)

What is the purpose of the to/from le32 stuff in this use case?

 > +
 > +	fprintf(stdout, "Saving %zu bits of %s seed for next boot\n", new_seed_len * 8, new_seed_creditable ? "creditable" : "non-creditable");
 > +	fd = open(NON_CREDITABLE_SEED, O_WRONLY | O_CREAT | O_TRUNC, 0400);

The 0400 confused me a bit, as that would normally cause the open to
fail when the file exists, but it happens to work as you unlink above /
use the lock file.


> +	if (fd < 0) {
 > +		fprintf(stderr, "ERROR: Unable to open seed file for writing: %s\n", strerror(errno));
 > +		program_ret |= 1 << 4;
 > +		goto out;
 > +	}
 > +	if (write(fd, new_seed, new_seed_len) != (ssize_t)new_seed_len || fsync(fd) < 0) {
 > +		fprintf(stderr, "ERROR: Unable to write seed file: %s\n", strerror(errno));
 > +		program_ret |= 1 << 5;
 > +		goto out;
 > +	}
 > +	if (new_seed_creditable && rename(NON_CREDITABLE_SEED, CREDITABLE_SEED) < 0) {
 > +		fprintf(stderr, "WARNING: Unable to make new seed creditable: %s\n", strerror(errno));
 > +		program_ret |= 1 << 6;
 > +	}
 > +out:
 > +	if (fd >= 0)
 > +		close(fd);
 > +	if (lock >= 0)
 > +		close(lock);

No fsync of the directory like you do in seed_from_file_if_exists()?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
