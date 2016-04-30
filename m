From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 1 May 2016 01:04:30 +0200
Subject: [Buildroot] [PATCH 2/4] package/efl: bump to 1.17.0
In-Reply-To: <5724C7A2.7040704@gmail.com>
References: <1461790014-17051-1-git-send-email-romain.naour@gmail.com>
 <1461790014-17051-2-git-send-email-romain.naour@gmail.com>
 <572355E6.4040400@zacarias.com.ar>
 <f6b845e4-97b0-a3f5-57c5-dfce944dcd6a@gmail.com>
 <5724A39E.8000308@zacarias.com.ar> <5724C7A2.7040704@gmail.com>
Message-ID: <9c17ab05-1c5c-8c9d-66d8-9faa54f0578a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Le 30/04/2016 ? 16:56, Romain Naour a ?crit :
> Hi Gustavo,
> 
> Le 30/04/2016 14:22, Gustavo Zacarias a ?crit :
>> On 29/04/16 17:26, Romain Naour wrote:
>>
>>> Weird, I'm able to build host-efl here... let me retry again.
>>> Can you share your Buildroot config and the host-efl config.log ?
>>>
>>> Can you try to autoreconf the efl package ?
>>> EFL_AUTORECONF = YES
>>> EFL_GETTEXTIZE = YES
>>
>> Hi Romain.
>> It fails the same, so https://www.zacarias.com.ar/host-efl-config.log
>> and https://www.zacarias.com.ar/efl-defconfig.txt
> 
> I'm unable to reproduce your issue :-(
> 
> But probably the issue is here:
> USE_EVAS_LIBS='  [...] -lfreetype -L/usr/lib -lluajit-5.1 '
> 
> It seems that it doesn't use the luajit library from host-luajit package...
> Otherwise I don't know.

The .pc file is manually generated in the luajit Makefile, so it give a wrong
path for host-luajit.

$ host/usr/bin/pkgconf --cflags luajit
/usr/include/luajit-2.0

It should be:
$ host/usr/bin/pkgconf --cflags luajit
[...]output/host/usr/include/luajit-2.0

Can you try with this patch ?

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 623bfcc..0aab04d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -75,5 +75,11 @@ define HOST_LUAJIT_INSTALL_CMDS
        $(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" LDCONFIG=true -C $(@D) install
 endef

+define HOST_LUAJIT_FIX_PC_FILE
+       sed -i -e "s|^prefix=.*|prefix=$(HOST_DIR)/usr|"
$(HOST_DIR)/usr/lib/pkgconfig/luajit.pc
+endef
+
+HOST_LUAJIT_POST_INSTALL_HOOKS = HOST_LUAJIT_FIX_PC_FILE
+
 $(eval $(generic-package))
 $(eval $(host-generic-package))

Best regards,
Romain
> 
> Best regards,
> Romain
> 
>> Thanks!
>> Regards.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
