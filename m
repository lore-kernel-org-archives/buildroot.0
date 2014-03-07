From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Mar 2014 13:59:29 +0100
Subject: [Buildroot] [PATCH 6/6] liburcu: disable build with gcc-4.8.x
	on ARM
In-Reply-To: <20140306231723.32e217fd@skate>
References: <1393717193-19774-1-git-send-email-s.martin49@gmail.com>
 <1393717193-19774-7-git-send-email-s.martin49@gmail.com>
 <20140306231723.32e217fd@skate>
Message-ID: <CAHXCMM+YsCrFrnW06BdJ=AGR3VrUhZb_2UA+NevfdJXF=D+HTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Thu, Mar 6, 2014 at 11:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sun,  2 Mar 2014 00:39:53 +0100, Samuel Martin wrote:
>
>> +     # liburcu/gcc-4.8.x bug
>> +     depends on !((BR2_arm || BR2_armeb) && (BR2_GCC_VERSION_4_8_X || \
>> +             BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11 || \
>> +             BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10 || \
>> +             BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09 || \
>> +             BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311))
>
> The exclusion of BR2_GCC_VERSION_4_8_X is wrong, because we have in
> Buildroot the patch fixing the
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854 gcc bug.
>
> But generally, I'm not really happy with this approach, as we would
> have to update these dependencies every time we bump/change the
> external toolchain Kconfig options... Unfortunately I don't have a
> better suggestion.

I did this because of the patch in liburcu checking for the compiler version.
I did not notice BR carries the patch fixing this bug.

>
> Maybe I would prefer something like:
>
> config BR2_TOOLCHAIN_HAS_GCC_BUG_58854
>         bool
>
> And then the toolchain impacted by the bug would select it. For
> example, are you sure the Linaro toolchains are affected by the
> problem? Most likely they have backported the change that is needed to
> fix this problem.

Indeed, it sounds like a less restrictive way of handling this (even
if it implies more testing ;-])

Regards,

-- 
Samuel
