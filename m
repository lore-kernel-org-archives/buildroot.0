From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 17:20:28 +0100
Subject: [Buildroot] [PATCH v3 1/1] jsen: new package
In-Reply-To: <1456408864.29027.48.camel@embedded.rocks>
References: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <56CCC4C4.5020402@mind.be>
 <20160223220413.2050528c@free-electrons.com>
 <1456396337.29027.16.camel@embedded.rocks>
 <20160225135137.09136142@free-electrons.com>
 <1456408864.29027.48.camel@embedded.rocks>
Message-ID: <20160225172028.5482c36e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

Thanks for your feedback!

On Thu, 25 Feb 2016 15:01:04 +0100, J?rg Krause wrote:

> Because npm supports version ranges. Have a look at the example from
> the npm's docs [1]:
> 
> { "dependencies" :
> ? { "foo" : "1.0.0 - 2.9999.9999"
> ? , "bar" : ">=1.0.2 <2.1.2"
> ? , "baz" : ">1.0.2 <=2.3.4"
> ? , "boo" : "2.0.1"
> ? , "qux" : "<1.0.0 || >=2.3.1 <2.4.5 || >=2.5.2 <3.0.0"
> ? , "asd" : "http://asdf.com/asdf.tar.gz"
> ? , "til" : "~1.2"
> ? , "elf" : "~1.2.3"
> ? , "two" : "2.x"
> ? , "thr" : "3.3.x"
> ? , "lat" : "latest"
> ? , "dyl" : "file:../dyl"
> ? }
> }
> 
> Lets take for example the dependency "boo". A package "A" may depend on
> version "2.0.1" whereas another package "B" may depend on version
> "2.3.x".

Gaah, this is horrible.

> In this case npm installs boo at 2.0.1 in the subdirectory "node_modules"
> of package "A" and boo at 2.3.4 (assume 2.3.4 is the most recent version
> for 2.3.x) in the subdirectory "node_modules" of package "B":
> 
> {prefix}/lib/node_modules?????A
> ???? ????node_modules
> ?? ? ? ? ??? boo at 2.0.1
> ???? B
> ? ? ???? node_modules
> ? ? ? ? ???? boo at 2.3.4
> 
> As Buildroot does not support different versions for most of the
> packages I think we should only use npm to install Node.js packages.

Well, we can support this by having separate packages, but if they
really break "boo" at every release and we need to package ten
different versions of it, then it's a mess indeed.

> 
> > ?- What solution you propose to properly integrate this with the
> > ???download and legal infrastructure of Buildroot. Right now, having
> > ???"npm install" directly download and install stuff means that the
> > ???download and legal-info infrastructure of Buildroot is completely
> > ???worked-around. Due to this, "make source" will not download all
> > the
> > ???source, "make legal-info" will not list all the licenses, caching
> > in
> > ???BR2_DL_DIR doesn't work, BR2_PRIMARY_SITE doesn't work, etc.
> 
> I am not sure for now howto integrate this into the Buildroot
> infrastructure properly. I have never thought about this, but it will
> need some work to be done, I guess.

If you don't have Buildroot packages, it will be nearly impossible I
believe.

> I have never had a look at?scancpan and I am not familiar with Perl
> packages, but looking at some META.json files, I guess it could be done
> similiar.

We have a similar script being worked on for Python, if you're familiar
with Python. See for example http://patchwork.ozlabs.org/patch/501204/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
