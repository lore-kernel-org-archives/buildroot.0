From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 03 Jan 2009 09:50:52 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
In-Reply-To: <20090103070426.GA7300@cloud.net.au>
References: <20090102154422.DA6BD769FA@busybox.osuosl.org>
	<20090103070426.GA7300@cloud.net.au>
Message-ID: <1230972652.8886.52.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2009-01-03 klockan 18:04 +1100 skrev Hamish Moffatt:
> On Fri, Jan 02, 2009 at 03:44:22PM +0000, ulf at uclibc.org wrote:
> > Changeset:
> > Modified: trunk/buildroot/scripts/get_linux_config.sh
> > ===================================================================
> > --- trunk/buildroot/scripts/get_linux_config.sh	2009-01-02 12:01:49 UTC (rev 24647)
> > +++ trunk/buildroot/scripts/get_linux_config.sh	2009-01-02 15:44:18 UTC (rev 24648)
> [...]
> > +LINUX_MAJOR_VERSION=${LINUX26_DIR:10:2}
> > +LINUX_MINOR_VERSION=${LINUX26_DIR:13}
> 
> This isn't very robust. Can we do better?
> 

This is the reasoning behind the patch.

LINUX26_DIR is the basename of the directory containing linux
and this is currently always "linux-2.6.$(MAJOR).$(MINOR)"
MAJOR is always in the range of 20..30 at the moment
asn I believe it will be safe until linux-2.6.100.
If you believe otherwise we need to find another solution.

The script CAN be improved by only processing the 
"*linux-2.6.*.config" files in the first loop.

Only if you do not get any .config file in the second
loop, you revert to the old behaviour.

I know, this requires that the linux config is "well behaved"
I.E: called "*linux-2.6.*"
If you do "make linux26-update" to generate it, 
it should become "well-behaved".

The previous version would, if you selected kernel 2.6.25.3
and xxx-linux-2.6.25.1.config and xxx-linux-2.6.28 existed,
use the latter, while the former is more appropriate.

As I see it, the goal is to use the config version
which is as close to the real version, but not 
of a higher version than the kernel.

Several board support packages does not implement
versioning, so you cannot do a lot about them
except hope for the second loop.

Feel free to improve as long as you meet the goal above.

> 
> Hamish
