From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2019 21:38:37 +0100
Subject: [Buildroot] [PATCH v5] support/scripts/pkg-stats: add latest
 upstream version information
In-Reply-To: <CA+fik52n+izpqRGSSP1QFMoPCCd1y0Mub714-1cHWFYotXuhNg@mail.gmail.com>
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
 <CA+fik52n+izpqRGSSP1QFMoPCCd1y0Mub714-1cHWFYotXuhNg@mail.gmail.com>
Message-ID: <20190103203837.GA5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brandon, All,

On 2019-01-03 13:57 -0600, Brandon Maier spake thusly:
> This is a useful tool, thanks! I don't have time to test it right now,
> but an observation.
> 
> On Thu, Jan 3, 2019 at 2:38 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> ...
> > +        elif pkg.latest_version[1] == pkg.current_version:
> > +            stats["version-uptodate"] += 1
> ...
> > +    elif pkg.latest_version[1] != pkg.current_version:
> > +        td_class.append("version-needs-update")
> 
> From https://bootlin.com/~thomas/stats.html, there's a few packages
> that are up-to-date, but get marked "version-needs-update" because
> either the Buildroot or release-monitoring version string starts with
> a "v".

There was an issue raised (long ago) about this in the anitya tool
(which generatees the DB at r-m.o):
    https://github.com/release-monitoring/anitya/issues/374

So, the version strings we get from r-m.o should no longer have a
leading 'v' anymore.

Yet, in our FOO_VERSION, we in Buildroot may still have those leading
'v'. So, we should try to compare the versions as-is, and then remove
out leading 'v' and compare again. ot sure of the exact heuristic,
though...

Regards,
Yann E. MORIN.

> For example, the vmtouch and libmodbus packages. It would be
> nice to change the version comparison to ignore a leading "v". E.g.
> 
> def version_uptodate(pkg):
>     latest = remove_prefix(pkg.latest_version[1], 'v')
>     current = remove_prefix(pkg.current_version, 'v')
>     return latest == current
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
