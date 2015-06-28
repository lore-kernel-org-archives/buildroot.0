From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 11:50:01 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
In-Reply-To: <499323654.2188387.1435335633378.JavaMail.root@openwide.fr>
References: <558D745D.6010606@andin.de>
 <499323654.2188387.1435335633378.JavaMail.root@openwide.fr>
Message-ID: <20150628115001.098430d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy,

On Fri, 26 Jun 2015 18:20:33 +0200 (CEST), Jeremy Rosen wrote:

> more answers in the mail below, but we have a trainee working on an
> automated test framework based on "Robot Framework" this summer and
> we planned to upstream it when we have something to show...

In fact, when I started working on this runtime test infrastructure, I
also posted on Google Plus about the available frameworks, and one of
the answers was Robot Framework. So I had a quick look, and definitely
could not understand how it can work: you are apparently not writing
the tests in some real programming language, but in some sort of weird
"tabular" format. I really don't understand how you can express
complicated test scenarios with such a limited language.

The Python unittest stuff just runs Python code, so you can express
whatever complicated test logic you want.

> Our approch was mainly to have each package (on the buildroot side
> have its own RFW scriptlet and have buildroot assemble these 
> scriptlets at make time to provide a test for the resulting system
> that would only contain the tests for whatever package was actually
> compiled in.

At some point I indeed though of having some per-package test cases
directly in package/<foo>/, for each package. But you also anyway need
to describe a complete Buildroot configuration for each test, in order
to have a complete system that actually boots and make sense.

And in fact, testing packages is not the only target of this "runtime
test infrastructure". I also want to validate core features like rootfs
overlay, post-build script, users/permission/device table, the myriad
possibilities of Linux kernel building, global patch directories, etc.

For example, not later than this week, I discovered that if you write:

FOO_OVERRIDE_SRCDIR = /path/to/sources/ 

Buildroot will rsync your *entire* root filesystem in
output/build/foo-custom/ if you had the crazy idea of leaving a
trailing space at the end of /path/to/sources.

> At this point it would be possible for us to switch back to any test
> framework if RFW is not the one the buildroot project wants to use
> but I personally think that RFW is really a good framework for high
> level system testing (opposed to single-software unit testing) it
> is very simple to learn by looking at examples, the keyword approch
> is very readable and adding our own modules in python is fairly 
> easy

Do you have examples on what the RFW test cases for Buildroot look like?

I've released my code with the intent that others can have a look and
get a clear view of what the prototype looks like. Without seeing how
it looks with RFW, I can't really make up my mind on whether it is a
good alternate solution or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
