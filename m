From: Nasser <afshin.nasser@gmail.com>
Date: Thu, 1 Nov 2018 14:25:13 +0330
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot
 config files
In-Reply-To: <20181101062448.GC8261@x230>
References: <20181031205608.GA4061@x230>
 <20181101010953.20996-1-afshin.nasser@gmail.com>
 <20181101062448.GC8261@x230>
Message-ID: <20181101105513.GB4937@smart-ThinkPad-T410>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,
On Thu, Nov 01, 2018 at 07:24:49AM +0100, Petr Vorel wrote:
> Hi Nasser,
> 
> ...
> > @@ -157,6 +162,7 @@ fi
> >  # Use the merged file as the starting point for:
> >  # alldefconfig: Fills in any missing symbols with Kconfig default
> >  # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> > +unset CONFIG_
> You added unset, which isn't in upstream patch. This has no effect, so I'd be
> for removing it. Even if it has (if it was needed), it'd be better to 1) ask
> upstream to add it 2) keep it in separate patch in meanwhile (otherwise it
> complicates patch rebasing during update and can be lost).
Removing unset will cause the following make command work wrong. Note
that the value of this environment variable is checked [1] and used. The
result of removing the unset line is that we will have double BR2_
prefixes in the final .config file as well as lots of warnings when
checking if all specified config values have been taken.

I think we should follow your steps to include it.
> 
> ...
> > diff --git a/support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch b/support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
> ...
> > + # Use the merged file as the starting point for:
> > + # alldefconfig: Fills in any missing symbols with Kconfig default
> > + # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> > ++unset CONFIG_
> 
> BTW (I noted that before) your patch contain trailing whitespace and mixing tab
> and spaces. git am and pwclient fixes that, only when applying with patch they
> get committed, so nothing serious.
> 
> $ pwclient git-am -p buildroot 991781
> .git/rebase-apply/patch:59: space before tab in indent.
>  	echo "  -r    list redundant entries when merging fragments"
> .git/rebase-apply/patch:60: space before tab in indent.
>  	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
> .git/rebase-apply/patch:61: space before tab in indent.
>  	echo "  -e    colon-separated list of br2-external trees to use (optional)"
> .git/rebase-apply/patch:66: trailing whitespace.
>  
> .git/rebase-apply/patch:72: trailing whitespace.
>  
> warning: squelched 6 whitespace errors
> warning: 10 lines applied after fixing whitespace errors.
> Applying: merge_config.sh: Fix merging buildroot config files
> Applying patch #991781 using 'git am'
> Description: merge_config.sh: Fix merging buildroot config files
> 
I think this is because we are including a patch in another patch. As
you can see in your previous commit:
a3366b270562f42723a3b8032f73bb03b541d113, this patch has the same issue
because it includes another patch.
I don't know how to avoid that if we should do so.
> Kind regards,
> Petr
[1] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/tree/scripts/kconfig/lkc.h?h=for-next&id=f6fe19e9d84400e1c9544c1909952c2c7c6a90#n26
Kind regards,
Nasser
