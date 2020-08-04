From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Aug 2020 14:43:33 +0200
Subject: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: use aiohttp
 for latest version retrieval
In-Reply-To: <20200804124044.1217873-2-thomas.petazzoni@bootlin.com>
References: <20200804124044.1217873-1-thomas.petazzoni@bootlin.com>
 <20200804124044.1217873-2-thomas.petazzoni@bootlin.com>
Message-ID: <20200804144333.2e0d3bbc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Aug 2020 14:40:42 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> +async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
> +    url = "https://release-monitoring.org/api/projects/?pattern=%s" % pkg.name
> +    try:
> +        async with session.get(url) as resp:
> +            if resp.status != 200:
> +                return False
> +
> +            data = await resp.json()
> +            projects = data['projects']
> +            projects.sort(key=lambda x: x['id'])
> +
> +            for p in projects:
> +                if p['name'] == pkg.name and 'version' in p:
> +                    check_package_latest_version_set_status(pkg,
> +                                                            RM_API_STATUS_FOUND_BY_DISTRO,
> +                                                            p['version'],
> +                                                            p['id'])
> +            return True

Reading my code again, this return True should be within the "if", so
that we only return True if we really found something. I'll fix that
for a v2.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
