From: Will Newton <will.newton@gmail.com>
Date: Wed, 28 Mar 2012 15:00:36 +0100
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
	$(HOST_DIR)/opt/perl
In-Reply-To: <20120328151808.17795410@skate>
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
 <87fwctb4gn.fsf@macbook.be.48ers.dk>
 <20120328095532.71abc612@skate>
 <87bonhax4p.fsf@macbook.be.48ers.dk>
 <CAFbHwiQUZKJeD-F2z_EnPC=QE-FhuRDb3bZUenEjmprJE6MPGw@mail.gmail.com>
 <20120328125547.6873d986@skate> <20120328145211.470f0fc3@skate>
 <CAFbHwiQyqFR_S4XE7jT==e3waOzQQDBg=7bm+Kb500QK=Gvskw@mail.gmail.com>
 <20120328151808.17795410@skate>
Message-ID: <CAFbHwiS_oCLGfi5Pt4UGqVKsjT5j_bG5MTOKm7rGJm9+Pi_wAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 28, 2012 at 2:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 28 Mar 2012 14:01:56 +0100,
> Will Newton <will.newton@gmail.com> a ?crit :
>
>> [win at lemeta01 buildroot]$ env | grep LD_LIBRARY
>> [win at lemeta01 buildroot]$ ./output/host/usr/bin/arm-linux-readelf -a
>> ./output/host/usr/lib/perl/auto/XML/Parser/Expat/Expat.so | grep RPATH
>> [win at lemeta01 buildroot]$
>
> Ah, ah, this is our problem.
>
>> Although the makefiles do mention rpath, but that one does not seem to
>> be getting used either:
>
> We have a rpath set in HOST_LDFLAGS, but this variable doesn't seem to
> be used when building host-libxml-parser-perl. However, by
> Expat/Makefile contains LD_RUN_PATH="/opt/outputs/perl/host/usr/lib" in
> the environment when calling ld:
>
> LD_RUN_PATH="/opt/outputs/perl/host/usr/lib" cc ?-shared -O2 -g -L/usr/local/lib -fstack-protector Expat.o ?-o ../blib/arch/auto/XML/Parser/Expat/Expat.so ? ? ?\
> ? ? ? ? ? -L/opt/outputs/perl/host/usr/lib -lexpat
>
> And LD_RUN_PATH is used by ld as the RPATH when no -rpath option is
> used. I guess this LD_RUN_PATH is set because we run the Makefile.PL
> script with INSTALLSITELIB=/opt/outputs/perl/host/usr/lib/perl.
>
> Could you post the output of:
>
> rm -rf output/build/host-libxml-parser-perl*
> make

I think I may have a solution. It looks like Red Hat (and hence
CentOS) remove support for LD_RUN_PATH by default:

https://bugzilla.redhat.com/show_bug.cgi?id=136009

However there is a flag to turn it back on. Setting this seems to get
me a sane runpath. Does this look ok? I assume it will silently do
nothing on non-RH systems.
