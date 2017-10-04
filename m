From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Oct 2017 11:20:08 +0200
Subject: [Buildroot] [PATCH v3] nc: new virtual package providing
 "netcat" functionality
In-Reply-To: <1637040809.11941224.1506974995439.JavaMail.zimbra@datacom.ind.br>
References: <20170917214558.11061-1-casantos@datacom.ind.br>
 <1506953582-12965-1-git-send-email-casantos@datacom.ind.br>
 <20171002211840.104aa3df@windsurf.home>
 <1637040809.11941224.1506974995439.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20171004112008.4426cff9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Mon, 2 Oct 2017 17:09:55 -0300 (BRT), Carlos Santos wrote:

> > Virtual packages are mainly useful when several variants of a given
> > library provide the same API, but different implementations, and we
> > have N consumers of this API. In such a case, a virtual package avoids
> > having each consumer explicitly handle every possible provider of the
> > API.  
> 
> There are three packages able to provide the "nc" command (four, if
> we count busybox). I want to allow the user to choose only one of them,
> unambiguously.

I'm sorry, but I really don't think we want to go down this route. As I
explained, there are lots of other packages in Buildroot that conflict
with each other. If you select two web servers, they will compete to
bind to port 80. If you select two SSH servers, they will compete to
bind to port 22. And so on and so on. We are not going to add virtual
packages for all of those cases.

The only situation where virtual packages make sense is when we have
multiple packages using an API provided by multiple packages (OpenGL,
jpeg, etc.).

> > But you can also enable several Web servers that will try to listen on
> > port 80 at boot time, leaving only one functional, and still we're not
> > going to have a "webserver" virtual package.  
> 
> I'm following your own example: check luainterpreter, mysql and udev.

All of those are providing an implementation to other packages:

 - luainterpreter is used by all Lua modules, because they can support
   using different Lua interpreters

 - mysql because it provides a client library that is used by numerous
   packages

 - udev because it is provided either by systemd or by eudev, and is a
   library API used by a large number of packages.

So, I'm sorry but no, we are not going to add a virtual packages for
netcat.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
