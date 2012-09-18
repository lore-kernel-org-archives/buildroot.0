From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 19:55:18 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind
 options BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120918195518.163c409d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 17 Sep 2012 00:57:55 +0200, Yann E. MORIN wrote:
> Introduce two new blind config options:
>   - BR2_NEEDS_GETTEXT
>         selects the gettext package if the toolchain does not provide it
>   - BR2_NEEDS_GETTEXT_IF_LOCALE
>         ditto, but only if locales are enabled
> 
> Packages can then select either if they require gettext (resp. if locales
> are enabled).
> 
> This will simplify the packages Config.in by no longer requiring that the
> 'select' be conditional, thus hiding the gory details out of packages,
> which don't really need to know about those details.

Nice.

> Also, introduce four new Makefile variables:
>   - $(gettext)
>         contains the needed dependencies for pacakges that need gettext
>         functioanlity: 'gettext' if the gettext pacakge is needed, empty
>         otherwise
>   - $(gettext-if-locale)
>         ditto, but only if locales are enabled
>   - $(gettext-LDFLAGS)
>         contains the required LDFLAGS ("-lintl") if gettext is provided by
>         the gettext package, empty otherwise
>   - $(gettext-LDFLAGS-if-locale)
>         ditto, but only if locales are enabled
> 
> Packages can then add either variable to their own LDFLAGS.

I am happy about the entire patch set, except those $(gettext),
$(gettext-if-locale), $(gettext-LDFLAGS) and
$(gettext-LDFLAGS-if-locale) variables. Even though they admittedly
make the code a bit shorter, I think they needlessly hide what is
really happening. I very much prefer an explicit:

FOO_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)

(which doesn't use any special construct)

rather than the more strange:

FOO_DEPENDENCIES += $(gettext)

I know I'm annoying by rejecting many new additional constructs, but I
think such constructs are crossing the boundary of shortness vs.
readability.

Of course, this is only my opinion, and if others are strongly in
favor of this approach, then I'll learn to live with it, but I think
it's a dangerous direction for the readability of .mk files. If you
respin your patch set without those constructs, you'll have my Acked-by
on the whole thing.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
