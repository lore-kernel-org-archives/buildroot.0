From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 16 Jul 2016 15:38:01 -0400
Subject: [Buildroot] grub2 installation query
In-Reply-To: <d7003eef-c205-0b38-526c-562dc8d5d54e@gmail.com>
References: <CANxTyt45ajPv1av2X=EFHEKTDy8mEiKx2-j+66kPZi_89-MDng@mail.gmail.com>
 <d7003eef-c205-0b38-526c-562dc8d5d54e@gmail.com>
Message-ID: <CANxTyt5f-RL+j6cTgPrM3S4REL5NJfv+RnnV62ay+zxR6WL1wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, Jul 16, 2016 at 2:17 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Hi Danomi,
>
> Le 16/07/2016 ? 20:02, Danomi Manchego a ?crit :
>> All,
>>
>> I recently noticed that grub2 will fail to install if stripping is turned off.
>> This is because $(STRIP) is used to make a "kernel.img" from another file
>> during installation, and the `true` command won't simulate that.
>>
>> I think that grub2 is not unique in this.  I notice these lines in openldap.mk:
>>
>>   # Somehow, ${STRIP} does not percolates through to the shtool script
>>   # used to install the executables; thus, that script tries to run the
>>   # executable it is supposed to install, resulting in an error.
>>   OPENLDAP_MAKE_ENV = STRIP="$(TARGET_STRIP)"
>>
>> And indeed the comment is true - there is at least two instances of openldap
>> makefiles installing things to $(DESTDIR) via $(STRIP).
>>
>> So I'm wondering:
>>
>> - Should not the autobuilders be hitting these?
>
> It's due to the choice for the strip option.
> BR2_STRIP_none is not the default choice and the randconfig command used in
> autobuilders can't select other config symbol than the default choice.
>
>>
>> - Should there by a TARGET_STRIP_FOR_REAL that is actual a strip, in
>>   addition to TARGET_STRIP, for these cases?
>
> It remind me a patch in patchwork:
> http://patchwork.ozlabs.org/patch/624875/
>
> Can you take a look at it ?

Yes, this patch from Charles Hardin uses the actual cross strip
instead of $(TARGET_STRIP), so it fixes the problem.  I think the
wording of the comment that was added is not quite right.  It says
"TARGET_STRIP is  overridden by BR2_STRIP_none", but this is only
sometimes the case, and it is not really a case of overriding a
definition, but the definition itself.  I would reword to:

# NOTE: TARGET_STRIP may be set to `true` when stripping is disabled, so
# always use the actual cross compile strip to ensure grub2 installs properly.

If Charles Hardin fixes the comment, then he can add:

Acked-by: Danomi Manchego <danomimanchego123@gmail.com>
Tested-by: Danomi Manchego <danomimanchego123@gmail.com>

Regards,
Danomi -


> Best regards,
> Romain
>
>>
>> Danomi -
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
