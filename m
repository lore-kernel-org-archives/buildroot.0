From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 09:28:10 +0100
Subject: [Buildroot] [PATCH v3 2/2] logrotate: use pkg-config for the
 opt library
In-Reply-To: <CAHkwnC_SRcjuP+yk4_O8WixZLKVuxLRs-N4+xe12doA=a27jSA@mail.gmail.com>
References: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
 <1425244013-2509-3-git-send-email-fabio.porcedda@gmail.com>
 <20150304232909.625985fa@free-electrons.com>
 <CAHkwnC_SRcjuP+yk4_O8WixZLKVuxLRs-N4+xe12doA=a27jSA@mail.gmail.com>
Message-ID: <20150305092810.284ba54a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 5 Mar 2015 00:38:25 +0100, Fabio Porcedda wrote:

> > It's not currently supported in Buildroot, but LOADLIBES is extended by
> > the logrotate Makefile with -lacl or -lselinux when WITH_ACL or
> > WITH_SELINUX are used. I'm not sure this will play well with your
> > proposed solution.
> 
> Thanks for noticing it.
> I didn't know that a variable forced from the command line cannot be extended.
> Now I'm aware of it.

Depends on whether you pass variables in the environment (on the left
hand side of make) or as make options (on the right hand side of make).
Demonstration with a simple Makefile:

===
FOO = -lbaz

ifeq ($(WITH_SELINUX),yes)
FOO += -lselinux
endif

all:
	@echo $(FOO)
===

And now, the different cases:

thomas at skate:/tmp$ make
-lbaz
thomas at skate:/tmp$ make FOO=-lpouet
-lpouet
thomas at skate:/tmp$ make FOO=-lpouet WITH_SELINUX=yes
-lpouet
thomas at skate:/tmp$ make WITH_SELINUX=yes
-lbaz -lselinux
thomas at skate:/tmp$ FOO=-lpouet make
-lbaz
thomas at skate:/tmp$ FOO=-lpouet make WITH_SELINUX=yes
-lbaz -lselinux

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
