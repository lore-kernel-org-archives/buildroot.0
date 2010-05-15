From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 15 May 2010 16:45:50 +0000 (UTC)
Subject: [Buildroot] endian issue
References: <201005151547.02656.korgull@home.nl>
	<1273933182.28330.87.camel@coalu.atr> <hsmbug$d0p$1@dough.gmane.org>
	<201005151726.58323.korgull@home.nl>
Message-ID: <hsmj3t$2rc$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-05-15, Marcel <korgull@home.nl> wrote:

> If I wish to do that, how do I detect the endianness of a sytem

For user space:

  /usr/include/endian.h

For kernel code:

 /usr/src/linux/include/linux/byteorder.h

> and do I need to reformat my data in my drivers for this?

That's up to you to decide.

Based on your original posting, I was under the impression you needed
to do calculations on your data on the 9g45. If you need to be able to
do calculations on your data on the 9g45, then that data has to be
little-endian.

If you need to do calculations on big-endian input data and generate a
big-endian output stream, and the 9g45 doesn't have the throughput to
do the byte-swapping, then you probably need to choose a different
(probably big-endian) part.  Many parts that are aimed more squarely
at network stuff are big-endian. Perhaps one of the Intel IXP network
processors (but not the PXA parts) or Motorola PPC chips [you can
check with your local distributor to find out the nom du jour for
company/product-line].

If the peripheral produces big-endian data, you don't need to do any
computations with that data, and you want to ship out big-endian data,
then, no you don't have a problem.  Just make sure that you put in
plenty of warning comments so that later when somebody does decide to
add some computations on the 9g45 they have an easier time figuring
out why it doesn't work.

Better yet, since wise maintainers generally ignore comments, you
could use an opaque data type for the data since it's just a blob of
bytes and not a numeric value.  A structure containing a single field
that's an array of 4 bytes should make a good opaque 32-bit type. That
way whoever has to maintain your code won't fall into the trap you'd be
setting if you declare something as a numeric type when it really isn't.

> If so, isn't that a pure waste of cpu cycles for the sake of reusable
> code?

If you didn't want to do calculations on data on the 9g45, what
exactly was the problem you were asking about in your OP?

> If I can do this without any speed sacrifice than I will do it, if
> not....than it's simply not an option for this system.

Sorry, I have no way of knowing what your requirements are nor of
knowing the cost of producing little-endian data in your driver.

Perhaps you can fix the board layout to correctly connect whatever
peripheral is providing big-endian data?  Then you'd only have to do
the byte-swapping once: after you've done the calculations on the 9g45
and before you ship it out via Ethernet or USB.

-- 
Grant
