From: Marcel Patzlaff <M.Patzlaff@pilz.de>
Date: Mon, 30 Jul 2018 14:49:21 +0200
Subject: [Buildroot] Antwort: Re: [PATCH 1/1] Buildroot: add support for
 buildroot configuration fragments
In-Reply-To: <b0f1cbae-87ba-16ff-7ad9-e780589b95b8@mind.be>
References: <20180726130258.8283-1-m.patzlaff@pilz.de>
 <b0f1cbae-87ba-16ff-7ad9-e780589b95b8@mind.be>
Message-ID: <OF747F472E.7DCCA5EE-ONC12582DA.0042641C-C12582DA.00466FDA@local-dmz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle <arnout@mind.be> schrieb am 28.07.2018 11:21:58:

>  We have already discussed (and rejected) such a feature a while ago, 
see [1],
> [2], [3]. It would be good to review that discussion and explain what 
has
> changed. The main takeaway from that discussion was: there is no single 
way to
> merge configs, unless when it's just a matter of calling merge_config.sh 
and
> then there's not much point to add extra complexity on our Makefile to 
handle
> that case.

Well I think you are right, that this is quite complicated. I am not sure, 
if
I fully understand the patch series you are referring to. But it does not
necessarily target the use case I have in mind here. So it's best to 
provide
some more background information:

When I checked the kconfig based packages on what might be possible with 
the
fragment configuration files, I came up with a first solution of how the
infrastructure can be used to automatically update fragment files (see 
thread
[1]). After playing around with that I became aware on how this is 
currently
not possible for buildroot itself. This is yet a kind of a show stopper 
for us
because we plan to use the BR2_EXTERNAL mechanism more extensively and 
would be
very happy if the tooling would provide support for config fragmentation 
and
applying changes automatically. So, I see two possibilities here:

1) Try to find a sane way to accomplish the same for buildroot itself
   (i.e. config fragmentation support and updating of fragments). This 
would
   allow users to use the same interface (make) to accomplish the same 
thing.
   Still this "sane way" is yet to be found if I understand your comments
   below. It could very well be possible, that there is no such way and 
thus
   would require to follow possibility...
2) Create a support script that merges the buildroot configuration and 
that
   also handles the update of the last fragment file. Everything could 
thus be
   kept outside of buildroot. Still we could provide a patch for that for 
   others to enjoy too.

Using the same interface is quite tempting so I went for solution 1 first.
Yet, as you point out below, this is not the correct way to do it. I am 
not
that deep down in the buildroot make architecture to decide what to do 
now:
Follow this path further and find an acceptable solution for 1) or just 
skip
that and go for 2) ?

> > -xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig
> > +xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig 
> merge-br-config
> 
>  This is not good... If I understand correctly, if you do:
> 
> make xconfig; make xconfig
> 
> you will *loose* any changes from the first xconfig.

Is that so? This could happen, if xconfig does not touch the .config file 
to
store the changes. Using only menuconfig myself I do not know what the 
other
editors are doing and how... :-(
What I observe is, that the merge does not result in a complete .config. 
So
when using the editor after a fresh merge, it will ask you to save the
changes even though nothing has changed through it...

> > -savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
> > +# At the moment there is a difference of what buildroot does on 
> "savedefconfig"
> > +# and what Kconfig packages do on "<pkg>-savedefconfig". The 
> latter create files
> > +# named "defconfig" from the current configuration.
> 
>  Hm, good point, it's not very logical that this is different... 
> Perhaps you can
> create a new mail thread to discuss if we should change 
> "savedefconfig" to just
> save to a defconfig file (like it used to), and add "update-
> defconfig" to write
> it to BR2_DEFCONFIG? Personally I like the way Buildroot works at the 
moment,
> but others may have a different opinion.

Just wanted to point that out. I do not think that the change should 
really be
done because it most probably would break the use of savedefconfig for 
others.


> >  MERGE_LIST=$*
> >  SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> > +if [ "$ALLPREFIXES" = "true" ]; then
> > +   SED_CONFIG_EXP="s/^\(# \)\{0,1\}\([a-zA-Z][a-zA-Z0-9_]*\)[= 
].*/\2/p"
> > +fi
> 
>  I don't think it's worthwhile to make an option for this. Just change 
the
> expression unconditionally.

Adding an option ensures that the behaviour is the same for all other use
cases. I assumed that the "CONFIG_" prefix is there for a reason. Though, 
I
did not check if it is really required...

> 
>  Also, we maintain changes to kconfig as a series of patches, so it 
> is easier to
> merge in a new version. So you should also create a patch and add it to 
the
> patches/ directory. Note that this was forgotten for the last commit to
> merge_config.sh in 28fac3973b3, so you'd first have to create a 
> patch from that
> commit as well... Oh, and if you can think of a better way to maintain 
this,
> feel free to do so :-)

Well, I have no opinion on that ;-)

> > +merge_config() {
> > +    TMP_DIR=$(mktemp -d --suffix -br-config-merge)
> > +    trap "rm -rf ${TMP_DIR:-XxXbe-safeXxX}" EXIT INT TERM
>                                ^ Nice!
> 
>  Aren't INT and TERM included in EXIT?

No, that's only with bash.


Regards, Marcel

[1]: https://patchwork.ozlabs.org/patch/950174/


Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180730/0673459d/attachment.html>
