From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 24 May 2016 14:36:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-23
In-Reply-To: <20160524063023.4C8B610173F@stock.ovh.net>
References: <20160524063023.4C8B610173F@stock.ovh.net>
Message-ID: <574458DE.4040302@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

On 24/05/16 07:30, Thomas Petazzoni wrote:
> ===================
> 
>          arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/24a35b63921cb9d747052f3bbfc3549ed20e18d7/
>     mips64el |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/af1eec00e472349c7dca76dcc8dd5cd37d82f5c3/
>        nios2 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/af3743bc0840cecf13664c081d6d205e5a8c9eca/
>     mips64el |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/6593e1ca94f98e3c2a5fd90401f709cf2f7b1743/
>          arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/5937a416c1f320a581b54a7bc61cbb69075e9e43/
>       mipsel |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/5ff215f7c91411fef335890d8a86a3482dfdac3b/

I've been looking at these ones and they fail due to some changes made
in the Linux kernel that causes conflicts between Linux's linux/if.h and
glibc's net/if.h.

The failure looks like this in collectd's config.log:

linux/if.h:71:2: error: redeclaration of enumerator 'IFF_UP'
      IFF_UP    = 1<<0,  /* sysfs */

net/if.h:44:5: note: previous definition of 'IFF_UP' was here
      IFF_UP = 0x1,  /* Interface is up.  */

And like this on conman:

linux/if.h:86:2: error: redeclaration of enumerator 'IFF_DYNAMIC'
  IFF_DYNAMIC   = 1<<15, /* sysfs */

net/if.h:79:5: note: previous definition of 'IFF_DYNAMIC' was here
     IFF_DYNAMIC = 0x8000 /* Dialup device with changing addresses.  */

This problem has been already fixed upstream:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4a91cb61bb995e5571098188092e296192309c77

Anyone has an idea how to workaround this downstream?

Regards,

Vincent.
