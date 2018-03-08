From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 08 Mar 2018 00:14:51 -0300
Subject: [Buildroot] [PATCH next v2 3/5] support/scripts/pkg-stats-new:
 add current version information
References: <20180307232558.2d9b358f@windsurf>
Message-ID: <5aa0aaabf354_230cd1b5a053590@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Mar 07, 2018 at 07:25 PM, Thomas Petazzoni wrote:

> On Sun, 25 Feb 2018 21:47:48 -0300, Ricardo Martincoski wrote:
> 
>> The output of printvars is sorted, so this makes the 'versions' dict to
>> contain at the very end:
>>  1) the target version when there is no host version
>>  2) the host version for packages alphabetically before hostapd
>>  3) the target version for packages alphabetically after hplip
>>  4) the host version when there is no target version
>> 
>> The inconsistency between 2 and 3 is not a problem right now because all
>> packages that have host and target versions use the same versions for both.
>> Maybe it will never be a problem?
>> 
>> I hope Yann can help us here (I added to CC).
>> 
>> The case 4 seems to serve a single package: lpc3250loader
>> We have other packages that are host-only, i.e. vboot-utils, they set _VERSION,
>> not HOST.*_VERSION.
>> Maybe it is something to fix in the package?
>> If yes, you could just ignore the entries starting with HOST_.
> 
> I've addressed your concern by doing this:
> 
> +    # We process first the host package VERSION, and then the target
> +    # package VERSION. This means that if a package exists in both
> +    # target and host variants, with different version numbers
> +    # (unlikely), we'll report the target version number.
> +    version_list = o.splitlines()
> +    version_list = [ x for x in version_list if x.startswith("HOST_") ] + \
> +                   [ x for x in version_list if not x.startswith("HOST_") ]
> +    for l in version_list:
> 
> This means that we will first process all the HOST_*_VERSION variables,
> filling up the dict with the version numbers for the host packages, and
> then we will process the *_VERSION variables.
> 
> With this:
> 
>  - If the package specifies only a target version, the target version
>    is saved.
> 
>  - If the package specifies only a host version, the host version is
>    saved.
> 
>  - If the package specifies both a target version and a host version,
>    the target version always wins. So the scripts doesn't handle
>    differentiating host and target versions for the same package, but
>    at least we are consistent in the fact that we will always report
>    the target version.
> 
> How does that sound ?

Sounds good.
Nit: please recheck with flake8.

> 
>> This column shows raw sha1 for git packages.
>> Wouldn't be visually better to show only the first, say 20, characters?
>> At the end, it's a matter of option.
>> 
>> If more people have the same opinion you could cut the string after checking
>> with a regexp for 40 or 39 (see sunxi-mali) hexa digits.
> 
> I'm just cutting after 20 characters, and adding "..." at the end, and
> it seems good enough to me (compared to doing a regexp to try to guess
> if it's a git hash or not).

OK since you are only changing the display of the version, not the string that
will be compared to the new column.

The few version strings in the tree that are not sha1 larger than 20 are:
2.0.0.alpha20140727b
kvm-unit-tests-20171020
rel_imx_4.9.x_1.0.0_ga

For me these are OK:
2.0.0.alpha20140727...
kvm-unit-tests-2017...
rel_imx_4.9.x_1.0.0...


Regards,
Ricardo
