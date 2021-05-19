From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Wed, 19 May 2021 01:20:36 +0000
Subject: [Buildroot] [External] Re: [PATCH 3/3]
 support/scripts/pkg-stats: clarify when a CVE/CPE should report as N/A
In-Reply-To: <20210518201649.GY2506@scaer>
References: <20210518182155.47055-1-matthew.weber@collins.com>
 <20210518182155.47055-3-matthew.weber@collins.com>
 <20210518201649.GY2506@scaer>
Message-ID: <DM2P110MB0105F384EA212815C98490A8F22B9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Tuesday, May 18, 2021 3:17 PM
> To: Weber, Matthew L Collins <Matthew.Weber@collins.com>
> Cc: buildroot at buildroot.org
> Subject: [External] Re: [Buildroot] [PATCH 3/3] support/scripts/pkg-stats:
> clarify when a CVE/CPE should report as N/A
> 
> Matthew, All,
> 
> On 2021-05-18 13:21 -0500, Matthew Weber via buildroot spake thusly:
> >  - If a package doesn't have any versioning, ignore and state that
> >  - If a package is virtual, CVE=ignore and CPE state virtual
> >  - For any of these NA cases, don't provide search link
> >
> > Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> 
> Honestly, I get quickly lost in the coe of pkg-stats...
> 
> However, with this series applied, the cells for CVE and CPE for virtual
> packages are not green, suggesting this is abnormal. However, this is
> perfectly fine there are no CVE and no CPE for virtual packages, so they
> should be green.
> 
> I managed to do that by adding the following on-top of this third patch:
> 
>     diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
>     index 3aaf1169cb..d06778ab05 100755
>     --- a/support/scripts/pkg-stats
>     +++ b/support/scripts/pkg-stats
>     @@ -910,6 +910,8 @@ def dump_html_pkg(f, pkg):
>          td_class = ["centered"]
>          if pkg.is_status_ok("cve"):
>              td_class.append("cve-ok")
>     +    elif pkg.is_status_na("cve") and not pkg.is_actual_package:
>     +        td_class.append("cve-ok")
>          elif pkg.is_status_error("cve"):
>              td_class.append("cve-nok")
>          else:
>     @@ -937,6 +939,8 @@ def dump_html_pkg(f, pkg):
>          td_class = ["left"]
>          if pkg.is_status_ok("cpe"):
>              td_class.append("cpe-ok")
>     +    elif pkg.is_status_na("cpe") and not pkg.is_actual_package:
>     +        td_class.append("cpe-ok")
>          elif pkg.is_status_error("cpe"):
>              td_class.append("cpe-nok")
>          else:
> 
> But I am not usre this is the best solution... So, I've not applied patches 2 and
> 3 in the series. Could you please respin with the above (if it's OK for you, or
> with a better solution), please?

I'll take a look (I noticed this and didn't have a good feeling if they should be green).

> 
> Additionally, as a further refinement, packages that have no version, like
> urandom-scripts, makedevs, etc... are usually bundled with Buildroot. Do you
> think for those we should:
> 
>  1. declare 'buildroot' to NVD, as the 'buildroot_project' vendor and
>     the 'buildroot' product, as well as 'makedevs', 'urandom-scripts' et
>     al. as products,
> 
>  2. add "MAKEDEVS_CPE_VENDOR = buildroot_project" to each of those
>     bundled packages.
> 

I'd go with (2) where we use 'buildroot_project' as the vendor, and then each of those packages that have no version would use the Buildroot version and their name as the product.  I don't see any reason NIST won't support us adding those dictionary entries, and I know other distros do similar for things like ifupdown scripts, etc.

I can work on a series like this but would like to get the pending one merged before we open this topic up ?

Regards,
Matt
