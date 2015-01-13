From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 13 Jan 2015 09:10:33 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-01-12
In-Reply-To: <20150113094943.18230555@free-electrons.com>
References: <20150113073016.3005C100E75@stock.ovh.net>
 <20150113094943.18230555@free-electrons.com>
Message-ID: <CA+-urNTg026AMDJ6PAR_c+Za0jyDcMJwJhYbf+TAmEnyz4yxLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 13, 2015 at 3:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> See below an analysis of the build failures. Gregory, Johan, Frank,
> Gustavo, Ezequiel, Paul, Yann, there are questions for you below,
> please read on. Thanks!
>
> On Tue, 13 Jan 2015 08:30:16 +0100 (CET), Thomas Petazzoni wrote:
>
> >          sh4 | checking whether /home/peko... | TIM | http://autobuild.buildroot.net/results/e10fde8dd5f4e0c74a31c4856a9a8786d4cf10fb/
>
> Ignore.
>
> >         bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/f0c00f82b59c7a45bb08bf555ccd01e9918283aa/
>
> ini/ini_fileobj.c:196: error: expected declaration specifiers or ???...??? before ???iconv_t???
> ini/ini_fileobj.c: In function ???initialize_conv???:
>
> Maybe ding-libs need libiconv for toolchains that don't have locale
> support.
>
> Gregory, since you added the ding-libs package, can you have a look?
>
> >          arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/59d9a417639303e7d28d5ad18633192e460894c1/
>
> This should already be fixed by
> http://git.buildroot.net/buildroot/commit/?id=a5f3db697f37d81b87a99dc3fdce9a6a7f4e0754.
>
> >         bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/4004e869b528e579e98c2935bece9a42a897f322/
>
> freetype doesn't say it should link against bzip2 for static builds.
> Someone to look into this?
>
> >      powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/63352d31006f9ea8eb589487b506fbb9f126edae/
> >      powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/49604ba7b7e6bc55031a4f252d470b3f1a689932/
> >          arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/eaeb75b9538765693e7c025f6a72af2caaf2a819/
> >          arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/05a1849f81c66c4c15e91fc13abc881e35cc05bc/
>
> Not sure what this is:
>
> beam/erl_bif_re.c: In function 'erts_init_bif_re':
> beam/erl_bif_re.c:68:5: error: 'erts_pcre_malloc' undeclared (first use in this function)
> beam/erl_bif_re.c:68:5: note: each undeclared identifier is reported only once for each function it appears in
> beam/erl_bif_re.c:69:5: error: 'erts_pcre_free' undeclared (first use in this function)
> beam/erl_bif_re.c:70:5: error: 'erts_pcre_stack_malloc' undeclared (first use in this function)
> beam/erl_bif_re.c:71:5: error: 'erts_pcre_stack_free' undeclared (first use in this function)
>

This can happen when the #include "pcre.h" in erl_bif_re.c picks up a
system pcre.h rather than erts/emulator/pcre/pcre.h. Erlang has had a
patched version of pcre for a while, so I'm surprised that this is
coming up now. However, I do see in the build that -I
output/host/usr/include comes before -Ipcre in the gcc command line.
E.g.,

/usr/bin/gcc  -Werror=return-type   -O3 -fomit-frame-pointer
-I/home/fhunleth/nerves/nerves-sdk-rpi/buildroot/output/host/usr/include
-I/home/fhunleth/nerves/nerves-sdk-rpi/buildroot/output/build/host-erlang-17.4/erts/x86_64-unknown-linux-gnu
  -fno-tree-copyrename
-I/home/fhunleth/nerves/nerves-sdk-rpi/buildroot/output/host/usr/include
-D_GNU_SOURCE -DERTS_SMP -DHAVE_CONFIG_H -Wall -Wstrict-prototypes
-Wmissing-prototypes -Wdeclaration-after-statement -DUSE_THREADS
-D_THREAD_SAFE -D_REENTRANT -DPOSIX_THREADS
-D_POSIX_THREAD_SAFE_FUNCTIONS   -Ix86_64-unknown-linux-gnu/opt/smp
-Ibeam -Isys/unix -Isys/common -Ix86_64-unknown-linux-gnu -Ipcre
-Ihipe -I../include -I../include/x86_64-unknown-linux-gnu
-I../include/internal -I../include/internal/x86_64-unknown-linux-gnu
-c beam/erl_bif_re.c -o
obj/x86_64-unknown-linux-gnu/opt/smp/erl_bif_re.o

I'm a little confused on the semantics of #include path searching,
though. Shouldn't a "system" path like output/host/usr/include come
last on the gcc command line after the Erlang -I options, so that
system headers don't hide local ones? Is that possible with autotools
packages and buildroot?

Frank
