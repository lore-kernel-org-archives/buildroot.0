From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 15:58:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: fix rpc.h install path
In-Reply-To: <CAPi7W818B2yDd4Kh1jgb98gn0gK0kORPKtFPzmdxZcc_bqQ3BA@mail.gmail.com>
References: <20210717133225.470326-1-james.hilliard1@gmail.com>
 <CAPi7W818B2yDd4Kh1jgb98gn0gK0kORPKtFPzmdxZcc_bqQ3BA@mail.gmail.com>
Message-ID: <20210717135844.GR12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, James, All,

On 2021-07-17 15:48 +0200, Fabrice Fontaine spake thusly:
> Le sam. 17 juil. 2021 ? 15:32, James Hilliard
> <james.hilliard1@gmail.com> a ?crit :
> >
> > When libtirpc installs rpc.h with autoconf it installs it to:
> > $(HOST_DIR)/include/tirpc/rpc/rpc.h
> >
> > As this is the expected path we need to do the same.
> >
> > This should fix the previous attempt at fixing host-nfs-utils:
> > b991962993357092625e5b18d8203acd1e9b8b1f
> Thanks for trying to fix my mess but I think the issue is raised
> because rpc.h is not self sufficient.

Agreed.

> Here is an extract of
> http://autobuild.buildroot.org/results/836/83648a39e960d8f4db0e86ddb48db4b7dd9f91cf//host-nfs-utils-2.5.4/config.log:
> 
> configure:19291: checking rpc/rpc.h usability
> configure:19291: /usr/bin/gcc -c -O2
> -I/home/buildroot/autobuild/run/instance-0/output-1/host/include
> -I/home/buildroot/autobuild/run/instance-0/output-1/host/include
> -D_GNU_SOURCE  conftest.c >&5
> In file included from conftest.c:70:0:
> /home/buildroot/autobuild/run/instance-0/output-1/host/include/rpc/rpc.h:70:61:
> fatal error: rpc/rpcb_clnt.h: No such file or directory
>  #include <rpc/rpcb_clnt.h> /* rpcbind interface functions */
>                                                              ^

Yup.

> I sent a new serie here:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=253968

Ah, good, this is exactly what I was testing here. I'll look at your
series, then.

Regards,
Yann E. MORIN.

> > Fixes:
> > http://autobuild.buildroot.net/results/990/990b5e59bacea855c8fce4abb0902bc72422c067
> >
> > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/libtirpc/libtirpc.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
> > index 8cdc453cd4..fd62ab1f85 100644
> > --- a/package/libtirpc/libtirpc.mk
> > +++ b/package/libtirpc/libtirpc.mk
> > @@ -21,7 +21,7 @@ LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
> >  LIBTIRPC_CONF_OPTS = --disable-gssapi
> >
> >  define HOST_LIBTIRPC_INSTALL_CMDS
> > -       $(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/rpc.h $(HOST_DIR)/include/rpc/rpc.h
> > +       $(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/rpc.h $(HOST_DIR)/include/tirpc/rpc/rpc.h
> >         $(INSTALL) -D -m 0644 $(@D)/tirpc/rpc/types.h $(HOST_DIR)/include/rpc/types.h
> >         $(INSTALL) -D -m 0644 $(@D)/tirpc/netconfig.h $(HOST_DIR)/include/netconfig.h
> >  endef
> > --
> > 2.25.1
> >
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
