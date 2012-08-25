From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 16:13:11 +0200
Subject: [Buildroot] json-c fix, question about -D_REENTRANT
Message-ID: <1345903992-27961-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The attached patch fixes the build of json-c when thread support is
not available. This library does not require thread support: it was
compatible with -D_REENTRANT in all cases, which is only possible when
thread support is available.

However, I didn't commit this directly, because I am not sure what the
right fix is. My fix is to just get rid of -D_REENTRANT.

However, according to
http://pauillac.inria.fr/~xleroy/linuxthreads/faq.html#H, all code
used in a multithreaded application should be built with -D_REENTRANT,
even if this code itself is not creating/manipulating threads.

So, technically, removing -D_REENTRANT seems like an incorrect: it
should be kept if the toolchain supports thread.

However, looking quickly at a number of other libraries, I don't see
any of them being careful about this. I know the -pthread gcc options
passes both the -lpthread linker option and the -D_REENTRANT compiler
option, but I don't see -pthread being used in libraries that don't
need thread support, but that may be used in a multithreaded
application.

Am I missing something?

Thanks,

Thomas
