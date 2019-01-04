From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Fri, 4 Jan 2019 08:54:52 -0600
Subject: [Buildroot] [PATCH v5] support/scripts/pkg-stats: add latest
 upstream version information
In-Reply-To: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
References: <20190103083818.19702-1-thomas.petazzoni@bootlin.com>
Message-ID: <CA+fik52dKr6eiaED74VaDOOh56FPgwzGndkGMndHGUK+Lx12sg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 3, 2019 at 2:38 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
...
> +    if len(data['versions']) > 0:
> +        return (RM_API_STATUS_FOUND_BY_DISTRO, data['versions'][0], data['id'])
> +    else:
> +        return (RM_API_STATUS_FOUND_BY_DISTRO, None, data['id'])
> +
...
> +    for p in data['projects']:
> +        if p['name'] == name and len(p['versions']) > 0:
> +            return (RM_API_STATUS_FOUND_BY_PATTERN, p['versions'][0], p['id'])
> +

In these two places, instead of using "versions", could we use
"version"? It looks like the first item in "versions" isn't always
correct. For example see cdrkit. I did a mock API call with Postman
and there's a separate "version" field without the prefix.

Here's what a GET to
https://release-monitoring.org/api/projects/?pattern=cdrkit returns:
{
    "projects": [
        {
            "backend": "GitHub",
            "created_on": 1460976471,
            "ecosystem": "https://github.com/Distrotech/cdrkit",
            "homepage": "https://github.com/Distrotech/cdrkit",
            "id": 10520,
            "name": "cdrkit",
            "regex": null,
            "updated_on": 1533644065,
            "version": "1.1.11",
            "version_url": "Distrotech/cdrkit",
            "versions": [
                "release_1.1.11",
                "1.1.11"
            ]
        }
    ],
    "total": 1
}

Otherwise I ran the script on my setup and everything looks good.
Reviewed-By: Brandon Maier <brandon.maier@rockwellcollins.com>
