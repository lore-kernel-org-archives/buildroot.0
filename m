From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Thu, 14 Jan 2016 16:45:07 +0530
Subject: [Buildroot] [PATCH V3] Adding support for NVME utils
In-Reply-To: <20160114100435.6cec7d91@free-electrons.com>
References: <20160112054917.5859.13862.stgit@localhost.localdomain>
 <20160112212700.01ce8859@free-electrons.com>
 <56962F72.60007@linux.vnet.ibm.com>
 <20160113123820.3efe098e@free-electrons.com>
 <569720FF.6020807@linux.vnet.ibm.com>
 <20160114100435.6cec7d91@free-electrons.com>
Message-ID: <5697833B.5000007@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the detailed explanation,
updated your comments and sent new version of Patch.

Thanks
Mamatha

On 01/14/2016 02:34 PM, Thomas Petazzoni wrote:
> Hello,
>
> Please don't reply to me directly, always keep the list in Cc.
>
> On Thu, 14 Jan 2016 09:45:59 +0530, Mamatha Inamdar wrote:
>
>> I am facing two issues here.
>>
>> 1) NVME_VERSION = 0.1
>>       If I update version as 0.1 and compile the build, It's unable to
>> build and following errors occur
> You need to do:
>
> NVME_VERSION = v0.2
> NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
>
> (and not define the NVME_SOURCE variable)
>
> Note that I've changed the version from 0.1 to 0.2, since 0.2 is
> available, so you should use this one.
>
>
>> 2) Second issue is...If I use the install-bin target Like this:
>>
>> $(TARGET_MAKE_ENV) $(MAKE) -C (@D) DESTDIR=$(TARGET_DIR) install-bin
>>
>> I don't see nvme tool installed in sbin/bin, but it works for the
>> following install command
> Because you also need to set PREFIX=/usr otherwise it gets installed
> in /usr/local.
>
> A few other things:
>
>   *) You need to patch the Makefile to remove -m64 and -Werror otherwise
>      it won't build
>
>   *) You need to pass $(TARGET_CONFIGURE_OPTS) on the left hand side of
>      $(MAKE) rather than the right hand side so that the CFLAGS from
>      $(TARGET_CONFIGURE_OPTS) don't override the ones defined in the
>      Makefile. Without this, -std=gnu99 is no longer passed in the CFLAGS,
>      and the package fails to build.
>
>   *) INCLUDEDIR="-I." becomes useless.
>
>   *) You need to pass LIBUDEV=1 to disable using the udev library. If
>      you don't do this, the Makefile looks on the host machine if libudev
>      is installed to determine whether it should enable udev support or
>      not, which is completely wrong since we're cross-compiling.
>      Alternatively, you could optionally add libudev support if you
>      want, but that's not mandatory.
>
>   *) Since the upstream project is named nvme-cli, I think the Buildroot
>      package should also be named nvme-cli.
>
> All in all, I had a .mk file that looks like this:
>
> NVME_VERSION = v0.2
> NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
> NVME_LICENSE = GPLv2
> NVME_LICENSE_FILES = COPYING
>
> # LIBUDEV=1 indicates that we don't want udev support
> define NVME_BUILD_CMDS
> 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> 		LIBUDEV=1 -C $(@D)
> endef
>
> define NVME_INSTALL_TARGET_CMDS
> 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
> 		PREFIX=/usr install-bin
> endef
>
> $(eval $(generic-package))
>
> Hope this helps,
>
> Thomas
