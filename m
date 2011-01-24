From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 22:04:35 +0100
Subject: [Buildroot] [PATCH 06/10] autotools: allow host package to use
	<pkg>_MAKE_ENV and <pkg>_MAKE
In-Reply-To: <178a42636fdb3c6119ca718a24b14a22c9c9df28.1295866866.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 24 Jan 2011 12:01:34 +0100")
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<178a42636fdb3c6119ca718a24b14a22c9c9df28.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ei82qaho.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This will be needed by the Python interpreter package.
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Makefile.autotools.in |    2 +-
 Thomas>  1 files changed, 1 insertions(+), 1 deletions(-)

 Thomas> diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
 Thomas> index de0a355..d445348 100644
 Thomas> --- a/package/Makefile.autotools.in
 Thomas> +++ b/package/Makefile.autotools.in
 Thomas> @@ -200,7 +200,7 @@ endif
 Thomas>  #
 Thomas>  ifndef $(2)_INSTALL_CMDS
 Thomas>  define $(2)_INSTALL_CMDS
 Thomas> -	$(HOST_MAKE_ENV) $(MAKE) -C $$($$(PKG)_SRCDIR) install
 Thomas> +	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install

Hmm, I don't really like this. Packages might be adding target specific
stuff to their $PKG_MAKE_ENV - E.G.:

lvm2/lvm2.mk:LVM2_MAKE_ENV = CC="$(TARGET_CC)"

Wouldn't it make more sense to add a HOST_$PKG_MAKE_ENV and use it just
like we do for $PKG_MAKE_ENV (E.G. at build and install time)?

-- 
Bye, Peter Korsgaard
