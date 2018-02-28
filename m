From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Feb 2018 07:38:27 +0100
Subject: [Buildroot] [NEXT 06/26] boa: add CPE id
In-Reply-To: <CANQCQpbM3VHid2rGTFAA=HwkhsUfmHRbGw9EDtT2dPUWwQRDog@mail.gmail.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227231718.090c22ef@windsurf.lan>
 <CANQCQpbM3VHid2rGTFAA=HwkhsUfmHRbGw9EDtT2dPUWwQRDog@mail.gmail.com>
Message-ID: <20180228073827.312a9a6f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Feb 2018 22:00:31 -0600, Matthew Weber wrote:

> > LIBZLIB_CPE_ID_VENDOR = gnu
> > LIBZLIB_CPE_ID_NAME = zlib
> >  
> 
> Where it gets difficult is when a package has multiple CPEs so that
> you catch all possible combinations that could be relevant for the
> package.  Eventually there shouldn't be multiple once the dictionary
> at NIST is cleaned up......

Well, my proposal contained:

$(2)_CPE_ID ?= $($(2)_CPE_ID_VENDOR):$($(2)_CPE_ID_NAME):$($(2)_CPE_ID_VERSION)

Notice the ?=, which still allows a given package to override its
<pkg>_CPE_ID value entirely, potentially with a list of multiple values.

> One thing I didn't think about with the multiple CPEs is the logic to
> detect if a CPE needs updating in the CPE dictionary.  We'd have to
> look at all possible CPE id options to see if any match.  This may
> lead to us wanting to push to update the primary CPE ID sooner then
> later and align all our packages to use it instead of supporting
> multiple.  Then we could use the logic of having all packages set the
> LIBZLIB_CPE_ID_VENDOR and key off that to know we report that packages
> info.

I am not sure what is the story being multiple CPE IDs. Is it the NIST
database having two entries for what is essentially the same upstream
software ? If that's the case, then it really is a bug in the NIST
database, which should rather be fixed in the database rather than
worked around on our side by supporting CPE IDs, no ?

Of course, fixing the NIST database is the ideal situation, but it is
only reasonable if the NIST people are interested in fixing those
issues in a timely fashion. If they are not, then I'd say it's fine to
support multiple CPE IDs in Buildroot for the time being.

> > The drawback is obviously that all packages will suddenly have a
> > <pkg>_CPE_ID value, even if this value may potentially be incorrect
> > because it hasn't been checked. And this may be a real problem, so
> > probably your solution is better, I just wanted to point out the
> > (admittedly limited) duplication.  
> 
> Yeah, eventually I'd argue we could revert back to infra logic and
> clean it all up once there is a baseline or majority of packages with
> valid CPE IDs.    However for now, I default those we don't have to
> unknown so it's clear for a developer to go research or request a new
> CPE.

Yes, that is a possibility. As I said, I do realize that my proposal
has the significant drawback of not allowing to identify clearly which
package has a correct CPE_ID (voluntarily added by a developer) vs.
some potentially random CPE_ID (set by default by the package
infrastructure).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
