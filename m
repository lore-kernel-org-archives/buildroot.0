From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 12 Dec 2019 11:08:18 +0100
Subject: [Buildroot] [RFC PATCH] autotools: do not overwrite first
 include path
In-Reply-To: <20191212085748.13802-1-michael@walle.cc>
References: <20191212085748.13802-1-michael@walle.cc>
Message-ID: <e0d4cf57-a035-1b59-1aa2-5ce0122587ca@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 12/12/19 9:57 AM, Michael Walle wrote:
> The first include path is special in aclocal. For example it is the path
> for the --install option. Also, the first include is treated in a
> special way if it doesn't exists. This might be the case if there is the
> following construct:
> 
>    configure.ac: AC_CONFIG_MACRO_DIR([m4])
>    Makefile.am: ACLOCAL_AMFLAGS="-I m4"
> 
> If the package doesn't have local macros, the m4/ directory might not
> exist. aclocal will then just issue a warning instead of aborting the
> execution with a fatal error. See discussion here:
>    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=565663
> 
> Don't use the "-I" option in aclocal. Instead use ACLOCAL_PATH to pass
> the system-wide include dirs.
> 
> As a side effect this should fix the use of $(ACLOCAL) alone. Up until
> now, $(ACLOCAL) didn't include the ACLOCAL_HOST_DIR system include path.
> 
> autoreconf will pass the "-I" options to every tool it runs. So move the
> argument to each individual tool except aclocal.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I made a test by removing the $(pkg)_POST_PATCH_HOOKS for the following 
packages:

- atest
- davici
- libscsi
- ltrace
- minicom
- open-lldp
- openpgm
- pdbg

The result is that all this packages still build without this hook.

--
Heiko
