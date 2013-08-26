From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 00:03:46 +0200
Subject: [Buildroot] [PATCH] eglibc: defaults to SSP
In-Reply-To: <5219F1AD.10004@zacarias.com.ar>
References: <1374935524-5259-1-git-send-email-gustavo@zacarias.com.ar>
 <20130823210931.4f2323fc@skate> <5217BDD2.1020806@zacarias.com.ar>
 <20130825111144.052f703c@skate> <5219F1AD.10004@zacarias.com.ar>
Message-ID: <20130827000346.6abde816@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 25 Aug 2013 08:59:41 -0300, Gustavo Zacarias wrote:
> On 08/25/2013 06:11 AM, Thomas Petazzoni wrote:
> 
> > Ok, so if we try to summarize this:
> > 
> >  * The option to enable SSP should be in "Build options" and not in the
> >    "Toolchain" menu, because what it mainly does is adjust the
> >    CFLAGS/CXXFLAGS for all packages.
> > 
> >  * In the case of the internal toolchain backend, it would make surey,
> >    that the SSP support in the C library in enabled. I.e, nothing for
> >    eglibc/glibc, and enable SSP for uClibc.
> > 
> >  * In the case of the external toolchain backend, we would need to have
> >    an option like "Toolchain supports SSP?" that the user must fill in.
> >    But this would mean the "Use SSP" option in "Build options" would
> >    have to depend on the "Toolchain supports SSP?" option.
> > 
> > Something like that?
> 
> Yes, i'd add for the last point "if custom external toolchain" because
> we can determine if the predefined toolchain has ssp when it's
> bumped/added with an internal knob.

Sure.

> It's possible libssp might need to be handled (copied) for some external
> toolchains depending on age too and how they were configured.

Well, let's say we won't support this case for now :)

However, this brings me to the same question for mudflap support.
Mudflap is on one side a compiler feature and library, but also a
compiler flag that you must use to enable mudflap on a particular
binary.

Should we have a "Enable mudflap usage" option in "Build options" that
would build all binaries with -fmudflap, much like the "Enable SSP
usage" would build all binaries with SSP usage?

To be honest, I am not sure it makes a lot of sense to build *all*
binaries with mudflap enabled. I believe one would generally only build
a selection of its own libraries/applications with mudflap, mudflap
being an analysis tool rather than a "corrective" tool.

On the other hand, SSP is really a "corrective" feature in that it
prevents some security holes from being exploited. For that reason, it
makes sense to have a "Enable SSP usage" that passes
-fstack-protector-all to all packages.

Does this makes sense, or should Mudflap support also have the
possibility of being enabled for all packages?

Another question that comes to mind is that the "Enable SSP usage"
option would be in "Build options", which sits *before* the "Toolchain"
menu in menuconfig. However, the "Enable SSP usage" would only be
visible if SSP is enabled at the toolchain level, so that might be
confusing for the user. Thoughts?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
