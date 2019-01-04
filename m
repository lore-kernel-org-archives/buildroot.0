From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Jan 2019 12:06:07 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/waf: add a blind
 Config.in.host
In-Reply-To: <20190103220652.GG5991@scaer>
References: <20181223171950.3979-1-casantos@datacom.com.br>
 <20181226223005.71dca29a@windsurf> <20181226215521.GL14286@scaer>
 <20190103225052.3feb76c6@windsurf> <20190103220652.GG5991@scaer>
Message-ID: <1865313a-73fb-7fb2-9b1c-3918fc79b290@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/01/2019 23:06, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2019-01-03 22:50 +0100, Thomas Petazzoni spake thusly:
>> On Wed, 26 Dec 2018 22:55:21 +0100, Yann E. MORIN wrote:
>>> Well, I am not really happy with that, though: do we really plan on
>>> having packages really select all the host tools they need?
>>>
>>> If so, do we really envision autotools-based packages selecting
>>> host-autoconf, host-automake, host-libtool? And then packages that use
>>> host-pkgconf you should also select it...
>>>
>>> Also, what about host-cmake, which is conditionally built, but for which
>>> we do not have the info in kconfig? (well, we can argue we'd have to do
>>> like we do for host-gcc, but still). Oh, and host-tar, host-flex,
>>> host-bison, and so on... :-/
>>
>> Meh, I hadn't thought of conditional packages like host-tar, host-cmake
>> and so on.

 I also hadn't thought of that. But it's not an unsurmountable problem.

>>
>>> So, no, I'm not happy with that direction...
>>>
>>>     config BR2_PACKAGE_FOO
>>>         bool "foo"
>>>         select BR2_PACKAGE_HOST_AUTOCONF
>>>         select BR2_PACKAGE_HOST_AUTOMAKE
>>>         select BR2_PACKAGE_HOST_LIBTOOL
>>>         select BR2_PACKAGE_MAYBE_HOST_TAR
>>>         select BR2_PACKAGE_MAYBE_HOST_FLEX_FOR_KCONFIG
>>>         select BR2_PACKAGE_MAYBE_HOST_BISON_FOR_KCONFIG
>>>         select BR2_PACKAGE_HOST_PKGCONF
>>>
>>> Unles we're planning on hiding that away into meta-config, like:
>>>
>>>     config BR2_PACKAGE_FOO
>>>         bool "foo"
>>>         select BR2_AUTOTOOLS_PACKAGE # mimick $(eval $(autotools-package))
>>>         select BR2_PACKAGE_HOST_PKGCONF_BECAUSE_IT_S_NOT_MANDATORY

 This looks acceptable to me...


>>> And still, the optionally-required host packages like tar, flex et al.
>>> are not covered...

 tar at least is rather easy to overcome: we can add environment variables that
pass the results of dependencies.mk to Kconfig. And for things that are
conditional like lzip we can use a combination of the two.

>>>
>>> Meh... :-(
>>
>> Indeed, I understand the "Meh" here. I hadn't really realized what it
>> would mean to have Config.in.host options for all packages, and
>> properly selected by all its users.
> 
> To be fait, I was initially also in favour of adding Config.in.host
> options for all host packages. But this waf patch made me change my
> mind, becasue of the above...

 Note, however, that the only reason to require Config.in.host for *all*
packages is that it allows us to have a (partial) check that for each make
dependency, the Kconfig dependency exists as well (i.e., check that all
dependencies are in PACKAGES). That's not a very strong reason. So I would be
perfectly fine with making this a "soft" requirement (possibly verified with
checkpackage).

 The tricky thing is that when a package does have a Config.in.host option, we
really want it to be selected in *all* cases that it is built. So ideally we
should have a way to verify that...


 Regards,
 Arnout

> 
>> But still, there are a number of cases where it would really help, so
>> that a given host package can be aware that another host package has
>> been built with a given feature (or not). Or precisely to force that a
>> certain host package is built with a given option. For example, in
>> host-python, we had situations where only a given package needed
>> host-python to be built with FOO support, and since we don't have any
>> BR2_PACKAGE_HOST_PYTHON_FOO option, our only choice was to
>> unconditionally enable FOO support in host-python, adding build time to
>> everyone, even if FOO in host-python might only be needed for one
>> obscure package.
> 
> In this case, maybe we could simply depart from the rule, and just have
> python/Config.in.host contain just:
> 
>     # Select this if you need host-python to support 'stuff'
>     config BR2_NEEDS_HOST_PYTHON_WITH_STUFF
>         bool
> 
> And then, python/python.mk would have:
> 
>     ifeq ($(BR2_NEEDS_HOST_PYTHON_WITH_STUFF),y)
>     HOST_PYTHON_CONF_OPTS += --with-stuff
>     else
>     HOST_PYTHON_CONF_OPTS += --without-stuff
>     endif
> 
> Regards,
> Yann E. MORIN.
> 
>> It seems like we don't have a very conclusive decision on this topic at
>> this point.
> 
> 
