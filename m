From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 18:18:46 +0200
Subject: [Buildroot] a philosophical question about Config.in and
 "comment" directives
In-Reply-To: <20150417150042.GA5271@free.fr>
References: <alpine.LFD.2.11.1504170840320.7665@localhost>
 <20150417150042.GA5271@free.fr>
Message-ID: <55313266.9000600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/15 17:00, Yann E. MORIN wrote:
> Rovert, All,
> 
> On 2015-04-17 08:58 -0400, Robert P. J. Day spake thusly:
> [--SNIP--]
>>   to distinguish between these two "levels" of dependency, i think it
>> would be far clearer to rewrite a file like that as:
>>
>>   if BR2_arm
>>
>>   config BR2_PACKAGE_A10DISP
>>         bool "a10disp"
>>         depends on BR2_LINUX_KERNEL
>>         help
>>           Program to change the display mode of Allwinner ARM SOCs running
>>           the linux-sunxi kernel (and not the mainline kernel.)
>>
>>           http://github.com/hglm/a10disp
>>
>>   comment "a10disp needs a Linux kernel to be built"
>>         depends on !BR2_LINUX_KERNEL
>>
>>   endif
>>
>> that layout makes it far clearer that the entire option depends on
>> arm or you see *nothing* and, further, internally, the dependencies
>> in the comment list *only* those dependencies that the user will be
>> warned that they need if they want this selection.

 I completely agree.

>>
>>   i just think having the dependency line
>>
>>   depends on BR2_arm
>>
>> in both the config and comment directives is unnecessary duplication,
>> and that that kind of dependency should be moved up to encompass the
>> entire Config.in file, however that's best done.
>>
>>   thoughts?
> 
> Well, you are right that "it would make moere sense" from a theoretical
> point of view, and that there is no functional difference. BTW, there
> are other  such architectural options, like MMU, that we handle the same
> way as well.
> 
> Note however, we have more complex packages, like for example WebKit,
> for which we move the architectural dependencies into their own option,
> like so:
> 
>     config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>         bool
>         # ARM needs BLX, so v5t+
>         default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4
>         default y if BR2_i386 || BR2_mips || BR2_mipsel || \
>                 BR2_sparc || BR2_x86_64
>         depends on BR2_USE_MMU # libgail -> pango -> libglib2
> 
> That's because this way, other packages that may want to select WebKit
> can select it by just adding a dependency on BR2_PACKAGE_WEBKIR_ARCH_SUPPORT.

 But even so, it would make more sense IMHO to write:

config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
	...

if BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS

comment "webkit needs foo bar baz"
	depends on !(BR2_FOO && BR2_BAR && BR2_BAZ)

config BR2_PACKAGE_WEBKIT
	depends on BR2_FOO
	...

...

endif


 Note that I also think it makes more sense to have the comment at the top then
at the bottom.


> 
> And of course, that's the way packages have been written historically.
> Changing all the packages is just not feasible, and maintainability and
> homogeneity trump eye-candy quite easily. ;-)

 But we don't have that much homogeneity at the moment. It is true that we
currently almost always have it as depends on, but the order and how it's || and
&&-ed varies.


> So yes, you are right _on principle_. But we're not gonna change that
> policy, and we'll continue to require new packages to conform to it.

 We _could_ change the policy and just require new packages to conform to the
new policy. We do that regularly (cfr. patch naming, BR2_ prefix, ...).

 That said, I don't think the current situation is bad enough to warrant such a
change.


> Just a side note: I personally find it easier to read the way we have it
> now: having the "depends on" directly in the package dependency list
> looks more obvious to me (but hey! I'm kind of a weirdo! ;-) 

 Well, then either your first statement that it makes more sense was not true,
or else you don't make sense :-P


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
