From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 1 Nov 2018 14:23:51 +0100
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot
 config files
In-Reply-To: <20181101105513.GB4937@smart-ThinkPad-T410>
References: <20181031205608.GA4061@x230>
 <20181101010953.20996-1-afshin.nasser@gmail.com>
 <20181101062448.GC8261@x230>
 <20181101105513.GB4937@smart-ThinkPad-T410>
Message-ID: <20181101132350.GA3634@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nasser,

> > > +unset CONFIG_
> > You added unset, which isn't in upstream patch. This has no effect, so I'd be
> > for removing it. Even if it has (if it was needed), it'd be better to 1) ask
> > upstream to add it 2) keep it in separate patch in meanwhile (otherwise it
> > complicates patch rebasing during update and can be lost).
> Removing unset will cause the following make command work wrong. Note
> that the value of this environment variable is checked [1] and used. The
> result of removing the unset line is that we will have double BR2_
> prefixes in the final .config file as well as lots of warnings when
> checking if all specified config values have been taken.
You're right. The reason is that we don't actually use BR2_ as a real prefix
(as Masahiro noted [1], but I didn't realize that), but here in utils/test-pkg
we pass it as merge_config.sh needs to work with prefixes [2]:

-    support/kconfig/merge_config.sh -O "${dir}" \
+    CONFIG_=BR2_ support/kconfig/merge_config.sh -O "${dir}" \

Delta is smaller, but it's still a patch, which is needed :(.

> > BTW (I noted that before) your patch contain trailing whitespace and mixing tab
> > and spaces. git am and pwclient fixes that, only when applying with patch they
> > get committed, so nothing serious.

> > $ pwclient git-am -p buildroot 991781
> > .git/rebase-apply/patch:59: space before tab in indent.
> >  	echo "  -r    list redundant entries when merging fragments"
> > .git/rebase-apply/patch:60: space before tab in indent.
> >  	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
> > .git/rebase-apply/patch:61: space before tab in indent.
> >  	echo "  -e    colon-separated list of br2-external trees to use (optional)"
> > .git/rebase-apply/patch:66: trailing whitespace.

> > .git/rebase-apply/patch:72: trailing whitespace.

> > warning: squelched 6 whitespace errors
> > warning: 10 lines applied after fixing whitespace errors.
> > Applying: merge_config.sh: Fix merging buildroot config files
> > Applying patch #991781 using 'git am'
> > Description: merge_config.sh: Fix merging buildroot config files

> I think this is because we are including a patch in another patch. As
> you can see in your previous commit:
> a3366b270562f42723a3b8032f73bb03b541d113, this patch has the same issue
> because it includes another patch.
> I don't know how to avoid that if we should do so.
Again, you're right. I'm sorry for bothering you with it.


Kind regards,
Petr

[1] https://patchwork.kernel.org/patch/10658589/#22290097
[2] https://patchwork.ozlabs.org/patch/991781/
