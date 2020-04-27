From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Apr 2020 10:31:51 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add option to define custom
 dependencies
In-Reply-To: <20200425211350.GR5035@scaer>
References: <20200425000629.2068191-1-heiko@sntech.de>
 <20200425153810.2e86813e@windsurf.home> <20200425211350.GR5035@scaer>
Message-ID: <44894d6d-ed79-9221-2838-5ce6971cb848@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/04/2020 23:13, Yann E. MORIN wrote:
> Heiko, Thomas, All,
> 
> On 2020-04-25 15:38 +0200, Thomas Petazzoni spake thusly:
>> On Sat, 25 Apr 2020 02:06:29 +0200
>> Heiko Stuebner <heiko@sntech.de> wrote:
>>> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>>>
>>> A custom uboot version my depend on additional unspecified packages
>>> to be built before the uboot build is attempted.
>>>
>>> One example is an additional config fragment referencing things
>>> from other packages, so add an option similar to the config fragments
>>> where these can be defined.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>>
>> Hm, this is interesting. Out of curiosity, what is the specific
>> case/issue you had ?
>>
>> We already have a bunch of BR2_TARGET_UBOOT_NEEDS_xyz options:
>>
>> config BR2_TARGET_UBOOT_NEEDS_DTC
>> config BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
>> config BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
>> config BR2_TARGET_UBOOT_NEEDS_OPENSSL
>> config BR2_TARGET_UBOOT_NEEDS_LZOP
>>
>> and I just realized that we will need:
>>
>> config BR2_TARGET_UBOOT_NEEDS_PYTHON3_PYLIBFDT
>> config BR2_TARGET_UBOOT_NEEDS_PYTHON3_PYELFTOOLS
>>
>> indeed, as of U-Boot 2020.01, a number of Python scripts, including the
>> pylibfdt stuff, and binman, are now Python 3 only. We already have a
>> few build failures in the autobuilders due to this. And
>> http://patchwork.ozlabs.org/project/buildroot/patch/20200413171831.12079-1-vincent.stehle at laposte.net/
>> enables host-python3 to get around this, but I don't see how it can
>> work as it doesn't guarantee that host-python3 is built before U-Boot.
>>
>> So perhaps we should get rid of all this craziness and have just this
>> BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES ?
>>
>> Questions are:
>>
>>  - Is this sufficiently user-friendly? It's already not necessary easy
>>    to know when one has to enable NEEDS_DTC, NEEDS_PYLIBFDT, etc. So if
>>    instead of that one has to know that host-dtc host-python host-swig,
>>    etc. have to be enabled.

 The userfriendlyness is an issue caused by U-Boot itself, not by us. If they
would have some formal way to declare their dependencies, then at least we would
be able to give a decent error message telling the user what to put in
_CUSTOM_DEPENDENCIES.

>>
>>  - How to not break too much backward compatibility. Either we do
>>    Config.in.legacy handling as we usually do. Or we keep them as
>>    hidden booleans and have compatibility logic in uboot.mk to add the
>>    proper dependencies.

 I would tend to say that we should keep the existing ones, at least for a
while, and require new ones to use _CUSTOM_DEPENDENCIES.

>>
>> Yann, Peter, Arnout, any opinion on this ?
> 
> My opinion on that patch is that i am definitely not in favour of it. If
> we go that route, then we would have to allow adding any such arbitrary
> dependencies to a wide range of packages.

 The key difference is that for U-Boot (and kernel) we don't just allow, but
*expect* the user to specify some custom version. In that respect we differ
wildly from almost all other projects (i.e. OpenWrt and yocto) that choose a
single or very few kernel and U-Boot versions to work with.

 Because of this flexibility, we need to also allow stuff we consider ugly like
custom git downloads and a custom directory (which we rejected but for which now
I believe we really should have the option). So IMO this custom dependencies
ugliness is the inevitable price we have to pay for that flexibility.

> This is not acceptable in my
> opinion.
> 
> Now, there are two situations:
> 
>   - the tool is already in Buildroot: add a new _NEEDS_FOO option like
>     we already have.
> 
>   - the tool is in a br2-external tre: this is in my opinion better
>     served by working on the evaluation-postpone changes Arnou and I
>     have been suggesting for quite a while now.
> 
> Yes, the second situation is curently cumbersome for some. but remember
> that br-2xternal is just providing a Makefile fragment that is included
> in the main Makefiel of Buildrot. As such, you can complement the
> internal dependencies in a hackish way:
> 
>     $(UBOOT_BUILDDIR)/.spatmp_configred: my-custom-package
> 
> Yes, this is hackish, but the hack is in your br2-external tree, not in
> Buildroot.

 The thin is: maintaining the FAQ entry that explains how to do this is IMO a
lot more work than maintaining the fairly simple additional config option.


> So, I am definitely not in favour of adding such an option as the
> proposed BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES.


 A few years ago, I was also of the opinion that new Config.in options should be
treated with utmost suspicion. The main argument there is maintainability.
However, "maintaining" a Config.in option is really not much of an effort. The
.mk handling of it may be an effort, but in this case it's pretty simple as
well. It would also be a problem if infra support was needed - but that's not
the case here either.

 The only thing that I would like is a test of the functionality, because that's
the main maintainance effort IMO: making sure that it doesn't break. In this
case, the test is easy: we can just rewrite e.g. asus_tinker_rk3288_defconfig to
set:

BR2_TARGET_UBOOT_NEEDS_DTC=y
BR2_TARGET_UBOOT_CUSTOM_DEPENDENCIES="openssl"

(which tests the combination of the two approaches).

 Bottom line: I'm in favour.

 Regards,
 Arnout
