From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 16:04:23 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-01
In-Reply-To: <CANCHnQros_GrNhEnk74UG6Q8NiwO9ZvmELezDrMjwzwwv4dCzw@mail.gmail.com>
References: <20160302073023.58B81101BA9@stock.ovh.net>
 <CANCHnQros_GrNhEnk74UG6Q8NiwO9ZvmELezDrMjwzwwv4dCzw@mail.gmail.com>
Message-ID: <20160302160423.0143a79b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Mar 2016 15:24:29 +0100, Jeroen Roovers wrote:
> I am curious about nginx in particular since I found a bug in its
> magnificent configuration system today (which I didn't exactly fix but
> worked around).
> 
> Using GCC 4.9.3 I found last year that nginx compiled fine but dropped
> the response header returned by its proxies. I didn't know back then
> that nginx was to blame, but that's beside the matter.
> The gist is that it returned the remainder of the headers to the HTTP client.
> 
> On 2 March 2016 at 08:30, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> 
> >        sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/9dc9e7d85a618e5e6fd9b892ba591fc95edd413a/
> 
> I checked the log and indeed it correctly says:
> 
> checking for system byte ordering ... big endian
> 
> Note that this is a compile test on the host, which is a punishable
> offense in forward-thinking nations.

This clearly cannot be a run test on the host, because the host in
question is a x86-64 machine, which is little endian. So if the test
was actually looking at the host endianness, it should have concluded
"little endian".

However, one possibility is that we pass ac_cv_c_bigendian in the
environment of configure scripts, which might have been taken into
account by nginx configure script.

See package/Makefile.in in Buildroot:

ifeq ($(BR2_ENDIAN),"BIG")
BR2_AC_CV_C_BIGENDIAN = ac_cv_c_bigendian=yes
else
BR2_AC_CV_C_BIGENDIAN = ac_cv_c_bigendian=no
endif

> This is probably something that nginx developers should fix (perhaps
> by using a standardised configuration system?) but why I turn to the
> list is to ask if the autobuild logs return "big endian" for all
> platforms, and to suggest that perhaps this should be flagged somehow.

I'm not sure what you're flagging here. The configure script seems to
properly detect that SPARC is big endian, which looks alright.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
