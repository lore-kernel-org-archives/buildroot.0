From: yann.morin at orange.com <yann.morin@orange.com>
Date: Mon, 30 Mar 2020 15:06:27 +0200
Subject: [Buildroot] RFC: make pkg-docs
In-Reply-To: <CANQCQpY41qCvbX+PQr0oJrY82tax_D7nxtwdAMzVZNvpMvYsfw@mail.gmail.com>
References: <CANQCQpY41qCvbX+PQr0oJrY82tax_D7nxtwdAMzVZNvpMvYsfw@mail.gmail.com>
Message-ID: <4827_1585573594_5E81EEDA_4827_19_1_20200330130627.GH15392@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matthew, All,

On 2020-03-30 07:46 -0500, Matthew Weber spake thusly:
> I thought I'd pass on an idea a teammate had that seemed like the next
> evolution of what Buildroot is already doing with make legal-info.
> 
> The idea is to add a new make target that collects up all the package
> docs in whatever form they are presented and then organize them in a
> folder set similar to legal-info by package name.  This hook doesn't
> attempt to build them or do anything beyond organize the set of
> material for release with possibly the SDK or a post-build activity
> that hooks in to render that content as part of a larger report
> outside of the Buildroot build.
> 
> Beyond all the Buildroot packages, in a br2-external use case this
> becomes handy as a way to present a folder of material for inclusion
> into larger documentation renderings.
> 
> The most basic option would be to just list out what we'd want copied.
> The only negative thing is that this requires a bunch of manual work
> to setup all the file lists.
> 
> LIBFOO_DOC_FILES = doc/foobar.asciidoc release_notes.txt
snip
> Thoughts?  Anyone else have a use case where this would be beneficial to have?

What we've done here, is to let packages handle docs however they want.
Packages that want to build and install docs would do:

    define FOO_ORANGE_DOC_BUILD_CMDS
        make -C @(D)/doc
    endef
    define FOO_ORANGE_DOC_INSTALL_CMDS
        make -C @(D)/doc install DESTDIR=$(BASE_DIR)/doc
    endef

See https://elinux.org/images/8/8e/2017-10-24_-_ELCE-Buildroot.pdf slide
23 (except that since then, the commands are now automatically added to
the post hooks).

I think Buildroot should not enforce anything more than that. This is
the most flexible.

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
