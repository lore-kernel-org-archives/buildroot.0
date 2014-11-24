From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 21:45:00 +0100
Subject: [Buildroot] [PATCH 13/51] samba: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <20141124044922.GB2241@tarshish>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416775163-20215-14-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141124044922.GB2241@tarshish>
Message-ID: <20141124214500.58bd4f37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 24 Nov 2014 06:49:22 +0200, Baruch Siach wrote:
> Hi Thomas,
> 
> On Sun, Nov 23, 2014 at 09:38:45PM +0100, Thomas Petazzoni wrote:
> > +define SAMBA_INSTALL_INIT_SYSV
> > +	# install start/stop script
> > +	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
> > +		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
> > +	fi
> > +endef
> 
> Why not install the init script unconditionally like you did in vsftpd?

Well, when I saw how many packages were still installing init script
(and other files) conditionally, I kind of changed my mind mid-way
through the patch series, and therefore for the remaining patches
decided to keep things as they were: keep the condition when it was
there, and keep the direct installation with no condition when it was
done this way.

We certainly need a decision about whether we want those conditions
everywhere. Their role is to potentially allow the users to provide a
custom version of those scripts (or configuration files) in the
filesystem skeleton. I personally believe it's not a good idea, for two
reasons:

 * People should use a filesystem overlay and/or post-build script
   instead of a custom skeleton.

 * Why would we install our own stuff conditionally, while the
   build system of all packages install things unconditionally, making
   it anyway impossible for a target skeleton to customize all files.

Peter, your call?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
