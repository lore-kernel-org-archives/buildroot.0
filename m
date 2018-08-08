From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Aug 2018 22:45:38 +0200
Subject: [Buildroot] Setting BLUEZ5_UTILS_AUTORECONF=YES outside of
 bluez5_utls.mk
In-Reply-To: <CAF_dkJAeTBh8iC1Tmbrdojpd6avvbdFQT4M0J5cP706Z2Z9Wkg@mail.gmail.com>
References: <CAF_dkJB_UGTGs+MU7Pco2ViXZg4at1-KHAbA8gUv2LKht2fgdg@mail.gmail.com>
 <CAF_dkJAeTBh8iC1Tmbrdojpd6avvbdFQT4M0J5cP706Z2Z9Wkg@mail.gmail.com>
Message-ID: <185952e5-e100-3f0a-7d27-d113bec49a0c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-08-18 21:51, Patrick Doyle wrote:
> On Tue, Aug 7, 2018 at 3:52 PM I <wpdster@gmail.com> wrote:
>> Is it possible to set BLUEZ5_UTILS_AUTORECONF=YES outside of bluez5_utils.mk?

 As it happens, you can do it with local.mk (i.e. the file specified by
BR2_PACKAGE_OVERRIDE_FILE). It *happens* to work for bluez5_utils, because the
package .mk file doesn't set that variable at all.

 Doing the reverse would not be possible (i.e. avoid autoreconf'ing a package
that already sets _AUTORECONF to YES).

> 
> I tried the following approach, and it worked.  I am curious to get
> some feedback regarding this, or perhaps a better way to do this:
> 
> I have a custom package, FOO, with a foo.mk.  Inside foo.mk, I placed
> 
> ifeq ($(BR2_PACKAGE_FOO),y)
> BLUEZ5_UTILS_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK

 You could do this unconditionally, and you could do it in external.mk instead.

 However, it is not sufficient, you also have to add host-automake etc. to
BLUEZ5_UTILS_DEPENDENCIES. And that doesn't work, because the package .mk file
overwrites that variable (so setting in local.mk has no effect), and in
external.mk it's already too late (because the variable is used immediately when
the autotools-package macro is expanded). This *happens* not to be a problem in
this case, because libglib2 is already autoreconf'ed so the dependencies are
already there.

 Regards,
 Arnout

> endif
> 
> I will always include FOO in my build, so it seems that when I do
> this, I will always force bluz5-utils to run its autoreconf.
> 
> Is there a better way I could do this?
> 
> --wpd
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
