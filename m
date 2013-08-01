From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 1 Aug 2013 15:58:06 +0200
Subject: [Buildroot] host-gettext build failure (emacs dependency?)
Message-ID: <CAAXf6LVsJ6uZbeiRPHcru+Q0J8J2+Xn5ixsTCe4LNZpOm1e67Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We have seen a build failure of host-gettext, with some error in emacs
files. The problem is that the issue does not seem to happen every
time, not sure why.

<snip>
make[5]: Leaving directory
`/repo/buildroot/output/build/
host-gettext-0.18.2.1/gettext-tools/styles'
Making all in misc
make[5]: Entering directory
`/repo/buildroot/output/build/host-gettext-0.18.2.1/gettext-tools/misc'
if test -f archive.dir.tar; then \
      inputfile=archive.dir.tar; \
    else \
      inputfile='.'/archive.dir.tar; \
    fi; \
    xz -c -5 < "$inputfile" > archive.dir.tar.xz-t && mv
archive.dir.tar.xz-t archive.dir.tar.xz
WARNING: Warnings can be ignored. :-)
if test "emacs" != no; then \
      set x; \
      list='start-po.el po-mode.el po-compat.el'; for p in $list; do \
        if test -f "$p"; then d=; else d="./"; fi; \
        set x "$@" "$d$p"; shift; \
      done; \
      shift; \
      abs_srcdir="/repo/buildroot/output/build/host-gettext-0.18.2.1/gettext-tools/misc"
EMACS="emacs" /bin/sh \
        ../../build-aux/elisp-comp "$@" || exit 1; \
    else : ; fi
Loading /usr/share/emacs/site-lisp/site-start.d/igrep-init.el (source)...
Loading /usr/share/emacs/site-lisp/site-start.d/lang-coding-systems-init.el
(source)...
Wrong type argument: stringp, nil
make[5]: *** [elc-stamp] Error 1
make[5]: *** Waiting for unfinished jobs....
make[5]: Leaving directory
`/repo/buildroot/output/build/host-gettext-0.18.2.1/gettext-tools/misc'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/repo/buildroot/output/build/host-gettext-0.18.2.1/gettext-tools'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/repo/buildroot/output/build/host-gettext-0.18.2.1/gettext-tools'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/repo/buildroot/output/build/host-gettext-0.18.2.1'
make[1]: *** [/repo/buildroot/output/build/host-gettext-0.18.2.1/.stamp_built]
Error 2
make[1]: Leaving directory `/repo/buildroot'


If something knows more about this error, that'd be great.

But more generally, I wonder why host-gettext needs/uses emacs at all.
The target gettext already disables several things:
GETTEXT_CONF_OPT += \
        --disable-libasprintf \
        --disable-acl \
        --disable-openmp \
        --disable-rpath \
        --disable-java \
        --disable-native-java \
        --disable-csharp \
        --disable-relocatable \
        --without-emacs

but the host-gettext seems to be full. Do we really need e.g. emacs
support for host-gettext? What about csharp, java, native-java?

Thanks,
Thomas
