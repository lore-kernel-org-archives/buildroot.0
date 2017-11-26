From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Nov 2017 12:18:46 +0100
Subject: [Buildroot] [PATCH 4/9] arch/arm: do not allow soft-float for
 armv8a
In-Reply-To: <20171126111257.GA3101@scaer>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
 <bd6e8e2eaf13ecc5e45e360875cfff3494b86a8c.1504444617.git.yann.morin.1998@free.fr>
 <20170904172137.GB5223@scaer>
 <20171124230857.0b6e1648@windsurf.lan>
 <5508245a-3f6a-80b9-a7ad-b3b6bc5d5f9e@mind.be>
 <20171126111257.GA3101@scaer>
Message-ID: <20171126111846.GB3101@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On 2017-11-26 12:12 +0100, Yann E. MORIN spake thusly:
> On 2017-11-25 18:10 +0100, Arnout Vandecappelle spake thusly:
> > On 24-11-17 23:08, Thomas Petazzoni wrote:
> > > On Mon, 4 Sep 2017 19:21:37 +0200, Yann E. MORIN wrote:
> > >> Thomas, All,
> > >>
> > >> On 2017-09-03 15:17 +0200, Yann E. MORIN spake thusly:
> > >>> armv8a has made VFPv4 and NEON mandatory, so there is no point in
> > >>> allowing software floating point, even in 32-bit mode.  
> > >>
> > >> In fact, even though I'm pretty sure that OK in 64-bit, we might still
> > >> have a reason to do soft-float in 32-bit mode, if only for legacy
> > >> binary-only applications that were built as soft-float way back in the
> > >> (not so) good old days...
> > >>
> > >> In which case, we should instead depend on !BR2_ARCH_IS_64.
> > >>
> > >> Thoughts?
> > > 
> > > I'm hesitating on this one. I believe the use-case you mention makes
> > > sense, however I believe that it can still be supported with your
> > > proposed patch.
> > > 
> > > Indeed, even if you want to run a binary-only soft-float application,
> > > it doesn't prevent the rest of your system from using VFP, as long as
> > > you use EABI (and not EABIhf).
> > > 
> > > The whole reason why EABI passes floating-point arguments into integer
> > > registers is precisely to allow compatibility between soft-float code
> > > and hard-float code. Thanks to that, a soft-float function can call a
> > > hard-float function, and vice-versa.
> > > 
> > > Therefore, even if you have a binary-only soft-float application, there
> > > is really no reason to build the entire system soft-float.
> > > 
> > > So, I think your original patch is OK as-is. However, I still see one
> > > inconsistent thing: if we disallow soft-float because ARMv8-A mandates
> > > VFPv4, why would we allow soft-float for ARMv7-A cores that have a
> > > VFP ? To be consistent, we should also disallow soft-float.
> > > 
> > > Another way to think about this is: is it possible to build an AArch64
> > > soft-float system? do we want to allow the user to select what is
> > > *possible* or what makes sense?
> > 
> >  gcc aarch64
> 
> It's not about aarch64, it's about aarch32, i.e. an armv8a core running
> in 32-bit mode.
> 
> > doesn't have a float-abi option, so no it's not possible to build
> > with soft-float. So the depends on BR2_ARM_EABI is certainly needed.
> > 
> >  That said, I don't think it makes a lot of sense to add extra 'depends on'
> > lines just to avoid that the user would select an option that probably doesn't
> > make sense. We already make sure that the default is appropriate. Let's not make
> > our life more difficult.
> 
> It's not about making *our* lives more dificult or easier. It's about
> making the user's lives easier.
> 
> If there is a prompt that offers an option, but that has no impact on
> the resulting output, then that prompt should not exist. Otherwise, it
> is very confusing.

Damned, I hadn't finished my mail...

> >  So I'd say: reject this patch.

But seeing the argument from Thomas, yes it does not make sense to hide
soft-float anyway.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
