From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 25 Feb 2018 21:47:48 -0300
Subject: [Buildroot] [PATCH next v2 3/5] support/scripts/pkg-stats-new:
 add current version information
References: <20180221221342.15683-4-thomas.petazzoni@bootlin.com>
Message-ID: <5a9359348b151_fe2161c02836544@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Feb 21, 2018 at 07:13 PM, Thomas Petazzoni wrote:

[snip]
> @@ -187,12 +189,33 @@ def add_pkg_make_info(packages):
>  
>          license_files.append(pkgvar)
>  
> +    # Version
> +    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
> +                                 "-s", "printvars", "VARS=%_VERSION"])
> +    for l in o.splitlines():
> +        # Get variable name and value
> +        pkgvar, value = l.split("=")
> +
> +        # If present, strip HOST_ from variable name
> +        if pkgvar.startswith("HOST_"):
> +            pkgvar = pkgvar[5:]

The output of printvars is sorted, so this makes the 'versions' dict to
contain at the very end:
 1) the target version when there is no host version
 2) the host version for packages alphabetically before hostapd
 3) the target version for packages alphabetically after hplip
 4) the host version when there is no target version

The inconsistency between 2 and 3 is not a problem right now because all
packages that have host and target versions use the same versions for both.
Maybe it will never be a problem?

I hope Yann can help us here (I added to CC).

The case 4 seems to serve a single package: lpc3250loader
We have other packages that are host-only, i.e. vboot-utils, they set _VERSION,
not HOST.*_VERSION.
Maybe it is something to fix in the package?
If yes, you could just ignore the entries starting with HOST_.

> +
> +        if pkgvar.endswith("_DL_VERSION"):
> +            continue
> +        if pkgvar.startswith("HOST_"):
> +            pkgvar = pkgvar[5:]
> +
> +        # Strip _VERSION
> +        pkgvar = pkgvar[:-8]
> +
> +        versions[pkgvar] = value
[snip]
> @@ -387,6 +410,9 @@ def dump_html_pkg(f, pkg):
>      f.write("  <td class=\"%s\">%s</td>\n" %
>              (" ".join(td_class), boolean_str(pkg.has_hash)))
>  
> +    # Current version
> +    f.write("  <td class=\"centered\">%s</td>\n" % pkg.current_version)

This column shows raw sha1 for git packages.
Wouldn't be visually better to show only the first, say 20, characters?
At the end, it's a matter of option.

If more people have the same opinion you could cut the string after checking
with a regexp for 40 or 39 (see sunxi-mali) hexa digits.

Anyway it can be done later.

Regards,
Ricardo
