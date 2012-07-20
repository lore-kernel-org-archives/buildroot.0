From: Richard Braun <rbraun@sceen.net>
Date: Sat, 21 Jul 2012 01:31:36 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <20120720222722.5f89af04@skate>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <20120720222722.5f89af04@skate>
Message-ID: <20120720233136.GA25851@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 20, 2012 at 10:27:22PM +0200, Thomas Petazzoni wrote:
> Well, the use case for those targets was the following: I am making
> modifications to the source code of a package (especially using the
> OVERRIDE_SRCDIR mechanism) and I want to easily restart the build of
> that package and recreate the filesystem image so that I can test the
> new version of my package on the target. That's the reason why the
> target restarts the build *and* recreates the target filesystem.

To clarify my point of view: the intended behaviour is obvious, and
I assumed the original author knew what he wanted when these targets
were added. But my use cases are rather the following: I am making
modifications to the source code of a package, and I want to easily use
the environment provided by buildroot (the toolchain, the staging
directory and the target optimizations, maybe others). If it fails, it
will stop in either case. But if it succeeds, I want to easily check the
output and make sure the build process produced the expected results
(I mostly check compiler warnings, sometimes the generated code). If I
am confident in the results, I just add && make (which is short and
simple enough) to get the current behaviour.

I usually use buildroot with two flavors of configuration: a production
one, and a developer one (with debugging symbols, target debugging tools
such as valgrind, sometimes -O0 executables). This can result in huge
images, so getting to that step while the build of the package I'm
working on didn't reach a state I can confidently validate doesn't make
sense. And when it does (and even if it doesn't), simply adding
"&& make" does the job.

I'd also be glad to read from others, though, and hope you give much
attention to the code you're working on too :-).

-- 
Richard Braun
