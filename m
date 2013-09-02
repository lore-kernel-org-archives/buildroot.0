From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Sep 2013 07:57:47 +0200
Subject: [Buildroot] host-icu No rule to make target
In-Reply-To: <2ACF8D649627456A8677BE38BC2E4484@tux.local>
References: <2ACF8D649627456A8677BE38BC2E4484@tux.local>
Message-ID: <522428DB.20700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/13 09:43, Gwyll Gwyllin wrote:
> Hello List,
> i?m new to buildroot (and i am a hungarian guy, so forgive me for my bad
> english).
> I?m trying to compile an embedded system for a bluechip device (mips
> architecture)
> If i set the TARGET environment variable to ?mipsel-unknown-linux-uclibc
> (as the documentation says), the compile process stops at
> host-icu-4.8.1.1 with the message:
> make[2]: *** No rule to make target `mipsel-unknown-linux-uclibc?, needed
> by `all-local?. Stop.
> Everything compiles well before host-icu.
> The source came with a script which sets up the environment as following:
> export PROJECT=bctre1
> export PRJROOT=/embedded/projects/${PROJECT}
> export ARCH=mips
> export TARGET=mipsel-unknown-linux-uclibc
> export TOOLSDIR=/embedded/toolchains/${PROJECT}
> export PATH=${TOOLSDIR}/bin:${PATH}
> export CROSS_COMPILE=${TARGET}-
> export _MIPS_SZPTR=32
> The host-icu compiles only if i unset the TARGET variable.

  That seems to be a bug in the ICU build system: in
source/stubdata/Makefile the TARGET variable is only assigned to in the 
ENABLE_STATIC, so in the other case it inherits from the environment.

>  In that case,
> the compile stops at iproute with this error:
> /bin/sh: xtables: command not found

  Somehow your iproute2 configure failed to find PKG_CONFIG. It seems 
that buildroot is missing a dependency on host-pkgconf, but it is anyway 
only used for tc which should only be built if iptables is selected and 
iptables has a dependency on host-pkgconf.

  Can you check in output/build/iproute2-3.7.0/Configure what is the 
value of PKG_CONFIG and of TC_CONFIG_XT? And can you check if 
BR2_PACKAGE_IPTABLES is enabled in your buildroot config?


  Regards,
  Arnout


> /embedded/projects/bctre1/buildroot/output/host/usr/bin/mipsel-buildroot-linux-uclibc-gcc
> -Wl,-export-dynamic  tc.o tc_qdisc.o tc_class.o tc_filter.o tc_util.o
> tc_monitor.o m_police.o m_estimator.o m_action.o m_ematch.o
> emp_ematch.yacc.o emp_ematch.lex.o q_fifo.o q_sfq.o q_red.o q_prio.o
> q_tbf.o q_cbq.o q_rr.o q_multiq.o q_netem.o q_choke.o q_sfb.o f_rsvp.o
> f_u32.o f_route.o f_fw.o f_basic.o f_flow.o f_cgroup.o q_dsmark.o
> q_gred.o f_tcindex.o q_ingress.o q_hfsc.o q_htb.o q_drr.o q_qfq.o
> m_gact.o m_mirred.o m_nat.o m_pedit.o m_skbedit.o m_csum.o p_ip.o
> p_icmp.o p_tcp.o p_udp.o em_nbyte.o em_cmp.o em_u32.o em_canid.o
> em_meta.o q_mqprio.o q_codel.o q_fq_codel.o em_ipset.o tc_core.o tc_red.o
> tc_cbq.o tc_estimator.o tc_stab.o  ../lib/libnetlink.a ../lib/libutil.a
> -L. -ltc -lm -ldl -o tc
> /embedded/projects/bctre1/buildroot/output/host/usr/lib/gcc/mipsel-buildroot-linux-uclibc/4.8.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld:
> cannot find -ltc
> collect2: error: ld returned 1 exit status
> make[2]: *** [tc] Error 1
> make[2]: *** Waiting for unfinished jobs....
> rm emp_ematch.lex.c
> make[2]: Leaving directory
> `/embedded/projects/bctre1/buildroot/output/build/iproute2-3.7.0/tc'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/embedded/projects/bctre1/buildroot/output/build/iproute2-3.7.0'
> make: ***
> [/embedded/projects/bctre1/buildroot/output/build/iproute2-3.7.0/.stamp_built]
> Error 2
> Could anyone give me some advice how to compile buildroot with the mips
> target?
> My compiler system is a XEN DomU Debian Lenny.
> Regards,
> Gwyll
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
