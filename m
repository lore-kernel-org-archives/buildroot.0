From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Feb 2020 10:46:00 +0100
Subject: [Buildroot] CVEs not matching buildroot packages
In-Reply-To: <e9268b49623925add8aeac91e8059012@walle.cc>
References: <e9268b49623925add8aeac91e8059012@walle.cc>
Message-ID: <20200225104600.0f295783@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Thanks for pushing this conversation further, we definitely want to
make progress on this topic.

On Tue, 25 Feb 2020 09:58:27 +0100
Michael Walle <michael@walle.cc> wrote:

> Yesterday, Heiko noticed that CVE-2020-8597 doesn't match the
> pppd package, because the product name doesn't match the package
> name.

Indeed. This was a known limitation when we did the initial work on the
CVE checking as part of pkg-stats during the Buildroot Developers
meeting.

> So apparently there need to be a mapping between these two. But
> that comes with some caveats. Let's assume there would be a
> pkg_NVD_CPE variable.

Nit: the NVD database uses the concept of "vendor" and "product" names.
So either we have a single variable like <pkg>_CPE_ID that looks like
CPE IDs:

LINUX_CPE_ID = cpe:2.3:o:linux:linux_kernel:*:*:*:*:*:*:*:*

Or we have separate variables for the vendor and product names:

LINUX_CPE_VENDOR = linux
LINUX_CPE_PRODUCT = linux_kernel

> One could think of having a default value
> of this variable, eg by default "pkg_NVD_CPE = pkg". [This is,
> as far as I understand it, the current behaviour, because there
> is no mapping right now; correct me if I'm wrong].

You're correct.

> BUT in my optinion there MUST NOT be a default value for this mapping,
> because then you cannot distiguish between a package which just
> uses the default name and a package which wasn't ever touched
> regarding CVEs. And this is really bad for statistics, eg you
> can't even say we have this many packages checked for CVEs,
> because you don't know which packages actually has a correct
> mapping.

Yes. With the release-monitoring.org matching, we are able to know if
the match was found thanks to an explicit mapping of the Buildroot
distribution, or if it was found by "luck". That's the difference
between "found by distro" and "found by guess" in
http://autobuild.buildroot.net/stats/.

> So if a pkg_NVD_CPE variable is introduced this would need to
> done manually per package; which would mean a lot of work. Of
> course there could be some scripts which check if there was ever
> a CVE for package x and x is a buildroot package. That would be
> a strong indication that this is a correct mapping. There could
> also be a checkpackage script which checks if pkg has no
> pkg_NVD_CPE variable, but there is a CVE for that package name.

On the other hand, as explained above, the CPE information is not just
a package name, it's also a vendor name. So in practice the default of
using the package name doesn't really work.

> Then a statistics script could gather:
>    (1) how many packages don't have a mapping, eg. the CVE status
>        is unknown. [package has no pkg_NVD_CPE]
>    (2) how many packages are not affected by a CVE [package has
>        pkg_NVD_CPE and doesn't match any CVEs]
>    (3) how many packages are affected by a CVE [package has
>        pkg_NVD_CPE and doesn't match any CVEs]

This last sentence should have been "and match some CVEs"

> To minimize efforts in the beginning (1) could be split into
>   (1a) how many packages don't have a mapping and no CVE matches
>        the package name, therefore the status is still unknown
>        [package has no pkg_NVD_CPE and there is no CVE matching
>        the package name]
>   (1b) how many packages don't have a mapping but there is a CVE
>        matching the package name. Thus there is a high chance
>        this package is actually affected by this CVE, but this
>        is just a strong indication and would need further manual
>        steps, eg. adding pkg_NVE_CPE to the package .mk.
> 
> So packages could incrementally moved from (1a) to (1b).
> 
> Any comments? ;)

One question is how will you distinguish packages that don't have any
CPE information because no CVE has ever been reported and therefore we
don't know which CPE vendor/product IDs will be used, and packages that
don't have CPE information because nobody has done the work of checking
the NVD database and adding the mapping.

Indeed, in our 2500+ packages, I'm pretty sure a significant number of
them never had any CVE, and therefore we have no idea what their CPE ID
would be.

Any idea on this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
