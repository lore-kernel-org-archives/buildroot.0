From: Nils Koehler <nils.koehler@ibt-interfaces.de>
Date: Tue, 19 Nov 2013 17:59:47 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
	helloworld module be compiled and added to the tartget with a
	local external source
In-Reply-To: <20131119152923.1d5efac0@skate>
Message-ID: <A6242A8294D64D7AB6880414BDC9F71C@NKDELL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Urspr?ngliche Nachricht-----
> Von: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Gesendet: Dienstag, 19. November 2013 15:29
> An: Nils Koehler
> Cc: 'Arnout Vandecappelle'; buildroot at busybox.net
> Betreff: Re: [Buildroot] problem to configure to make helloworld program
> and helloworld module be compiled and added to the tartget with a local
> external source
> 
> Dear Nils Koehler,
> 
> On Tue, 19 Nov 2013 15:01:30 +0100, Nils Koehler wrote:
> 
> > It is compiling and I can see that the compiled code is updated and
> present
> > in the directory /buildroot-2013.08/Build/helloworld-1.0/
> 
> There is no such thing as a /Build/ directory in Buildroot. Maybe
> you're talking about output/build/helloworld-1.0/, right?


...sorry yes... /buildroot-2013.08/output/Build/helloworld-1.0/

> 
> Please be *precise* in the paths you give. Even a single character
> difference... makes a complete difference.
> 
> > So far so fine, but it is missing in the /buildroot-2013.08/target/bin/
> > directory.
> 
> Are you talking about /buildroot-2013.08/output/target/bin/ instead?
...sorry yes... /buildroot-2013.08/output/target/bin/

> 
> > What may be the problem right now?
> > This is my actual .mk file:
> >
> > HELLOWORLD_VERSION = 1.0
> > HELLOWORLD_SITE = /home/koehler/Desktop/Kernel/helloworld-1.0/
> > HELLOWORLD_SITE_METHOD = local
> > HELLOWORLD_LICENSE = GPLv3+
> > HELLOWORLD_INSTALL_TARGET = YES
> 
> This last line is not needed, that's the default;
> 
> >
> > define HELLOWORLD_BUILD_CMDS
> >     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> > endef
> >
> > define HELLOWORLD_INSTALL_TARGET_CMDS
> >     $(INSTALL) -D -m 0755 $(@D)/helloworld $(TARGET_DIR)/bin
> > endef
> 
> It should be:
> 
> 	$(INSTALL) -D -m 0755 $(@D)/helloworld $(TARGET_DIR)/bin/helloworld


After that change helloworld is still not available in
/buildroot-2013.08/output/target/bin/

> If it still doesn't work, please post the file named "build.log" after
> executing:
> 
> make helloworld-rebuild 2>&1 | tee build.log


I have attached the build.log file

I saw that inside:
/home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers
/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_users_table.txt
/home/koehler/Desktop/Kernel/buildroot-2013.08/output/target >>
/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
/home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers:
Zeile 363: [: helloworld: Ganzzahliger Ausdruck erwartet.
/home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers:
Zeile 370: [: helloworld: Ganzzahliger Ausdruck erwartet.
/home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers:
Zeile 394: [: foo: Ganzzahliger Ausdruck erwartet.
/home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers:
Zeile 402: [: foo: Ganzzahliger Ausdruck erwartet.

There seems something to be in some old format...???
Could that be the issue?


> 
> > define HELLOWORLD_PERMISSIONS
> >     /bin/helloworld  f  4755  0  0  -  -  -  -  -
> > endef
> 
> Unless your binary needs to be setuid root, this part is not needed.
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: build.log
Type: application/octet-stream
Size: 29049 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131119/38795e17/attachment-0001.obj>
