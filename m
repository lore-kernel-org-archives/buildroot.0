From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Thu, 3 Jan 2019 13:57:46 -0600
Subject: [Buildroot] [PATCH v5] support/scripts/pkg-stats: add latest
 upstream version information
In-Reply-To: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
Message-ID: <CA+fik52n+izpqRGSSP1QFMoPCCd1y0Mub714-1cHWFYotXuhNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a useful tool, thanks! I don't have time to test it right now,
but an observation.

On Thu, Jan 3, 2019 at 2:38 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
...
> +        elif pkg.latest_version[1] == pkg.current_version:
> +            stats["version-uptodate"] += 1
...
> +    elif pkg.latest_version[1] != pkg.current_version:
> +        td_class.append("version-needs-update")

From https://bootlin.com/~thomas/stats.html, there's a few packages
that are up-to-date, but get marked "version-needs-update" because
either the Buildroot or release-monitoring version string starts with
a "v". For example, the vmtouch and libmodbus packages. It would be
nice to change the version comparison to ignore a leading "v". E.g.

def version_uptodate(pkg):
    latest = remove_prefix(pkg.latest_version[1], 'v')
    current = remove_prefix(pkg.current_version, 'v')
    return latest == current
