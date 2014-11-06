From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Nov 2014 15:10:21 -0300
Subject: [Buildroot] [PATCH 7/7] ifupdown: new package
In-Reply-To: <CANxTyt70pdEdK30LwV47SDLOqsmR7xiGQPBa+z8gr4izwaZVwg@mail.gmail.com>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>	<1415281013-1077-8-git-send-email-gustavo@zacarias.com.ar>
 <CANxTyt70pdEdK30LwV47SDLOqsmR7xiGQPBa+z8gr4izwaZVwg@mail.gmail.com>
Message-ID: <545BB98D.4060400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/2014 03:00 PM, Danomi Manchego wrote:

>> +define IFUPDOWN_INSTALL_TARGET_CMDS
>> +       $(INSTALL) -m 0755 $(@D)/ifup $(TARGET_DIR)/sbin/ifup
> 
> No -D?

/sbin is part of the basic (FHS) skeleton dirs, there's no need.
It's not the common practice, but it's skipped in some packages for
those dirs.

>> +       $(INSTALL) -m 0755 -D $(@D)/settle-dad.sh \
>> +               $(TARGET_DIR)/lib/ifupdown/settle-dad.sh
>> +       ln -sf ifup $(TARGET_DIR)/sbin/ifdown
>> +       ln -sf ifup $(TARGET_DIR)/sbin/ifquery
>> +endef
> 
> If you patched Makefile's "ln: commands to have -f, then this would be
> equivalent to:
> 
> define IFUPDOWN_INSTALL_TARGET_CMDS
> $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) BASEDIR=$(TARGET_DIR) install
> endef
> 
> Which might be more immune to changes in created files?

I try to avoid patching unless it's really necessary.
Having generic install cmds is nice, but patches i think are lower
priority than custom INSTALL cmds unless it's something big like a dozen
files and directories of course.
Besides a patch can need reworking for a new version if things changed
in the Makefile.

> Just as an FYI .... I made an ifupdown.mk myself about six months ago,
> but ended up not needing it.  Compared to what you have here, I had
> done some extra stuff for compatibility with BusyBox ifupdown:
> 
> - In CFLAGS in BUILD_CMDS, I added:  -D'RUN_DIR="\"/var/run/\""'
> - In inet.defn, I replaced all the "/run" with "/var/run"
> - In main.c, I added "-f" option - ifupdown currently only accepts "--force"
> - in execute.c, I dropped the "--verbose" from run-parts
> 
> But perhaps BusyBox compatibility is not a goal here ...

Sorry, FHS again... /run is the recommended running info directory, we
shouldn't try to avoid it. In fact we should strive to move everything
out of /var/run IMHO.

Regards.
