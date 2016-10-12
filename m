From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Oct 2016 23:28:50 +0200
Subject: [Buildroot] [PATCH] polarssl: deprecate on security grounds
In-Reply-To: <87insystb7.fsf@dell.be.48ers.dk>
References: <1476120393-19918-1-git-send-email-gustavo@zacarias.com.ar>
 <20161011122247.2dea9911@free-electrons.com>
 <87insystb7.fsf@dell.be.48ers.dk>
Message-ID: <a115faea-facf-516e-0569-4c9b86cd32ea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-10-16 19:13, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Mon, 10 Oct 2016 14:26:33 -0300, Gustavo Zacarias wrote:
>  >> The 1.2.x branch is no longer maintained and the latest release from the
>  >> maintained branches (2.3, 2.1, 1.3) were security releases, so more
>  >> likely than not 1.2 is affected.
>  >> In consequence switch shairport-sync to the openssl backend.
>  >> 
>  >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
>  > I'm fine with the principle, but..
> 
>  >> Config.in.legacy                         | 10 ++++++++++
> 
>  > ... with your change, we get two definitions of the
>  > BR2_PACKAGE_POLARSSL variable. The addition to Config.in.legacy should
>  > only take place when the package gets removed. Deprecated packages are
>  > meant to still allow the build to take place. But with the
>  > Config.in.legacy option having the same name, you can't build, because
>  > you're selecting BR2_LEGACY, which prevents the build from starting.
> 
>  > In fact, amusingly, with our process, "deprecating" a package means
>  > that it blindly disappears for users.
> 
> Yeah, that isn't really good. Perhaps we need to add a 'select
> BR2_NEEDS_DEPRECATED' to everything depending on BR2_DEPRECATED and add
> some logic to warn if BR2_NEEDS_DEPRECATED && !BR2_DEPRECATED?

 That doesn't work. If you keep the dependency on BR2_DEPRECATED, then the
symbol won't be selectable without BR2_DEPRECATED so it will be silently removed
from .config. If you remove the dependency on BR2_DEPRECATED, then the package
stays user selectable. In that case, the BR2_DEPRECATED option becomes a bit
useless (it just hides the warning comment), and it's easy for users to
accidentally select a deprecated package.


>  > But if you remove the package, we are warning the user by aborting the
>  > build, thanks to the Config.in.legacy mechanism.
> 
>  > So I'm wondering if we shouldn't simply drop the polarssl package
>  > altogether, in order to take advantage from the Config.in.legacy
>  > mechanism.
> 
>  > Yann, Peter, Arnout, what do you think?
> 
> Yes, I agree. Lets just remove it and add it to Config.in.legacy.

 I completely agree, BR2_DEPRECATED should be deprecated :-P. Really, I see no
point in "deprecating" a package or feature. It doesn't remove much of our
maintenance burden, except that it no longer appears in autobuilder results. But
the code is still there. When the deprecated package is eventually really
removed, you have to go through the entire tree again to check if there are some
hidden dependencies or whatnot on the package, so it actively adds to the
maintenance burden. And what does it bring to the user? That he can stumble on
for another 18 months with this deprecated package, but without support and
eventually the package gets removed anyway.

 No, it's as easy for the user to just revert the package removal or revive it
in BR2_EXTERNAL. In addition, the legacy support gives the user a warning,
sometimes a way to solve it, and a help text that can explain why the package
was removed.

 The only case where deprecation would make a little bit of sense is for version
deprecation (old binutils, gcc, kernel-headers versions), because those can't
easily be "fixed" in BR2_EXTERNAL. But they can be fixed with OVERRIDE_SRCDIR so
I'm still not convinced.


 You can task me with deprecating BR2_DEPRECATED during the devel days - mainly
documentation updates.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
