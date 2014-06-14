From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 09:57:43 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZUQhgXHBpRQX1Gzde3x4uOgXTHdqS3=b2pc7f6KCdD1jPg@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
 <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
 <20140606113148.464ff3c8@core2quad.morethan.org>
 <CAE9DZUTpc3+jAZKNi8mrDDTmZDyZUQ1Z_-aymUP6h743buZqRw@mail.gmail.com>
 <CAHkwnC8ZyLMTLeHH2CVDS__EQFU0bYcWWb12ppygreRDU70PPg@mail.gmail.com>
 <CAE9DZURzUZzenZMwfciAWQgQXFp7fbSg1wPHcJc54SCsmuUdhQ@mail.gmail.com>
 <CAHkwnC8ud8QUt85XbHJfUnMvjXGbvWGtDqg_SuTyV_QJt2OUEw@mail.gmail.com>
 <CAE9DZUQhgXHBpRQX1Gzde3x4uOgXTHdqS3=b2pc7f6KCdD1jPg@mail.gmail.com>
Message-ID: <20140614095743.4b60810d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

(Seems like your e-mail client has major issues with line wrapping).

On Fri, 13 Jun 2014 19:52:15 -0500, Dallas Clement wrote:

> Fabio, I have some good news!  I had commented out the .NOTPARALLEL
> in the top-level
> makefile earlier, but I was not setting BR2_JLEVEL correctly, as I was
> doing so from
> a wrapper makefile.  Anyhow, parallel building is working for me now
> after fixing my mistake.
> When I started this journey, my build times were about 1 hour and 50
> minutes.  After
> enabling ccache they were reduced to about 1 hour.  With parallel
> package building,
> all 8 of my CPU cores are near 100% the whole time, and build times
> are now only 14 minutes!!!
> 
> You are a beautiful man!  Thank you for all you have done to get this
> working.

That's indeed a very significant improvement. However, be careful that
using top-level parallel builds makes builds non-reproducible: we do
not guarantee that from one build to the other you'll get the same
result. You might even get failures sometimes, and then success. Or the
other way around. That's why we don't allow top-level parallel build by
default.

Unfortunately, the only way to fix this is to have per-package sysroot,
and doing this will involve a lot more preparation work before starting
the build of each package, which will certainly reduce the benefit of
top-level parallel build. That's something that needs to be worked on,
but it's far from being a trivial problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
