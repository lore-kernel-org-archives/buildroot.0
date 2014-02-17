From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Feb 2014 22:37:29 +0100
Subject: [Buildroot] [PATCH 1/1] manual/faq: add section about why no
 binary packages
In-Reply-To: <CANxTyt68QiKO_qyqkUtQ5wHHtA8xuTk18uf6e9jatLZ-AK24UA@mail.gmail.com>
References: <cover.1392659250.git.yann.morin.1998@free.fr>
 <430595ea81c22aef392d3aec25cc93ef9af7bd47.1392659250.git.yann.morin.1998@free.fr>
 <CANxTyt68QiKO_qyqkUtQ5wHHtA8xuTk18uf6e9jatLZ-AK24UA@mail.gmail.com>
Message-ID: <20140217213729.GC3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-02-17 15:21 -0500, Danomi Manchego spake thusly:
> Nit-picky writing editorial - no issue with the actual content ...

Thank you!

My answers below...

> On Mon, Feb 17, 2014 at 12:52 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > +[[faq-no-binary-packages]]
> > +Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
> > +----------------------------------------------------------------
> > +
> > +One feature that is often discussed on the Buildroot list, is the
> 
>  no comma

Fixed.

> > +the general topic of "package management". To summarize, the idea
> > +would be to add some tracking of which Buildroot package installs
> > +what files, with the goals of:
> > +
> > + * Being able to remove files installed by a package when this package
> > +   gets unselected from the menuconfig ;
> 
> ; -> .

I am not so sure: this is a list, and to me the second bullet-point is
included in that sentence.

> > + * Ultimately, be able to generate binary packages (ipk or other
> > +   format) that can be installed on the target without re-generating a
> > +   new root filesystem image.
> 
> There's some tense inconsistency here between the first point ("Being
> able to...") and the second ("be able to...")

Fixed.

> > +In general, most people think it is easy to do: just track which package
> > +installed what and remove it when the package is unselected. However, it
> > +is much more complicated than that:
> > +
> > + * It is not only about the +target/+ directory, but also the sysroot in
> > +   +host/usr/<tuple>/sysroot+ and the +host/+ directory itself. All files
> > +   installed in those directories by various packages must be tracked.
> > +
> > + * When a package is removed, it is not sufficient to remove just the
> > +   files it installed. One must also remove all its reverse
> > +   dependencies (i.e packages relying on it) and rebuild all those
> > +   packages. For example, package A depends optionally on the OpenSSL
> > +   library. Both are selected, and Buildroot is built. Package A is
> > +   built with crypto support using OpenSSL. Later on, OpenSSL gets
> > +   unselected from the configuration, but package A remains (since
> 
> remains (since ,,, possible).  ->   remains.  (Since ... possible.)

The phrase between parentheses is part of the previous sentence, so no
upper-case is needed for 'since'.

However, the english grammar rules dictate that the terminating punctuation
be inside the parentheses, not outside. Fixed.

> > +   OpenSSL is an optional dependency, this is possible). If you just
> > +   remove the OpenSSL files, then the files installed by package A are
> > +   broken: they use a library that is no longer present on the
> > +   target. Technically, it is possible to do this (the prototype that
> > +   Lionel Landwerlin and Thomas Petazzoni have worked on started to do
> > +   this), but it is difficult and adds a fair bit of complexity.
> 
> "a fair bit of" may be colloquial.  Maybe change to "a lot of"?

Well, I like the turn of phrase, as it emphasises the fact that it is
not easy (see eg. http://www.merriam-webster.com/dictionary/fair
defintion 10b: moderately numerous, large, or significant).

> > + * In addition to the previous problem, there is the case where the
> > +   optional dependency is not even known to Buildroot. For example,
> > +   package A in version 1.0 never used OpenSSL, but in version 2.0 it
> > +   automatically uses OpenSSL if available. If the Buildroot .mk file
> > +   hasn't been updated to take this into account, then package A will
> > +   not be part of the reverse dependencies of OpenSSL and will not be
> > +   removed and rebuilt when OpenSSL is removed. For sure, the .mk file
> > +   of package A should be fixed to mention this optional dependency,
> > +   but in the mean time, you can have non-reproducible behaviors.
> > +
> > + * The whole idea is also to allow changes in the menuconfig to be
> 
> Too conversational:  "whole idea".  Maybe "idea" or "implied goal"?

I've rephrased that to read:
    The request is to also allow changes in the menuconfig [...]

> > +   applied on the output directory without having to rebuild
> > +   everything from scratch. However, this is very difficult to achieve
> > +   in a reliable way: what happens when the suboptions of a package
> > +   are changed (we would have to detect this, and rebuild the package
> > +   from scratch and potentially all its reverse dependencies), what
> > +   happens if toolchain options are changed, etc. At the moment, what
> > +   Buildroot does is clear and simple so its behaviour is very
> > +   reliable and it is easy to support users. If we start telling users
> > +   that the configuration changes done in menuconfig are applied after
> 
> "If we start telling users that" may be too conversational.  Maybe "If
> we claim that"?

I've rephrased that to read:
    If configuration changes done in menuconfig are applied after the
    next make [...]

> > +   the next make, then it has to work correctly and properly in all
> > +   situations, and not have some bizarre corner cases. We fear bug
> > +   reports like "I have enabled package A, B and C, then ran make,

I've rephrased "We fear bug reports like [...]" to read:
    The risk is to get bug reports like [...]

> > +   then disabled package C and enabled package D and ran make, then
> > +   re-enabled package C and enabled package E and then there is a
> > +   build failure". Or worse "I did some configuration, then built,
> > +   then did some changes, built, some more changes, built, some more
> > +   changes, built, and now it fails, but I don't remember all the
> > +   changes I did and in which order". This will be impossible to
> > +   support.
> > +
> > +For all these reasons, the conclusion is that adding tracking of
> > +installed files to remove them when the package is unselected, or to
> > +generate a repository of binary packages, is something that is very
> > +hard to achieve reliably and will add a lot of complexity.
> > +
> > +On this matter, the Buildroot developpers make these position statements:
> 
> developpers -> developers

Fixed.

> > + * Buildroot strives at making it easy to generate a root filesystem
> 
> strives at making  ->  strives to make

Fixed.

> > +   (hence the name, by the way). That is what we want to make Buildroot
> > +   good at: building root filesystems.
> > +
> > + * Buildroot is not meant to be a distribution (or rather, a distribution
> > +   generator). It is the opinion of most Buildroot developers that this
> > +   is not a goal we should pursue. We believe that there are other tools
> > +   better suited to generate a distro than Buildroot is. For example,
> 
> than Buildroot is.  ->  than Buildroot.

In fact, not. This is a (double?) ellipsis of the adjectival clause
'suited to generate a distro', ellipsis which stands for (the parts
between {} are the two ellipsises):
    [...], than Buildroot is {suited to {generate a distro}}.

If there were no adjectival clause, we would write:
    There are other tools better than Buildroot.

Thanks for the review!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
