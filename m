From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 15 Aug 2012 04:56:00 -0500
Subject: [Buildroot] Open question: remove "toolchain on target" option
In-Reply-To: <20120811202114.3a95d4ab@skate>
References: <20120811202114.3a95d4ab@skate>
Message-ID: <201208150456.03396.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat August 11 2012, Thomas Petazzoni wrote:
> So, rather than having a bad and dysfunctional mechanism to have a
> toolchain on the target, I would suggest that we simply get rid of it.
> 

I think slowly but have had a few days to consider this Open Question.

Let me see if I can make a proposal that will encompass both of our
opinions.

To re-cap:
Once upon a time, it was decided that crosstool-ng be integrated with
Buildroot with the eventual goal of making it the replacement for the
internal BR toolchain generation.

Time passes (over a year now if memory serves) and the integration of
crosstool-ng is in a well developed state.

crosstool-ng was never intended to do Canadian Cross toolchain builds.

The (old) BR toolchain generation can only create uClibc based toolchains.

To complete that long-ago set project development goal means dropping the
(old) BR toolchain generation.
Which means, as a side effect, dropping the ability to generate a native
toolchain for the target (the (old) internal toolchain generator is the
only one that can do something like a Canadian Cross).

For this proposal, I'll ignore bit-rot, bit-rot "just happens" to everything.

Moving forward:

To reach the goal set of only having one "internal" toolchain generator 
(crosstool-ng integrated) -
Pull the dysfunctional (old) toolchain generator.

That takes care of T.P.'s suggestion above and the project's development goal.

Which leaves me and others without any target native toolchain generation. . . .

There are basically two ways to address that lack;

Add the external toolchain components as "packages" ;

Add an external CanadianCross-ng build support, as crosstool-ng once was,
prior to its integration.

At first glance, it might seem that the first path is the shorter one, until
you start to consider some of the problem details.
Just forget I mentioned choice #1 above.  ;)

I make my suggestion the choice #2 above - an external "CanadianCross-ng"
build system add-on, called from BR with BR variables.

Although the larger, up front, development path (without any interested
developers at the moment), I think over the long term it will be the less
work to maintain.  Also would be more practical to support other than uClibc
based, native toolchain builds.

A for instance, some current "corner cases" -
The oldest BR supported gcc (4.2) is too old to build glibc ;

Some build paths for the external libraries required for (optional now) gcc
options (equation solving and optimization) lead you into requiring C++ ;

I have yet to get those packages to build against uClibc++, even in a native
(ARMel) environment, let alone in a CanadianCross environment.
(Of course, that might be "operator error" at my keyboard.)

There might be better examples than the ones I give above in support of an
external "CanadianCross-ng" builder but the point remains - the build 
considerations would be more easily met by an external package than by
internal package defines.

Mikez
