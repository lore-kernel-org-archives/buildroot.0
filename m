From: Hugues <hugues@hiegel.fr>
Date: Tue, 27 Oct 2009 15:18:42 +0100
Subject: [Buildroot] [PATCH] netkitftp: ftp client from netkit project
In-Reply-To: <871vkpdlst.fsf@macbook.be.48ers.dk>
References: <1256573832-11116-2-git-send-email-hugues@hiegel.fr>
	<1256647300-19012-1-git-send-email-hugues@hiegel.fr>
	<871vkpdlst.fsf@macbook.be.48ers.dk>
Message-ID: <20091027141842.GP30850@hiegel.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

En ce d?gag? mardi 27 octobre, vers 14 heures 10, Peter Korsgaard a tapot? : 

> >>>>> "Hugues" == Hugues Hiegel <hugues@hiegel.fr> writes:
> 
>  Hugues> From: Hugues Hiegel <hugues.hiegel@openwide.fr>
> 
> Thanks, looks a lot better, but we're still not quite there yet.

aha :-)

> It would be good if you could add a signed-of-by line to the end of the
> commit message - E.G.
> 
> Signed-off-by: Hugues Hiegel <hugues.hiegel@openwide.fr>

Well, perhaps should you be the really one who should answer me : 
what's the purpose of this "signed-off-by" !? :)

>  Hugues> +	  "Classic" ftp client with standard behaviour from 
> 
> Trailing space.

Argh, I *really* need to tweak my vim config to show these...

>  Hugues> +NETKITFTP_VERSION:=0.17
>  Hugues> +NETKITFTP_PATCH_VERSION:=16
>  Hugues> +NETKITFTP_SOURCE:=netkit-ftp_$(NETKITFTP_VERSION).orig.tar.gz
>  Hugues> +NETKITFTP_PATCH:=netkit-ftp_$(NETKITFTP_VERSION)-$(NETKITFTP_PATCH_VERSION).diff.gz
>  Hugues> +NETKITFTP_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/n/netkit-ftp/
> 
> You'll need to disable the configure cache as the configure script
> doesn't understand it:
> 
> Unrecognized option: --cache-file=/tmp/br/build/tgt-config.cache
> make: *** [/tmp/br/build/netkitftp-0.17/.stamp_configured] Error 1
> E.G. add NETKITFTP_USE_CONFIG_CACHE:=NO

Ok

> You'll also need to prepend netkitftp- to the patch names, as they will
> otherwise not get applied and configure errors out on unrecognized
> options.

Mhm, it seemed to work correctly for me, I'll put another eye with more
coffee ...

> With that fixed the configure script still fails with:
> 
> Checking for BSD signal semantics... yes
> Checking for ncurses... no
> Checking for traditional termcap... not found
> This package needs termcap to run.
> 
> So you probably need to depend on ncurses. Notice that the configure
> script doesn't return an error code here, so the build continues (and
> then fails later on).

Mhm, right.

> Are you testing this in some other tree than mainline?

Yes, it's a tree that has been grown up from 2009.08_rc2, and I've got a
bunch of configuration that work with. 
I should certainly consider getting a clean and correct config which works
on top of the master branch (on which I cherry-pick my netkitftp tweaks
;))

It'll take me some more days,
I've got another bunch of things to do right now :(

But I'm still not discouraged ;o)

>  Hugues> +
>  Hugues> +# Netkitftp does not understands the INSTALL_PREFIX envvar,
>  Hugues> +#?we have to use the --installroot configure option instead...
>  Hugues> +NETKITFTP_CONF_OPT = --installroot=$(TARGET_DIR) \
>  Hugues> +					 --without-readline
>  Hugues> +NETKITFTP_INSTALL_TARGET_OPT = install
>  Hugues> +
>  Hugues> +$(eval $(call AUTOTARGETS,package,netkitftp))
>  Hugues> +
>  Hugues> +$(NETKITFTP_HOOK_POST_BUILD):
>  Hugues> +	# The 'install' rule of netkitftp would install manpages, but the
>  Hugues> +	#?folders generally do not exist on the TARGET_PATH, so we create
>  Hugues> +	#?them in order to let 'make install' successfully perform.
>  Hugues> +	mkdir -p $(TARGET_DIR)/usr/man/man1 $(TARGET_DIR)/usr/man/man5
> 
> You still have odd unicode chars here.

Grr (against myself !).

> You forgot to actually include the Config.in to package/Config.in, so
> the package cannot get selected.
> 
> Could you fix those issues please?

Oh yeah, no problem :)


Thanks you a lot for your patience...
-- 
Hugues Hiegel                                [http://www.hiegel.fr/~hugues/]
