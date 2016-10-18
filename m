From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 14:57:44 +0200
Subject: [Buildroot] [buildroot][PATCH 1/1] Fix: qt5webkit overwrites
 target python.
In-Reply-To: <CAKHhJn2_0viKJtaPk52rues5GBCN7pC=6AcpxgvZ0njmUNt7Ew@mail.gmail.com>
References: <CAKHhJn3pztmCS+bHrcMMnwXOm=qdRoBZMDQFLQazGBhWLtJFHg@mail.gmail.com>
 <CAKHhJn2_0viKJtaPk52rues5GBCN7pC=6AcpxgvZ0njmUNt7Ew@mail.gmail.com>
Message-ID: <20161018145744.084e6f61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 12:30:31 +0000, Johan Derycke wrote:
> Fixes issue with
> https://git.buildroot.net/buildroot/commit/?id=ac16793eaaabfced0312420759e3a66cdaa1ea8e
> 
> We make a link in $(@D)/bin/python:
> 
> define QT5WEBKIT_PYTHON2_SYMLINK
>   echo  $(@D)
>   mkdir -p $(@D)/bin
>   ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
> endef
> 
> But QT5WEBKIT_INSTALL_TARGET_CMDS copies $(@D)/bin/python to the target dir:
> 
> define QT5WEBKIT_INSTALL_TARGET_CMDS
>   cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
>   cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
>   $(QT5WEBKIT_INSTALL_TARGET_QMLS)
> endef
> 
> This overwrites the target python link with a bogus one.
> The bin folder only contains 'jsc' which is now optional.
> 
> 
> Signed-off-by: Johan Derycke <johan.derycke@barco.com>

Thanks, but that's not the best fix I believe. A much simpler fix is to
replace the python2 symlink logic by:

	mkdir -p $(@D)/host-bin/
	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python

and of course change:

QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)

to

QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)

*However*, Yegor keeps saying that qt5webkit builds fine with only
Python 3 installed on the host machine, which would make the original
commit irrelevant. However, I find this rather odd, since we really had
the issue pointed by previous autobuilder failures.

So, in the mean time, I would suggest to go with the fix that I suggest
above. It keeps the current solution of using host-python to build
qt5webkit, but fixes its implementation to behave properly.

Could you resubmit your patch after taking into account the above
suggestion?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
