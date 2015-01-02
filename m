From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 12:37:42 +0100
Subject: [Buildroot] [PATCH 1/2] graph-depends: display virtual package
 with italic style
In-Reply-To: <1420188573-4236-1-git-send-email-francois.perrad@gadz.org>
References: <1420188573-4236-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150102123742.6e00c2b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri,  2 Jan 2015 09:49:32 +0100, Francois Perrad wrote:
> virtual packages are found by their version,
> so we retrieve the version of all packages
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-generic.mk        |  3 +++
>  support/scripts/graph-depends | 34 +++++++++++++++++++++++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9643a30..87d8dd8 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -565,6 +565,9 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>  $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
>  endif
>  
> +$(1)-show-version:
> +			@echo $$($(2)_VERSION)
> +

This could be a separate patch, maybe?

> +# Execute the "make <pkg>-show-version" command to get the version of a given
> +# list of packages, and return the version formatted as a Python dictionary.
> +def get_version(pkgs):
> +    sys.stderr.write("Getting version for %s\n" % pkgs)
> +    cmd = ["make", "-s", "--no-print-directory" ]
> +    for pkg in pkgs:
> +        cmd.append("%s-show-version" % pkg)

Good, I like the fact that we're doing only one make invocation.

> +all_pkgs = {}
> +for deps in dict_deps.values():
> +    for dep in deps:
> +        all_pkgs[dep] = True
> +for dep in dict_deps.keys():
> +    all_pkgs[dep] = True
> +dict_version = get_version(all_pkgs.keys())

I'm not sure what is going on here. Why aren't you using the existing
'allpkgs' list? It contains the list of all packages, you would just
have to filter the fake 'all' entry in your "for pkg in pkgs:" loop in
the get_version() function.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
