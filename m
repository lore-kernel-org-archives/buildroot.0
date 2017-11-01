From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:58:23 +0100
Subject: [Buildroot] [PATCH v5 1/2] package/libssh2: Update to newest
 version
In-Reply-To: <1509472591-12650-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1509472591-12650-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20171101105823.6128ce6b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Oct 2017 12:56:30 -0500, Sam Voss wrote:
> Update libssh2 to use the newest version from git. This caused a
> transition from released version number to hash as it has not been
> version rev'd in over a year (see issue
> https://github.com/libssh2/libssh2/issues/220 for bump request).
> 
> This brings in changes to the autoconf to correctly pick the crypto
> library.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

I've applied, thanks! See a few comments/questions below.

> diff --git a/package/libssh2/0001-drop-custom-buildconf-script.patch b/package/libssh2/0001-drop-custom-buildconf-script.patch
> new file mode 100644
> index 0000000..a9a98e0
> --- /dev/null
> +++ b/package/libssh2/0001-drop-custom-buildconf-script.patch
> @@ -0,0 +1,121 @@
> +From 39a2a444a32896bd2dab37c9b247ccfd11ff4693 Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Mon, 30 Oct 2017 19:29:12 +0100
> +Subject: [PATCH] buildsystem: drop custom buildconf script, rely on autoreconf
> +
> +The buildconf script is currently required, because we need to copy a
> +header around, because it is used both from the library and the examples
> +sources.
> +
> +However, having a custom 'buildconf'-like script is not needed if we can
> +ensure that the header / exists by the time it is needed. For That, we
> +can just append the src/ directory to the headers search path for the
> +examples.
> +
> +And then it means we no longer need to generate the same header twice,
> +so we remove the second one from configure.ac.
> +
> +Now, we can just call "autoreconf -fi" to generate the autotools files,
> +instead of relying on the canned sequence in "buildconf", since
> +autoreconf has now long known what to do at the correct moment (future
> +versions of autotools, automake, autopoint, autoheader etc... may
> +require an other ordering, or other intermediate steps, etc...).
> +
> +Eventually, get rid of buildconf now it is no longer needed. In fact, we
> +really keep it for legacy, but have it just call autoreconf (and print a
> +nice user-friendly warning).
> +
> +Update gitignore accordingly, too.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Cc: Sam Voss <sam.voss@rockwellcollins.com>

Has this patch been submitted upstream?


> +# autoreconf must be ran when building off git, as it has not been ran at hash
> +LIBSSH2_AUTORECONF = YES

"it has not been ran at hash" doesn't make much sense. I've simplified
the whole comment to "building from a git clone".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
