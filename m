From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 3 Sep 2013 13:42:39 +0200
Subject: [Buildroot] [PATCH 2 of 9 v4] Config.in.legacy: update
 description for users
In-Reply-To: <20130903091818.616d6665@skate>
References: <patchbomb.1378152469@argentina>
 <ac4d080274a06689e8d4.1378152471@argentina>
 <20130902225514.7d9323cc@skate> <52257EA4.9030001@mind.be>
 <20130903091818.616d6665@skate>
Message-ID: <CAAXf6LWNRK1fZMQfMU5w52NzgyG+HL1VbXPU1o5FuFQ+eNBFEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Tue, Sep 3, 2013 at 9:18 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 03 Sep 2013 08:16:04 +0200, Arnout Vandecappelle wrote:
>
>> >>   if BR2_LEGACY
>> >>   comment "Your old configuration uses legacy options that no  "
>> >> -comment "longer exist in buildroot.                          "
>> >> -comment "Please look at the options which have been selected "
>> >> -comment "and read their help text.                           "
>> >> -comment "As long as these options stay selected, the build   "
>> >> +comment "longer exist in buildroot, as indicated in the menu "
>> >> +comment "below. As long as these options stay selected, or in"
>> >> +comment "case of string options are non-empty, the build     "
>> >>   comment "will fail.                                          "
>> >> +comment "*                                                   "
>> >> +comment "Where possible, an automatic conversion from old to "
>> >> +comment "new symbols has been performed. Before making any   "
>> >> +comment "change in this legacy menu, make sure to exit the   "
>> >> +comment "configuration editor a first time and save the      "
>> >> +comment "configuration. Otherwise, the automatic conversion  "
>> >> +comment "of symbols will be lost.                            "
>> >
>> > This really seems ugly for users, no? I know it's been discussed, but
>> > can you summarize why this should be done by our users?
>>
>>   I.e., add "because of Kconfig limitations", right?
>
> That I understood, but for my own culture, can you summarize what are
> those limitations? Maybe it would be good to document them in the big
> fat comment inside Config.in.legacy (not the one shown to the user, but
> the one inside the source code). Having to exit menuconfig, and restart
> it doesn't seem like a really great thing, so I'd like to understand
> why we need that, and what are our options to maybe solve this in the
> future.
>

The basic problem is that kconfig seems to remember how a given symbol
was selected, *within one kconfig session*. 'How' can be: explicitly
selected by the user, or selected through a 'select' statement of
another symbol. In the latter case, when the first symbol is disabled,
the 'selected' symbol is also automatically disabled.
When you start a new kconfig session (by saving the configuration and
reopening it) kconfig has no clue anymore about how the different
symbols became selected, because clearly there is no indication about
this whatsoever in the .config file.

Applied to the legacy symbols: suppose symbol FOO is renamed into BAR,
and we have made the legacy symbol FOO 'select' the new symbol BAR
through Config.in.legacy. The user opens the menuconfig, sees that
there is something in the legacy menu, reads the help text, goes to
the menu where FOO used to be selected, sees that BAR is already
correctly selected thanks to the automatic propagation, and decides to
clear the legacy FOO symbol in the legacy menu. Then he saves the
configuration.
If you check the .config file afterwards (or even if you check the BAR
symbol after deselecting FOO before exiting menuconfig) you will see
that BAR is no longer selected. The only way to saveguard that is by
saving the configuration before fiddling with the legacy menu, thereby
'flattening' the symbols.

Provided we want automatic propagation of symbols (boolean or
otherwise), I don't see another solution.
See also the other thread where you asked whether it's at all logical
to have something in legacy for such renames.

Best regards,
Thomas
