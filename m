From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 20:06:04 +0200
Subject: [Buildroot] Add missing config to RPM target package
In-Reply-To: <55D70AF3.3050604@gmx.de>
References: <55D70AF3.3050604@gmx.de>
Message-ID: <20150823200604.0c1e00cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas,

On Fri, 21 Aug 2015 13:26:43 +0200, universe II wrote:

> building the RPM package for my remote target I found a misconfiguration 
> of the .mk file.
> If the regular expression package pcre is enabled in buildroot, rpm will 
> use it. If not, nothing will be used and regular expression are not 
> available, making rpm unusable. But rpm has the ability to use an 
> internal pcre implementation if the external lib is not available. This 
> needs to be correctly activated before building and then rpm works fine 
> on the target. See the attached patch for more details.

We generally don't want to use the internal copy of libraries, and
prefer to use the system-provided library when possible, which is what
is done here.

So there are really two cases:

 1 Either the regexp support in RPM is absolutely mandatory for RPM to
   be useful. If this is the case, then just make the pcre dependency a
   mandatory one, and always pass --with-pcre=external.

 2 Or the regexp support in RPM is really optional, and useful only in
   certain situations. If this is the case, then what is done today is
   correct, and you should simply enable the pcre library.

Consequently, I've marked your patch as Rejected in our patch tracking
system. Do not hesitate to follow up with a different patch if we are
in case (1) above.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
