From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 01 Sep 2016 01:59:03 +0200
Subject: [Buildroot] [PATCH v2] package/libshout: add patches to fix
	static linking
In-Reply-To: <871t14y3qx.fsf@dell.be.48ers.dk>
References: <20160831202607.24374-1-joerg.krause@embedded.rocks>
 <871t14y3qx.fsf@dell.be.48ers.dk>
Message-ID: <1472687943.30005.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Do, 2016-09-01 at 00:26 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> ?> This series includes two patches to fix static linking with
> libshout.
> ?> The first patch fixes two typos resulting in an uninterpretable
> library
> ?> propagation and is mainly needed for the follow-up patch.
> 
> ?> The second patch makes sure that `@SHOUT_REQUIRES@` and therefore
> ?> `Requires.private` includes ssl as `Requires.private` defines a
> list of private
> ?> packages required by this package but not exposed to applications.
> 
> ?> Note that autoreconf is enabled as the first patch touches
> configure.ac.
> 
> ?> Fixes:
> ?> http://autobuild.buildroot.net/results/b82/b82408fccbf816575125dcc
> 1a1de7260f66f62e8/
> ?> http://autobuild.buildroot.net/results/360/3605750023267e4cd35d984
> 51bd283f9e70a6106/
> ?> http://autobuild.buildroot.net/results/03b/03b98b313dd6ed2909607cd
> c0c4f6fb87be3ccfe/
> ?> http://autobuild.buildroot.net/results/70b/70ba47e04d1fc0d2379bf1a
> c7aab4c52d6193001/
> 
> ?> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ?> ---
> ?> v2:
> ?>??* Replace patch #2 to make sure `Requires.private` contains ssl
> if needed
> ?>????(suggested by Thomas)
> 
> ?> +Since OpenSSL installs its own .pc files, make sure that
> @SHOUT_REQUIRES@
> ?> +contains `ssl`.
> ?> +
> ?> +Upstream status: pending
> ?> +https://github.com/xiph/Icecast-libshout/pull/5
> ?> +
> ?> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ?> +---
> ?> + configure.ac | 4 ++++
> ?> + 1 file changed, 4 insertions(+)
> ?> +
> ?> +diff --git a/configure.ac b/configure.ac
> ?> +index 85f18ad..2b9c505 100644
> ?> +--- a/configure.ac
> ?> ++++ b/configure.ac
> ?> +@@ -197,6 +197,10 @@ XIPH_PATH_OPENSSL([
> ?> +?????])
> ?> + AC_SUBST([SHOUT_TLS])
> ?> + AM_CONDITIONAL([HAVE_TLS], [test -n "$OPENSSL_LIBS"])
> ?> ++if test "$SHOUT_TLS" = "1"
> ?> ++then
> ?> ++??SHOUT_REQUIRES="$SHOUT_REQUIRES, ssl"
> 
> Did you test this?
> 
> The libssl .pc file is called libssl.pc, not ssl.pc, so this doesn't
> work.

Sorry for that! You're right! I did tested for compilation, which ends
without errors, however, mpd does not find libshout and therefore does
not link with it. Thanks for catching this!

> > 
> > diff --git a/package/libshout/libshout.mk
> > b/package/libshout/libshout.mk
> ?> index 029c134..9f54463 100644
> ?> --- a/package/libshout/libshout.mk
> ?> +++ b/package/libshout/libshout.mk
> ?> @@ -11,6 +11,9 @@ LIBSHOUT_LICENSE_FILES = COPYING
> ?>??LIBSHOUT_INSTALL_STAGING = YES
> ?>??LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
> ?
> ?> +# patching congigure.ac
> 
> typo.
> 
> What is odd about this fix / autobuilder issues is:
> 
> - libshout has no (optional) dependency on openssl
> - mpd has no (optional) dependency on libshout
> 
> So that's pretty bad. I've pushed 2 commits to fix this.
> 
> Committed after fixing the above, thanks.
> 
