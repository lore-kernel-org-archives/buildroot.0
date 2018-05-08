From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 May 2018 22:43:45 +0200
Subject: [Buildroot] package_installation_problem
In-Reply-To: <CAAp1OY35UgMMmtK-CG+Y3JKLLy78u+KRbOwtR-FugwrVr804ww@mail.gmail.com>
References: <CAAp1OY35UgMMmtK-CG+Y3JKLLy78u+KRbOwtR-FugwrVr804ww@mail.gmail.com>
Message-ID: <28d9248a-a811-d361-adfe-05ad4c5a0635@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Abinaya,

 I don't see anything immediately wrong with what you posted. Well, there's a
lot wrong (see below), but nothing that would cause the executable not to be
installed.

 Can you check that the package is indeed built? I.e., output/build/water*
exists and contains the ammu executable. If it isn't, then you either didn't
select the package, or you didn't do 'make' after selecting it.

 Also, if you run 'make', then modify something in the water sources, then run
'make' again, the package will not be rebuilt. You have to do that explictily:
'make water-dirclean; make'.

 By the way, please avoid using HTML mail.

On 08-05-18 11:21, abinaya m wrote:
> Dear sir,
> ? ? ?i am abi.i would like to? created a simple c program with Make file that
> output want to be store in /etc/bin file for customized os of

 I guess you mean /bin, not /etc/bin.

> *atmel-sama5-D3-xplained*. There is no error after "make".but the executable
> file is not present in bin file after make.now only i started buildroot from the
> scratch.kindly help me sir.
> 
> i followed these steps:
> 
> *STEP 1:*
> *
> *
> *create a folder as "asd"?in /?/home/laptop105/sama5_abi/abi_package/asd Directory?
> 
> *inside the directory water.c and Makefile
> 
> *water.c file:*
> ? ? ? ? ? ? ? ? #include <stdio.h>
> ? ? ? ? ? ? ? ? int main(){
> while(1)
> {
> printf("bulidroot world\n");
> sleep(1);
> }
> return 0;
> }
> 
> *Makefile:*
> 
> 
> OBJS=water.o
> 
> all:water

 You don't define a 'water' target... So I guess you actually used a different
makefile, otherwise it would error out.

> 
> helloworld:$(OBJS)
> $(CC) $(LDFLAGS) -o ammu $(OBJS)
> 
> $(OBJS): %.o:%.c
> $(CC) $(CFLAGS) -c -o $@ $<
> clean:
> rm -f $ (OBJ)
> 
> install:
> cp ammu $ (DESTDIR) / bin / ammu

 I guess there are actually no spaces there, or it would error out. Well, you
never call the install target anyway.

> 
> *STEP 2:*
> ? ? ? directory ---> bulidroot-at91/package/water? ?inside that Config.in &
> water.mk <http://water.mk>
> 
> *Config.in:*
> ? ? ? ? config BR2_PACKAGE_WATER
> ? ? bool "water"
> ? ? help
> ? ? ? Hello World package says hello world to you
> ? ? ? see http://water.com for more on this software
> 
> *water.mk <http://water.mk>:*
> 
> 
> WATER_VERSION:= 1.0.0

 Buildroot has the convention to use = assignments, not :=, except in the cases
where really needed. Also we put spaces around the =.

> WATER_SITE:= /home/laptop105/sama5_abi/abi_package/asd

 It's probably better to use a relative path here (relative to buildroot dir).

> WATER_SITE_METHOD:=local
> WATER_INSTALL_TARGET:=YES

 This is the default so not needed.

> 
> define WATER_BUILD_CMDS
> ? ? ? ? $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> endef
> 
> define WATER_INSTALL_TARGET_CMDS
> ? ? ? ? $(INSTALL) -D -m 0755 $(@D)/ammu $(TARGET_DIR)/bin

 You should give the full path as the last argument, so:

	$(INSTALL) -D -m 0755 $(@D)/ammu $(TARGET_DIR)/bin/ammu


> endef
> 
> define WATER_PERMISSIONS
> ? ? ? ?/bin/ammuf 4755 0 0 - - - - - 

 You really want to make it setuid? Normally, you shouldn't need a _PERMISSIONS
entry at all.

> endef
> 
> $(eval $(generic-package))
> 
> *STEP 3:**
> *
> *
> *
> *buildroot-at91/package/Config.in inside the? file i put*
> *
> *
> *
> menu "Misc"
> ? ? *source "package/water/Config.in"*
> endmenu
> 
> *
> *
> *STEP 4:*
> *? ??*
> *? ? ? ? ? ? ? ? ? ? make atmel_sama5d3_xplained_mmc_defconfig*
> *? ? ? ? ? ? ? ? ? ? make menuconfig*
> *

 Another 'make' is needed here.

 Regards,
 Arnout

> *
> 
> *
> *
> *
> *
> 
> 
> Thanks
> With regards?
> abinaya
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
