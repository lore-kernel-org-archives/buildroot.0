From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 27 Aug 2018 23:01:18 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <87efek9ozo.fsf@dell.be.48ers.dk>
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk>
 <20180815213421.08e0a3b6@windsurf> <87ftzf9v7u.fsf@dell.be.48ers.dk>
 <20180816001829.3f7a1436@windsurf>
 <CAAXf6LVNs8470+VwKJCM68cHdp+ZgD-JxEpCbUpMXte4JYm68Q@mail.gmail.com>
 <20180816220655.37fbff34@windsurf>
 <CAAXf6LX52KbkJ3AHfvG4ZMZvRHtpcqUHfo98JeTjFnuWWfMWNg@mail.gmail.com>
 <CAAXf6LW1V3FLD8B=BQ=nGO3guTfR6Xsk2JtRFc5aei-ZP=hbcQ@mail.gmail.com>
 <CAAXf6LVAjPadPVB1Ubq_M=i1s8746fVAWNDvYm8dK_ZTBMbQgQ@mail.gmail.com>
 <87in3w9qjj.fsf@dell.be.48ers.dk> <20180827102815.23605ecd@windsurf>
 <87efek9ozo.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUwdkE_DGPV88Xma5LqJkYpr=+0Xhyg50hFhnQXEhkmrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

El lun., 27 ago. 2018 a las 10:45, Peter Korsgaard
(<peter@korsgaard.com>) escribi?:
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > Hello,
>  > On Mon, 27 Aug 2018 10:12:16 +0200, Peter Korsgaard wrote:
>
>  >> > I.e. there is preprocessing of the dts file, then the actual
>  >> > compilation via dtc.
>  >> > With this in mind, I actually don't think that this behavior is
>  >> > negatively impacted by my changes. I now think it is a failure on top
>  >> > of the original failures. When I undo my changes prior to running this
>  >> > command, then the same errors occur. And since no other binary than
>  >> > the compiler (preprocessor) and the prebuilt dtc is used, there cannot
>  >> > be other impact of the changes I did to two header files.
>  >>
>  >> > Nevertheless, this defconfig still does not build correctly.
>  >>
>  >> :/
>  >>
>  >> I guess giving the timing, the best solution for 2018.08 is to simply
>  >> revert the dtc bump?
>
>  > Is this fixing all issues we have, without introducing other problems ?
>  > If so, then I'm fine with a revert of the dtc bump, of course.
>
> That was my understanding based on Yann's git bisect, yes. These
> defconfigs all used to work.

With this information (that was new to me) I bisected into dtc itself.
Culprit commit entered into v1.4.6 and is:
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=c8b38f65fdec4226d43f0e8eb

commit c8b38f65fdec4226d43f0e8eb5cf541aff3c80a5 (HEAD, refs/bisect/bad)
Author: David Gibson <david@gibson.dropbear.id.au>
Date:   Wed Oct 18 17:22:40 2017 +1100

    libfdt: Remove leading underscores from identifiers

    In a lot of places libfdt uses a leading _ character to mark an identifier
    as "internal" (not part of the published libfdt API).  This is a bad idea,
    because identifiers with a leading _ are generally reserved by the C
    library or system.  It's particularly dangerous for libfdt, because it's
    designed to be able to be integrated into lots of different environments.

    In some cases the leading _ has no purpose, so we simply drop it.  In most
    cases we move it to the end, as our new convention for marking internal
    identifiers.

    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>


In this commit, not only include guards are changed, but also actual
identifiers.

While the above commit fixes the fdt types issues, the other issue I
got after applying my fix (assertion error) is caused by a later
commit, introduced in v1.4.7:

https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=df536831d02c51556a8e88cd8da0be0244484156
commit df536831d02c51556a8e88cd8da0be0244484156 (HEAD, refs/bisect/bad)
Author: Rob Herring <robh@kernel.org>
Date:   Tue Feb 13 17:00:59 2018 -0600

    checks: add graph binding checks

    Add checks for DT graph bindings. These checks check node names,
    unit-addresses and link connections on ports, port, and endpoint nodes.

    The graph nodes are matched by finding nodes named 'endpoint' or with a
    'remote-endpoint' property. We can't match on 'ports' or 'port' nodes
    because those names are used for non-graph nodes. While the graph nodes
    aren't really buses, using the bus pointer to tag matched nodes is
    convenient.

    Signed-off-by: Rob Herring <robh@kernel.org>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Backtrace from a quick gdb session:

Program received signal SIGABRT, Aborted.
0x00007ffff7a4b010 in raise () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff7a4b010 in raise () from /lib64/libc.so.6
#1  0x00007ffff7a4cc0d in abort () from /lib64/libc.so.6
#2  0x00007ffff7a427e7 in ?? () from /lib64/libc.so.6
#3  0x00007ffff7a428a2 in __assert_fail () from /lib64/libc.so.6
#4  0x0000555555560a6f in propval_cell ()
#5  0x000055555555b536 in check_graph_child_address ()
#6  0x0000555555558dc8 in check_nodes_props ()
#7  0x0000555555558df6 in check_nodes_props ()
#8  0x000055555555a4d7 in run_check ()
#9  0x000055555555c2cf in process_checks ()
#10 0x0000555555558797 in main ()

I haven't dug deeper. It could be that some patching is needed in
host-dtc itself, to solve the above error.

/Thomas
