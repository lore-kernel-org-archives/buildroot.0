From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Mar 2016 18:57:24 +0100
Subject: [Buildroot] [PATCH v2 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <56DF5DFB.1050309@mind.be>
References: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
 <20160308221049.GB14289@free.fr> <56DF5DFB.1050309@mind.be>
Message-ID: <20160309175724.GA3603@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, J?r?me, All,

On 2016-03-09 00:19 +0100, Arnout Vandecappelle spake thusly:
> On 03/08/16 23:10, Yann E. MORIN wrote:
> >J?r?me, All,
> >
> >On 2016-03-08 22:48 +0100, J?r?me Pouiller spake thusly:
> >>It is handy to use local.mk or external.mk to add specific targets
> >>for current project. However, until now, it not possible to add help
> >>message these targets.
> >
> >I have:
> >
> >     $ make local-help
> >     Local blabla help displays here...
> >
> >>This patch add EXTRA_HELP variable. This variable is aimed to be assigned
> >>from any .mk files. Its content is displayed with 'make help'.
> >>
> >>For exemple:
> >>   EXTRA_HELP += "flash                  - Flash target"
> >>   EXTRA_HELP += "chroot                 - Chroot into target/"
> >>   EXTRA_HELP += "qemu                   - Run image with qemu"
> >>   EXTRA_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
> >>   EXTRA_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
> >>   EXTRA_HELP += "Please contact support at company.com in case of problem."
> >
> >This definitely does not look nice to me... :-(
> 
>  Why not? Extremely nice and simple.

It's not nice because:

  - it assumes a certain layout of the help texts. If/when we
    re-arrange our own help text, this local help text will no
    longer be properly indented;

  - the print stuff above *is* ugly;

  - the local help is intermixed with our own help text, which I find
    dubious, as it may lead users to believe those are native buildroot
    actions when it is not.

As for it being simple, it is not simple to write, as the print example
clearly demonstrate.

With the proposal I made in the second patch, it is far easier to do, as
the formatting would be done in a single place.

(the printf example would thus be simply:
    HELP += "$(var)-feature : Call $(var) feature"
)

> >What we could do, however, would be:
> >
> >   - in external.mk:
> >         BR2_HAS_EXTRA_HELP = YES  # Whatever non empty
> >
> >   - in the main Makefile:
> >
> >         help:
> >             blabla our current help
> >             $(if $(BR2_HAS_EXTRA_HELP),echo "  - local-help  to get local help blabla)
> >
> >which would be IMHO much much nicer and much much simpler...
> 
>  I don't see the advantage of that, to be honest... The point is to append
> it to the main help. You expect just a few lines of extra help text.

And the fact that it is mixed with our own help is one thing that I
don't like. I would probably agree to the following (accounting for
J?r?me's suggestion to reuse the same variable and your own suggestion
to change the separator):


    help:
        Our complete help goes here

    ifneq ($(BR2_EXTRA_HELP),)
        printf "Local, custom help:\n"
            for h in $(BR2_EXTRA_HELP); do \
                printf "  %-22.22s-%s\n" "$${h%%* : *}" "${h#* : }"; \
            done
    endif

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
