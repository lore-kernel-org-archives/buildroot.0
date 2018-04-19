From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Apr 2018 09:47:49 +0200
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
Message-ID: <20180419074749.GB2496@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-04-19 00:27 +0200, Arnout Vandecappelle spake thusly:
> On 16-04-18 13:58, Stefan Becker wrote:
> > If the variable content has newlines in it then the currently dumped
> > content can't be fed again to GNU make. Add the option DEFINE_VARS which
> > causes the variables to be dumped using
> > 
> >    define VAR
> >    ... line 1 ...
> >    ... line 2 ...
> >    ...
> >    endef
> 
>  I'm still not convinced that this is such a great idea.

Neither am I... And if I look around, I think the problem explained in
the commit log is already covered:

    $ make defconfig
    $ make -s printvars VARS=HOST_CARGO_INSTALL_CMDS QUOTED_VARS=YES
    HOST_CARGO_INSTALL_CMDS='       /usr/bin/install -D -m 0755 ./target/release/cargo /home/ymorin/dev/buildroot/O/host/bin/cargo
            /usr/bin/install -D package/cargo/config.in /home/ymorin/dev/buildroot/O/host/share/cargo/config
            /bin/sed -i -e '\''s/@RUSTC_TARGET_NAME@/i686-unknown-linux-gnu/'\'' /home/ymorin/dev/buildroot/O/host/share/cargo/config
            /bin/sed -i -e '\''s/@CROSS_PREFIX@/i686-buildroot-linux-uclibc-/'\'' /home/ymorin/dev/buildroot/O/host/share/cargo/config'

I.e. the newlines are embedded in the quoted value, so at the very
worst, one can re-inject this value in a new variable (with a bit of
shell trickery, yes, but rather easily).

Note that, when it encounters a \-continued line, make joins it with the
next line, squeezing leading and trailing spaces/atbs into a single
space. But otherwise, newlines are kept as-is. This can be seen above,
but also in this one, where it is even more obvious that newlines are
kept:

    $ eval make -s printvars VARS=SYSTEMD_USERS QUOTED_VARS=YES
    SYSTEMD_USERS=' - - input -1 * - - - Input device group
            - - systemd-journal -1 * - - - Journal
            - - render -1 * - - - DRI rendering nodes
            - - kvm -1 * - - - kvm nodes
            systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
            systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
            systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
            systemd-journal-upload -1 systemd-journal-upload -1 * - - - Journal Upload



            '

Compare with the non-expanded, raw value:

    $ eval make -s printvars VARS=SYSTEMD_USERS QUOTED_VARS=YES RAW_VARS=YES
    SYSTEMD_USERS=' - - input -1 * - - - Input device group
            - - systemd-journal -1 * - - - Journal
            - - render -1 * - - - DRI rendering nodes
            - - kvm -1 * - - - kvm nodes
            systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
            systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
            systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
            systemd-journal-upload -1 systemd-journal-upload -1 * - - - Journal Upload
            $(SYSTEMD_COREDUMP_USER)
            $(SYSTEMD_NETWORKD_USER)
            $(SYSTEMD_RESOLVED_USER)
            $(SYSTEMD_TIMESYNCD_USER)'

So, newlines are still present, and we can especially see this is the
case around the variables that are expanded to empty (the coredump,
networkd, resolved, and timesyncd users).

So, the whole excuse for the change, as explained in the commit log,
does not stand: newlines are preserved.

> 1. As explained in reply to your first iteration, there shouldn't be a need for
> including Buildroot variables in a surrounding Makefile.

That's because, as I remember and understand it, Stefan finds that
Buildroot is not fast enough for his use-case, and so extracts such
commands in an attempt to feed them back into his own build mechanism
around Buildroot. Or something like that; I did not understand the
details fully...

> 2. At least equally relevant would be output that is appropriate for Python,
> JSON, ...

I'm not sure I agree with you here: json is about representtaion, python
is a completely different language, while what Stefan is initially
asking for is a way to retrieve part of the makefile rules for feeding
them back into make.

But there is a solution for that: run make in debug mode, and scrape its
output.

> 3. The implementation is not complete. In case of RAW_VARS, it's pretty hard to
> use in practice because also all the referenced variables would need to be
> retrieved. In the expanded case, any remaining $ will be interpreted by your
> surrounding make instead of being passed down to the shell like they should. Try
> e.g. CANFESTIVAL_INSTALL_TARGET_CMDS.
> 
> Note that QUOTED_VARS is not perfect either, mainly because there are some make
> variables that are not legal shell variables (e.g. all the 4th stuff).

Right.

>  So, if anything changes in here, I'd rather have some output that is in some
> intermediate format that can easily be converted into or parsed by shell,
> python, etc.

And I'd rather not: quoted values already contain the expanded value
that is passed to the shell (and because raw shell code), and we can't
do better than that. The raw values contain the code as it was written
by the packager, and we can't do better than that either.

Anyway, as explained by Arnout, this new output format can't produce
working make code, so I've marked this patch as rejected in patchwork.

If you can come with a better solution that works in all cases and is
generic enough, then we can look back at it.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Updated the manual accordingly.
> > 
> > Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> > ---
> >  Makefile                  | 10 +++++++---
> >  docs/manual/make-tips.txt | 20 ++++++++++++++++++++
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 0724f28f45..3e27195de0 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -974,9 +974,13 @@ printvars:
> >  		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
> >  		$(if $(filter-out environment% default automatic, \
> >  				$(origin $V)), \
> > -		$(if $(QUOTED_VARS),\
> > -			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
> > -			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
> > +		$(if $(DEFINE_VARS), \
> > +			$(info define $V) \
> > +			$(info $(if $(RAW_VARS),$(value $V),$($V))) \
> > +			$(info endef), \
> > +			$(if $(QUOTED_VARS),\
> > +				$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
> > +				$(info $V=$(if $(RAW_VARS),$(value $V),$($V)))))))
> >  # ' Syntax colouring...
> >  
> >  .PHONY: clean
> > diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> > index ea1d825bef..ba87e5d873 100644
> > --- a/docs/manual/make-tips.txt
> > +++ b/docs/manual/make-tips.txt
> > @@ -92,6 +92,8 @@ It is possible to tweak the output using some variables:
> >  
> >  - +VARS+ will limit the listing to variables which names match the
> >    specified make-pattern
> > +- +DEFINE_VARS+, if set to +YES+, will use define...endef to preserve
> > +  newlines in the value
> >  - +QUOTED_VARS+, if set to +YES+, will single-quote the value
> >  - +RAW_VARS+, if set to +YES+, will print the unexpanded value
> >  
> > @@ -106,6 +108,24 @@ For example:
> >   BUSYBOX_RDEPENDENCIES=ncurses util-linux
> >  ----
> >  
> > +----
> > + $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES DEFINE_VARS=YES
> > + define BUSYBOX_DEPENDENCIES
> > + skeleton toolchain
> > + endef
> > + define BUSYBOX_FINAL_ALL_DEPENDENCIES
> > + skeleton toolchain
> > + endef
> > + define BUSYBOX_FINAL_DEPENDENCIES
> > + skeleton toolchain
> > + endef
> > + define BUSYBOX_FINAL_PATCH_DEPENDENCIES
> > + endef
> > + define BUSYBOX_RDEPENDENCIES
> > + ncurses util-linux'linux-pam skeleton toolchain host-skeleton host-ccache
> > + endef
> > +----
> > +
> >  ----
> >   $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES QUOTED_VARS=YES
> >   BUSYBOX_DEPENDENCIES='skeleton toolchain'
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
