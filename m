From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:02:13 -0300
Subject: [Buildroot] [PATCH 00/51] TLP/PPS: intro, package cleanup.
In-Reply-To: <6e24662f-d0fd-461e-0059-6f2e23273480@mind.be>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <6e24662f-d0fd-461e-0059-6f2e23273480@mind.be>
Message-ID: <d8e3ec4c46175ca4d852efcfdea65c19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-10-14 12:48, Arnout Vandecappelle wrote:

> Hi Gustavo,
> 
> On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
>> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>> 
>> This is the first step in picking up Fabio Porcedda's work
>> ( http://lists.busybox.net/pipermail/buildroot/2015-June/131051.html )
>> regarding TLP (Top-Level Parallel) support and moving it forward for
>> mainstream buildroot inclusion.
>> 
>> PPS (Per-Package Staging) is the central piece in enabling the
>> configure/build/install of packages simultaneously. Right now packages
>> pick up libraries/includes from a shared (the staging) directory.
>> Once TLP is enabled this is problematic because despite the
>> developers/contributors best efforts not all dependencies are 
>> accounted
>> for properly.
>> When building and installing in parallel a package 'A' can be
>> installing development files (headers/libraries) while package 'B'
>> is configuring, and potentially probing for its dependencies.
>> If package 'B' can use unaccounted dependencies from package 'A' this
>> can be a problem since the feature probe might not be atomic, hence
>> it might find erroneous package 'A' features since the install to the
>> staging area might not be complete when it's doing this.
>> To avoid this the proposal is to limit the staging directory scope
>> of packages only to the required and requested dependencies.
> 
>  Note that it's not enough to do it for staging, host needs it as well.

Hi Arnout.
Indeed, i'll be sending a new series that handles more target package 
fixes, addressed the ones from the previous series that needed fixes and 
does so for host packages as well.
For host packages i call this PPH (Per-Package Host directory/area), i'm 
working on PPS first and then i'll move on to PPH.
And then there's PPL (Per-Package Logging) since looking at the output 
when building TLP makes debugging very hard, so having a per-package 
configure/build/install/etc log will make life easier (with a decent 
playback when things go bad).

>> For this to happen packages need a special staging area that fulfills
>> its dependencies, hence overriding its sysroot, which must happen via
>> environment variable overrides (there are a couple of ways to
>> accomplish this, but they all require overrides via env variables).
>> 
>> To accomplish this some packages need a small cleanup, which is
>> passing the $(TARGET_MAKE_ENV) variable which will contain this setup
>> for their build and install steps, to be able to override the default
>> build rules.
> 
>  Actually, I think it's better/safer/easier to just do a global export 
> from the
> Makefile:
> 
> export BR2_STAGING_DIR = $($(PKG)_STAGING_DIR)
> 
> and perhaps also
> 
> _STAGING_DIR = $(STAGING_DIR)
> 
> to allow it to be used outside package build rules as well.

I'm toying with the idea of a sandbox as well that will just restrict 
the view of the full staging area per-package to the dependencies it 
needs (LD_PRELOADed).
This would alleviate the overhead in copying/linking all those files, 
but it's a bit more complex.

Regards.
