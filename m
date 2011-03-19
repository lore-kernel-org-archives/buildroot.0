From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2011 08:22:40 +0100
Subject: [Buildroot] [buildroot] libdrm tries to compile before cairo
In-Reply-To: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
References: <AANLkTinJmH7Jsb25KJY6WN5YZaHHKqRJO0ctNA3NmKog@mail.gmail.com>
Message-ID: <20110319082240.7757e09c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Barry,

On Fri, 18 Mar 2011 18:40:17 +0800
Barry Kauler <bkauler@gmail.com> wrote:

> Hi, I am a first-time user of Buildroot. It has been chugging along
> nicely, but libdrm has failed to compile.
> 
> It reports that 'cairo.h' is missing. Which it is, cairo has not yet
> been compiled in the target.
> 
> So, using my own reasoning, I added "cairo" onto LIBDRM_DEPENDENCIES
> variable in file 'libdrm.mk'. I also deleted
> output/build/libdrm-2.4.19.
> 
> However, running 'make' again, it tries to compile libdrm again, and
> fails.
> 
> How do I make it compile cairo (and its deps) before libdrm?

Adding "cairo" to LIBDRM_DEPENDENCIES is enough to get it compiled
before libdrm. Something else is wrong in your setup, because that's
really enough.

However, Cairo is not required by libdrm. It seems that the problem is
that since you have Cairo installed on your host, libdrm ./configure
script thinks that Cairo is available. Such "information leakage" from
the host environment to the target environment is common and is one of
the major challenge an embedded Linux build system such as Buildroot
faces.

However, as libdrm uses pkg-config to detect the presence or absence of
cairo, it sounds strange to me that it detects the host version. Could
you please pastebin somewhere the output of the
output/build/libdrm-2.4.9/config.log case in the case of a failing
compilation ?

(I couldn't reproduce here in my test environment, since I don't have
Cairo development files installed on the host)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
