From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 23:47:46 +0100
Subject: [Buildroot] [PATCH] luajit: pass LDCONFIG=true to make sure
	dynamic library links are created
In-Reply-To: <1393453799-32640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 26 Feb 2014 23:29:59 +0100")
References: <1393453799-32640-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txblbiel.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > To install its shared library, the luajit Makefile does:
 >         cd src && test -f $(FILE_SO) && \
 >           $(INSTALL_X) $(FILE_SO) $(INSTALL_DYN) && \
 >           $(LDCONFIG) $(INSTALL_LIB) && \
 >           $(SYMLINK) $(INSTALL_SONAME) $(INSTALL_SHORT1) && \
 >           $(SYMLINK) $(INSTALL_SONAME) $(INSTALL_SHORT2) || :

 > This means that if ldconfig doesn't work or isn't available on the
 > system, it won't create the libluajit-5.1.so -> libluajit-5.1.so.5.2.0
 > symbolic link.

 > Not having this symbolic link prevents lua-ev from finding the shared
 > version of the luajit library, and it fallbacks to using the
 > libluajit.a static library. However, this static library is not built
 > with -fPIC, so using it within a shared library doesn't work, and
 > leads to build failures on architectures that really do want to have
 > non-fPIC code into a shared library, such as x86-64.

 > By passing LDCONFIG=true during the installation steps of luajit, we
 > ensure that the symbolic links are created, which allows lua-ev to
 > detect the shared library properly, making everybody happy.

 > Investigation conducted with Samuel Martin. Thanks!

 > Fixes:

 >   http://autobuild.buildroot.org/results/41c/41c8bb9cf91a86908a150dae27726136cb56f5b7/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
