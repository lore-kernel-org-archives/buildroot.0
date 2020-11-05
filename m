From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Nov 2020 18:01:06 +0100
Subject: [Buildroot] [PATCH 08/10] support/script/pkg-stats: show CPE ID
 in results
In-Reply-To: <CANQCQpbN8-SXF8T4bxdn+JnyYrHSzpQy8J2ZzByCZ=yp_gtZNQ@mail.gmail.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-9-thomas.petazzoni@bootlin.com>
 <CANQCQpbN8-SXF8T4bxdn+JnyYrHSzpQy8J2ZzByCZ=yp_gtZNQ@mail.gmail.com>
Message-ID: <20201105180106.1c88c656@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Nov 2020 11:18:50 -0600
Matthew Weber <matthew.weber@rockwellcollins.com> wrote:

> > +        elif pkgvar.endswith("_CPE_ID"):
> > +            pkgvar = pkgvar[:-7]
> > +            Package.all_cpeids[pkgvar] = value  
> 
> I haven't dug that deep yet in the script, but would this populate
> host and target CPE ID values?  I know the Infrastructure does note
> host/target so there is probably enough information to conditionally
> pull the value.

pkg-stats doesn't have a notion of a package being a host or a target
package. It knows only about packages, be they target, host, or both.

Also, the CPE_ID values are automatically filled in for the host
variant of the package by deriving the one of the corresponding target
package. This is explained in PATCH 03/10 commit log, which states:

"""
The <pkg>_CPE_ID_* values for the host package are inherited from the
same variables of the corresponding target package, as we normally do
for most package variables.
"""

So, if you set any of the <pkg>_CPE_ID_* variables, or
<pkg>_CPE_ID_VALID = YES, then it will apply to both the target and
host package, unless of course you override HOST_<pkg>_CPE_ID_* for
some reason.

Does this help ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
