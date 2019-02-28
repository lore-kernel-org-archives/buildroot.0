From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Thu, 28 Feb 2019 12:34:27 -0300 (BRT)
Subject: [Buildroot] GCC in my pc has been used during my customize
 package building
In-Reply-To: <201902281532433257768@hoperun.com>
References: <201902281532433257768@hoperun.com>
Message-ID: <872494767.3516883.1551368067037.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was looking at the original repository.

If i were you...

I would use CMake, get rid of those handcrafted Makefiles, and integrate with buildroot using the standard Cmake integration.

Honestly, those Makefiles are not good. I know they are meant to be simple, but they are not. Notice, for instance, your usage of pkg-config to define some LDFLAGS variable. This is not going to work correctly without some manual instalation of dependencies.

This is an example, just to show you that you should use something better, but that will give less headache in the near future (for instance, now...).

I don't think the problem is in buildroot here...

----- Mensagem original -----
> De: "zhou c" <zhou_c@hoperun.com>
> Para: "buildroot" <buildroot@busybox.net>
> Enviadas: Quinta-feira, 28 de fevereiro de 2019 4:32:43
> Assunto: [Buildroot] GCC in my pc has been used during my customize package building

> Sorry, Fix the mail.
> 
> ====================================================
> 
> Hi all,
> 
> I am new guy in buildroot developing, and maybe have some stupid
> questions.
> 
> I tried to integrate some package in github into buildroot for my
> requirements. Just like the following:
> 
>??? ################################################################################
>??? #
>??? # ioc-cbc-tools
>??? #
>??? ################################################################################
>??? IOC_CBC_TOOLS_VERSION = master
>??? IOC_CBC_TOOLS_SITE =$(call github,intel,ioc-cbc-tools,$(IOC_CBC_TOOLS_VERSION))
>??? IOC_CBC_TOOLS_LICENSE = BSD-3
>??? IOC_CBC_TOOLS_LICENSE_FILES = COPYING
>???
>??? define IOC_CBC_TOOLS_BUILD_CMDS
>??? $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
>??? endef
>???
>??? define IOC_CBC_TOOLS_INSTALL_CMDS
>??? $(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D) install
>??? endef
>???
>??? $(eval $(generic-package))
> 
> but the makefile in this project just like this:
> 
>??? $(OUT_DIR)/cbc_lifecycle: cbc_lifecycle.c
>??? gcc -o $@ $(CFLAGS) $(LDFLAGS) cbc_lifecycle.c -pthread -lacrn-mngr
>???
>??? clean:
>??? rm $(OUT_DIR)/cbc_lifecycle
> 
> It take "gcc" directly. But there isn't gcc in my "buildroot/output/host/bin".
> 
>??? buildroot $ find? output/host/ -name "*gcc"
>??? output/host/libexec/gcc
>??? output/host/lib/gcc
>??? output/host/bin/x86_64-linux-gcc
>??? output/host/bin/x86_64-xxx-linux-gnu-gcc
> 
> Could anybody give me some hints?
> 
> Thanks for any comments.
> 
> Thanks,
> Jerry
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
