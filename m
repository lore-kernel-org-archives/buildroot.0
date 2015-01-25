From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 25 Jan 2015 16:44:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-01-24
In-Reply-To: <20150125073015.49B3C1013EF@stock.ovh.net>
References: <20150125073015.49B3C1013EF@stock.ovh.net>
Message-ID: <54C50F73.50702@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 25/01/2015 08:30, Thomas Petazzoni a ?crit :
> Build statistics for 2015-01-24
>              libselinux-2.1.13 | 2 

> 
> Detail of failures
> ===================
>         bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/9e25e908d100886ad0c0a108000c7a283c2e350b/
>         bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/af38d7a4199372f49f1e22504fbbfc321d7234ed/

For some reason, ld report some undefined symbols when building the shared library libselinux.so.1 on bfin.

[...] -Wl,-soname,libselinux.so.1,-z,defs,-z,relro

callbacks.c:(.text+0x82): undefined reference to `_security_check_context'
callbacks.c:(.text+0x92): undefined reference to `_is_selinux_enabled'
label.c:(.text+0x172): undefined reference to `_selinux_raw_to_trans_context'
label_db.c:(.text+0xe4): undefined reference to `_selinux_sepgsql_context_path'
label_file.c:(.text+0xa24): undefined reference to `_selinux_file_context_subs_dist_path'
label_file.c:(.text+0xa38): undefined reference to `_selinux_file_context_subs_path'
label_file.c:(.text+0xa4c): undefined reference to `_selinux_file_context_path'
label_media.c:(.text+0xf2): undefined reference to `_selinux_media_context_path'
label_x.c:(.text+0xee): undefined reference to `_selinux_x_context_path'
mapping.c:(.text+0x25a): undefined reference to `_avc_reset'
sestatus.c:(.text+0x17e): undefined reference to `_security_getenforce'
sestatus.c:(.text+0x214): undefined reference to `_security_deny_unknown'
collect2: ld returned 1 exit status

All missing symbols are defined in selinux_internal.h or avc_internal.h
by hidden_proto() which is defined in src/dso.h.

hidden_proto() add some asm code which depends on architecture:
# if defined(__alpha__) || defined(__mips__)
#  define hidden_def(fct) \
     asm (".globl " #fct "\n" #fct " = " #fct "_internal");
# else
#  define hidden_def(fct) \
     asm (".globl " #fct "\n.set " #fct ", " #fct "_internal");
#endif

I suppose this asm code is not supported on bfin.
Maybe disable libselinux on bfin ?

Best regards,
Romain Naour
