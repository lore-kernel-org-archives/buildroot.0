From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Mar 2018 23:41:44 +0100
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
In-Reply-To: <5a961c197f405_484fb72dfc147d@ultri3.mail>
References: <20180221221342.15683-5-thomas.petazzoni@bootlin.com>
 <5a961c197f405_484fb72dfc147d@ultri3.mail>
Message-ID: <20180307234144.69fc987b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Feb 2018 00:03:53 -0300, Ricardo Martincoski wrote:

> When running the script with a few packages it works well.
> But when running the script for all packages, for me it often hangs at the end
> (2 out of 5 tries).
> It can be related to my setup (python module versions?, internet connection?)
> But anyway see later in this email an alternative approach.

This could probably be solved by adding timeouts, but I find your
solution below interesting and useful.

> There is also an undocumented API:
> http://release-monitoring.org/api/projects/?distro=Buildroot
> It was implemented here:
> https://github.com/release-monitoring/anitya/commit/f3d8be75a6643b5d8c55754b74ed4f74f71fe952
> and will eventually be documented here:
> https://github.com/release-monitoring/anitya/issues/420
> 
> When the Buildroot distro becomes 90% filled we could get something like this:
> $ wget -O Alpine 'http://release-monitoring.org/api/projects/?distro=Alpine'
> ... 1MB, 15 seconds ...
> $ grep -c '"name"' Alpine
> 1838

Right, but it's going to take a while before we reach this :-)

> Also there is a field 'version' that looks to contain the latest version (or
> None if there is none). For the majority of projects it is exactly equal to
> 'versions'[0].
> See the test below, but I didn't find a documentation to corroborate this.

We can probably talk with the maintainers of release-monitoring.org
about this.

> As an alternative approach we could first download 2 lists:
> - all projects for distro (now 10, eventually 2000+)
> - all projects (now 16000+)
> It could even be saved to a file by one option and then loaded by other option
> to speedup the development/maintenance.

Yes, I'll do something like this: download both files to some
~/.release-monitoring-all-packages.cache and
~/.release-monitoring-buildroot-packages.cache, and use them if they
already exist. Then an option such as -r/--reload can force pkg-stats
to re-download the new version.

> But that would require:
> The projects in the Buildroot distro to be named exactly as the buildroot
> package, i.e. samba4, not samba.

Well, that is the whole point of "distros" on release-monitoring.org:
provide a mapping between the package name in the distribution and the
package name on release-monitoring.org.

The packages present in the "Buildroot" distro on
release-monitoring.org were added by me, often to fix a mismatch
between the Buildroot name and the release-monitoring.org name. samba4
(Buildroot) vs. samba (release-monitoring.org) is a good example.

> Or of course implementing the search by
> similarity with regexp.
> 
> And be aware: it produces few different guesses (some better, some worst).

I didn't understand this part. Why would the results be different ?

> > +    if pkg.latest_version[0]:
> > +        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">mapping</a>"
> > +    else:
> > +        latest_version_text += "has <a href=\"https://release-monitoring.org/distro/Buildroot/\">no mapping</a>"  
> 
> If you don't think it gets too ugly, you could invert the text, putting
> 'mapping'/'no mapping' as the first cell text. It should make sorting by this
> column to show all 'mapping' together and 'no mapping' together. I did not
> tested this.

I understand the point, but I find it a bit ugly that this information
appears first in this cell. One option is to make this a separate
column, but we already have a lot of columns. Can we handle that later
on ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
