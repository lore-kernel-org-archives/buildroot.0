From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:34:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcp: fix autoreconf for
 libtool-enabled build
In-Reply-To: <20191111033106.6987-1-bernd.kuhls@t-online.de>
References: <20191111033106.6987-1-bernd.kuhls@t-online.de>
Message-ID: <20191115233426.17a2fd13@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Mon, 11 Nov 2019 04:31:06 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream provides two configure.ac versions, the default one does not
> use libtool. For libtool-enabled builds the default configure.ac calls
> https://gitlab.isc.org/isc-projects/dhcp/blob/master/configure.ac#L873
> https://gitlab.isc.org/isc-projects/dhcp/blob/master/config+lt
> 
> which copies configure.ac+lt to configure.ac and starts autoreconf.
> 
> On host systems lacking autoreconf this causes a build error:
> 
> configure: WARNING: legacy configure is used but libtool is enabled. Trying to recover...
> /home/buildroot/autobuild/instance-2/output-1/build/dhcp-4.4.1/config+lt: 20:
>  /home/buildroot/autobuild/instance-2/output-1/build/dhcp-4.4.1/config+lt: autoreconf: not found
> autoreconf failed
> 
> Fixes:
> http://autobuild.buildroot.net/results/16f/16f800dd844572336c2fbba3d123604405382a84/
> http://autobuild.buildroot.net/results/eac/eac1e7b25128476eccf40aece612e13a1e0637dc/
> http://autobuild.buildroot.net/results/8fc/8fcfe7b40af3ae42549351c70466b4dd388820e3/
> http://autobuild.buildroot.net/results/7ff/7ff82708b9dea09f1447f0ef94b9bb21fca73196/
> http://autobuild.buildroot.net/results/1c5/1c5f401ce7eef13f5ca4603ca8d7c67da249d7c9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I was quite surprised when reading your patch, because it seems a bit
crazy the way it works. But indeed, that's how the dhcp configure stuff
seems to be designed...

I looked at if we could use --disable-libtool unconditionally, but it
refuses to not use libtool when only shared libraries are built.

So: applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
