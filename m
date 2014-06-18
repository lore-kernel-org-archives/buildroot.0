From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Jun 2014 14:37:09 +0200
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
Message-ID: <CAHkwnC_HHvgB8b2psJWNjG0-KbppiXT0Ks4riSSNoim0ZGuRtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 14, 2014 at 2:52 AM, Dallas Clement
<dallas.a.clement@gmail.com> wrote:
<snip>
> Fabio, I have some good news!  I had commented out the .NOTPARALLEL in the
> top-level
> makefile earlier, but I was not setting BR2_JLEVEL correctly, as I was doing
> so from
> a wrapper makefile.  Anyhow, parallel building is working for me now after
> fixing my mistake.
> When I started this journey, my build times were about 1 hour and 50
> minutes.  After
> enabling ccache they were reduced to about 1 hour.  With parallel package
> building,
> all 8 of my CPU cores are near 100% the whole time, and build times are now
> only 14 minutes!!!

That's great!

> You are a beautiful man!  Thank you for all you have done to get this
> working.

Thank you very much for your kind words.
I'm glad to hear that you like it.

> p.s.  If you still want me to collect the graphs, and time comparison for
> parallel vs
> not parallel, please let me know.  I also have more testing to do to verify
> that there
> are no unexpected run-time errors due to parallel building.

I've asked for for those graphs just to use correctly the parallel
make so I don't need it anymore.

If you encounter build problems related to the reordering of targets,
there is a way to replicate almost the same ordering (excluding
interleaving targets).
Given a "build-time.log" you can generate the list of targets:

grep :start: < output/build/build-time.log  | perl -F: -ane '$s =
"$F[3]"; $s =~ s/^\s+|\s+$//g; print "$s-$F[2]\n"' > targets.log

Now you can use that list to build following the same order:
xargs make < targets.log

This is useful to be able to reproduce the problems and debug it.

I will send a patch to add that script or to document it, I'm not sure
what is the best thing to do.

Best regards
-- 
Fabio Porcedda
