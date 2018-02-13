From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 09:01:59 +0100
Subject: [Buildroot] [PATCH NEXT 1/1] Liblo - disable werror and link
 libatomic
In-Reply-To: <1518470275-10997-1-git-send-email-alexbaldwinmusic@gmail.com>
References: <1518470275-10997-1-git-send-email-alexbaldwinmusic@gmail.com>
Message-ID: <20180213090159.41243305@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for this updated patch! It looks better, but there are
still a few things that could be improved. Hopefully you won't get
annoyed by all those comments, and keep sending new iterations. See
below.

First, the commit title should always be:

	<package>: <description>

with <package> being the package name, in lower-case. So in your case:

	liblo: disable werror
	liblo: link with libatomic

(see below why two titles)

On Mon, 12 Feb 2018 22:17:55 +0100, Alex B wrote:
> From: Alex <alexbaldwinmusic@gmail.com>
> 
> This patch fixes 2 errors that were discovered by the autobuild:
> 
> 1) -werror is still present, which threw up errors regarding redirecting sys/poll.h
> to poll.h in the file server.c
> To fix this -werror has been disbled with a conf_opt and a patch applied to
> server.c that fixes the redirect.
> 
> 2) On some architectures libatomic must be linked. A conf_env has been added
> that links libatomic if it is present in the toolchain.

There are two separate issues, so this calls for two separate patches.

For each issue, we always add a reference to the autobuilder failure
being fixed, which has proven to be very useful when we get back to
such commits in the future, and wonder what the problem really was.
Something like:

===
Fixes:

  http://autobuild.buildroot.net/results/f0e47d43a2d49821ce2e16dff4ec9b3ef565bc6c/
===

is sufficient.

> diff --git a/package/liblo/0000-server.c-fixHeaderRedirects.patch b/package/liblo/0000-server.c-fixHeaderRedirects.patch
> new file mode 100644
> index 0000000..ae284d2
> --- /dev/null
> +++ b/package/liblo/0000-server.c-fixHeaderRedirects.patch

This patch should have a description and a Signed-off-by. Also, since
upstream uses Git, we like to have a Git formatted patch as well. So,
to create the patch:

 (1) Clone the upstream repository
     git clone https://github.com/radarsat1/liblo.git

 (2) Create a branch starting at the tag we're using in Buildroot
     git checkout -b build-fix 0.29

 (3) Do your changes

 (4) Commit

 (5) Generate the patch
     git format-patch HEAD^

> -# IPv6 support broken, issue known upstream
> -LIBLO_CONF_OPTS = --disable-ipv6
> +# IPv6 support broken, issue known upstream.

The addition of the final dot is not really necessary/related.

> +# wError - not needed for release.
> +LIBLO_CONF_OPTS += \
> +       --disable-ipv6 \
> +       --disable-werror

Do we need both the --disable-werror *and* the patch? Perhaps adding
--disable-werror is sufficient. The patch can however be submitted
upstream, so that the warning disappears when we update to a newer
upstream release.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
