From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 15:26:24 +0000
Subject: [Buildroot] [PATCH 1/2] elfutils: bump version to 0.160
In-Reply-To: <20141110151938.GB2466@free.fr>
References: <1415616323-58155-1-git-send-email-Vincent.Riera@imgtec.com>
 <CAHXCMMLEwTjev99Jk626Gpsh-r7gpq9F-EB2mpda371Cuuok6w@mail.gmail.com>
 <5460BADC.9030804@imgtec.com> <20141110151938.GB2466@free.fr>
Message-ID: <5460D920.8080805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 11/10/2014 03:19 PM, Yann E. MORIN wrote:
> Vicente, Samuel, All,
> 
> On 2014-11-10 13:17 +0000, Vicente Olivert Riera spake thusly:
>> On 11/10/2014 12:31 PM, Samuel Martin wrote:
>>> On Mon, Nov 10, 2014 at 11:45 AM, Vicente Olivert Riera
>>> <Vincent.Riera@imgtec.com> wrote:
>>>> - Bump version to 0.160
>>>> - Add a hash file
>>>> - Add a hook to remove some -Werror options
>>>>
>>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> [--SNIP--]
>>>> +# The --disable-werror configure option does not seem to be enough. We
>>>> +# need to remove the -Werror options from these Makefiles in order to
>>>> +# avoid compilation failures.
>>>> +define ELFUTILS_DISABLE_WERROR
>>>> +       $(SED) 's/-Werror//g' $(@D)/lib/Makefile
>>>> +       $(SED) 's/-Werror//g' $(@D)/libelf/Makefile
>>>> +       $(SED) 's/-Werror//g' $(@D)/libdwfl/Makefile
>>>> +endef
>>>> +ELFUTILS_POST_CONFIGURE_HOOKS += ELFUTILS_DISABLE_WERROR
>>>
>>> Since we are already reconfiguring elfutils, is it possible to patch
>>> the Makefile.am or Makefile.in instead?
>>
>> I tried it but I couldn't get rid of that by just modifying the
>> Makefile.{am,in}, that's why I ended with that solution. If you can try
>> it I would be very appreciated.
> 
> I managed to get it build without the hook, using that patch:
> 
>     infra: really make -Werror condiftional to BUILD_WERROR
>     
>     Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>     diff -durN elfutils-0.160.orig/config/eu.am elfutils-0.160/config/eu.am
>     --- elfutils-0.160.orig/config/eu.am2014-11-10 16:15:26.644739769 +0100
>     ++  + elfutils-0.160/config/eu.am2014-11-10 16:15:52.745052929 +0100
>     @@ -3   5,7 +35,6 @@
>      DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
>      AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
>      AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
>     -    $(if $($(*F)_no_Werror),,-We   rror) \
>             $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
>             $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
>             $($(*F)_CFLAGS)
> 
> Regards,
> Yann E. MORIN.
> 

I will test it and re-spin a new version of the two patches, also taking
into account your comments about the 2/2 patch :-)

Thanks!
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
