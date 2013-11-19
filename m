From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 23:03:29 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
 helloworld module be compiled and added to the tartget with a local
 external source
In-Reply-To: <3258CDB0922447C482F9DCD445EEFB36@NKDELL>
References: <3258CDB0922447C482F9DCD445EEFB36@NKDELL>
Message-ID: <528BE031.5010100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/13 15:01, Nils Koehler wrote:
>
>>> Hi,
>>>
>>> I have goggled a lot the last three days to find out how to implement a
>>> own program and device driver, which is compiled and added to the target
>>> due buildroot make command, but I did not had success to solve it.
>>>
>>> Actually my problems is that:
>>>
>>> HELLOWORLD_SOURCE_DIR = /home/koehler/Desktop/Kernel/ldt/
>>
>>    Where did you get this variable from? We don't use SOURCE_DIR.
>
> mhh... I think, I mixed up some things, I have no idea where I did found it.
> I have changed now to the right keywords thank you...
>
> But after...
> make helloworld-rebuild all
>
> It is compiling and I can see that the compiled code is updated and present
> in the directory /buildroot-2013.08/Build/helloworld-1.0/
> So far so fine, but it is missing in the /buildroot-2013.08/target/bin/
> directory.
>
> What may be the problem right now?
> This is my actual .mk file:
>
> HELLOWORLD_VERSION = 1.0
> HELLOWORLD_SITE = /home/koehler/Desktop/Kernel/helloworld-1.0/
> HELLOWORLD_SITE_METHOD = local
> HELLOWORLD_LICENSE = GPLv3+
> HELLOWORLD_INSTALL_TARGET = YES
>
> define HELLOWORLD_BUILD_CMDS
>      $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> endef
>
> define HELLOWORLD_INSTALL_TARGET_CMDS
>      $(INSTALL) -D -m 0755 $(@D)/helloworld $(TARGET_DIR)/bin
> endef
>
> define HELLOWORLD_DEVICES
>      /dev/ldt  c  666  0  0  42  0  -  -  -
> endef
>
> define HELLOWORLD_PERMISSIONS
>      /bin/helloworld  f  4755  0  0  -  -  -  -  -
> endef
>
>
> #$(eval $(generic-package))

  Do you really have this line commented out? Without it, there will be 
no helloworld package, so 'make helloworld-dirclean' would give an error...


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
