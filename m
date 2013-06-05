From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Jun 2013 00:41:51 +0200
Subject: [Buildroot] [RFC] Revive the _AVAILABLE stuff from last year
Message-ID: <20130605224151.GF3185@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This is an attempt at reviving the _AVAILABLE stuff from last year.

Basically (as much as I recall) the problem stems from the fact that some
packages depends on toolchain features, or some architecture. So, they can
not 'select' those features, since the toolchain may be external, and not
changeable; this is even more true for an architecture: we can't tweak the
kernel code, even less the silicon in the CPU.

So, we have to propagat such dependencies down to dependent packages, in
a kind of endless cascade. This so much true for libraries, since we want
to inform the user why a "program" is not available, not what libraries
it is missing (otherwise the user would have to go to each library and
check each dependency of the libraries, which can be tedious).

This situation is not solvable in pure Kconfig syntax.

The idea behind _AVAILABLE is two fold:

 1. dependencies of a package are moved to their own symbol, and
    the package depends on that symbol;

 2. packages that need the above package add this new symbol to their
    own list of dependencies, so the actual package symbol can then
    'select' the needed package's symbol.

Since this is not really easy to follow, here is a small example with
two (simple) packages:

    ---8<--- foo ---8<---
    config BR2_PKG_FOO_AVAILABLE
        def_bool y
        depends on BR2_threads

    config BR2_PKG_FOO
        bool "foo"
        depends on BR2_PKG_FOO_AVAILABLE
    ---8<--- foo ---8<---

    ---8<--- bar ---8<---
    config BR2_PKG_BAR_AVAILABLE
        def_bool y
        depends on BR2_PKG_FOO_AVAILABLE

    config BR2_PKG_BAR
        bool "foo"
        depends on BR2_PKG_BAR_AVAILABLE
        select BR2_PKG_FOO
    ---8<--- foo ---8<---

A bit of explanations are needed:

  - BR2_PKG_BAR_AVAILABLE depends on BR2_PKG_FOO_AVAILABLE, so it
    inherits the same dependencies as BR2_PKG_FOO

  - BR2_PKG_BAR depends on BR2_PKG_BAR_AVAILABLE, so it also inherits
    the same dependencies as BR2_PKG_FOO

  - BR2_PKG_BAR can then freely select BR2_PKG_FOO

**
**  This can be summarised as: if BR2_PKG_FOO is not
**  available, then BR2_PKG_BAR will not be either.
**

So far, so good: we have solved the infamous 'select unmet dependencides'
problem. The developpers are happy, they do not have to manually propagate
the dependencies all the way down the drain.


However, this comes@a cost to usability. Currently, packages that can
not be selected because of missing dependencies have a comment saying
what those deps are, as in:

    ---8<--- foo ---8<---
    comment "foo requires a toolchain with threads"
        depends on !BR2_threads

    config BR2_PKG_FOO
        bool "foo"
        depends on BR2_threads
    ---8<--- foo ---8<---

    ---8<--- bar ---8<---
    comment "bar requires a toolchain with threads"
        depends on !BR2_threads

    config BR2_PKG_BAR
        bool "bar"
        depends on BR2_threads  # foo
        select BR2_PKG_FOO
    ---8<--- bar ---8<---

So, in bar, we expose the dependencies of foo, and instruct the user of
what to change, so that the dependency chain of bar is solved, rather than
stating a dumb "foo requires bar", which would have the user hunt down the
dependencies of foo (and so on recursively).

So, the _AVAILABLE transition, as it was last submitted, would loose this
usability pattern, to trade for a bit more of easiness for the developper,
at the expense of usability for the user.

**
** Any transition to an _AVAILABLE implementation
** should retain our current usability expectations.
**


Here is what I propose:
  - keep the _AVAILABLE semantics as discussed above
  - keep the comment, but formalise it, like:
        comment "foo requires FEAT1 and FEAT2"
  - require that the comment always comes first (or last, whatever)
  - add a script that checks the message is correct:
    - can be called manually on one package:    suport/scripts/check-pkg foo
    - or can be called on all packages:         make check-packages

Ideally, that script would try to fix the comment if possible. In any case,
it would inform the user about inconsistencies.


Well, this was a bit longer than I expected; I hope I did not forget
anything important for this revival thread.

Thanks for reading so far! :-)

Regards,
Yann E. MORIN.
