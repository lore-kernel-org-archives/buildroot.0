From: Charles Manning <cdhmanning@gmail.com>
Date: Fri, 30 Nov 2012 07:31:52 +1300
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <20121129190813.5dc97298@skate>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <201211300652.45293.manningc2@actrix.gen.nz> <20121129190813.5dc97298@skate>
Message-ID: <201211300731.53056.manningc2@actrix.gen.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 30 November 2012 07:08:13 Thomas Petazzoni wrote:
> Dear Charles Manning,
>
> On Fri, 30 Nov 2012 06:52:44 +1300, Charles Manning wrote:
> > >   Maybe there's something fishy in your environment.  Can you run
> > > env | grep /lib
> >
> > Aaaarrrrggghhhh!!!!
> >
> > I have this system set up to automatically set up for openembedded.
> >  That defines PKG_CONFIG_PATH and adds some stuff to PATH which is
> > probably messing things up.
> >
> > I turned off the openembedded auto configuration, nuked output/ and make
> > ran to completion.
> >
> > I have now also learned a lot more about digging around in buildroot.
>
> Wait, wait, could you please reproduce the problem, and reply to
> Arnout's questions (sending us the output of env | grep /lib, or even
> the entire output of env if it doesn't contain any sensitive
> information).
>
> I would like to this which environment variable was causing the
> problem, and if we can add a check in Buildroot for this environment
> variable, in order to avoid similar issues in the future.
>

The problem was cause by running the openembedded toolchain env setup script 
shown below and attached incase it gets too badly messed up by mail.

export PATH=/usr/local/angstrom/arm/bin:$PATH
export LIBTOOL_SYSROOT_PATH=/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi
export 
PKG_CONFIG_SYSROOT_DIR=/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi
export 
PKG_CONFIG_PATH=/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib/pkgconfig
export QTDIR=/usr/local/angstrom/arm
export CONFIG_SITE=/usr/local/angstrom/arm/site-config
alias 
opkg='LD_LIBRARY_PATH=/usr/local/angstrom/arm/lib /usr/local/angstrom/arm/bin/opkg-cl -f /usr/local/angstrom/arm/etc/opkg-sdk.conf -o /usr/local/angstrom/arm'
alias 
opkg-target='LD_LIBRARY_PATH=/usr/local/angstrom/arm/lib /usr/local/angstrom/arm/bin/opkg-cl -f /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/etc/opkg.conf -o /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi'


I had added the following line to bashrc:

. /path/environment-setup

that caused it to always be added.

I see the Makefile has a line
 unexport PKG_CONFIG_PATH
perhaps that should be
 unset PKG_CONFIG_PATH


Is that enough info?

Sorry I have to go to the day job now, so if you want more I will have to work 
on that later.


Thanks for your efforts!

-- CHarles
-------------- next part --------------
export PATH=/usr/local/angstrom/arm/bin:$PATH
export LIBTOOL_SYSROOT_PATH=/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi
export PKG_CONFIG_SYSROOT_DIR=/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi
export PKG_CONFIG_PATH=/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib/pkgconfig
export QTDIR=/usr/local/angstrom/arm
export CONFIG_SITE=/usr/local/angstrom/arm/site-config
alias opkg='LD_LIBRARY_PATH=/usr/local/angstrom/arm/lib /usr/local/angstrom/arm/bin/opkg-cl -f /usr/local/angstrom/arm/etc/opkg-sdk.conf -o /usr/local/angstrom/arm'
alias opkg-target='LD_LIBRARY_PATH=/usr/local/angstrom/arm/lib /usr/local/angstrom/arm/bin/opkg-cl -f /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/etc/opkg.conf -o /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi'
