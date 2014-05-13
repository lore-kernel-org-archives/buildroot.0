From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 May 2014 20:09:45 +0200
Subject: [Buildroot] virtual-packages: the case for multiple providers
	selected
Message-ID: <20140513180945.GC3507@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

We have recently identified the reasons for some weird autobuilder
failures.

The failures happen when two or more providers of the same virtual
package are enabled at once in the same config.

Although this seems like a minor issue, as a carefull user will probably
never generate such a config on purpose, we're still exposed to this
isue for two reasons:

  - the autobuilders do random configurations to stress-test the
    packages combinations will continue to generate such configurations;

  - a user who does a configuration mistake that is thus hard to debug
    and understand.

So, we need to find away to avoid this situation.

Two options have been proposed by Thomas P. on IRC:

  - add a choice to select one and only provider at a time, and make all
    the providers prompt-less config options so it is not possible to
    choose more than one at a time;

  - add a pre-build check that verifies that not two providers of the
    same feature are selected, and bail out early in the build if that
    is the case.

Both of those options have issues.

  - going with the choice means that it is no longer possible to add a
    new provider in BR2_EXTERNAL without changing the Buildroot source
    tree, one of the main selling-point of BR2_EXTERNAL to begin with,

  - going with the check means that it will still possible to generate
    such configurations, which means we'd still get autobuild failures
    for those (unless the autobuilders are tweaked to recognise this,)
    while it would be a minimal annoyance to the user.

Thomas P. suggested that providers for our virtual packages would not be
supported in BR2_EXTERNAL. This would allow us to go with the choice
option.

I am rather opposed to this, since I believe allowing providers from
BR2_EXTERNAL is a requirement for BR2_EXTERNAL, and we do want to
support this situation. After all, I can easily see a BR2_EXTERNAL tree
with proprietary, non-public providers for 3d and/or video-decoding
hardware acceleration.

On the other hand, kconfig does not expose the number of config item
that select another one, e.g. it is not possible to know how many
packages did 'select HAS_EGL', we'd have to resort to the .mk to do the
calculations and the check. I think this should be doable in a
relatively non-invasive way, with some Makefile trickery.

So, what do you guys think of these two proposals? Do you have an
alternate solution to propose?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
