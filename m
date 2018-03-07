From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Mar 2018 21:45:21 +0100
Subject: [Buildroot] [PATCH 1/2] spport/check-bin-arch: accept arbitrary
 ignore paths
In-Reply-To: <8a08e5fbfab7e4d021565077544576ad495c8097.1520454419.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 7 Mar 2018 21:27:18 +0100")
References: <cover.1520454419.git.yann.morin.1998@free.fr>
 <8a08e5fbfab7e4d021565077544576ad495c8097.1520454419.git.yann.morin.1998@free.fr>
Message-ID: <87a7vjobry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some packages (mostly, out-of-tree) may want to install binary blobs for
 > another architecture,  outside the locations we currently exclude, like
 > in /opt or whatever...

 > Add support in check-bin-arch to accept any arbitrary location, that
 > individual package can each request to excude from the check, when they
 > are installed.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  docs/manual/adding-packages-generic.txt |  7 ++++
 >  package/pkg-generic.mk                  |  1 +
 >  support/scripts/check-bin-arch          | 58 ++++++++++++++++++++-------------
 >  3 files changed, 44 insertions(+), 22 deletions(-)

 > diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
 > index 63ea51bf89..1f5d92d2c9 100644
 > --- a/docs/manual/adding-packages-generic.txt
 > +++ b/docs/manual/adding-packages-generic.txt
 > @@ -453,6 +453,13 @@ information is (assuming the package name is +libfoo+) :
 >    FLAT binary format is only 4k bytes. If the application consumes more stack,
 >    append the required number here.
 
 > +* +LIBFOO_BIN_ARCH_EXCLUDE+ is a space-separated list of path (relative

s/path/paths/

> +  to the target directory) to ignore when checking that the package
 > +  installs correctly cross-compiled binaries. You seldom need to set this
 > +  variable, unless the package installs installs binary blobs in the

s/installs installs/installs/

 > +  non-default locations: `/lib/firmware`, `/usr/lib/firmware`,
 > +  `/lib/modules`, and `/usr/share`.

This sounds a bit confusing to me, E.G. like these are non default
locations.

Perhaps we should instead write:

variable, unless the package installs binary blobs outside the default
locations, which are `/lib/firmware`, `/usr/lib/firmware`,
`/lib/modules` and '/usr/share`, as these locations are automatically
excluded.


 >  if test -z "${package}" -o -z "${pkg_list}" -o -z "${readelf}" -o -z "${arch_name}" ; then
 > -	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name>"
 > +	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name> [-i PATTERN ...]"

We don't really document this as a pattern (even if it gets passed to ~=
in the end), so perhaps it would be clearer to say [ -i PATH ]?

Otherwise it looks good to me, thanks!

-- 
Bye, Peter Korsgaard
