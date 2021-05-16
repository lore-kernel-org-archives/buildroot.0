From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 17:57:32 +0200
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: add CPE
 searching links
In-Reply-To: <20210422194557.17499-1-matthew.weber@rockwellcollins.com>
References: <20210422194557.17499-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210516155732.GJ2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2021-04-22 14:45 -0500, Matt Weber spake thusly:
> For cases of a CPE having a unknown version or when there hasn't
> been a CPE verified, proposed a search criteria to help the
> user research an update.
> 
> (libcurl has NIST dict entries but not this version)
>   cpe:2.3:a:haxx:libcurl:7.76.1:*:*:*:*:*:*:*
>   CPE identifier unknown in CPE database (Search)
> 
> (jitterentropy-library package doesn't have any NIST dict entries)
>   no verified CPE identifier (Search)
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This is interesting, thanks!

However, I am a little bit worried about always adding such a search
link. With your change, we'd add a search link for quite a few packages
for which there will never be any NVD entry: all our virtual packages,
for example.

However, those packages are currently reported as having "no valid
package infra", so this is a bit busted, because virtual-package *is* a
valid infra...

This is because has_valid_infra() is incorrectly named; it probab ly
should be named is_actual_package(), and has_valid_infra() would be
changed to actually represent having an actual infra:

    @property
    def has_valid_infra(self):
        if self.infras is None:
            return False
        return len(self.infras) > 0

    @property
    def is_actual_package(self):
        if not self.has_valid_infra:
            return False
        if self.infras[0][1] == 'virtual':
            return False
        return True

If we were to do that, then that would automatically solve the issue of
adding a search link to virtual packages. This would also be used for
the CVE list: indeed, a virtual package can't have a CVE...

Finally:

    $ make check-flake8
    support/scripts/pkg-stats:925:133: E501 line too long (139 > 132 characters)
    support/scripts/pkg-stats:925:139: E502 the backslash is redundant between brackets
    support/scripts/pkg-stats:926:17: E128 continuation line under-indented for visual indent
    support/scripts/pkg-stats:928:133: E501 line too long (134 > 132 characters)
    support/scripts/pkg-stats:928:134: E502 the backslash is redundant between brackets
    support/scripts/pkg-stats:929:17: E128 continuation line under-indented for visual indent
    2     E128 continuation line under-indented for visual indent
    2     E501 line too long (139 > 132 characters)
    2     E502 the backslash is redundant between brackets
    make[1]: *** [Makefile:1231: check-flake8] Error 123
    make: *** [Makefile:84: _all] Error 2

I really hesitated to just fix the flake8 issues and just apply with the
virtual package issue, and wait for someone to fix it afterwards
(becasue the use you're making of has_valid_infra() is not new, so
that's not your fault). But on the other hand, I found the result to be
a bit, well, "not nice"...

So, let's toss a coin... Applied to master, thanks. Yet, working on this
has_valid_infra() would be awesome! ;-)

Regards,
Yann E. MORIN.

> ---
> v3 - Fixed pkg.cpeid.split() to include PRODUCT field
> v2 - New
> ---
>  support/scripts/pkg-stats | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 6f3ddc561f..5b7fd1e0aa 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -921,7 +921,13 @@ def dump_html_pkg(f, pkg):
>      if pkg.cpeid:
>          f.write("  <code>%s</code>\n" % pkg.cpeid)
>      if not pkg.is_status_ok("cpe"):
> -        f.write("  %s%s\n" % ("<br/>" if pkg.cpeid else "", pkg.status['cpe'][1]))
> +        if pkg.cpeid:
> +            f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" % \
> +                (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
> +        else:
> +            f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" % \
> +                (pkg.status['cpe'][1], pkg.name))
> +
>      f.write("  </td>\n")
>  
>      f.write(" </tr>\n")
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
