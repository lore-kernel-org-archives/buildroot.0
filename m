From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Thu, 3 Jan 2019 15:02:24 -0600
Subject: [Buildroot] [External] Re: [PATCH v5]
 support/scripts/pkg-stats: add latest upstream version information
In-Reply-To: <20190103213316.637c464b@windsurf>
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
 <CA+fik52n+izpqRGSSP1QFMoPCCd1y0Mub714-1cHWFYotXuhNg@mail.gmail.com>
 <20190103213316.637c464b@windsurf>
Message-ID: <CA+fik51_toDs8PPL6wk8OZDNVTAkBb5a5CkuaPzk6JjnPDvzyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

:

On Thu, Jan 3, 2019 at 2:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Brandon,
>
> Thanks for the feedback.
>
> On Thu, 3 Jan 2019 13:57:46 -0600, Brandon Maier wrote:
>
> > From https://urldefense.proofpoint.com/v2/url?u=https-3A__bootlin.com_-7Ethomas_stats.html&d=DwICAg&c=ilBQI1lupc9Y65XwNblLtw&r=bIwUnEkCqKFQQ0RVQaaY0gBWY7SIAhmiWLyMS82_mSU&m=BLGQQMtjdYeO462A3rnKjL7GVl8jKWnqncRGOzwJuc8&s=nJR7ACo6ote42lIcGZ0XW87x_SqYCdyi5OdeloYNqu4&e=, there's a few packages
> > that are up-to-date, but get marked "version-needs-update" because
> > either the Buildroot or release-monitoring version string starts with
> > a "v". For example, the vmtouch and libmodbus packages. It would be
> > nice to change the version comparison to ignore a leading "v". E.g.
> >
> > def version_uptodate(pkg):
> >     latest = remove_prefix(pkg.latest_version[1], 'v')
> >     current = remove_prefix(pkg.current_version, 'v')
> >     return latest == current
>
> I'm aware of this problem, but I'm not sure we should handle this with
> a hack in the pkg-stats script itself. Indeed sometimes the version
> prefix is just "v", but sometimes it's the entire name of the package,
> sometimes something slightly different.

Agreed it's not a pretty hack. I wouldn't want to handle the other
oddities in here, as that would get messy. I suggested it for "v" only
because it seems to be very common. It would be a way to get us most
of the way there, then it could be reverted if e.g. all the github
versions are fixed up.

On those other packages though, perhaps adding an optional variable to
package mk files for custom versions? E.g. package/libnfs/libnfs.mk
defines version as "libnfs-3.0.0", but the r-m version is "3.0.0".
E.g.

package/libnfs/libnfs.mk:
  LIBNFS_RM_VERSION = 3.0.0
  LIBNFS_VERSION = libnfs-$(LIBNFS_RM_VERSION)

>
> Back when I initially started working on this script, I had a series
> that changed all the packages that used vX.Y.Z as a version to use just
> X.Y.Z, and similarly for other packages in similar but slightly
> different situations. I found (with some effort) the old branch I had
> with those changes:
>
>   https://urldefense.proofpoint.com/v2/url?u=https-3A__git.bootlin.com_users_thomas-2Dpetazzoni_buildroot_log_-3Fh-3Dfix-2Dversions&d=DwICAg&c=ilBQI1lupc9Y65XwNblLtw&r=bIwUnEkCqKFQQ0RVQaaY0gBWY7SIAhmiWLyMS82_mSU&m=BLGQQMtjdYeO462A3rnKjL7GVl8jKWnqncRGOzwJuc8&s=YcscSq6riQ_8BeiMfo3XUuVEigc3adPnIJrOJn7hl3w&e=
>
> It seems like I never posted them. I thought there was some discussion
> on the list about this issue, but I can't find it. Perhaps I should
> update this series, submit it for good, and see what the feedback is ?

Regardless of this patch series, this sounds like a good idea to me.
Especially considering Anitya does this too, as Yann mentioned[1].

[1] https://github.com/release-monitoring/anitya/issues/374

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://urldefense.proofpoint.com/v2/url?u=https-3A__bootlin.com&d=DwICAg&c=ilBQI1lupc9Y65XwNblLtw&r=bIwUnEkCqKFQQ0RVQaaY0gBWY7SIAhmiWLyMS82_mSU&m=BLGQQMtjdYeO462A3rnKjL7GVl8jKWnqncRGOzwJuc8&s=Pqp_noteyWtmSPPMYtHFZwlZbRE-a5HRmBWfPJcGDV0&e=
