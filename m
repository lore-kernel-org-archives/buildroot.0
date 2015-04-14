From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 09:52:02 +0200
Subject: [Buildroot] [PATCHv2 08/21] Makefile: use the package infra
 based external-deps
In-Reply-To: <552C5ADB.6020509@mind.be>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <552C5ADB.6020509@mind.be>
Message-ID: <20150414095202.7850ba00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 14 Apr 2015 02:10:03 +0200, Arnout Vandecappelle wrote:

> > +_external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
> >  external-deps:
> > -	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
> > +	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
> 
>  If we also remove the sort -u (which removes duplicates, but there should be no
> duplicates to begin with), then there's no need for a recursive make and we
> avoid the GEN     /home/ymorin/dev/buildroot/O/./Makefile that Yann ran into
> (which BTW was not caused by this patch but already existed before).

Unless I missed something there will definitely be duplicates, if two
packages depend on the same dependency, this dependency will be listed
twice. I just did a "make randpackageconfig", followed by "make
_external-deps | sort", and here is what I get:

am335x-pru-package-506e074859891a2b350eb4f5fcb451c4961410ea.tar.gz
am335x-pru-package-506e074859891a2b350eb4f5fcb451c4961410ea.tar.gz
...
dbus-1.8.16.tar.gz
dbus-1.8.16.tar.gz
dbus-glib-0.104.tar.gz
dbus-glib-0.104.tar.gz
...
e2fsprogs-1.42.12.tar.xz
e2fsprogs-1.42.12.tar.xz
...
expat-2.1.0.tar.gz
expat-2.1.0.tar.gz
...
file-5.22.tar.gz
file-5.22.tar.gz
...

Want more of it? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
