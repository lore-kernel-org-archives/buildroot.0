From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 2 Oct 2017 17:09:55 -0300 (BRT)
Subject: [Buildroot] [PATCH v3] nc: new virtual package providing
 "netcat" functionality
In-Reply-To: <20171002211840.104aa3df@windsurf.home>
References: <20170917214558.11061-1-casantos@datacom.ind.br>
 <1506953582-12965-1-git-send-email-casantos@datacom.ind.br>
 <20171002211840.104aa3df@windsurf.home>
Message-ID: <1637040809.11941224.1506974995439.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> Sent: Monday, October 2, 2017 4:18:40 PM
> Subject: Re: [Buildroot] [PATCH v3] nc: new virtual package providing "netcat" functionality

> Hello,
> 
> On Mon,  2 Oct 2017 11:13:02 -0300, Carlos Santos wrote:
>> Add the "nc" virtual package and modify netcat, netcat-openbsd and nmap
>> to become providers.
>> 
>> Make the nmap recipe install "ncat" (with a symbolic link to nc) if the
>> BR2_PACKAGE_NMAP_NCAT option is set. Other programs (ncat, ndiff, etc.)
>> are still chosen via BR2_PACKAGE_NMAP, in the "Networking applications"
>> menu.
>> 
>> So far the "nc" options available to build with uClibc were the ancient
>> GNU netcat and its Busybox double. Both lack features available in more
>> modern netcats like IPv6, proxies, and Unix sockets.
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> What is the benefit of having a virtual package for this ?

My first solution just allowed the user to build and install ncat with
a symlink to "nc".

> Virtual packages are mainly useful when several variants of a given
> library provide the same API, but different implementations, and we
> have N consumers of this API. In such a case, a virtual package avoids
> having each consumer explicitly handle every possible provider of the
> API.

There are three packages able to provide the "nc" command (four, if
we count busybox). I want to allow the user to choose only one of them,
unambiguously.

> However, in the case of netcat, I don't see the point. Yes, you can
> currently enable several packages that provide the netcat
> functionality, and they will step on each other in some combinations.

The problem with this approach is that it does not prevent the user
from selecting netcat and/or openbsd-netcat along with nmap, leading
to the same tricky situation we have now with BusyBox, coreutils and
util-linux, which compete for the ownership os some commands.

Right now the problem is solved (wiped down the carpet) by making
coreutils depend on busybox, for instance, but this works just because
the busybox install step does not override existing files.

> But you can also enable several Web servers that will try to listen on
> port 80 at boot time, leaving only one functional, and still we're not
> going to have a "webserver" virtual package.

I'm following your own example: check luainterpreter, mysql and udev.

> So, I don't see where the problem is, and therefore I don't think a
> solution is necessary :-)

I admit that is not mandatory but I still believe that it would lead
to a more organized selection of packages/features.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
