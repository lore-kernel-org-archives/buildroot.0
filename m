From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Mon, 04 Aug 2014 21:53:32 +0200
Subject: [Buildroot] [PATCH v2] bcache-tools: Adding package.
In-Reply-To: <20140803185340.GI4052@free.fr>
References: <1406839219-10929-1-git-send-email-jcd@tribudubois.net>
 <20140803185340.GI4052@free.fr>
Message-ID: <53DFE4BC.5020401@tribudubois.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A little question:

Le 08/03/2014 08:53 PM, Yann E. MORIN a ?crit :
> Jean-Christophe, All,
>
> On 2014-07-31 22:40 +0200, Jean-Christophe DUBOIS spake thusly:
>> +define BCACHE_TOOLS_BUILD_CMDS
>> +	$(BCACHE_TOOLS_FIX_PKGCONFIG)
>> +	$(BCACHE_TOOLS_MAKE_ENV) $(MAKE) -C $(@D)
> This should probably be:
>      $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
>
> TARGET_CONFIGURE_OPTS contains the CC= assignment.
>
> Thus, the BCACHE_TOOLS_MAKE_ENV no longer makes sense, so you can remove
> it.

When I do as you propose then various compilation variables 
$(TARGET_CONFIGURE_OPTS) are passed as $(MAKE) arguments.

Therefore these variables cannot be overridden/changed in the Makefile 
(which might the the desired behavior) unless explicitly allowed with 
the "override" directive.

Unfortunately the bcache-tools Makefile needs (for now) to be able to 
override the CFLAGS variable.

So I can certainly "patch" the bcache-tools Makefile (in the post 
extract hook for example) to allow "overriding" on the CFLAGS variable.

Another solution is to pass $(TARGET_CONFIGURE_OPTS) as environment 
variables to $(MAKE) in which case the various variables can still be 
modified by the Makefile.

Which of these 2 solutions is the preferred solution?

Is there another (more correct?) solution that would allow to change the 
CFLAGS variable contained in $(TARGET_CONFIGURE_OPTS)?

Thanks for your help.

JC

>
>> +endef
>> +
>> +define BCACHE_TOOLS_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
>> +	$(BCACHE_TOOLS_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> Ditto:
>      $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
>          DESTDIR=$(TARGET_DIR) install
>
> Regards,
> Yann E. MORIN.
>
>> +endef
>> +
>> +$(eval $(generic-package))
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
