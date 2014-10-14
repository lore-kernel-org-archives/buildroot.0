From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Oct 2014 11:08:33 +0200
Subject: [Buildroot] [PATCH v2 2/2] randconfig: seed with
	BR2_RAND_PRESEED_CONFIG_FILES
In-Reply-To: <20141014073228.GB3730@free.fr>
References: <1413134795-32050-1-git-send-email-arnout@mind.be>
 <1413138065-6138-1-git-send-email-arnout@mind.be>
 <1413138065-6138-2-git-send-email-arnout@mind.be>
 <20141014073228.GB3730@free.fr>
Message-ID: <543CE811.7080306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/14 09:32, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2014-10-12 20:21 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
[snip]
> > diff --git a/Makefile b/Makefile
> > index 5bcaa77..fb99de1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -732,6 +732,9 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> >  randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> >      @mkdir -p $(BUILD_DIR)/buildroot-config
> >      @rm -f $(CONFIG_DIR)/.config.nopkg
> > +ifneq ($(BR2_RAND_PRESEED_CONFIG_FILES),)
> > +    @cp $(BR2_RAND_PRESEED_CONFIG_FILES) $(CONFIG_DIR)/.config.nopkg
> > +endif
>
> I guess you meant something like:
>     @cat $(BR2_RAND_PRESEED_CONFIG_FILES) $>(CONFIG_DIR)/.config.nopkg
>
> Here's what I get with cp:
>     $ cp foo bar buz
>     cp: target ?buz? is not a directory

 Well spotted, thanks. I changed _FILE into _FILES at the last moment
but never tested it.



>
> >      @grep '^config ' Config.in.legacy | \
> >          while read config pkg; do \
> >          echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
> > @@ -758,6 +761,9 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf
> outputmakefile
> >  randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> >      @mkdir -p $(BUILD_DIR)/buildroot-config
> >      @grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
> > +ifneq ($(BR2_RAND_PRESEED_CONFIG_FILES),)
> > +    @grep BR2_PACKAGE_ $(BR2_RAND_PRESEED_CONFIG_FILES) >>
> $(CONFIG_DIR)/.config.nopkg
> > +endif
>
> Why do you explicitly grep for packages here?

 .config.nopkg will already contain the config of everything else (cfr.
the line above). So if you keep the full preseed file, you'll get duplicate
definitions in the .config.nopkg.

 Of course, if you do

cp foo .config
make randpackageconfig BR2_RAND_PRESEED_CONFIG_FILES=bar

then the .config only contains whatever you had in foo, which is presumably
a toolchain config fragment. But that use case is better handled with

make randconfig BR2_RAND_PRESEED_CONFIG_FILES="foo bar"


 Regards,
 Arnout


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
