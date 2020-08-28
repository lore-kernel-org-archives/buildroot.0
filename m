From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 09:34:19 +0200
Subject: [Buildroot] [PATCH v3 2/8] support/scripts/cve.py: Switch to
 JSON 1.1
In-Reply-To: <20200724154356.2607639-3-gregory.clement@bootlin.com>
References: <20200724154356.2607639-1-gregory.clement@bootlin.com>
 <20200724154356.2607639-3-gregory.clement@bootlin.com>
Message-ID: <20200828093419.569743c9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jul 2020 17:43:50 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> In 2019, the JSON vulnerability feeds switched from version 1.0 to
> 1.1.
> 
> The main difference is the removal of the affects element that was
> used to check if a package was affected by a CVE.
> 
> This information is duplicated in the configuration element which
> contains in the end the cpeid as well as properties about the versions
> affected. Instead of having a list of the versions affected, with
> these properties, it is possible to have a range of versions.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

So, I've applied to next, but after doing a number of changes. First,
your patch caused quite a few flake8 warnings.

Then, I compared the list of CVEs before/after this changed, and
noticed a number of CVEs were "lost", investigated why, and fixed this.
With your patch applied and my fixes, we now only have additional CVEs,
and we're not losing any CVEs compared to before.

I will comment below on various things I have changed.

> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index 8a4087ef8a..a8861d966c 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -34,9 +34,19 @@ except ImportError:
>  sys.path.append('utils/')
>  
>  NVD_START_YEAR = 2002
> -NVD_JSON_VERSION = "1.0"
> +NVD_JSON_VERSION = "1.1"
>  NVD_BASE_URL = "https://nvd.nist.gov/feeds/json/cve/" + NVD_JSON_VERSION
>  
> +import operator

Imports should be at the beginning of the file, this was a flake8
warning.

> +
> +ops = {
> +    '>=' : operator.ge,
> +    '>' : operator.gt,
> +    '<=' : operator.le,
> +    '<' : operator.lt,
> +    '=' : operator.eq

No space before the ':', this was a flake8 warning as well.

> +            key =['vendor', 'product', 'v_start', 'op_start', 'v_end', 'op_end']

There was a missing space after the =

> +            val = [vendor, product, v_start, op_start, v_end, op_end]
> +            yield dict(zip(key, val))

but I have anyway simplified this to just:

            yield {
                'vendor': vendor,
                'product': product,
                'v_start': v_start,
                'op_start': op_start,
                'v_end': v_end,
                'op_end': op_end
            }

>      def affects(self, br_pkg):
>          """
> @@ -125,32 +193,35 @@ class CVE:
>          if br_pkg.is_cve_ignored(self.identifier):
>              return self.CVE_DOESNT_AFFECT
>  
> -        for product in self.each_product():
> -            if product['product_name'] != br_pkg.name:
> +        for cpe in self.each_cpe():
> +            affected = True

I didn't really like this "affected = True" and the whole logic around
"affected". So I've changed the logic a bit to rather skip the
iteration of the loop if the current version falls outside of the range
described by the v_start/v_end fields. I'll post the code later below.

> +            if cpe['product'] != br_pkg.name:
>                  continue
> +            if cpe['v_start'] == '-':
> +                return self.CVE_AFFECTS

This change caused a lot of CVEs to be added, as it treats "-" as a
wildcard, and we were not doing this before. So, I've pushed a
preliminary commit at
https://git.buildroot.org/buildroot/commit/?h=next&id=008ca2c583cb9dc70cd30c5318b3b1cbef57b06a,
which changed the previous JSON 1.0 code to also treat "-" as a
wildcard. This allowed me to verify step by step how the list of CVEs
affecting packages was evolving throughout the changes we're making to
this code.

So, between the original JSON 1.0 code, and the JSON 1.0 code that got
changed to treat "-" as a version wildcard, lots (~500) of CVEs got
added. Turns out that in the JSON 1.0 schema, there are a lot of CVEs
that describe the version precisely *and* with a wildcard, so we had
lost some "precision" here. So the amount of CVEs affecting our
packages jumped from 141 to 658.

However, for many of those CVEs, the JSON 1.1 data is more precise, and
has less of those wildcard versions. So with the JSON 1.1 usage, the
total number of CVEs affecting us dropped to 420.

For those interested in looking at the differences:

 - JSON dump of pkg-stats output, before all those changes:
   https://bootlin.com/~thomas/cve-1.0-dump.json

 - JSON dump of pkg-stats output, after we treat "-" as a version
   wildcard, but still using the NVD database in 1.0 schema:
   https://bootlin.com/~thomas/cve-1.0-dump-with-version-wildcard.json

 - JSON dump of pkg-stats output, after all the changes, which means
   we're using the NVD database in 1.1 schema:
   https://bootlin.com/~thomas/cve-1.1-dump.json

Note: these JSON dumps don't have the "latest upstream version" and
"upstream URL checks" information, as I disabled them to make pkg-stats
a bit faster and focus on the CVE stuff.

> +            if not (cpe['v_start'] or cpe['v_end']):
> +                print("No CVE affected version")
> +                continue
> +            pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
> +            if not hasattr(pkg_version, "version"):
> +                print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
> +                continue

There was no reason to do this logic inside the loop each time, so I
moved it outside of the loop. The pkg_version variable remains checked
inside the loop.

> +            if cpe['v_start']:
> +                    try:
> +                        cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
> +                        affected = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
> +                        break

This break was bogus, and caused many CVEs to be ignored.

> +                    except:
> +                        return self.CVE_UNKNOWN
>  
> -            for v in product['version']['version_data']:
> -                if v["version_affected"] == "=":
> -                    if br_pkg.current_version == v["version_value"]:
> -                        return self.CVE_AFFECTS
> -                elif v["version_affected"] == "<=":
> -                    pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
> -                    if not hasattr(pkg_version, "version"):
> -                        print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
> -                        continue
> -                    cve_affected_version = distutils.version.LooseVersion(v["version_value"])
> -                    if not hasattr(cve_affected_version, "version"):
> -                        print("Cannot parse CVE affected version '%s'" % v["version_value"])
> -                        continue
> +            if (affected and cpe['v_end']):
>                      try:
> -                        affected = pkg_version <= cve_affected_version
> +                        cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
> +                        affected = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
>                          break

Ditto for this break.

So overall, the code looks like this:

        for cpe in self.each_cpe():
            if cpe['product'] != br_pkg.name:
                continue
            if cpe['v_start'] == '-':
                return self.CVE_AFFECTS
            if not cpe['v_start'] and not cpe['v_end']:
                print("No CVE affected version")
                continue
            if not pkg_version:
                continue

            if cpe['v_start']:
                try:
                    cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
                    inrange = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
                except TypeError:
                    return self.CVE_UNKNOWN

                # current package version is before v_start, so we're
                # not affected by the CVE
                if not inrange:
                    continue

            if cpe['v_end']:
                try:
                    cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
                    inrange = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
                except TypeError:
                    return self.CVE_UNKNOWN

                # current package version is after v_end, so we're
                # not affected by the CVE
                if not inrange:
                    continue

            # We're in the version range affected by this CVE
            return self.CVE_AFFECTS

        return self.CVE_DOESNT_AFFECT

Feel free to comment on that, if you see any issue with this. We can
always re-adjust what I have pushed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
