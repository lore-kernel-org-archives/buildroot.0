From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 21:39:43 +0200
Subject: [Buildroot] [PATCH v4 2/3] pkg-generic: fix rules for top-level
 parallel make
In-Reply-To: <CAHkwnC-pwVUF0=7Og_XucpTPfJDNut9oXk=Y5oxQm1otHMzNRg@mail.gmail.com>
References: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
 <1379404753-3471-3-git-send-email-fabio.porcedda@gmail.com>
 <20130917202343.3b714fad@skate>
 <CAHkwnC-pwVUF0=7Og_XucpTPfJDNut9oXk=Y5oxQm1otHMzNRg@mail.gmail.com>
Message-ID: <20130919213943.44f7a215@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 19 Sep 2013 08:53:07 +0200, Fabio Porcedda wrote:

> > On Tue, 17 Sep 2013 09:59:12 +0200, Fabio Porcedda wrote:
> >> To be able to use top-level parallel make we must don't depend in a rule
> >
> > must don't -> should not
> 
> Maybe "must not" because is a requirement and not a suggestion?

I am not a native english speaker, but my vague memories from my
english lessons are that while "must" indicates an obligation, "must
not" does not indicate an interdiction, while "should not" does. Well,
a little bit of googling suggests I'm wrong. According to
http://www.englishpage.com/modals/must.html:

"""
"Must not" can be used to prohibit actions, but this sounds very
severe; speakers prefer to use softer modal verbs such as "should not"
or "ought not" to dissuade rather than prohibit. 
"""

So I believe you're right, we can keep "must not" (but not "must
don't"). Sorry for the noise.

> > Why is $$($(2)_TARGET_PATCH) an order-only dependency? Why isn't the
> > configure -> patch dependency handled like all the others, using stamp
> > files dependencies?
> 
> I'm using an order-only dependency just to use a single line, i can
> splt both rules:
> 
> $$($(2)_TARGET_CONFIGURE):   | $$($(2)_DEPENDENCIES)
> 
> ifeq
> ...
> $$($(2)_TARGET_CONFIGURE):   $$($(2)_TARGET_PATCH)
> ...
> else
> ...
> $$($(2)_TARGET_CONFIGURE):   $$($(2)_TARGET_RSYNC)
> ...
> endif
> 
> Do you like it?

I think it would be clearer. Also, it should be same for the other
dependencies between steps. Rather than putting them in the
$(BUILD_DIR)/%/.stamp_<something> rules, you could put them in the
$$($(2)_TARGET_<SOMETHING>) rules so that they are all at the same
place, no?

> If instead are you asking the reason because i have not used a %-rule,
> is because that dependency is a conditional dependency that depends on
> the value of $$($(2)_OVERRIDE_SRCDIR) and i don't know i way to use
> that variable in a %-rule.
> Do you have some suggestion about that?

See my suggestion above (if it works, of course).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
