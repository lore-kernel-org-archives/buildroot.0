From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 06:26:45 +0200
Subject: [Buildroot] [PATCHv2 1/4] core: introduce the BR2_EXTERNAL
 variable
In-Reply-To: <52377889.3010402@mind.be>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <52377889.3010402@mind.be>
Message-ID: <20130917062645.37b34ee6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 16 Sep 2013 23:30:49 +0200, Arnout Vandecappelle wrote:
> On 14/09/13 21:03, Thomas Petazzoni wrote:
> > This commit introduces the BR2_EXTERNAL environment variable, which
> > will allow to keep Buildroot customization (board-specific
> > configuration files or root filesystem overlays, package Config.in
> > and makefiles, as well as defconfigs) outside of the Buildroot tree.
> >
> > This commit only introduces the variable itself, and ensures that it
> > is available within Config.in options, so that string options used
> > to specify paths to directories or files can use $BR2_EXTERNAL as a
> 
>   $(BR2_EXTERNAL). The $ is expanded by make. Same comment applies to 
> other places in the commit message as well. You did put it correctly
> in the manual.

Right, true.

> >   * Ensures that the path given in BR2_EXTERNAL is an absolute
> > path, or if not path is given, ensures that BR2_EXTERNAL points to
> > a dummy implementation in $(TOPDIR)/support/dummy-external/. This
> > last part is not directly useful in this commit, but is needed to
> > properly support Config.in options declared in BR2_EXTERNAL (next
> > commit).
> 
>   It would make more sense to do it in that commit then, but that's
> just nitpicking.

Yeah, but since it was really part of the same chunk of code, it was
annoying to split further. But I can certainly split that up further.

> >   * Passes the BR2_EXTERNAL into the *config environment, so that
> > its value is found when parsing/evaluating Config.in files
> > and .config values.
> 
>   That's pretty useless in this commit, since it anyway doesn't end
> up in .config and isn't used in Config.in.

Right, could be moved to the next commit then (but to me the separation
of the commits is relatively artificial, since the patch set really
only makes sense if everything is applied).

>   If you agree to store the value in the .config file, it could look 
> something like this.
> 
> -------
> 
> config BR2_EXTERNAL_FROM_ENV
>          string
>          option env="BR2_EXTERNAL"
> 
> # This condition forces the user to set BR2_EXTERNAL from the
> # command line the first time.
> if BR2_EXTERNAL_FROM_ENV != ""
> config BR2_EXTERNAL
>          string "External buildroot add-ons"
>          default BR2_EXTERNAL_FROM_ENV
>          help
>            List of directories with buildroot add-ons. ...
> endif
> 
> if BR2_EXTERNAL != BR2_EXTERNAL_FROM_ENV
> comment "You need to re-run the config to see the new packages"
> endif
> 
> 
> -------

I don't know. Do we really want to do that? Isn't it simpler to always
pass it as an environment variable?

I mean, if an user changes the value of BR2_EXTERNAL in menuconfig, he
has to exit / re-run menuconfig to anyway see the updated set of
configuration options after the BR2_EXTERNAL value change. Does it
really makes sense to set in menuconfig a configuration option that by
itself changes the available configuration options, but which requires
exiting/re-runnning menuconfig?

>   It doesn't really work, though, because currently the .config is
> not read in when doing 'make menuconfig', so that
> BR2_EXTERNAL_FROM_ENV will always be "". But I'm sure we'll be able
> to find something that works with a little more effort.

Hum, the .config is not read when doing 'make menuconfig'? Then how can
'make menuconfig' show the current state of enabled options?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
