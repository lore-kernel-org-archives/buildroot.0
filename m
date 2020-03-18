From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 15:12:56 +0100
Subject: [Buildroot] CVEs not matching buildroot packages
In-Reply-To: <CAEyMn7bDcNOW4ty0sPgOg4WexfZ+uR+HoRvR3M+e-ObrWYKJJA@mail.gmail.com>
References: <e9268b49623925add8aeac91e8059012@walle.cc>
 <20200225104600.0f295783@windsurf>
 <83c7598984b7c6eb22cc5a5bb11af4fc@walle.cc>
 <20200225112943.0a2dd6e6@windsurf>
 <11370f3cd0ea3d53ee8002c59dc600a9@walle.cc>
 <CAEyMn7bDcNOW4ty0sPgOg4WexfZ+uR+HoRvR3M+e-ObrWYKJJA@mail.gmail.com>
Message-ID: <20200318151256.2c7e9c11@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Mar 2020 14:57:27 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Just to go on with this I did a proof of concept for the CVE mapping.
> 
> A first version can be found here:
> https://github.com/hthiery/buildroot/tree/feature-cve-map
> 
> What this change does:
> Add a new file format for the CVE mapping: <pkg>.cve. This is done in
> YAML format. In this file at least the fields vendor and product has
> to be defined. With this we can create a map from the CVE to the
> buildroot package name.
> Now we can decide the following:
> 1) the package has a mapping and is affected by a CVE  (RED ZONE)
> 2) the package has a mapping and a CVE is found but fixed (GREEN ZONE)
> 3) the package has a mapping and no CVE is found (GREEN ZONE)
> 4) the package has no mapping and it is affected by CVE found by guess
> (try to compare buildroot name vs. CVE product name value) (YELLOW
> ZONE)
> 5) the package has no mapping and no CVE is found  (we don't konw if
> there isn't a CVE or we have no match because the buildroot name does
> not match the CVE product name) (GREY ZONE)
> 
> Here is an example of a yaml file: package/pppd/ppd.cve
> --- snip ---
> vendor: point-to-point_protocol_project
> product: point-to-point_protocol
> 
> cves:
>   CVE-2020-8597:
>     patch: 0001-pppd-Fix-bounds-check.patch
> 
> --- snip ---
> 
> To take the decision if a CVE is fixed there could be more possible
> reasons instead of the patch in the example above. I can image
> something like 'does-not-apply'.
> 
> I think the effort to have an extra file is not so much and it will
> not pollute the Makefile with variables that are not build related.
> For checking the YAML syntax an extra pkg-check can be implemented.
> 
> As mentioned at the beginning this is first idea how a mapping could
> look. What do you think?

I'll give my very quick and probably very blunt and brutal feedback: I
don't like having another file with package metadata. This metadata
should be in the .mk file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
