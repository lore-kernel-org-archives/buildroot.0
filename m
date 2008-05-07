From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 7 May 2008 17:07:18 +0200
Subject: [Buildroot] buildroot - python problem
References: <223E6519BDCAC74695BEE9D163F8E6592218AB@oakleaf10.oakleafconsultancy.com>
	<c166aa9f0805070734h10591bf3sbdf6c6b5bc696c04@mail.gmail.com>
Message-ID: <079f01c8b054$166a3620$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Wed, May 7, 2008 at 4:48 AM, Richard Hardy
> <richardh@oakleafconsultancy.com> wrote:
>> I get a long way through the process (selecting mostly the default options),
>> and then I get an error as follows:
>>
>>
>>
>> Make[1] Leaving directory
>> '/home/richardh/AT91SAM9263/buildroot/build_arm/Python-2.4.2'
>>
>> /bin/sh: line 8 -/usr/bin/make No such file or directory
>>
>> Make: ***
>> [/home/richardh/AT91SAM9263/buildroot/build_arm/Python-2.4.2/.hostpython]
>> Error 127
>>
>>
>>
>> Can anyone help me as to why this is happening and what I might do about it?
> 
> I found this as well.  I was able to get around it by making the
> change it the patch below (beware line wrap as I just pasted it in).
> As I understand it a - at the beginning of a command is legal in make,
> but since this is a continuation of one long command line I don't
> think it's okay there.
> 
> Index: package/python/python.mk
> ===================================================================
> --- package/python/python.mk    (revision 21884)
> +++ package/python/python.mk    (working copy)
> @@ -89,7 +89,7 @@
>                $(MAKE) python Parser/pgen && \
>                mv python hostpython && \
>                mv Parser/pgen Parser/hostpgen && \
> -               -$(MAKE) distclean \
> +               $(MAKE) distclean \
>        ) && \
>        touch $@
> 


The python.mk looks pretty unclean to me.
Should not the host python be built in the toolchain directory,
and the result moved to STAGING_DIR?
Then it could be easily be used for other stuff as well.

Best Regards
Ulf Samuelsson
