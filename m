From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 15:32:41 +0200
Subject: [Buildroot] [PATCH v4] nmap: add option to build/install ncat
In-Reply-To: <20171012151418.3523-1-casantos@datacom.ind.br>
References: <20171012151418.3523-1-casantos@datacom.ind.br>
Message-ID: <20180402153241.1b48a199@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Oct 2017 12:14:17 -0300, Carlos Santos wrote:
> Ncat is a much-improved reimplementation of the venerable Netcat and is
> compatible with uClibc and musl. It provides features not available in
> the ancient GNU netcat and its Busybox double like IPv6, proxies, and
> Unix sockets.
> 
> Tha nmap package now installs ncat if the BR2_PACKAGE_NMAP_NCAT option
> is selected. The other programs (nmap, ndiff, etc.) are chosen via the
> BR2_PACKAGE_NMAP_NMAP option.
> 
> We symlink 'nc' to ncat if neiter netcat nor netcat-openbsd is selected,
> even though ncat does not have the same interface as netcat-openbsd.
> However, since Fedora/RHEL install nmap-ncat as 'nc', it can be assumed
> that packages that depend on 'nc' know how to deal with this diversity.
> For example, the virt-manager package does that. Also user-supplied
> scripts can be assumed to do the right thing, since the user also
> selects whether nmap-ncat, netcat or netcat-openbsd is installed.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

We looked at this in further details with Arnout, and we still didn't
like the special casing for the ncat-only case. In addition, it is
weird to have suboptions for nmap and ncat, while the package also
installs nping and ndiff.

So instead, I've added sub-options for nmap, ncat, ndiff and nping, and
then I've played with make targets to only build/install what's needed.
The nmap Makefile.in conveniently offers the following make targets:

 nmap, build-ncat, build-nping, build-ndiff

to build the respective programs, and:

 install-nmap, install-ncat, install-nping, install-ndiff

to install the respective programs.

I've used this solution, which makes the package a lot cleaner and
easier to read I believe. See the final commit at
https://git.buildroot.org/buildroot/commit/?id=55ec9b4e40b08a11cb9c1662c427c8d58351924a.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
