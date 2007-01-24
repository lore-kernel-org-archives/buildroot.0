From: Ulf Samuelsson <ulfs@dof.se>
Date: Thu, 25 Jan 2007 00:58:57 +0100
Subject: [Buildroot] Target support for Atmel ARM/AVR32
References: <014901c73faa$8e9c8100$01c4af0a@atmel.com>
	<20070124233707.GG28221@aon.at>
Message-ID: <02b801c74014$8ceb1a50$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Wed, Jan 24, 2007 at 12:06:31PM +0100, Ulf Samuelsson wrote:
>> I am hoping to add Target support for a number of Atmel Development
>> board, but before I do that, I would like to discuss how this is
>> done.
>>
>> Would like to separate building the root file system from other
>> utilities, since the "build_<arch>" directory is overcrowded.
>>
>> Currently I am using a "target_build_<arch>" directory.
>> In this directory, I create a subdirectory for each target_board.
>>
>> I.E:
>> buildroot/target_build_arm
>>        at91rm9200dk
>>        at91rm9200df
>>        at91rm9200ek
>>        at91sam9260ek
>>        at91sam9261ek
>>        at91sam9262ek
>> or
>> buildroot/target_build_avr32
>>        atstk1002
>>
>> In the target_build_<arch>/<target_board> directory
>> I download patches for Linux/U-Boot before I apply them
>> and then build
>> * Bootstrap
>> * U-Boot
>> * Linux
>> * Other Utitlties
>> in that directory.
>>
>> The results are renamed to show <target_board> and date.
>>
>> Would like to move "buildroot/build_<arch>/root" to
>> "buildroot/target_build_<arch>/<target_board>/root" as well,
>> but have not yet gotten this to work.
>> (This will allow me to have different contents for different boards)
>>
>> At the end, the result is moved to
>> "buildroot/binaries/<target_board>"
>> so that I have easy way to create a delivery by just compressing
>> that directory into a tarball.
>>
>> Does this seem to be a reasonable approach?
>
> Building out of tree would make this alot easier and less complicated,
> IMO.
>

No, I already have it working except for building the build_<arch>/root 
inside.

My goal is to have people download the buildroot source,
then copy a .config file to the topdir and type "make".
Then everything should work without surprises.

"Grand-Ma" should be able to do it!

Many people that will uses this will be complete new to Linux and
the thing below looks dangerous if you want to avoid support phone calls.

The question is really, will a patch be rejected if it is built up as above?


> $ svn co proto://buildroot /space/src/buildroot
> $ mkdir -p /space/obj/board{1,2,3}
> $ cd /space/obj/board1
> $ make -f ../../src/buildroot HOSTCC="my-gcc" DL_DIR=/space/down
>
> where picking up the DL_DIR from the user is not currently supported.
> Not sure if we want that.
> Index: package/Makefile.in
> ===================================================================
> --- package/Makefile.in (revision 17510)
> +++ package/Makefile.in (working copy)
> @@ -33,8 +33,12 @@
> TOPDIR_SUFFIX:=
> endif
>
> +ifndef DL_DIR
> DL_DIR=$(strip $(subst ",, $(BR2_DL_DIR)))
> #"))
> +else
> +$(warning "Using DL_DIR from environment and not from .config")
> +endif
> ifeq ($(DL_DIR),)
> DL_DIR:=$(BASE_DIR)/dl
> endif
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
