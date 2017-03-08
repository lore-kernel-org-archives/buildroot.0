From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Mar 2017 23:32:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-03-07
In-Reply-To: <e0aecdb6-c5b8-db8e-8113-9a76c7a466ba@cdf123.net>
References: <20170308072845.15B9C207FC@mail.free-electrons.com>
 <e0aecdb6-c5b8-db8e-8113-9a76c7a466ba@cdf123.net>
Message-ID: <20170308233230.7c2a12f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Vicente in Cc, since he is our mips(64) expert.

On Wed, 8 Mar 2017 16:04:57 -0600, Chris Frederick wrote:

> I haven't tested firejail on other archs other than x86/x86_64.  We might want to add a build restriction on it.  Any preference as to how to do
> that?
> 
> depends on BR2_x86_64 || BR2_i386
>  - or -
> depends on BR2_ARCH = "x86_64" || BR2_ARCH = "i386"

Is there something in firejail that is architecture specific? If not,
then having architecture dependencies "just because" doesn't seem like
a good idea.

> On 03/08/2017 01:28 AM, Thomas Petazzoni wrote:
> > Hello,
> > 
> > This is the list of Buildroot build failures that occured on
> > 2017-03-07, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> > 
> > Build failures related to your packages:
> > 
> >     mips64el |              firejail-0.9.44.8 | http://autobuild.buildroot.net/results/84d9b5dc955895e1a1c1074e3917c44c8fc00365

I see two things here:

common.c:48: error: '__NR_setns' undeclared (first use in this function)

This *could* be related to too old kernel headers, I guess setns() is a
fairly modern system call.

libnetlink.c:110: error: 'RTEXT_FILTER_VF' undeclared (first use in this function)

This one I looked in more details, it was introduced in Linux 3.3, and
the toolchain is using kernel headers from Linux 3.9. So there is a
different problem.

Vicente, do you think you could have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
