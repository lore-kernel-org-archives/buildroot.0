From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 17:53:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/netplug: fix musl build
	errors
In-Reply-To: <1464535169-32284-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 29 May 2016 17:19:29 +0200")
References: <1464535169-32284-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87fusyxlzp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/02c/02c967a211cfb43dcb5119ea57a0cdef96e5880b/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: - simplified __assert_fail patch by adjusting the data types instead
 >       of removing the function
 >     - improved patch comment (Thomas)

 >  package/netplug/0002-musl.patch | 44 +++++++++++++++++++++++++++++++++++++++++
 >  1 file changed, 44 insertions(+)
 >  create mode 100644 package/netplug/0002-musl.patch

 > diff --git a/package/netplug/0002-musl.patch b/package/netplug/0002-musl.patch
 > new file mode 100644
 > index 0000000..fd86a19
 > --- /dev/null
 > +++ b/package/netplug/0002-musl.patch
 > @@ -0,0 +1,44 @@
 > +Fix musl build
 > +
 > +Upstream usage of __assert_fail failed to compile:
 > +
 > +ib.c:204:1: error: conflicting types for ?__assert_fail?
 > + __assert_fail(const char *assertion, const char *file,
 > + ^
 > +In file included from lib.c:21:0:
 > +/home/buildroot/buildroot/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/assert.h:19:6: note: previous declaration of ?__assert_fail? was here
 > + void __assert_fail (const char *, const char *, int, const char *);
 > +      ^
 > +
 > +Change from unsigned int to int according to musl define.
 > +
 > +Add time.h to netplug.h to fix compile error due to missing header:
 > +
 > +netplug.h:77:5: error: unknown type name ?time_t?
 > +     time_t      lastchange;     /* timestamp of last state change */
 > +

I would prefer to see separate patches for the two different issues.


> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > +
 > +diff -uNr netplug-1.2.9.2.org/lib.c netplug-1.2.9.2/lib.c
 > +--- netplug-1.2.9.2.org/lib.c	2008-12-23 00:36:23.000000000 +0100
 > ++++ netplug-1.2.9.2/lib.c	2016-05-29 16:21:13.000000000 +0200
 > +@@ -202,7 +202,7 @@
 > + 
 > + void
 > + __assert_fail(const char *assertion, const char *file,
 > +-              unsigned int line, const char *function)
 > ++              int line, const char *function)

Hmm, the spec seems to say unsigned int:

https://refspecs.linuxfoundation.org/LSB_3.0.0/LSB-PDA/LSB-PDA/baselib---assert-fail-1.html

Doesn't this then cause issues with !musl builds?

-- 
Bye, Peter Korsgaard
