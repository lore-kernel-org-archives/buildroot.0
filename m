From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 5 Oct 2011 13:52:18 -0500
Subject: [Buildroot] Bug in pkg-stats?
In-Reply-To: <87sjn7nv4d.fsf@macbook.be.48ers.dk>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AE@AUSP01VMBX24.collaborationhost.net>
 <20111005084340.204661fb@skate>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE877@AUSP01VMBX24.collaborationhost.net>
 <87sjn7nv4d.fsf@macbook.be.48ers.dk>
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFE910@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, October 05, 2011 11:37 AM, Peter Korsgaard wrote:
>>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:
>
> Hi,
>
> H>     version=""
>
> H>     if grep -m1 "_VERSION" $i > /dev/null ; then
> H> 	version=`grep -m1 "_VERSION" $i | awk '{ print $NF }'`
> H>     else
> H> 	version="unknown"
> H>     fi
>
> H> This works fine for the packages that have _VERSION defined like:
>
> H> FOO_VERSION = x.y.z
>
> H> But it ends up with the whole line when the spaces are missing around the
> H> '='.  Oh well...
>
> You could simply do it awk:
>
> version=$(awk -F'=| ' '/_VERSION/ { print $NF } END { print "unknown" } ' \
>           $i | head -n 1)

I thought there was some way of doing it with awk... I really need to figure
out how that utility works... ;-)

> But it naturally still doesn't work for packages with multiple versions
> (like busybox) or where version is major.minor (like glib2).

With your awk line above, the only packages that show up strange are:

util-linux		$(UTIL_LINUX_VERSION_MAJOR)
xenomai		qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
imagemagick		$(IMAGEMAGICK_MAJOR)-6
binutils		qstrip,$(BR2_BINUTILS_VERSION))
microperl		$(MICROPERL_MAJ).8.8
haserl		qstrip,$(BR2_PACKAGE_HASERL_VERSION))

And, of course, the ones with version major.minor only show the major version.

Regardless, do you think this patch is worth submitting?

Thanks,
Hartley
