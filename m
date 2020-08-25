From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 14:15:49 +0200
Subject: [Buildroot] [PATCH] Do not remove path from RPATH when it is
 needed for dlopen at runtime
In-Reply-To: <1569933210-12665-1-git-send-email-ysionneau@kalray.eu>
References: <2b2ed104-854c-8d70-9b57-30bd6bd2fe1a@kalray.eu>
 <1569933210-12665-1-git-send-email-ysionneau@kalray.eu>
Message-ID: <20200825141549.52d79ff2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Tue,  1 Oct 2019 14:33:30 +0200
Yann Sionneau <ysionneau@kalray.eu> wrote:

> Do not remove path from RPATH when it points to a directory containing no
> shared object present as DT_NEEDED in .dynamic section.
> The RPATH can pretty well be needed at runtime for dlopen.
> 
> This fixes tst-origin uClibc-ng unit test:
> https://github.com/wbx-github/uclibc-ng-test/blob/master/test/dlopen/Makefile.in#L25
> https://github.com/wbx-github/uclibc-ng-test/blob/master/test/dlopen/tst-origin.c#L15
> 
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>

It's been a long long while, but it turned out I was reported the exact
same issue (though not with uClibc-ng tests), and indeed a simple test
cases shows that patchelf is dropping RPATH entries if there's no
library in that directory with a corresponding DT_NEEDED entry in the
binary, which breaks dlopen() if it relies on RPATH entries.

So I've significantly rewritten your commit log, with more
explanations, and applied your patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
