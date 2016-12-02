From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 02 Dec 2016 14:52:50 +0200
Subject: [Buildroot] [PATCH] package/busybox: support automatic module
 loading with mdev
In-Reply-To: <87egbjxq27.fsf@dell.be.48ers.dk>
References: <1457478205-18515-1-git-send-email-peter@korsgaard.com>
 <87egbjxq27.fsf@dell.be.48ers.dk>
Message-ID: <1480683170.21899.70.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2016-03-09 at 23:08 +0100, Peter Korsgaard wrote:
> > > > > > "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> ?> A recently discussed on the mailing list:
> ?> http://lists.busybox.net/pipermail/buildroot/2016-February/154189.h
> tml
> 
> ?> Our mdev configuration currently doesn't handle module loading. Fix
> that by:
> 
> ?> - Telling mdev to run modprobe on hotplug events providing MODALIAS
> 
> ?> - Adjust the init script to handle coldplug modalias events (E.G.
> modules
> ?>???for which the devices were already present before mdev was added
> as the
> ?>???hotplug handler). mdev -s should arguable handle this, but it
> doesn't.
> 
> ?> Cc: Arnout Vandecappelle <arnout@mind.be>
> ?> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> Committed, thanks.
> 

Sorry for bring this topic back, but this script still doesn't work
properly.

Among modaliases I have the following:
?of:Neep0TCatmel,at25

And with the script:
# find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0
modprobe -abq
#?

Manually:
# modprobe -abq of:Neep0TCatmel,at25
[??988.523305] at25 spi-PRP0001:00: 1 KByte at25 eeprom, pagesize 32

I'm afraid my (or similar) solution would do job better, i.e. serialize
probing one-by-one.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
