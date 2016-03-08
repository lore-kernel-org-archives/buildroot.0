From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Mar 2016 00:19:23 +0100
Subject: [Buildroot] [PATCH v2 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <20160308221049.GB14289@free.fr>
References: <1457473693-25776-1-git-send-email-jezz@sysmic.org>
 <20160308221049.GB14289@free.fr>
Message-ID: <56DF5DFB.1050309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/08/16 23:10, Yann E. MORIN wrote:
> J?r?me, All,
>
> On 2016-03-08 22:48 +0100, J?r?me Pouiller spake thusly:
>> It is handy to use local.mk or external.mk to add specific targets
>> for current project. However, until now, it not possible to add help
>> message these targets.
>
> I have:
>
>      $ make local-help
>      Local blabla help displays here...
>
>> This patch add EXTRA_HELP variable. This variable is aimed to be assigned
>> from any .mk files. Its content is displayed with 'make help'.
>>
>> For exemple:
>>    EXTRA_HELP += "flash                  - Flash target"
>>    EXTRA_HELP += "chroot                 - Chroot into target/"
>>    EXTRA_HELP += "qemu                   - Run image with qemu"
>>    EXTRA_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
>>    EXTRA_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
>>    EXTRA_HELP += "Please contact support at company.com in case of problem."
>
> This definitely does not look nice to me... :-(

  Why not? Extremely nice and simple.

>
> What we could do, however, would be:
>
>    - in external.mk:
>          BR2_HAS_EXTRA_HELP = YES  # Whatever non empty
>
>    - in the main Makefile:
>
>          help:
>              blabla our current help
>              $(if $(BR2_HAS_EXTRA_HELP),echo "  - local-help  to get local help blabla)
>
> which would be IMHO much much nicer and much much simpler...

  I don't see the advantage of that, to be honest... The point is to append it 
to the main help. You expect just a few lines of extra help text.


  Regards,
  Arnout

>
> Regards,
> Yann E. MORIN.
>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>> ---
>> v2:
>>    - Rename LOCAL_HELP to EXTRA_HELP
>>    - Remove introduction lines (so, 'ifneq ($(LOCAL_HELP),)' is no more needed)
>>
>>   Makefile | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Makefile b/Makefile
>> index f2822a2..1c9f63c 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -948,6 +948,7 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
>>   	@echo '  barebox-menuconfig     - Run barebox menuconfig'
>>   	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
>>   endif
>> +	@for i in $(EXTRA_HELP); do echo "  $$i"; done
>>   	@echo
>>   	@echo 'Documentation:'
>>   	@echo '  manual                 - build manual in all formats'
>> --
>> 2.7.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
