From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Mar 2019 19:08:45 +0100
Subject: [Buildroot] [PATCH v10 1/6] binutils: install libiberty for
 host build
In-Reply-To: <20190318220340.GK14237@scaer>
References: <20190206091531.104591-1-aduskett@gmail.com>
 <20190318220340.GK14237@scaer>
Message-ID: <ab8fc5b3-e0b7-6594-cf7f-dd03ae8de643@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/03/2019 23:03, Yann E. MORIN wrote:
> First, with this very patch: it breaks hiost-gdb, which fails to build
> because there is an inconsistency with how ti tries to link with
> libiberty:
> 
>     http://autobuild.buildroot.org/results/109/1098d6380f12f5bbd6dbc69edb06bd953d1edc3d/build-end.log
> 
>     /usr/bin/ld: /home/buildroot/autobuild/instance-0/output/host/lib/libiberty.a(cplus-dem.o):
>     relocation R_X86_64_PC32 against symbol `_sch_istable' can not be used when making a shared object; recompile with -fPIC
>     /usr/bin/ld: final link failed: Bad value

 Maybe this is due to building host-binutils with --disable-shared
--enable-static? Maybe the solution is to just add --enable-shared, i.e. build
both shared and static?

 That does mean that ld etc. may now link dynamically with the various
libraries, but host tools should now be relocatable thinks to our rpath fixup,
so that shouldn't be a problem.

 Regards,
 Arnout
