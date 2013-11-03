From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Nov 2013 12:17:11 +0100
Subject: [Buildroot] [PATCH] util-linux: disable fallocate for avr32
In-Reply-To: <20131103110613.GB3615@free.fr>
References: <1383472585-1876-1-git-send-email-spdawson@gmail.com>
 <20131103113407.2b5cf76c@skate> <20131103110613.GB3615@free.fr>
Message-ID: <20131103121711.4c67418f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 3 Nov 2013 12:06:13 +0100, Yann E. MORIN wrote:

> > I'm Cc'ing Arnout, Peter, Yann and Thomas DS on this one, because we
> > really need to define a policy on this topic.
> 
> Our stance has always been 'no feature-patch in Buildroot'.
> OTOH, I can understand that fallocate is really required (being in
> POSIX).
> 
> But since uClibc is highly configurable, it could happen that an
> external toolchain would have fallocate disabled (being in Advanced
> RT in POSIX).

True, but our position on the matter has more or less always been: the
external uClibc toolchain should have a uClibc configuration similar to
the one we have in Buildroot. We cannot support any random uClibc
configuration.

But it's hard to require external toolchains to have uClibc features
that are not even part of a uClibc stable release.

> So, I'm a bit fuzzy as to what we should do here.
> 
> The best approach would be to push all of our changes upstream uClibc,
> and hope for a release soon, so we can bump. But it looks like upstream
> is not really alive those days.

All the feature patches we have for uClibc are already upstream: they
are precisely backported from upstream... waiting for an upstream
release to occur.

> Another approach would be to add yet one more toolchain knob that tells
> whether the toolchain has fallocate (defaults to 'y' for (e)glibc and
> internal, prompts for external uClibc).

True, but that doesn't scale really nicely to the crazy number of
features. For example, systemd needs execvpe(), which is not in uClibc
0.9.33, but is available in our uClibc thanks to a backported patch.
Should we also add another config know for execvpe() ?

> My preference would be to remove feature-patches, but that is really
> gonna hurt newcomers (and may bite long-timers as well).

I believe the only reasonable solutions are (alternatively, and the
choice can be made differently per-package) :

 (1) Add patches to the package to avoid usage of unimplemented uClibc
     features (when possible)

 (2) Mark the packages as depends on !UCLIBC

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
