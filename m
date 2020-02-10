From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 10 Feb 2020 16:20:55 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <20200210143008.1895547d@windsurf>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
 <20200205154226.0dca67b1@windsurf>
 <CAJtjsKY+bh8y6GxHGMr3ZNOApke_jxHXa_cYkHP9xGEWsYZh4A@mail.gmail.com>
 <20200210143008.1895547d@windsurf>
Message-ID: <CAJtjsKanOr6knqJeDJ84hv-68NdQRs164_NnTAkPsVAB16mYjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2020 at 2:30 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 10 Feb 2020 14:28:14 +0100
> Johan Oudinet <johan.oudinet@gmail.com> wrote:
>
> > > As we discussed, this does not seem to be needed, at least from my
> > > testing, so I dropped this.
> >
> > I've just tested it, doing a fresh compilation from buildroot/master
> > and I got the following error:
> > make[4]: Entering directory
> > '/home/johan/Documents/buildroot/output/build/erlang-22.2/lib/ssl/src'
> > make[4]: *** No rule to make target
> > '../../../bootstrap/lib/kernel/include/logger.hrl', needed by
> > '../ebin/dtls_connection.beam'.  Stop.
> >
> > Since Frank said this file is created by the save_bootstrap command, I
> > guess it is finally required.
>
> Frank indeed reported reaching the same error as the one you're seeing
> here. However, last week, I also did a fresh build, and did not get
> this issue. Weird.

Well, what's strange to me is why the ssl application is looking for
logger.hrl into erlang-22.2/bootstrap/lib/kernel/include. This file is
present in erlang-22.2/lib/kernel/include.
The erlang build system is a real mess to me. If I understand
correctly HOWTO/BOOSTSTRAP.md, the bootstrap directory is supposed to
contain what they call "primary bootstrap" content, which is code
compiled from source files in the lib{kernel,stdlib,compiler}.
I don't think logger.hrl is a compiled source code, it simply defines
a bunch of macros for logging purposes. So to my understanding, the
ssl application shouldn't look for it inside the bootstrap directory.

Investigating further into this issue, I found a strange file that
references logger.hrl from the wrong location: lib/ssl/src/deps/ssl.d
This file is created by the following rule in lib/Makefile:
$(DEP_FILE): $(ERL_FILES)
        $(gen_verbose)erlc -M $(ERL_FILES) \
        | sed "s@$(ERL_TOP)@../../.. at g" \
        | sed "s/\.$(EMULATOR)/\.$$\(EMULATOR\)/" \
        | sed 's@^dtls_@$$(EBIN)/dtls_@' \
        | sed 's@^inet_@$$(EBIN)/inet_@' \
        | sed 's@^ssl_@$$(EBIN)/ssl_@' \
        | sed 's@^tls_@$$(EBIN)/tls_@' \
        > $(DEP_FILE)

The idea to call erlc to generate a set of dependencies while we are
building erlang seems wrong to me... we probably need to bypass this
rule.
Hopefully, this file ssl.d is already present in the archive. So I
think a fix would be to remove bootstrap from the path to logger.hrl
via a sed command before calling make?

This might be a good idea to report this error upstream as well.

-- 
Johan
