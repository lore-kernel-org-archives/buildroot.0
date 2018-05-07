From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 17:44:55 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: fix build with static libcap and
 shared gnutls
In-Reply-To: <CAPi7W80B9u5MkAaha=Lu6O6J1-4FAKbkN-+bgwgnrGxa5a4Dvg@mail.gmail.com>
References: <20180407162234.12848-1-fontaine.fabrice@gmail.com>
 <20180503214024.71d04136@windsurf>
 <CAPi7W80B9u5MkAaha=Lu6O6J1-4FAKbkN-+bgwgnrGxa5a4Dvg@mail.gmail.com>
Message-ID: <20180507174455.34af249b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 May 2018 23:47:17 +0200, Fabrice Fontaine wrote:

> > Do you think you could have a look into this ?
> >  
> The issue was more subtle, init_lxc is a simple binary that LXC wants to be
> statically linked if it founds a static version of the only library that it
> needs: libcap. Indeed, this binary doesn't need gnutls or any other
> dependencies such as selinux or seccomp that are needed for liblxc.
> However, because AC_CHECK_LIB was added with its default behavior of adding
> gnutls to the global LIBS variable, linking of init_lxc was failing because
> gnutls was not static.
> So, I think my patch is the right fix and it has been merged upstream:
> https://github.com/lxc/lxc/commit/49bc916b1daa79cffe38fae32059bcdd985c8c8e.
> Moreover, the issue was raised because when BR2_SHARED_LIBS is set, the
> libcap package installs the static and the shared version of the library, I
> made a patch to change this behavior but I've not send it as it didn't fix
> the root cause of the issue.

OK, I understand better. It makes sense now thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
