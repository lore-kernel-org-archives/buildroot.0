From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Mon, 13 Feb 2017 10:31:53 -0800
Subject: [Buildroot] [RFC] optional automated unit-test execution with qemu
	user mode
Message-ID: <CAAkeqgXY8Xok9uz=nUZOcaSehbcSESxqrfCa43FV+5ZyG-EU6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I wanted to share something with the buildroot community in case it's
interesting. Basically, buildroot as it stands has all the infrastructure
in place to optionally execute cross-compiled unit tests for "customer"
(external) applications via qemu's user mode, this in turn may simplify and
speed up your continuous integration workflow (though obviously it's of
little use for packages that buildroot itself provides).

I wrote up my approach in this blog post:
http://yurovsky.github.io/2017/01/20/qemu-unit-tests/ focusing on ARM only
(though anything will work, barring one more thing to overcome if
endianness doesn't match between host and target, but there's a good
workaround) and I'm successfully using this for my own projects.

I think the implementation treads very lightly on the normal package recipe
process but basically:
- we add a trivial wrapper script that executes qemu-<cpu> with knowledge
of the staging directory
- recipes optionally add a hook to run, essentially, "make check" with that
wrapper. In my blog post I focused on automake which makes this easy via
its LOG_COMPILER but I'm sure other build systems can be integrated
- buildroot builds your package, runs "make check", and your unit tests are
executed as if they're native applications

I have a simple patch set implementing what's described in the blog post if
anyone is interested and I don't think it would take much work to make it
more generic (ie: not just ARM, not just automake) and I'd be happy to do
that if this is an (optional) feature that would be of interest to
buildroot.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170213/0c390b9b/attachment.html>
