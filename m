From: Wade Berrier <wberrier@gmail.com>
Date: Wed, 07 Sep 2011 07:41:03 -0600
Subject: [Buildroot] [PATCH] intltool: use built host libexpat during
	configure
In-Reply-To: <20110906232416.077d2091@skate>
References: <20110906191020.GA29969@berrier.lan>
 <20110906232416.077d2091@skate>
Message-ID: <j47s9g$n6q$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the feedback; comments below.

On 09/06/2011 03:24 PM, Thomas Petazzoni wrote:
> Hello,
> 
> Le Tue, 6 Sep 2011 13:10:23 -0600,
> Wade Berrier <wberrier@gmail.com> a ?crit :
> 
>>  HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
>>  HOST_INTLTOOL_CONF_OPT = \
>> -  PERLLIB=$(HOST_DIR)/usr/lib/perl
>> +  PERLLIB=$(HOST_DIR)/usr/lib/perl \
>> +  LD_LIBRARY_PATH=$(HOST_DIR)/usr/lib
> 
> Could you give some more details about the problem you're having?

Configure gives this:

checking for perl... /usr/bin/perl
checking for perl >= 5.8.1... 5.8.8
checking for XML::Parser... configure: error: XML::Parser perl module
is required for intltool
make: ***
[/home/wberrier/wa/git/buildroot/output/build/host-intltool-0.40.6/.stamp_configured]
Error 1

Running the command that configure is running gives:

[wberrier at localhost]$
PERLLIB=/home/wberrier/wa/git/buildroot/output/host/usr/lib/perl perl -e
"require XML::Parser"
Can't load
'/home/wberrier/wa/git/buildroot/output/host/usr/lib/perl/auto/XML/Parser/Expat/Expat.so'
for module XML::Parser::Expat: libexpat.so.1: cannot open shared object
file: No such file or directory at
/usr/lib/perl5/5.8.8/i386-linux-thread-multi/DynaLoader.pm line 230.
 at
/home/wberrier/wa/git/buildroot/output/host/usr/lib/perl/XML/Parser.pm
line 14
Compilation failed in require at
/home/wberrier/wa/git/buildroot/output/host/usr/lib/perl/XML/Parser.pm
line 14.
BEGIN failed--compilation aborted at
/home/wberrier/wa/git/buildroot/output/host/usr/lib/perl/XML/Parser.pm
line 18.
Compilation failed in require at -e line 1.

This is with an older snapshot of buildroot (2010.02).  I didn't have
this problem when building on ubuntu 11.04, only rhel5.

So, am I correct when guessing the culprit is Expat.so? (missing rpath
to libexpat.so.1)

> 
> There may well be a problem, but I don't really like the
> LD_LIBRARY_PATH solution, because the solution we have chosen to allow
> binaries installed in $(HOST_DIR) to find their libraries is to use the
> rpath mechanism, not to use LD_LIBRARY_PATH. I'd prefer to stick to
> this mechanism.
> 
> So we just need to figure out which host binary has been compiled
> without the correct rpath.
> 
> Thanks!
> 
> Thomas

Thanks again for the feedback,

Wade
