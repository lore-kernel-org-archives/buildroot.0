From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 13 May 2014 22:12:59 +0200
Subject: [Buildroot] virtual-packages: the case for multiple providers
	selected
In-Reply-To: <20140513180945.GC3507@free.fr>
References: <20140513180945.GC3507@free.fr>
Message-ID: <a67a948f-b496-4385-9796-fc2d079d9641@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>Hello All!
>
>We have recently identified the reasons for some weird autobuilder
>failures.
>
>The failures happen when two or more providers of the same virtual
>package are enabled at once in the same config.
>
>Although this seems like a minor issue, as a carefull user will probably
>never generate such a config on purpose, we're still exposed to this
>isue for two reasons:
>
>  - the autobuilders do random configurations to stress-test the
>    packages combinations will continue to generate such configurations;
>
>  - a user who does a configuration mistake that is thus hard to debug
>    and understand.
>
>So, we need to find away to avoid this situation.
>
>Two options have been proposed by Thomas P. on IRC:
>
>  - add a choice to select one and only provider at a time, and make all
>    the providers prompt-less config options so it is not possible to
>    choose more than one at a time;
>
>  - add a pre-build check that verifies that not two providers of the
>    same feature are selected, and bail out early in the build if that
>    is the case.
>
>Both of those options have issues.
>
>  - going with the choice means that it is no longer possible to add a
>    new provider in BR2_EXTERNAL without changing the Buildroot source
>    tree, one of the main selling-point of BR2_EXTERNAL to begin with,

I guess it's not possible to put an 'include' statement inside the choice? The included file would then just contain the external options.


>
>  - going with the check means that it will still possible to generate
>    such configurations, which means we'd still get autobuild failures
>    for those (unless the autobuilders are tweaked to recognise this,)
>    while it would be a minimal annoyance to the user.
>

It doesn't look too difficult to me to handle such prebuild checks in a generic way in the autobuilders.
Suppose that a magic return code is used if a prebuild check fails (also for the kernel headers check for example), then the autobuilders can check for this magic code and then simply ignore the configuration and generate a new one.


>Thomas P. suggested that providers for our virtual packages would not be
>supported in BR2_EXTERNAL. This would allow us to go with the choice
>option.
>
>I am rather opposed to this, since I believe allowing providers from
>BR2_EXTERNAL is a requirement for BR2_EXTERNAL, and we do want to
>support this situation. After all, I can easily see a BR2_EXTERNAL tree
>with proprietary, non-public providers for 3d and/or video-decoding
>hardware acceleration.

Agreed.

(...)

Best regards,
Thomas
