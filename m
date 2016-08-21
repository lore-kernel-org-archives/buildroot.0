From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 21 Aug 2016 22:38:20 +0200 (CEST)
Subject: [Buildroot] rust?
In-Reply-To: <CAK7rcp_PjZ996EDpV6jH_Bf+MQ6d37Sc+xd67g5Fyup4J-F2Bw@mail.gmail.com>
Message-ID: <72066535.246526136.1471811900780.JavaMail.root@zimbra32-e6.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

----- Mail original -----
> So, is anybody following this:
> 
> 
> https://github.com/elebihan/buildroot.git
> 
> ?
> 
> I'm trying to use it to compile a particular version of rust and
> cargo
> with the buildroot internal cross compilers in order to add a uclibc
> target. There doesn't seem to be much direction on how to use the
> scripts included in order to add a particular target. In particular,
> I
> had to make some modifications to even make it useful to enable
> uclibc
> as a potential target. Does someone have an example invocation that
> can be used to derive a valid buildroot target? Because I got errors
> trying to use the python script. I think that's all that I need, is
> an
> example.

To cross-compile Rust, a target should be specified. To add a new target,
two files are needed:

- the target configuration: a Makefile fragment providing information
about the cross-compiler and such things.
- the target specification: a JSON configuration file describing the
target architecture and options for the linker.

The Python script provided by the patch series generates these two
files as follow:

- the target configuration file is created by finding one from
the Rust source tarball which matches the new target and updating
it.
- the target specification file is created from scratch using a
set of predefined values in a CSV string named SPEC_DATABASE_CONTENTS
in the Python script.

The Rust tarball does not provided target configurations for uclibc
(only for musl). So to add support for uclibc:

1. a new file should be added in mk/cfg 
(e.g.: mk/cfg/mips-unknown-linux-uclibc.mk).
2. a new entry should be added in the SPEC_DATABASE_CONTENTS variable
in the Python script.

Note that musl is not supported by the patch series I provided (I should
spend some time on it soon). 
Theoretically, musl should serve as a template for uclibc though...

Have you created such files? If so, would you care to share them? I'll
happily improve the script if needed.

BTW, please use the latest patches available in Buildroot patchwork, or the
feature/rust-v5 branch of my Github repository.

P.S.: I'm AFK, so replies may be delayed.

Regards,

--
ELB
