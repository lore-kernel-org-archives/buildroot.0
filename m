From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 17:56:04 +0200
Subject: [Buildroot] [PATCH 1 of 7 v3] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <CAAXf6LXgYEvcWKxFry8GR8sfC64K2iMEuQLZPBf9YWTXd-eVCA@mail.gmail.com>
References: <patchbomb.1402085576@localhost>
 <b1861ead49778767b075.1402085577@localhost>
 <20140607104959.70b268b8@free-electrons.com>
 <CAAXf6LXgYEvcWKxFry8GR8sfC64K2iMEuQLZPBf9YWTXd-eVCA@mail.gmail.com>
Message-ID: <20140611175604.4e1ac2d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 8 Jun 2014 16:29:45 +0200, Thomas De Schampheleire wrote:

> In this case the (original) construct is:
> Target case:
>     FOO_BAR ?= $(FOO_BAR)
> 
> Host case:
>     HOST_FOO_BAR ?= $(FOO_BAR)
> 
> For the target case there would be a circular reference, and the
> statement doesn't make sense anyway.
> To solve this, an extra check $(ifeq $(4),host) is really needed.
> For the host case, if HOST_FOO_BAR is not yet set, it is set equal to
> the value of FOO_BAR. FOO_BAR may or may not be set previously: there
> is no default value at play here.
> 
> A very important thing to understand here, construct (a)
>     HOST_FOO_BAR ?= $(FOO_BAR)
> is not equivalent to (b)
>     ifndef HOST_FOO_BAR
>       HOST_FOO_BAR = $(FOO_BAR)
>     endif
> 
> because 'ifdef' checks for a *non-empty value* while '?=' checks for
> *set or not set*.
> Since the .mk can have a statement like:
>     FOO_PATCH = blaat.patch
>     HOST_FOO_PATCH =
> the second form (b) above will still set HOST_FOO_BAR to FOO_BAR which
> is not what we want.
> 
> 
> I hope the above is more clear to you, please let me know.
> 
> It is clear that the code is non-trivial, but I don't know if and how
> we should document all this.
> What do you think?
> Do also let me know if you expect changes in the patch or commit
> message to make any of this clear.

Thanks a lot for the detailed explanation! Definitely very useful, as
I now understand better the logic behind these additional ifeq
($(4),host) tests. We probably need to add more comments in
pkg-generic.mk, but that's clearly unrelated to your patch, and can be
handled later on.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
