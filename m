From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 7 Nov 2016 18:40:20 -0500
Subject: [Buildroot] [PATCH 0/6] package/pseudo: fix build and better
	mimic fakeroot
In-Reply-To: <1270837880.6241362.1478557615050.JavaMail.zimbra@savoirfairelinux.com>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
 <1270837880.6241362.1478557615050.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <20161107234020.GA11439@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Mon, Nov 07, 2016 at 05:26:55PM -0500, Patrick Keroulas wrote:
> Hello all,
> 
> ----- Original Message -----
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > To: buildroot at buildroot.org
> > Cc: "Erico Nunes" <nunes.erico@gmail.com>, "Ga?l PORTAY" <gael.portay@savoirfairelinux.com>, "Julien BOIBESSOT"
> > <julien.boibessot@free.fr>, "Patrick Keroulas" <patrick.keroulas@savoirfairelinux.com>, "Yann E. MORIN"
> > <yann.morin.1998@free.fr>
> > Sent: Monday, November 7, 2016 4:23:37 PM
> > Subject: [PATCH 0/6] package/pseudo: fix build and better mimic fakeroot
> 
> > Hello All!
> 
> > When we switched from using fakeroot to using pseudo, a lot of
> > assumptions were made, in that we assumed pseudo was by default
> > behaving as fakeroot did.
> 
> > That is wrong. pseudo is a little bit more versatile than fakeroot
> > is, so using it is a little bit more involved.
> 
> > First, its buildsystem is a bit convoluted, and can incorrectly guess
> > the host charateristics, like bitness.
> 
> > Second, it needs to be told at runtime where to look at, and put its
> > own stuff. It correctly gueses, but prints a warning that it had to
> > gues, and the location to store its DB is not optimum (even if not
> > incorrect).
> 
> > So, this series ensures that pseudo is correctly built and that we
> > correctly specify the runtime configuration.
> 
> I build my firmware inside a Docker container, in which a minimal 
> Ubuntu x86-64 distro runs with no libc6-dev-i386 installed.
> However, '-m32' was polluting the compiler options and the x86-64
> headers couldn't be found. This patchset fixes the build.
> 
> Tested-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> 
> Thanks,
> 
> Patrick
> 

Okay works fine on a Ubuntu 16.04 i686 via Vagrant!

$ vagrand ssh
ubuntu at ubuntu-xenial:~$ uname -a
Linux ubuntu-xenial 4.4.0-45-generic #66-Ubuntu SMP Wed Oct 19 14:12:05 UTC 2016 i686 i686 i686 GNU/
ubuntu at ubuntu-xenial:~$ cd Workspaces/buildroot/ && make host-pseudo
(... full log at http://pastebin.ca/3737232)
cc  -pipe -std=gnu99 -Wall -W -Wextra -fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE  -DPSEUDO_PREFIX='"/home/ubuntu/Workspaces/buildroot/output/host/usr"' -DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"' -DPSEUDO_LIBDIR='"lib"' -DPSEUDO_LOCALSTATEDIR='"var/pseudo"' -DPSEUDO_VERSION='"1.8.1"' -DUSE_MEMORY_DB  -DPSEUDO_PASSWD_FALLBACK='""'   -DPSEUDO_XATTR_SUPPORT       -O2 -g -L/home/ubuntu/Workspaces/buildroot/output/host/usr/lib -I/home/ubuntu/Workspaces/buildroot/output/host/usr/include -Wl,-R/home/ubuntu/Workspaces/buildroot/output/host/usr/lib -shared -o lib/libpseudo.so \
	pseudo_client.o pseudo_ipc.o \
	pseudo_wrappers.o pseudo_tables.o pseudo_util.o  -ldl -lpthread
(...)

You have my
Tested-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Thanks,
Ga?l
