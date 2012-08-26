From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Aug 2012 01:50:41 +0200
Subject: [Buildroot] json-c fix, question about -D_REENTRANT
In-Reply-To: <1345903992-27961-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1345903992-27961-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <503AB651.3010806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/25/12 16:13, Thomas Petazzoni wrote:
> The attached patch fixes the build of json-c when thread support is
> not available. This library does not require thread support: it was
> compatible with -D_REENTRANT in all cases, which is only possible when
> thread support is available.
>
> However, I didn't commit this directly, because I am not sure what the
> right fix is. My fix is to just get rid of -D_REENTRANT.
>
> However, according to
> http://pauillac.inria.fr/~xleroy/linuxthreads/faq.html#H, all code
> used in a multithreaded application should be built with -D_REENTRANT,
> even if this code itself is not creating/manipulating threads.

  Note that that FAQ is pretty old.

>
> So, technically, removing -D_REENTRANT seems like an incorrect: it
> should be kept if the toolchain supports thread.

  I looked at the source of uClibc 0.32 and 0.33, and it looks like they
automatically select the reentrant versions of errno and getc if
HAS_THREADS is defined.  As to the _r reentrant functions, they're
always there (except, for some reason, getlogin_r) - but for those you'd
anyway get a compile or link error.

  I expect glibc will always build the reentrant versions.

  So I guess you can remove the -D_REENTRANT.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
