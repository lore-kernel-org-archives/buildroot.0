From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Oct 2016 19:32:09 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-09-29
In-Reply-To: <20160930063021.782B5103059@stock.ovh.net>
References: <20160930063021.782B5103059@stock.ovh.net>
Message-ID: <20161001173209.GA3966@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2016-09-30 08:30 +0200, Thomas Petazzoni spake thusly:
> Build failures related to your packages:
> arm | snappy-1ff9be9b8fafc8528ca9... | http://autobuild.buildroot.net/results/f0abe301816e39eb4ae26d3e8cd42d90901d5ac5

This one is simple to explain: the libstdc++ from that toolchain uses
pthread symbols, like pthread_mutex_lock, pthread_once and so on...

Since this build is a static build, dependent libraries are not pulled
in automagically by way of the NEEDED flag, since they do not exist in
static libs.

Fixing the build is trivial: we could add -pthread to both of CFLAGS and
LIBS when calling configure. I have a patch that does exactly that.

However, looking more deeper into the output of the build, one can see
that snappy's buildsystem is usung libtool. It generates a libsnappy.la
file that seem to contain the require -pthread info:

   16 # Linker flags that cannot go in dependency_libs.
   17 inherited_linker_flags=' -pthread'
   18
   19  # Libraries that this one depends upon.
   20  dependency_libs=' /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/5.4.0/../../../../arm-buildroot-uclinux-uclibcgnueabi/lib/libstdc++.la -pthread'

But this is not picked up when linking the unittest program.

We could well disable the build of the unittest program, but there is
something that seems fishy nonetheless: why doesn't libtool grab it from
libsnappy.la in the first place?

Anyway, I'll post the patch for review...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
