From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 18 Nov 2011 08:59:59 +0100
Subject: [Buildroot] [PATCH 5 of 5 v2] python: allow reduced installation
In-Reply-To: <20111117205501.62cd8518@skate>
References: <patchbomb.1321557989@devws108>
 <3fb04c960d0e58ea5bb1.1321557994@devws108>
 <20111117205501.62cd8518@skate>
Message-ID: <CAAXf6LVz-LYim4hy8u=-5804hm2fkkyAsveVMqaaHg7Cpogz5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 17, 2011 at 8:55 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 17 Nov 2011 20:42:04 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> A default python installation takes more than 13M of disk space on
>> target. The python library takes about 4,5M, and the other 9M is
>> occupied by various modules in /usr/lib/python2.7. A usable
>> installation doesn't need such a large module directory. A minimal
>> configuration with only those modules needed to start an interactive
>> session requires only about 450K, plus the python library itself.
>>
>> This patch adds an option to reduce the number of installed python
>> modules to the bare minimum. Additional modules to install can be
>> specified in the config file as a string.
>
> While I agree that the feature is nice, I am not a fan of the
> implementation. Currently, we already have a way of enabling/disabling
> certain Python modules with one Kconfig option for each module that can
> be enabled/disabled. The list of modules that can be enabled/disabled
> this way has been built taking into account two factors :
>
> ?* We want to be able to configure out modules that have external
> ? dependencies (on other libraries)
>
> ?* We want to be able to configure certain modules that take a huge
> ? amount of space (I'm thinking of all the japanese/korean handling)
> ? and may not be useful in most situations
>
> So we already have a way of configuring which modules are
> built/installed with one Kconfig option per-module.
>
> Now, you're adding a new option "I want a minimal version of Python"
> with an additional option "but I also want those additional modules". I
> think that taken together with the existing per-module Kconfig options,
> it makes the Python configuration very strange. I am not sure what to
> propose exactly (having one Kconfig option for each and every module
> would be horrible), but I don't like really much this proposal.

Ok, it's true that this makes the Python configuration pretty strange.
We need to improve this.

Having a separate option for each module is indeed way overkill / undesirable.
Having a single string option to specify what you want or what you
don't want is also not very user-friendly, certainly not in case of
dependencies.

The 'reduced python' option I proposed is really an expert option, as
you have to determine which additional modules you need for a given
script. But, in cases where space is limited, I think it is of value.

An alternative would be to identify a limited number of module
'groups', each having a Kconfig option, but I'm not sure whether this
is at all possible.

What if we split the configuration in two ways?
* Either you start from the almost-full installation, with the option
of deselecting certain packages (this corresponds to the current
situation)
* Or you tick the 'expert' option, and then you start from the reduced
installation, with the option of enabling certain packages with a
string option.
The main difference between this and what is proposed in the patch, is
that the two ways of configuring become mutually exclusive which makes
it clearer.

Best regards,
Thomas
