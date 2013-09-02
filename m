From: Michael Rommel <rommel@layer-7.net>
Date: Tue, 3 Sep 2013 01:49:17 +0200
Subject: [Buildroot] [PATCH 2/3] aiccu: new package
In-Reply-To: <20130902105710.1d665e8f@skate>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <1378071216-19697-2-git-send-email-rommel@layer-7.net>
 <20130902105710.1d665e8f@skate>
Message-ID: <01465AC6-0A1C-4437-BFC2-2DF81EAF5A00@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On Sep 2, 2013, at 10:57 , Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

>> +AICCU_LICENSE_FILES = doc/LICENSE
>> +AICCU_DEPENDENCIES = gnutls
>> +
>> +define AICCU_BUILD_CMDS
>> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> 
> You could use:
> 
> 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> 
> TARGET_CONFIGURE_OPTS contains the definitions of CC, LD, CFLAGS,
> LDFLAGS, and more.

I tried this, but it aborted with a lot of errors. I couldn't find the description for this
in the manual - where should I look about these variables, it seems there are
a lot more, e.g. $(SED) that might be handy...


>> +define AICCU_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/unix-console/aiccu $(TARGET_DIR)/usr/sbin
>> +	$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf $(TARGET_DIR)/etc
>> +	$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
>> +		$(TARGET_DIR)/usr/sbin/S90aiccu
>> +endef
> 
> Either use 'make install' as Thomas suggested, or if it's really not
> possible, you need to make the second argument the complete filename,
> not only the destination directory.

I have now changed that in the latest submission. But I am not sure it is an 
improvement. I had to patch the Makefile, so that the correct, working 
version of the init script gets installed and had to manually correct the 
permissions in the .mk file. All in all, that makes the whole patch a lot 
larger.


> Moreover, the init script must be installed in /etc/init.d, not
> in /usr/sbin.

Yes, of course, my mistake!

> And finally, it should not be installed manually, but
> instead should use the INIT_SYSV mechanism. See the Buildroot manual,
> which states:
> 
>  LIBFOO_INSTALL_INIT_SYSV and LIBFOO_INSTALL_INIT_SYSTEMD list the
>  actions to install init scripts either for the systemV-like init
>  systems (busybox, sysvinit, etc.) or for the systemd units. These
>  commands will be run only when the relevant init system is installed
>  (i.e. if systemd is selected as the init system in the configuration,
>  only LIBFOO_INSTALL_INIT_SYSTEMD will be run). 

Actually I do not understand this well enough and the manual is 
not very explicit.

Now, either I shall use the "make install" approach, then I get what
the makefile does, which is "aiccu" in "/etc/init.d".

Or I can do it explicitly, which would then be more like:

+define AICCU_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
+		$(TARGET_DIR)/etc/init.d/S90aiccu
+endef

The Makefile does not support any other sensible targets, than
all and install. So I might be back to the original approach (of
course with the wrong dir corrected).

I'll send the submission and you can have a look what it looks
like now, after I incorporated your suggestions!

Thanks,

  Michael.

-- 
Michael Rommel, Erlangen, Germany
