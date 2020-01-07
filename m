From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 7 Jan 2020 13:51:50 +0100
Subject: [Buildroot] [RFC PATCH] autotools: do not overwrite first
 include path
In-Reply-To: <e0d4cf57-a035-1b59-1aa2-5ce0122587ca@gmail.com>
References: <20191212085748.13802-1-michael@walle.cc>
 <e0d4cf57-a035-1b59-1aa2-5ce0122587ca@gmail.com>
Message-ID: <CAEyMn7b4DPO9pnVkJOrrh8H0iFNsTOx_UTG9hWWStNetBfrmuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Am Do., 12. Dez. 2019 um 11:08 Uhr schrieb Heiko Thiery
<heiko.thiery@gmail.com>:
>
> Hi,
>
> On 12/12/19 9:57 AM, Michael Walle wrote:
> > The first include path is special in aclocal. For example it is the path
> > for the --install option. Also, the first include is treated in a
> > special way if it doesn't exists. This might be the case if there is the
> > following construct:
> >
> >    configure.ac: AC_CONFIG_MACRO_DIR([m4])
> >    Makefile.am: ACLOCAL_AMFLAGS="-I m4"
> >
> > If the package doesn't have local macros, the m4/ directory might not
> > exist. aclocal will then just issue a warning instead of aborting the
> > execution with a fatal error. See discussion here:
> >    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=565663
> >
> > Don't use the "-I" option in aclocal. Instead use ACLOCAL_PATH to pass
> > the system-wide include dirs.
> >
> > As a side effect this should fix the use of $(ACLOCAL) alone. Up until
> > now, $(ACLOCAL) didn't include the ACLOCAL_HOST_DIR system include path.
> >
> > autoreconf will pass the "-I" options to every tool it runs. So move the
> > argument to each individual tool except aclocal.
> >
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> I made a test by removing the $(pkg)_POST_PATCH_HOOKS for the following
> packages:
>
> - atest
> - davici
> - libscsi
> - ltrace
> - minicom
> - open-lldp
> - openpgm
> - pdbg
>
> The result is that all this packages still build without this hook.
>
> --
> Heiko

Has anyone the time to take a look on it and give a comment?

BR
Heiko
