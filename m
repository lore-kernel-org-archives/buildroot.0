From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 13 Oct 2017 10:39:42 +0200
Subject: [Buildroot] [RFC 1/3] support/kconfig/merge_config.sh: merge
 also buildroot config files
In-Reply-To: <cfc59c1c-b783-5ba7-178b-b63b8ea00f04@mind.be>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
 <1507668210-5427-2-git-send-email-angelo.compagnucci@gmail.com>
 <4b5e865a-dfba-4fdf-4043-0bcd401832b6@mind.be>
 <CA+TH9VkYrz1cKyVaHk-iT6_uB45tLs71i+tLe+Lhia5f0EsZvg@mail.gmail.com>
 <cfc59c1c-b783-5ba7-178b-b63b8ea00f04@mind.be>
Message-ID: <CA+TH9VnCF47i-xv2fhaMje+tkhsOzmCGQbTemiLXwN_iBo1kBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle ,

2017-10-12 16:41 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 12-10-17 08:42, Angelo Compagnucci wrote:
>> Dear Arnout Vandecappelle,
>>
>> 2017-10-11 23:43 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>>>
>>>
>>> On 10-10-17 22:43, Angelo Compagnucci wrote:
>>>> This patch adds a way to merge buildroot config file programmatically.
>>>
>>>  We already do that in test-pkg, without this patch. What are we doing wrong?
>>
>> The actual support/kconfig/merge_config.sh looks for CONFIG_ symbols
>> via a regexp to print it's output and to check for inconsistencies.
>> Without the correct regexp this is impossible. Probably the right
>> commit message should be: "support/kconfig/merge_config.sh: check also
>> buildroot config files"
>
>  Ah, and in test-pkg we don't need it because we check for that explicitly after
> running merge_config.sh.
>
>  But if you start from a full .config (which you do in the example of 'make
> foo_defconfig; make bar_stack), isn't it going to give a warning for each and
> every symbol defined in the stack?

No, this is the output:

$ make qemu_arm_versatile_defconfig && make lamp_stack
umask 0022 && make -C /media/angelo/WD/data/BUILDROOT/buildroot
O=/media/angelo/WD/data/BUILDROOT/br_qemu_arm/.
qemu_arm_versatile_defconfig
  GEN     /media/angelo/WD/data/BUILDROOT/br_qemu_arm/Makefile
#
# configuration written to /media/angelo/WD/data/BUILDROOT/br_qemu_arm/.config
#
umask 0022 && make -C /media/angelo/WD/data/BUILDROOT/buildroot
O=/media/angelo/WD/data/BUILDROOT/br_qemu_arm/. lamp_stack
/media/angelo/WD/data/BUILDROOT/buildroot/support/kconfig/merge_config.sh
-b -O /media/angelo/WD/data/BUILDROOT/br_qemu_arm
/media/angelo/WD/data/BUILDROOT/br_qemu_arm/.config
/media/angelo/WD/data/BUILDROOT/buildroot/stacks/lamp_stack
Using /media/angelo/WD/data/BUILDROOT/br_qemu_arm/.config as base
Merging /media/angelo/WD/data/BUILDROOT/buildroot/stacks/lamp_stack
Value of BR2_TOOLCHAIN_BUILDROOT_CXX is redefined by fragment
/media/angelo/WD/data/BUILDROOT/buildroot/stacks/lamp_stack:
Previous value: # BR2_TOOLCHAIN_BUILDROOT_CXX is not set
New value: BR2_TOOLCHAIN_BUILDROOT_CXX=y

Value of BR2_PACKAGE_PHP is redefined by fragment
/media/angelo/WD/data/BUILDROOT/buildroot/stacks/lamp_stack:
Previous value: # BR2_PACKAGE_PHP is not set
New value: BR2_PACKAGE_PHP=y

Value of BR2_PACKAGE_APACHE is redefined by fragment
/media/angelo/WD/data/BUILDROOT/buildroot/stacks/lamp_stack:
Previous value: # BR2_PACKAGE_APACHE is not set
New value: BR2_PACKAGE_APACHE=y

  GEN     /media/angelo/WD/data/BUILDROOT/br_qemu_arm/Makefile
#
# configuration written to /media/angelo/WD/data/BUILDROOT/br_qemu_arm/.config
#
Value requested for BR2_PACKAGE_ZLIB not in final .config
Requested value:  # BR2_PACKAGE_ZLIB is not set
Actual value:     BR2_PACKAGE_ZLIB=y

Value requested for BR2_PACKAGE_EXPAT not in final .config
Requested value:  # BR2_PACKAGE_EXPAT is not set
Actual value:     BR2_PACKAGE_EXPAT=y

Value requested for BR2_PACKAGE_APR not in final .config
Requested value:  # BR2_PACKAGE_APR is not set
Actual value:     BR2_PACKAGE_APR=y

Value requested for BR2_PACKAGE_APR_UTIL not in final .config
Requested value:  # BR2_PACKAGE_APR_UTIL is not set
Actual value:     BR2_PACKAGE_APR_UTIL=y

Value requested for BR2_PACKAGE_NCURSES not in final .config
Requested value:  # BR2_PACKAGE_NCURSES is not set
Actual value:     BR2_PACKAGE_NCURSES=y

Value requested for BR2_PACKAGE_PCRE not in final .config
Requested value:  # BR2_PACKAGE_PCRE is not set
Actual value:     BR2_PACKAGE_PCRE=y

Value requested for BR2_PACKAGE_READLINE not in final .config
Requested value:  # BR2_PACKAGE_READLINE is not set
Actual value:     BR2_PACKAGE_READLINE=y


>
> [snip]
>>>> @@ -131,7 +140,12 @@ fi
>>>>  # Use the merged file as the starting point for:
>>>>  # alldefconfig: Fills in any missing symbols with Kconfig default
>>>>  # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
>>>> +if [ "$BUILDROOT_MODE" = "false" ]; then
>>>>  make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>>>> +else
>>>> +cp $TMP_FILE $OUTPUT/.config
>>>> +make $OUTPUT_ARG olddefconfig
>>>
>>>  Why is this needed? alldefconfig works fine, no?
>>
>> Yes, indeed, this part could be removed.
>
>  We only added alldefconfig a few months ago, perhaps your initial patch still
> predates that.

Nope, only thought that olddefconfig could be better suited.

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
