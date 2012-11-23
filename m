From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Nov 2012 15:59:07 +0100
Subject: [Buildroot] [PATCH for-2012.11 0/5] Introduce errors for legacy
	API
In-Reply-To: <87wqxn5cu6.fsf@dell.be.48ers.dk>
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
 <87wqxn5cu6.fsf@dell.be.48ers.dk>
Message-ID: <50AF8F3B.9090504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/12 12:23, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>  writes:
[snip]
>   Arnout>   Config options that are no longer supported are moved to
>   Arnout>  Config.in.legacy.  When any of these is selected in an old
>   Arnout>  .config file, a comment will appear to warn the user of it, and
>   Arnout>  it is possible to see which option caused the error in the new
>   Arnout>  'Check legacy' menu.  Unselecting that menuconfig disables all
>   Arnout>  the legacy options in one go.
>
> Is there ever any use case for not checking for legacy stuff?

  Maybe not. Easy enough to remove the condition around the check.

> I like it, the only problem is that the legacy warnings are shown as
> options when they are really warnings/instructions to the user about
> what has changed/what needs to get fixed.
>
> I played around with making the options hidden and instead display a
> comment when it is selected - E.G:
>
> config BR2_PACKAGE_LIBINTL
>     bool
>     select BR2_LEGACY
>     select BR2_PACKAGE_GETTEXT
>
> config BR2_PACKAGE_LIBINTL
>     bool
>     select BR2_LEGACY
>     select BR2_PACKAGE_GETTEXT
>
> if BR2_PACKAGE_LIBINTL
> comment "libintl is now installed by selecting"
> comment "BR2_PACKAGE_GETTEXT. This now only installs the"
> comment "library, not the executables."
> endif
>
> The syntax is not so nice as kconfig doesn't support multi line
> comments, but OK. More importantly, hidden symbols like
> BR2_PACKAGE_LIBINTL seems to be ignored when the .config is read (which
> is what we normally want so they can be disabled again) so this only
> works when a custom package selects BR2_PACKAGE_LIBINTL, not if the user
> has manually enabled it.

  I see this as a major problem.  I think most use cases in the Config.in
will be for user-selectable options that are no longer available, like
BR2_PACKAGE_GETTEXT_STATIC and BR2_PACKAGE_INPUT_TOOLS_EVTEST.
BR2_PACKAGE_LIBINTL is one that is normally used in select statements,
but that's a bit exceptional.

  In addition, if they are blind options, they will just disappear after running
silentoldconfig.  The comment will get printed, but who will see that between
all the other output?

>
> Anybody with a better idea?
>
>   Arnout>   If any such option remains, 'make' will fail immediately with
>   Arnout>  a message that legacy options are still selected.  However, if
>   Arnout>  BR2_DEPRECATED is selected, that error message is suppressed.
>
> Would it make sense to still warn (but not halt) when DEPRECATED is
> enabled?

  The problem with warnings is that we produce so much output that they'll
just be hidden. They would make sense if an error follows soon after. But
in all likelihood, if an error follows, it will be much further down.

  [snip]

  So, is there still anything that I should change?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
