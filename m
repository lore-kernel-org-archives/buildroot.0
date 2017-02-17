From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Feb 2017 08:02:25 +0100
Subject: [Buildroot] [RFC] optional automated unit-test execution with
 qemu user mode
In-Reply-To: <CAAkeqgXY8Xok9uz=nUZOcaSehbcSESxqrfCa43FV+5ZyG-EU6g@mail.gmail.com>
References: <CAAkeqgXY8Xok9uz=nUZOcaSehbcSESxqrfCa43FV+5ZyG-EU6g@mail.gmail.com>
Message-ID: <c9e34fda-65ac-47d3-39a9-3581b683108a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-02-17 19:31, Andrey Yurovsky wrote:
> I wanted to share something with the buildroot community in case it's
> interesting. Basically, buildroot as it stands has all the infrastructure in
> place to optionally execute cross-compiled unit tests for "customer" (external)
> applications via qemu's user mode, this in turn may simplify and speed up your
> continuous integration workflow (though obviously it's of little use for
> packages that buildroot itself provides).
> 
> I wrote up my approach in this blog
> post: http://yurovsky.github.io/2017/01/20/qemu-unit-tests/ focusing on ARM only
> (though anything will work, barring one more thing to overcome if endianness
> doesn't match between host and target, but there's a good workaround) and I'm
> successfully using this for my own projects.
> 
> I think the implementation treads very lightly on the normal package recipe
> process but basically:
> - we add a trivial wrapper script that executes qemu-<cpu> with knowledge of the
> staging directory
> - recipes optionally add a hook to run, essentially, "make check" with that
> wrapper. In my blog post I focused on automake which makes this easy via its
> LOG_COMPILER but I'm sure other build systems can be integrated
> - buildroot builds your package, runs "make check", and your unit tests are
> executed as if they're native applications

 I think this will fail as soon as you try to exec something, no? So if your
tests are implemented as scripts that call into executables, it's not going to
work...

 A much more generic approach is to rely on binfmt-misc and chroot into the
rootfs. Of course, this does require root access to set up.

 Also, I don't think the overhead of qemu-system is that big for running unit
tests, is it?

 Regards,
 Arnout

> 
> I have a simple patch set implementing what's described in the blog post if
> anyone is interested and I don't think it would take much work to make it more
> generic (ie: not just ARM, not just automake) and I'd be happy to do that if
> this is an (optional) feature that would be of interest to buildroot.



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
