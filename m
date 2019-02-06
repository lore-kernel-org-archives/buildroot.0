From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 15:57:19 +0100
Subject: [Buildroot] [PATCH v6] support/scripts/pkg-stats: add latest
 upstream version information
In-Reply-To: <20190205152000.32032-1-thomas.petazzoni@bootlin.com>
References: <20190205152000.32032-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190206155719.7dc6b306@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 16:19:59 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This commit adds fetching the latest upstream version of each package
> from release-monitoring.org.
> 
> The fetching process first tries to use the package mappings of the
> "Buildroot" distribution [1]. This mapping mechanism allows to tell
> release-monitoring.org what is the name of a package in a given
> distribution/build-system. For example, the package xutil_util-macros
> in Buildroot is named xorg-util-macros on release-monitoring.org. This
> mapping can be seen in the section "Mappings" of
> https://release-monitoring.org/project/15037/.
> 
> If there is no mapping, then it does a regular search, and within the
> search results, looks for a package whose name matches the Buildroot
> name.
> 
> Even though fetching from release-monitoring.org is a bit slow, using
> multiprocessing.Pool has proven to not be reliable, with some requests
> ending up with an exception. So we keep a serialized approach, but
> with a single HTTPSConnectionPool() for all queries. Long term, we
> hope to be able to use a database dump of release-monitoring.org
> instead.
> 
> From an output point of view, the latest version column:
> 
>  - Is green when the version in Buildroot matches the latest upstream
>    version
> 
>  - Is orange when the latest upstream version is unknown because the
>    package was not found on release-monitoring.org
> 
>  - Is red when the version in Buildroot doesn't match the latest
>    upstream version. Note that we are not doing anything smart here:
>    we are just testing if the strings are equal or not.
> 
>  - The cell contains the link to the project on release-monitoring.org
>    if found.
> 
>  - The cell indicates if the match was done using a distro mapping, or
>    through a regular search.
> 
> [1] https://release-monitoring.org/distro/Buildroot/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes since v5:
> - Don't use bare "except", use HTTPError urrlib3 exception
>   instead. Fixes a flake8 warning, and suggested by Ricardo
> - Drop unused RELEASE_MONITORING_API global variable. Reported by
>   Matt Weber.
> - Drop bogus debug message.
> - Add missing newlines between functions.
> - Initialize self.latest_version to a correct tuple during object
>   construction, so we're sure we always have a correct tuple in this
>   field. Suggested by Arnout.
> - Add timeout to the HTTPSConnectionPool, as suggested by Matt Weber.
> - Use the "version" field instead of the "versions" list, as suggested
>   by Brandon Maier.
> - Sort by id the list of results returned by the search by
>   pattern. Indeed, release-monitoring.org returns the results in a
>   random order, causing the results to not be stable accross runs.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
