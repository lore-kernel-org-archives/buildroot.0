From: Cyril HAENEL <chaenel@free.fr>
Date: Sat, 24 Jan 2009 14:03:40 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <87vds5gjpl.fsf@macbook.be.48ers.dk>
References: <87skn9iv5w.fsf@macbook.be.48ers.dk> <497A3649.7050005@free.fr>
	<87vds5gjpl.fsf@macbook.be.48ers.dk>
Message-ID: <497B11AC.3090103@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Peter Korsgaard a ?crit :
>>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:
>>>>>>             
>
>  Cyril> Compilation problem for me :
>
>  Cyril> tar jxvf buildroot-2009.02-rc2.tar.bz2
>  Cyril> cd buildroot-2009.02-rc2
>  Cyril> make menuconfig + Exit + Save
>  Cyril> make at91sam9260dfc_defconfig
>
> That one seems to have BR2_ENABLE_LOCALE enabled.
>
>  Cyril> make
>
>  -> I answer N at all questions
>  -> I answer 3 for the memory type question (Nand flash 2KB page and
>  Cyril> 128KB block)
>
>  Cyril> After 2 or 3 minutes :
>
>  Cyril>  LN include/sys/procfs.h
>  Cyril>  LN include/sys/ucontext.h
>  Cyril>  LN include/sys/user.h
>  Cyril>  HOSTCC extra/locale/gen_wc8bit
>  Cyril> extra/locale/gen_wc8bit.c: In function 'main':
>  Cyril> extra/locale/gen_wc8bit.c:356: warning: array subscript is above array
>  Cyril> bounds
>  Cyril> extra/locale/gen_wc8bit.c:415: warning: array subscript is above array
>  Cyril> bounds
>  Cyril> extra/locale/gen_wc8bit.c:481: warning: array subscript is above array
>  Cyril> bounds
>  Cyril>  GEN extra/locale/codesets.txt
>  Cyril>  GEN extra/locale/c8tables.h
>  Cyril> setlocale(LC_CTYPE,"en_US.UTF-8") failed!
>
> And your host doesn't seem to have the en_US.UTF-8 locale which seems
> to be a requirement for this.
>
> I don't know the finer details about the locale generation in uclibc,
> and if en_US.UTF-8 really should be required, for that you better ask
> the uclibc list.
>
>   
Hi Peter,

I disabled BR2_ENABLE_LOCALE :

tar jxvf buildroot-2009.02-rc2.tar.bz2
cd buildroot-2009.02-rc2
make menuconfig + Exit + Save
make at91sam9260dfc_defconfig

Edit .config and disable BR2_ENABLE_LOCALE

make

--> I answer the default proposition at all questions, except for memory 
type question, I answer 3

This time there is no setlocale() error, but after a while, I have an 
error on the module-init-tools-3.2.2 compilation :

    /usr/bin/gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" 
-DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" 
-DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\"  -I. -I.     -g -O2 
-Wunused -Wall -c `test -f 'modinfo.c' || echo './'`modinfo.c
modinfo.c: In function 'main':
modinfo.c:338: attention : 'infosize' may be used uninitialized in this 
function
/usr/bin/gcc  -g -O2 -Wunused -Wall   -o modinfo  modinfo.o zlibsupport.o 
/usr/bin/gcc  -g -O2 -Wunused -Wall   -o insmod.static -static insmod.o 
/usr/bin/ld: cannot find -lc
collect2: ld a retourn? 1 code d'?tat d'ex?cution
make[1]: *** [insmod.static] Erreur 1
make[1]: quittant le r?pertoire ? 
/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/module-init-tools-3.2.2 
?
make: *** 
[/home/nlc/developpement/linuxEmbedded/buildroot-2009.02-rc2/toolchain_build_arm/module-init-tools-3.2.2/depmod] 
Erreur 2

What can be the problem this time ?

Regards,
Cyril

-- 

Cyril Haenel
Registered Linux User #332632
