From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 15:02:17 +0200
Subject: [Buildroot] libintl static linking issues - yet another spin
In-Reply-To: <c5d92f69-e151-293b-3b77-3b2b061d0e50@mind.be>
References: <20170326235320.448e802a@free-electrons.com>
 <db756f2e-3dda-2fcc-6035-3287b88acf29@mind.be>
 <20170328222525.005b27bb@free-electrons.com>
 <66e02263-8faf-0601-e3ba-18501de7c6ef@mind.be>
 <20170403130149.6ccffe4e@free-electrons.com>
 <b2eb7b3c-1205-a1c1-fdd2-bfb1bafcfa66@mind.be>
 <20170403141147.0376b102@free-electrons.com>
 <c5d92f69-e151-293b-3b77-3b2b061d0e50@mind.be>
Message-ID: <20170403150217.788f6130@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Apr 2017 14:45:12 +0200, Arnout Vandecappelle wrote:

>  And I guess musl also has it in a single libc? Yeah, I don't see a libintl
> there so I guess it's bundled.
> 
>  If we do enable the stubs in uClibc, and a packages links with -lintl, then in
> fact the full gettext will be used and the stubs are not even linked in
> (statically or dynamically), correct? In that case, we could indeed enable the
> stubs in uClibc. As a result, in static linking, any package that links with
> gettext but forgets an explicit -lintl will use the stubs instead of the full
> implementation. So the package still works, but without translations.

Does this actually work? Won't the linker complain about conflicting
symbols between libintl and libc? Are weak symbols in libc also working
in static linking scenarios?

>  As a side note, pretty much independent of this issue: I wonder if our
> BR2_NEEDS_GETTEXT_IF_LOCALE approach really is the right thing to do. It
> basically says: if a package is able to use translations, we force translations
> (by enabling gettext). Wouldn't it be much more appropriate to remove all those
> selects from Config.in, and instead just add to _DEPENDENCIES:
> $(if $(BR2_PACKAGE_GETTEXT),gettext) ? That allows the user to choose whether or
> not they want translations.

No, that's not what BR2_NEEDS_GETTEXT_IF_LOCALE says. What
BR2_NEEDS_GETTEXT_IF_LOCALE is really what it means: the package really
absolutely NEEDS gettext to be available if locale support is available
in the toolchain. I.e, with locale support enabled, the package would
*NOT* build if gettext is not available.

Of course, there might be incorrect uses of BR2_NEEDS_GETTEXT_IF_LOCALE
that don't follow this rule, and they should be fixed as you suggest,
but BR2_NEEDS_GETTEXT_IF_LOCALE remains needed for the case I explained
above. See the documentation:

"""
Packages that need gettext only when locale support is enabled should:

    use select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE in
    the Config.in file; 
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
