From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 01:12:50 +0100
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131029234103.GA2527@localhost>
References: <20131029204108.5d707d09@skate> <20131029234103.GA2527@localhost>
Message-ID: <20131030011250.65f01b8d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Tue, 29 Oct 2013 20:41:04 -0300, Ezequiel Garcia wrote:

> > +------------+---------+----------+-------+------------+------------+
> > | arch       | success | failures | total | pctsuccess | pctfailure |
> > +------------+---------+----------+-------+------------+------------+
> > | bfin       |      10 |      607 |   617 |     1.6207 |    98.3793 |
> > | microblaze |       6 |      308 |   314 |     1.9108 |    98.0892 |
> > | nios2      |       2 |       49 |    51 |     3.9216 |    96.0784 |
> 
> Mind sharing what's breaking in nios2? If it's related to either libffi
> or the internal toolchain, then we'll have to wait until proper support
> is added upstream.

Internal toolchain is never used for nios2:

 config BR2_TOOLCHAIN_BUILDROOT
        bool "Buildroot toolchain"
-       depends on !BR2_microblaze && !BR2_aarch64
+       depends on !BR2_microblaze && !BR2_aarch64 && !BR2_nios2

this was in 830205c0361c751c39fabeb1366100e2a94a27a4, which comes from
you :-)

Indeed most of the issues are caused by the lack of libffi support:

+--------------------------+-----+
| reason                   | cnt |
+--------------------------+-----+
| libffi-3.0.13            |  28 |
| aiccu-20070115           |  10 |
| binutils-2.21            |   9 |
| libnspr-4.9.6            |   1 |
| e2fsprogs-1.42.8         |   1 |
| libnetfilter_queue-1.0.2 |   1 |
+--------------------------+-----+

but there's also a bunch of other problems as you can see. For the time
being, I've modified the autobuilders script to avoid any configuration
that involves libffi on nios2. Since the nios2 support in libffi has
recently been contributed, they will hopefully make a new release in
the near future.

> As a side note, wouldn't it be nice to have per-arch-filtering in the
> autobuild status site? Going through the code quickly, I think it's just
> a matter of adding a parameter to the SQL query, right?

It wasn't implemented until I received your e-mail, but it's now done.
Enjoy:

   http://autobuild.buildroot.org/?arch=nios2
   http://autobuild.buildroot.org/?arch=nios2&status=OK
   http://autobuild.buildroot.org/?arch=nios2&status=NOK

See:

   http://git.buildroot.net/buildroot-test/commit/?id=4840eec19648172b6fc9e83fe2c2f1dea550c1cf
   http://git.buildroot.net/buildroot-test/commit/?id=823c2408414899a6b4fc82bc409eb14e76fefa48

> Maybe this would help arch-maintainers to focus in what's relevant for
> them?

Hopefully :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
