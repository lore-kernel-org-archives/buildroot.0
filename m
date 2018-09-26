From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Wed, 26 Sep 2018 08:45:51 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Your
 build results for 2018-09-25
In-Reply-To: <20180926060016.AC795208A1@mail.bootlin.com>
References: <20180926060016.AC795208A1@mail.bootlin.com>
Message-ID: <7a3cab5670dacc1c6582623249e3cb284f9e4456.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Fabrice, all

On Wed, 2018-09-26 at 08:00 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2018-09-25, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your architectures:

[snip]

>          arc | package/glibc/glibc.mk:134:... | 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_c02ca1b3dd40d4f6913d8018d7dee92d63ff24c8&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=_10wrzVQHZ12Nbsw-A2EpVFHkZ_3yKI3PTC9Vj5P--k&s=ur517K8d54WBW2VvYY-CZM15C8p_fiSRoLj9OnE-SVI&e=

That happens because of https://git.buildroot.org/buildroot/commit/package/glibc/glibc.hash?id=37492e8b2d89b8e992a89f1ef6bda6afeb14433b
which accommodates LICENSES file change in glibc 2.28.

I mean glibc was bumped to 2.28 in Buildroot but since for ARC glibc comes
from not-yet accepted fork on GitHub from a tag that was not changed
essentially LICENSES file remains the same.

What we may do about that:
 1. Use patch with ARC port of glibc instead of full tarball.
    This is nice because:
      a) Whenever glibc version is updated within 2.28 stable series
         ARC's toolchain gets all the upstream fixes
      b) No ARC peculiarities in package/glibc/glibc.mk
    Downsides are:
      a) At some point patch might not apply if upstream change clashes with
         contents of the patch. This IMHO is not very likely but still possible
         as our port touches some generic glibc code as well.
      b) Maintenance of ARC bits will be a bit more complicated but that's
         my pain so nobody should care :)

 2. Create new tag with rebased glibc on our GitHub and update GLIBC_VERSION in Buildroot

 3. Somehow accommodate 2 possible LICENSES files in package/glibc/glibc.hash

Any thoughts?

-Alexey
