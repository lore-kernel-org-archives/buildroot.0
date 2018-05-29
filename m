From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 23:48:01 +0200
Subject: [Buildroot] [PATCH 1/1] aircrack-ng: bump to version 1.2
In-Reply-To: <CAPi7W80yN0QhXSk8C7WGcr83hcdbebkWAJMGs6t6zTzcUpdLag@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 29 May 2018 22:33:20 +0200")
References: <20180529171409.8794-1-fontaine.fabrice@gmail.com>
 <87d0xe5k7x.fsf@dell.be.48ers.dk>
 <CAPi7W80yN0QhXSk8C7WGcr83hcdbebkWAJMGs6t6zTzcUpdLag@mail.gmail.com>
Message-ID: <87efhu3zhq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> Looking at the m4 files, it looks as if libnl is supposed to be
 >> optional. If so, then we shouldn't force it here.
 >> 
 > Indeed, but libnl is set in the Requirements section of the Readme.md (and
 > not in the "Optional stuff" section) and it was selected since version
 > 1.2-rc1 so I didn't know what to do.
 > But you're right, I will make it optional.

Ok, great.

 >> 
 >> >      select BR2_PACKAGE_OPENSSL
 >> 
 >> It also looks as if libgcrypt can be used instead of openssl.
 >> 
 >> >      select BR2_PACKAGE_ZLIB
 >> 
 >> And zlib looks to be optional as well.
 >> 
 > For libgcrypt and zlib, I have additional patches but I can put everything
 > in a single patch if you prefer.

It is OK to handle those in followup patches, they were also
unconditional in the earlier version.


 >> > +AIRCRACK_NG_CONF_OPTS = --with-experimental
 >> 
 >> Is this the replacement for unstable=true? According to the m4 files,
 >> this defaults to off.
 >> 
 > Yes, this is the replacement for unstable. What do you mean by it defaults
 > to off? Do you want me to disable experimental features?

What I mean is that it is off by default if you don't pass
--with-experimental:

AC_ARG_WITH(experimental,
    [AS_HELP_STRING([--with-experimental=[[yes|no]]], [use experimental features of Aircrack-ng, [default=no]])])

case $with_experimental in
    yes)
        EXPERIMENTAL=yes
        ;;
    *)
        EXPERIMENTAL=no
        ;;
esac


> As a side note, unstable has been replaced by experimental since 1.2-rc2 (
 > https://github.com/aircrack-ng/aircrack-ng/tree/1.2-rc2) so this is
 > currently "broken".

Gaah :/


 >> Hmm, --with-opt seems to be related to adding -O3 to CFLAGS or not:
 >> 
 >> AC_ARG_WITH(opt,
 >> [AS_HELP_STRING([--without-opt],
 >> [disable -O3 optimizations])])
 >> 
 >> AS_IF([test "x$enable_code_coverage" = "xno"], [
 >> case $with_opt in
 >> yes | "")
 >> AX_CHECK_COMPILE_FLAG([-O3], [
 >> AX_APPEND_FLAG(-O3, [opt_[]_AC_LANG_ABBREV[]flags])
 >> ])
 >> ;;
 >> esac
 >> ])
 >> 
 > Yes, --without-opt will disable O3 but also the stack protector (see
 > Readme.md and second patch).

Hmm, OK - A bit odd that it is linked to -O3 - But ok.

 >> There also seems to be a check for ethtool. This by default looks if
 >> ethtool is available in the path on the host. We should detect if
 >> BR2_PACKAGE_ETHTOOL is enabled and point it to it.
 >> 
 > Yes, ethtool is needed for airmon-ng, I will update my patch to manage it.

Great, thanks!

-- 
Bye, Peter Korsgaard
