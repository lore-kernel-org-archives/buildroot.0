From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 19:36:05 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <539884A4.5060705@mind.be>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
 <20140610223358.69a70e6e@free-electrons.com>
 <CAHkwnC8N3v9ULfbqUeyjtCnb3Cpd6y=PPnwgjXBwSme6hywM5w@mail.gmail.com>
 <539884A4.5060705@mind.be>
Message-ID: <20140611193605.2adc70af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 11 Jun 2014 18:32:36 +0200, Arnout Vandecappelle wrote:

> >> target-finalize: $(TARGETS)
> >>         $(foreach hook,$(TARGET_FINALIZE_HOOKS),$(call $(hook),end,$(1),$($(PKG)_NAME))$(sep))
> 
>  I like this idea. Though it should actually be
> 
> $(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
> 
> (the call is redundant, the end is redundant, and $(1) and $(PKG) are not
> available).

Ah, yes, indeed, I copy/pasted the wrong example and did not fix it.
Indeed, my example came from pkg-generic.mk, where things are a bit
more complicated.

> > Using hooks was my initial proposition but Arnout suggested the above
> > solution and you and Perer liked it.
> > Have you changed your mind about using hooks?
> 
>  Actually, your initial proposition was:
> 
> -target-purgelocales:
> +target-purgelocales: $(filter-out target-purgelocales,$(TARGETS))
> 
>  And my comment was that I don't like this splitting of target-finalize over
> several make targets. It is that remark that lead to the thread below.
> 
>  With the hooks, you'll still have a single target-finalize rule that performs
> all the finalization and that simply depends on $(TARGETS).

True that was Fabio's initial proposal, but if you continue reading the
thread, you'll see that the solution Fabio is submitting right now is
one we suggested him to implement back then :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
