From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 9 Oct 2015 10:00:51 -0300
Subject: [Buildroot] [PATCH 2/2] rrdtool: bump to version 1.5.4
In-Reply-To: <5617B836.7000102@imgtec.com>
References: <1444330860-31735-1-git-send-email-gustavo@zacarias.com.ar>
 <1444330860-31735-2-git-send-email-gustavo@zacarias.com.ar>
 <5617B836.7000102@imgtec.com>
Message-ID: <5617BA83.7070009@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/10/15 09:51, Vicente Olivert Riera wrote:

> You are doing more things here than just bumping a version and removing
> some patches (which is what your commit log says). I'm not saying this
> is wrong. What I mean is that it would be good writing some explanation
> in the commit log about why are you removing those selects and add libglib2.

Hi Vicente.
Because upstream changed the package that much.
I don't think it merits commenting into the rrdtool development mindset, 
that's upstream business.
Otherwise the comment would be "it now requires libglib2" (which is 
redundant).

>> +config BR2_PACKAGE_RRDTOOL_RRDGRAPH
>> +	bool "rrd_graph"
>> +	default y
>> +	depends on BR2_ARCH_HAS_ATOMICS # cairo
>> +	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
>> +	select BR2_PACKAGE_CAIRO
>> +	select BR2_PACKAGE_CAIRO_PDF
>> +	select BR2_PACKAGE_CAIRO_PNG
>> +	select BR2_PACKAGE_CAIRO_PS
>> +	select BR2_PACKAGE_CAIRO_SVG
>> +	select BR2_PACKAGE_PANGO
>> +	help
>> +	  This enables the graphing capabilities ('rrdgraph').
>> +	  Without this it will only act as a database backend.
>> +
>> +comment "rrd_graph support needs a toolchain w/ C++"
>> +	depends on !BR2_INSTALL_LIBSTDCPP
>> +
>> +endif
>> +
>> +comment "rrdtool needs a toolchain w/ wchar, threads"
>> +	depends on BR2_USE_MMU
>> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>
> And here you are adding more functionality to this package, which I
> think it would be good as well to explain it in the commit log. In fact,
> this is something I think that should be done in a separate patch.
> "rrdtools: add rrdgraph support", for instance.

A bit of background is in order.
Historically rrdtool has been a stats database backend ("rrd files") and 
graphing tools all together.
For newer versions that's not the case, you can keep the db part and 
ditch the graphics.
The only tool that currently uses rrd is collectd, which only uses it 
for collected data storage, not graphics.
So if people just want to store the data in a standard format and graph 
somewhere/somehow else then this option, with it's ton of fat 
dependencies, can be turned off.
It's default on for consistency, to give what the previous series gave 
in terms of tools.

> A comment in the commit log saying that you add some disables (and why,
> if there is a reason other than the default BR policy) would be great.

Default BR policy to avoid leaks.

>>   	--disable-perl \
>>   	--disable-python \
>>   	--disable-ruby \
>> -	--disable-tcl \
>> -	--program-transform-name='' \
>> -	$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthread)
>> -RRDTOOL_MAKE = $(MAKE1)
>> +	--disable-tcl
>
> Again, no explanation in the commit log about why are you doing this.

Bindings are completely untested, like before, so i've added the new 
bindings.
Again, pthread disabling is obvious - it doesn't work, we need libglib2 
as a mandatory dep, so it's impossible.

> Again, no explanation in the commit log about why are you doing this.

--disable-examples added above takes care of this, standard behaviour > 
hooks.

>> +ifeq ($(BR2_PACKAGE_RRDTOOL_RRDGRAPH),y)
>> +RRDTOOL_DEPENDENCIES += cairo pango
>> +else
>> +RRDTOOL_CONF_OPTS += --disable-rrd_graph
>> +endif
>
> According to one of my comments above, this should be in a separate
> patch. But, hey, that's only my opinion :-)

I don't think so, otherwise you'd be stripping previously-available 
functionality from rrdtool.

>> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
>> +RRDTOOL_DEPENDENCIES += libxml2
>> +else
>> +RRDTOOL_CONF_OPTS += --disable-rrd_restore
>> +endif
>
> So you disable lots of things by default, but for libxml2 you add this?
> Why? No explanation about that in the commit log.

rrd_restore is a new tool to restore rrd data from xml files, previously 
not available.
I decided to use an autodep for this since it's a niche tool/option that 
didn't merit adding another bool.

Regards.
