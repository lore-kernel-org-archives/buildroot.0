From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:04:36 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: new package
In-Reply-To: <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
References: <20180112140107.15301-1-laurent_pubs@yahoo.com>
 <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
Message-ID: <20180112220436.677e3084@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 15:46:14 +0100, Yegor Yefremov wrote:

> > +# Run the bootstrap.sh command.
> > +# (from the 'lldpad Application Install' section of the README file)
> > +define OPEN_LLDP_BOOTSTRAP
> > +       (cd $(@D) && ./bootstrap.sh)
> > +endef  
> 
> m4 folder is missing. It is worth sending a patch upstream (open-lldp)
> to fix this. As long as you have this hook, you don't need
> OPEN_LLDP_AUTORECONF = YES, because boostrap.sh already invokes
> "autoreconf -i". At least thy this.

No, I disagree here. If you drop <pkg>_AUTORECONF = YES, then you loose
the dependency on host-autoconf, host-automake and host-libtool.

So instead, please keep <pkg>_AUTORECONF = YES, and if the missing m4
folder is the only problem (but I doubt it because the bootstrap.sh
script doesn't create it), then add a post-extract hook that creates
the m4 file.

> The package doesn't build:
> 
> In file included from lldpad.c:58:0:
> ./include/lldp_8021qaz.h:237:12: error: inline function
> ?ieee8021qaz_clif_cmd? declared but never defined [-Werror]
>  inline int ieee8021qaz_clif_cmd(void *data, struct sockaddr_un *from,
>             ^~~~~~~~~~~~~~~~~~~~
> ./include/lldp_8021qaz.h:222:13: error: inline function ?set_prio_map?
> declared but never defined [-Werror]
>  inline void set_prio_map(u32 *prio_map, u8 prio, int tc);
>              ^~~~~~~~~~~~
> ./include/lldp_8021qaz.h:221:12: error: inline function ?get_prio_map?
> declared but never defined [-Werror]
>  inline int get_prio_map(u32 prio_map, int tc);
>             ^~~~~~~~~~~~

Perhaps you could tell Laurent which configuration you've used to
produce this build failure, so that he can reproduce it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
